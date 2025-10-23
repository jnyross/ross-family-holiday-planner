# Gemini 2.5 Pro: Fix Holiday Destination Scoring Algorithm

## Executive Summary

You are tasked with fixing critical bugs and implementing improvements to a PostgreSQL-based destination scoring algorithm for a family holiday planning application. This prompt contains everything you need to implement all fixes in one execution.

**Timeline**: Complete all fixes in a single session
**Complexity**: Moderate (SQL function rewrites, mathematical formulas)
**Deliverable**: Complete SQL migration file ready to deploy

---

## Context: Multi-Model AI Consensus

Two top AI models (GPT-5 Pro and Gemini 2.5 Pro) analyzed the current scoring algorithm and reached consensus on critical bugs and improvements:

### Points of Agreement (High Confidence)
✅ Flight score formula has mathematical bug (2 hours ≠ 100 points)
✅ Multi-month weather averaging only uses start/end months, not full period
✅ Should use `temperature_high`/`temperature_low` instead of average
✅ Non-linear flight penalties needed (>6 hours heavily penalized)
✅ Current weights suboptimal (Weather too low, Luxury too high)
✅ Jet-lag factor missing (field exists but unused)
✅ Cost consideration missing (field exists but unused)
✅ Rainfall penalty too weak

### Current Weights (WRONG)
- Weather: 30%
- Flight: 25%
- Beach: 15%
- Kids: 15%
- Luxury: 15%

### New Weights (CONSENSUS)
- Weather: 35% ⬆️
- Flight: 25% (same)
- Beach: 15% (same)
- Kids: 15% (same)
- Luxury: 10% ⬇️

---

## Current Implementation Analysis

### File Location
`/supabase/migrations/20251023000500_schema_only.sql`

### Database Schema (Relevant Fields)

**destinations table**:
```sql
CREATE TABLE destinations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  country TEXT NOT NULL,
  region TEXT NOT NULL,

  -- Scoring inputs
  flight_hours DECIMAL(4,1),           -- 2.5, 8.0, 12.0, etc.
  time_difference INTEGER,              -- -5, 0, +8 (hours from UK) ⚠️ UNUSED!
  beach_pool_quality INTEGER,           -- 1-5 rating
  kid_facilities_quality INTEGER,       -- 1-5 rating
  high_star_share DECIMAL(4,2),        -- 0.00-100.00 (% of 4/5★ hotels)
  budget_level TEXT,                    -- 'Budget', 'Mid-Range', 'Luxury' ⚠️ UNUSED!

  -- Other fields...
);
```

**climate_data table**:
```sql
CREATE TABLE climate_data (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  destination_id uuid REFERENCES destinations(id),
  month INTEGER NOT NULL CHECK (month >= 1 AND month <= 12),

  temperature_celsius DECIMAL(4,1),     -- Average temp ⚠️ NOT IDEAL
  temperature_high DECIMAL(4,1),        -- Daytime high ✅ BETTER
  temperature_low DECIMAL(4,1),         -- Nighttime low ✅ BETTER
  rainfall_mm DECIMAL(6,2)
);
```

**holiday_periods table**:
```sql
CREATE TABLE holiday_periods (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);
```

**scores table**:
```sql
CREATE TABLE scores (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  destination_id uuid REFERENCES destinations(id),
  holiday_period_id uuid REFERENCES holiday_periods(id),

  weather_score INTEGER,
  flight_score INTEGER,
  beach_score INTEGER,
  kid_facilities_score INTEGER,
  luxury_score INTEGER,
  final_score INTEGER,  -- ⚠️ Missing: jet_lag_score, cost_modifier

  UNIQUE(destination_id, holiday_period_id)
);
```

---

## Critical Bugs to Fix

### Bug 1: Flight Score Formula (Lines 23-43)

**Current Code (WRONG)**:
```sql
CREATE OR REPLACE FUNCTION calculate_flight_score(flight_hours numeric)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  normalized_score DECIMAL;
BEGIN
  IF flight_hours IS NULL OR flight_hours < 0 THEN
    RETURN 0;
  END IF;

  -- 0-2 hours = 100, 12+ hours = 0, linear scale between
  normalized_score := 100 - ((flight_hours / 12.0) * 100);
  -- ❌ BUG: 2 hours = 100 - (2/12 * 100) = 83.33, NOT 100!

  IF normalized_score < 0 THEN
    RETURN 0;
  END IF;

  RETURN ROUND(normalized_score)::INTEGER;
END;
$$;
```

**Problem**: Linear formula doesn't match the comment. The function claims "0-2 hours = 100" but actually gives:
- 0 hours → 100 points ✅
- 2 hours → 83 points ❌ (should be 100)
- 6 hours → 50 points ❌ (should be ~70-80)
- 12 hours → 0 points ✅

**Fix Required**: Non-linear piecewise function:
- 0-2 hours: 100 points (flat)
- 2-6 hours: Gentle decline (100 → 80)
- 6-12 hours: Steep decline (80 → 10)
- 12+ hours: 10 points (minimum for any flight)

---

### Bug 2: Multi-Month Weather Averaging (Lines 100-114)

**Current Code (WRONG)**:
```sql
-- Inside calculate_weather_score function
start_month := EXTRACT(MONTH FROM holiday_start);
end_month := EXTRACT(MONTH FROM holiday_end);

IF start_month = end_month THEN
  SELECT
    COALESCE(AVG(temperature_celsius), 0),
    COALESCE(AVG(rainfall_mm), 0)
  INTO avg_temp, avg_rain
  FROM climate_data
  WHERE destination_id = dest_id AND month = start_month;
ELSE
  -- ❌ BUG: Only averages start/end months, not ALL months!
  SELECT
    COALESCE(AVG(temperature_celsius), 0),
    COALESCE(AVG(rainfall_mm), 0)
  INTO avg_temp, avg_rain
  FROM climate_data
  WHERE destination_id = dest_id AND month IN (start_month, end_month);
  -- If holiday is July 15 - August 20, this only uses July + August
  -- But if holiday is December 20 - January 10, this SKIPS December 21-31!
END IF;
```

**Problem**: For holidays spanning multiple months, only the start and end months are averaged. Example:
- Holiday: Dec 20 - Jan 10 (crosses year boundary)
- Current logic: Averages December + January
- Reality: Most days are in December (11 days) vs January (10 days)
- Correct approach: Weight by actual days in each month

**Fix Required**: Generate array of all months in the holiday period and weight by days in each month.

---

### Bug 3: Using Temperature Average Instead of High/Low (Lines 115-130)

**Current Code (WRONG)**:
```sql
-- Uses temperature_celsius (average)
SELECT
  COALESCE(AVG(temperature_celsius), 0),
  COALESCE(AVG(rainfall_mm), 0)
INTO avg_temp, avg_rain
FROM climate_data
WHERE destination_id = dest_id AND month = start_month;

-- Temperature score (20-28°C is ideal)
IF avg_temp >= 20 AND avg_temp <= 28 THEN
  temp_score := 100;
ELSIF avg_temp < 20 THEN
  temp_score := GREATEST(0, (avg_temp / 20.0) * 100);
ELSE
  temp_score := GREATEST(0, 100 - ((avg_temp - 28) / 20.0) * 100);
END IF;
```

**Problem**: Families care about daytime heat (for beach/pool) and nighttime comfort (for sleep). Using average temperature misses both.

**Example**:
- Destination A: High 32°C, Low 18°C → Average 25°C ✅ (perfect score)
- Destination B: High 26°C, Low 24°C → Average 25°C ✅ (perfect score)
- Reality: Destination A is too hot during day, too cold at night (should score lower)

**Fix Required**:
- Use `temperature_high` for daytime comfort (ideal 24-29°C)
- Use `temperature_low` for nighttime comfort (ideal 18-24°C)
- Combine: 70% daytime, 30% nighttime

---

### Bug 4: Missing Jet-Lag Penalty (Field Exists!)

**Current Code**: The `time_difference` field exists in the database but is completely unused in scoring.

**Problem**: Families with young children are heavily impacted by jet lag. A destination with -8 hours time difference (e.g., Los Angeles) should score lower than one with +1 hour (e.g., Spain) for short trips.

**Fix Required**: Add jet-lag penalty function:
- 0-2 hours difference: No penalty (100 points)
- 3-5 hours: Moderate penalty (70-90 points)
- 6-8 hours: Heavy penalty (40-60 points)
- 9+ hours: Severe penalty (20 points)

**Weight**: 5% of final score (reduce Luxury from 15% to 10%)

---

### Bug 5: Missing Cost Consideration (Field Exists!)

**Current Code**: The `budget_level` field exists but is unused in scoring.

**Problem**: Budget-conscious families should see budget destinations ranked higher. Current system treats a £500/night luxury resort the same as a £80/night family hotel.

**Fix Required**: Apply cost modifier AFTER calculating final score:
- Budget destinations: Multiply final score by 1.10 (10% boost)
- Mid-Range destinations: Multiply final score by 1.00 (no change)
- Luxury destinations: Multiply final score by 0.90 (10% penalty)

Rationale: This preserves destination quality scores while acknowledging value-for-money preferences.

---

### Bug 6: Weak Rainfall Penalty (Lines 131-139)

**Current Code (WRONG)**:
```sql
-- Rainfall score (less = better, 0-200mm ideal)
IF avg_rain <= 50 THEN
  rain_score := 100;
ELSIF avg_rain <= 200 THEN
  rain_score := 100 - ((avg_rain - 50) / 150.0) * 50;  -- Only drops to 50 at 200mm
ELSE
  rain_score := GREATEST(0, 50 - ((avg_rain - 200) / 200.0) * 50);
END IF;

-- Combine (70% temperature, 30% rainfall)  -- ❌ Too low!
combined_score := (temp_score * 0.7) + (rain_score * 0.3);
```

**Problem**:
- 200mm rainfall in a month is ~7mm/day (significant rain)
- Current penalty: Only 50 points deducted at 200mm
- Weight is only 30% of weather score (9% of total)
- Reality: Families avoid rainy destinations aggressively

**Fix Required**:
- Increase rainfall weight to 40% (from 30%)
- Steeper penalty curve:
  - 0-50mm: 100 points
  - 50-100mm: 80 points (steeper drop)
  - 100-150mm: 50 points
  - 150mm+: 20 points (nearly eliminated)

---

### Bug 7: Luxury Score Doesn't Use Diminishing Returns (Lines 61-69)

**Current Code**:
```sql
CREATE OR REPLACE FUNCTION calculate_luxury_score(high_star_share numeric)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
BEGIN
  IF high_star_share IS NULL OR high_star_share < 0 THEN
    RETURN 0;
  END IF;

  RETURN LEAST(100, ROUND(high_star_share)::INTEGER);
  -- Linear: 50% share = 50 points, 100% share = 100 points
END;
$$;
```

**Problem**: The difference between 60% and 80% luxury hotels is much smaller than 10% and 30% for families. Having *some* luxury options is valuable, but maximizing luxury % has diminishing returns.

**Fix Required**: Apply square root scaling:
- `ROUND(SQRT(high_star_share / 100.0) * 100)`
- Examples:
  - 0% → 0 points (same)
  - 25% → 50 points (boosted)
  - 50% → 71 points (boosted)
  - 75% → 87 points (compressed)
  - 100% → 100 points (same)

---

## Your Task: Complete SQL Migration

### Step 1: Analyze Current Implementation

Read the current scoring functions from `/supabase/migrations/20251023000500_schema_only.sql` and confirm you understand all 7 bugs listed above.

### Step 2: Write Corrected Functions

Create replacement functions for:

1. **`calculate_flight_score(flight_hours numeric)`**
   - Non-linear piecewise function
   - 0-2h: 100, 2-6h: gentle decline, 6-12h: steep decline, 12h+: minimum 10

2. **`calculate_jet_lag_score(time_difference integer)`** ⭐ NEW
   - Absolute value of time difference
   - 0-2h: 100, 3-5h: 70-90, 6-8h: 40-60, 9h+: 20

3. **`calculate_weather_score(dest_id uuid, holiday_id uuid)`**
   - Fix multi-month averaging (weight by actual days)
   - Use `temperature_high` and `temperature_low` instead of average
   - Daytime ideal: 24-29°C (70% weight)
   - Nighttime ideal: 18-24°C (30% weight)
   - Steeper rainfall penalties (40% weight, not 30%)
   - Non-linear rainfall curve (50mm→100pts, 100mm→80pts, 150mm→50pts, 200mm+→20pts)

4. **`calculate_luxury_score(high_star_share numeric)`**
   - Apply square root scaling for diminishing returns

5. **`calculate_final_score(dest_id uuid, holiday_id uuid)`**
   - New weights: Weather 35%, Flight 25%, Beach 15%, Kids 15%, Luxury 10%
   - Add jet-lag score (5% weight) ⭐ NEW
   - Apply cost modifier after calculation ⭐ NEW
   - Budget: 1.10x, Mid-Range: 1.00x, Luxury: 0.90x

### Step 3: Update Database Schema

Modify the `scores` table to include new fields:

```sql
ALTER TABLE scores
ADD COLUMN jet_lag_score INTEGER,
ADD COLUMN cost_modifier DECIMAL(4,2);
```

### Step 4: Create Migration File

Structure your output as a complete PostgreSQL migration file:

```sql
-- Migration: Fix scoring algorithm bugs and add improvements
-- Date: 2025-01-23
-- Phase: 1 (Critical fixes)

BEGIN;

-- Drop old functions
DROP FUNCTION IF EXISTS calculate_flight_score(numeric);
DROP FUNCTION IF EXISTS calculate_weather_score(uuid, uuid);
DROP FUNCTION IF EXISTS calculate_luxury_score(numeric);
DROP FUNCTION IF EXISTS calculate_final_score(uuid, uuid);

-- Create new jet-lag function
CREATE OR REPLACE FUNCTION calculate_jet_lag_score(time_difference integer)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
-- YOUR CODE HERE
$$;

-- Recreate flight score with fixes
CREATE OR REPLACE FUNCTION calculate_flight_score(flight_hours numeric)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
-- YOUR CODE HERE
$$;

-- Recreate weather score with fixes
CREATE OR REPLACE FUNCTION calculate_weather_score(dest_id uuid, holiday_id uuid)
RETURNS integer
LANGUAGE plpgsql STABLE
AS $$
-- YOUR CODE HERE
$$;

-- Recreate luxury score with diminishing returns
CREATE OR REPLACE FUNCTION calculate_luxury_score(high_star_share numeric)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
-- YOUR CODE HERE
$$;

-- Recreate final score with new weights and cost modifier
CREATE OR REPLACE FUNCTION calculate_final_score(dest_id uuid, holiday_id uuid)
RETURNS integer
LANGUAGE plpgsql STABLE
AS $$
-- YOUR CODE HERE
$$;

-- Add new columns to scores table
ALTER TABLE scores
ADD COLUMN IF NOT EXISTS jet_lag_score INTEGER,
ADD COLUMN IF NOT EXISTS cost_modifier DECIMAL(4,2);

-- Recalculate all scores with new algorithm
-- (Existing trigger will handle this automatically)

COMMIT;
```

### Step 5: Provide Test Cases

After generating the migration, provide example calculations for these test destinations:

**Test Case 1: Barcelona**
- Flight: 2.5 hours
- Time difference: +1 hour
- Temperature high (Aug): 29°C
- Temperature low (Aug): 21°C
- Rainfall (Aug): 60mm
- Beach quality: 4/5
- Kid facilities: 4/5
- High star share: 65%
- Budget level: Mid-Range

**Calculate**:
- Old flight score vs new flight score
- Old weather score vs new weather score (August holiday)
- New jet-lag score
- Old final score vs new final score
- Cost modifier effect

**Test Case 2: Dubai**
- Flight: 7.5 hours
- Time difference: +4 hours
- Temperature high (Aug): 41°C
- Temperature low (Aug): 30°C
- Rainfall (Aug): 5mm
- Beach quality: 5/5
- Kid facilities: 5/5
- High star share: 85%
- Budget level: Luxury

**Calculate**:
- Note the daytime temperature penalty (41°C is too hot)
- Note the jet-lag penalty
- Note the luxury cost modifier (-10%)

---

## Mathematical Formulas Reference

### Non-Linear Flight Score (Piecewise)

```
if flight_hours <= 2:
    score = 100
elif flight_hours <= 6:
    # Gentle decline: 100 at 2h, 80 at 6h
    score = 100 - ((flight_hours - 2) / 4.0) * 20
elif flight_hours <= 12:
    # Steep decline: 80 at 6h, 10 at 12h
    score = 80 - ((flight_hours - 6) / 6.0) * 70
else:
    score = 10  # Minimum for any flight
```

### Jet-Lag Score (Absolute Time Difference)

```
abs_diff = abs(time_difference)

if abs_diff <= 2:
    score = 100
elif abs_diff <= 5:
    # 3h=90, 4h=80, 5h=70
    score = 100 - ((abs_diff - 2) / 3.0) * 30
elif abs_diff <= 8:
    # 6h=60, 7h=50, 8h=40
    score = 70 - ((abs_diff - 5) / 3.0) * 30
else:
    score = 20  # Severe jet lag
```

### Temperature High Score (Daytime Comfort)

```
ideal_min = 24.0
ideal_max = 29.0

if temp_high >= ideal_min AND temp_high <= ideal_max:
    score = 100
elif temp_high < ideal_min:
    # Cold penalty (steeper below 20°C)
    if temp_high < 20:
        score = (temp_high / 20.0) * 50
    else:
        score = 50 + ((temp_high - 20) / 4.0) * 50
else:
    # Heat penalty (steeper above 35°C)
    if temp_high > 35:
        score = max(0, 50 - ((temp_high - 35) / 5.0) * 50)
    else:
        score = 100 - ((temp_high - 29) / 6.0) * 50
```

### Temperature Low Score (Nighttime Comfort)

```
ideal_min = 18.0
ideal_max = 24.0

if temp_low >= ideal_min AND temp_low <= ideal_max:
    score = 100
elif temp_low < ideal_min:
    # Cold nights penalty
    score = max(0, (temp_low / ideal_min) * 100)
else:
    # Warm nights penalty (uncomfortable sleep)
    score = max(0, 100 - ((temp_low - ideal_max) / 6.0) * 100)
```

### Rainfall Score (Non-Linear Curve)

```
if rainfall <= 50:
    score = 100
elif rainfall <= 100:
    score = 100 - ((rainfall - 50) / 50.0) * 20  # 80 at 100mm
elif rainfall <= 150:
    score = 80 - ((rainfall - 100) / 50.0) * 30   # 50 at 150mm
else:
    score = max(20, 50 - ((rainfall - 150) / 100.0) * 30)  # Min 20
```

### Luxury Score (Square Root Scaling)

```
normalized = high_star_share / 100.0  # Convert to 0-1
score = sqrt(normalized) * 100

Examples:
  25% → sqrt(0.25) * 100 = 50
  50% → sqrt(0.50) * 100 = 71
  75% → sqrt(0.75) * 100 = 87
```

### Weather Score Combination

```
daytime_score = calculate_temp_high_score(avg_temp_high)
nighttime_score = calculate_temp_low_score(avg_temp_low)
rainfall_score = calculate_rainfall_score(avg_rainfall)

temp_combined = (daytime_score * 0.70) + (nighttime_score * 0.30)
weather_score = (temp_combined * 0.60) + (rainfall_score * 0.40)
```

### Final Score Calculation

```
weather_sc = calculate_weather_score(dest_id, holiday_id)      # 35%
flight_sc = calculate_flight_score(flight_hours)                # 25%
jet_lag_sc = calculate_jet_lag_score(time_difference)          # 5%  ⭐ NEW
beach_sc = calculate_beach_score(beach_quality)                # 15%
kids_sc = calculate_kid_facilities_score(kid_quality)          # 15%
luxury_sc = calculate_luxury_score(high_star_share)            # 10% (reduced)

base_score = (weather_sc * 0.35) + (flight_sc * 0.25) + (jet_lag_sc * 0.05) +
             (beach_sc * 0.15) + (kids_sc * 0.15) + (luxury_sc * 0.10)

-- Apply cost modifier ⭐ NEW
cost_modifier = CASE budget_level
  WHEN 'Budget' THEN 1.10
  WHEN 'Mid-Range' THEN 1.00
  WHEN 'Luxury' THEN 0.90
  ELSE 1.00
END

final_score = ROUND(base_score * cost_modifier)::INTEGER
```

---

## Success Criteria

Your migration is complete when:

✅ All 7 bugs are fixed with corrected SQL functions
✅ New `calculate_jet_lag_score()` function created
✅ `scores` table has `jet_lag_score` and `cost_modifier` columns
✅ All functions use correct mathematical formulas (see reference above)
✅ Migration file is valid PostgreSQL syntax
✅ Test cases show meaningful score changes (Barcelona and Dubai examples)
✅ Code is well-commented explaining each scoring decision

---

## Expected Impact

After deploying this migration:

**Score Changes**:
- Short-haul, low-jet-lag destinations (Spain, France, Greece) will rank higher
- Mid-range weather (24-29°C daytime) will score better than extreme heat (35°C+)
- Rainy destinations (200mm+ monthly rainfall) will drop significantly
- Budget destinations will get 10% boost, making them more visible
- Long-haul flights (8+ hours) will be heavily penalized unless other factors are exceptional

**User Experience**:
- More realistic recommendations for families with young children
- Better alignment between scores and actual family preferences
- Value-conscious families see budget options ranked fairly
- Weather scores reflect actual comfort (daytime heat + nighttime sleep quality)

---

## Deliverable Format

Provide your response in this structure:

### 1. Analysis Confirmation
- [ ] Confirmed understanding of all 7 bugs
- [ ] Reviewed current SQL functions
- [ ] Understood new mathematical formulas

### 2. Complete Migration File
```sql
-- (Your complete migration SQL here)
```

### 3. Test Case Results

**Barcelona (August Holiday)**
- Old flight score: XX → New flight score: XX
- Old weather score: XX → New weather score: XX
- New jet-lag score: XX
- Old final score: XX → New final score: XX
- Cost modifier: 1.00 (Mid-Range, no change)

**Dubai (August Holiday)**
- Old flight score: XX → New flight score: XX
- Old weather score: XX → New weather score: XX (heat penalty)
- New jet-lag score: XX
- Old final score: XX → New final score: XX
- Cost modifier: 0.90 (Luxury, -10%)

### 4. Code Comments
- Brief explanation of each non-linear formula
- Rationale for weight changes
- Notes on edge cases handled

---

## Go!

You have all the information needed. Generate the complete SQL migration file that fixes all 7 bugs and implements the Phase 1 improvements.

**Remember**:
- Use exact mathematical formulas provided above
- Include all helper functions (temp high/low scoring, rainfall scoring)
- Add comprehensive comments
- Test your logic with the Barcelona and Dubai examples
- Ensure valid PostgreSQL syntax (PL/pgSQL)

Start now!
