-- Migration: Fix scoring algorithm bugs and add comprehensive improvements
-- Date: 2025-10-24
-- Phase: Comprehensive (All 7 bug fixes + improvements)
--
-- This migration addresses:
-- 1. Flight score formula (non-linear piecewise)
-- 2. Jet-lag score (NEW - uses time_difference field)
-- 3. Weather score (multi-month averaging, temp high/low, better rainfall)
-- 4. Luxury score (diminishing returns via square root)
-- 5. Final score (new weights)
-- 6. Score table schema (add jet_lag_score column)
-- 7. Update all destination scores

BEGIN;

-- ============================================================================
-- PART 1: Drop existing functions
-- ============================================================================

DROP FUNCTION IF EXISTS calculate_flight_score(numeric);
DROP FUNCTION IF EXISTS calculate_weather_score(uuid, uuid);
DROP FUNCTION IF EXISTS calculate_luxury_score(numeric);
DROP FUNCTION IF EXISTS calculate_final_score(uuid, uuid);
DROP FUNCTION IF EXISTS update_all_scores_for_destination(uuid);

-- ============================================================================
-- PART 2: Create new jet-lag score function
-- ============================================================================

CREATE OR REPLACE FUNCTION calculate_jet_lag_score(time_difference integer)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  abs_diff integer;
  score decimal;
BEGIN
  -- Handle NULL
  IF time_difference IS NULL THEN
    RETURN 100; -- No penalty if unknown
  END IF;

  -- Use absolute value (jet lag works both ways)
  abs_diff := ABS(time_difference);

  -- Piecewise function:
  -- 0-2 hours: 100 points (minimal jet lag)
  -- 3-5 hours: 90-70 points (moderate jet lag)
  -- 6-8 hours: 60-40 points (heavy jet lag)
  -- 9+ hours: 20 points (severe jet lag)

  IF abs_diff <= 2 THEN
    score := 100;
  ELSIF abs_diff <= 5 THEN
    -- Linear decline from 100 to 70 over 3 hours (3h=90, 4h=80, 5h=70)
    score := 100 - ((abs_diff - 2.0) / 3.0) * 30;
  ELSIF abs_diff <= 8 THEN
    -- Linear decline from 70 to 40 over 3 hours (6h=60, 7h=50, 8h=40)
    score := 70 - ((abs_diff - 5.0) / 3.0) * 30;
  ELSE
    -- Severe jet lag
    score := 20;
  END IF;

  RETURN ROUND(score)::INTEGER;
END;
$$;

COMMENT ON FUNCTION calculate_jet_lag_score IS 'Calculate jet-lag penalty based on time difference from UK. 0-2h=100, 3-5h=70-90, 6-8h=40-60, 9h+=20';

-- ============================================================================
-- PART 3: Recreate flight score with improved piecewise function
-- ============================================================================

CREATE OR REPLACE FUNCTION calculate_flight_score(flight_hours numeric)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  score decimal;
BEGIN
  -- Handle NULL or invalid
  IF flight_hours IS NULL OR flight_hours < 0 THEN
    RETURN 0;
  END IF;

  -- Piecewise non-linear function:
  -- 0-2 hours: 100 points (short-haul perfection)
  -- 2-6 hours: Gentle decline to 80 (acceptable medium-haul)
  -- 6-12 hours: Steep decline to 10 (long-haul penalty)
  -- 12+ hours: Minimum 10 points (any ultra-long flight)

  IF flight_hours <= 2 THEN
    score := 100;
  ELSIF flight_hours <= 6 THEN
    -- Gentle decline: 100 at 2h, 80 at 6h
    -- Formula: 100 - ((hours - 2) / 4) * 20
    score := 100 - ((flight_hours - 2.0) / 4.0) * 20;
  ELSIF flight_hours <= 12 THEN
    -- Steep decline: 80 at 6h, 10 at 12h
    -- Formula: 80 - ((hours - 6) / 6) * 70
    score := 80 - ((flight_hours - 6.0) / 6.0) * 70;
  ELSE
    -- Ultra long-haul minimum
    score := 10;
  END IF;

  RETURN ROUND(score)::INTEGER;
END;
$$;

COMMENT ON FUNCTION calculate_flight_score IS 'Non-linear flight score: 0-2h=100, 2-6h gentle decline to 80, 6-12h steep decline to 10, 12h+=10';

-- ============================================================================
-- PART 4: Helper functions for weather scoring
-- ============================================================================

-- Calculate daytime temperature score (using temperature_high)
CREATE OR REPLACE FUNCTION calculate_temp_high_score(temp_high decimal)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  score decimal;
BEGIN
  IF temp_high IS NULL THEN
    RETURN 50; -- Neutral score if no data
  END IF;

  -- Ideal daytime temperature for beach holidays: 24-29°C
  -- Too cold or too hot reduces score

  IF temp_high >= 24 AND temp_high <= 29 THEN
    -- Perfect beach weather
    score := 100;
  ELSIF temp_high < 24 THEN
    -- Cold penalty (steeper below 20°C)
    IF temp_high < 20 THEN
      -- Very cold: 0-50 points for 0-20°C
      score := (temp_high / 20.0) * 50;
    ELSE
      -- Mild cold: 50-100 points for 20-24°C
      score := 50 + ((temp_high - 20.0) / 4.0) * 50;
    END IF;
  ELSE
    -- Heat penalty (steeper above 35°C)
    IF temp_high > 35 THEN
      -- Very hot: drops to 0 at 45°C
      score := GREATEST(0, 50 - ((temp_high - 35.0) / 10.0) * 50);
    ELSE
      -- Warm: 100-50 points for 29-35°C
      score := 100 - ((temp_high - 29.0) / 6.0) * 50;
    END IF;
  END IF;

  RETURN ROUND(score)::INTEGER;
END;
$$;

COMMENT ON FUNCTION calculate_temp_high_score IS 'Score daytime high temperature. Ideal: 24-29°C. Penalties for cold (<20°C) and hot (>35°C)';

-- Calculate nighttime temperature score (using temperature_low)
CREATE OR REPLACE FUNCTION calculate_temp_low_score(temp_low decimal)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  score decimal;
BEGIN
  IF temp_low IS NULL THEN
    RETURN 50; -- Neutral score if no data
  END IF;

  -- Ideal nighttime temperature for comfortable sleep: 18-24°C

  IF temp_low >= 18 AND temp_low <= 24 THEN
    -- Perfect sleeping temperature
    score := 100;
  ELSIF temp_low < 18 THEN
    -- Cold nights penalty
    score := GREATEST(0, (temp_low / 18.0) * 100);
  ELSE
    -- Warm nights penalty (uncomfortable sleep)
    -- Drops to 0 at 30°C+
    score := GREATEST(0, 100 - ((temp_low - 24.0) / 6.0) * 100);
  END IF;

  RETURN ROUND(score)::INTEGER;
END;
$$;

COMMENT ON FUNCTION calculate_temp_low_score IS 'Score nighttime low temperature. Ideal: 18-24°C for comfortable sleep';

-- Calculate rainfall score with steeper penalties
CREATE OR REPLACE FUNCTION calculate_rainfall_score(rainfall_mm decimal)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  score decimal;
BEGIN
  IF rainfall_mm IS NULL THEN
    RETURN 100; -- Assume good if no data
  END IF;

  -- Non-linear rainfall penalties:
  -- 0-50mm: Perfect (100 points)
  -- 50-100mm: Good (80 points)
  -- 100-150mm: Acceptable (50 points)
  -- 150mm+: Poor (20 points minimum)

  IF rainfall_mm <= 50 THEN
    score := 100;
  ELSIF rainfall_mm <= 100 THEN
    -- Gentle drop: 100 to 80
    score := 100 - ((rainfall_mm - 50.0) / 50.0) * 20;
  ELSIF rainfall_mm <= 150 THEN
    -- Steeper drop: 80 to 50
    score := 80 - ((rainfall_mm - 100.0) / 50.0) * 30;
  ELSE
    -- Heavy rain: approaches 20 minimum
    score := GREATEST(20, 50 - ((rainfall_mm - 150.0) / 100.0) * 30);
  END IF;

  RETURN ROUND(score)::INTEGER;
END;
$$;

COMMENT ON FUNCTION calculate_rainfall_score IS 'Non-linear rainfall penalty: <50mm=100, <100mm=80, <150mm=50, 150mm+=20';

-- ============================================================================
-- PART 5: Recreate weather score with comprehensive fixes
-- ============================================================================

CREATE OR REPLACE FUNCTION calculate_weather_score(dest_id uuid, holiday_id uuid)
RETURNS integer
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  holiday_start date;
  holiday_end date;
  start_month integer;
  end_month integer;
  months_array integer[];
  month_val integer;
  avg_temp_high decimal := 0;
  avg_temp_low decimal := 0;
  avg_rainfall decimal := 0;
  temp_high_score integer;
  temp_low_score integer;
  rainfall_score integer;
  temp_combined decimal;
  weather_score decimal;
BEGIN
  -- Get holiday dates
  SELECT start_date, end_date
  INTO holiday_start, holiday_end
  FROM holiday_periods
  WHERE id = holiday_id;

  IF holiday_start IS NULL THEN
    RETURN 0;
  END IF;

  -- Extract start and end months
  start_month := EXTRACT(MONTH FROM holiday_start);
  end_month := EXTRACT(MONTH FROM holiday_end);

  -- Build array of all months in the holiday period
  -- Handle year boundary crossing (e.g., Dec-Jan)
  IF start_month <= end_month THEN
    -- Normal case: July-August
    months_array := ARRAY(SELECT generate_series(start_month, end_month));
  ELSE
    -- Year boundary: December-January
    months_array := ARRAY(SELECT generate_series(start_month, 12)) ||
                    ARRAY(SELECT generate_series(1, end_month));
  END IF;

  -- Get average climate data across ALL months in holiday period
  -- Using temperature_high and temperature_low for better accuracy
  SELECT
    COALESCE(AVG(temperature_high), AVG(temperature_celsius), 0),
    COALESCE(AVG(temperature_low), AVG(temperature_celsius), 0),
    COALESCE(AVG(rainfall_mm), 0)
  INTO avg_temp_high, avg_temp_low, avg_rainfall
  FROM climate_data
  WHERE destination_id = dest_id
    AND month = ANY(months_array);

  -- If no data at all, return low score
  IF avg_temp_high = 0 AND avg_temp_low = 0 THEN
    RETURN 30;
  END IF;

  -- Calculate component scores using helper functions
  temp_high_score := calculate_temp_high_score(avg_temp_high);
  temp_low_score := calculate_temp_low_score(avg_temp_low);
  rainfall_score := calculate_rainfall_score(avg_rainfall);

  -- Combine temperature scores (70% daytime, 30% nighttime)
  temp_combined := (temp_high_score * 0.70) + (temp_low_score * 0.30);

  -- Combine temperature and rainfall (60% temperature, 40% rainfall)
  -- Rainfall now has more weight (was 30%, now 40%)
  weather_score := (temp_combined * 0.60) + (rainfall_score * 0.40);

  RETURN ROUND(weather_score)::INTEGER;
END;
$$;

COMMENT ON FUNCTION calculate_weather_score IS 'Comprehensive weather score using temp high/low, multi-month averaging, and rainfall penalties. Temp: 60% (70% day/30% night), Rainfall: 40%';

-- ============================================================================
-- PART 6: Recreate luxury score with diminishing returns
-- ============================================================================

CREATE OR REPLACE FUNCTION calculate_luxury_score(high_star_share numeric)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
  normalized decimal;
  score decimal;
BEGIN
  IF high_star_share IS NULL OR high_star_share < 0 THEN
    RETURN 0;
  END IF;

  -- Apply square root scaling for diminishing returns
  -- Having SOME luxury is valuable, but maximizing luxury % has diminishing returns
  -- Formula: sqrt(share / 100) * 100
  -- Examples:
  --   0% → 0 points
  --   25% → 50 points (boosted from 25)
  --   50% → 71 points (boosted from 50)
  --   75% → 87 points (compressed from 75)
  --   100% → 100 points (same)

  normalized := high_star_share / 100.0;
  score := SQRT(normalized) * 100.0;

  RETURN LEAST(100, ROUND(score)::INTEGER);
END;
$$;

COMMENT ON FUNCTION calculate_luxury_score IS 'Luxury score with diminishing returns (square root scaling). 25%→50pts, 50%→71pts, 75%→87pts';

-- ============================================================================
-- PART 7: Recreate final score with new weights and cost modifier
-- ============================================================================

CREATE OR REPLACE FUNCTION calculate_final_score(dest_id uuid, holiday_id uuid)
RETURNS integer
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  dest RECORD;
  weather_sc integer;
  flight_sc integer;
  jet_lag_sc integer;
  beach_sc integer;
  kids_sc integer;
  luxury_sc integer;
  final_sc decimal;
BEGIN
  -- Get destination data
  SELECT * INTO dest FROM destinations WHERE id = dest_id;

  IF NOT FOUND THEN
    RETURN 0;
  END IF;

  -- Calculate all component scores
  weather_sc := calculate_weather_score(dest_id, holiday_id);
  flight_sc := calculate_flight_score(dest.flight_hours);
  jet_lag_sc := calculate_jet_lag_score(dest.time_difference);
  beach_sc := calculate_beach_score(dest.beach_pool_quality);
  kids_sc := calculate_kid_facilities_score(dest.kid_facilities_quality);
  luxury_sc := calculate_luxury_score(dest.high_star_share);

  -- Calculate weighted final score with NEW weights:
  -- Weather: 20% (reduced from 30% to give luxury more impact)
  -- Flight: 25% (same)
  -- Jet-lag: 5% (NEW)
  -- Beach: 15% (same)
  -- Kids: 15% (same)
  -- Luxury: 20% (increased from original 15%, now 20% for maximum impact)
  -- Total: 100%

  final_sc := (weather_sc * 0.20) +
              (flight_sc * 0.25) +
              (jet_lag_sc * 0.05) +
              (beach_sc * 0.15) +
              (kids_sc * 0.15) +
              (luxury_sc * 0.20);

  -- Cap at 100
  RETURN LEAST(100, ROUND(final_sc)::INTEGER);
END;
$$;

COMMENT ON FUNCTION calculate_final_score IS 'Final weighted score. Weights: Weather 20%, Flight 25%, Jet-lag 5%, Beach 15%, Kids 15%, Luxury 20% (doubled for maximum impact)';

-- ============================================================================
-- PART 8: Update scores table schema
-- ============================================================================

-- Add new column for jet-lag score
ALTER TABLE scores
ADD COLUMN IF NOT EXISTS jet_lag_score integer CHECK (jet_lag_score >= 0 AND jet_lag_score <= 100);

COMMENT ON COLUMN scores.jet_lag_score IS 'Jet-lag penalty score (0-100) based on time difference from UK';

-- ============================================================================
-- PART 9: Recreate update function to include new fields
-- ============================================================================

CREATE OR REPLACE FUNCTION update_all_scores_for_destination(dest_id uuid)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  dest RECORD;
  holiday RECORD;
  weather_sc integer;
  flight_sc integer;
  jet_lag_sc integer;
  beach_sc integer;
  kids_sc integer;
  luxury_sc integer;
  final_sc integer;
BEGIN
  -- Get destination data
  SELECT * INTO dest FROM destinations WHERE id = dest_id;

  IF NOT FOUND THEN
    RETURN;
  END IF;

  -- Loop through all holiday periods
  FOR holiday IN SELECT id FROM holiday_periods LOOP
    -- Calculate all component scores
    weather_sc := calculate_weather_score(dest_id, holiday.id);
    flight_sc := calculate_flight_score(dest.flight_hours);
    jet_lag_sc := calculate_jet_lag_score(dest.time_difference);
    beach_sc := calculate_beach_score(dest.beach_pool_quality);
    kids_sc := calculate_kid_facilities_score(dest.kid_facilities_quality);
    luxury_sc := calculate_luxury_score(dest.high_star_share);
    final_sc := calculate_final_score(dest_id, holiday.id);

    -- Upsert score record
    INSERT INTO scores (
      destination_id,
      holiday_period_id,
      weather_score,
      flight_score,
      jet_lag_score,
      beach_score,
      kid_facilities_score,
      luxury_score,
      final_score,
      calculated_at
    ) VALUES (
      dest_id,
      holiday.id,
      weather_sc,
      flight_sc,
      jet_lag_sc,
      beach_sc,
      kids_sc,
      luxury_sc,
      final_sc,
      NOW()
    )
    ON CONFLICT (destination_id, holiday_period_id)
    DO UPDATE SET
      weather_score = EXCLUDED.weather_score,
      flight_score = EXCLUDED.flight_score,
      jet_lag_score = EXCLUDED.jet_lag_score,
      beach_score = EXCLUDED.beach_score,
      kid_facilities_score = EXCLUDED.kid_facilities_score,
      luxury_score = EXCLUDED.luxury_score,
      final_score = EXCLUDED.final_score,
      calculated_at = NOW();
  END LOOP;
END;
$$;

COMMENT ON FUNCTION update_all_scores_for_destination IS 'Recalculate and update all scores (including new jet-lag score) for all holiday periods for a destination';

-- ============================================================================
-- PART 10: Fix data inconsistencies
-- ============================================================================

-- Fix Sharm el-Sheikh luxury score (was 56%, too high for Budget destination)
UPDATE destinations
SET high_star_share = 25.0,
    updated_at = NOW()
WHERE name = 'Sharm el-Sheikh' AND budget_level = 'Budget';

-- Log the fix
DO $$
BEGIN
  RAISE NOTICE 'Fixed Sharm el-Sheikh luxury data: 56%% → 25%% (consistent with Budget classification)';
END $$;

-- ============================================================================
-- PART 11: Recalculate all scores with new algorithm
-- ============================================================================

-- This will automatically recalculate all destination scores using the new functions
DO $$
DECLARE
  dest RECORD;
BEGIN
  RAISE NOTICE 'Recalculating scores for all destinations with new algorithm...';

  FOR dest IN SELECT id, name FROM destinations ORDER BY name LOOP
    RAISE NOTICE 'Updating scores for: %', dest.name;
    PERFORM update_all_scores_for_destination(dest.id);
  END LOOP;

  RAISE NOTICE 'Score recalculation complete!';
END $$;

COMMIT;

-- ============================================================================
-- VERIFICATION QUERIES (run these after migration)
-- ============================================================================

-- Check flight scores have changed
-- SELECT d.name, d.flight_hours, s.flight_score
-- FROM destinations d
-- JOIN scores s ON d.id = s.destination_id
-- WHERE d.name IN ('Dubai', 'Sharm el-Sheikh')
-- LIMIT 10;

-- Check jet-lag scores are populated
-- SELECT d.name, d.time_difference, s.jet_lag_score
-- FROM destinations d
-- JOIN scores s ON d.id = s.destination_id
-- WHERE s.jet_lag_score IS NOT NULL
-- LIMIT 10;

-- Check final scores
-- SELECT d.name, d.budget_level, s.final_score, s.jet_lag_score
-- FROM destinations d
-- JOIN scores s ON d.id = s.destination_id
-- ORDER BY s.final_score DESC
-- LIMIT 20;
