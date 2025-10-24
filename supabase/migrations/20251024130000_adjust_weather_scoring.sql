-- Migration: Adjust weather scoring preferences
-- Date: 2025-10-24
-- Changes:
-- 1. Lower ideal daytime temperature threshold from 24°C to 23°C
-- 2. Increase weather weight from 20% to 25% (reduce luxury from 20% to 15%)

BEGIN;

-- ============================================================================
-- PART 1: Update temperature high scoring (23°C+ is good)
-- ============================================================================

DROP FUNCTION IF EXISTS calculate_temp_high_score(decimal);

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

  -- Ideal daytime temperature for beach holidays: 23-29°C (lowered from 24°C)
  -- Too cold or too hot reduces score

  IF temp_high >= 23 AND temp_high <= 29 THEN
    -- Perfect beach weather
    score := 100;
  ELSIF temp_high < 23 THEN
    -- Cold penalty (steeper below 20°C)
    IF temp_high < 20 THEN
      -- Very cold: 0-50 points for 0-20°C
      score := (temp_high / 20.0) * 50;
    ELSE
      -- Mild cold: 50-100 points for 20-23°C
      score := 50 + ((temp_high - 20.0) / 3.0) * 50;
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

COMMENT ON FUNCTION calculate_temp_high_score IS 'Score daytime high temperature. Ideal: 23-29°C (updated from 24°C). Penalties for cold (<20°C) and hot (>35°C)';

-- ============================================================================
-- PART 2: Update final score with increased weather weight
-- ============================================================================

DROP FUNCTION IF EXISTS calculate_final_score(uuid, uuid);

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

  -- Calculate weighted final score with UPDATED weights:
  -- Weather: 25% (increased from 20%)
  -- Flight: 25% (same)
  -- Jet-lag: 5% (same)
  -- Beach: 15% (same)
  -- Kids: 15% (same)
  -- Luxury: 15% (reduced from 20%)
  -- Total: 100%

  final_sc := (weather_sc * 0.25) +
              (flight_sc * 0.25) +
              (jet_lag_sc * 0.05) +
              (beach_sc * 0.15) +
              (kids_sc * 0.15) +
              (luxury_sc * 0.15);

  -- Cap at 100
  RETURN LEAST(100, ROUND(final_sc)::INTEGER);
END;
$$;

COMMENT ON FUNCTION calculate_final_score IS 'Final weighted score. Weights: Weather 25% (increased), Flight 25%, Jet-lag 5%, Beach 15%, Kids 15%, Luxury 15% (reduced)';

-- ============================================================================
-- PART 3: Recalculate all scores with new algorithm
-- ============================================================================

DO $$
DECLARE
  dest RECORD;
BEGIN
  RAISE NOTICE 'Recalculating scores with updated weather preferences...';

  FOR dest IN SELECT id, name FROM destinations ORDER BY name LOOP
    RAISE NOTICE 'Updating scores for: %', dest.name;
    PERFORM update_all_scores_for_destination(dest.id);
  END LOOP;

  RAISE NOTICE 'Score recalculation complete!';
END $$;

COMMIT;
