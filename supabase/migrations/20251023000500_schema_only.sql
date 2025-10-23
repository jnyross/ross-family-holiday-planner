-- Holiday Planner Database Schema
-- Functions, Tables, Indexes, and Triggers
-- NO DATA - data will be imported separately

-- ========================================
-- FUNCTIONS
-- ========================================

-- Calculate beach/pool quality score (0-100)
CREATE OR REPLACE FUNCTION calculate_beach_score(beach_pool_quality integer)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
BEGIN
  IF beach_pool_quality IS NULL THEN
    RETURN 0;
  END IF;
  RETURN beach_pool_quality * 10;
END;
$$;

-- Calculate flight time score (0-100, closer = better)
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

  IF normalized_score < 0 THEN
    RETURN 0;
  END IF;

  RETURN ROUND(normalized_score)::INTEGER;
END;
$$;

-- Calculate kid facilities score (0-100)
CREATE OR REPLACE FUNCTION calculate_kid_facilities_score(kid_facilities_quality integer)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
BEGIN
  IF kid_facilities_quality IS NULL THEN
    RETURN 0;
  END IF;
  RETURN kid_facilities_quality * 10;
END;
$$;

-- Calculate luxury hotel score (0-100)
CREATE OR REPLACE FUNCTION calculate_luxury_score(high_star_share numeric)
RETURNS integer
LANGUAGE plpgsql IMMUTABLE
AS $$
BEGIN
  IF high_star_share IS NULL THEN
    RETURN 0;
  END IF;
  RETURN ROUND(high_star_share)::INTEGER;
END;
$$;

-- Calculate weather score for a destination during a holiday period
CREATE OR REPLACE FUNCTION calculate_weather_score(dest_id uuid, holiday_id uuid)
RETURNS integer
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  holiday_start DATE;
  holiday_end DATE;
  start_month INTEGER;
  end_month INTEGER;
  avg_temp DECIMAL;
  avg_rain DECIMAL;
  temp_score DECIMAL;
  rain_score DECIMAL;
  combined_score DECIMAL;
BEGIN
  -- Get holiday dates
  SELECT start_date, end_date INTO holiday_start, holiday_end
  FROM holiday_periods
  WHERE id = holiday_id;

  IF NOT FOUND THEN
    RETURN 0;
  END IF;

  start_month := EXTRACT(MONTH FROM holiday_start);
  end_month := EXTRACT(MONTH FROM holiday_end);

  -- Get average climate for the months
  IF start_month = end_month THEN
    SELECT
      COALESCE(AVG(temperature_celsius), 0),
      COALESCE(AVG(rainfall_mm), 0)
    INTO avg_temp, avg_rain
    FROM climate_data
    WHERE destination_id = dest_id AND month = start_month;
  ELSE
    SELECT
      COALESCE(AVG(temperature_celsius), 0),
      COALESCE(AVG(rainfall_mm), 0)
    INTO avg_temp, avg_rain
    FROM climate_data
    WHERE destination_id = dest_id AND month IN (start_month, end_month);
  END IF;

  -- Temperature score (20-28°C is ideal, 0-100 scale)
  IF avg_temp >= 20 AND avg_temp <= 28 THEN
    temp_score := 100;
  ELSIF avg_temp < 20 THEN
    temp_score := GREATEST(0, (avg_temp / 20.0) * 100);
  ELSE
    temp_score := GREATEST(0, 100 - ((avg_temp - 28) / 20.0) * 100);
  END IF;

  -- Rainfall score (less = better, 0-200mm ideal, 0-100 scale)
  IF avg_rain <= 50 THEN
    rain_score := 100;
  ELSIF avg_rain <= 200 THEN
    rain_score := 100 - ((avg_rain - 50) / 150.0) * 50;
  ELSE
    rain_score := GREATEST(0, 50 - ((avg_rain - 200) / 200.0) * 50);
  END IF;

  -- Combine (70% temperature, 30% rainfall)
  combined_score := (temp_score * 0.7) + (rain_score * 0.3);

  RETURN ROUND(combined_score)::INTEGER;
END;
$$;

-- Calculate final weighted score for a destination/holiday combination
CREATE OR REPLACE FUNCTION calculate_final_score(dest_id uuid, holiday_id uuid)
RETURNS integer
LANGUAGE plpgsql STABLE
AS $$
DECLARE
  dest RECORD;
  weather_sc INTEGER;
  flight_sc INTEGER;
  beach_sc INTEGER;
  kids_sc INTEGER;
  luxury_sc INTEGER;
  final_sc DECIMAL;
BEGIN
  SELECT * INTO dest FROM destinations WHERE id = dest_id;

  IF NOT FOUND THEN
    RETURN 0;
  END IF;

  weather_sc := calculate_weather_score(dest_id, holiday_id);
  flight_sc := calculate_flight_score(dest.flight_hours);
  beach_sc := calculate_beach_score(dest.beach_pool_quality);
  kids_sc := calculate_kid_facilities_score(dest.kid_facilities_quality);
  luxury_sc := calculate_luxury_score(dest.high_star_share);

  -- Weighted average: Weather 30%, Flight 25%, Beach 15%, Kids 15%, Luxury 15%
  final_sc := (weather_sc * 0.30) + (flight_sc * 0.25) + (beach_sc * 0.15) +
              (kids_sc * 0.15) + (luxury_sc * 0.15);

  RETURN ROUND(final_sc)::INTEGER;
END;
$$;

-- Update all scores for a destination across all holiday periods
CREATE OR REPLACE FUNCTION update_all_scores_for_destination(dest_id uuid)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  holiday RECORD;
BEGIN
  FOR holiday IN SELECT id FROM holiday_periods LOOP
    INSERT INTO scores (
      destination_id, holiday_period_id,
      weather_score, flight_score, beach_score, kid_facilities_score, luxury_score, final_score
    )
    SELECT
      dest_id,
      holiday.id,
      calculate_weather_score(dest_id, holiday.id),
      calculate_flight_score(flight_hours),
      calculate_beach_score(beach_pool_quality),
      calculate_kid_facilities_score(kid_facilities_quality),
      calculate_luxury_score(high_star_share),
      calculate_final_score(dest_id, holiday.id)
    FROM destinations
    WHERE id = dest_id
    ON CONFLICT (destination_id, holiday_period_id)
    DO UPDATE SET
      weather_score = EXCLUDED.weather_score,
      flight_score = EXCLUDED.flight_score,
      beach_score = EXCLUDED.beach_score,
      kid_facilities_score = EXCLUDED.kid_facilities_score,
      luxury_score = EXCLUDED.luxury_score,
      final_score = EXCLUDED.final_score,
      calculated_at = NOW();
  END LOOP;
END;
$$;

-- Trigger function: Update scores when destination changes
CREATE OR REPLACE FUNCTION trigger_update_destination_scores()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM update_all_scores_for_destination(NEW.id);
  RETURN NEW;
END;
$$;

-- Trigger function: Update scores when climate data changes
CREATE OR REPLACE FUNCTION trigger_update_climate_scores()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM update_all_scores_for_destination(NEW.destination_id);
  RETURN NEW;
END;
$$;

-- Trigger function: Recalculate all scores when holiday period changes
CREATE OR REPLACE FUNCTION trigger_recalculate_all_scores()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  dest RECORD;
BEGIN
  FOR dest IN SELECT id FROM destinations LOOP
    PERFORM update_all_scores_for_destination(dest.id);
  END LOOP;
  RETURN NEW;
END;
$$;

-- Trigger function: Update timestamp
CREATE OR REPLACE FUNCTION trigger_update_timestamp()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

-- Trigger function: Update updated_at column
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

-- ========================================
-- TABLES
-- ========================================

-- Destinations table
CREATE TABLE IF NOT EXISTS destinations (
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    name text NOT NULL,
    country text NOT NULL,
    region text NOT NULL,
    type text NOT NULL,
    flight_hours numeric NOT NULL,
    time_difference integer NOT NULL,
    visa_required text DEFAULT 'No'::text NOT NULL,
    currency text NOT NULL,
    language text NOT NULL,
    budget_level text NOT NULL,
    best_months text,
    worst_months text,
    high_star_share numeric DEFAULT 0 NOT NULL,
    beach_pool_quality integer DEFAULT 5,
    kid_facilities_quality integer DEFAULT 5,
    notes text,
    visited boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT destinations_beach_pool_quality_check CHECK (((beach_pool_quality >= 1) AND (beach_pool_quality <= 10))),
    CONSTRAINT destinations_flight_hours_check CHECK (((flight_hours >= (0)::numeric) AND (flight_hours <= (24)::numeric))),
    CONSTRAINT destinations_high_star_share_check CHECK (((high_star_share >= (0)::numeric) AND (high_star_share <= (100)::numeric))),
    CONSTRAINT destinations_kid_facilities_quality_check CHECK (((kid_facilities_quality >= 1) AND (kid_facilities_quality <= 10))),
    CONSTRAINT destinations_time_difference_check CHECK (((time_difference >= '-12'::integer) AND (time_difference <= 14))),
    CONSTRAINT unique_destination UNIQUE (name, country)
);

CREATE INDEX IF NOT EXISTS idx_destinations_country ON destinations(country);
CREATE INDEX IF NOT EXISTS idx_destinations_name ON destinations(name);
CREATE INDEX IF NOT EXISTS idx_destinations_region ON destinations(region);
CREATE INDEX IF NOT EXISTS idx_destinations_visited ON destinations(visited);

COMMENT ON TABLE destinations IS 'Master list of potential holiday destinations';

-- Climate data table
CREATE TABLE IF NOT EXISTS climate_data (
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    destination_id uuid NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,
    month integer NOT NULL,
    temperature_celsius numeric NOT NULL,
    rainfall_mm numeric NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    temperature_high numeric,
    temperature_low numeric,
    CONSTRAINT climate_data_month_check CHECK (((month >= 1) AND (month <= 12))),
    CONSTRAINT climate_data_rainfall_mm_check CHECK (((rainfall_mm >= (0)::numeric) AND (rainfall_mm <= (2000)::numeric))),
    CONSTRAINT climate_data_temperature_celsius_check CHECK (((temperature_celsius >= ('-50'::integer)::numeric) AND (temperature_celsius <= (60)::numeric))),
    CONSTRAINT climate_data_temperature_high_check CHECK (((temperature_high >= ('-50'::integer)::numeric) AND (temperature_high <= (60)::numeric))),
    CONSTRAINT climate_data_temperature_low_check CHECK (((temperature_low >= ('-50'::integer)::numeric) AND (temperature_low <= (60)::numeric))),
    CONSTRAINT climate_data_destination_id_month_key UNIQUE (destination_id, month)
);

CREATE INDEX IF NOT EXISTS idx_climate_destination ON climate_data(destination_id);
CREATE INDEX IF NOT EXISTS idx_climate_month ON climate_data(month);

COMMENT ON TABLE climate_data IS 'Monthly climate averages (temperature and rainfall) for each destination';

-- Holiday periods table
CREATE TABLE IF NOT EXISTS holiday_periods (
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    name text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    year integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT holiday_periods_date_order CHECK ((start_date < end_date)),
    CONSTRAINT unique_holiday UNIQUE (name, year)
);

CREATE INDEX IF NOT EXISTS idx_holiday_periods_dates ON holiday_periods(start_date, end_date);
CREATE INDEX IF NOT EXISTS idx_holiday_periods_year ON holiday_periods(year);

COMMENT ON TABLE holiday_periods IS 'School holiday periods for planning';

-- Scores table
CREATE TABLE IF NOT EXISTS scores (
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    destination_id uuid NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,
    holiday_period_id uuid NOT NULL REFERENCES holiday_periods(id) ON DELETE CASCADE,
    weather_score integer DEFAULT 0,
    flight_score integer DEFAULT 0,
    beach_score integer DEFAULT 0,
    kid_facilities_score integer DEFAULT 0,
    luxury_score integer DEFAULT 0,
    final_score integer DEFAULT 0,
    calculated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT scores_beach_score_check CHECK (((beach_score >= 0) AND (beach_score <= 100))),
    CONSTRAINT scores_final_score_check CHECK (((final_score >= 0) AND (final_score <= 100))),
    CONSTRAINT scores_flight_score_check CHECK (((flight_score >= 0) AND (flight_score <= 100))),
    CONSTRAINT scores_kid_facilities_score_check CHECK (((kid_facilities_score >= 0) AND (kid_facilities_score <= 100))),
    CONSTRAINT scores_luxury_score_check CHECK (((luxury_score >= 0) AND (luxury_score <= 100))),
    CONSTRAINT scores_weather_score_check CHECK (((weather_score >= 0) AND (weather_score <= 100))),
    CONSTRAINT scores_destination_id_holiday_period_id_key UNIQUE (destination_id, holiday_period_id)
);

CREATE INDEX IF NOT EXISTS idx_scores_combined ON scores(holiday_period_id, final_score DESC);
CREATE INDEX IF NOT EXISTS idx_scores_destination ON scores(destination_id);
CREATE INDEX IF NOT EXISTS idx_scores_final ON scores(final_score DESC);
CREATE INDEX IF NOT EXISTS idx_scores_holiday ON scores(holiday_period_id);

COMMENT ON TABLE scores IS 'Calculated scores for each destination/holiday combination';

-- User shortlists table
CREATE TABLE IF NOT EXISTS user_shortlists (
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    user_id uuid NOT NULL,
    destination_id uuid NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,
    holiday_period_id uuid NOT NULL REFERENCES holiday_periods(id) ON DELETE CASCADE,
    status text DEFAULT 'candidate'::text NOT NULL,
    notes text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT user_shortlists_status_check CHECK ((status = ANY (ARRAY['candidate'::text, 'selected'::text, 'rejected'::text]))),
    CONSTRAINT user_shortlists_user_id_destination_id_holiday_period_id_key UNIQUE (user_id, destination_id, holiday_period_id)
);

CREATE INDEX IF NOT EXISTS idx_shortlists_destination ON user_shortlists(destination_id);
CREATE INDEX IF NOT EXISTS idx_shortlists_holiday ON user_shortlists(holiday_period_id);
CREATE INDEX IF NOT EXISTS idx_shortlists_status ON user_shortlists(status);
CREATE INDEX IF NOT EXISTS idx_shortlists_user ON user_shortlists(user_id);
CREATE INDEX IF NOT EXISTS idx_shortlists_user_holiday ON user_shortlists(user_id, holiday_period_id);

COMMENT ON TABLE user_shortlists IS 'User shortlists for tracking candidates and selections';

-- ========================================
-- TRIGGERS
-- ========================================

-- Auto-update destination scores when destination changes
DROP TRIGGER IF EXISTS auto_update_destination_scores ON destinations;
CREATE TRIGGER auto_update_destination_scores
    AFTER INSERT OR UPDATE ON destinations
    FOR EACH ROW
    EXECUTE FUNCTION trigger_update_destination_scores();

-- Auto-update scores when climate data changes
DROP TRIGGER IF EXISTS auto_update_climate_scores ON climate_data;
CREATE TRIGGER auto_update_climate_scores
    AFTER INSERT OR UPDATE ON climate_data
    FOR EACH ROW
    EXECUTE FUNCTION trigger_update_climate_scores();

-- Recalculate all scores when holiday period changes
DROP TRIGGER IF EXISTS auto_recalculate_all_scores ON holiday_periods;
CREATE TRIGGER auto_recalculate_all_scores
    AFTER INSERT OR UPDATE ON holiday_periods
    FOR EACH ROW
    EXECUTE FUNCTION trigger_recalculate_all_scores();

-- Update timestamp on destination changes
DROP TRIGGER IF EXISTS update_destination_timestamp ON destinations;
CREATE TRIGGER update_destination_timestamp
    BEFORE UPDATE ON destinations
    FOR EACH ROW
    EXECUTE FUNCTION trigger_update_timestamp();

-- Update timestamp on shortlist changes
DROP TRIGGER IF EXISTS update_user_shortlists_updated_at ON user_shortlists;
CREATE TRIGGER update_user_shortlists_updated_at
    BEFORE UPDATE ON user_shortlists
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
