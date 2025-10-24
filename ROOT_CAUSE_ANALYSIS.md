# Root Cause Analysis: Flight Score Mismatch

## The Problem

Egypt (Sharm el-Sheikh) is ranking higher than Dubai when it shouldn't be. The root cause is **database scores were calculated with an old formula and never recalculated** when the formula changed.

## Root Cause: Multiple Formula Changes Without Recalculation

There have been **THREE different versions** of the flight scoring formula, creating confusion:

### Old Formula (in database via full_backup.sql)

The database was populated using a **step function**:

```sql
RETURN CASE
  WHEN flight_hours <= 2 THEN 100
  WHEN flight_hours <= 4 THEN 90
  WHEN flight_hours <= 6 THEN 75  ← Sharm el-Sheikh (6h)
  WHEN flight_hours <= 8 THEN 60  ← Dubai (7h)
  WHEN flight_hours <= 10 THEN 45
  WHEN flight_hours <= 12 THEN 30
  ELSE 15
END;
```

**Scores with OLD formula:**
- Dubai (7h): 60 ✓ (matches database)
- Sharm (6h): 75 ✓ (matches database)

### Version 2: Linear Formula (in schema_only.sql - CURRENT CODE)

The code was later updated to a **simple linear function**:

```sql
normalized_score := 100 - ((flight_hours / 12.0) * 100);
```

**Scores with Version 2:**
- Dubai (7h): 100 - (7/12 * 100) = 100 - 58.3 = **42**
- Sharm (6h): 100 - (6/12 * 100) = 100 - 50 = **50**

**Problem:** This formula was identified as buggy (see `docs/gemini-scoring-improvements-prompt.md`):
- Comment says "0-2 hours = 100" but 2h actually gives 83 points
- Too simplistic - doesn't account for non-linear impact of flight time on families

### Version 3: Improved Piecewise Formula (PROPOSED in gemini prompt)

A better piecewise function was proposed but never implemented:

```
0-2 hours: 100 points (flat)
2-6 hours: Gentle decline (100 → 80)
6-12 hours: Steep decline (80 → 10)
12+ hours: 10 points minimum
```

**Scores with Version 3:**
- Dubai (7h): 80 - ((7-6)/6 * 70) = 80 - 11.7 = **68**
- Sharm (6h): 100 - ((6-2)/4 * 20) = 100 - 20 = **80**

## Impact

The step function is much more generous to longer flights than the linear function:

| Flight Hours | Old (Step) | New (Linear) | Difference |
|--------------|------------|--------------|------------|
| 2h | 100 | 83 | +17 |
| 4h | 90 | 67 | +23 |
| 6h | 75 | 50 | **+25** ← Sharm |
| 7h | 60 | 42 | **+18** ← Dubai |
| 8h | 60 | 33 | +27 |
| 10h | 45 | 17 | +28 |
| 12h | 30 | 0 | +30 |

**Key Insight:** Sharm benefits MORE from the old formula (+25) than Dubai (+18), giving Sharm an unfair 7-point advantage!

## Why The New Formula is Better

The linear formula provides:
1. **Proportional penalties**: Each hour adds the same penalty
2. **No cliff effects**: The step function has sudden drops (90→75 at 4-6h, 60→45 at 8-10h)
3. **More granular**: Differentiates between 6h and 7h flights properly

## Timeline of Events

1. **October 22, 2025**: Database populated with Version 1 (step function)
   - All destination scores calculated using step function
   - Dubai: flight_score = 60
   - Sharm: flight_score = 75

2. **October 23, 2025**: Schema updated to Version 2 (linear function)
   - Someone changed `schema_only.sql` to use linear formula
   - **Critical Error**: Database scores were NOT recalculated
   - Code and data now out of sync

3. **Unknown Date**: Version 3 proposed in `docs/gemini-scoring-improvements-prompt.md`
   - Comprehensive prompt created identifying 7 bugs
   - Suggests piecewise function and many other improvements
   - **Never implemented**

4. **October 24, 2025 (Today)**: Issue discovered
   - User reports Egypt ranking higher than Dubai
   - Investigation reveals formula mismatch

## Solution Options

### Option A: Quick Fix (Recalculate with Current Linear Formula)

**Pros:**
- Fast - just recalculate existing formula
- Gets database in sync with code

**Cons:**
- Linear formula is still buggy (doesn't match its own comments)
- Doesn't address other known issues

**Steps:**
1. Ensure `calculate_flight_score()` in database matches schema_only.sql
2. Run: `SELECT update_all_scores_for_destination(id) FROM destinations;`
3. Also fix Sharm's luxury score (56% → ~25%)

### Option B: Comprehensive Fix (Implement Version 3)

**Pros:**
- Fixes ALL 7 known bugs identified in Gemini prompt
- Much better scoring algorithm
- Adds jet-lag and cost considerations

**Cons:**
- More complex implementation
- Larger migration
- Needs thorough testing

**Steps:**
1. Implement all improvements from `docs/gemini-scoring-improvements-prompt.md`:
   - Piecewise flight score function
   - Fixed multi-month weather averaging
   - Temperature high/low scoring
   - Jet-lag penalty
   - Cost modifier
   - Better rainfall penalties
   - Luxury diminishing returns
   - New weights (Weather 35%, Luxury 10%)
2. Add new columns to scores table
3. Recalculate all scores

### Recommended: Option A First, Then Option B

1. **Immediate** (Option A): Recalculate with current formula to fix ranking issue
2. **Near-term** (Option B): Implement comprehensive improvements from Gemini prompt

## Expected Results After Fix

### Current Scores (with OLD formula):
- Dubai: (100*0.3) + (60*0.25) + (80*0.15) + (90*0.15) + (78*0.15) = **82**
- Sharm: (90*0.3) + (75*0.25) + (90*0.15) + (70*0.15) + (56*0.15) = **78**
- **Gap: 4 points**

### After Flight Score Fix (with NEW formula):
- Dubai: (100*0.3) + (42*0.25) + (80*0.15) + (90*0.15) + (78*0.15) = **78**
- Sharm: (90*0.3) + (50*0.25) + (90*0.15) + (70*0.15) + (56*0.15) = **72**
- **Gap: 6 points**

### After BOTH Flight + Luxury Fixes:
If we also fix Sharm's luxury score (56% → 25%):
- Dubai: **78**
- Sharm: (90*0.3) + (50*0.25) + (90*0.15) + (70*0.15) + (25*0.15) = **67**
- **Gap: 11 points**

## Additional Issue: Luxury Score

Sharm el-Sheikh has `high_star_share = 56%` but is classified as "Budget". This is inconsistent:
- Budget destinations should have ~20-30% luxury hotels
- Mid-range destinations should have ~40-50% luxury hotels
- Luxury destinations should have ~60-80% luxury hotels

This needs to be corrected in the source data.
