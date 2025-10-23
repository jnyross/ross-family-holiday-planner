--
-- PostgreSQL database dump
--

\restrict kmrBqlWh1EgoKjzHjXMvhcyfybvgyC1asYv8tFSmgCSlhOhv4Po8ahu1e9CXZPi

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: calculate_beach_score(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_beach_score(beach_pool_quality integer) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  IF beach_pool_quality IS NULL THEN
    RETURN 0;
  END IF;
  RETURN beach_pool_quality * 10; -- 1-10 scale → 0-100 scale
END;
$$;


ALTER FUNCTION public.calculate_beach_score(beach_pool_quality integer) OWNER TO postgres;

--
-- Name: FUNCTION calculate_beach_score(beach_pool_quality integer); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.calculate_beach_score(beach_pool_quality integer) IS 'Convert 1-10 beach quality rating to 0-100 score';


--
-- Name: calculate_final_score(uuid, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_final_score(dest_id uuid, holiday_id uuid) RETURNS integer
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
  -- Get destination data
  SELECT * INTO dest FROM destinations WHERE id = dest_id;

  IF NOT FOUND THEN
    RETURN 0;
  END IF;

  -- Calculate component scores
  weather_sc := calculate_weather_score(dest_id, holiday_id);
  flight_sc := calculate_flight_score(dest.flight_hours);
  beach_sc := calculate_beach_score(dest.beach_pool_quality);
  kids_sc := calculate_kid_facilities_score(dest.kid_facilities_quality);
  luxury_sc := calculate_luxury_score(dest.high_star_share);

  -- Calculate weighted final score
  -- Weights: Weather 30%, Flight 25%, Beach 15%, Kids 15%, Luxury 15%
  final_sc := (
    (weather_sc * 0.30) +
    (flight_sc * 0.25) +
    (beach_sc * 0.15) +
    (kids_sc * 0.15) +
    (luxury_sc * 0.15)
  );

  RETURN ROUND(final_sc);
END;
$$;


ALTER FUNCTION public.calculate_final_score(dest_id uuid, holiday_id uuid) OWNER TO postgres;

--
-- Name: FUNCTION calculate_final_score(dest_id uuid, holiday_id uuid); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.calculate_final_score(dest_id uuid, holiday_id uuid) IS 'Calculate weighted final score: Weather 30%, Flight 25%, Beach 15%, Kids 15%, Luxury 15%';


--
-- Name: calculate_flight_score(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_flight_score(flight_hours numeric) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  RETURN CASE
    WHEN flight_hours IS NULL THEN 0
    WHEN flight_hours <= 2 THEN 100
    WHEN flight_hours <= 4 THEN 90
    WHEN flight_hours <= 6 THEN 75
    WHEN flight_hours <= 8 THEN 60
    WHEN flight_hours <= 10 THEN 45
    WHEN flight_hours <= 12 THEN 30
    ELSE 15
  END;
END;
$$;


ALTER FUNCTION public.calculate_flight_score(flight_hours numeric) OWNER TO postgres;

--
-- Name: FUNCTION calculate_flight_score(flight_hours numeric); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.calculate_flight_score(flight_hours numeric) IS 'Calculate flight time score with gradual penalties (0-100)';


--
-- Name: calculate_kid_facilities_score(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_kid_facilities_score(kid_facilities_quality integer) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  IF kid_facilities_quality IS NULL THEN
    RETURN 0;
  END IF;
  RETURN kid_facilities_quality * 10; -- 1-10 scale → 0-100 scale
END;
$$;


ALTER FUNCTION public.calculate_kid_facilities_score(kid_facilities_quality integer) OWNER TO postgres;

--
-- Name: FUNCTION calculate_kid_facilities_score(kid_facilities_quality integer); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.calculate_kid_facilities_score(kid_facilities_quality integer) IS 'Convert 1-10 kid facilities rating to 0-100 score';


--
-- Name: calculate_luxury_score(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_luxury_score(high_star_share numeric) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  IF high_star_share IS NULL THEN
    RETURN 0;
  END IF;
  RETURN ROUND(high_star_share); -- Percentage directly maps to 0-100 score
END;
$$;


ALTER FUNCTION public.calculate_luxury_score(high_star_share numeric) OWNER TO postgres;

--
-- Name: FUNCTION calculate_luxury_score(high_star_share numeric); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.calculate_luxury_score(high_star_share numeric) IS 'Use high star share percentage as luxury score';


--
-- Name: calculate_weather_score(uuid, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_weather_score(dest_id uuid, holiday_id uuid) RETURNS integer
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
  holiday_start_month INTEGER;
  holiday_end_month INTEGER;
  avg_temp_high DECIMAL;
  avg_rainfall DECIMAL;
  temp_score INTEGER;
  rainfall_score INTEGER;
BEGIN
  -- Get months for holiday period
  SELECT EXTRACT(MONTH FROM start_date), EXTRACT(MONTH FROM end_date)
  INTO holiday_start_month, holiday_end_month
  FROM holiday_periods WHERE id = holiday_id;

  -- Get average climate data using temperature_high (daytime high is what matters for beach holidays)
  SELECT
    COALESCE(AVG(temperature_high), AVG(temperature_celsius)),
    AVG(rainfall_mm)
  INTO avg_temp_high, avg_rainfall
  FROM climate_data
  WHERE destination_id = dest_id
    AND month IN (holiday_start_month, holiday_end_month);

  -- If no data, return 0
  IF avg_temp_high IS NULL THEN
    RETURN 0;
  END IF;

  -- Temperature scoring based on daytime high (ideal for beach: 24-30°C)
  -- Updated scoring curve for daytime highs:
  -- 24-30°C = Perfect beach weather (100 points)
  -- 20-24°C or 30-32°C = Good (80 points)
  -- 16-20°C or 32-35°C = Acceptable (60 points)
  -- Below 16°C or above 35°C = Too cold/hot (20 points)
  temp_score := CASE
    WHEN avg_temp_high >= 24 AND avg_temp_high <= 30 THEN 100
    WHEN (avg_temp_high >= 20 AND avg_temp_high < 24) OR (avg_temp_high > 30 AND avg_temp_high <= 32) THEN 80
    WHEN (avg_temp_high >= 16 AND avg_temp_high < 20) OR (avg_temp_high > 32 AND avg_temp_high <= 35) THEN 60
    ELSE 20
  END;

  -- Rainfall scoring: <50mm = 100 points (remains unchanged)
  rainfall_score := CASE
    WHEN avg_rainfall < 50 THEN 100
    WHEN avg_rainfall < 100 THEN 80
    WHEN avg_rainfall < 150 THEN 60
    ELSE 20
  END;

  RETURN ROUND((temp_score + rainfall_score) / 2.0);
END;
$$;


ALTER FUNCTION public.calculate_weather_score(dest_id uuid, holiday_id uuid) OWNER TO postgres;

--
-- Name: FUNCTION calculate_weather_score(dest_id uuid, holiday_id uuid); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.calculate_weather_score(dest_id uuid, holiday_id uuid) IS 'Calculates weather score using temperature_high (daytime) for more accurate beach holiday recommendations. Ideal daytime high: 24-30°C. Rainfall penalties apply above 50mm.';


--
-- Name: trigger_recalculate_all_scores(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_recalculate_all_scores() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  dest RECORD;
BEGIN
  -- Loop through all destinations and recalculate scores
  FOR dest IN SELECT id FROM destinations LOOP
    PERFORM update_all_scores_for_destination(dest.id);
  END LOOP;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_recalculate_all_scores() OWNER TO postgres;

--
-- Name: trigger_update_climate_scores(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_update_climate_scores() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM update_all_scores_for_destination(NEW.destination_id);
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_update_climate_scores() OWNER TO postgres;

--
-- Name: trigger_update_destination_scores(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_update_destination_scores() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM update_all_scores_for_destination(NEW.id);
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_update_destination_scores() OWNER TO postgres;

--
-- Name: trigger_update_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_update_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_update_timestamp() OWNER TO postgres;

--
-- Name: update_all_scores_for_destination(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_all_scores_for_destination(dest_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  holiday RECORD;
  weather_sc INTEGER;
  flight_sc INTEGER;
  beach_sc INTEGER;
  kids_sc INTEGER;
  luxury_sc INTEGER;
  final_sc INTEGER;
BEGIN
  -- Get destination data
  DECLARE
    dest RECORD;
  BEGIN
    SELECT * INTO dest FROM destinations WHERE id = dest_id;
    IF NOT FOUND THEN
      RETURN; -- Destination doesn't exist, nothing to update
    END IF;
  END;

  -- Loop through all holiday periods and calculate scores
  FOR holiday IN SELECT id FROM holiday_periods LOOP
    -- Calculate component scores
    weather_sc := calculate_weather_score(dest_id, holiday.id);
    flight_sc := calculate_flight_score((SELECT flight_hours FROM destinations WHERE id = dest_id));
    beach_sc := calculate_beach_score((SELECT beach_pool_quality FROM destinations WHERE id = dest_id));
    kids_sc := calculate_kid_facilities_score((SELECT kid_facilities_quality FROM destinations WHERE id = dest_id));
    luxury_sc := calculate_luxury_score((SELECT high_star_share FROM destinations WHERE id = dest_id));
    final_sc := calculate_final_score(dest_id, holiday.id);

    -- Upsert score record (insert or update if exists)
    INSERT INTO scores (
      destination_id,
      holiday_period_id,
      weather_score,
      flight_score,
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
      beach_score = EXCLUDED.beach_score,
      kid_facilities_score = EXCLUDED.kid_facilities_score,
      luxury_score = EXCLUDED.luxury_score,
      final_score = EXCLUDED.final_score,
      calculated_at = NOW();
  END LOOP;
END;
$$;


ALTER FUNCTION public.update_all_scores_for_destination(dest_id uuid) OWNER TO postgres;

--
-- Name: FUNCTION update_all_scores_for_destination(dest_id uuid); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.update_all_scores_for_destination(dest_id uuid) IS 'Recalculate and update scores for all holiday periods for a given destination';


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: climate_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.climate_data (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    destination_id uuid NOT NULL,
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
    CONSTRAINT climate_data_temperature_low_check CHECK (((temperature_low >= ('-50'::integer)::numeric) AND (temperature_low <= (60)::numeric)))
);


ALTER TABLE public.climate_data OWNER TO postgres;

--
-- Name: TABLE climate_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.climate_data IS 'Monthly climate averages (temperature and rainfall) for each destination';


--
-- Name: COLUMN climate_data.month; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.climate_data.month IS 'Month number (1=January, 12=December)';


--
-- Name: COLUMN climate_data.temperature_celsius; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.climate_data.temperature_celsius IS 'Average temperature in Celsius (mean of high and low)';


--
-- Name: COLUMN climate_data.rainfall_mm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.climate_data.rainfall_mm IS 'Average monthly rainfall in millimeters';


--
-- Name: COLUMN climate_data.temperature_high; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.climate_data.temperature_high IS 'Average daily high temperature in Celsius (daytime)';


--
-- Name: COLUMN climate_data.temperature_low; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.climate_data.temperature_low IS 'Average daily low temperature in Celsius (nighttime)';


--
-- Name: destinations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.destinations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    country text NOT NULL,
    region text NOT NULL,
    type text,
    flight_hours numeric NOT NULL,
    time_difference integer,
    visa_required text,
    currency text,
    language text,
    budget_level text,
    best_months text,
    worst_months text,
    high_star_share numeric,
    beach_pool_quality integer NOT NULL,
    kid_facilities_quality integer NOT NULL,
    notes text,
    visited boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT destinations_beach_pool_quality_check CHECK (((beach_pool_quality >= 1) AND (beach_pool_quality <= 10))),
    CONSTRAINT destinations_budget_level_check CHECK ((budget_level = ANY (ARRAY['Budget'::text, 'Mid-Range'::text, 'Luxury'::text, 'Ultra-Luxury'::text]))),
    CONSTRAINT destinations_flight_hours_check CHECK (((flight_hours >= (0)::numeric) AND (flight_hours <= (24)::numeric))),
    CONSTRAINT destinations_high_star_share_check CHECK (((high_star_share >= (0)::numeric) AND (high_star_share <= (100)::numeric))),
    CONSTRAINT destinations_kid_facilities_quality_check CHECK (((kid_facilities_quality >= 1) AND (kid_facilities_quality <= 10))),
    CONSTRAINT destinations_region_check CHECK ((region = ANY (ARRAY['Europe'::text, 'Asia'::text, 'Americas'::text, 'Africa'::text, 'Oceania'::text]))),
    CONSTRAINT destinations_time_difference_check CHECK (((time_difference >= '-12'::integer) AND (time_difference <= 14))),
    CONSTRAINT destinations_type_check CHECK ((type = ANY (ARRAY['Beach'::text, 'City'::text, 'Mountain'::text, 'Nature'::text, 'Mixed'::text]))),
    CONSTRAINT destinations_visa_required_check CHECK ((visa_required = ANY (ARRAY['Yes'::text, 'No'::text, 'EVisa'::text])))
);


ALTER TABLE public.destinations OWNER TO postgres;

--
-- Name: TABLE destinations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.destinations IS 'Holiday destinations with ratings and logistics info';


--
-- Name: COLUMN destinations.flight_hours; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.destinations.flight_hours IS 'Flight time from London in hours';


--
-- Name: COLUMN destinations.high_star_share; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.destinations.high_star_share IS 'Percentage of 4/5-star hotels (0-100)';


--
-- Name: COLUMN destinations.beach_pool_quality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.destinations.beach_pool_quality IS 'Beach/pool quality rating (1-10 scale)';


--
-- Name: COLUMN destinations.kid_facilities_quality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.destinations.kid_facilities_quality IS 'Kid facilities rating (1-10 scale)';


--
-- Name: holiday_periods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holiday_periods (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    year integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT holiday_periods_check CHECK ((end_date > start_date))
);


ALTER TABLE public.holiday_periods OWNER TO postgres;

--
-- Name: TABLE holiday_periods; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.holiday_periods IS 'School holiday periods for family trips';


--
-- Name: COLUMN holiday_periods.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.holiday_periods.name IS 'Holiday name (e.g., "Christmas 2025", "Easter 2026")';


--
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    destination_id uuid NOT NULL,
    holiday_period_id uuid NOT NULL,
    weather_score integer NOT NULL,
    flight_score integer NOT NULL,
    beach_score integer NOT NULL,
    kid_facilities_score integer NOT NULL,
    luxury_score integer NOT NULL,
    final_score integer NOT NULL,
    calculated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT scores_beach_score_check CHECK (((beach_score >= 0) AND (beach_score <= 100))),
    CONSTRAINT scores_final_score_check CHECK (((final_score >= 0) AND (final_score <= 100))),
    CONSTRAINT scores_flight_score_check CHECK (((flight_score >= 0) AND (flight_score <= 100))),
    CONSTRAINT scores_kid_facilities_score_check CHECK (((kid_facilities_score >= 0) AND (kid_facilities_score <= 100))),
    CONSTRAINT scores_luxury_score_check CHECK (((luxury_score >= 0) AND (luxury_score <= 100))),
    CONSTRAINT scores_weather_score_check CHECK (((weather_score >= 0) AND (weather_score <= 100)))
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- Name: TABLE scores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.scores IS 'Calculated scores for each destination-holiday period combination';


--
-- Name: COLUMN scores.weather_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.scores.weather_score IS 'Weather score (0-100) based on temperature and rainfall';


--
-- Name: COLUMN scores.flight_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.scores.flight_score IS 'Flight time score (0-100) with gradual penalty curve';


--
-- Name: COLUMN scores.beach_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.scores.beach_score IS 'Beach/pool quality score (0-100)';


--
-- Name: COLUMN scores.kid_facilities_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.scores.kid_facilities_score IS 'Kid facilities quality score (0-100)';


--
-- Name: COLUMN scores.luxury_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.scores.luxury_score IS 'Hotel quality score (0-100) based on high star share %';


--
-- Name: COLUMN scores.final_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.scores.final_score IS 'Weighted final score: Weather 30%, Flight 25%, Beach 15%, Kids 15%, Luxury 15%';


--
-- Name: user_shortlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_shortlists (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    destination_id uuid NOT NULL,
    holiday_period_id uuid NOT NULL,
    status text NOT NULL,
    notes text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT user_shortlists_status_check CHECK ((status = ANY (ARRAY['candidate'::text, 'chosen'::text, 'dismissed'::text])))
);


ALTER TABLE public.user_shortlists OWNER TO postgres;

--
-- Name: TABLE user_shortlists; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.user_shortlists IS 'User shortlists: candidate/chosen/dismissed per holiday period';


--
-- Name: COLUMN user_shortlists.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_shortlists.user_id IS 'User who created this shortlist entry';


--
-- Name: COLUMN user_shortlists.destination_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_shortlists.destination_id IS 'Destination being shortlisted';


--
-- Name: COLUMN user_shortlists.holiday_period_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_shortlists.holiday_period_id IS 'Holiday period context for this shortlist entry';


--
-- Name: COLUMN user_shortlists.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_shortlists.status IS 'Status: candidate (considering), chosen (final choice), dismissed (not interested)';


--
-- Name: COLUMN user_shortlists.notes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_shortlists.notes IS 'Personal notes about this destination for this holiday';


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: seed_files; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.seed_files (
    path text NOT NULL,
    hash text NOT NULL
);


ALTER TABLE supabase_migrations.seed_files OWNER TO postgres;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	e3f95f6a-37ef-4537-aea6-5cd5d93984b3	{"action":"user_confirmation_requested","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-22 11:10:57.184573+00	
00000000-0000-0000-0000-000000000000	e14d88ae-e548-4b33-ac8e-5f3021ce0a90	{"action":"user_signedup","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-22 11:11:05.395254+00	
00000000-0000-0000-0000-000000000000	1019fc4a-77fd-4059-a4be-35c2e7bd1d10	{"action":"login","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 11:11:17.297889+00	
00000000-0000-0000-0000-000000000000	2bf374a0-f480-4ef8-bf80-fbd4986037f9	{"action":"login","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 14:26:09.487642+00	
00000000-0000-0000-0000-000000000000	d7fd96fb-82d9-463b-98e9-3113859f0b87	{"action":"token_refreshed","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 16:07:23.329258+00	
00000000-0000-0000-0000-000000000000	56eac92b-336a-485f-a7b1-b3c88926bb86	{"action":"token_revoked","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 16:07:23.343061+00	
00000000-0000-0000-0000-000000000000	cd94c2d8-1c87-4bb4-942a-d5b13515ae1e	{"action":"token_refreshed","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 21:36:25.632102+00	
00000000-0000-0000-0000-000000000000	9f874331-b84b-4bc2-a0c6-b489fdbc173f	{"action":"token_revoked","actor_id":"791459a2-c35d-447a-a941-61686132800c","actor_username":"jnyross@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 21:36:25.643703+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
74df3c40-e76a-495a-8b4d-6fc4117d25f7	791459a2-c35d-447a-a941-61686132800c	06c26035-149a-48ff-bf28-161292145632	s256	NfA1C3dqLIUQAcn0jautucf1-vJyQ8eQZBDHQP3a5J8	email			2025-10-22 11:10:57.191497+00	2025-10-22 11:11:05.408149+00	email/signup	2025-10-22 11:11:05.408098+00
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
791459a2-c35d-447a-a941-61686132800c	791459a2-c35d-447a-a941-61686132800c	{"sub": "791459a2-c35d-447a-a941-61686132800c", "email": "jnyross@gmail.com", "email_verified": true, "phone_verified": false}	email	2025-10-22 11:10:57.164893+00	2025-10-22 11:10:57.165556+00	2025-10-22 11:10:57.165556+00	9c4f4f2f-8f70-4fc4-9fb8-2f3a2aa78921
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
ecc9e81a-1610-403e-af3d-65cb0cf98685	2025-10-22 11:11:17.32318+00	2025-10-22 11:11:17.32318+00	password	857148dc-c5e9-4ebe-a88f-7acf9de8bad5
3be31e59-31a4-485b-bf15-f34c35fbf979	2025-10-22 14:26:09.555009+00	2025-10-22 14:26:09.555009+00	password	903a582d-532f-4af3-840e-4880bf628673
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	2	m4o6erhpp6vs	791459a2-c35d-447a-a941-61686132800c	t	2025-10-22 14:26:09.533061+00	2025-10-22 16:07:23.34488+00	\N	3be31e59-31a4-485b-bf15-f34c35fbf979
00000000-0000-0000-0000-000000000000	3	jocei3nh6h4w	791459a2-c35d-447a-a941-61686132800c	f	2025-10-22 16:07:23.35756+00	2025-10-22 16:07:23.35756+00	m4o6erhpp6vs	3be31e59-31a4-485b-bf15-f34c35fbf979
00000000-0000-0000-0000-000000000000	1	wgi6civju7ty	791459a2-c35d-447a-a941-61686132800c	t	2025-10-22 11:11:17.311892+00	2025-10-22 21:36:25.646048+00	\N	ecc9e81a-1610-403e-af3d-65cb0cf98685
00000000-0000-0000-0000-000000000000	4	zsosmfxq3gif	791459a2-c35d-447a-a941-61686132800c	f	2025-10-22 21:36:25.655881+00	2025-10-22 21:36:25.655881+00	wgi6civju7ty	ecc9e81a-1610-403e-af3d-65cb0cf98685
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id) FROM stdin;
3be31e59-31a4-485b-bf15-f34c35fbf979	791459a2-c35d-447a-a941-61686132800c	2025-10-22 14:26:09.510812+00	2025-10-22 16:07:23.380407+00	\N	aal1	\N	2025-10-22 16:07:23.379189	node	18.175.48.21	\N	\N
ecc9e81a-1610-403e-af3d-65cb0cf98685	791459a2-c35d-447a-a941-61686132800c	2025-10-22 11:11:17.299972+00	2025-10-22 21:36:25.6719+00	\N	aal1	\N	2025-10-22 21:36:25.670565	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	212.170.220.67	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	791459a2-c35d-447a-a941-61686132800c	authenticated	authenticated	jnyross@gmail.com	$2a$10$tPfBIOmS2azWU5bn1Y35n.tqGuZMC7FqufZqq.SdGVo31lnwdEx6i	2025-10-22 11:11:05.396991+00	\N		2025-10-22 11:10:57.205229+00		\N			\N	2025-10-22 14:26:09.510134+00	{"provider": "email", "providers": ["email"]}	{"sub": "791459a2-c35d-447a-a941-61686132800c", "email": "jnyross@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-10-22 11:10:57.117673+00	2025-10-22 21:36:25.663621+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: climate_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.climate_data (id, destination_id, month, temperature_celsius, rainfall_mm, created_at, temperature_high, temperature_low) FROM stdin;
48f4934f-9786-4cbf-a380-5a37e8a45ade	fd5455a1-8f35-40e4-84f5-5cab30de8bea	2	9	61	2025-10-22 08:26:53.838077	15	4
951c499f-8cd4-4787-a3ad-74a60731385d	fd5455a1-8f35-40e4-84f5-5cab30de8bea	4	15	27	2025-10-22 08:26:59.571537	20	10
1c1cec82-ad65-4ca5-9b8a-c39d7d27bc0e	fd5455a1-8f35-40e4-84f5-5cab30de8bea	5	18	88	2025-10-22 08:27:03.700668	22	13
95f76e14-b10f-4dbd-9ecc-a36af3a03526	fd5455a1-8f35-40e4-84f5-5cab30de8bea	6	23	65	2025-10-22 08:27:29.408943	27	19
5f8b8f28-626c-4ada-b714-0e4a653f170b	fd5455a1-8f35-40e4-84f5-5cab30de8bea	7	26	17	2025-10-22 08:27:41.957121	30	21
6c12ce6f-f8b6-43a8-842d-80fdedc04690	fd5455a1-8f35-40e4-84f5-5cab30de8bea	9	22	57	2025-10-22 08:27:43.016442	27	18
99ccb546-4be6-46a9-a96a-32fa7b854655	fd5455a1-8f35-40e4-84f5-5cab30de8bea	10	20	76	2025-10-22 08:27:43.285504	25	16
98850998-c230-4e17-954a-75092637b657	fd5455a1-8f35-40e4-84f5-5cab30de8bea	11	15	18	2025-10-22 08:27:43.522989	20	10
4b00d109-4aa4-4f1a-bda3-400b6615e6ac	fd5455a1-8f35-40e4-84f5-5cab30de8bea	12	10	8	2025-10-22 08:27:43.796901	17	5
5b4975f7-bcb6-4a75-b4b8-548b993589e5	9c2f029b-d332-44c6-9942-291b958ee22b	2	27	12	2025-10-22 08:27:52.53654	28	27
2d3c15ab-8baf-47ca-9d52-4eba835acc35	9c2f029b-d332-44c6-9942-291b958ee22b	3	27	224	2025-10-22 08:27:52.802754	28	26
089950ca-f8ed-4de8-a425-b6124b0d996c	9c2f029b-d332-44c6-9942-291b958ee22b	4	28	162	2025-10-22 08:27:53.066935	29	27
12def3c0-92da-4b99-a833-6d0569105cf2	9c2f029b-d332-44c6-9942-291b958ee22b	5	28	317	2025-10-22 08:27:53.367929	29	27
bdb34fb4-ee7a-443f-829a-d2b5ad65fa07	9c2f029b-d332-44c6-9942-291b958ee22b	7	28	140	2025-10-22 08:27:53.94603	29	27
9dd60621-0a7d-4559-83b8-c0cb9c5564ac	9c2f029b-d332-44c6-9942-291b958ee22b	8	28	116	2025-10-22 08:27:55.5512	29	27
8fb98d4f-f956-4c73-8ecb-3bbafef14d2f	9c2f029b-d332-44c6-9942-291b958ee22b	9	28	252	2025-10-22 08:27:55.849101	29	27
1d12ecf6-dcb7-4b18-8d1c-e273690c63f2	9c2f029b-d332-44c6-9942-291b958ee22b	10	28	196	2025-10-22 08:27:56.090767	29	27
6d8218ae-681e-46b1-aa3f-23d67a7fdbc1	9c2f029b-d332-44c6-9942-291b958ee22b	12	28	380	2025-10-22 08:27:58.744163	29	27
ec2e98ce-325e-476b-a997-bdb6ffd95c68	d6094b52-39aa-43bd-8fca-511fc8a9432c	1	19	55	2025-10-22 08:27:58.990283	24	15
fc90e7e8-0c47-482d-8de3-24004aaa37c6	d6094b52-39aa-43bd-8fca-511fc8a9432c	2	21	0	2025-10-22 08:27:59.225852	28	16
86b8cbfb-b1d6-416c-a301-752323c4ee3b	d6094b52-39aa-43bd-8fca-511fc8a9432c	3	24	2	2025-10-22 08:28:00.442966	30	19
987b54df-3f9d-4c23-ac69-34e1a6b57975	d6094b52-39aa-43bd-8fca-511fc8a9432c	5	31	0	2025-10-22 08:28:04.799725	38	24
603fa2b1-8cc8-4986-8244-f31df425d7eb	d6094b52-39aa-43bd-8fca-511fc8a9432c	6	34	0	2025-10-22 08:28:07.517382	41	28
9cce898c-40a0-4c86-a5ad-55d655f21ee3	d6094b52-39aa-43bd-8fca-511fc8a9432c	7	36	0	2025-10-22 08:28:08.032666	43	31
44bb6ab2-a931-425b-97c9-9f1d83dd3ada	d6094b52-39aa-43bd-8fca-511fc8a9432c	8	36	0	2025-10-22 08:28:08.440378	43	31
ca565759-a5fe-41b4-8f8d-3cecdeb4363a	d6094b52-39aa-43bd-8fca-511fc8a9432c	10	30	9	2025-10-22 08:28:10.993552	37	25
2dc15b70-52fe-4d13-a9c7-1d6732d45ecb	d6094b52-39aa-43bd-8fca-511fc8a9432c	11	26	14	2025-10-22 08:28:12.471962	32	21
d5ea499d-8543-4eba-8ec5-c38d579756aa	d6094b52-39aa-43bd-8fca-511fc8a9432c	12	22	0	2025-10-22 08:28:12.737522	28	17
d7db6370-6ad8-4ff4-8c6a-025045c24405	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	1	0	80	2025-10-22 08:37:24.679555	3	-2
87eea501-e00b-425c-86bb-51465a8ad681	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	3	-1	82	2025-10-22 08:37:24.922182	3	-5
0e26d6a7-7bd7-4694-8d0b-e49a1f8c530f	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	4	4	20	2025-10-22 08:37:25.045896	10	0
cc92525a-5421-4147-9c4b-85c9b817c8ea	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	5	11	46	2025-10-22 08:37:25.151657	16	5
2ec103e0-9b8d-4b90-91a5-e21191aa9f3a	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	6	17	51	2025-10-22 08:37:25.271958	22	11
e34f3033-6d82-43ca-966f-4938a0c61281	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	8	16	99	2025-10-22 08:37:25.478261	19	14
27a047f3-7643-4ed7-a982-79ceddd7a46a	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	9	15	50	2025-10-22 08:37:25.590038	19	12
df86178b-0a2b-4241-828b-dc1937712216	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	10	7	70	2025-10-22 08:37:25.708992	9	5
57980684-41b2-4556-8620-f6f91ad81680	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	11	1	86	2025-10-22 08:37:25.819158	3	0
69b8cba9-d7db-4ece-8880-1feb10e9ffea	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	12	-2	58	2025-10-22 08:37:25.931764	0	-5
4af1c11a-b776-425e-9d6c-4877f921e1d7	71d8e9dc-afd7-42b7-8211-140c424dd010	2	3	37	2025-10-22 08:37:27.93961	5	1
47df28f1-2dc4-4f4e-9b4e-ab19751fa501	71d8e9dc-afd7-42b7-8211-140c424dd010	3	4	75	2025-10-22 08:37:28.050916	6	1
948d51b7-b1f7-437e-9777-7113bb06d9da	71d8e9dc-afd7-42b7-8211-140c424dd010	4	7	25	2025-10-22 08:37:28.163886	10	4
f8f71c7a-e57d-4949-b215-c007deacd074	71d8e9dc-afd7-42b7-8211-140c424dd010	5	12	12	2025-10-22 08:37:28.281474	15	8
902979e2-0ad9-47ca-af5e-13ce0f119010	71d8e9dc-afd7-42b7-8211-140c424dd010	7	17	95	2025-10-22 08:37:28.50224	20	14
ed04c507-b20c-4951-bd61-29a5eced3e5e	71d8e9dc-afd7-42b7-8211-140c424dd010	8	17	124	2025-10-22 08:37:28.617464	19	15
73c79bc2-835f-4757-94de-260ad04e6c7c	71d8e9dc-afd7-42b7-8211-140c424dd010	9	17	21	2025-10-22 08:37:28.730764	20	15
4436af47-526a-4c0a-9212-876020a370da	71d8e9dc-afd7-42b7-8211-140c424dd010	10	11	113	2025-10-22 08:37:28.837204	13	9
e27e6892-fb15-4872-94a1-70c8b8132256	71d8e9dc-afd7-42b7-8211-140c424dd010	12	3	71	2025-10-22 08:37:29.053734	5	2
5b3f1e17-90f1-4690-bb89-b1dc8ec4d72a	07575d0e-9875-487e-89b2-9736ff43952d	1	-2	130	2025-10-22 08:37:30.907964	0	-5
c2a28736-fcfc-40ef-9c7b-84ee28b9a571	07575d0e-9875-487e-89b2-9736ff43952d	2	-1	44	2025-10-22 08:37:31.017811	3	-4
10a56adc-c061-4639-9e99-77d4f1b89e23	07575d0e-9875-487e-89b2-9736ff43952d	3	-1	78	2025-10-22 08:37:31.135371	2	-5
93ae0e81-2605-44ed-9ebd-75db2dd59f92	07575d0e-9875-487e-89b2-9736ff43952d	4	5	156	2025-10-22 08:37:31.266636	9	0
e91ec0ad-267f-4e93-8bf1-5bb4229f2730	07575d0e-9875-487e-89b2-9736ff43952d	6	19	54	2025-10-22 08:37:31.525387	24	13
eb650f91-9483-4985-b565-78be1ef3fc56	07575d0e-9875-487e-89b2-9736ff43952d	7	16	190	2025-10-22 08:37:31.689877	19	13
ffdfa172-8170-470d-a796-589671b05423	07575d0e-9875-487e-89b2-9736ff43952d	8	16	265	2025-10-22 08:37:31.818413	19	13
bbc2587b-6814-4ba1-a92c-ac486c66b246	07575d0e-9875-487e-89b2-9736ff43952d	9	14	146	2025-10-22 08:37:31.935517	17	11
d447afb5-0c7a-45ce-ae6a-73bffe31f84f	07575d0e-9875-487e-89b2-9736ff43952d	11	0	78	2025-10-22 08:37:32.150679	1	-2
3ee14ab7-ef59-4684-a2da-7da0d3ab74c6	07575d0e-9875-487e-89b2-9736ff43952d	12	-5	63	2025-10-22 08:37:32.260231	-3	-8
83506360-dccf-4fa1-b3d8-ad516b518969	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	1	-1	103	2025-10-22 08:37:34.093469	1	-2
523a6a1c-f857-4998-a2e8-ed6211d34966	2104f32a-c752-4132-ba7c-be5c16783703	3	15	51	2025-10-22 08:26:43.318994	19	11
ed809371-183a-4d8c-b3c5-d1c64bfdeb46	2104f32a-c752-4132-ba7c-be5c16783703	4	17	38	2025-10-22 08:26:47.073524	21	13
b3c7f5ac-0efe-40c6-ba42-9a57533d6843	2104f32a-c752-4132-ba7c-be5c16783703	5	20	21	2025-10-22 08:26:47.54987	24	16
981725bb-27aa-4527-9884-7b2a0f824203	2104f32a-c752-4132-ba7c-be5c16783703	6	23	8	2025-10-22 08:26:47.82297	27	19
ddea2851-f333-4d4b-b057-dc29878e50ef	2104f32a-c752-4132-ba7c-be5c16783703	8	26	4	2025-10-22 08:26:49.189487	30	22
d9682f4b-17ff-43f0-a1f0-764cb8ecbe26	2104f32a-c752-4132-ba7c-be5c16783703	9	24	16	2025-10-22 08:26:49.63596	28	20
75623f71-8a29-414a-9a5d-0a065a26e1fe	2104f32a-c752-4132-ba7c-be5c16783703	10	20	67	2025-10-22 08:26:49.87857	24	16
8d8828e6-7672-44ec-86cb-f9a47d080d89	2104f32a-c752-4132-ba7c-be5c16783703	11	16	90	2025-10-22 08:26:50.137519	19	12
a7d5e6b3-8727-4873-891d-1a718081cd97	94eae822-75c8-4ab6-9a19-60ea2be42719	1	12	76	2025-10-22 08:27:44.040326	15	9
ecd70f61-6522-43c4-afac-9ef6ae6c3aa7	94eae822-75c8-4ab6-9a19-60ea2be42719	2	12	60	2025-10-22 08:27:44.264081	15	9
bdb19bc3-51ea-4524-8891-f6c47499ef80	94eae822-75c8-4ab6-9a19-60ea2be42719	3	14	48	2025-10-22 08:27:45.285238	17	11
ce93dd65-999c-421c-be97-2d98849cb00a	94eae822-75c8-4ab6-9a19-60ea2be42719	4	18	23	2025-10-22 08:27:46.062682	21	14
506c6976-c00f-402b-9029-cce1657c8238	94eae822-75c8-4ab6-9a19-60ea2be42719	6	26	5	2025-10-22 08:27:46.531174	29	22
330cd215-74a1-47d8-b2e7-f587ab8ff194	94eae822-75c8-4ab6-9a19-60ea2be42719	7	28	2	2025-10-22 08:27:46.805724	31	25
0ae018f0-60c1-44dc-8269-966795ae4231	94eae822-75c8-4ab6-9a19-60ea2be42719	8	28	3	2025-10-22 08:27:47.425293	32	25
eb689055-d9d8-46fd-9d9b-a97be2e8c070	94eae822-75c8-4ab6-9a19-60ea2be42719	9	25	20	2025-10-22 08:27:48.799719	28	22
6c1fc7fb-f0d8-43cc-95eb-c96b5c5a5f93	94eae822-75c8-4ab6-9a19-60ea2be42719	11	17	59	2025-10-22 08:27:51.688495	20	14
029d1118-f204-4053-a8dc-155b4cad74cc	94eae822-75c8-4ab6-9a19-60ea2be42719	12	14	82	2025-10-22 08:27:51.910898	17	11
0e49ed96-c0f7-425e-8ad1-b78c41173d07	2104f32a-c752-4132-ba7c-be5c16783703	1	12	78	2025-10-22 08:26:42.692111	16	8
ac73a052-2f3f-4c33-9dbf-ee84ccfc76af	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	3	-1	74	2025-10-22 08:37:34.31783	1	-3
16efeba3-9050-47af-8a13-689e62194b44	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	5	8	31	2025-10-22 08:37:34.591893	10	6
a88a6bfb-e988-4b90-ae33-cee246678176	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	6	14	24	2025-10-22 08:37:34.708208	16	12
4b6a1aa8-25de-4261-92e1-a8f69ddda531	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	7	15	74	2025-10-22 08:37:34.814849	17	14
cc6fcf9b-b5d8-4a09-84a9-3c9d4d9cb1a2	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	8	17	108	2025-10-22 08:37:34.920152	18	16
d53c7a28-0c90-4cfb-8334-e5a429794d5f	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	10	7	123	2025-10-22 08:37:35.150676	8	5
f6be739c-2928-44f0-bf5d-aeccbf00fe39	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	11	2	95	2025-10-22 08:37:35.280583	3	0
aa04613a-9fd0-444b-849e-c6c7718df697	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	12	-2	68	2025-10-22 08:37:35.400214	-1	-4
86a528e1-ad98-47d4-a793-613192db139d	78c34395-9186-472b-b93a-58fc587ca0f3	1	-4	160	2025-10-22 08:37:37.258302	-1	-7
135a48fe-775b-417f-a81c-3f83246c2b56	78c34395-9186-472b-b93a-58fc587ca0f3	3	-2	43	2025-10-22 08:37:37.473298	1	-5
71b88df9-c811-4a53-9718-6f5a4a57c1b0	78c34395-9186-472b-b93a-58fc587ca0f3	4	5	199	2025-10-22 08:37:37.582045	7	2
af73f672-2c15-4d8c-b7ba-b8bec2a80039	78c34395-9186-472b-b93a-58fc587ca0f3	5	7	227	2025-10-22 08:37:37.705271	9	4
086a3d25-8cb6-4052-93de-632e1d1902a5	78c34395-9186-472b-b93a-58fc587ca0f3	6	10	160	2025-10-22 08:37:37.827449	12	7
2ec0e8a0-58ec-4b71-8b83-cfdc685030bd	78c34395-9186-472b-b93a-58fc587ca0f3	8	12	82	2025-10-22 08:37:38.076287	15	9
8ce7f083-4eca-4a42-a6d4-baacc4a783ba	78c34395-9186-472b-b93a-58fc587ca0f3	9	8	132	2025-10-22 08:37:38.189379	11	6
a58b7ced-639f-42d8-b9e9-e466b33a6c61	78c34395-9186-472b-b93a-58fc587ca0f3	10	5	212	2025-10-22 08:37:38.300235	7	2
1be90f2f-f1bd-4f36-8ebc-df147ab989ee	78c34395-9186-472b-b93a-58fc587ca0f3	11	2	84	2025-10-22 08:37:38.418895	4	0
540894e7-e5c8-49a0-b21f-21f5dae3da91	78c34395-9186-472b-b93a-58fc587ca0f3	12	-3	145	2025-10-22 08:37:38.520715	0	-5
10213fbb-8a29-4d82-ad28-badde1ba4df8	7b066287-4fd7-4149-bb8b-9c59096a664d	2	7	42	2025-10-22 08:37:40.492203	9	4
0c15e663-44a5-45e6-8e56-784894a6da11	7b066287-4fd7-4149-bb8b-9c59096a664d	3	5	104	2025-10-22 08:37:40.640487	8	3
7553e87b-7d21-4a20-8e68-dd77dd28409a	7b066287-4fd7-4149-bb8b-9c59096a664d	4	8	69	2025-10-22 08:37:40.743544	11	4
3e54be17-0dee-4d16-a9c2-3b8d8afab550	7b066287-4fd7-4149-bb8b-9c59096a664d	5	11	48	2025-10-22 08:37:40.848149	15	8
f6d64e7b-d5c1-41d8-96d3-0fc9dd4910d1	7b066287-4fd7-4149-bb8b-9c59096a664d	7	15	143	2025-10-22 08:37:41.125622	18	12
1fa8933c-aab4-4f28-8b12-3502d0900171	7b066287-4fd7-4149-bb8b-9c59096a664d	8	15	70	2025-10-22 08:37:41.247283	18	12
93b2598d-57f2-496c-80d0-39c9e939ab81	7b066287-4fd7-4149-bb8b-9c59096a664d	9	14	112	2025-10-22 08:37:41.352498	18	11
6264038b-e7d5-43a8-92ed-8a17c6aae9c3	7b066287-4fd7-4149-bb8b-9c59096a664d	10	10	180	2025-10-22 08:37:41.455998	13	8
21026e79-7f65-4632-bc78-92c68bed774e	7b066287-4fd7-4149-bb8b-9c59096a664d	12	6	148	2025-10-22 08:37:41.66945	8	3
83b2a991-17df-4ff9-8baa-80404862f1eb	95691984-3e58-4dec-9640-01c57ab9ac8a	1	16	40	2025-10-22 08:37:43.582748	22	11
b9f26bdf-5cca-4e29-bfca-0ff07eabf612	95691984-3e58-4dec-9640-01c57ab9ac8a	2	19	34	2025-10-22 08:37:43.718744	25	14
cf8cd035-b1ab-4f52-86b6-d99a1b42a9fb	95691984-3e58-4dec-9640-01c57ab9ac8a	3	20	64	2025-10-22 08:37:43.82485	26	15
32398ee9-22c7-4c2b-bc7d-8dc62ea7d635	95691984-3e58-4dec-9640-01c57ab9ac8a	5	24	87	2025-10-22 08:37:44.045784	30	19
f9a7591f-62c8-4b0a-9521-5ae56340327f	95691984-3e58-4dec-9640-01c57ab9ac8a	6	26	173	2025-10-22 08:37:44.182664	31	22
fe2cf53b-6b5c-42de-9bae-af63d3c10084	95691984-3e58-4dec-9640-01c57ab9ac8a	7	28	135	2025-10-22 08:37:44.290463	33	24
e711519a-dd5a-40d1-beb9-08447d8345e7	95691984-3e58-4dec-9640-01c57ab9ac8a	8	29	101	2025-10-22 08:37:44.421979	34	25
8fe257c7-50ae-4387-897d-dfc1679cfb78	95691984-3e58-4dec-9640-01c57ab9ac8a	10	22	78	2025-10-22 08:37:44.645509	28	18
2d078706-8c8c-4d10-9aac-a93ac2c9ff1d	95691984-3e58-4dec-9640-01c57ab9ac8a	11	19	80	2025-10-22 08:37:44.754357	24	14
6cc0c680-71e9-4b83-820d-4f2433cfb63d	95691984-3e58-4dec-9640-01c57ab9ac8a	12	16	101	2025-10-22 08:37:44.862413	20	12
c692fc26-4b80-4ed4-ab2a-bd46977b8d4e	280ef307-84b2-4a03-b406-90255c159d25	1	6	75	2025-10-22 08:37:46.71923	9	4
b7502f81-6142-469a-96c3-ae02b5ca61a5	280ef307-84b2-4a03-b406-90255c159d25	3	7	120	2025-10-22 08:37:46.962901	10	5
0dcb86b9-6d8c-43f1-8b7a-19550be4de6e	280ef307-84b2-4a03-b406-90255c159d25	4	9	97	2025-10-22 08:37:47.08135	13	6
c9fb00c9-ac5f-4069-bd7d-29e0bac4afc4	280ef307-84b2-4a03-b406-90255c159d25	5	13	36	2025-10-22 08:37:47.203227	17	9
9ecb6501-1411-49a1-a016-31d4dcd1e6eb	280ef307-84b2-4a03-b406-90255c159d25	6	17	60	2025-10-22 08:37:47.336172	21	13
fe963efc-d219-48b5-8668-a560f9d13180	280ef307-84b2-4a03-b406-90255c159d25	8	16	102	2025-10-22 08:37:47.629728	19	13
c77181ea-981a-4898-a4d6-c8f47c0baf8a	280ef307-84b2-4a03-b406-90255c159d25	9	16	124	2025-10-22 08:37:47.855101	19	12
0fb79d0e-f79d-4d57-98af-c2941b6eb0c0	280ef307-84b2-4a03-b406-90255c159d25	10	12	146	2025-10-22 08:37:47.971072	15	9
09eb5178-3d71-46e2-a3a6-b8e1b93e1550	280ef307-84b2-4a03-b406-90255c159d25	11	8	71	2025-10-22 08:37:48.099239	10	6
1da3fc92-1cf0-4cf9-a413-8d917ea72d9f	3a95aac2-b3ce-4810-af20-37bab52b15df	1	7	110	2025-10-22 08:37:50.014504	9	4
9d375582-a863-4663-a541-891bcf80dc40	3a95aac2-b3ce-4810-af20-37bab52b15df	2	8	38	2025-10-22 08:37:50.119878	11	6
6e794bcc-282a-4c1c-a430-0dca1597016e	3a95aac2-b3ce-4810-af20-37bab52b15df	3	8	204	2025-10-22 08:37:50.223866	11	5
cd14c819-29f5-4f72-a504-c546167a545a	3a95aac2-b3ce-4810-af20-37bab52b15df	4	10	69	2025-10-22 08:37:50.346105	13	7
a9209add-69ba-405a-9c7f-24e4bbe3d107	3a95aac2-b3ce-4810-af20-37bab52b15df	6	17	79	2025-10-22 08:37:50.575684	20	13
26394c02-ea2e-42cf-ac18-2c966c09d8b9	3a95aac2-b3ce-4810-af20-37bab52b15df	7	15	187	2025-10-22 08:37:50.6975	19	12
473fda37-0aaa-4734-b6b6-ade8861376be	3a95aac2-b3ce-4810-af20-37bab52b15df	8	16	146	2025-10-22 08:37:50.802531	19	13
c5cb5939-cfab-405b-aa76-5ceaf79bc57f	3a95aac2-b3ce-4810-af20-37bab52b15df	9	15	176	2025-10-22 08:37:50.910553	19	12
0b105161-0435-4f26-b1a1-2f19aece723a	3a95aac2-b3ce-4810-af20-37bab52b15df	11	9	88	2025-10-22 08:37:51.147446	11	6
5c37c8e5-6f80-4bc2-94f9-87751b31b734	3a95aac2-b3ce-4810-af20-37bab52b15df	12	8	151	2025-10-22 08:37:51.259668	10	6
c9895788-b675-469e-8fae-29158c68ebc1	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	1	6	144	2025-10-22 08:37:53.075477	8	3
2f043ac1-960b-4106-a2ee-c4aa1d0ef78a	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	2	6	36	2025-10-22 08:37:53.188126	9	3
79bf1439-6a62-49ed-a6b9-b3eeef83c4a9	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	4	8	98	2025-10-22 08:37:53.463321	12	5
2e6ec4a5-3fa8-4b6e-8c42-59d3cb3aa5d7	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	5	13	82	2025-10-22 08:37:53.586021	17	9
b19df3ff-b1c5-4693-a455-a81f749e795a	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	6	18	10	2025-10-22 08:37:53.709259	23	14
7181bd2c-3d16-4321-8f2d-213f30f592f0	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	7	18	145	2025-10-22 08:37:53.813689	21	15
3cb3fe15-6c4f-4e6a-9927-454261b64af5	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	9	18	64	2025-10-22 08:37:54.058397	22	14
454c82ef-b47d-4ba1-918a-b63d818ec854	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	10	13	177	2025-10-22 08:37:54.250593	16	11
b0fc734f-66be-48bc-973e-bb41c726d8fd	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	11	8	149	2025-10-22 08:37:54.361173	10	6
b96f4e08-b347-48e3-b226-9453373e3b64	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	12	6	129	2025-10-22 08:37:54.482117	8	4
f64ccc6b-5e5f-481f-85da-fc2ae4ad15e2	05abad90-6ae1-49df-84c2-1dfae020140d	2	5	12	2025-10-22 08:37:56.510164	9	2
4a1e7fe5-a3f4-4817-b6b6-735e53444773	05abad90-6ae1-49df-84c2-1dfae020140d	3	7	128	2025-10-22 08:37:56.658876	11	4
6aedb840-c800-4277-9723-a074de4ad7d2	05abad90-6ae1-49df-84c2-1dfae020140d	4	9	80	2025-10-22 08:37:56.784308	13	5
a1d73b42-5708-4422-84b8-990f5945d615	05abad90-6ae1-49df-84c2-1dfae020140d	5	13	68	2025-10-22 08:37:56.893131	18	9
cb0d21b3-f492-4483-8668-21122e2c7fb4	05abad90-6ae1-49df-84c2-1dfae020140d	7	19	108	2025-10-22 08:37:57.132696	23	15
0ef71e53-9ecf-40fa-a82e-d07612b7b225	05abad90-6ae1-49df-84c2-1dfae020140d	8	18	67	2025-10-22 08:37:57.244474	22	14
41990b7f-541b-47a4-b7a1-00beb2c75b8e	05abad90-6ae1-49df-84c2-1dfae020140d	9	19	89	2025-10-22 08:37:57.348707	24	14
7dac5e9a-cd7d-4912-8c81-4c4a1628a7b6	05abad90-6ae1-49df-84c2-1dfae020140d	10	14	119	2025-10-22 08:37:57.461388	17	11
f09772bd-b7fd-49b3-b413-308d1a51c651	05abad90-6ae1-49df-84c2-1dfae020140d	12	7	85	2025-10-22 08:37:57.738534	9	5
9ce3053d-acc5-4717-8f1f-5bc83c3d9510	ea431f38-c1da-433b-ba90-51bd7fee1a3e	1	6	66	2025-10-22 08:37:59.610222	8	4
ab6ae176-c368-4fe6-bf9e-c50b1cac228f	ea431f38-c1da-433b-ba90-51bd7fee1a3e	2	6	8	2025-10-22 08:37:59.727827	10	3
bd748672-0636-4789-9ac9-fd88f4e7a1bb	ea431f38-c1da-433b-ba90-51bd7fee1a3e	4	10	80	2025-10-22 08:37:59.942674	14	6
fca659b3-893c-437c-b95c-ae1b46c927d3	ea431f38-c1da-433b-ba90-51bd7fee1a3e	6	21	59	2025-10-22 08:38:00.187465	27	15
2a836bbf-3325-4112-ad4b-8494aba2a084	ea431f38-c1da-433b-ba90-51bd7fee1a3e	7	21	100	2025-10-22 08:38:00.291363	25	16
2b1d9c44-0261-415a-a66b-37a8f9af427f	ea431f38-c1da-433b-ba90-51bd7fee1a3e	8	20	128	2025-10-22 08:38:00.411124	24	16
8bb59b2e-e85d-48b5-8f71-4cca73fa9bf3	ea431f38-c1da-433b-ba90-51bd7fee1a3e	9	20	71	2025-10-22 08:38:00.525774	25	15
7744ea8b-e944-441c-9db7-999b9a4526a2	ea431f38-c1da-433b-ba90-51bd7fee1a3e	11	9	106	2025-10-22 08:38:00.747872	12	7
b2d45e1d-d452-4673-ad6e-5fbcb9985e6a	ea431f38-c1da-433b-ba90-51bd7fee1a3e	12	8	83	2025-10-22 08:38:00.856726	10	5
d6dd0b7d-ef65-44cd-9c3f-8c822084fed9	1137f046-8540-4bac-9bee-86851f1484ab	1	5	53	2025-10-22 08:38:03.372402	8	2
483bf790-9dbe-455c-92e8-c45d2dfd680c	1137f046-8540-4bac-9bee-86851f1484ab	2	5	6	2025-10-22 08:38:03.479006	10	1
ea7357ca-1fe6-4fe3-9c85-cc2126e8d123	1137f046-8540-4bac-9bee-86851f1484ab	4	11	72	2025-10-22 08:38:03.701205	16	7
1567b85c-b5c3-420c-b6a5-1d13ee49c3bb	1137f046-8540-4bac-9bee-86851f1484ab	5	16	94	2025-10-22 08:38:03.836507	21	12
b3f8b874-0663-4543-bcfa-1dd952372db9	1137f046-8540-4bac-9bee-86851f1484ab	6	22	87	2025-10-22 08:38:03.949689	28	16
2f63560f-e026-45d7-90cd-7bebe047e83a	1137f046-8540-4bac-9bee-86851f1484ab	7	24	76	2025-10-22 08:38:04.072928	29	18
0a073dbe-2fa0-4946-b152-eba2d6354c7e	1137f046-8540-4bac-9bee-86851f1484ab	9	21	89	2025-10-22 08:38:04.324437	27	15
d396dbc1-3182-4455-8fce-b0bcffcf791b	1137f046-8540-4bac-9bee-86851f1484ab	10	16	159	2025-10-22 08:38:04.447714	21	12
0cb6db54-ec5d-4348-86e5-f654dec38b49	1137f046-8540-4bac-9bee-86851f1484ab	11	8	88	2025-10-22 08:38:04.576219	12	5
e87d07ad-cdf2-4561-a1b3-14a1fd77f274	1137f046-8540-4bac-9bee-86851f1484ab	12	6	92	2025-10-22 08:38:04.702047	9	3
5b3433ca-5919-4652-bda8-ef90c7514912	ae4bfff9-b173-44c7-b911-07148be73b72	2	9	13	2025-10-22 08:38:06.766006	13	5
ddfa24bf-ab3f-461f-ac7a-cec901bb5ed6	ae4bfff9-b173-44c7-b911-07148be73b72	3	13	12	2025-10-22 08:38:06.956687	17	9
504a46d4-8fe9-4eda-ba03-7c6d9e628467	ae4bfff9-b173-44c7-b911-07148be73b72	4	15	30	2025-10-22 08:38:07.087892	19	10
b0fa32b9-3373-4314-8294-348b0e9d5f1e	ae4bfff9-b173-44c7-b911-07148be73b72	5	18	82	2025-10-22 08:38:07.201717	22	15
4baf12a8-97e4-4181-ab4c-16072be6eff1	ae4bfff9-b173-44c7-b911-07148be73b72	7	26	11	2025-10-22 08:38:07.429135	29	21
ad27fad1-a8dc-45ce-a728-d7830ceae831	ae4bfff9-b173-44c7-b911-07148be73b72	8	25	61	2025-10-22 08:38:07.548627	29	21
6bfb0eef-3244-4092-8bfc-b3be615f8095	ae4bfff9-b173-44c7-b911-07148be73b72	9	22	42	2025-10-22 08:38:07.672446	26	18
98efa141-3f13-4ca9-9259-210ab80c55d5	ae4bfff9-b173-44c7-b911-07148be73b72	10	19	117	2025-10-22 08:38:07.787755	23	15
d597b45c-4574-4e86-a348-d2b2b4cc6634	ae4bfff9-b173-44c7-b911-07148be73b72	12	10	79	2025-10-22 08:38:08.01694	14	6
74ac0865-d69d-48d9-84cd-16549b36d5d9	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	1	7	123	2025-10-22 08:38:09.864259	10	4
1581b8f7-6d3b-4f22-9c6d-49eec182bf8a	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	2	6	43	2025-10-22 08:38:09.982495	12	2
18b52e74-4895-41ce-9706-35903889d5fc	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	3	11	101	2025-10-22 08:38:10.112311	16	7
46b4a190-d010-49a4-878d-ab672e7e91d9	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	5	17	73	2025-10-22 08:38:10.351671	22	12
83bfd8d0-73e5-4ec6-9f07-17611ff2f77d	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	6	21	181	2025-10-22 08:38:10.467653	27	17
bc3c66c2-3d06-4af7-8295-3fbfb48dfd96	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	7	21	34	2025-10-22 08:38:10.579232	27	17
5490d7f2-30d0-4866-ac0a-f9a1d5f9c792	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	8	22	70	2025-10-22 08:38:10.689352	27	17
643d9018-82c9-42b7-bc54-367fb01a7147	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	10	17	159	2025-10-22 08:38:11.075361	22	12
ea11eb6d-8c49-47f7-b7ec-2a9d0a80bd51	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	11	11	232	2025-10-22 08:38:11.225686	14	8
7119343e-c54d-4e88-a210-ab1de9a85e47	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	12	9	114	2025-10-22 08:38:11.34609	12	6
5f9f8a24-2d49-4d20-953b-e85b5b663dbe	538f180b-716f-4539-96e4-e47d79a02d86	1	3	40	2025-10-22 08:38:13.280145	5	0
008777b2-c9f7-4a88-a55e-2c4b4a429f64	538f180b-716f-4539-96e4-e47d79a02d86	3	6	67	2025-10-22 08:38:13.520646	11	2
6c8fe420-85dd-4aac-9c86-83b464fb0bff	538f180b-716f-4539-96e4-e47d79a02d86	4	7	110	2025-10-22 08:38:13.629976	11	3
1e70f32e-693a-4d86-bb32-e0149ca0abe7	538f180b-716f-4539-96e4-e47d79a02d86	5	13	108	2025-10-22 08:38:13.740059	18	8
51e00d0c-930b-478a-9de5-5c08ceebbff6	538f180b-716f-4539-96e4-e47d79a02d86	6	19	32	2025-10-22 08:38:13.852624	24	13
715c8f38-529f-4af2-9062-5526f67e003d	538f180b-716f-4539-96e4-e47d79a02d86	8	19	185	2025-10-22 08:38:14.07796	24	15
a1b2836c-fa5d-4a14-ac55-9789b4b13c8d	538f180b-716f-4539-96e4-e47d79a02d86	9	17	54	2025-10-22 08:38:14.196031	23	12
a92740e5-b232-4d5b-ab9f-445c8cece0f8	538f180b-716f-4539-96e4-e47d79a02d86	10	13	56	2025-10-22 08:38:14.309713	18	8
c5192db7-0792-4fe7-88b8-3848822976e3	538f180b-716f-4539-96e4-e47d79a02d86	11	5	189	2025-10-22 08:38:14.430675	9	2
59a52b45-0a2b-4669-83e8-b2f894187859	f1af3688-db90-4f1b-a893-ceb12e4abebf	1	4	68	2025-10-22 08:38:16.448607	6	2
8e03ce34-f6d7-43da-8fcf-b84de32f33fe	f1af3688-db90-4f1b-a893-ceb12e4abebf	2	3	47	2025-10-22 08:38:16.577111	6	-1
5db5e23c-90d6-4810-809d-27ab4f4611a0	f1af3688-db90-4f1b-a893-ceb12e4abebf	3	5	87	2025-10-22 08:38:16.720559	10	2
393b96d0-71e3-4c5f-8a52-c1279c30d5eb	f1af3688-db90-4f1b-a893-ceb12e4abebf	4	8	48	2025-10-22 08:38:16.831325	12	3
babd23ef-80ea-4abc-92e9-075c069c6bb4	f1af3688-db90-4f1b-a893-ceb12e4abebf	6	19	82	2025-10-22 08:38:17.096163	24	14
e4bbbfd0-922f-43a3-82bc-05511b51de9b	f1af3688-db90-4f1b-a893-ceb12e4abebf	7	20	90	2025-10-22 08:38:17.212638	25	15
c2cce19e-ead5-4b73-8b96-260ca93589a5	f1af3688-db90-4f1b-a893-ceb12e4abebf	8	20	88	2025-10-22 08:38:17.332606	24	16
259adde0-97ae-4522-b226-29b330033d7d	f1af3688-db90-4f1b-a893-ceb12e4abebf	9	19	14	2025-10-22 08:38:17.451624	25	13
c631425a-1a85-495c-9f8a-bef4df85cf88	f1af3688-db90-4f1b-a893-ceb12e4abebf	11	6	74	2025-10-22 08:38:17.684779	8	3
7dec70fa-5bab-47d7-993f-ef0d96ac6704	f1af3688-db90-4f1b-a893-ceb12e4abebf	12	4	126	2025-10-22 08:38:17.800756	5	2
f6c31c45-84aa-403a-8b7e-24691c20d5dc	034e97c9-6c2e-4e8d-a2f6-045add3f3533	1	5	94	2025-10-22 08:38:19.62192	7	3
b258557d-a5ea-4ad4-8612-b3720399e017	034e97c9-6c2e-4e8d-a2f6-045add3f3533	2	4	51	2025-10-22 08:38:19.738271	7	1
9e7dce6a-8d1d-4e52-9adb-8b7e4ebff31c	034e97c9-6c2e-4e8d-a2f6-045add3f3533	4	8	58	2025-10-22 08:38:19.976835	12	3
a7ec480e-039b-4476-921f-01e31315ce5e	034e97c9-6c2e-4e8d-a2f6-045add3f3533	5	13	23	2025-10-22 08:38:20.090168	18	8
723ec4a2-135d-4ecd-87b5-868aba68b158	034e97c9-6c2e-4e8d-a2f6-045add3f3533	6	19	54	2025-10-22 08:38:20.209114	24	13
0429b69b-13ee-4033-879a-536e738dc133	034e97c9-6c2e-4e8d-a2f6-045add3f3533	7	18	143	2025-10-22 08:38:20.317168	22	14
e9310ab5-2ccd-4c5e-85cd-4dabe3b4ca03	034e97c9-6c2e-4e8d-a2f6-045add3f3533	9	18	32	2025-10-22 08:38:20.553014	23	13
26f6c6e7-d00b-47f1-b9c2-b32d0fb6066c	034e97c9-6c2e-4e8d-a2f6-045add3f3533	10	12	164	2025-10-22 08:38:20.674661	15	9
fd63a1f8-4d1f-410e-b29c-5f1ad802f026	034e97c9-6c2e-4e8d-a2f6-045add3f3533	11	6	106	2025-10-22 08:38:20.783871	8	4
7f646de0-3fff-4bf0-8f4a-6e45a3377180	034e97c9-6c2e-4e8d-a2f6-045add3f3533	12	4	130	2025-10-22 08:38:20.950639	6	2
0bf8dd2a-a6c3-4c0c-9443-373f5aefca1c	968d1662-490e-408e-941d-d03e11ebc507	2	4	41	2025-10-22 08:38:22.911776	8	1
79b4063e-4efb-4950-ae67-89d0a7895188	968d1662-490e-408e-941d-d03e11ebc507	3	7	17	2025-10-22 08:38:23.030705	12	3
deffdafe-dd6c-403c-ab82-9ae267d3d926	968d1662-490e-408e-941d-d03e11ebc507	4	9	129	2025-10-22 08:38:23.145789	13	5
ded0afce-ce1c-4414-9372-867c561aa615	968d1662-490e-408e-941d-d03e11ebc507	5	14	84	2025-10-22 08:38:23.261926	19	10
43b7b9d1-c409-4427-8202-9708ebd2e71a	968d1662-490e-408e-941d-d03e11ebc507	7	23	36	2025-10-22 08:38:23.499042	28	18
7baa788f-40d5-4521-8a47-07411f008e0b	968d1662-490e-408e-941d-d03e11ebc507	8	22	70	2025-10-22 08:38:23.634595	26	17
3ccc39ab-ba48-4487-bf5a-2e5147731b48	968d1662-490e-408e-941d-d03e11ebc507	9	20	45	2025-10-22 08:38:23.751182	26	14
ca48a277-2f38-4881-9a55-11b5821f88b4	968d1662-490e-408e-941d-d03e11ebc507	10	14	54	2025-10-22 08:38:23.865683	20	10
6cf2e6af-c584-4462-88a5-444507093316	968d1662-490e-408e-941d-d03e11ebc507	12	4	81	2025-10-22 08:38:24.089174	7	1
18b97fb9-ec53-4ea2-8f2b-faf1024af310	7862827c-77e1-4e97-a2d6-61adacef3cb0	1	2	86	2025-10-22 08:38:27.159602	6	-2
c83a80c7-4bbb-43ee-927f-213533758e34	7862827c-77e1-4e97-a2d6-61adacef3cb0	2	3	90	2025-10-22 08:38:27.278261	8	-1
6de35cb4-a622-4369-a677-12a6fd11e44a	7862827c-77e1-4e97-a2d6-61adacef3cb0	3	6	101	2025-10-22 08:38:27.392622	12	2
e20824d5-9bba-4447-af87-648b269a218f	7862827c-77e1-4e97-a2d6-61adacef3cb0	5	13	159	2025-10-22 08:38:27.619192	18	9
90ff7618-6808-4c9a-876c-7e5a4fd9b044	7862827c-77e1-4e97-a2d6-61adacef3cb0	7	21	96	2025-10-22 08:38:27.860881	26	15
9a0d36a7-1a04-4eab-b7dd-13d59cc9f398	7862827c-77e1-4e97-a2d6-61adacef3cb0	8	19	275	2025-10-22 08:38:27.970159	25	15
fb53800d-c5a3-44d0-862e-1b013df7846a	7862827c-77e1-4e97-a2d6-61adacef3cb0	9	18	36	2025-10-22 08:38:28.085896	23	13
5c9e8958-1204-438b-aa6f-cafb39036d7a	7862827c-77e1-4e97-a2d6-61adacef3cb0	10	13	70	2025-10-22 08:38:28.206251	19	8
bd58b436-7d64-4422-a60f-45ac97d91ab1	7862827c-77e1-4e97-a2d6-61adacef3cb0	12	3	178	2025-10-22 08:38:28.459168	7	-1
9d11383d-7a8c-466c-a6f3-1c8545f15555	f5409693-946e-47c5-8f04-0babe818f750	1	4	39	2025-10-22 08:38:30.297661	6	1
6eb785ad-c3df-430f-a90e-cdf82ef2e326	f5409693-946e-47c5-8f04-0babe818f750	2	3	36	2025-10-22 08:38:30.416206	7	0
5cce30ec-3ac6-4c32-9e17-c666bec41eda	f5409693-946e-47c5-8f04-0babe818f750	3	6	55	2025-10-22 08:38:30.544183	11	2
7fda5484-4db5-4554-8542-937108b3a93c	f5409693-946e-47c5-8f04-0babe818f750	5	15	33	2025-10-22 08:38:30.773326	20	9
3a1f140b-aee3-4239-b0df-d66081398747	f5409693-946e-47c5-8f04-0babe818f750	6	20	75	2025-10-22 08:38:30.902922	25	14
9c53ae98-5633-4c91-bb2d-80e2217a94c6	f5409693-946e-47c5-8f04-0babe818f750	7	23	60	2025-10-22 08:38:31.019135	28	17
9f9d2f53-4739-4e12-96a9-836cb4e3e9cc	f5409693-946e-47c5-8f04-0babe818f750	8	21	113	2025-10-22 08:38:31.137535	25	16
41f0dd9a-ca0e-4e3e-9e4f-787232336f35	f5409693-946e-47c5-8f04-0babe818f750	10	14	71	2025-10-22 08:38:31.394405	18	10
6b318909-81f5-40be-9738-20479ee88276	f5409693-946e-47c5-8f04-0babe818f750	11	6	88	2025-10-22 08:38:31.508848	9	4
aa37e74a-1ee6-4114-99c4-b577e09245cf	f5409693-946e-47c5-8f04-0babe818f750	12	4	103	2025-10-22 08:38:31.62482	6	1
f9981b9b-a6fa-4634-84b4-40e95dda9d94	4995c976-3d3a-441a-9521-2d21b9e6d231	1	4	98	2025-10-22 08:38:33.502678	7	1
234314a8-262c-4467-93d3-7be3f3ffe313	4995c976-3d3a-441a-9521-2d21b9e6d231	3	7	45	2025-10-22 08:38:33.731273	13	3
b2fc1119-7c80-4529-8f93-ec48de799bbe	4995c976-3d3a-441a-9521-2d21b9e6d231	4	10	58	2025-10-22 08:38:33.864589	15	6
7a1bdf65-6a0a-4fe4-b813-9556c53bea8d	4995c976-3d3a-441a-9521-2d21b9e6d231	5	16	129	2025-10-22 08:38:33.98246	21	12
6121d7dd-b4a0-49c5-b11a-8382ec55da14	4995c976-3d3a-441a-9521-2d21b9e6d231	6	20	82	2025-10-22 08:38:34.205079	25	16
d2ef8ba2-fa3a-45d6-8d69-425b6216ae79	4995c976-3d3a-441a-9521-2d21b9e6d231	8	23	108	2025-10-22 08:38:34.460165	29	18
91f68ff1-988e-4111-ada4-687a5d8d938c	4995c976-3d3a-441a-9521-2d21b9e6d231	9	20	52	2025-10-22 08:38:34.585535	26	15
267c355a-34db-4824-ae99-def13bfc0f1b	4995c976-3d3a-441a-9521-2d21b9e6d231	10	14	83	2025-10-22 08:38:34.701454	20	10
0a45b40e-8808-4f33-ae53-bbd32b77d014	4995c976-3d3a-441a-9521-2d21b9e6d231	11	6	96	2025-10-22 08:38:34.8216	10	3
54d1bfe6-749d-4700-b292-89cf3d2f4d81	78486986-b3e9-49d4-b1e4-9113a38b21ed	1	3	74	2025-10-22 08:38:36.758317	5	0
bd81a537-4366-4cb2-84f7-b45f7bae05c4	78486986-b3e9-49d4-b1e4-9113a38b21ed	2	2	67	2025-10-22 08:38:36.870925	5	-2
33d213bd-bebb-4104-b16b-8377ff732d1b	78486986-b3e9-49d4-b1e4-9113a38b21ed	3	6	44	2025-10-22 08:38:36.982733	11	1
9d4422ad-48c3-4844-95d8-186d9dcf8824	78486986-b3e9-49d4-b1e4-9113a38b21ed	4	8	71	2025-10-22 08:38:37.106175	12	3
5dc023c9-45de-4370-8272-aae159471cac	78486986-b3e9-49d4-b1e4-9113a38b21ed	6	18	44	2025-10-22 08:38:37.342975	23	13
461641de-4df4-4123-b28a-b17ab6ed235b	78486986-b3e9-49d4-b1e4-9113a38b21ed	7	21	121	2025-10-22 08:38:37.452759	26	15
ca3745b2-60b2-4a7c-a542-6076e8459ff1	78486986-b3e9-49d4-b1e4-9113a38b21ed	8	21	77	2025-10-22 08:38:37.564803	26	16
c2d6ddd7-35c9-463c-b660-78289c595ef0	78486986-b3e9-49d4-b1e4-9113a38b21ed	9	18	86	2025-10-22 08:38:37.681796	23	13
2fe9bf81-3531-4e51-a659-5354cabc6f7b	78486986-b3e9-49d4-b1e4-9113a38b21ed	11	5	80	2025-10-22 08:38:37.916573	8	2
9923ae98-df18-4b27-89de-114f1c7224d3	78486986-b3e9-49d4-b1e4-9113a38b21ed	12	2	77	2025-10-22 08:38:38.045755	4	-1
6607ac60-4eda-4716-bdc6-7bfe02549325	58006810-48b3-4b09-9e4a-cce139f122d3	1	3	64	2025-10-22 08:38:39.927321	5	1
1bc6401c-f5c0-46ff-850f-7c20124e9272	58006810-48b3-4b09-9e4a-cce139f122d3	2	1	50	2025-10-22 08:38:40.055002	4	-2
3b3d7bc2-09e6-43c4-bd60-a78bc98fcac7	58006810-48b3-4b09-9e4a-cce139f122d3	3	4	49	2025-10-22 08:38:40.161661	9	0
97752a10-9227-46e4-84fa-4f41aa911cc1	58006810-48b3-4b09-9e4a-cce139f122d3	5	14	72	2025-10-22 08:38:40.386584	18	8
7720c9d0-9506-491d-be67-278e5dae831f	58006810-48b3-4b09-9e4a-cce139f122d3	6	18	46	2025-10-22 08:38:40.508843	23	13
b4b0fb36-7fc7-41f5-8815-37be0999f7e0	58006810-48b3-4b09-9e4a-cce139f122d3	7	21	62	2025-10-22 08:38:40.653281	26	15
08e106ad-5c65-495a-b1a3-c9776879affd	58006810-48b3-4b09-9e4a-cce139f122d3	8	21	89	2025-10-22 08:38:40.777605	26	16
702c1dfa-ac0e-41a5-9946-673d54df5265	58006810-48b3-4b09-9e4a-cce139f122d3	10	11	78	2025-10-22 08:38:41.090855	15	8
0e76f9f4-0f1c-4e77-ad3a-2562a2cbb8b9	58006810-48b3-4b09-9e4a-cce139f122d3	11	4	68	2025-10-22 08:38:41.267177	6	1
4fb59fcf-0035-49a5-87fb-a331181fcfa7	58006810-48b3-4b09-9e4a-cce139f122d3	12	1	75	2025-10-22 08:38:41.397137	3	-1
31a51639-80ba-4c24-9be6-68a6a7501e9b	c41bab8a-909c-46b3-9c7f-daba35f04b3e	1	3	58	2025-10-22 08:38:43.241609	5	0
94a95089-d97d-4fa3-ab9b-f3f60f2dbf78	c41bab8a-909c-46b3-9c7f-daba35f04b3e	3	7	120	2025-10-22 08:38:43.473221	11	2
be7504b4-dba8-4605-8677-0b5ac74f7eef	c41bab8a-909c-46b3-9c7f-daba35f04b3e	4	8	160	2025-10-22 08:38:43.603861	12	4
53e0da48-69ed-4b5f-a223-dda830e07e14	c41bab8a-909c-46b3-9c7f-daba35f04b3e	5	14	134	2025-10-22 08:38:43.715022	18	9
4d27b949-677b-443f-800a-df626bacd292	c41bab8a-909c-46b3-9c7f-daba35f04b3e	6	20	48	2025-10-22 08:38:43.824344	26	14
d9bfb94f-b00c-4954-8fd4-3a37608fe8e9	c41bab8a-909c-46b3-9c7f-daba35f04b3e	8	20	153	2025-10-22 08:38:44.05219	25	16
3e599b39-3483-4a5b-8d4d-ffd571e0426a	c41bab8a-909c-46b3-9c7f-daba35f04b3e	9	19	71	2025-10-22 08:38:44.168493	24	14
23b21a33-ea9d-4c75-8945-a6bc8e3a0f8a	c41bab8a-909c-46b3-9c7f-daba35f04b3e	10	13	106	2025-10-22 08:38:44.288895	18	9
a599e7bf-57ff-427c-9312-70af57c30805	c41bab8a-909c-46b3-9c7f-daba35f04b3e	11	6	232	2025-10-22 08:38:44.40893	9	3
c94b94b4-bcc3-4912-a3dc-43949b97f769	c41bab8a-909c-46b3-9c7f-daba35f04b3e	12	4	186	2025-10-22 08:38:44.528447	6	0
2f3809cc-300d-470c-b1da-9d72b8613cfa	dddcc5d6-25ef-46c9-9ac5-47d86806e102	2	4	8	2025-10-22 08:38:46.449863	9	0
48d41ebe-f60d-4866-bd39-885ad4ba93ce	dddcc5d6-25ef-46c9-9ac5-47d86806e102	3	7	125	2025-10-22 08:38:46.566364	12	3
e068c7ef-7768-445e-bf9f-ef8ad91345ce	dddcc5d6-25ef-46c9-9ac5-47d86806e102	4	9	105	2025-10-22 08:38:46.685473	14	5
966c3f60-27b5-4e61-9df0-4795eee957ea	dddcc5d6-25ef-46c9-9ac5-47d86806e102	5	15	72	2025-10-22 08:38:46.791416	19	11
e7512f74-506e-4824-9114-767fb87e77fa	dddcc5d6-25ef-46c9-9ac5-47d86806e102	7	22	118	2025-10-22 08:38:47.022503	28	17
9440d620-2f49-4daf-8d8e-f062064c3ef7	dddcc5d6-25ef-46c9-9ac5-47d86806e102	8	23	63	2025-10-22 08:38:47.138989	29	18
0ddd354c-0fc3-4e85-b6da-423f6c4773ec	dddcc5d6-25ef-46c9-9ac5-47d86806e102	9	20	92	2025-10-22 08:38:47.272132	25	15
4b6f80c6-6a47-478e-8f59-1201c21b96d5	dddcc5d6-25ef-46c9-9ac5-47d86806e102	10	15	188	2025-10-22 08:38:47.389024	19	11
215b372c-d676-47ca-ab0d-dba3b90eee7d	dddcc5d6-25ef-46c9-9ac5-47d86806e102	12	4	195	2025-10-22 08:38:47.6355	8	1
6fcaaad3-7dee-457e-879d-f817997eae90	b35896d8-a00b-4d6b-be31-215b59fae616	1	4	69	2025-10-22 08:38:49.828151	8	1
c2d366ee-8cd7-4cb7-abc8-8523b77bf470	b35896d8-a00b-4d6b-be31-215b59fae616	2	6	12	2025-10-22 08:38:49.948319	12	2
486e33e3-d615-42f0-91f8-79c2ecbcc3c1	b35896d8-a00b-4d6b-be31-215b59fae616	3	10	30	2025-10-22 08:38:50.067903	16	6
0bc0ee05-c5b3-422c-959f-069ef8a5cb56	b35896d8-a00b-4d6b-be31-215b59fae616	5	17	205	2025-10-22 08:38:50.299107	22	13
59fb9f91-48ec-420e-a04a-377c5beeb45e	b35896d8-a00b-4d6b-be31-215b59fae616	6	23	80	2025-10-22 08:38:50.420291	28	18
d069a20c-44e4-431c-b693-e5a3ae821551	b35896d8-a00b-4d6b-be31-215b59fae616	7	24	152	2025-10-22 08:38:50.545953	29	20
82dbc527-ea00-48e4-b415-dd40c0413b3f	b35896d8-a00b-4d6b-be31-215b59fae616	8	25	160	2025-10-22 08:38:50.659368	30	20
ad8ae842-808d-411e-81d1-a516d9f6e170	b35896d8-a00b-4d6b-be31-215b59fae616	10	16	203	2025-10-22 08:38:50.892365	21	13
a6a7d6d1-0ef4-4d25-a66b-c0ef91d9f797	b35896d8-a00b-4d6b-be31-215b59fae616	11	8	103	2025-10-22 08:38:51.003096	13	4
de4106b9-f273-4f5a-a642-4797d3668b9b	b35896d8-a00b-4d6b-be31-215b59fae616	12	5	59	2025-10-22 08:38:51.117068	9	2
5de82290-0429-49e1-9363-02deba57c6a3	f0c15c68-5571-4643-88ca-b66d92034063	1	6	92	2025-10-22 08:38:52.954918	9	3
ed0be877-a144-4e1e-a29e-a4219978d54d	f0c15c68-5571-4643-88ca-b66d92034063	3	10	33	2025-10-22 08:38:53.18635	15	6
9e5d4625-6390-46e9-881d-5e22b930bf18	f0c15c68-5571-4643-88ca-b66d92034063	4	12	96	2025-10-22 08:38:53.298383	16	8
5d0c66fd-1469-46d8-b38e-635c535eae0d	f0c15c68-5571-4643-88ca-b66d92034063	6	23	44	2025-10-22 08:38:53.525858	27	19
be3cd626-7607-40db-a85c-97db2c00d503	f0c15c68-5571-4643-88ca-b66d92034063	8	24	119	2025-10-22 08:38:53.772359	29	19
312a9e95-e5e9-48a7-91d8-6cc942af5001	f0c15c68-5571-4643-88ca-b66d92034063	9	22	30	2025-10-22 08:38:53.881162	27	17
0c2075f2-43ac-45e3-baf7-b36c62672fd7	f0c15c68-5571-4643-88ca-b66d92034063	10	17	136	2025-10-22 08:38:54.001855	22	13
6f5d3b04-a726-4ff9-998e-0cf63d210184	f0c15c68-5571-4643-88ca-b66d92034063	11	8	90	2025-10-22 08:38:54.151579	13	4
21e97a5a-6f85-41da-a765-e32141afee86	2b6552a5-7838-4bbf-aa5a-503f34ef8637	1	7	142	2025-10-22 08:38:56.099191	11	4
d1e21b4f-ad76-4eb9-aae9-4623ab8bb5f3	2b6552a5-7838-4bbf-aa5a-503f34ef8637	2	7	42	2025-10-22 08:38:56.205627	12	3
b4743deb-f8f6-40ca-9f9c-ce4fec2e7d97	2b6552a5-7838-4bbf-aa5a-503f34ef8637	3	11	56	2025-10-22 08:38:56.307018	16	7
2e5fad0f-3ec6-4229-98b2-4c0551a75795	2b6552a5-7838-4bbf-aa5a-503f34ef8637	4	13	51	2025-10-22 08:38:56.408809	18	7
b5766f11-10bf-4efb-b98b-43e76199fe9b	2b6552a5-7838-4bbf-aa5a-503f34ef8637	6	22	70	2025-10-22 08:38:56.678674	28	17
b6cf6602-b9a9-4c15-9fe9-0a4ee1fefc9f	2b6552a5-7838-4bbf-aa5a-503f34ef8637	7	26	16	2025-10-22 08:38:56.788738	33	20
74a191f8-eb76-4595-97e6-544e0a5efb3d	2b6552a5-7838-4bbf-aa5a-503f34ef8637	8	26	63	2025-10-22 08:38:56.907184	33	19
71e43259-bd52-43f9-a3bd-f52677334c84	2b6552a5-7838-4bbf-aa5a-503f34ef8637	9	22	34	2025-10-22 08:38:57.025542	29	17
4eeaea17-6743-48ef-afb5-c0fbf08748e7	2b6552a5-7838-4bbf-aa5a-503f34ef8637	11	11	216	2025-10-22 08:38:57.241545	16	7
ce19d3dc-6573-45d6-a09e-b2be26f303d7	2b6552a5-7838-4bbf-aa5a-503f34ef8637	12	8	83	2025-10-22 08:38:57.352107	13	4
cde971e2-c61e-48f4-a975-90a03feb5161	bd63a7eb-7275-4976-9597-d15f6ff96c1b	1	8	120	2025-10-22 08:38:59.176333	13	5
140e0d68-eeda-4005-89ea-571f9f255aad	bd63a7eb-7275-4976-9597-d15f6ff96c1b	2	8	46	2025-10-22 08:38:59.279403	14	3
1fcafe4a-7be2-4810-bf86-2a447f64afdb	bd63a7eb-7275-4976-9597-d15f6ff96c1b	4	13	75	2025-10-22 08:38:59.516138	18	8
d80ceb0e-db84-42b8-abdc-ef38d1afa78f	bd63a7eb-7275-4976-9597-d15f6ff96c1b	5	18	138	2025-10-22 08:38:59.632092	22	13
b4e687e7-3b65-442a-bc62-b450a7dd4b43	bd63a7eb-7275-4976-9597-d15f6ff96c1b	6	22	104	2025-10-22 08:38:59.749308	28	17
d2e0aabc-68c5-4a11-9019-26180dff021d	bd63a7eb-7275-4976-9597-d15f6ff96c1b	7	28	6	2025-10-22 08:38:59.857471	34	22
a5057e90-ef9e-4a3f-bbd2-6a1a48894662	bd63a7eb-7275-4976-9597-d15f6ff96c1b	9	23	17	2025-10-22 08:39:00.469635	30	18
5780042a-aa8f-4dff-a9e5-ace0a266b8a7	bd63a7eb-7275-4976-9597-d15f6ff96c1b	10	20	80	2025-10-22 08:39:00.578455	26	16
c79dbdb5-05a7-413d-b515-8ca50dc337e6	bd63a7eb-7275-4976-9597-d15f6ff96c1b	11	14	160	2025-10-22 08:39:00.766121	18	10
bc66f62b-1a98-4a62-a709-8ebf7a4bee02	bd63a7eb-7275-4976-9597-d15f6ff96c1b	12	10	29	2025-10-22 08:39:00.879843	15	7
0e9475a3-6e2a-464e-a3b7-72e7c28d8b58	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	2	9	44	2025-10-22 08:39:03.199093	14	5
e39d1589-1842-4344-b9a9-f0087ef94a69	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	3	12	66	2025-10-22 08:39:03.336036	16	9
9004997f-07a2-49cc-b0f9-ee5ec74ffb8d	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	4	13	108	2025-10-22 08:39:03.471643	17	10
d873195d-c4c4-4fce-b3f3-f80f1dc407d2	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	5	18	197	2025-10-22 08:39:03.595096	22	14
3f3da5c7-5307-4dc7-8d6e-a6a4bfeac536	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	7	27	28	2025-10-22 08:39:03.837491	31	23
78eb61d1-ca5a-4374-b470-4e4d61cf0e80	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	8	25	34	2025-10-22 08:39:03.961271	30	21
69a76d10-4576-493d-b11a-a16fce810ddf	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	9	24	50	2025-10-22 08:39:04.070177	29	19
bd8a9629-746d-4394-805b-c9ab20a7df3e	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	10	21	95	2025-10-22 08:39:04.185644	25	17
86b61d3b-7970-4bf9-8241-d0d50a02d4e7	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	12	12	65	2025-10-22 08:39:04.420878	15	9
dec5b11a-6a4d-41aa-af93-8de730ad4f9b	def70aeb-2af9-4e04-a014-d5d2bc0010a7	1	10	363	2025-10-22 08:39:06.481126	12	9
2fbf681c-8d6c-47a1-9ef6-016759a342f2	def70aeb-2af9-4e04-a014-d5d2bc0010a7	2	9	73	2025-10-22 08:39:06.934963	11	8
067ebda1-d1f1-4920-8d60-618d46ea00c0	def70aeb-2af9-4e04-a014-d5d2bc0010a7	3	11	128	2025-10-22 08:39:07.21146	12	10
bd115262-b34d-4608-87d6-5477c595e297	def70aeb-2af9-4e04-a014-d5d2bc0010a7	5	16	208	2025-10-22 08:39:07.551666	18	15
4e20ccd7-c105-400d-8e89-c4cf39479ac8	def70aeb-2af9-4e04-a014-d5d2bc0010a7	6	21	41	2025-10-22 08:39:07.747368	22	20
6bbda999-c6ef-4017-bb0b-a7d85469c0c7	def70aeb-2af9-4e04-a014-d5d2bc0010a7	7	25	26	2025-10-22 08:39:07.95928	26	24
42da1a9c-f9a3-486f-909b-5e7007d52559	def70aeb-2af9-4e04-a014-d5d2bc0010a7	8	23	47	2025-10-22 08:39:08.088236	25	22
2e45900a-48cc-40c5-9d22-4ad3f0b9a206	def70aeb-2af9-4e04-a014-d5d2bc0010a7	10	20	90	2025-10-22 08:39:08.294617	21	19
e163f302-fb3b-4311-9177-b6ffff8e3ff0	def70aeb-2af9-4e04-a014-d5d2bc0010a7	11	15	305	2025-10-22 08:39:08.398398	17	14
012159e5-6ccb-404b-984f-925549f171fd	def70aeb-2af9-4e04-a014-d5d2bc0010a7	12	12	96	2025-10-22 08:39:08.514002	13	11
e0725ab4-84fa-4e81-89eb-2fdb984dcca5	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	1	11	16	2025-10-22 08:39:10.34117	16	7
a691ba77-c88b-4352-9913-66df91ffdcb5	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	3	16	22	2025-10-22 08:39:10.572072	23	10
bfc88170-875a-45f3-aed1-ba5073e25a4f	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	4	22	2	2025-10-22 08:39:10.677378	30	15
63e94708-d1e9-4280-992a-c70ecc4d528e	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	5	22	41	2025-10-22 08:39:10.780886	29	17
1b11a38d-b384-4b79-ba3c-e0970fbc6257	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	6	27	44	2025-10-22 08:39:10.886657	34	20
22a08aa4-4772-41c8-86cf-b19ef8637fd2	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	8	31	0	2025-10-22 08:39:11.114239	40	23
9d63fd68-ea61-455d-a275-199fc2f2e9a3	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	9	24	61	2025-10-22 08:39:11.21892	30	18
f7a70d51-dd13-43d6-887c-1eb7d10c6a92	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	10	22	95	2025-10-22 08:39:11.333835	28	17
df7902f0-6cef-42ff-b027-e9870bd9c044	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	11	15	12	2025-10-22 08:39:11.438791	21	11
53182aa9-f88b-4b55-9eae-edbb7336aaa5	cbf0915e-da75-48b2-b85a-da06992d1b0b	1	5	22	2025-10-22 08:39:14.579121	10	1
57aeab7c-0589-48ed-8ca3-bc9876ba0536	cbf0915e-da75-48b2-b85a-da06992d1b0b	2	6	5	2025-10-22 08:39:14.694476	13	0
ad95ba2c-d7b9-4eed-b509-df24078a7451	cbf0915e-da75-48b2-b85a-da06992d1b0b	3	12	10	2025-10-22 08:39:14.802116	19	6
0bff0764-7978-4a58-b6a9-5db920108e69	cbf0915e-da75-48b2-b85a-da06992d1b0b	4	17	13	2025-10-22 08:39:14.907802	24	9
dbc94083-3ef4-42cb-9631-06ca0c41b182	cbf0915e-da75-48b2-b85a-da06992d1b0b	6	23	53	2025-10-22 08:39:15.128174	29	17
c1cf58dc-53f2-438b-b2af-6dbbada06d01	cbf0915e-da75-48b2-b85a-da06992d1b0b	7	28	1	2025-10-22 08:39:15.229962	35	20
ee2d3f03-1d9c-4e75-a162-5aee1a2b0ec7	cbf0915e-da75-48b2-b85a-da06992d1b0b	8	28	0	2025-10-22 08:39:15.350552	35	20
138a7bca-fd1f-4276-82d5-2ade167a2bd5	cbf0915e-da75-48b2-b85a-da06992d1b0b	9	20	163	2025-10-22 08:39:15.463887	25	15
7455736c-c6e4-4897-800b-83bb640a598e	cbf0915e-da75-48b2-b85a-da06992d1b0b	11	10	33	2025-10-22 08:39:15.690025	15	7
0f1cba02-27ab-4b61-8b8e-eb0bb5960c55	cbf0915e-da75-48b2-b85a-da06992d1b0b	12	6	37	2025-10-22 08:39:15.802286	11	2
d86c20d7-5935-4952-8996-f61912dbca07	4d09e521-8224-4513-82fa-a6b42af3dcd6	1	11	3	2025-10-22 08:39:17.647023	16	6
12cb23fb-75c6-419d-baee-620025855f65	4d09e521-8224-4513-82fa-a6b42af3dcd6	2	9	26	2025-10-22 08:39:17.771121	14	5
1d39ccf5-e68b-4673-b2b7-413a8d1e9d46	4d09e521-8224-4513-82fa-a6b42af3dcd6	4	17	2	2025-10-22 08:39:17.998528	23	12
ea167d42-eb06-419b-81c3-12dfaf623119	4d09e521-8224-4513-82fa-a6b42af3dcd6	5	19	66	2025-10-22 08:39:18.109959	23	15
c5e2c18f-0f96-40a5-afb3-7b5e0492eda7	4d09e521-8224-4513-82fa-a6b42af3dcd6	6	24	21	2025-10-22 08:39:18.221965	28	20
22b50810-d732-4b68-b04f-70404c590295	4d09e521-8224-4513-82fa-a6b42af3dcd6	7	27	10	2025-10-22 08:39:18.345602	31	24
55c47ed2-5377-4664-8ca9-6ffe7ba3fade	4d09e521-8224-4513-82fa-a6b42af3dcd6	9	23	116	2025-10-22 08:39:18.559575	27	19
52e2ba89-ced3-4665-bce3-fe77fe266871	4d09e521-8224-4513-82fa-a6b42af3dcd6	10	21	9	2025-10-22 08:39:18.674991	26	17
997c3af1-30e4-458f-8b01-86e45588e51a	4d09e521-8224-4513-82fa-a6b42af3dcd6	11	17	1	2025-10-22 08:39:18.788528	23	13
54a0cab9-d438-43b1-aa86-6fc472e476b4	4d09e521-8224-4513-82fa-a6b42af3dcd6	12	13	5	2025-10-22 08:39:18.891143	18	8
1990d180-beaa-4531-bc47-a7c29dda3600	78063abb-e5c2-42b0-8d3d-d24f17c28d35	2	13	36	2025-10-22 08:39:20.872524	16	10
09029e7f-83cd-4d47-997d-1546f8fc373d	78063abb-e5c2-42b0-8d3d-d24f17c28d35	3	17	10	2025-10-22 08:39:20.981937	21	12
b030b238-1c36-49e0-b790-d2144986cef7	78063abb-e5c2-42b0-8d3d-d24f17c28d35	4	19	2	2025-10-22 08:39:21.087482	23	15
1f13637d-32fc-4cf5-b815-9302f576b23d	78063abb-e5c2-42b0-8d3d-d24f17c28d35	5	20	35	2025-10-22 08:39:21.197969	23	16
fb3ae8b7-2c5b-47f9-b6fc-3323bae71606	78063abb-e5c2-42b0-8d3d-d24f17c28d35	7	28	4	2025-10-22 08:39:21.418553	32	23
7c175065-1b8f-4218-9606-cf008076d93f	78063abb-e5c2-42b0-8d3d-d24f17c28d35	9	23	110	2025-10-22 08:39:21.643109	27	19
2b80a60f-b14d-4471-82a7-effc065aede2	78063abb-e5c2-42b0-8d3d-d24f17c28d35	10	21	46	2025-10-22 08:39:21.749207	25	17
8af9ae98-2de0-4c74-8632-79262ea86af7	78063abb-e5c2-42b0-8d3d-d24f17c28d35	11	17	1	2025-10-22 08:39:21.878171	22	13
3eed3175-9770-434a-8818-257bc9fe0a30	78063abb-e5c2-42b0-8d3d-d24f17c28d35	12	13	17	2025-10-22 08:39:21.997317	19	9
cb5ebff3-4ba0-4c78-a130-d1b3a7a91053	04570fa5-4011-4591-af21-06093e7b6297	2	12	27	2025-10-22 08:39:23.981037	15	9
31c6023d-0b51-44a7-8155-04deab18b78c	04570fa5-4011-4591-af21-06093e7b6297	3	15	40	2025-10-22 08:39:24.095212	18	12
f53fd58e-65c4-44ec-babe-ecbdf7729014	04570fa5-4011-4591-af21-06093e7b6297	4	17	2	2025-10-22 08:39:24.221697	21	14
17ae86de-0cb8-492b-8de9-06b3383685fa	04570fa5-4011-4591-af21-06093e7b6297	5	19	56	2025-10-22 08:39:24.338157	23	16
f566102f-cb5c-4962-ad24-d7ff38a6be1d	04570fa5-4011-4591-af21-06093e7b6297	7	28	5	2025-10-22 08:39:24.586002	32	25
b9cda07f-06c9-4c1b-98c3-6931597b4b99	04570fa5-4011-4591-af21-06093e7b6297	8	27	45	2025-10-22 08:39:24.703491	31	24
d289ea39-2c64-475f-8d8c-bb8864587a13	04570fa5-4011-4591-af21-06093e7b6297	9	24	77	2025-10-22 08:39:24.812972	28	21
8a0e65d9-07d3-4838-beee-dc2365799eb1	04570fa5-4011-4591-af21-06093e7b6297	10	23	20	2025-10-22 08:39:24.936193	26	20
abbdda6b-ab3c-4edb-b099-90a595b4d52c	04570fa5-4011-4591-af21-06093e7b6297	12	15	6	2025-10-22 08:39:25.152258	17	12
c22043e9-e172-485e-9431-c4e7686e65f7	35b60547-1009-454d-890d-c4b35f1ce3f2	1	10	17	2025-10-22 08:39:26.950971	14	6
c1561ac8-c654-4b41-b4a7-51a3cfa9b006	35b60547-1009-454d-890d-c4b35f1ce3f2	2	9	155	2025-10-22 08:39:27.079229	14	5
8195283c-5a3b-4915-b74a-e62912bece50	35b60547-1009-454d-890d-c4b35f1ce3f2	3	13	14	2025-10-22 08:39:27.228154	18	8
df9d9594-a070-4297-b181-c6a794dbbada	35b60547-1009-454d-890d-c4b35f1ce3f2	5	18	45	2025-10-22 08:39:27.439666	23	13
35339a12-43b4-4713-93ea-f73acb80cdfc	35b60547-1009-454d-890d-c4b35f1ce3f2	6	23	35	2025-10-22 08:39:27.548362	29	18
37d2242b-c2e5-496a-a1c0-2a0559443a71	35b60547-1009-454d-890d-c4b35f1ce3f2	7	27	9	2025-10-22 08:39:27.653267	34	22
86ba56d7-fd88-4dc1-a2af-8a6d6cb6c57e	35b60547-1009-454d-890d-c4b35f1ce3f2	8	26	58	2025-10-22 08:39:27.755677	32	20
743f7c7d-dd13-4561-ae57-aaf84d20e2e1	35b60547-1009-454d-890d-c4b35f1ce3f2	10	20	28	2025-10-22 08:39:27.963822	25	16
58fa608b-68f1-4925-a2aa-8a3cdffeed0a	35b60547-1009-454d-890d-c4b35f1ce3f2	11	15	9	2025-10-22 08:39:28.068797	19	11
d7399f1e-6018-49de-81e8-2f1a2c382084	35b60547-1009-454d-890d-c4b35f1ce3f2	12	11	8	2025-10-22 08:39:28.177797	16	7
0906a419-a47d-457b-a613-96c6bec761f5	ef893d9d-59a6-4714-91d3-132569a2fe06	1	12	41	2025-10-22 08:39:30.038046	15	9
93328ebd-18c8-4a3e-85aa-f99c9d2f7d31	ef893d9d-59a6-4714-91d3-132569a2fe06	3	14	38	2025-10-22 08:39:30.256662	18	11
ad325afd-ef82-4284-9e77-8168c290d228	ef893d9d-59a6-4714-91d3-132569a2fe06	4	18	18	2025-10-22 08:39:30.368396	23	13
5827ab22-c8f8-49c8-9a64-4f59185b7854	ef893d9d-59a6-4714-91d3-132569a2fe06	5	19	8	2025-10-22 08:39:30.47581	24	15
6c993a53-2124-4313-a766-29d5263a2c58	ef893d9d-59a6-4714-91d3-132569a2fe06	6	22	26	2025-10-22 08:39:30.579346	27	18
0b638c0f-3cde-46a2-8a65-7435f5ecc33a	ef893d9d-59a6-4714-91d3-132569a2fe06	8	24	0	2025-10-22 08:39:30.812665	30	19
ffb19bf1-fb2c-41f8-b08c-06ed531a112a	ef893d9d-59a6-4714-91d3-132569a2fe06	9	21	64	2025-10-22 08:39:30.930292	26	17
d68f347e-7d35-43d1-a966-6dfcac182235	ef893d9d-59a6-4714-91d3-132569a2fe06	10	20	126	2025-10-22 08:39:31.043916	24	16
0abe4086-6969-4170-9da4-0e017c5d22bf	ef893d9d-59a6-4714-91d3-132569a2fe06	11	16	73	2025-10-22 08:39:31.159009	19	13
35d8bc8a-0fa6-4d50-ab29-a54cc42d2ada	66ada0dc-7cb2-489c-909d-754e5e208a13	1	10	233	2025-10-22 08:39:33.075967	13	7
7096ec30-544e-46b8-ae7b-ab694d4f7c03	66ada0dc-7cb2-489c-909d-754e5e208a13	2	10	6	2025-10-22 08:39:33.187888	15	7
95543731-3326-44b7-a5d8-e72390066d3d	66ada0dc-7cb2-489c-909d-754e5e208a13	3	12	155	2025-10-22 08:39:33.304164	16	9
ca1abf07-b147-4d6b-97d1-0c5b59340f35	66ada0dc-7cb2-489c-909d-754e5e208a13	4	15	36	2025-10-22 08:39:33.422028	19	11
ef747ca0-efe5-4cc0-80b9-7219bef1165d	66ada0dc-7cb2-489c-909d-754e5e208a13	6	19	44	2025-10-22 08:39:33.651456	23	16
eb497d13-f0a5-4316-bf64-8c4669d0210d	66ada0dc-7cb2-489c-909d-754e5e208a13	7	19	17	2025-10-22 08:39:33.755129	23	15
5bd1275d-cbc6-4268-83b9-23b12f3e9b30	66ada0dc-7cb2-489c-909d-754e5e208a13	8	21	6	2025-10-22 08:39:33.908597	25	17
72302de8-9a11-4bfe-9eb1-4dd9cfbd92bb	66ada0dc-7cb2-489c-909d-754e5e208a13	9	19	156	2025-10-22 08:39:34.013109	23	16
35b833ac-09e8-423d-bfd5-b1810947ae58	66ada0dc-7cb2-489c-909d-754e5e208a13	11	14	225	2025-10-22 08:39:34.247139	17	12
b105894f-7b9e-40b5-8c80-2e53b04d8aae	66ada0dc-7cb2-489c-909d-754e5e208a13	12	10	170	2025-10-22 08:39:34.365485	14	8
6ec29020-7c0d-4fd4-a92d-49d2c3eff9e9	a169c096-7d0e-4505-a487-d08fca579276	1	11	94	2025-10-22 08:39:36.193439	15	7
e64e59ef-0d90-4a6c-ba2a-424a300ef00d	a169c096-7d0e-4505-a487-d08fca579276	2	9	36	2025-10-22 08:39:36.315654	13	5
53a76a32-d294-43aa-892a-f08445695cd5	a169c096-7d0e-4505-a487-d08fca579276	4	15	45	2025-10-22 08:39:36.543178	19	11
57c92000-51d0-4a0d-9e81-10213f43dd03	a169c096-7d0e-4505-a487-d08fca579276	5	19	100	2025-10-22 08:39:36.654307	23	15
e85e4c7e-9652-48d1-8b08-874f52a03bb2	a169c096-7d0e-4505-a487-d08fca579276	6	24	69	2025-10-22 08:39:36.760415	29	19
b7ebba57-9aaf-486b-af80-f89179d2aab9	a169c096-7d0e-4505-a487-d08fca579276	7	31	2	2025-10-22 08:39:36.868453	36	25
f43f86b1-9239-4608-9e1a-3414aa144127	a169c096-7d0e-4505-a487-d08fca579276	9	24	48	2025-10-22 08:39:37.088623	29	20
57076bb8-0136-4988-9be1-f389eabb741f	a169c096-7d0e-4505-a487-d08fca579276	10	21	5	2025-10-22 08:39:37.20795	26	17
aecf8b15-7f56-4bd5-a010-f7ba13de4e7e	a169c096-7d0e-4505-a487-d08fca579276	11	17	48	2025-10-22 08:39:37.314004	21	13
3005972d-2675-467e-a846-c881766b7cd9	a169c096-7d0e-4505-a487-d08fca579276	12	13	59	2025-10-22 08:39:37.437251	16	9
5c3865ca-7aaa-4dcc-b037-cc330b5efd36	351d9e16-cc72-4671-9e47-d43442749a9f	2	12	22	2025-10-22 08:39:39.368956	14	10
54a1a14e-dac5-47d9-875f-22ba601929ef	351d9e16-cc72-4671-9e47-d43442749a9f	3	14	35	2025-10-22 08:39:39.479079	17	12
e4d94ab5-9616-4cd9-b88f-08e72a8b6d70	351d9e16-cc72-4671-9e47-d43442749a9f	4	16	11	2025-10-22 08:39:39.586436	18	14
43485b8e-6169-4488-a618-496cf51a3b44	351d9e16-cc72-4671-9e47-d43442749a9f	5	18	42	2025-10-22 08:39:39.691983	21	16
c4972cd4-45e9-4f26-982c-b0edafe91bc5	351d9e16-cc72-4671-9e47-d43442749a9f	7	28	0	2025-10-22 08:39:39.908552	31	25
b418fffb-88e8-4490-91e5-989ee5818463	351d9e16-cc72-4671-9e47-d43442749a9f	8	27	0	2025-10-22 08:39:40.048063	29	25
62d2c00b-8648-45a1-808d-90bca86e7da2	351d9e16-cc72-4671-9e47-d43442749a9f	9	25	19	2025-10-22 08:39:40.154369	27	23
b4f4c506-7e56-4da0-a97d-60e1090952a2	351d9e16-cc72-4671-9e47-d43442749a9f	10	22	2	2025-10-22 08:39:40.275219	24	20
525a81cc-6366-4654-bd2b-c68376834771	351d9e16-cc72-4671-9e47-d43442749a9f	12	16	40	2025-10-22 08:39:40.493261	18	14
5042d9cc-46c7-4f7f-bddb-e6c8ab9eaff4	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	1	14	51	2025-10-22 08:39:42.321792	16	12
73f16629-b4aa-4ff3-ba86-5004dd6fbf5e	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	2	12	31	2025-10-22 08:39:42.435953	14	10
ee320796-1873-474f-9f23-ea345d775c35	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	3	14	35	2025-10-22 08:39:42.542304	17	12
6048438e-5934-45f4-ae30-b23493d49eda	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	5	19	38	2025-10-22 08:39:42.814313	21	17
8653c6ed-504b-4e54-9042-12768ba81917	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	6	23	15	2025-10-22 08:39:42.921722	26	21
543fdd76-175c-4073-b506-711a83fd0d08	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	7	28	1	2025-10-22 08:39:43.043431	30	25
e8233e85-f9eb-4cdf-a103-467750209baf	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	8	27	0	2025-10-22 08:39:43.161615	29	25
77e27b88-da69-422e-ac8b-98caa97d2c2c	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	10	21	3	2025-10-22 08:39:43.372717	23	20
a1e0d2fa-128b-4148-bcec-12e684daab8c	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	11	19	101	2025-10-22 08:39:43.478928	21	17
08b98726-da8c-4375-a5bc-f514d082d03a	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	12	16	26	2025-10-22 08:39:43.592067	18	14
b3f5c5ff-0c6c-4638-91c1-d56032ca3314	d3a9895e-21c2-4aa7-92e5-3a04aee72014	1	16	98	2025-10-22 08:39:45.430376	17	15
b5fd5342-a6e9-4db2-9dfb-096e3d39120e	d3a9895e-21c2-4aa7-92e5-3a04aee72014	3	16	42	2025-10-22 08:39:45.665061	17	14
f02aa32d-1c9e-4878-8611-239173c85fd8	d3a9895e-21c2-4aa7-92e5-3a04aee72014	4	16	50	2025-10-22 08:39:45.776309	18	15
f2c3fd17-8130-4e44-834a-d3ec18da7497	d3a9895e-21c2-4aa7-92e5-3a04aee72014	5	19	33	2025-10-22 08:39:45.890237	20	18
e3660324-c76c-4e06-88b4-3493366b8ea9	d3a9895e-21c2-4aa7-92e5-3a04aee72014	6	23	11	2025-10-22 08:39:45.997908	24	22
86b20b41-19b0-4d3a-a7fc-1b42db4c142c	d3a9895e-21c2-4aa7-92e5-3a04aee72014	8	27	0	2025-10-22 08:39:46.249482	28	26
5fa66f50-9170-4ef6-8c31-0bb3fc538a21	d3a9895e-21c2-4aa7-92e5-3a04aee72014	10	24	4	2025-10-22 08:39:46.482877	25	23
ffbe1325-e25e-4b2f-bb2b-277aba074bd5	d3a9895e-21c2-4aa7-92e5-3a04aee72014	11	21	118	2025-10-22 08:39:46.591959	22	19
aeddccd9-3a64-478b-b861-ee7a327043e9	d3a9895e-21c2-4aa7-92e5-3a04aee72014	12	18	160	2025-10-22 08:39:46.702357	19	16
8c4c619f-ba2b-4f40-80f6-b594c68d6361	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	1	12	255	2025-10-22 08:39:48.496696	14	10
ee459cd1-0b75-4332-93c5-705a39d208e9	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	3	13	121	2025-10-22 08:39:48.749532	16	11
699e0fb5-67d8-4e3c-84ca-45b822d190c8	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	4	14	142	2025-10-22 08:39:48.863668	17	12
dbca7d17-d451-46b3-9719-b2ba64b97093	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	5	19	125	2025-10-22 08:39:48.981053	22	16
c975a6b0-b28c-4d9d-97d1-96b139a5e68b	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	6	24	23	2025-10-22 08:39:49.104306	28	21
71ad8816-ef31-4824-a569-08da8ebc3a0b	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	8	27	56	2025-10-22 08:39:49.334682	31	24
ad4a3edb-7087-4bfb-947c-434f33662967	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	9	24	60	2025-10-22 08:39:49.455095	28	21
26f8c469-a2d9-4e5a-b760-3fb4cc7cfe0a	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	10	22	162	2025-10-22 08:39:49.568823	25	19
2515ec7d-a73e-4dc3-866e-67edb2b3b460	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	11	17	368	2025-10-22 08:39:49.687057	19	14
ae904021-937f-4655-899d-e0ad08f8a7fb	f5ba86d5-4e8b-4abe-9feb-add2d374d219	1	9	23	2025-10-22 08:39:51.593509	12	6
02e031a4-2672-477f-a6d0-f4e93b23c2fc	f5ba86d5-4e8b-4abe-9feb-add2d374d219	2	7	49	2025-10-22 08:39:51.712159	10	4
236bb7ed-b0e7-40b4-bdc8-a8b1012ed2a9	f5ba86d5-4e8b-4abe-9feb-add2d374d219	3	9	130	2025-10-22 08:39:51.824506	13	7
22954264-b071-4e33-b387-acf72ecf713c	f5ba86d5-4e8b-4abe-9feb-add2d374d219	4	12	105	2025-10-22 08:39:51.940381	16	9
4b771e6e-3526-4095-8572-7ed4d4e7a43b	f5ba86d5-4e8b-4abe-9feb-add2d374d219	6	21	31	2025-10-22 08:39:52.160868	25	18
f815a3c4-28a8-4fd8-83d0-8b8070c3f1de	f5ba86d5-4e8b-4abe-9feb-add2d374d219	7	26	22	2025-10-22 08:39:52.283131	31	21
406ffd7f-27ae-4e86-a518-c28f175664e0	f5ba86d5-4e8b-4abe-9feb-add2d374d219	8	26	4	2025-10-22 08:39:52.421046	31	23
12c4d027-11d8-451c-a815-9c8214086b44	f5ba86d5-4e8b-4abe-9feb-add2d374d219	9	23	70	2025-10-22 08:39:52.578859	27	20
8729d407-317b-40f6-89e4-f032a97f3aed	f5ba86d5-4e8b-4abe-9feb-add2d374d219	11	15	288	2025-10-22 08:39:52.854	18	12
127ed579-d8f9-4fdc-8ee0-688d7128a9ae	f5ba86d5-4e8b-4abe-9feb-add2d374d219	12	11	98	2025-10-22 08:39:52.964392	13	8
6c545266-aed1-418b-9397-15c1c78b3db8	9415905d-81c3-4577-b19a-8e60bd2459d8	1	11	169	2025-10-22 08:39:54.786949	17	6
c53d3666-c1ba-4f80-9758-7b20103867a8	9415905d-81c3-4577-b19a-8e60bd2459d8	2	9	17	2025-10-22 08:39:54.912145	15	4
ce144f0d-e2da-42d1-9381-c920d3325e5d	9415905d-81c3-4577-b19a-8e60bd2459d8	4	15	76	2025-10-22 08:39:55.141	20	10
4456000b-e4e3-4bbc-8f7c-bc14ebed1e1e	9415905d-81c3-4577-b19a-8e60bd2459d8	5	20	184	2025-10-22 08:39:55.272967	25	15
4853b342-1816-4119-839e-cba3f18e260e	9415905d-81c3-4577-b19a-8e60bd2459d8	6	24	46	2025-10-22 08:39:55.391877	30	19
64662673-24b2-4492-948a-ec3ad63fd849	9415905d-81c3-4577-b19a-8e60bd2459d8	7	31	0	2025-10-22 08:39:55.522121	38	25
2aff8c0f-7796-4e9b-a947-bf3a388d66c3	9415905d-81c3-4577-b19a-8e60bd2459d8	9	27	10	2025-10-22 08:39:55.788867	34	21
230739e0-eb91-476a-9921-6a63361a7b08	9415905d-81c3-4577-b19a-8e60bd2459d8	10	22	24	2025-10-22 08:39:55.90951	28	17
4d4fef1a-a5f4-4b6b-8d4e-93602ab56bda	9415905d-81c3-4577-b19a-8e60bd2459d8	11	17	63	2025-10-22 08:39:56.039327	21	13
1cc174ce-ff1e-4194-ab32-4bc9b69c5bbb	9415905d-81c3-4577-b19a-8e60bd2459d8	12	13	160	2025-10-22 08:39:56.159851	18	9
ccf443e5-c1c7-4f24-bcef-2fc36c79194d	fcd5fba1-05b5-47df-8205-d060f411f56c	2	11	23	2025-10-22 08:39:58.105477	14	8
7839f856-f3cf-47c6-a568-c49ab65c491d	fcd5fba1-05b5-47df-8205-d060f411f56c	3	14	73	2025-10-22 08:39:58.214191	17	12
ee1b36d1-634d-4aa2-9a40-579342247c78	fcd5fba1-05b5-47df-8205-d060f411f56c	4	16	50	2025-10-22 08:39:58.347717	18	13
d5110a4d-ce17-45cf-9b92-304b3ba3f636	fcd5fba1-05b5-47df-8205-d060f411f56c	5	19	57	2025-10-22 08:39:58.502037	23	17
a4dde0f6-38bb-4615-9eb1-19db6beefda4	fcd5fba1-05b5-47df-8205-d060f411f56c	7	29	0	2025-10-22 08:39:58.777577	34	25
118c4e06-1de0-495d-aa9d-a94bd19ca4d0	fcd5fba1-05b5-47df-8205-d060f411f56c	8	27	0	2025-10-22 08:39:58.888563	31	24
f37341cd-fd5f-4b36-8248-4c58cd0180b8	fcd5fba1-05b5-47df-8205-d060f411f56c	9	27	24	2025-10-22 08:39:59.005392	30	23
534b709f-55c1-4ad6-a935-9d3f690dae16	fcd5fba1-05b5-47df-8205-d060f411f56c	10	23	2	2025-10-22 08:39:59.132733	26	20
17c1eeb3-5a28-4640-bbf9-8baadfb2b975	fcd5fba1-05b5-47df-8205-d060f411f56c	12	16	99	2025-10-22 08:39:59.528197	18	14
1978a52a-b2b7-48db-9781-056e37493a68	fe29e631-c438-4178-978f-6ed4e12c4b49	1	4	298	2025-10-22 08:40:02.036228	7	2
494604a9-9bce-4239-9e02-bdfe9a8718ce	fe29e631-c438-4178-978f-6ed4e12c4b49	2	6	94	2025-10-22 08:40:02.242971	8	3
d970e42e-936d-466b-a58a-b699bbd0711a	fe29e631-c438-4178-978f-6ed4e12c4b49	3	5	345	2025-10-22 08:40:02.363401	8	2
da522856-63d5-44d2-a188-e98a66b27e73	fe29e631-c438-4178-978f-6ed4e12c4b49	5	12	58	2025-10-22 08:40:02.621648	16	8
020f539e-f902-47fa-a9e0-ac585c50f202	fe29e631-c438-4178-978f-6ed4e12c4b49	6	16	90	2025-10-22 08:40:02.753617	21	12
f49cec51-47c6-4bc4-86da-aa95d9aeff42	fe29e631-c438-4178-978f-6ed4e12c4b49	7	14	328	2025-10-22 08:40:02.87601	17	12
9c0c1c53-df85-4ba7-84fd-a6c2a575a6a2	fe29e631-c438-4178-978f-6ed4e12c4b49	8	15	157	2025-10-22 08:40:03.003831	17	12
da92e692-e6c6-46de-97b2-71d2373101a8	fe29e631-c438-4178-978f-6ed4e12c4b49	10	11	134	2025-10-22 08:40:03.252746	13	8
c5dcd3e9-6700-43d7-81ea-fb1a28ffae5d	fe29e631-c438-4178-978f-6ed4e12c4b49	11	6	180	2025-10-22 08:40:03.369194	8	4
f6cd1609-3c48-449a-bb21-a53351208c4a	fe29e631-c438-4178-978f-6ed4e12c4b49	12	6	310	2025-10-22 08:40:03.497455	7	3
2c03ac05-fb3a-42d9-b290-b9e9689c22e6	bb97bdcb-63ab-4870-8514-747b141bb008	1	5	55	2025-10-22 08:40:05.317874	8	2
123384da-fc7e-43ec-8e41-ed949e0f1dc8	bb97bdcb-63ab-4870-8514-747b141bb008	3	6	91	2025-10-22 08:40:05.578887	10	3
94d812cf-45e5-4064-bb91-766bf9055340	bb97bdcb-63ab-4870-8514-747b141bb008	4	8	60	2025-10-22 08:40:05.69704	12	4
4b140663-302e-4dd4-ad7e-ba0ff587551d	bb97bdcb-63ab-4870-8514-747b141bb008	5	12	42	2025-10-22 08:40:05.806896	17	8
75f36fbc-4f7a-4ca8-95c8-2acb609881fa	bb97bdcb-63ab-4870-8514-747b141bb008	6	16	69	2025-10-22 08:40:05.920254	21	11
e9ea796a-56c9-4369-835d-6c2f837f4577	bb97bdcb-63ab-4870-8514-747b141bb008	8	16	116	2025-10-22 08:40:06.166106	20	12
a9740415-7805-4c72-a1e8-2060b6f0b4dc	bb97bdcb-63ab-4870-8514-747b141bb008	9	16	99	2025-10-22 08:40:06.28927	20	12
5d08e475-2433-4a08-8398-cfc654188976	bb97bdcb-63ab-4870-8514-747b141bb008	10	12	126	2025-10-22 08:40:06.402397	15	9
543fac7b-0415-4dcd-867a-15749ff716e1	bb97bdcb-63ab-4870-8514-747b141bb008	11	7	68	2025-10-22 08:40:06.514874	10	4
7436379e-6ee9-4bfa-9738-9e02b34c3c2c	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	1	5	105	2025-10-22 08:40:08.445933	8	2
777b6263-cf4d-457b-9ba4-2d60c68c5648	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	2	6	22	2025-10-22 08:40:08.579512	9	3
aaa9499b-d501-42f9-bef2-10e75639d26c	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	3	7	132	2025-10-22 08:40:08.71802	10	5
faf22557-c221-44e4-8b0b-1e77eae16513	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	4	9	100	2025-10-22 08:40:08.887483	12	5
3d58ec27-44f6-4e4d-9500-3aa8439e1a3a	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	6	17	59	2025-10-22 08:40:09.258184	22	12
23dd9e7a-02d7-4fca-b708-3de524e53656	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	7	16	137	2025-10-22 08:40:09.434338	19	13
f37b6072-5d76-4b99-8aa0-61b332bbc2cd	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	8	16	75	2025-10-22 08:40:09.590626	20	13
79664904-7972-4b94-8506-250ead5b2e08	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	9	17	67	2025-10-22 08:40:09.74281	21	13
24d32bcc-c06c-4961-95eb-9b6ea3c7681b	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	11	8	92	2025-10-22 08:40:09.96391	10	5
8306e37f-9be5-4491-be33-bca9a0c104e5	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	12	8	162	2025-10-22 08:40:10.079479	10	5
b63665ff-6f36-4604-8ba6-65bdd9007c14	5a7f78e6-08af-46ee-8b5c-7c977948c82f	4	27	8	2025-10-22 08:40:12.330299	34	21
3239e421-1938-456f-ac0e-b6acaeecb575	5a7f78e6-08af-46ee-8b5c-7c977948c82f	5	31	1	2025-10-22 08:40:12.441565	39	25
83379674-ee8d-47f5-a5ea-4a51f5c7da20	5a7f78e6-08af-46ee-8b5c-7c977948c82f	2	20	35	2025-10-22 08:40:12.079269	26	15
bbb3e9b1-899e-49fe-a251-3f8a7ef249a0	5a7f78e6-08af-46ee-8b5c-7c977948c82f	6	33	0	2025-10-22 08:40:12.553227	41	27
74813334-505f-4fed-aca8-f4c07e3ea1d9	5a7f78e6-08af-46ee-8b5c-7c977948c82f	7	35	1	2025-10-22 08:40:12.662376	43	29
29b685ab-863e-4d36-acd0-f1ee1b85dc29	a42651c6-4071-492e-8c3b-f271e2142216	2	20	0	2025-10-22 08:40:15.316589	24	16
570c6628-0483-4bf0-91b4-f2fd9881f0e9	a42651c6-4071-492e-8c3b-f271e2142216	4	25	1	2025-10-22 08:40:15.544393	31	21
2d29626b-d597-4bda-aa46-cd66097937a6	a42651c6-4071-492e-8c3b-f271e2142216	6	35	0	2025-10-22 08:40:15.776995	41	29
39266939-1526-450f-b914-f3d28c2dbe23	a42651c6-4071-492e-8c3b-f271e2142216	7	36	0	2025-10-22 08:40:15.888088	43	30
6a4cd57c-2b4e-469b-8041-68c298ec29a4	a42651c6-4071-492e-8c3b-f271e2142216	8	36	0	2025-10-22 08:40:16.002595	42	31
df38a7d1-3a8d-451e-bce4-57ecea652b03	a42651c6-4071-492e-8c3b-f271e2142216	9	35	0	2025-10-22 08:40:16.136276	40	30
c8d641de-01f3-4126-94cf-b22d06e4b4f7	a42651c6-4071-492e-8c3b-f271e2142216	10	31	6	2025-10-22 08:40:16.267254	37	26
d7708138-4925-4144-b48f-17cb9ed5a58f	a42651c6-4071-492e-8c3b-f271e2142216	11	26	13	2025-10-22 08:40:16.50001	30	22
a218d30d-c125-4137-a403-13473c5a90ca	a42651c6-4071-492e-8c3b-f271e2142216	12	22	1	2025-10-22 08:40:16.632182	26	17
4369aba3-5cd2-4a40-aa2d-c6538bbd0c73	30f65744-b572-488a-ab73-4d8e4867a82a	2	27	62	2025-10-22 08:40:18.601453	32	23
83001cd3-d7c3-44d0-aaf3-a60365c15924	30f65744-b572-488a-ab73-4d8e4867a82a	3	29	18	2025-10-22 08:40:18.75073	34	25
ef7e4ee3-c88d-4e30-b557-51651b20b4b2	30f65744-b572-488a-ab73-4d8e4867a82a	4	31	95	2025-10-22 08:40:18.886142	35	28
b199246f-6c35-4da5-8bbc-0358f6c4d891	30f65744-b572-488a-ab73-4d8e4867a82a	5	31	102	2025-10-22 08:40:19.007588	35	27
1a1526ae-c67b-41b4-8308-a8f2245b063d	30f65744-b572-488a-ab73-4d8e4867a82a	7	28	259	2025-10-22 08:40:19.258273	32	26
8a8f6ea2-eec9-45e8-8271-dc6556aac263	30f65744-b572-488a-ab73-4d8e4867a82a	8	28	255	2025-10-22 08:40:19.389388	33	26
1c27e80f-52cb-445f-b287-d19e70aa1728	30f65744-b572-488a-ab73-4d8e4867a82a	9	28	364	2025-10-22 08:40:19.526124	31	25
79a26073-301c-484f-8a88-8830335e17cd	30f65744-b572-488a-ab73-4d8e4867a82a	10	28	247	2025-10-22 08:40:19.67271	31	25
2ff7acbe-3afa-4ea0-8eae-6412157ee0d0	30f65744-b572-488a-ab73-4d8e4867a82a	12	27	33	2025-10-22 08:40:19.900373	32	23
2e1c1a8d-a187-4d20-9816-57f23a209ccf	62db09a1-adc2-4359-bdb0-8b272a6acc47	1	26	74	2025-10-22 08:40:21.736661	30	24
70c1a640-8455-441e-b6c2-837faddecd56	62db09a1-adc2-4359-bdb0-8b272a6acc47	2	27	28	2025-10-22 08:40:21.856697	31	25
50129c8b-b32a-431b-812c-a46abbdaa7a5	62db09a1-adc2-4359-bdb0-8b272a6acc47	3	28	45	2025-10-22 08:40:21.965312	32	25
e5464c44-49a9-44f5-a5f9-4daa4f632029	62db09a1-adc2-4359-bdb0-8b272a6acc47	5	28	159	2025-10-22 08:40:22.212781	31	26
8f26cb06-bb3b-48f9-8c32-cd3fe07b370f	62db09a1-adc2-4359-bdb0-8b272a6acc47	6	28	154	2025-10-22 08:40:22.360955	31	26
22c57f90-a674-4653-aa3c-2131d31abaad	62db09a1-adc2-4359-bdb0-8b272a6acc47	7	27	245	2025-10-22 08:40:22.500849	30	25
bf7db1bd-a1b0-4bfe-9a1f-06672f6e82c9	62db09a1-adc2-4359-bdb0-8b272a6acc47	8	27	251	2025-10-22 08:40:22.633996	30	25
09b534be-ae7b-44cf-8cfe-10c2da5916ed	62db09a1-adc2-4359-bdb0-8b272a6acc47	10	27	267	2025-10-22 08:40:22.867333	30	24
9adbb2ea-4c25-448a-839c-2d3ab6ed4149	62db09a1-adc2-4359-bdb0-8b272a6acc47	11	27	302	2025-10-22 08:40:22.99078	29	25
79d63199-d86e-4419-b8ab-b3455d904057	62db09a1-adc2-4359-bdb0-8b272a6acc47	12	27	113	2025-10-22 08:40:23.103873	30	25
a06c8975-de6b-4959-8017-d10cb9d6a9da	753bc31b-0e39-4b59-bc04-e0d266b1abc8	1	26	62	2025-10-22 08:40:24.976316	28	24
c000a153-f202-43af-bdb3-df169b393219	753bc31b-0e39-4b59-bc04-e0d266b1abc8	3	27	47	2025-10-22 08:40:25.225952	30	25
1e4c506c-a2e4-449d-a915-ce88baff7837	753bc31b-0e39-4b59-bc04-e0d266b1abc8	4	30	47	2025-10-22 08:40:25.341065	33	27
64973106-7d99-40f4-be25-0acfec6b53be	753bc31b-0e39-4b59-bc04-e0d266b1abc8	5	30	58	2025-10-22 08:40:25.457882	33	27
a15dfa2b-1705-4a49-9dbd-9fc776296bc2	753bc31b-0e39-4b59-bc04-e0d266b1abc8	6	29	92	2025-10-22 08:40:25.566197	32	27
23c7e486-5259-4ef4-897b-608bc56b87b8	753bc31b-0e39-4b59-bc04-e0d266b1abc8	8	29	76	2025-10-22 08:40:25.847179	33	27
fce623e7-c00e-417c-b809-d938106fab4c	753bc31b-0e39-4b59-bc04-e0d266b1abc8	9	28	183	2025-10-22 08:40:25.96711	31	26
fe90bf49-7ff4-42e3-b189-a84179bb0dff	753bc31b-0e39-4b59-bc04-e0d266b1abc8	10	28	186	2025-10-22 08:40:26.07558	30	26
3446ddbc-5079-4050-9afc-4ec8eb54179e	753bc31b-0e39-4b59-bc04-e0d266b1abc8	11	27	339	2025-10-22 08:40:26.195452	29	25
a5bc21a2-d74a-4c9a-9676-e5582a45fd56	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	1	26	116	2025-10-22 08:40:28.358492	31	22
5ba3febb-5d4c-4175-a0d6-cad95207edbf	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	2	27	73	2025-10-22 08:40:28.487263	33	23
84783afd-d003-4f48-b1fe-b1f462a869fa	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	3	28	68	2025-10-22 08:40:28.595221	34	23
4dc86506-f5c7-43e6-aa5f-5beb0745f305	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	4	29	108	2025-10-22 08:40:28.703964	34	24
7cc3181c-1e4c-451a-a074-e71178f69720	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	6	28	154	2025-10-22 08:40:28.935085	31	25
6c0a62b4-ba00-40d9-8484-4dc8f0943f0b	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	7	27	267	2025-10-22 08:40:29.045767	30	25
79590840-9655-41f7-be31-2e79b2684050	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	8	27	224	2025-10-22 08:40:29.155151	30	25
a3e62fbb-d44f-46ed-8493-82b672d5358b	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	9	26	319	2025-10-22 08:40:29.268871	30	24
6604f490-9fdb-4ca2-8672-15a33f53c17f	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	11	26	334	2025-10-22 08:40:29.492499	30	23
03de0fb6-6f3b-47ef-bc19-5bbcb53a9a09	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	12	26	142	2025-10-22 08:40:29.598685	31	23
fab90c48-bccd-40bd-9732-c03ea0bbb7cb	a582aaba-fda9-44cb-ab72-c6bc346b210c	1	22	1	2025-10-22 08:40:31.46531	28	16
bf5c737f-6625-4dd5-8dbe-3487db748489	a582aaba-fda9-44cb-ab72-c6bc346b210c	2	24	47	2025-10-22 08:40:31.592036	29	18
01e99a62-ea1b-46aa-adea-bf59b35c4478	a582aaba-fda9-44cb-ab72-c6bc346b210c	4	30	7	2025-10-22 08:40:31.837252	37	24
e23fdbe1-2ad1-45a8-b3de-4b3ecf8b2145	a582aaba-fda9-44cb-ab72-c6bc346b210c	5	29	150	2025-10-22 08:40:31.958909	34	24
bcb3d998-83c9-4676-bae5-ec266e4dfeb5	a582aaba-fda9-44cb-ab72-c6bc346b210c	6	28	292	2025-10-22 08:40:32.069239	32	24
f1b40444-c02d-4b9f-8d9e-d181461c0f47	a582aaba-fda9-44cb-ab72-c6bc346b210c	7	27	314	2025-10-22 08:40:32.180686	32	24
7b4a40f3-47be-48c3-9a81-45d26590bf27	a582aaba-fda9-44cb-ab72-c6bc346b210c	9	26	601	2025-10-22 08:40:32.406139	30	23
b9404023-01d8-4770-a109-7813029d36f9	a582aaba-fda9-44cb-ab72-c6bc346b210c	10	26	212	2025-10-22 08:40:32.522905	29	23
819a2ffe-0fe2-49cb-9ba2-73074e076c7e	a582aaba-fda9-44cb-ab72-c6bc346b210c	11	24	40	2025-10-22 08:40:32.635933	29	20
4c68df78-f7de-41e2-88b2-024278143c73	a582aaba-fda9-44cb-ab72-c6bc346b210c	12	23	45	2025-10-22 08:40:32.749942	28	19
87c13928-74e5-4324-b517-2fdbcbbe21ed	817e316f-0af7-450b-afe9-61780f529d8e	2	26	148	2025-10-22 08:40:34.718755	29	24
80a24aad-de1d-4d0e-a5a8-9f20c86034df	817e316f-0af7-450b-afe9-61780f529d8e	3	26	222	2025-10-22 08:40:34.841917	29	24
7d62b81e-2b1d-412c-b4e3-849abd333cd4	817e316f-0af7-450b-afe9-61780f529d8e	4	28	188	2025-10-22 08:40:34.959586	30	25
71f8f3b2-d1b3-4fbe-964e-c2006a8cbb8d	817e316f-0af7-450b-afe9-61780f529d8e	5	28	166	2025-10-22 08:40:35.069256	30	27
83acb567-7957-425c-b744-4fc7b8bd1861	817e316f-0af7-450b-afe9-61780f529d8e	7	28	211	2025-10-22 08:40:35.291877	30	26
42d4dcc9-755e-41df-ad8e-d2b9f5f68ec1	817e316f-0af7-450b-afe9-61780f529d8e	8	28	190	2025-10-22 08:40:35.407085	30	26
afb3b28d-900f-456c-beef-52c0ffc76821	817e316f-0af7-450b-afe9-61780f529d8e	9	28	162	2025-10-22 08:40:35.525751	31	26
cbf1488f-af8a-4d1f-93fc-e7bd69e81c66	817e316f-0af7-450b-afe9-61780f529d8e	10	28	120	2025-10-22 08:40:35.646408	31	25
294aa6dd-0351-4c8d-9ae4-d1ad1ee98adf	817e316f-0af7-450b-afe9-61780f529d8e	12	26	239	2025-10-22 08:40:35.894343	29	24
04541c54-0dbb-4a09-9a5e-78f74dfc3cfd	fefb26e2-8f48-4be8-995f-b27d70d356a9	1	22	356	2025-10-22 08:40:37.769981	26	20
4aaa79bf-5516-4565-ac60-b1ab3b7a746c	fefb26e2-8f48-4be8-995f-b27d70d356a9	2	22	441	2025-10-22 08:40:37.878109	26	20
24236c78-4562-42ac-b924-0a12f5202536	fefb26e2-8f48-4be8-995f-b27d70d356a9	3	22	277	2025-10-22 08:40:37.982549	26	19
0eee4a1d-ba3d-4568-8752-dec5479d7824	fefb26e2-8f48-4be8-995f-b27d70d356a9	5	22	77	2025-10-22 08:40:38.200655	27	19
20bb1fa2-af10-4c89-8dc8-7c89f8bb3584	fefb26e2-8f48-4be8-995f-b27d70d356a9	6	22	61	2025-10-22 08:40:38.312745	27	19
175a1dfb-94a8-420f-84ec-93849f0ba367	fefb26e2-8f48-4be8-995f-b27d70d356a9	7	21	109	2025-10-22 08:40:38.416748	25	19
951a5793-561d-4703-9cb1-a0f6e6fe325d	fefb26e2-8f48-4be8-995f-b27d70d356a9	8	21	67	2025-10-22 08:40:38.540212	26	17
5108fbe8-3bb0-4d92-bbca-81b108a8983c	5a7f78e6-08af-46ee-8b5c-7c977948c82f	10	29	1	2025-10-22 08:40:13.019055	36	23
24280c09-e265-43d7-abb0-2d5ecc2f0150	5a7f78e6-08af-46ee-8b5c-7c977948c82f	11	25	5	2025-10-22 08:40:13.132581	31	19
c2f97f39-bd05-48f2-8de8-eae289091e36	5a7f78e6-08af-46ee-8b5c-7c977948c82f	12	21	14	2025-10-22 08:40:13.245129	26	16
e0814c85-21cc-46f1-a7a9-5bf1eda5a348	fefb26e2-8f48-4be8-995f-b27d70d356a9	10	23	103	2025-10-22 08:40:38.81635	28	19
28fdbfbd-6445-427f-aaf7-b561ba89be10	fefb26e2-8f48-4be8-995f-b27d70d356a9	12	23	331	2025-10-22 08:40:39.041106	27	20
6891be07-2253-4506-ab47-7c8c31306cca	2fd0938b-847f-4609-9f43-1db7708ed8f0	1	26	195	2025-10-22 08:40:40.881474	30	23
b3c69de0-594e-4db1-a9c2-e646f4d5f94a	2fd0938b-847f-4609-9f43-1db7708ed8f0	2	26	182	2025-10-22 08:40:41.001735	30	23
d41de1fc-fb5f-45f2-b4ca-fb10fba286eb	2fd0938b-847f-4609-9f43-1db7708ed8f0	3	27	160	2025-10-22 08:40:41.108583	31	23
075d694a-81ed-455c-8dfb-0025d32760d4	2fd0938b-847f-4609-9f43-1db7708ed8f0	5	28	162	2025-10-22 08:40:41.321269	32	25
0601e609-4e0f-40ca-a5b6-291dec9daa68	2fd0938b-847f-4609-9f43-1db7708ed8f0	6	28	167	2025-10-22 08:40:41.432011	32	24
acae964e-ecfe-4b29-b59f-05153d8340d0	2fd0938b-847f-4609-9f43-1db7708ed8f0	7	27	198	2025-10-22 08:40:41.541147	31	24
2ecf3b0c-c8e2-41a9-a291-43b326250d6e	2fd0938b-847f-4609-9f43-1db7708ed8f0	8	27	307	2025-10-22 08:40:41.657089	31	24
987c0fe2-9d09-4965-b573-e73bae128c3e	2fd0938b-847f-4609-9f43-1db7708ed8f0	10	26	485	2025-10-22 08:40:41.882783	30	24
d8c106d6-5825-4028-a9c0-116cdef31f02	2fd0938b-847f-4609-9f43-1db7708ed8f0	11	26	367	2025-10-22 08:40:41.990314	30	24
f60e29d2-7390-450d-bd9e-062d470a8906	2fd0938b-847f-4609-9f43-1db7708ed8f0	12	26	433	2025-10-22 08:40:42.092578	30	24
f51c3704-936e-4281-8d64-133c4b5d8d95	f044a094-f9ef-42ea-80fa-b66e5b7104ba	1	25	231	2025-10-22 08:40:44.71077	28	23
91852d20-e98d-4fdc-879f-ddfa83b8a605	f044a094-f9ef-42ea-80fa-b66e5b7104ba	3	26	231	2025-10-22 08:40:44.91827	28	23
354f66ef-afdf-4119-afef-f25b7f3ea972	f044a094-f9ef-42ea-80fa-b66e5b7104ba	4	27	117	2025-10-22 08:40:45.027223	30	24
c5964a22-caca-4f9b-a8f4-4d59080f7094	f044a094-f9ef-42ea-80fa-b66e5b7104ba	5	27	230	2025-10-22 08:40:45.140396	31	25
13c93c42-1e08-478a-8dae-b5fff8e4fd1c	f044a094-f9ef-42ea-80fa-b66e5b7104ba	6	27	174	2025-10-22 08:40:45.243214	31	25
5bc167ff-827f-45bc-bec5-18c6825e7b83	f044a094-f9ef-42ea-80fa-b66e5b7104ba	8	27	162	2025-10-22 08:40:45.459342	31	24
3977eb7a-7b13-40af-9320-f09c7d8434fa	f044a094-f9ef-42ea-80fa-b66e5b7104ba	9	27	440	2025-10-22 08:40:45.571021	30	24
fae1de75-2652-4dbd-9234-fdcd105f578d	f044a094-f9ef-42ea-80fa-b66e5b7104ba	10	27	327	2025-10-22 08:40:45.684774	30	24
7957b922-aaf2-42d8-abf6-a52a2dbad0ae	f044a094-f9ef-42ea-80fa-b66e5b7104ba	11	27	171	2025-10-22 08:40:45.800005	30	24
8ba2aab3-fdaf-4cd2-a526-b1d56262e29d	52e5f7b4-2418-49b7-a26e-728b5eaf1747	1	25	133	2025-10-22 08:40:47.721348	28	23
d43a299b-5931-4ea6-9173-b17e90246690	52e5f7b4-2418-49b7-a26e-728b5eaf1747	2	25	173	2025-10-22 08:40:47.824701	28	23
0075ee93-9d22-4750-9eb7-60a99a161622	52e5f7b4-2418-49b7-a26e-728b5eaf1747	3	26	163	2025-10-22 08:40:47.928712	28	23
f6248359-0ded-4010-87e2-10227498da9d	52e5f7b4-2418-49b7-a26e-728b5eaf1747	4	26	312	2025-10-22 08:40:48.046461	29	24
821deb91-3bee-4e9c-ba1a-24ad235922a0	52e5f7b4-2418-49b7-a26e-728b5eaf1747	6	27	269	2025-10-22 08:40:48.25945	29	25
dceaf4d6-4e55-41d1-a417-f7c24e95afaf	52e5f7b4-2418-49b7-a26e-728b5eaf1747	7	26	236	2025-10-22 08:40:48.367442	29	24
9d3213d3-4d68-4823-9cff-70efbf2bd269	52e5f7b4-2418-49b7-a26e-728b5eaf1747	8	26	346	2025-10-22 08:40:48.471463	28	24
cce5d1b6-4929-4a70-bf4c-ba38a5d77e5b	52e5f7b4-2418-49b7-a26e-728b5eaf1747	9	26	314	2025-10-22 08:40:48.579377	28	24
5e34401c-8935-4a9d-964a-e38825fc75a6	52e5f7b4-2418-49b7-a26e-728b5eaf1747	11	25	466	2025-10-22 08:40:48.796107	28	24
54b4fb66-824f-4478-8f84-d601aa22aeb0	52e5f7b4-2418-49b7-a26e-728b5eaf1747	12	25	439	2025-10-22 08:40:48.912138	28	24
69e8c4f4-4c1f-4ad4-b0d5-6a70e32ee4ce	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	1	16	11	2025-10-22 08:40:52.499899	21	12
fac78c65-75f6-4b76-894f-c74d2cd1094e	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	2	20	58	2025-10-22 08:40:52.603406	24	17
2b47cdd4-1c6e-4013-a597-f726ff078a62	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	4	25	66	2025-10-22 08:40:52.810139	29	22
b2d0c126-7201-4bc1-9fbb-e721003c782f	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	5	28	153	2025-10-22 08:40:52.923638	33	25
106cac00-b546-4a6b-95e8-ba93612d4590	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	6	29	329	2025-10-22 08:40:53.024927	33	26
2216158d-290f-4faf-9917-e9fdbe4ccf32	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	7	30	168	2025-10-22 08:40:53.137111	34	27
5b887fba-ec67-4f28-a01c-90bf59a3b192	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	9	27	329	2025-10-22 08:40:53.359278	31	25
57744fdd-fd30-4690-9004-a6fe72f63fa2	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	10	26	67	2025-10-22 08:40:53.466641	30	23
579f6e3c-547a-45e9-847f-5038c53cbd08	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	11	23	43	2025-10-22 08:40:53.576076	27	19
95d1bf9d-5ab4-422e-92ea-9c54a5c6e504	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	12	19	16	2025-10-22 08:40:53.683412	23	16
449b1634-d548-431e-b3e7-3f15478f7623	c4b42ac2-2047-466a-bdc1-708a04105814	2	28	12	2025-10-22 08:40:55.61686	34	23
b37bc872-c632-48e2-a74d-718ac548fbc0	c4b42ac2-2047-466a-bdc1-708a04105814	3	28	4	2025-10-22 08:40:55.740447	35	23
ed9a6316-22f3-4ead-83fe-e8fefb55b23c	c4b42ac2-2047-466a-bdc1-708a04105814	4	30	86	2025-10-22 08:40:55.84636	35	26
577d3755-9bc7-4efb-bd54-7d742d5ac7b6	c4b42ac2-2047-466a-bdc1-708a04105814	5	29	246	2025-10-22 08:40:55.967678	34	26
02c34823-a1f4-4953-ac1f-f421ce121e90	c4b42ac2-2047-466a-bdc1-708a04105814	7	27	413	2025-10-22 08:40:56.185745	31	25
3e3ed80d-7cb8-4203-bf7f-e638e7df6684	c4b42ac2-2047-466a-bdc1-708a04105814	8	27	341	2025-10-22 08:40:56.298255	32	25
91167ee4-f097-4beb-8987-90f9a8d44c04	c4b42ac2-2047-466a-bdc1-708a04105814	9	27	447	2025-10-22 08:40:56.407661	31	24
81d0eadf-a788-48a2-9937-edece56c4d1b	c4b42ac2-2047-466a-bdc1-708a04105814	10	27	403	2025-10-22 08:40:56.520594	31	24
4a80ab64-5ea6-4192-a2f5-6f2638d6abb6	c4b42ac2-2047-466a-bdc1-708a04105814	12	28	29	2025-10-22 08:40:56.749663	33	24
1993cbec-07b7-48b2-8dac-dd8c942b5808	10ea4947-03b3-4147-b520-8c2f79850a9d	1	25	72	2025-10-22 08:40:58.607001	28	22
9134e307-aae6-4e6a-82bf-f5920609d6e7	10ea4947-03b3-4147-b520-8c2f79850a9d	2	26	46	2025-10-22 08:40:58.721899	31	22
f394d768-8baa-4fa3-ae1f-6a4480a23312	10ea4947-03b3-4147-b520-8c2f79850a9d	3	26	38	2025-10-22 08:40:58.826634	32	22
097f4b33-a0ec-40fc-99f8-e00da893d80c	10ea4947-03b3-4147-b520-8c2f79850a9d	5	27	230	2025-10-22 08:40:59.038146	31	25
4e5e918d-cfa2-4db5-b942-98928758d326	10ea4947-03b3-4147-b520-8c2f79850a9d	6	26	279	2025-10-22 08:40:59.149396	29	24
6113f2a0-d0a9-4568-8339-3de181f97792	10ea4947-03b3-4147-b520-8c2f79850a9d	7	25	552	2025-10-22 08:40:59.260017	28	23
83a3c4cd-ac16-4d9a-84d7-d45dba6a142a	10ea4947-03b3-4147-b520-8c2f79850a9d	8	26	267	2025-10-22 08:40:59.367009	28	24
49d807dd-9983-4bde-97b4-0de8c515fa4a	10ea4947-03b3-4147-b520-8c2f79850a9d	10	26	299	2025-10-22 08:40:59.608535	29	23
ac6e1224-77ff-4408-b031-a1b43d050c45	10ea4947-03b3-4147-b520-8c2f79850a9d	11	26	123	2025-10-22 08:40:59.74477	29	24
0335851a-74d0-45c3-ace3-851eaba94ef9	10ea4947-03b3-4147-b520-8c2f79850a9d	12	26	47	2025-10-22 08:40:59.859111	30	24
cf11db73-8b1a-4f2d-abe4-303283c1405a	fa435d58-ea7b-493f-8956-52d0170834c0	1	4	26	2025-10-22 08:41:01.714581	9	0
f3333517-d8a5-425b-aa2f-ae3788ed9bbc	fa435d58-ea7b-493f-8956-52d0170834c0	3	12	135	2025-10-22 08:41:01.933053	17	7
580750b8-c276-4982-b141-0b143514c82c	fa435d58-ea7b-493f-8956-52d0170834c0	4	15	115	2025-10-22 08:41:02.054085	20	10
e8d6bac4-c321-401f-9ac8-8cb39c347cb5	fa435d58-ea7b-493f-8956-52d0170834c0	5	18	153	2025-10-22 08:41:02.167716	22	13
7c128bba-d10b-4ab6-a064-775162355b5d	fa435d58-ea7b-493f-8956-52d0170834c0	6	22	292	2025-10-22 08:41:02.275843	27	19
cd9cbb2d-3b31-422d-9226-5894dc17faf6	fa435d58-ea7b-493f-8956-52d0170834c0	8	29	142	2025-10-22 08:41:02.513407	33	25
f9b250ae-ee5d-4f3d-8bef-1fa14eb5d14d	fa435d58-ea7b-493f-8956-52d0170834c0	9	26	208	2025-10-22 08:41:02.623369	30	23
0b4a4287-a3a9-4460-aee0-6c4c73b2173a	fa435d58-ea7b-493f-8956-52d0170834c0	10	18	99	2025-10-22 08:41:02.742355	22	13
feb265aa-c7de-4310-8bda-c3a2f05ad89b	fa435d58-ea7b-493f-8956-52d0170834c0	11	13	58	2025-10-22 08:41:02.865538	18	8
84a3f6c3-ddfb-44be-a485-d87fcd3cd0b1	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	1	4	50	2025-10-22 08:41:04.95345	8	-1
ef1501a2-625a-487b-b1cd-04080f1f07e5	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	2	5	44	2025-10-22 08:41:05.067638	9	1
ba181aab-df15-4c3c-a1db-23e1e90229e1	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	3	11	126	2025-10-22 08:41:05.180149	16	6
11ca1bfe-f17d-40e4-812d-8dd99cb16eff	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	4	14	183	2025-10-22 08:41:05.286614	19	9
0d7b16f0-6094-4579-8dd6-611ee1cf555e	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	6	22	297	2025-10-22 08:41:05.507553	26	19
0fab992b-1a7a-484e-b2ac-ac6811c029f4	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	7	27	126	2025-10-22 08:41:05.616016	31	24
df3f7484-b523-4473-8208-2987b2e169c7	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	8	28	221	2025-10-22 08:41:05.727613	32	25
ae3a5edf-52ab-4578-8a18-3aec5e22a80a	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	9	26	99	2025-10-22 08:41:05.845648	30	23
2143caf1-4a53-4579-bf08-f0e93d91875d	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	11	13	97	2025-10-22 08:41:06.065107	17	9
a01365b9-f7f2-4ed7-8739-aa0daea9270a	853f4a5b-9f62-40d4-89b3-e6ced9799b43	1	5	47	2025-10-22 08:41:08.035668	9	0
0a68014c-0e61-468d-a876-05098c7a19a2	853f4a5b-9f62-40d4-89b3-e6ced9799b43	2	5	48	2025-10-22 08:41:08.154334	10	1
e1dc247c-5346-4475-9e0d-64abf7279c23	853f4a5b-9f62-40d4-89b3-e6ced9799b43	3	11	112	2025-10-22 08:41:08.265827	16	5
259a0d60-52e6-4f75-9c82-a0daa005fe82	853f4a5b-9f62-40d4-89b3-e6ced9799b43	4	14	162	2025-10-22 08:41:08.378266	19	9
86b80e90-fbcd-4ad0-a929-4354bbc89f47	853f4a5b-9f62-40d4-89b3-e6ced9799b43	6	22	308	2025-10-22 08:41:08.630382	26	19
83cdbd07-3db9-4670-a59f-2799e5b94d0c	853f4a5b-9f62-40d4-89b3-e6ced9799b43	7	28	97	2025-10-22 08:41:08.738338	32	24
87be5b43-1137-4902-9e4f-75395d29cbee	853f4a5b-9f62-40d4-89b3-e6ced9799b43	8	29	176	2025-10-22 08:41:08.84982	34	26
1fffc800-27ee-44a4-94e5-9ee41ddd49f7	853f4a5b-9f62-40d4-89b3-e6ced9799b43	9	27	106	2025-10-22 08:41:08.970022	31	23
bf5dfc2e-aa1e-4a4d-adbe-29ad10cfce47	853f4a5b-9f62-40d4-89b3-e6ced9799b43	11	12	141	2025-10-22 08:41:09.191677	17	8
0a5f208e-bc5e-454d-bc7d-0de995ff6eca	853f4a5b-9f62-40d4-89b3-e6ced9799b43	12	7	38	2025-10-22 08:41:09.297914	12	3
a509135f-cfbf-4418-9b0d-e401e37fa3ba	99616273-bdf3-4c3d-a934-baeed91e1011	1	16	67	2025-10-22 08:41:12.258074	18	13
f7613b5f-2d11-4d46-a951-cc3acaffa092	99616273-bdf3-4c3d-a934-baeed91e1011	2	17	60	2025-10-22 08:41:12.386994	20	15
839f59ed-c5d5-4fe9-9aa4-0eca515b069a	99616273-bdf3-4c3d-a934-baeed91e1011	4	21	118	2025-10-22 08:41:12.627049	23	19
d50fabf5-1cb3-47ee-a5cc-30d6fcf72ab5	99616273-bdf3-4c3d-a934-baeed91e1011	5	23	128	2025-10-22 08:41:12.752391	25	20
c35edc2e-41fd-42fe-b044-793d9ecfcd69	99616273-bdf3-4c3d-a934-baeed91e1011	6	26	348	2025-10-22 08:41:12.861528	28	24
def28021-2978-4203-becb-b36609795de7	99616273-bdf3-4c3d-a934-baeed91e1011	7	28	149	2025-10-22 08:41:12.972517	30	26
bca87d97-ec61-4fea-8129-ab9be8a4bed5	99616273-bdf3-4c3d-a934-baeed91e1011	9	27	140	2025-10-22 08:41:13.221578	30	25
b141e995-f5c1-4231-9ff6-1e27ab2c54cd	99616273-bdf3-4c3d-a934-baeed91e1011	10	24	74	2025-10-22 08:41:13.331026	28	22
73228ba4-2d93-4481-8c33-68b53e1dfc96	99616273-bdf3-4c3d-a934-baeed91e1011	11	21	59	2025-10-22 08:41:13.454384	24	19
c24e1b06-99ae-4404-850d-b55b428c704c	99616273-bdf3-4c3d-a934-baeed91e1011	12	18	233	2025-10-22 08:41:13.565757	21	16
6044d712-7e42-4b89-8d10-8629737c8d5f	020585b3-fd9b-4d1b-bff9-365b4d108d3a	2	0	3	2025-10-22 08:41:15.730922	6	-4
363b744d-d255-4741-9981-d1ae3620463e	020585b3-fd9b-4d1b-bff9-365b4d108d3a	3	7	18	2025-10-22 08:41:15.879159	14	2
b75b8c2e-89f3-42cb-87d1-f13fea66276e	020585b3-fd9b-4d1b-bff9-365b4d108d3a	4	12	104	2025-10-22 08:41:15.987647	18	7
dde7ebfb-3224-4b71-a458-645159ed530c	020585b3-fd9b-4d1b-bff9-365b4d108d3a	5	18	167	2025-10-22 08:41:16.094309	23	13
30c87641-5002-42ed-be6d-9ebacedfbc3c	020585b3-fd9b-4d1b-bff9-365b4d108d3a	7	25	418	2025-10-22 08:41:16.360505	29	22
44e0ff00-ebcb-46be-b963-cf63d3d87b22	020585b3-fd9b-4d1b-bff9-365b4d108d3a	8	26	311	2025-10-22 08:41:16.471279	30	23
6dae0f05-f12b-420d-8d54-dd55d48e7a70	020585b3-fd9b-4d1b-bff9-365b4d108d3a	9	22	145	2025-10-22 08:41:16.612228	26	19
d152ebc2-9101-4da5-94a8-9ee85d4d9caf	020585b3-fd9b-4d1b-bff9-365b4d108d3a	10	14	25	2025-10-22 08:41:16.717685	19	10
6c28db2a-8678-4bbf-8777-d2ba0b48c7e6	020585b3-fd9b-4d1b-bff9-365b4d108d3a	12	0	81	2025-10-22 08:41:16.953479	5	-4
dbb41141-9321-47bf-b813-1a82ce94c86b	13a558af-9e5a-4014-9357-bc53cc10d2e8	1	16	22	2025-10-22 08:41:18.791935	17	14
6154448c-048c-4686-85fd-d8466eb20310	13a558af-9e5a-4014-9357-bc53cc10d2e8	2	17	15	2025-10-22 08:41:18.974051	19	16
0d8f9341-67f0-4c1d-a3a4-32ccac6f852a	13a558af-9e5a-4014-9357-bc53cc10d2e8	3	20	87	2025-10-22 08:41:19.108294	20	19
3aa6deb4-b0c9-4a26-990e-0e3a1ad9b67b	13a558af-9e5a-4014-9357-bc53cc10d2e8	5	25	176	2025-10-22 08:41:19.361083	26	24
7c2fbbad-18c5-413d-8359-5060303c1ab3	13a558af-9e5a-4014-9357-bc53cc10d2e8	6	27	404	2025-10-22 08:41:19.473836	28	26
e5d54391-2921-4923-96ba-741d2fe4f039	13a558af-9e5a-4014-9357-bc53cc10d2e8	7	28	308	2025-10-22 08:41:19.590148	30	27
e34bf14c-f64f-4471-b5d1-5d939e7549b8	13a558af-9e5a-4014-9357-bc53cc10d2e8	8	28	174	2025-10-22 08:41:19.722608	30	26
a22f44d9-56bd-488c-afda-83800f9db7bb	13a558af-9e5a-4014-9357-bc53cc10d2e8	10	25	261	2025-10-22 08:41:19.980505	27	23
cd880929-ae8e-46aa-9e9d-247e36a86d87	13a558af-9e5a-4014-9357-bc53cc10d2e8	11	22	7	2025-10-22 08:41:20.090891	25	20
08ac6194-c7c6-453c-abb2-b0a3cf1cc84f	13a558af-9e5a-4014-9357-bc53cc10d2e8	12	18	10	2025-10-22 08:41:20.234343	21	15
d7151c05-98fb-4a3c-9a71-d808e2b85e31	54907426-a944-4986-8049-d99d2ee2a65f	1	5	74	2025-10-22 08:41:22.088378	10	1
1bb0bf24-daea-4239-ad6e-d04a06adea0a	54907426-a944-4986-8049-d99d2ee2a65f	3	11	81	2025-10-22 08:41:22.336557	17	7
ee039509-0363-4893-9eb2-48fb45f1316f	54907426-a944-4986-8049-d99d2ee2a65f	4	16	58	2025-10-22 08:41:22.453627	21	12
7f05cade-09d2-4454-a8e8-c91abf3de7e3	54907426-a944-4986-8049-d99d2ee2a65f	5	21	107	2025-10-22 08:41:22.590971	26	17
2232e543-078c-414b-a530-f7db532340ef	54907426-a944-4986-8049-d99d2ee2a65f	6	25	296	2025-10-22 08:41:22.718655	29	21
0bb0a15e-8c93-41e9-a052-ffe21baa4c82	54907426-a944-4986-8049-d99d2ee2a65f	8	28	126	2025-10-22 08:41:22.98413	31	25
a331f5e2-ca11-40d4-ab33-e76bb170308b	54907426-a944-4986-8049-d99d2ee2a65f	9	25	152	2025-10-22 08:41:23.105385	29	22
395dfea1-9ba5-44b5-aa61-7f46cdbdb071	54907426-a944-4986-8049-d99d2ee2a65f	10	19	14	2025-10-22 08:41:23.216819	24	15
6eb264af-4153-4f17-9969-df52661e7fca	54907426-a944-4986-8049-d99d2ee2a65f	11	13	40	2025-10-22 08:41:23.32835	18	9
d9419c7c-158b-44bf-851c-e74aba8b8f45	11af9dc6-389d-4827-96d4-018c2b9d244e	1	-3	4	2025-10-22 08:41:25.260117	3	-8
17e015d1-37fa-4834-b6b1-520e506de0f0	11af9dc6-389d-4827-96d4-018c2b9d244e	2	0	6	2025-10-22 08:41:25.367965	6	-4
38b5d3bd-c3b2-4228-a895-cf0ecb793013	11af9dc6-389d-4827-96d4-018c2b9d244e	3	9	2	2025-10-22 08:41:25.49496	17	1
8be1898a-d793-4aee-b944-d0b8292cc60e	11af9dc6-389d-4827-96d4-018c2b9d244e	4	14	30	2025-10-22 08:41:25.61823	21	8
710961fa-46cd-4e45-b973-5f28781fbed1	11af9dc6-389d-4827-96d4-018c2b9d244e	6	28	11	2025-10-22 08:41:25.85473	35	21
9298273a-3093-497c-8320-6f237a4247cf	11af9dc6-389d-4827-96d4-018c2b9d244e	7	28	315	2025-10-22 08:41:25.966805	34	23
f2e27cbd-f41b-420b-b84e-fd5c7ebd41ac	11af9dc6-389d-4827-96d4-018c2b9d244e	8	26	133	2025-10-22 08:41:26.07949	30	22
aca9b8e4-d912-4e08-837f-9bd605e6362d	11af9dc6-389d-4827-96d4-018c2b9d244e	9	21	75	2025-10-22 08:41:26.182966	27	17
ea919a45-7526-4cd9-944d-bd9d4ce69823	11af9dc6-389d-4827-96d4-018c2b9d244e	11	4	7	2025-10-22 08:41:26.407037	9	-1
1f696df9-3eb9-4709-a6f7-1912148d487d	11af9dc6-389d-4827-96d4-018c2b9d244e	12	-4	15	2025-10-22 08:41:26.535997	1	-8
db33673b-9b79-42b9-a17d-e49ce70f27ee	569d7973-ddea-4161-94f1-c247f083427c	1	12	46	2025-10-22 08:41:29.545996	18	7
e58951d9-b6b0-4224-a625-4775a370646a	569d7973-ddea-4161-94f1-c247f083427c	2	18	0	2025-10-22 08:41:29.66933	26	12
1f30996d-5bbe-4cb9-83d8-4ef239ba1084	569d7973-ddea-4161-94f1-c247f083427c	4	27	8	2025-10-22 08:41:29.92235	34	20
ed7f6c8d-19f7-4467-9255-81c7696d5bae	569d7973-ddea-4161-94f1-c247f083427c	5	29	40	2025-10-22 08:41:30.0475	36	23
a0bdc587-2c81-4e44-bb2e-75c891c4dabd	569d7973-ddea-4161-94f1-c247f083427c	6	31	144	2025-10-22 08:41:30.176685	37	26
1d1e0748-4f3f-4b40-ba6a-81b9dfcc48cf	569d7973-ddea-4161-94f1-c247f083427c	7	29	313	2025-10-22 08:41:30.295	33	26
d2409852-64fb-484f-8e1e-cdcf359db05b	569d7973-ddea-4161-94f1-c247f083427c	9	29	103	2025-10-22 08:41:30.547749	34	25
8a05ab36-a09a-4a3f-b5c3-1798ceee778d	569d7973-ddea-4161-94f1-c247f083427c	10	25	7	2025-10-22 08:41:30.6675	32	19
1dd9fb38-1785-48c1-bcab-2f8e7b2c453d	569d7973-ddea-4161-94f1-c247f083427c	11	20	14	2025-10-22 08:41:30.787758	26	14
b44fb114-23b0-48db-95b3-65249ef01a47	569d7973-ddea-4161-94f1-c247f083427c	12	15	1	2025-10-22 08:41:30.953024	22	9
c78fea4f-ccae-457b-937e-7eb8389edebf	c96f9299-3c94-48d5-ac6d-e3a0f258546d	2	20	0	2025-10-22 08:41:32.966487	28	13
61d8af6d-8073-4599-8910-7ef4a600fa5c	c96f9299-3c94-48d5-ac6d-e3a0f258546d	3	23	44	2025-10-22 08:41:33.089183	30	17
d3382db4-edfc-4f4c-8844-ea8d0557da1f	c96f9299-3c94-48d5-ac6d-e3a0f258546d	4	27	4	2025-10-22 08:41:33.199574	34	21
fc1298e6-2e29-4d08-bc35-c934a8922322	c96f9299-3c94-48d5-ac6d-e3a0f258546d	5	30	44	2025-10-22 08:41:33.33193	37	24
34070b7f-6548-406f-8068-5d50dac5c82e	c96f9299-3c94-48d5-ac6d-e3a0f258546d	7	29	216	2025-10-22 08:41:33.569228	33	25
1cf34866-108d-485b-8491-d5d164c6f2e1	c96f9299-3c94-48d5-ac6d-e3a0f258546d	8	28	23	2025-10-22 08:41:33.693844	33	25
bae10c12-f4b7-4d46-aafc-7d49b0c77b3b	c96f9299-3c94-48d5-ac6d-e3a0f258546d	9	28	64	2025-10-22 08:41:33.819968	33	24
f50517b6-dd6e-4025-8d2e-7ca79414b212	c96f9299-3c94-48d5-ac6d-e3a0f258546d	10	26	0	2025-10-22 08:41:33.941803	33	20
b7b3c834-f67b-46b5-ae86-602e29febc13	c96f9299-3c94-48d5-ac6d-e3a0f258546d	12	16	3	2025-10-22 08:41:34.184385	23	11
ff5dc4a5-7cd4-4c90-87aa-79d619b47a82	66ad2215-7608-44bc-888b-cf52a6f9abd3	2	9	29	2025-10-22 08:41:36.135241	12	7
a1f8799b-7dfe-4f6a-8c95-b8292a2c9ef4	66ad2215-7608-44bc-888b-cf52a6f9abd3	3	12	74	2025-10-22 08:41:36.260565	15	10
919ae293-2a2f-4f40-a97b-d8b742d12c4c	66ad2215-7608-44bc-888b-cf52a6f9abd3	4	14	57	2025-10-22 08:41:36.397178	17	11
c0f29c5f-bd02-48d8-85b1-4049bd5a1807	66ad2215-7608-44bc-888b-cf52a6f9abd3	5	18	86	2025-10-22 08:41:36.522493	22	16
50281954-e067-496b-a94a-d1e5689e0604	66ad2215-7608-44bc-888b-cf52a6f9abd3	7	25	80	2025-10-22 08:41:36.765196	28	22
01dd444a-bdc5-4615-9f6d-ddd687986180	66ad2215-7608-44bc-888b-cf52a6f9abd3	8	25	103	2025-10-22 08:41:36.907393	28	22
d343930c-036a-4324-b3af-980adf40e0d2	66ad2215-7608-44bc-888b-cf52a6f9abd3	9	23	188	2025-10-22 08:41:37.01777	26	20
a4a583bb-4843-40d2-a7b4-6bd5d74edb37	66ad2215-7608-44bc-888b-cf52a6f9abd3	10	19	402	2025-10-22 08:41:37.134838	21	17
baba0690-0018-4398-993f-607a8e9116c5	66ad2215-7608-44bc-888b-cf52a6f9abd3	12	11	146	2025-10-22 08:41:37.36587	14	9
5a9668cf-e861-4993-afe1-c18b02481336	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	1	-5	61	2025-10-22 08:41:39.229374	-3	-7
2c1df41d-cfdf-4650-b145-8a795b638052	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	2	-6	22	2025-10-22 08:41:39.343091	-4	-9
f2b3a2f0-df00-45af-9cd3-13fce6e3909d	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	3	-7	48	2025-10-22 08:41:39.457214	-4	-11
877cced9-813e-4852-a958-f06f704e6d09	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	5	8	44	2025-10-22 08:41:39.719399	13	3
efe95efe-3f33-4296-b956-ac8bb293ece9	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	6	14	46	2025-10-22 08:41:39.833064	19	9
fcf276f9-4086-4dc6-bd18-93c38cc18975	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	7	15	104	2025-10-22 08:41:39.947642	19	11
32cd4c23-6719-4682-a077-5e75014357e2	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	8	16	105	2025-10-22 08:41:40.05631	20	12
e5ee3463-c3f6-45fd-a59c-1b1427290371	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	10	0	84	2025-10-22 08:41:40.289546	2	-2
0d3774d8-0ca4-413d-aa4c-b7154cb09edc	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	11	-5	38	2025-10-22 08:41:40.406763	-3	-7
054f59ef-e5cd-4018-9241-3819aa9a12bb	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	12	-7	36	2025-10-22 08:41:40.523437	-6	-9
c9aeceed-0f3b-45cb-b0ba-535574733abe	ec4c8781-45d7-4340-ab1d-074681ca2966	1	25	86	2025-10-22 08:41:42.77937	30	22
dcb55b12-128e-4a33-850c-1ed1095d5a23	ec4c8781-45d7-4340-ab1d-074681ca2966	3	26	141	2025-10-22 08:41:43.014908	30	23
0ff4484d-4f14-4521-be35-f6490b246416	ec4c8781-45d7-4340-ab1d-074681ca2966	4	27	138	2025-10-22 08:41:43.127553	31	24
16c59882-03dc-43b9-a93b-1d15c8bd4f4d	ec4c8781-45d7-4340-ab1d-074681ca2966	5	27	238	2025-10-22 08:41:43.239333	30	25
027a4735-9a29-4dfd-a9cf-a3e5d3d7e080	ec4c8781-45d7-4340-ab1d-074681ca2966	6	27	379	2025-10-22 08:41:43.356484	29	25
f4a39f5e-4f2f-4914-b6d0-6cd1f82794f5	ec4c8781-45d7-4340-ab1d-074681ca2966	8	27	150	2025-10-22 08:41:43.584307	29	25
d7ad5458-f8b1-45b0-ae3a-a035d6ff2eeb	ec4c8781-45d7-4340-ab1d-074681ca2966	9	26	555	2025-10-22 08:41:43.706961	28	24
47130de8-8c93-40fd-8a5d-507ed39c165b	ec4c8781-45d7-4340-ab1d-074681ca2966	10	26	564	2025-10-22 08:41:43.835072	29	24
6a4c1e1b-eecb-4e6c-ab1f-277864aa2206	ec4c8781-45d7-4340-ab1d-074681ca2966	11	26	489	2025-10-22 08:41:43.956332	29	23
7c2f7e4d-76c9-4650-a9c2-f6238c9a9737	c58451eb-3f30-48cf-bc87-2459e7c2a910	1	12	12	2025-10-22 08:41:45.942764	19	5
d4ce667d-5de9-4a26-9657-61437c0521a4	c58451eb-3f30-48cf-bc87-2459e7c2a910	2	13	71	2025-10-22 08:41:46.060116	20	7
e06df47b-081e-4ab2-b15e-ddf217d1b202	c58451eb-3f30-48cf-bc87-2459e7c2a910	3	19	3	2025-10-22 08:41:46.169136	28	11
e977db6c-3166-48c3-a38a-63aa0279c58c	c58451eb-3f30-48cf-bc87-2459e7c2a910	4	22	38	2025-10-22 08:41:46.279495	31	14
15f12dcc-1b98-474f-a3de-92a049350ff8	c58451eb-3f30-48cf-bc87-2459e7c2a910	6	27	2	2025-10-22 08:41:46.502952	35	19
bb7cfc62-0fcc-4a0b-a63e-18cb982f4a68	c58451eb-3f30-48cf-bc87-2459e7c2a910	7	30	1	2025-10-22 08:41:46.614271	39	21
d8c2e2bd-99b0-417f-ae31-99c377595278	c58451eb-3f30-48cf-bc87-2459e7c2a910	8	32	0	2025-10-22 08:41:46.725807	41	23
21af7de8-2bb9-4db5-8ccc-bea64394bbca	c58451eb-3f30-48cf-bc87-2459e7c2a910	9	25	1	2025-10-22 08:41:46.845055	32	18
66ac7d11-5ca4-417e-9dcf-2fa6a48bc48d	c58451eb-3f30-48cf-bc87-2459e7c2a910	11	18	4	2025-10-22 08:41:47.089187	26	10
4b4e222f-2cc0-43ac-aa03-63ebc8387ffb	c58451eb-3f30-48cf-bc87-2459e7c2a910	12	14	7	2025-10-22 08:41:47.212754	22	7
c8c71887-c54a-4dae-887a-7e0fd0aa81c9	f392bd89-c29f-44bb-86d5-72ab0afb2f31	1	16	0	2025-10-22 08:41:49.065158	22	11
62929eba-9346-472f-9621-21e327462351	f392bd89-c29f-44bb-86d5-72ab0afb2f31	2	16	77	2025-10-22 08:41:49.181381	22	12
17d1529f-b2df-41e6-91b6-ac249eb6ca4d	f392bd89-c29f-44bb-86d5-72ab0afb2f31	4	21	2	2025-10-22 08:41:49.40716	28	17
92583145-7cb0-4ff7-9f85-64262c348b67	f392bd89-c29f-44bb-86d5-72ab0afb2f31	5	22	1	2025-10-22 08:41:49.526051	28	17
4809870f-da04-49d5-b789-902becb755d0	f392bd89-c29f-44bb-86d5-72ab0afb2f31	6	24	8	2025-10-22 08:41:49.640887	30	20
df1cbda3-da4f-47fa-b90b-6a789cf8b484	f392bd89-c29f-44bb-86d5-72ab0afb2f31	7	25	0	2025-10-22 08:41:49.75167	31	20
9b02c919-e56f-412e-bead-73e07742bcf1	f392bd89-c29f-44bb-86d5-72ab0afb2f31	9	23	0	2025-10-22 08:41:49.979774	29	19
9c54fae0-003e-42b1-b73c-9d8f8742dc41	f392bd89-c29f-44bb-86d5-72ab0afb2f31	10	26	59	2025-10-22 08:41:50.102671	32	21
90d94deb-419a-4513-b04e-1813cde6627c	f392bd89-c29f-44bb-86d5-72ab0afb2f31	11	21	0	2025-10-22 08:41:50.218762	27	16
99ddf7c0-576f-49f5-a3ac-6372b07cca73	f392bd89-c29f-44bb-86d5-72ab0afb2f31	12	18	3	2025-10-22 08:41:50.324185	24	14
ebf7415e-2748-4e61-8edc-02f0399f7cac	bb32438a-cdd2-4334-b47e-76fa8f05fa02	2	14	1	2025-10-22 08:41:52.286742	20	9
a3d3f427-3111-4d84-bae9-624ea41de867	bb32438a-cdd2-4334-b47e-76fa8f05fa02	3	20	6	2025-10-22 08:41:52.40133	26	14
3b5a8ee3-c092-4332-a050-07beaad09424	bb32438a-cdd2-4334-b47e-76fa8f05fa02	4	23	2	2025-10-22 08:41:52.540261	30	16
58853b3c-4262-4fbe-9dea-ccd10a91d2fb	bb32438a-cdd2-4334-b47e-76fa8f05fa02	5	26	0	2025-10-22 08:41:52.6768	33	19
c12c547b-6ba4-4792-9eb9-0c3876a92ca1	bb32438a-cdd2-4334-b47e-76fa8f05fa02	7	32	0	2025-10-22 08:41:52.906167	40	24
1877b242-182e-41c4-a868-536ce9f6de9b	bb32438a-cdd2-4334-b47e-76fa8f05fa02	8	31	0	2025-10-22 08:41:53.014256	38	24
dc44be19-f6d4-4116-bbb1-ab2ed5ef60d4	bb32438a-cdd2-4334-b47e-76fa8f05fa02	9	30	0	2025-10-22 08:41:53.135795	37	23
dfc87a3b-291f-48cb-90b6-d91525a3cc47	bb32438a-cdd2-4334-b47e-76fa8f05fa02	10	26	1	2025-10-22 08:41:53.273845	32	21
42c4de4a-3cb3-4eae-819d-605e08e84be7	bb32438a-cdd2-4334-b47e-76fa8f05fa02	12	18	10	2025-10-22 08:41:53.497325	23	13
1413eecf-d422-482e-b077-929a4307989f	77bde8e3-6499-424b-b5be-c08527274254	1	19	1	2025-10-22 08:41:55.323656	23	14
05b32a6b-2d7a-4ad8-8647-144e818153cf	77bde8e3-6499-424b-b5be-c08527274254	2	18	0	2025-10-22 08:41:55.448531	23	13
a55c023f-b2f2-4340-92bb-65add490fa7d	77bde8e3-6499-424b-b5be-c08527274254	3	22	8	2025-10-22 08:41:55.562734	27	17
4ef3f543-bb82-4b3a-bd02-89477aa5c098	77bde8e3-6499-424b-b5be-c08527274254	5	29	4	2025-10-22 08:41:55.783661	34	23
f49b864b-7499-4587-9c43-40508303aef2	77bde8e3-6499-424b-b5be-c08527274254	6	34	0	2025-10-22 08:41:55.898794	38	28
418feacf-ccf3-49f7-bbf5-4217d65f9148	77bde8e3-6499-424b-b5be-c08527274254	7	36	0	2025-10-22 08:41:56.02084	41	30
c2b053fb-53de-475a-917c-25363de8bc70	77bde8e3-6499-424b-b5be-c08527274254	8	36	0	2025-10-22 08:41:56.143473	41	31
1524711a-8023-4640-9525-590f927a1deb	77bde8e3-6499-424b-b5be-c08527274254	10	29	2	2025-10-22 08:41:56.384464	34	25
b1620319-fdc7-4d35-8587-fddc27d12142	77bde8e3-6499-424b-b5be-c08527274254	11	26	0	2025-10-22 08:41:56.501006	30	22
69083f1c-456e-4d72-bf62-c8c96f4ec4e3	77bde8e3-6499-424b-b5be-c08527274254	12	22	3	2025-10-22 08:41:56.609667	26	17
a3a6a7c7-fccd-4f12-901b-1064a0c02ca1	1573b4b0-d2f5-4233-a921-d389464b2652	1	21	7	2025-10-22 08:41:58.544275	27	16
44cdf467-2a32-4f3c-8fb8-19fa01b46ef3	1573b4b0-d2f5-4233-a921-d389464b2652	3	19	80	2025-10-22 08:41:58.803057	24	15
836cf606-1c4d-4f3f-887e-98b0fcf4b008	1573b4b0-d2f5-4233-a921-d389464b2652	4	17	91	2025-10-22 08:41:58.935316	22	12
32fa6272-b89e-4c24-8b72-99a8d38649f6	1573b4b0-d2f5-4233-a921-d389464b2652	5	14	83	2025-10-22 08:41:59.057292	19	11
afae5b11-b293-40eb-99e6-2738bda229ba	1573b4b0-d2f5-4233-a921-d389464b2652	6	13	176	2025-10-22 08:41:59.165219	16	10
17214609-00b2-4b2b-9504-14da1117df13	1573b4b0-d2f5-4233-a921-d389464b2652	8	13	85	2025-10-22 08:41:59.418359	19	8
8923144b-5297-4d84-8e96-abbf136c9623	1573b4b0-d2f5-4233-a921-d389464b2652	9	13	116	2025-10-22 08:41:59.53717	17	8
ff273bb0-0cbb-440c-a0ad-95c23ee45c6b	1573b4b0-d2f5-4233-a921-d389464b2652	10	18	11	2025-10-22 08:41:59.65319	24	12
6a783048-fe49-4f0a-a440-383a0ffe449b	1573b4b0-d2f5-4233-a921-d389464b2652	11	19	16	2025-10-22 08:41:59.765079	26	14
27b03ea7-229e-414a-9559-a484a6ac4a02	6c0bd24e-14ca-4c80-b29c-71745928da50	1	19	11	2025-10-22 08:42:01.716569	26	13
52fdf273-7932-46da-9659-11c183b9b558	6c0bd24e-14ca-4c80-b29c-71745928da50	3	20	71	2025-10-22 08:42:02.067273	27	15
31559b58-73e1-450d-83e7-7892099e53f7	6c0bd24e-14ca-4c80-b29c-71745928da50	4	19	159	2025-10-22 08:42:02.187028	24	15
580b33db-d587-4e65-a939-b44ec62986f7	6c0bd24e-14ca-4c80-b29c-71745928da50	5	19	88	2025-10-22 08:42:02.308391	24	15
bb834413-d1d1-44ee-8d2c-94a67ee465c8	6c0bd24e-14ca-4c80-b29c-71745928da50	6	18	24	2025-10-22 08:42:02.434739	25	13
cc272f04-9584-4ae3-84e5-b00e8f3a43fc	6c0bd24e-14ca-4c80-b29c-71745928da50	8	18	14	2025-10-22 08:42:02.684633	24	13
4c89ce48-628a-431c-888d-2665fb00a1d3	6c0bd24e-14ca-4c80-b29c-71745928da50	9	19	29	2025-10-22 08:42:02.793234	26	14
11a6c725-aa05-41a2-bc9d-d16fc77eb698	6c0bd24e-14ca-4c80-b29c-71745928da50	10	20	57	2025-10-22 08:42:02.913556	27	15
cbd29026-8ab5-4340-9a64-c2ddc0f457a2	6c0bd24e-14ca-4c80-b29c-71745928da50	11	19	184	2025-10-22 08:42:03.03073	24	15
9de3ebf6-22cc-4f06-8695-24ad279d7c7b	d912c555-48dc-4e7e-966d-69dd759dbd67	1	28	29	2025-10-22 08:42:04.975762	32	25
a81c6800-8994-442e-a13b-85d9123be777	d912c555-48dc-4e7e-966d-69dd759dbd67	2	29	19	2025-10-22 08:42:05.087681	34	25
4be35ade-10be-4572-bd70-7bea739a3ba6	d912c555-48dc-4e7e-966d-69dd759dbd67	3	28	113	2025-10-22 08:42:05.200902	32	25
c33a79fa-06ea-4bf6-b155-c49dc2251b8f	d912c555-48dc-4e7e-966d-69dd759dbd67	4	26	439	2025-10-22 08:42:05.311151	29	24
16e2527a-b274-49e9-9993-119330b9a498	d912c555-48dc-4e7e-966d-69dd759dbd67	6	25	61	2025-10-22 08:42:05.547125	28	23
ebe6fd00-11ab-4f91-a7d8-8ab896811d2a	d912c555-48dc-4e7e-966d-69dd759dbd67	7	25	58	2025-10-22 08:42:05.660023	28	22
a8b30533-63bb-48fd-92ad-0bd3e2836ecf	d912c555-48dc-4e7e-966d-69dd759dbd67	8	25	67	2025-10-22 08:42:05.771396	29	22
7080ccf1-56f4-400f-b490-dd4810a2f140	d912c555-48dc-4e7e-966d-69dd759dbd67	9	26	44	2025-10-22 08:42:05.879281	31	22
718fd22c-7bd9-4317-8d06-4e21f3059941	d912c555-48dc-4e7e-966d-69dd759dbd67	11	26	440	2025-10-22 08:42:06.107707	28	24
a65c4656-3489-49ee-938a-6772e576dc10	d912c555-48dc-4e7e-966d-69dd759dbd67	12	27	137	2025-10-22 08:42:06.224049	31	25
263f4e11-abaa-4ee0-b1d0-46a419f6b15f	233e5db9-17a5-4176-9ebf-a70ab0181294	1	22	363	2025-10-22 08:42:08.220117	25	20
4cc1b000-975d-4e63-b422-d363c87d37f6	233e5db9-17a5-4176-9ebf-a70ab0181294	2	23	126	2025-10-22 08:42:08.337501	25	20
8c9181dd-2ba6-4c87-883c-2cdb89f850ad	233e5db9-17a5-4176-9ebf-a70ab0181294	4	22	149	2025-10-22 08:42:08.555603	25	20
e705d2d4-ac4c-4cbc-8f26-0e413aab1f72	233e5db9-17a5-4176-9ebf-a70ab0181294	5	21	162	2025-10-22 08:42:08.672514	24	19
b80c23eb-fd89-45d1-9603-2bc4b159b598	233e5db9-17a5-4176-9ebf-a70ab0181294	6	19	60	2025-10-22 08:42:08.784357	22	17
cd014539-bbf1-4a39-9075-278dc591a771	233e5db9-17a5-4176-9ebf-a70ab0181294	7	19	55	2025-10-22 08:42:08.914319	22	16
143743cf-8cfb-408d-a9af-e76d4f47263a	233e5db9-17a5-4176-9ebf-a70ab0181294	9	19	54	2025-10-22 08:42:09.144969	22	17
84696a84-9338-48ec-ac74-af147de4bcef	233e5db9-17a5-4176-9ebf-a70ab0181294	10	21	113	2025-10-22 08:42:09.262221	25	18
a1d1bce1-d8fc-45b1-ae05-0bbc2dc40d75	233e5db9-17a5-4176-9ebf-a70ab0181294	11	22	150	2025-10-22 08:42:09.379282	25	19
7d37ef1c-e372-447a-8587-41855f386429	233e5db9-17a5-4176-9ebf-a70ab0181294	12	23	267	2025-10-22 08:42:09.504338	26	20
a561ebef-8dc5-4147-8794-d061fcbbba95	21efc7c2-226e-4e70-ae43-276f5e08fb09	2	28	119	2025-10-22 08:42:11.508071	28	26
572cf225-7ec4-43a1-9169-53198b47656c	21efc7c2-226e-4e70-ae43-276f5e08fb09	3	28	120	2025-10-22 08:42:11.620453	29	26
09f46548-aa3e-4b37-bf9e-995fd78d720b	21efc7c2-226e-4e70-ae43-276f5e08fb09	4	28	290	2025-10-22 08:42:11.739238	29	26
1ce45939-06fe-4dba-a478-2f58126d9fb7	21efc7c2-226e-4e70-ae43-276f5e08fb09	5	28	54	2025-10-22 08:42:11.860679	29	27
dfec258b-b55e-4290-8896-15491c155f77	21efc7c2-226e-4e70-ae43-276f5e08fb09	7	26	73	2025-10-22 08:42:12.101516	26	25
f708e8dc-1d8a-4ea4-a6af-b0173269c004	21efc7c2-226e-4e70-ae43-276f5e08fb09	8	26	101	2025-10-22 08:42:12.231878	27	26
8b387130-5c3e-4dc5-bd95-4e7c195f5a5f	21efc7c2-226e-4e70-ae43-276f5e08fb09	9	27	470	2025-10-22 08:42:12.3443	28	26
1b9ea052-537d-40a6-9ed6-d6274e5a4df7	21efc7c2-226e-4e70-ae43-276f5e08fb09	10	27	229	2025-10-22 08:42:12.454081	28	26
5c312a6d-8dfe-48aa-88e6-89c51c66341b	21efc7c2-226e-4e70-ae43-276f5e08fb09	12	27	677	2025-10-22 08:42:12.683338	28	26
d21c866d-2d86-46f6-ae08-0f83a8f0e718	a2220d3a-edc0-4b94-b63e-6f15223d08f7	1	4	126	2025-10-22 08:42:14.56323	8	1
f30308c8-86e5-4437-87b8-d669f01838dc	a2220d3a-edc0-4b94-b63e-6f15223d08f7	2	3	48	2025-10-22 08:42:14.679286	8	-1
f212c6bc-20b4-4fcc-a11d-dc54567db0ae	a2220d3a-edc0-4b94-b63e-6f15223d08f7	3	5	120	2025-10-22 08:42:14.793455	10	1
0c0d3714-182a-4982-aaf5-d3e4fa822e12	a2220d3a-edc0-4b94-b63e-6f15223d08f7	5	15	37	2025-10-22 08:42:15.035465	21	10
a14d95a1-71ad-4e8c-bac6-80e14ba19db2	a2220d3a-edc0-4b94-b63e-6f15223d08f7	6	20	97	2025-10-22 08:42:15.155738	25	15
9564a111-ea88-4cc0-9baa-3a20b7d02476	a2220d3a-edc0-4b94-b63e-6f15223d08f7	7	25	183	2025-10-22 08:42:15.27302	30	20
3c474b4c-b32a-479a-ab7b-44f171c791f4	a2220d3a-edc0-4b94-b63e-6f15223d08f7	8	23	131	2025-10-22 08:42:15.390304	28	18
1bfaf300-48a5-4fb6-bf1a-b07dbbaace3b	a2220d3a-edc0-4b94-b63e-6f15223d08f7	10	14	123	2025-10-22 08:42:15.613031	19	10
4b6f638a-23cf-4ee6-af0a-b472f01995da	a2220d3a-edc0-4b94-b63e-6f15223d08f7	11	6	54	2025-10-22 08:42:15.729843	11	2
c54fe774-d774-44fd-b854-cd1e257cdaa5	a2220d3a-edc0-4b94-b63e-6f15223d08f7	12	5	219	2025-10-22 08:42:15.848674	9	1
6562f1ae-9064-4c74-b016-379246420a19	308a9847-f5ea-42df-a771-7aba5195bd68	1	17	43	2025-10-22 08:42:19.890698	23	12
51005fae-7f48-496d-8a57-f78ebf850a8f	308a9847-f5ea-42df-a771-7aba5195bd68	3	21	57	2025-10-22 08:42:20.214929	28	16
ed9b7bb9-d89d-4a48-be2f-9bbc003dd9c8	308a9847-f5ea-42df-a771-7aba5195bd68	4	23	151	2025-10-22 08:42:20.332515	29	18
bf3c04c8-8abe-4ebf-a4f2-f70a679115ea	308a9847-f5ea-42df-a771-7aba5195bd68	5	24	150	2025-10-22 08:42:20.446531	29	19
bb644ee2-d4f9-4594-aecd-027a5f505edd	308a9847-f5ea-42df-a771-7aba5195bd68	6	26	250	2025-10-22 08:42:20.56279	32	22
7b4fd39a-f843-42cf-a98d-1fe715550b2e	308a9847-f5ea-42df-a771-7aba5195bd68	8	28	118	2025-10-22 08:42:20.788761	34	25
be3e5d16-5b9f-497b-a333-f77062731328	308a9847-f5ea-42df-a771-7aba5195bd68	9	26	285	2025-10-22 08:42:20.915492	31	22
d8930499-dec8-410a-a06f-01fbdd42f12a	308a9847-f5ea-42df-a771-7aba5195bd68	10	23	68	2025-10-22 08:42:21.025774	28	19
06415314-1257-4a57-ac2c-787c6fd85fef	308a9847-f5ea-42df-a771-7aba5195bd68	11	20	151	2025-10-22 08:42:21.150706	25	16
595bd101-3a0d-4010-97a8-f9d0a269731e	7f82c313-1e45-4860-8fa7-3cfc79e6f378	1	22	21	2025-10-22 08:42:23.110589	25	18
2e54c71c-1764-49bb-bfb3-d52c6fa9d3ce	7f82c313-1e45-4860-8fa7-3cfc79e6f378	2	23	63	2025-10-22 08:42:23.223622	27	20
0996b247-5934-4929-b761-5e6a9db1e81d	7f82c313-1e45-4860-8fa7-3cfc79e6f378	3	24	132	2025-10-22 08:42:23.33779	27	21
41a8a35b-7589-4b44-aa45-8abc03c23dc5	7f82c313-1e45-4860-8fa7-3cfc79e6f378	4	25	180	2025-10-22 08:42:23.455595	28	21
fd225baf-c9c9-4efc-a9e8-8b6afe0b579a	7f82c313-1e45-4860-8fa7-3cfc79e6f378	6	26	273	2025-10-22 08:42:23.688132	30	23
efa05a1e-75dd-4b5c-baaa-0fb5b7d964db	7f82c313-1e45-4860-8fa7-3cfc79e6f378	7	28	153	2025-10-22 08:42:23.812021	32	25
01d93d50-2c2d-479b-b9f2-0c9757585d92	7f82c313-1e45-4860-8fa7-3cfc79e6f378	8	29	185	2025-10-22 08:42:23.920592	32	26
f4efcdfb-671e-4996-a91e-9d25dd03fc7d	7f82c313-1e45-4860-8fa7-3cfc79e6f378	9	27	185	2025-10-22 08:42:24.038594	31	25
0d7de853-f126-4eae-9538-41b88db4d37a	7f82c313-1e45-4860-8fa7-3cfc79e6f378	11	24	262	2025-10-22 08:42:24.265244	27	21
cdd4a066-1b55-47fa-b096-9a5ced1c22e4	7f82c313-1e45-4860-8fa7-3cfc79e6f378	12	21	264	2025-10-22 08:42:24.380976	24	19
a2370ed5-aa4c-49e0-916e-457b8874f809	c1d63475-0721-4bf5-b1d2-a19fd88051f3	1	11	259	2025-10-22 08:42:26.203561	16	6
2a4122ee-0415-48e8-9a2d-b812b4ad493c	c1d63475-0721-4bf5-b1d2-a19fd88051f3	2	11	127	2025-10-22 08:42:26.310212	17	5
737dba2b-cfd3-478c-aebb-6fe1daeb3694	c1d63475-0721-4bf5-b1d2-a19fd88051f3	4	15	4	2025-10-22 08:42:26.538096	22	10
575e1671-7d40-4400-b7b7-622bee6d4d66	c1d63475-0721-4bf5-b1d2-a19fd88051f3	5	16	24	2025-10-22 08:42:26.648434	22	12
b51217d9-ff53-4f63-8395-20173416e862	c1d63475-0721-4bf5-b1d2-a19fd88051f3	6	18	5	2025-10-22 08:42:26.762652	24	14
d1baf327-5fed-4eb7-bdd1-332f8353c3ad	c1d63475-0721-4bf5-b1d2-a19fd88051f3	7	23	0	2025-10-22 08:42:26.906744	32	17
f15a4ef7-bd78-43ed-a06b-916667818de7	c1d63475-0721-4bf5-b1d2-a19fd88051f3	9	21	50	2025-10-22 08:42:27.112608	27	17
2d87a119-9089-4d37-a005-015a80a8faa6	c1d63475-0721-4bf5-b1d2-a19fd88051f3	10	20	2	2025-10-22 08:42:27.250357	28	15
226f712c-9ea7-43fa-a7ed-b3557143d033	c1d63475-0721-4bf5-b1d2-a19fd88051f3	11	16	28	2025-10-22 08:42:27.362333	24	10
240134d7-f50c-496d-af52-47dc6e7f3530	c1d63475-0721-4bf5-b1d2-a19fd88051f3	12	14	179	2025-10-22 08:42:27.479758	20	10
7694e4b3-9272-4959-8790-b29c8c47bb0b	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	2	9	88	2025-10-22 08:42:29.462097	12	6
e6f688ac-2aed-44a1-8adb-8ee7e0aa171e	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	4	11	4	2025-10-22 08:42:29.679105	14	9
9dcf9d5e-8bb0-4cba-829b-debca298bd2f	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	5	13	32	2025-10-22 08:42:29.789738	15	11
b5730a2f-faa3-46b5-aeca-4fad6a3e62df	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	6	14	1	2025-10-22 08:42:29.906407	17	12
12f62f40-7bf0-4a47-9e2d-e9a4eaccc0b3	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	7	15	0	2025-10-22 08:42:30.02983	19	13
cb15cd4b-4711-459e-91aa-55573130e8f6	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	9	17	2	2025-10-22 08:42:30.277037	20	14
853be128-e097-4382-83a8-d68e0dd9764e	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	10	17	11	2025-10-22 08:42:30.38146	22	13
031d0765-4363-4d18-8bc6-7ff44b879c75	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	11	13	79	2025-10-22 08:42:30.485086	18	10
09ebfc9f-b47d-432b-8ad0-80b049e386a6	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	12	12	174	2025-10-22 08:42:30.609008	15	9
03001a4c-8656-4aac-a553-0fc3e1cb8f48	fc0875fa-a672-4034-925e-5070a23d5dde	2	25	62	2025-10-22 08:42:32.846998	27	23
503550ff-9654-4500-a2ad-530ced8f0b6d	fc0875fa-a672-4034-925e-5070a23d5dde	3	26	55	2025-10-22 08:42:32.959156	28	23
6e48acea-35d4-45f2-bdf3-5a3eeab97e6b	fc0875fa-a672-4034-925e-5070a23d5dde	4	26	35	2025-10-22 08:42:33.07347	30	24
dbda9f2f-9b57-4103-9c9d-e5a148b953a9	fc0875fa-a672-4034-925e-5070a23d5dde	5	27	100	2025-10-22 08:42:33.189805	31	24
e653b5e5-0e75-4f1a-a944-5de4e9cd8750	fc0875fa-a672-4034-925e-5070a23d5dde	7	29	112	2025-10-22 08:42:33.43321	32	26
70a55f25-baea-4054-a787-cec50a23f7f5	fc0875fa-a672-4034-925e-5070a23d5dde	8	29	221	2025-10-22 08:42:33.546786	32	26
395f6159-dd8d-48c6-9763-459427bef6f2	fc0875fa-a672-4034-925e-5070a23d5dde	9	28	87	2025-10-22 08:42:33.660582	32	25
e2b0f0d7-03fc-422b-a3a3-18707343212f	fc0875fa-a672-4034-925e-5070a23d5dde	10	27	45	2025-10-22 08:42:33.7818	31	25
d5a82c29-13f6-4b85-80ba-0b2b13f83a25	fc0875fa-a672-4034-925e-5070a23d5dde	12	24	92	2025-10-22 08:42:34.009744	27	22
6807c232-fe7b-4a60-afe5-df4a0433539a	c6f40f33-aebe-4842-a810-1454b5765789	1	25	55	2025-10-22 08:42:35.862229	27	23
4c9b6567-44fd-414a-8442-bb46e2a36434	c6f40f33-aebe-4842-a810-1454b5765789	2	25	46	2025-10-22 08:42:35.96847	28	23
483635a7-6f7a-4d88-8f5a-83fc718dcce6	c6f40f33-aebe-4842-a810-1454b5765789	3	26	39	2025-10-22 08:42:36.072515	28	24
93508b3d-ac87-4458-b697-2bcfa71d4829	c6f40f33-aebe-4842-a810-1454b5765789	5	27	95	2025-10-22 08:42:36.297686	31	24
8818070a-abe6-4c8d-b9bc-0ce0a6f0efb9	c6f40f33-aebe-4842-a810-1454b5765789	6	28	130	2025-10-22 08:42:36.401306	31	26
5a2d735c-13f0-467b-aff8-142919f5cfff	c6f40f33-aebe-4842-a810-1454b5765789	7	29	87	2025-10-22 08:42:36.521297	32	26
8a73ee94-cefa-426e-9a13-3d3eee677147	c6f40f33-aebe-4842-a810-1454b5765789	8	28	202	2025-10-22 08:42:36.626487	32	26
9f1b76fb-4ff4-46f2-a50f-ce2e88f1e05e	c6f40f33-aebe-4842-a810-1454b5765789	10	27	66	2025-10-22 08:42:36.851037	31	25
374dfd9b-51cc-4cc6-a871-be7386509048	c6f40f33-aebe-4842-a810-1454b5765789	11	26	108	2025-10-22 08:42:36.959303	29	23
4928a987-2382-4c38-b70e-b903505cf3fe	c6f40f33-aebe-4842-a810-1454b5765789	12	24	74	2025-10-22 08:42:37.071591	27	22
9d188f3c-5479-4b5e-a303-0edad45df238	cca3e83c-81e1-44b5-98c7-920d668fa450	1	26	220	2025-10-22 08:42:38.931365	30	23
9e78d44d-4a6f-4b8f-93b8-d50bde64f92f	cca3e83c-81e1-44b5-98c7-920d668fa450	3	27	62	2025-10-22 08:42:39.169471	32	23
72eea528-b048-4547-bd85-b7fd1c744474	cca3e83c-81e1-44b5-98c7-920d668fa450	4	24	96	2025-10-22 08:42:39.279581	28	21
9682ad27-e233-4a68-8f8e-c2b74e175a44	cca3e83c-81e1-44b5-98c7-920d668fa450	5	22	59	2025-10-22 08:42:39.396988	26	19
824a1fa2-2952-4b0a-8498-89aad76f1334	cca3e83c-81e1-44b5-98c7-920d668fa450	6	21	32	2025-10-22 08:42:39.507157	26	17
03cc28bb-7e4b-4d22-8d42-9c905838dbe1	cca3e83c-81e1-44b5-98c7-920d668fa450	8	22	109	2025-10-22 08:42:39.744805	27	18
ceec92f8-aca5-4fa5-8418-6645b869505d	cca3e83c-81e1-44b5-98c7-920d668fa450	9	24	29	2025-10-22 08:42:39.852987	30	19
a70c5ad6-45b1-4afd-a7f2-80e1a1604dfe	cca3e83c-81e1-44b5-98c7-920d668fa450	10	25	71	2025-10-22 08:42:39.963596	29	21
a6dc5b0e-3e3d-4c98-b77b-ebfe0a80c682	cca3e83c-81e1-44b5-98c7-920d668fa450	11	27	59	2025-10-22 08:42:40.071138	32	22
0b129e5a-3765-457a-90dd-340960787fe4	de8907fb-039d-413e-9c03-920965ce771f	1	25	41	2025-10-22 08:42:42.086398	30	22
09392331-2376-442f-a2f5-a13d92cf354d	de8907fb-039d-413e-9c03-920965ce771f	2	24	20	2025-10-22 08:42:42.198672	29	20
979ed9db-09ed-4bcc-b907-8b1ba237d62e	de8907fb-039d-413e-9c03-920965ce771f	3	25	140	2025-10-22 08:42:42.30923	28	22
a123012e-bacf-44b4-b980-ed9d964fcc43	de8907fb-039d-413e-9c03-920965ce771f	4	18	84	2025-10-22 08:42:42.426003	21	15
02001378-c9a1-4a33-ab73-7ba26fdcede9	de8907fb-039d-413e-9c03-920965ce771f	6	12	25	2025-10-22 08:42:42.665845	15	8
0021bb4c-9f47-4cad-91c8-6a545d954752	de8907fb-039d-413e-9c03-920965ce771f	7	12	55	2025-10-22 08:42:42.777787	15	9
80ed2da4-a08b-4ed1-973a-c1d1d8fa1645	de8907fb-039d-413e-9c03-920965ce771f	8	12	53	2025-10-22 08:42:42.90138	17	9
ff4c1c90-2bf5-44d3-9a89-1f7369362466	de8907fb-039d-413e-9c03-920965ce771f	9	14	51	2025-10-22 08:42:43.012877	17	10
c8352ba4-4460-4564-896c-7cc572065d9d	de8907fb-039d-413e-9c03-920965ce771f	11	20	122	2025-10-22 08:42:43.236049	24	16
cc5c8d5c-65c0-4b45-ab11-4642a7c8dac2	de8907fb-039d-413e-9c03-920965ce771f	12	22	154	2025-10-22 08:42:43.360072	26	18
e0e069cd-a76d-4847-8523-b725d2572f0e	da22f443-5e49-4961-8f29-172c69689f8f	1	21	16	2025-10-22 08:42:45.18449	23	18
614aa00e-0241-4054-a3f5-f1203edf7d88	da22f443-5e49-4961-8f29-172c69689f8f	2	23	18	2025-10-22 08:42:45.307485	25	21
298f50e6-ce01-48be-82dd-8501d8c0dc95	da22f443-5e49-4961-8f29-172c69689f8f	4	24	1	2025-10-22 08:42:45.529971	26	21
0864577b-7b24-4be4-938a-c67037c84ad1	da22f443-5e49-4961-8f29-172c69689f8f	5	20	3	2025-10-22 08:42:45.638729	23	18
bff2de3d-0d98-4b3b-816b-32e6b634c1ec	da22f443-5e49-4961-8f29-172c69689f8f	6	19	0	2025-10-22 08:42:45.754739	22	17
f0f9706b-3cff-4613-9c5c-877b74cbb3eb	da22f443-5e49-4961-8f29-172c69689f8f	7	18	1	2025-10-22 08:42:45.858255	21	16
b8a12b0c-6411-4d7c-83a9-9e0bd62d4a83	da22f443-5e49-4961-8f29-172c69689f8f	9	18	4	2025-10-22 08:42:46.089821	20	16
9e89cab0-e178-43ea-8dd8-f29d858dc9f0	da22f443-5e49-4961-8f29-172c69689f8f	10	18	2	2025-10-22 08:42:46.196825	21	16
36212e66-cac9-48df-95e5-ce14fb3b1021	da22f443-5e49-4961-8f29-172c69689f8f	11	19	1	2025-10-22 08:42:46.324541	21	17
e17373d0-38e9-4250-91a3-8ea3443174aa	da22f443-5e49-4961-8f29-172c69689f8f	12	20	7	2025-10-22 08:42:46.429341	23	18
58e79b27-0903-47fc-8406-e0b7aa342c30	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	2	22	96	2025-10-22 08:42:48.34828	26	18
c6298df3-404f-4935-b015-0635ab0d759b	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	3	22	99	2025-10-22 08:42:48.45809	26	18
f91a92b4-19e9-4bd6-bb00-82017c871cba	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	4	17	84	2025-10-22 08:42:48.590961	22	13
bc227350-5858-4c58-9167-7b9cbbca4335	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	5	13	30	2025-10-22 08:42:48.698467	19	9
bde1112c-3bc3-47ab-8a60-ec213152f9c7	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	7	12	22	2025-10-22 08:42:48.92533	19	8
df47a498-07dd-4bf7-b871-a84c3e21b8da	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	8	13	42	2025-10-22 08:42:49.047865	19	8
c9018e74-415d-4e3a-bec2-2f9e2099e0a7	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	9	16	19	2025-10-22 08:42:49.159464	23	10
6558ac34-8d51-43f5-b667-65ce2b86e779	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	10	18	42	2025-10-22 08:42:49.282879	24	12
b78563ac-2cd2-4409-9b70-929fecb81842	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	12	22	118	2025-10-22 08:42:49.495154	26	18
44c4974d-fe24-46bf-8565-c0248355f3b1	a0da746c-34bf-41ec-a76d-8ba13eea02fa	1	20	34	2025-10-22 08:42:51.315468	26	15
d34d2dce-a49e-4f3c-91c8-cab9b46714d7	a0da746c-34bf-41ec-a76d-8ba13eea02fa	2	19	31	2025-10-22 08:42:51.422378	25	14
0d2f3590-48d9-483c-8ade-73a932d4e74c	a0da746c-34bf-41ec-a76d-8ba13eea02fa	3	18	45	2025-10-22 08:42:51.528144	23	13
9255d99d-87de-4dea-8f42-776749e2cfb8	a0da746c-34bf-41ec-a76d-8ba13eea02fa	5	11	92	2025-10-22 08:42:51.759693	15	8
a39545e6-5a62-4c4e-bd54-9c0e447f3bb5	a0da746c-34bf-41ec-a76d-8ba13eea02fa	6	11	74	2025-10-22 08:42:51.876835	14	8
bc7994ab-44b7-4553-9e8a-99a7f960f6c8	a0da746c-34bf-41ec-a76d-8ba13eea02fa	7	11	30	2025-10-22 08:42:51.991042	14	8
2fe04ae2-acb7-4172-b2e7-9b14dfdedd5e	a0da746c-34bf-41ec-a76d-8ba13eea02fa	8	11	56	2025-10-22 08:42:52.110028	15	7
e0e93ced-a9c6-4ec5-8d70-8d8d9727957e	a0da746c-34bf-41ec-a76d-8ba13eea02fa	10	14	103	2025-10-22 08:42:52.327967	19	9
e91dcc1c-b9fa-4733-825c-276f467bfdbe	a0da746c-34bf-41ec-a76d-8ba13eea02fa	11	17	55	2025-10-22 08:42:52.439273	21	13
9f38e242-8c29-4c44-ae2f-63d359ecf2ff	a0da746c-34bf-41ec-a76d-8ba13eea02fa	12	18	150	2025-10-22 08:42:52.548408	23	14
df3a4e5e-c3a1-4eb6-af4b-f198e5bfe20a	26ea7651-8b3a-4860-9615-cfd2daa5da7e	1	24	81	2025-10-22 08:42:54.38609	27	21
775d1c42-341b-4566-873d-f34c622fbddc	fd5455a1-8f35-40e4-84f5-5cab30de8bea	1	8	6	2025-10-22 08:26:50.627166	14	4
28094376-fd2d-4493-a0ec-a8d307c737ed	fd5455a1-8f35-40e4-84f5-5cab30de8bea	3	13	3	2025-10-22 08:26:56.012178	19	9
fc0dfcfd-d1a9-4cf7-b77c-39153b12039d	fd5455a1-8f35-40e4-84f5-5cab30de8bea	8	26	55	2025-10-22 08:27:42.718878	30	22
328f1741-79f4-46d5-a970-9f6c3b504462	9c2f029b-d332-44c6-9942-291b958ee22b	1	27	91	2025-10-22 08:27:52.256039	28	26
a9514660-429d-4e31-8fd5-2e4163727d42	9c2f029b-d332-44c6-9942-291b958ee22b	6	29	140	2025-10-22 08:27:53.62057	29	28
cc1a5aca-f61f-478f-ab10-3f2c2e3bf877	9c2f029b-d332-44c6-9942-291b958ee22b	11	27	362	2025-10-22 08:27:56.407391	28	26
578fd611-7aad-4b5f-babb-6c26d5c233f8	d6094b52-39aa-43bd-8fca-511fc8a9432c	4	25	0	2025-10-22 08:28:02.917631	31	20
66d7dc63-6bb9-49af-a3e5-b299e083c644	d6094b52-39aa-43bd-8fca-511fc8a9432c	9	34	0	2025-10-22 08:28:10.698852	41	29
a5078899-393a-4aae-9dcf-a0625b964761	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	2	0	37	2025-10-22 08:37:24.812547	2	-3
47e1d8f1-9330-4307-885a-a3a6ae1af05f	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	7	17	111	2025-10-22 08:37:25.374737	20	13
a508fbbe-4eca-48d4-8d62-e9862bd68c7b	71d8e9dc-afd7-42b7-8211-140c424dd010	1	4	102	2025-10-22 08:37:27.832735	6	2
e16ae622-3737-46eb-a652-47e31726521c	26ea7651-8b3a-4860-9615-cfd2daa5da7e	3	24	78	2025-10-22 08:42:54.601139	28	21
2964e859-10c0-48b4-a01a-e724f38bd7e1	26ea7651-8b3a-4860-9615-cfd2daa5da7e	4	21	73	2025-10-22 08:42:54.709572	25	18
7a856881-590b-4d20-adfa-e876fcd57b95	26ea7651-8b3a-4860-9615-cfd2daa5da7e	5	17	122	2025-10-22 08:42:54.809812	22	13
e4fddee8-42d0-4c6d-bbeb-4083659c9a3c	26ea7651-8b3a-4860-9615-cfd2daa5da7e	6	17	8	2025-10-22 08:42:54.926526	22	13
8e497e53-9ace-4b9e-996e-2d5400eb3887	26ea7651-8b3a-4860-9615-cfd2daa5da7e	8	18	32	2025-10-22 08:42:55.144737	23	14
17293aec-ff6f-4d74-82c5-287feb039669	26ea7651-8b3a-4860-9615-cfd2daa5da7e	9	19	26	2025-10-22 08:42:55.255945	24	15
6d6297fe-838e-4461-87f1-66768fa2b24d	26ea7651-8b3a-4860-9615-cfd2daa5da7e	10	21	16	2025-10-22 08:42:55.360348	27	17
5fd73d69-34f1-4b48-91ff-a061be2ebec9	26ea7651-8b3a-4860-9615-cfd2daa5da7e	11	22	143	2025-10-22 08:42:55.468175	26	19
1a007740-16ea-4f31-90c4-b71958dad84d	759e1ea0-6f6e-4748-bcff-feed6971984d	1	27	488	2025-10-22 08:42:57.423806	29	24
0a6b3acb-c4c3-4f4d-9255-881eb65238a1	759e1ea0-6f6e-4748-bcff-feed6971984d	2	27	370	2025-10-22 08:42:57.532353	29	25
87eb9ebe-3030-4b0e-adc3-3c98af45eba2	759e1ea0-6f6e-4748-bcff-feed6971984d	3	27	216	2025-10-22 08:42:57.65249	29	25
96e57f50-3298-4285-871f-bccb12080d2d	759e1ea0-6f6e-4748-bcff-feed6971984d	4	27	83	2025-10-22 08:42:57.766403	29	25
2fdf26b0-c761-48a4-9bd6-deced0369bef	759e1ea0-6f6e-4748-bcff-feed6971984d	6	23	61	2025-10-22 08:42:57.983273	26	21
4e6334a6-195c-4bdd-9027-8fcb79b41442	759e1ea0-6f6e-4748-bcff-feed6971984d	7	22	87	2025-10-22 08:42:58.089718	25	20
b1af933a-e512-40a6-8fb9-ccfd86b0964a	759e1ea0-6f6e-4748-bcff-feed6971984d	8	21	67	2025-10-22 08:42:58.196564	24	18
57de84fe-3540-4070-a6ac-137e443b7a6e	759e1ea0-6f6e-4748-bcff-feed6971984d	9	23	71	2025-10-22 08:42:58.299465	26	20
126e93c7-ae32-42ae-8120-3edf8647b71f	759e1ea0-6f6e-4748-bcff-feed6971984d	11	26	32	2025-10-22 08:42:58.532292	29	23
ef3b69f6-a821-49a4-a180-900816a193c0	759e1ea0-6f6e-4748-bcff-feed6971984d	12	27	835	2025-10-22 08:42:58.641583	29	25
f36dab77-e15a-4b5b-af99-f47e04bebb2c	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	1	20	302	2025-10-22 08:43:00.471359	22	18
d36bb59a-01ed-4166-b802-d036819fa57d	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	2	19	287	2025-10-22 08:43:00.592905	22	17
cbd18cc2-f56e-40a6-9a06-a814af6a9c1f	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	4	17	128	2025-10-22 08:43:00.804471	20	15
ebc96c3b-6e4d-4f80-b020-80cd8224f797	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	5	16	191	2025-10-22 08:43:00.931761	17	14
2e4770e6-eb5f-4312-8581-fd76a45b26d4	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	6	13	117	2025-10-22 08:43:01.061834	15	11
0985afe1-985d-4a62-ae57-0592b631cbbc	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	7	12	81	2025-10-22 08:43:01.190793	14	10
52ea1e86-738c-4066-aba0-39e9a2f3e941	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	9	14	117	2025-10-22 08:43:01.42961	16	11
017da843-9dde-484f-adc6-253185f8edf5	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	10	15	105	2025-10-22 08:43:01.541112	17	12
a144275e-2e45-4d12-ad87-908e566b958e	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	11	16	124	2025-10-22 08:43:01.65383	19	12
10397ae3-61a6-42e3-baef-f5b3f0076872	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	12	19	138	2025-10-22 08:43:01.773149	21	16
689a886d-2da8-4b49-a236-65f6e480060b	2d523087-d3c7-4703-ad6f-41446739da7e	2	17	124	2025-10-22 08:43:03.704655	21	13
4ddf7e27-bda7-446f-aa65-d29276e13974	2d523087-d3c7-4703-ad6f-41446739da7e	3	14	132	2025-10-22 08:43:03.813686	17	10
9256eea3-f29b-49ac-8d84-0002349683fd	2d523087-d3c7-4703-ad6f-41446739da7e	4	12	84	2025-10-22 08:43:03.920879	16	9
df5046ae-b0c2-47cb-8321-e70600d4d141	2d523087-d3c7-4703-ad6f-41446739da7e	5	10	179	2025-10-22 08:43:04.039677	13	8
de33a071-7d12-421a-b72d-277d3cea26ed	2d523087-d3c7-4703-ad6f-41446739da7e	7	5	122	2025-10-22 08:43:04.261243	8	3
ecafa28f-0818-45b1-b7f6-35ee1f7e165b	2d523087-d3c7-4703-ad6f-41446739da7e	8	5	109	2025-10-22 08:43:04.376472	8	2
83ea277f-eee3-4b16-90b1-f1c82caa0417	2d523087-d3c7-4703-ad6f-41446739da7e	9	9	264	2025-10-22 08:43:04.488449	12	5
d802e0e8-8b97-48d2-b17c-741baaeab674	2d523087-d3c7-4703-ad6f-41446739da7e	10	9	200	2025-10-22 08:43:04.605752	14	5
fbc6c8eb-3aa3-4029-9f7c-248add0650cf	2d523087-d3c7-4703-ad6f-41446739da7e	12	16	124	2025-10-22 08:43:04.828719	20	12
f31a0468-4b96-44df-830d-37a4fabc3da8	909cd680-5725-4941-8ae5-a2ce18f4ca29	1	27	209	2025-10-22 08:43:06.641256	31	24
68ed5a4e-b1eb-4363-b42f-16e9391c8501	909cd680-5725-4941-8ae5-a2ce18f4ca29	2	26	389	2025-10-22 08:43:06.743614	31	24
f6c40330-eed8-4427-ac19-bc04f1f49b2e	909cd680-5725-4941-8ae5-a2ce18f4ca29	3	26	267	2025-10-22 08:43:06.852176	30	24
7940958b-cf3a-41fe-9f5d-2699d54cfeb8	909cd680-5725-4941-8ae5-a2ce18f4ca29	5	24	164	2025-10-22 08:43:07.065688	28	22
93db4529-4e5f-475d-9b73-9d36b5fc7bc6	909cd680-5725-4941-8ae5-a2ce18f4ca29	6	22	114	2025-10-22 08:43:07.171467	26	20
cc0b0b6f-c409-4245-8ad1-96e7037938f1	909cd680-5725-4941-8ae5-a2ce18f4ca29	7	22	228	2025-10-22 08:43:07.302307	24	20
79ecd303-61e0-4ef2-a1f1-922b72b92a44	909cd680-5725-4941-8ae5-a2ce18f4ca29	8	22	222	2025-10-22 08:43:07.420371	25	20
d309829d-70e3-4f99-9315-45ae58a6c327	909cd680-5725-4941-8ae5-a2ce18f4ca29	10	23	80	2025-10-22 08:43:07.628379	27	21
e7244167-b549-4e0e-ac97-171dcc723be3	909cd680-5725-4941-8ae5-a2ce18f4ca29	11	25	250	2025-10-22 08:43:07.734471	30	23
643dfdfd-2c0a-408b-b589-68acdfe59432	909cd680-5725-4941-8ae5-a2ce18f4ca29	12	26	104	2025-10-22 08:43:07.841192	30	23
77df12f6-5a75-4ad1-b6ad-0e429fb9f51a	889dc3df-b948-4b04-9c1c-0d9384027b7f	1	24	288	2025-10-22 08:43:09.672741	25	22
b305466d-1c24-4f7e-9aa2-8c4796a99707	889dc3df-b948-4b04-9c1c-0d9384027b7f	3	25	148	2025-10-22 08:43:09.902573	26	23
45fd7ffb-0f42-4951-8bee-4f127c736bf5	889dc3df-b948-4b04-9c1c-0d9384027b7f	4	24	184	2025-10-22 08:43:10.022265	25	23
ca4f36af-8542-45ff-bc51-6d68137c078a	889dc3df-b948-4b04-9c1c-0d9384027b7f	5	24	125	2025-10-22 08:43:10.130123	25	23
d4f7031b-83a3-42ff-bb92-0de7ba487529	889dc3df-b948-4b04-9c1c-0d9384027b7f	6	24	61	2025-10-22 08:43:10.241282	25	23
b15e7709-5b39-431e-846d-f4f48d7f3d76	889dc3df-b948-4b04-9c1c-0d9384027b7f	8	23	16	2025-10-22 08:43:10.452767	24	22
6163527a-cf11-41a5-b7cf-7e2961843b8f	889dc3df-b948-4b04-9c1c-0d9384027b7f	9	22	261	2025-10-22 08:43:10.566742	23	22
dfa547bf-6283-4441-b23c-0f85a6f04cf4	889dc3df-b948-4b04-9c1c-0d9384027b7f	10	23	194	2025-10-22 08:43:10.677577	24	23
7985ac2c-01d9-4883-bbe0-a6ce84a43fc7	889dc3df-b948-4b04-9c1c-0d9384027b7f	11	23	256	2025-10-22 08:43:10.789363	24	23
75c30cf2-ec1a-4e5c-b30c-f8258c53f7da	56ae9458-2047-460e-a144-589720da6c92	2	5	66	2025-10-22 08:44:33.790917	9	1
816bca15-6655-4f14-b359-391d3927d15b	56ae9458-2047-460e-a144-589720da6c92	3	9	89	2025-10-22 08:44:33.904121	14	5
06aef6c8-9ced-4531-86d4-e1f5d0eefba0	56ae9458-2047-460e-a144-589720da6c92	4	15	84	2025-10-22 08:44:34.003941	20	10
e773a62f-3175-48c4-9683-4cf125555ac5	56ae9458-2047-460e-a144-589720da6c92	6	25	97	2025-10-22 08:44:34.217063	30	20
91101ce6-4b7a-4de7-8c1e-8ead4779195e	56ae9458-2047-460e-a144-589720da6c92	7	27	104	2025-10-22 08:44:34.32473	32	23
83c5019b-d131-4b7f-9f13-795e71d10bfe	56ae9458-2047-460e-a144-589720da6c92	8	26	99	2025-10-22 08:44:34.434171	31	22
56ac1699-db0a-464f-936d-ca5876deca22	56ae9458-2047-460e-a144-589720da6c92	9	22	94	2025-10-22 08:44:34.544566	27	18
5ca753e5-8072-4bc1-85a7-7aded1b9a18c	56ae9458-2047-460e-a144-589720da6c92	11	10	81	2025-10-22 08:44:34.757619	15	6
289a16cd-f4cf-43aa-8537-71b81ad8b273	56ae9458-2047-460e-a144-589720da6c92	12	5	79	2025-10-22 08:44:34.858544	9	2
ab2a956e-7835-4a6a-bafa-338f2dd65b71	56ae9458-2047-460e-a144-589720da6c92	1	3	71	2025-10-22 08:44:33.667698	7	-1
5d61b9f7-22d3-45eb-9a98-8a5fcdb21def	71d8e9dc-afd7-42b7-8211-140c424dd010	6	17	27	2025-10-22 08:37:28.395581	21	13
8b17cb46-dc09-4c49-ae26-cd4c616bfd54	71d8e9dc-afd7-42b7-8211-140c424dd010	11	5	129	2025-10-22 08:37:28.941246	7	4
dad9626e-6f98-448d-bba6-46bfe38d9996	07575d0e-9875-487e-89b2-9736ff43952d	5	12	17	2025-10-22 08:37:31.384352	17	6
f2084448-1ea5-4619-8e47-733ddf5fbe94	07575d0e-9875-487e-89b2-9736ff43952d	10	6	46	2025-10-22 08:37:32.045585	8	3
9be35abd-9134-451c-8ef4-78d507a9967d	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	2	-1	50	2025-10-22 08:37:34.20367	0	-3
62422260-e28c-4bae-8be4-dbfbc9b7ce32	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	4	3	16	2025-10-22 08:37:34.439439	5	1
3edfb734-5f2b-48db-9d2d-47ee20472c38	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	9	16	52	2025-10-22 08:37:35.026289	17	14
8e4c168e-add8-426f-b324-def7bc3690aa	78c34395-9186-472b-b93a-58fc587ca0f3	2	2	282	2025-10-22 08:37:37.365751	4	0
fe71d43e-b0d0-4585-99fd-1336672b252a	78c34395-9186-472b-b93a-58fc587ca0f3	7	11	11	2025-10-22 08:37:37.941635	14	8
1e7b49fe-7201-4d93-abd7-ed28d10c421d	7b066287-4fd7-4149-bb8b-9c59096a664d	1	5	67	2025-10-22 08:37:40.386912	7	3
e2632440-f5c1-4780-91e3-f5fe2cc16c11	7b066287-4fd7-4149-bb8b-9c59096a664d	6	15	50	2025-10-22 08:37:40.952775	19	11
6b1859de-51b6-4bed-ad24-1b0ed15f6f4e	7b066287-4fd7-4149-bb8b-9c59096a664d	11	6	102	2025-10-22 08:37:41.560812	8	4
8928690b-69d0-4b39-8a9e-4cfe44090d29	95691984-3e58-4dec-9640-01c57ab9ac8a	4	23	59	2025-10-22 08:37:43.936285	29	18
d74e3eed-52d8-49fa-ad91-139422f40867	95691984-3e58-4dec-9640-01c57ab9ac8a	9	26	170	2025-10-22 08:37:44.535299	32	22
a055f34d-3496-45fc-ba2d-b8fadcb7b181	280ef307-84b2-4a03-b406-90255c159d25	2	8	21	2025-10-22 08:37:46.847407	10	6
a114a77f-23b2-4789-96bd-f349244fce8c	280ef307-84b2-4a03-b406-90255c159d25	7	15	125	2025-10-22 08:37:47.485935	18	12
da30bc2e-9e26-4413-b3c4-af4886c19d46	280ef307-84b2-4a03-b406-90255c159d25	12	8	90	2025-10-22 08:37:48.208268	10	6
7caa110e-7b4c-4ba0-9fa2-06651848ad2e	3a95aac2-b3ce-4810-af20-37bab52b15df	5	13	42	2025-10-22 08:37:50.463323	17	10
7182d889-4592-492d-9f49-f6e04ad81d56	3a95aac2-b3ce-4810-af20-37bab52b15df	10	12	226	2025-10-22 08:37:51.018168	15	9
c6cd7aed-d1b8-454c-b27b-8e86b5052ed9	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	3	6	108	2025-10-22 08:37:53.329055	9	4
cabea54e-7d0c-4d9a-b845-5f182bd00ca4	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	8	17	99	2025-10-22 08:37:53.925778	21	14
86e7d402-5161-433d-b506-5ee4d9aba29c	05abad90-6ae1-49df-84c2-1dfae020140d	1	5	79	2025-10-22 08:37:56.389461	7	3
2743fafa-b4b1-4965-8f23-49a575411a3b	05abad90-6ae1-49df-84c2-1dfae020140d	6	20	40	2025-10-22 08:37:57.0094	25	14
4cfdc10e-8362-47a0-9ade-beafaeca8c6d	05abad90-6ae1-49df-84c2-1dfae020140d	11	8	126	2025-10-22 08:37:57.593202	10	6
5a106464-5ef1-46a0-8372-11167a894a9d	ea431f38-c1da-433b-ba90-51bd7fee1a3e	3	9	85	2025-10-22 08:37:59.834094	12	5
97e4cb59-9905-4095-bb4d-d9bcc0e59837	ea431f38-c1da-433b-ba90-51bd7fee1a3e	5	15	80	2025-10-22 08:38:00.053921	19	10
d3bdd415-381a-48e4-855e-d46a17fed8fa	ea431f38-c1da-433b-ba90-51bd7fee1a3e	10	15	109	2025-10-22 08:38:00.634723	19	11
03a9a8a5-c781-4d2c-9ce0-01f94c0cd121	1137f046-8540-4bac-9bee-86851f1484ab	3	9	105	2025-10-22 08:38:03.591124	14	5
0739abbf-9c4d-42fb-afcd-b51b4050d4f3	1137f046-8540-4bac-9bee-86851f1484ab	8	24	24	2025-10-22 08:38:04.193982	30	18
37c43ce0-7cfd-4951-9506-73e498b5a1be	ae4bfff9-b173-44c7-b911-07148be73b72	1	9	37	2025-10-22 08:38:06.585274	13	5
d72bb936-9900-4f9d-9bc6-0dd8f300ea83	ae4bfff9-b173-44c7-b911-07148be73b72	6	23	68	2025-10-22 08:38:07.313692	26	19
b900ffa2-ffc1-4cbb-9e06-f4f3a5b07f81	ae4bfff9-b173-44c7-b911-07148be73b72	11	12	59	2025-10-22 08:38:07.901347	17	9
a9f10bd8-e87a-497b-bf8e-59c03f1c79c4	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	4	13	76	2025-10-22 08:38:10.235378	18	8
0e661c34-08b8-4596-a1e0-3b7c258cb2f0	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	9	21	65	2025-10-22 08:38:10.805126	27	16
503e3bb3-20a0-415f-b6ac-5efc30aae77f	538f180b-716f-4539-96e4-e47d79a02d86	2	3	51	2025-10-22 08:38:13.396236	7	-1
53e81933-c989-4172-bde7-b32e2dd7c189	538f180b-716f-4539-96e4-e47d79a02d86	7	20	105	2025-10-22 08:38:13.965915	25	15
c7f03bd3-f7ee-4c95-8653-d1e6484082e2	538f180b-716f-4539-96e4-e47d79a02d86	12	3	150	2025-10-22 08:38:14.646965	6	0
c0f553cb-4c5e-4394-802e-6799f39d7ae9	f1af3688-db90-4f1b-a893-ceb12e4abebf	5	14	16	2025-10-22 08:38:16.955499	19	8
d78d7793-e5df-4037-b861-116048a59d70	f1af3688-db90-4f1b-a893-ceb12e4abebf	10	12	92	2025-10-22 08:38:17.574088	15	9
1220f0da-d225-4431-8fa5-665b8a0b2b72	034e97c9-6c2e-4e8d-a2f6-045add3f3533	3	6	100	2025-10-22 08:38:19.859643	9	3
52e055bd-98be-40ce-b2a9-ed53c4f7f1d5	034e97c9-6c2e-4e8d-a2f6-045add3f3533	8	18	124	2025-10-22 08:38:20.429029	22	14
115aa8aa-ac53-462a-9a29-51c7f43939b2	968d1662-490e-408e-941d-d03e11ebc507	1	3	43	2025-10-22 08:38:22.788972	6	1
ba725949-a809-4f19-9fc3-88f24d4fe945	968d1662-490e-408e-941d-d03e11ebc507	6	20	88	2025-10-22 08:38:23.374972	24	15
c4b12093-008d-4136-bd82-fb92fcf5334c	968d1662-490e-408e-941d-d03e11ebc507	11	7	80	2025-10-22 08:38:23.980458	10	4
603985a7-4fe7-49f8-b7f7-5384d623bdcf	7862827c-77e1-4e97-a2d6-61adacef3cb0	4	7	166	2025-10-22 08:38:27.499303	12	3
ee62b221-2df2-4a81-bf39-1c5194825347	7862827c-77e1-4e97-a2d6-61adacef3cb0	6	19	48	2025-10-22 08:38:27.749831	24	13
67cdf4b1-a70b-4527-b7ad-de5d62049f81	7862827c-77e1-4e97-a2d6-61adacef3cb0	11	5	235	2025-10-22 08:38:28.328726	9	2
e9cfc858-b5d3-414b-83f1-42d9c28512a8	f5409693-946e-47c5-8f04-0babe818f750	4	8	86	2025-10-22 08:38:30.659533	12	3
6c52ef6d-fe7c-44d7-b453-10c8940873f9	f5409693-946e-47c5-8f04-0babe818f750	9	19	13	2025-10-22 08:38:31.273457	25	13
4457b4e1-17c7-46d5-859d-14a5968ed03d	4995c976-3d3a-441a-9521-2d21b9e6d231	2	3	25	2025-10-22 08:38:33.615606	8	0
d00a8d06-4850-44a2-92bb-659dc2d93e1f	4995c976-3d3a-441a-9521-2d21b9e6d231	7	24	57	2025-10-22 08:38:34.325383	29	18
ff5eaf3e-2e0b-4181-917f-beb34ef9b813	4995c976-3d3a-441a-9521-2d21b9e6d231	12	2	120	2025-10-22 08:38:34.949785	5	-1
ff51bc7b-50bf-4132-8676-da9557551649	78486986-b3e9-49d4-b1e4-9113a38b21ed	5	13	97	2025-10-22 08:38:37.232784	18	8
1f71b104-5996-492a-9149-199c2caab93b	78486986-b3e9-49d4-b1e4-9113a38b21ed	10	12	87	2025-10-22 08:38:37.793512	17	8
4d274193-2029-4fda-8fa0-90a3571b499e	58006810-48b3-4b09-9e4a-cce139f122d3	4	8	68	2025-10-22 08:38:40.272661	13	4
82dbc4d8-a1ee-42b9-8884-aceebd56f2ce	58006810-48b3-4b09-9e4a-cce139f122d3	9	18	18	2025-10-22 08:38:40.927557	24	13
fac49ff0-7192-4e03-946c-6a236bc34548	c41bab8a-909c-46b3-9c7f-daba35f04b3e	2	3	33	2025-10-22 08:38:43.356473	8	-1
9eeec544-c535-4131-ac55-b84ad29d8895	c41bab8a-909c-46b3-9c7f-daba35f04b3e	7	20	198	2025-10-22 08:38:43.946389	25	16
a921bab1-2557-4f68-9a2e-da69efd63e5b	dddcc5d6-25ef-46c9-9ac5-47d86806e102	1	3	92	2025-10-22 08:38:46.341115	6	0
cfeaece3-623c-4eb5-9c82-69e0dc05642e	dddcc5d6-25ef-46c9-9ac5-47d86806e102	6	21	97	2025-10-22 08:38:46.9015	26	16
aa32fd81-df92-4b05-9358-0210ae9585db	dddcc5d6-25ef-46c9-9ac5-47d86806e102	11	7	176	2025-10-22 08:38:47.505059	10	4
36412b3f-2efb-479e-a1a0-4b4a7db86ed5	b35896d8-a00b-4d6b-be31-215b59fae616	4	13	99	2025-10-22 08:38:50.178064	18	7
fbc67b11-2d54-4abb-b43a-3d3d8cd3b5f1	b35896d8-a00b-4d6b-be31-215b59fae616	9	21	137	2025-10-22 08:38:50.782623	26	16
169f1f1f-7fcf-4f3e-bb6f-24833c0ba51f	f0c15c68-5571-4643-88ca-b66d92034063	2	5	2	2025-10-22 08:38:53.073898	10	2
42c2cf7d-d77e-4349-a1a9-fcd1dc0d2a0c	f0c15c68-5571-4643-88ca-b66d92034063	5	18	164	2025-10-22 08:38:53.413779	21	14
cce6eeb9-f5ca-4359-a7da-904c5b7acbd6	f0c15c68-5571-4643-88ca-b66d92034063	7	25	79	2025-10-22 08:38:53.65993	30	20
cb0342aa-8e2e-4ae8-bb9e-b2c7d7cb10cd	f0c15c68-5571-4643-88ca-b66d92034063	12	5	39	2025-10-22 08:38:54.261157	9	2
4545a9b8-dbf4-468a-91bf-148166b6a942	2b6552a5-7838-4bbf-aa5a-503f34ef8637	5	18	129	2025-10-22 08:38:56.556973	23	13
f34cfed3-0603-4886-95ee-10be6a12bb9d	2b6552a5-7838-4bbf-aa5a-503f34ef8637	10	19	199	2025-10-22 08:38:57.128532	24	15
db2c6190-6339-4086-8d72-1533a1776e19	bd63a7eb-7275-4976-9597-d15f6ff96c1b	3	12	86	2025-10-22 08:38:59.384606	17	7
5c347526-d33b-4a81-bb62-110924b71d22	bd63a7eb-7275-4976-9597-d15f6ff96c1b	8	26	65	2025-10-22 08:38:59.966944	32	20
516a7760-afce-4aeb-89bd-425c145c47fc	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	1	10	146	2025-10-22 08:39:03.087842	14	6
c288e898-60e8-4e6d-9389-59685fdcdff3	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	6	22	138	2025-10-22 08:39:03.73291	26	18
e76e0f1a-be9e-4b46-96be-bd8beafb23a0	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	11	15	171	2025-10-22 08:39:04.309583	19	12
558ce4db-c24d-4d96-be36-11598136d471	def70aeb-2af9-4e04-a014-d5d2bc0010a7	4	12	114	2025-10-22 08:39:07.391996	13	11
055bc123-88d5-4cce-861f-36d06204b808	def70aeb-2af9-4e04-a014-d5d2bc0010a7	9	22	49	2025-10-22 08:39:08.190682	24	21
429464e2-2837-41e3-8ea1-9089dfc5e924	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	2	12	17	2025-10-22 08:39:10.470112	19	7
416ba73c-4ef8-43cc-8bb3-6769306f790a	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	7	30	0	2025-10-22 08:39:11.001089	38	23
c771e682-e4e5-4915-9468-4b36735b4e12	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	12	11	53	2025-10-22 08:39:11.543756	16	7
8d7eaa48-7abe-4345-b697-3e62ebc5026c	cbf0915e-da75-48b2-b85a-da06992d1b0b	5	17	54	2025-10-22 08:39:15.011467	24	11
4fe1411a-79dd-4d11-9042-f82509e3eefd	cbf0915e-da75-48b2-b85a-da06992d1b0b	10	17	126	2025-10-22 08:39:15.579596	22	12
83b58b75-03ba-4fe6-8fbc-9a7de3b7cdc3	4d09e521-8224-4513-82fa-a6b42af3dcd6	3	16	3	2025-10-22 08:39:17.894489	22	10
d79b345b-ec64-41ab-bfcf-55447f88bcf4	4d09e521-8224-4513-82fa-a6b42af3dcd6	8	27	50	2025-10-22 08:39:18.45477	32	23
ef133cd8-fd72-454b-b6dd-40f2b9b6f4e5	78063abb-e5c2-42b0-8d3d-d24f17c28d35	1	13	3	2025-10-22 08:39:20.747323	17	9
f4b357ec-2c92-4a66-b5a8-6b44485ca629	78063abb-e5c2-42b0-8d3d-d24f17c28d35	6	23	43	2025-10-22 08:39:21.316258	27	20
b2977a1b-2e06-46b6-8d70-5876b7d54611	78063abb-e5c2-42b0-8d3d-d24f17c28d35	8	27	0	2025-10-22 08:39:21.529296	32	23
753b0e03-8e87-4e7e-9454-5bb474815a4b	04570fa5-4011-4591-af21-06093e7b6297	1	13	15	2025-10-22 08:39:23.878746	15	10
c00ac1e6-3870-48ca-ba37-7531c6ab772e	04570fa5-4011-4591-af21-06093e7b6297	6	24	8	2025-10-22 08:39:24.471492	27	21
97e1c7e1-56a3-460d-aa8a-e9a4bf3ed56b	04570fa5-4011-4591-af21-06093e7b6297	11	18	8	2025-10-22 08:39:25.04134	20	15
b739f73c-ead2-4009-be08-d7c1b33be02f	35b60547-1009-454d-890d-c4b35f1ce3f2	4	15	18	2025-10-22 08:39:27.33612	21	10
e6f96b5d-f2fb-4fae-b321-1a1ce1409938	35b60547-1009-454d-890d-c4b35f1ce3f2	9	22	57	2025-10-22 08:39:27.862059	28	18
e9327373-f9c3-4467-b60e-71d320ffc180	ef893d9d-59a6-4714-91d3-132569a2fe06	2	11	31	2025-10-22 08:39:30.155608	15	8
2f7f2aa2-b17c-49a2-bd59-0fce5d5b4e6e	ef893d9d-59a6-4714-91d3-132569a2fe06	7	22	1	2025-10-22 08:39:30.691653	28	18
e2f0d400-0055-4659-9bcf-b1154af5e2ac	ef893d9d-59a6-4714-91d3-132569a2fe06	12	12	37	2025-10-22 08:39:31.260704	15	9
ecec6c39-b47b-4836-8a6b-53fda9a95c00	66ada0dc-7cb2-489c-909d-754e5e208a13	5	17	79	2025-10-22 08:39:33.540505	21	13
95e8039c-5b47-4a5f-ac60-be36d80343c9	66ada0dc-7cb2-489c-909d-754e5e208a13	10	18	316	2025-10-22 08:39:34.125209	22	16
4ea46dab-f64c-4a9e-8e5e-e32579472be5	a169c096-7d0e-4505-a487-d08fca579276	3	13	50	2025-10-22 08:39:36.429691	17	9
e84db423-4d37-4494-ac69-f78783db3e1c	a169c096-7d0e-4505-a487-d08fca579276	8	29	6	2025-10-22 08:39:36.974843	34	24
864b4681-e813-44ca-8c7c-118437fc5371	351d9e16-cc72-4671-9e47-d43442749a9f	1	14	25	2025-10-22 08:39:39.265467	16	12
3cfa6369-1264-4088-807a-beb1fc2a303f	351d9e16-cc72-4671-9e47-d43442749a9f	6	23	24	2025-10-22 08:39:39.794747	26	21
561b5fe5-cb05-4740-b08e-bd20fc7ea9b4	351d9e16-cc72-4671-9e47-d43442749a9f	11	20	10	2025-10-22 08:39:40.38022	22	18
90d0e6aa-c1a3-404a-b9a7-53ebdfb957d6	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	4	16	37	2025-10-22 08:39:42.698494	18	14
5a66c346-115b-4d9d-aadf-0dcf74fd1fe9	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	9	24	13	2025-10-22 08:39:43.267827	27	22
b5f35785-b8ce-4acc-8a03-8511c4512989	d3a9895e-21c2-4aa7-92e5-3a04aee72014	2	13	20	2025-10-22 08:39:45.542924	14	12
e2aa8a23-1176-4417-8456-011c9fc672b2	d3a9895e-21c2-4aa7-92e5-3a04aee72014	7	28	0	2025-10-22 08:39:46.11416	29	26
3132c512-2064-4b23-b7d9-2f8153fd906e	d3a9895e-21c2-4aa7-92e5-3a04aee72014	9	27	32	2025-10-22 08:39:46.368288	28	26
e55a8a09-7fff-44e5-900c-e796a1d73940	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	2	11	50	2025-10-22 08:39:48.637041	14	8
6e1c3aa7-b3df-4e67-9c63-4b05f5597ff4	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	7	29	7	2025-10-22 08:39:49.220054	34	25
96cd4426-4030-4076-bf18-a3c63e229662	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	12	13	100	2025-10-22 08:39:49.798361	15	11
72f792a7-b120-4057-a73c-778c7636ed9c	f5ba86d5-4e8b-4abe-9feb-add2d374d219	5	15	72	2025-10-22 08:39:52.04939	19	12
2a3f865a-cc28-4cbf-b41f-15ecb77ed97a	f5ba86d5-4e8b-4abe-9feb-add2d374d219	10	19	37	2025-10-22 08:39:52.735319	22	15
d14dc256-373b-438a-bdb9-7bc110cf5974	9415905d-81c3-4577-b19a-8e60bd2459d8	3	14	158	2025-10-22 08:39:55.019461	19	9
974b72a7-05eb-43c8-acdd-02ea4178089e	9415905d-81c3-4577-b19a-8e60bd2459d8	8	29	0	2025-10-22 08:39:55.661777	34	24
91888424-27f2-4ffb-9b93-2153e94f52bc	fcd5fba1-05b5-47df-8205-d060f411f56c	1	14	114	2025-10-22 08:39:57.998319	16	11
ce4bd827-650e-48ea-bdba-ce47652f0ba6	fcd5fba1-05b5-47df-8205-d060f411f56c	6	24	32	2025-10-22 08:39:58.661806	27	21
4e77fb42-3137-4f2a-8aa4-31f560f0daaa	fcd5fba1-05b5-47df-8205-d060f411f56c	11	19	157	2025-10-22 08:39:59.389167	21	16
bea6a4f0-1f80-4d90-b984-4b8065bab8f0	fe29e631-c438-4178-978f-6ed4e12c4b49	4	7	118	2025-10-22 08:40:02.499757	11	4
67834b9d-949c-4ab8-a44d-a6a884af87cd	fe29e631-c438-4178-978f-6ed4e12c4b49	9	15	248	2025-10-22 08:40:03.134929	18	12
600cd8e1-10f0-4ec9-9297-106b57e33f00	bb97bdcb-63ab-4870-8514-747b141bb008	2	7	12	2025-10-22 08:40:05.436629	10	4
7ce9390f-e8c3-432c-8e5d-37c2c9d15af5	bb97bdcb-63ab-4870-8514-747b141bb008	7	16	121	2025-10-22 08:40:06.051136	19	12
f75f122e-3cc6-40a3-a421-04195f7c12b2	bb97bdcb-63ab-4870-8514-747b141bb008	12	6	126	2025-10-22 08:40:06.634199	9	4
6e7a5974-df4d-4f88-85a1-3c23f986d3a1	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	5	13	53	2025-10-22 08:40:09.069836	17	8
46a6d140-087a-43ac-97d6-61cf565b2b9a	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	10	13	133	2025-10-22 08:40:09.851502	16	10
bc5d6f20-bbbf-4010-a24a-dd46e23d40a3	a42651c6-4071-492e-8c3b-f271e2142216	1	18	132	2025-10-22 08:40:15.20594	21	15
5ca2d7d0-99ec-45a6-82d6-87d881946363	a42651c6-4071-492e-8c3b-f271e2142216	3	23	8	2025-10-22 08:40:15.429071	28	19
764482f9-44d7-4ee0-9cc3-65e4dd5d418a	a42651c6-4071-492e-8c3b-f271e2142216	5	31	0	2025-10-22 08:40:15.659975	37	27
c42e4511-6d19-4f76-8d7b-c8708f1b801d	30f65744-b572-488a-ab73-4d8e4867a82a	1	26	10	2025-10-22 08:40:18.487905	31	21
2614dcbd-60c1-4d8f-b71f-203f6d555b5a	30f65744-b572-488a-ab73-4d8e4867a82a	6	29	212	2025-10-22 08:40:19.137734	32	26
8ba65db8-f8e6-4305-aaf6-d2c5e0384a57	30f65744-b572-488a-ab73-4d8e4867a82a	11	27	63	2025-10-22 08:40:19.790048	31	23
e5e5c903-2295-40fe-a7ca-2b3cce87e656	62db09a1-adc2-4359-bdb0-8b272a6acc47	4	29	42	2025-10-22 08:40:22.083667	33	26
c3566683-7a58-4014-b03c-92c00eda0169	62db09a1-adc2-4359-bdb0-8b272a6acc47	9	27	314	2025-10-22 08:40:22.753311	30	25
c3b74f83-33e4-4c7f-8288-70483d8fcfcc	753bc31b-0e39-4b59-bc04-e0d266b1abc8	2	27	86	2025-10-22 08:40:25.102405	29	25
ec8c074c-1291-43a0-af94-b09f17a6fbdf	753bc31b-0e39-4b59-bc04-e0d266b1abc8	7	28	156	2025-10-22 08:40:25.728256	31	26
1df08432-a4ce-42a0-b065-a8f38c2e04f5	753bc31b-0e39-4b59-bc04-e0d266b1abc8	12	27	112	2025-10-22 08:40:26.30548	29	26
7c7ee5ba-817b-4bf9-9693-7ea722ed2dd8	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	5	28	210	2025-10-22 08:40:28.822408	32	25
6130befd-f06e-4e43-8c30-85ff42eef37f	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	10	26	258	2025-10-22 08:40:29.384719	30	24
e1c1cb24-26f8-470d-a57a-340b71b0adcc	a582aaba-fda9-44cb-ab72-c6bc346b210c	3	26	16	2025-10-22 08:40:31.716095	32	20
7b6691ac-a0d5-443a-afc2-77f9ee80fef9	a582aaba-fda9-44cb-ab72-c6bc346b210c	8	27	341	2025-10-22 08:40:32.291924	30	24
3a2e2601-2468-4601-b9e2-a81e38c6e8df	817e316f-0af7-450b-afe9-61780f529d8e	1	26	266	2025-10-22 08:40:34.6055	28	24
065d6926-51f6-4860-9cdd-7904cd19b7f1	817e316f-0af7-450b-afe9-61780f529d8e	6	28	225	2025-10-22 08:40:35.184016	30	26
b2945446-11e7-420c-a181-f9f5e9cdde07	817e316f-0af7-450b-afe9-61780f529d8e	11	27	228	2025-10-22 08:40:35.773899	30	25
5d36d8f9-11ac-40ed-9729-8870805bf6c4	fefb26e2-8f48-4be8-995f-b27d70d356a9	4	22	284	2025-10-22 08:40:38.092607	26	20
ac65b23a-6171-40c3-9dea-1bc5a27cc569	fefb26e2-8f48-4be8-995f-b27d70d356a9	9	21	82	2025-10-22 08:40:38.648354	26	18
77aa59fe-310c-474f-869b-9282fe712113	fefb26e2-8f48-4be8-995f-b27d70d356a9	11	23	271	2025-10-22 08:40:38.926812	27	20
9b8dd28d-c5e5-4f22-ba76-82eae34366a6	2fd0938b-847f-4609-9f43-1db7708ed8f0	4	27	235	2025-10-22 08:40:41.213947	32	24
aca9db86-2b08-4d63-b3eb-698ddc2b8a2d	2fd0938b-847f-4609-9f43-1db7708ed8f0	9	27	281	2025-10-22 08:40:41.771619	31	24
a7be1160-a62d-42de-952b-bcee0b4ccac5	f044a094-f9ef-42ea-80fa-b66e5b7104ba	2	26	131	2025-10-22 08:40:44.814574	28	23
eda862f3-c462-4db8-a8dc-89e39d0586f5	f044a094-f9ef-42ea-80fa-b66e5b7104ba	7	27	233	2025-10-22 08:40:45.346545	30	24
009131ab-6961-4faa-b552-cca726e2c83d	f044a094-f9ef-42ea-80fa-b66e5b7104ba	12	27	250	2025-10-22 08:40:45.906602	30	24
d3cde8ed-8593-4a59-87a3-200bd3442570	52e5f7b4-2418-49b7-a26e-728b5eaf1747	5	27	436	2025-10-22 08:40:48.15056	29	25
bb4b20ac-c29c-4751-8357-073383737f78	52e5f7b4-2418-49b7-a26e-728b5eaf1747	10	25	1175	2025-10-22 08:40:48.687784	28	23
a0538673-096e-4e17-83ff-0e92d8ab9148	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	3	22	56	2025-10-22 08:40:52.711365	27	19
69096e91-6011-4674-a825-b5e7557d04b0	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	8	28	410	2025-10-22 08:40:53.251555	32	26
b0672c61-4b98-4200-97c8-fb1a69a17f7f	c4b42ac2-2047-466a-bdc1-708a04105814	1	26	97	2025-10-22 08:40:55.506516	30	22
26b14016-316d-4cef-90ad-77b19d2509c4	c4b42ac2-2047-466a-bdc1-708a04105814	6	27	286	2025-10-22 08:40:56.074929	32	25
c00925c5-6025-486a-923e-4a62598fac0d	c4b42ac2-2047-466a-bdc1-708a04105814	11	27	125	2025-10-22 08:40:56.636974	31	24
7847214f-aaac-465e-9cdd-eb05647e0f32	10ea4947-03b3-4147-b520-8c2f79850a9d	4	27	101	2025-10-22 08:40:58.934598	32	24
c0fce644-5902-4293-91db-a2abe8460f2b	10ea4947-03b3-4147-b520-8c2f79850a9d	9	25	504	2025-10-22 08:40:59.472662	28	23
6eaad980-9a43-4942-8f7c-a9b42c2bb403	fa435d58-ea7b-493f-8956-52d0170834c0	2	6	38	2025-10-22 08:41:01.826655	11	1
ba9c7ada-7c88-49b8-beb5-25067c4878ab	fa435d58-ea7b-493f-8956-52d0170834c0	7	28	68	2025-10-22 08:41:02.393058	34	24
d475eec9-0d52-450c-8590-880714840000	fa435d58-ea7b-493f-8956-52d0170834c0	12	8	33	2025-10-22 08:41:02.982308	13	3
668c219e-6abc-49e8-bdb3-151bf8db3a37	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	5	18	221	2025-10-22 08:41:05.401308	23	14
1d0021d6-6769-494e-9042-c526a0ad2c31	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	10	17	59	2025-10-22 08:41:05.957612	22	14
1ef374c6-f650-464c-8318-8ef834ee9b81	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	12	7	54	2025-10-22 08:41:06.184825	12	4
c3d1c6f8-35ea-4335-82d0-911d7e7a1a2a	853f4a5b-9f62-40d4-89b3-e6ced9799b43	5	18	255	2025-10-22 08:41:08.51324	22	14
94f6cd9e-0407-4f88-8951-c7807fdeabfc	853f4a5b-9f62-40d4-89b3-e6ced9799b43	10	17	89	2025-10-22 08:41:09.082601	22	13
db63c7a7-a0f6-410d-85db-7d135c3e8b89	99616273-bdf3-4c3d-a934-baeed91e1011	3	18	139	2025-10-22 08:41:12.511349	21	16
d4f62f21-5a21-40d3-ad48-7b85e9917514	99616273-bdf3-4c3d-a934-baeed91e1011	8	27	825	2025-10-22 08:41:13.07921	30	25
df1c0634-e44f-45fd-84e1-51294a5a0d80	020585b3-fd9b-4d1b-bff9-365b4d108d3a	1	-3	36	2025-10-22 08:41:15.612956	2	-7
f887498f-f8a9-40c2-b182-de4f205a4822	020585b3-fd9b-4d1b-bff9-365b4d108d3a	6	22	220	2025-10-22 08:41:16.22406	26	18
944791ff-dc36-4732-8b10-2152f0aaadd4	020585b3-fd9b-4d1b-bff9-365b4d108d3a	11	5	104	2025-10-22 08:41:16.835973	10	1
d4f827fb-ef51-4aa4-801d-c6e7d094e8b9	13a558af-9e5a-4014-9357-bc53cc10d2e8	4	22	86	2025-10-22 08:41:19.234273	23	22
2fca0744-d4c6-43cf-aec9-f2e8c605e30f	13a558af-9e5a-4014-9357-bc53cc10d2e8	9	27	426	2025-10-22 08:41:19.833594	29	25
add878cd-090d-46f4-944d-5e5ebfe312ae	54907426-a944-4986-8049-d99d2ee2a65f	2	7	72	2025-10-22 08:41:22.209233	10	3
0604c949-7b0d-4e08-8af0-25ce324057e9	54907426-a944-4986-8049-d99d2ee2a65f	7	28	268	2025-10-22 08:41:22.853606	32	26
3e69002b-cc06-406d-a77d-488b337ef680	54907426-a944-4986-8049-d99d2ee2a65f	12	6	38	2025-10-22 08:41:23.436742	11	2
d1cc76b7-4fb6-4b46-8e0c-f7a403f14e61	11af9dc6-389d-4827-96d4-018c2b9d244e	5	21	32	2025-10-22 08:41:25.741725	27	15
4a899669-052b-4bac-94d0-e30cd864fe62	11af9dc6-389d-4827-96d4-018c2b9d244e	10	15	11	2025-10-22 08:41:26.298989	21	9
71d18cbd-5219-4063-b42c-05b3c7bf69b6	569d7973-ddea-4161-94f1-c247f083427c	3	22	59	2025-10-22 08:41:29.805244	29	16
e5825b0e-c656-45e4-95da-9caa3b946309	569d7973-ddea-4161-94f1-c247f083427c	8	30	75	2025-10-22 08:41:30.43005	35	27
5f2b88f1-4251-4e36-8111-09c9696d0370	c96f9299-3c94-48d5-ac6d-e3a0f258546d	1	13	16	2025-10-22 08:41:32.843863	20	8
162fd6a5-b616-4714-93af-3c8c1031877d	c96f9299-3c94-48d5-ac6d-e3a0f258546d	6	30	171	2025-10-22 08:41:33.454496	35	26
1f349790-0779-465d-9334-ca28a35545e9	c96f9299-3c94-48d5-ac6d-e3a0f258546d	11	21	3	2025-10-22 08:41:34.0522	27	15
391ba190-b2c9-4e76-ad11-a1a18811a906	66ad2215-7608-44bc-888b-cf52a6f9abd3	1	10	115	2025-10-22 08:41:36.01663	12	7
5af7b2e3-47f8-451c-9dba-6ecc481b5c0f	66ad2215-7608-44bc-888b-cf52a6f9abd3	6	23	69	2025-10-22 08:41:36.63515	25	20
616ea500-d0f0-4818-8467-758f066d066f	66ad2215-7608-44bc-888b-cf52a6f9abd3	11	13	201	2025-10-22 08:41:37.247345	16	11
e76a0dc0-c9f1-44c1-81b1-f29374a94070	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	4	0	38	2025-10-22 08:41:39.597551	6	-4
fc5fb976-bb0b-4f96-8ba8-ba6c0844f636	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	9	12	163	2025-10-22 08:41:40.171671	15	9
3bc70788-1986-4f4b-86b8-5a7d099307f6	ec4c8781-45d7-4340-ab1d-074681ca2966	2	26	67	2025-10-22 08:41:42.899119	30	22
4ecad876-2db8-421c-90a7-631c0713114f	ec4c8781-45d7-4340-ab1d-074681ca2966	7	27	250	2025-10-22 08:41:43.46993	29	25
5a87d0ba-5932-4f94-8829-82e8a8bd3a63	ec4c8781-45d7-4340-ab1d-074681ca2966	12	26	410	2025-10-22 08:41:44.072651	30	24
e78e8139-4189-412a-b7ac-c8f48552899f	c58451eb-3f30-48cf-bc87-2459e7c2a910	5	22	38	2025-10-22 08:41:46.397054	29	15
e4107cd7-a5a1-46aa-90e9-077561ae67b8	c58451eb-3f30-48cf-bc87-2459e7c2a910	10	24	18	2025-10-22 08:41:46.96385	31	16
21f76490-6274-4756-ad9f-e5480b37b2e8	f392bd89-c29f-44bb-86d5-72ab0afb2f31	3	21	0	2025-10-22 08:41:49.294478	28	16
0924beb2-f7b0-4795-9d24-3ec68aad899c	f392bd89-c29f-44bb-86d5-72ab0afb2f31	8	28	0	2025-10-22 08:41:49.864931	35	23
2eef7c61-bc29-4f21-b534-8515c5cf6e2e	bb32438a-cdd2-4334-b47e-76fa8f05fa02	1	16	5	2025-10-22 08:41:52.165041	21	11
4cc6f6ed-aa73-404e-955e-ae6127da50ec	bb32438a-cdd2-4334-b47e-76fa8f05fa02	6	30	0	2025-10-22 08:41:52.790376	37	22
177d5f07-0e58-431c-a747-47fb16342699	bb32438a-cdd2-4334-b47e-76fa8f05fa02	11	22	2	2025-10-22 08:41:53.384898	28	17
bc23555c-fff5-4fc0-8323-e52ae5966fa8	77bde8e3-6499-424b-b5be-c08527274254	4	26	1	2025-10-22 08:41:55.676846	31	21
c687dab9-3c21-4678-91b2-93d8cb55edde	77bde8e3-6499-424b-b5be-c08527274254	9	34	0	2025-10-22 08:41:56.268073	39	29
955945d6-ca9e-4d85-ab26-eccaaf2db0b2	1573b4b0-d2f5-4233-a921-d389464b2652	2	22	20	2025-10-22 08:41:58.654838	27	17
1425da8a-8119-42cf-9370-e22083e170ba	1573b4b0-d2f5-4233-a921-d389464b2652	7	11	65	2025-10-22 08:41:59.282464	17	7
7e9c56f3-812a-4bdd-98b0-5e8b799e9dce	1573b4b0-d2f5-4233-a921-d389464b2652	12	21	15	2025-10-22 08:41:59.87257	27	16
9dafd590-439b-4773-809b-c58539229f17	6c0bd24e-14ca-4c80-b29c-71745928da50	2	21	3	2025-10-22 08:42:01.831792	29	14
a6af2f81-ec38-4004-b0ba-a07980e4fa6c	6c0bd24e-14ca-4c80-b29c-71745928da50	7	17	7	2025-10-22 08:42:02.557412	23	12
cf2c7b60-864d-4fe8-ab29-344d316462fe	6c0bd24e-14ca-4c80-b29c-71745928da50	12	19	36	2025-10-22 08:42:03.146151	26	15
d8707f77-bfea-4d6e-8d37-71bddf2ab77b	d912c555-48dc-4e7e-966d-69dd759dbd67	5	26	88	2025-10-22 08:42:05.425164	28	24
761729af-05bf-4412-9e8e-8838dd41de6d	d912c555-48dc-4e7e-966d-69dd759dbd67	10	27	122	2025-10-22 08:42:05.991581	31	23
dcae14c5-f074-4a2e-8421-2fa74b2b40ff	233e5db9-17a5-4176-9ebf-a70ab0181294	3	23	200	2025-10-22 08:42:08.447242	25	20
74b114c7-3202-4036-ba34-c4ef58b2c0f9	233e5db9-17a5-4176-9ebf-a70ab0181294	8	19	94	2025-10-22 08:42:09.031751	22	17
4c8a9e1b-32a7-45cc-b4c4-b5820e2f5a67	21efc7c2-226e-4e70-ae43-276f5e08fb09	1	26	435	2025-10-22 08:42:11.392801	27	25
4013fee9-1104-4798-a74d-d921716b85ca	21efc7c2-226e-4e70-ae43-276f5e08fb09	6	27	72	2025-10-22 08:42:11.974793	28	26
84dab728-f492-4643-92be-161445ea583e	21efc7c2-226e-4e70-ae43-276f5e08fb09	11	28	291	2025-10-22 08:42:12.567137	29	26
7d5f27f5-1e64-4fab-86e9-f4b666ad77db	a2220d3a-edc0-4b94-b63e-6f15223d08f7	4	12	146	2025-10-22 08:42:14.916896	18	8
959c38a2-4526-495d-9ab4-c115973819f2	a2220d3a-edc0-4b94-b63e-6f15223d08f7	9	20	237	2025-10-22 08:42:15.505412	25	16
c9453c4d-0c57-4731-9c1a-0189423dc1d2	308a9847-f5ea-42df-a771-7aba5195bd68	2	20	32	2025-10-22 08:42:20.027275	27	14
baa5a0af-691e-4997-b592-736f27161615	308a9847-f5ea-42df-a771-7aba5195bd68	7	28	203	2025-10-22 08:42:20.681368	33	24
464bcb3e-5f74-4abb-b4cd-334b77594066	308a9847-f5ea-42df-a771-7aba5195bd68	12	17	128	2025-10-22 08:42:21.261794	21	14
f9b4a732-f6b0-44ea-966d-5281de425fa5	7f82c313-1e45-4860-8fa7-3cfc79e6f378	5	26	145	2025-10-22 08:42:23.572761	29	22
568119f2-4cc6-463a-ae93-2e4125b04c1d	7f82c313-1e45-4860-8fa7-3cfc79e6f378	10	26	81	2025-10-22 08:42:24.151269	29	23
8a95023a-33b1-4a1e-923e-0dc99fe970fb	c1d63475-0721-4bf5-b1d2-a19fd88051f3	3	11	204	2025-10-22 08:42:26.432749	16	8
b6e98f65-5675-4e37-8711-205cd77c6449	c1d63475-0721-4bf5-b1d2-a19fd88051f3	8	23	86	2025-10-22 08:42:27.005281	30	18
c594ded3-bfa3-4898-b290-e4d6f684c013	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	1	10	261	2025-10-22 08:42:29.353343	13	7
eb8e1b9c-41a0-4c30-80f1-211ebfd192d3	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	3	10	229	2025-10-22 08:42:29.569466	12	7
c39dacd4-7b88-481a-81da-03a90dc821b0	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	8	17	0	2025-10-22 08:42:30.172196	21	14
55640241-c3ee-4390-b910-85bf16c59d77	fc0875fa-a672-4034-925e-5070a23d5dde	1	25	65	2025-10-22 08:42:32.737608	27	23
33e01422-2e39-479e-8a5a-aff34261c09c	fc0875fa-a672-4034-925e-5070a23d5dde	6	28	77	2025-10-22 08:42:33.320125	32	25
a4002591-f651-43da-8fd7-fa9c9a8ed789	fc0875fa-a672-4034-925e-5070a23d5dde	11	26	129	2025-10-22 08:42:33.891909	29	23
6336de40-559b-4107-86a1-9e006c78b52f	c6f40f33-aebe-4842-a810-1454b5765789	4	26	32	2025-10-22 08:42:36.177954	29	24
5ea92757-1e97-4896-a3b7-c6b8e2f0f79b	c6f40f33-aebe-4842-a810-1454b5765789	9	28	96	2025-10-22 08:42:36.730581	32	25
a956439e-9626-4cc7-bc92-5d63b9e2ecd7	cca3e83c-81e1-44b5-98c7-920d668fa450	2	27	130	2025-10-22 08:42:39.058292	32	24
e9d02522-ed4e-4ee0-9614-a73fe0aa09fb	cca3e83c-81e1-44b5-98c7-920d668fa450	7	21	45	2025-10-22 08:42:39.614732	26	17
ef9d9e58-1231-4a74-b7ad-cb5793becb90	cca3e83c-81e1-44b5-98c7-920d668fa450	12	27	104	2025-10-22 08:42:40.227885	32	22
323912d2-3b3a-4012-adf6-3eb4c59f5f50	de8907fb-039d-413e-9c03-920965ce771f	5	15	106	2025-10-22 08:42:42.55748	19	12
7bd4bebf-cc9d-45fa-a3ac-0c8cc349952b	de8907fb-039d-413e-9c03-920965ce771f	10	17	67	2025-10-22 08:42:43.127283	22	13
5692adec-9fa2-4eca-a116-e7d7bc0bd65e	da22f443-5e49-4961-8f29-172c69689f8f	3	23	17	2025-10-22 08:42:45.420368	26	21
27a13ff3-01f6-4bde-ba3a-5dec607a2ea4	da22f443-5e49-4961-8f29-172c69689f8f	8	18	1	2025-10-22 08:42:45.980377	21	16
81a091a9-d1bb-40c1-855a-7635d6e1d882	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	1	21	171	2025-10-22 08:42:48.239236	25	18
937ba054-d890-45bb-bbf3-247327a3b321	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	6	12	20	2025-10-22 08:42:48.818242	18	8
d91b31a2-4591-4653-974a-880d228f0622	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	11	19	133	2025-10-22 08:42:49.38913	23	16
c90eb0f3-5b79-4d82-8ab5-7d86a996221d	a0da746c-34bf-41ec-a76d-8ba13eea02fa	4	15	86	2025-10-22 08:42:51.652175	20	10
dc9c83bd-2234-41de-a6f2-a546af904fd3	a0da746c-34bf-41ec-a76d-8ba13eea02fa	9	13	22	2025-10-22 08:42:52.21825	19	9
ac3076b3-8384-4b3e-8500-5c9f4b95f3dc	26ea7651-8b3a-4860-9615-cfd2daa5da7e	2	24	59	2025-10-22 08:42:54.498076	27	21
1a082cf4-4bc8-4702-9b48-5778b625dd7c	26ea7651-8b3a-4860-9615-cfd2daa5da7e	7	17	29	2025-10-22 08:42:55.041165	22	12
4f4b3063-9b5d-41fb-a362-7da0500c43b4	26ea7651-8b3a-4860-9615-cfd2daa5da7e	12	25	129	2025-10-22 08:42:55.580369	29	21
02310036-220a-440b-954f-7b02b81255b6	759e1ea0-6f6e-4748-bcff-feed6971984d	5	24	33	2025-10-22 08:42:57.875943	26	22
adcbc3f7-c665-4721-910a-91993397130d	759e1ea0-6f6e-4748-bcff-feed6971984d	10	24	21	2025-10-22 08:42:58.4145	27	21
8e475fe0-551c-4657-9c1f-d92ed5c2752f	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	3	18	98	2025-10-22 08:43:00.700885	21	15
92b1255e-b6f1-4b5c-aae9-422fcfb4509d	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	8	10	62	2025-10-22 08:43:01.316244	14	7
b534500b-5180-43eb-80f2-e34677320194	2d523087-d3c7-4703-ad6f-41446739da7e	1	19	50	2025-10-22 08:43:03.594985	24	14
1a8612ea-e34d-4bef-8982-18fbd91fd78f	2d523087-d3c7-4703-ad6f-41446739da7e	6	5	74	2025-10-22 08:43:04.145442	7	3
6eded27b-d7bd-48a3-9bd8-651661d5591a	2d523087-d3c7-4703-ad6f-41446739da7e	11	12	74	2025-10-22 08:43:04.713318	17	8
fec0a160-4814-4dde-a5df-3b6d7fc92d77	909cd680-5725-4941-8ae5-a2ce18f4ca29	4	26	97	2025-10-22 08:43:06.956322	31	23
857c4513-c038-439e-999f-989525fd5072	909cd680-5725-4941-8ae5-a2ce18f4ca29	9	23	197	2025-10-22 08:43:07.52575	27	21
f9a72444-2cb1-412b-abc3-57e5e1c4b6a9	889dc3df-b948-4b04-9c1c-0d9384027b7f	2	24	122	2025-10-22 08:43:09.779138	25	22
98f00695-8fa3-461e-8bef-afa32391d99d	889dc3df-b948-4b04-9c1c-0d9384027b7f	7	24	36	2025-10-22 08:43:10.349564	24	23
fa055743-9f35-455c-8d0e-52531572226f	889dc3df-b948-4b04-9c1c-0d9384027b7f	12	24	328	2025-10-22 08:43:10.910905	25	23
8b753b17-f7a7-48c2-ae47-5de9dcf014ca	2104f32a-c752-4132-ba7c-be5c16783703	2	13	76	2025-10-22 08:26:42.930372	17	9
90c9b722-10cc-44c5-b15a-6dfac1735ab9	2104f32a-c752-4132-ba7c-be5c16783703	7	26	3	2025-10-22 08:26:48.440127	30	21
9397fc4f-bc49-4002-b7c5-5e2fb15bc00c	2104f32a-c752-4132-ba7c-be5c16783703	12	13	94	2025-10-22 08:26:50.37201	16	9
6aafcd16-c72b-4024-ab13-6ceefe7e3013	94eae822-75c8-4ab6-9a19-60ea2be42719	5	22	13	2025-10-22 08:27:46.300523	25	18
f689f551-0ac4-484f-b69a-eddf049a5aa0	94eae822-75c8-4ab6-9a19-60ea2be42719	10	21	58	2025-10-22 08:27:49.068668	24	18
801b53cc-0a1f-41d0-8235-f8c47625a2ef	5a7f78e6-08af-46ee-8b5c-7c977948c82f	1	19	21	2025-10-22 08:40:11.966026	24	14
e67b7f86-eb6d-4c3d-8492-03ac7db76209	5a7f78e6-08af-46ee-8b5c-7c977948c82f	3	23	22	2025-10-22 08:40:12.20711	29	17
719851d6-9802-4041-b50d-b28cc874e5be	5a7f78e6-08af-46ee-8b5c-7c977948c82f	8	35	0	2025-10-22 08:40:12.786469	43	30
7226a297-46f4-4913-a49d-ede733f9dcb2	5a7f78e6-08af-46ee-8b5c-7c977948c82f	9	33	0	2025-10-22 08:40:12.905013	41	27
4ca86670-42cb-46e5-9399-e5527ab37c60	56ae9458-2047-460e-a144-589720da6c92	5	20	99	2025-10-22 08:44:34.102936	25	15
54cef75a-0f21-4c35-8c20-68374981d48d	56ae9458-2047-460e-a144-589720da6c92	10	16	79	2025-10-22 08:44:34.646223	21	11
\.


--
-- Data for Name: destinations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.destinations (id, name, country, region, type, flight_hours, time_difference, visa_required, currency, language, budget_level, best_months, worst_months, high_star_share, beach_pool_quality, kid_facilities_quality, notes, visited, created_at, updated_at) FROM stdin;
2104f32a-c752-4132-ba7c-be5c16783703	Algarve	Portugal	Europe	Beach	2.5	0	No	EUR	Portuguese	Mid-Range	May,June,September	January	65.0	9	8	Excellent family beaches with warm water	f	2025-10-22 08:21:54.600211	2025-10-22 08:21:54.600211
fd5455a1-8f35-40e4-84f5-5cab30de8bea	Barcelona	Spain	Europe	City	2.0	0	No	EUR	Spanish/Catalan	Mid-Range	April,May,September,October	August	45.0	7	7	Beach city with great culture, can be crowded in summer	f	2025-10-22 08:21:54.9696	2025-10-22 08:21:54.9696
94eae822-75c8-4ab6-9a19-60ea2be42719	Greek Islands - Crete	Greece	Europe	Beach	4.0	2	No	EUR	Greek	Mid-Range	May,June,September,October	November,December,January,February	55.0	9	7	Largest Greek island with diverse landscapes	f	2025-10-22 08:21:55.241589	2025-10-22 08:21:55.241589
9c2f029b-d332-44c6-9942-291b958ee22b	Maldives	Maldives	Asia	Beach	10.0	5	EVisa	MVR	Dhivehi	Ultra-Luxury	November,December,January,February,March,April	May,June,July,August,September,October	85.0	10	8	Ultimate luxury beach destination with pristine waters	f	2025-10-22 08:21:55.461527	2025-10-22 08:21:55.461527
d6094b52-39aa-43bd-8fca-511fc8a9432c	Dubai	UAE	Asia	Beach	7.0	4	EVisa	AED	Arabic	Luxury	November,December,January,February,March	July	78.0	8	9	Family-friendly with excellent facilities year-round indoor options	f	2025-10-22 08:21:55.677841	2025-10-22 08:21:55.677841
5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	Stockholm	Sweden	Europe	City	2.5	1	No	SEK	Swedish	Luxury	June,July,August	December,January,February	55.0	3	8	Beautiful archipelago and museums	f	2025-10-22 08:35:49.499039	2025-10-22 08:35:49.499039
71d8e9dc-afd7-42b7-8211-140c424dd010	Copenhagen	Denmark	Europe	City	2.0	1	No	DKK	Danish	Luxury	May,June,July,August	December,January,February	60.0	4	9	Family-friendly city with Tivoli Gardens	f	2025-10-22 08:35:49.808568	2025-10-22 08:35:49.808568
07575d0e-9875-487e-89b2-9736ff43952d	Oslo	Norway	Europe	City	2.5	1	No	NOK	Norwegian	Luxury	June,July,August	December,January,February	58.0	3	8	Fjords and outdoor activities	f	2025-10-22 08:35:50.094657	2025-10-22 08:35:50.094657
c63dd5b1-eece-4cea-ad8a-fc03a0be9738	Helsinki	Finland	Europe	City	3.0	2	No	EUR	Finnish	Luxury	June,July,August	December,January,February	52.0	4	8	Design capital with archipelago	f	2025-10-22 08:35:50.38745	2025-10-22 08:35:50.38745
78c34395-9186-472b-b93a-58fc587ca0f3	Reykjavik	Iceland	Europe	Nature	3.0	0	No	ISK	Icelandic	Luxury	June,July,August	December,January,February	50.0	2	7	Unique landscapes and Northern Lights	f	2025-10-22 08:35:50.654699	2025-10-22 08:35:50.654699
7b066287-4fd7-4149-bb8b-9c59096a664d	Edinburgh	Scotland	Europe	City	1.5	0	No	GBP	English	Mid-Range	May,June,July,August,September	December,January,February	48.0	2	7	Historic city with festivals	f	2025-10-22 08:35:50.92988	2025-10-22 08:35:50.92988
95691984-3e58-4dec-9640-01c57ab9ac8a	Inverness	Scotland	Europe	Nature	1.5	0	No	GBP	English	Mid-Range	May,June,July,August,September	November,December,January,February	45.0	3	6	Gateway to Scottish Highlands	f	2025-10-22 08:35:51.20999	2025-10-22 08:35:51.20999
280ef307-84b2-4a03-b406-90255c159d25	Dublin	Ireland	Europe	City	1.5	0	No	EUR	English	Mid-Range	May,June,July,August,September	December,January,February	52.0	3	7	Friendly city with history	f	2025-10-22 08:35:51.473812	2025-10-22 08:35:51.473812
3a95aac2-b3ce-4810-af20-37bab52b15df	Cork	Ireland	Europe	City	1.5	0	No	EUR	English	Mid-Range	May,June,July,August,September	December,January,February	48.0	4	7	Coastal city with charm	f	2025-10-22 08:35:51.706493	2025-10-22 08:35:51.706493
ee1ba396-efeb-414f-8a30-29f9c03d6bfe	Amsterdam	Netherlands	Europe	City	1.5	1	No	EUR	Dutch	Mid-Range	April,May,June,September	November,December,January	58.0	3	8	Canals and family-friendly museums	f	2025-10-22 08:35:51.916827	2025-10-22 08:35:51.916827
05abad90-6ae1-49df-84c2-1dfae020140d	Brussels	Belgium	Europe	City	1.0	1	No	EUR	French/Dutch	Mid-Range	April,May,June,September,October	December,January,February	55.0	2	7	European capital with chocolate	f	2025-10-22 08:35:52.134418	2025-10-22 08:35:52.134418
ea431f38-c1da-433b-ba90-51bd7fee1a3e	Paris	France	Europe	City	1.5	1	No	EUR	French	Mid-Range	April,May,June,September,October	August	62.0	3	8	Disneyland Paris and culture	f	2025-10-22 08:35:52.335807	2025-10-22 08:35:52.335807
1137f046-8540-4bac-9bee-86851f1484ab	Lyon	France	Europe	City	1.5	1	No	EUR	French	Mid-Range	April,May,June,September,October	December,January,February	56.0	2	7	Gastronomic capital	f	2025-10-22 08:35:52.546008	2025-10-22 08:35:52.546008
ae4bfff9-b173-44c7-b911-07148be73b72	Nice	France	Europe	Beach	2.0	1	No	EUR	French	Mid-Range	May,June,September,October	November,December,January	64.0	8	7	French Riviera beaches	f	2025-10-22 08:35:52.75596	2025-10-22 08:35:52.75596
91b54feb-5c07-4c9e-9d67-e5f9a0849f76	Bordeaux	France	Europe	City	2.0	1	No	EUR	French	Mid-Range	May,June,September,October	December,January,February	58.0	3	7	Wine region with Atlantic beaches	f	2025-10-22 08:35:52.974616	2025-10-22 08:35:52.974616
538f180b-716f-4539-96e4-e47d79a02d86	Munich	Germany	Europe	City	2.0	1	No	EUR	German	Mid-Range	May,June,July,August,September	December,January,February	60.0	2	8	Bavaria with nearby Alps	f	2025-10-22 08:35:53.178092	2025-10-22 08:35:53.178092
f1af3688-db90-4f1b-a893-ceb12e4abebf	Berlin	Germany	Europe	City	2.0	1	No	EUR	German	Mid-Range	May,June,July,August,September	December,January,February	54.0	2	8	History and family attractions	f	2025-10-22 08:35:53.385132	2025-10-22 08:35:53.385132
034e97c9-6c2e-4e8d-a2f6-045add3f3533	Hamburg	Germany	Europe	City	1.5	1	No	EUR	German	Mid-Range	May,June,July,August,September	December,January,February	56.0	3	8	Port city with waterfront	f	2025-10-22 08:35:53.611614	2025-10-22 08:35:53.611614
968d1662-490e-408e-941d-d03e11ebc507	Vienna	Austria	Europe	City	2.5	1	No	EUR	German	Mid-Range	April,May,June,September,October	December,January,February	65.0	2	8	Imperial city with palaces	f	2025-10-22 08:35:53.821798	2025-10-22 08:35:53.821798
7862827c-77e1-4e97-a2d6-61adacef3cb0	Salzburg	Austria	Europe	City	2.0	1	No	EUR	German	Mid-Range	May,June,July,August,September	December,January,February	62.0	2	7	Sound of Music and mountains	f	2025-10-22 08:35:54.039772	2025-10-22 08:35:54.039772
f5409693-946e-47c5-8f04-0babe818f750	Prague	Czech Republic	Europe	City	2.0	1	No	CZK	Czech	Budget	April,May,June,September,October	December,January,February	52.0	2	7	Fairy-tale castle city	f	2025-10-22 08:35:54.250993	2025-10-22 08:35:54.250993
4995c976-3d3a-441a-9521-2d21b9e6d231	Budapest	Hungary	Europe	City	2.5	1	No	HUF	Hungarian	Budget	April,May,June,September,October	December,January,February	48.0	2	7	Thermal baths and architecture	f	2025-10-22 08:35:54.46609	2025-10-22 08:35:54.46609
78486986-b3e9-49d4-b1e4-9113a38b21ed	Krakow	Poland	Europe	City	2.5	1	No	PLN	Polish	Budget	May,June,July,August,September	December,January,February	45.0	2	6	Historic Old Town	f	2025-10-22 08:35:55.083104	2025-10-22 08:35:55.083104
58006810-48b3-4b09-9e4a-cce139f122d3	Warsaw	Poland	Europe	City	2.5	1	No	PLN	Polish	Budget	May,June,July,August,September	December,January,February	42.0	2	6	Rebuilt historic center	f	2025-10-22 08:35:55.283751	2025-10-22 08:35:55.283751
c41bab8a-909c-46b3-9c7f-daba35f04b3e	Zurich	Switzerland	Europe	City	2.0	1	No	CHF	German	Luxury	June,July,August,September	December,January,February	68.0	4	8	Lake and mountain access	f	2025-10-22 08:35:55.500724	2025-10-22 08:35:55.500724
dddcc5d6-25ef-46c9-9ac5-47d86806e102	Geneva	Switzerland	Europe	City	1.5	1	No	CHF	French	Luxury	May,June,July,August,September	December,January,February	70.0	5	8	Lake Geneva and nearby Alps	f	2025-10-22 08:35:55.77573	2025-10-22 08:35:55.77573
b35896d8-a00b-4d6b-be31-215b59fae616	Milan	Italy	Europe	City	2.0	1	No	EUR	Italian	Mid-Range	April,May,June,September,October	July,August	58.0	3	7	Fashion capital with nearby lakes	f	2025-10-22 08:35:56.032082	2025-10-22 08:35:56.032082
f0c15c68-5571-4643-88ca-b66d92034063	Venice	Italy	Europe	City	2.0	1	No	EUR	Italian	Mid-Range	April,May,June,September,October	November,December,January,February	60.0	4	7	Unique canal city	f	2025-10-22 08:35:56.25225	2025-10-22 08:35:56.25225
2b6552a5-7838-4bbf-aa5a-503f34ef8637	Florence	Italy	Europe	City	2.5	1	No	EUR	Italian	Mid-Range	April,May,June,September,October	July,August	62.0	3	7	Renaissance art and Tuscany	f	2025-10-22 08:35:56.480017	2025-10-22 08:35:56.480017
bd63a7eb-7275-4976-9597-d15f6ff96c1b	Rome	Italy	Europe	City	2.5	1	No	EUR	Italian	Mid-Range	April,May,June,September,October	July,August	64.0	3	8	Ancient history and gelato	f	2025-10-22 08:35:56.698547	2025-10-22 08:35:56.698547
dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	Naples	Italy	Europe	City	3.0	1	No	EUR	Italian	Mid-Range	April,May,June,September,October	July,August	52.0	6	6	Pizza and Pompeii access	f	2025-10-22 08:35:56.925366	2025-10-22 08:35:56.925366
def70aeb-2af9-4e04-a014-d5d2bc0010a7	Positano	Italy	Europe	Beach	3.0	1	No	EUR	Italian	Luxury	May,June,September,October	November,December,January,February	75.0	9	7	Stunning Amalfi Coast beaches	f	2025-10-22 08:35:57.132946	2025-10-22 08:35:57.132946
62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	Seville	Spain	Europe	City	2.5	1	No	EUR	Spanish	Mid-Range	March,April,May,October,November	July,August	56.0	4	7	Flamenco and historic sites	f	2025-10-22 08:35:57.351936	2025-10-22 08:35:57.351936
cbf0915e-da75-48b2-b85a-da06992d1b0b	Madrid	Spain	Europe	City	2.5	1	No	EUR	Spanish	Mid-Range	April,May,June,September,October	July,August	58.0	2	8	Royal palace and museums	f	2025-10-22 08:35:57.576375	2025-10-22 08:35:57.576375
4d09e521-8224-4513-82fa-a6b42af3dcd6	Valencia	Spain	Europe	City	2.0	1	No	EUR	Spanish	Mid-Range	April,May,June,September,October	July,August	54.0	7	7	City of Arts and Sciences with beach	f	2025-10-22 08:35:57.82805	2025-10-22 08:35:57.82805
78063abb-e5c2-42b0-8d3d-d24f17c28d35	Malaga	Spain	Europe	Beach	3.0	1	No	EUR	Spanish	Mid-Range	May,June,September,October	July,August	62.0	8	7	Costa del Sol beaches	f	2025-10-22 08:35:58.089554	2025-10-22 08:35:58.089554
04570fa5-4011-4591-af21-06093e7b6297	Ibiza	Spain	Europe	Beach	2.5	1	No	EUR	Spanish	Mid-Range	May,June,September,October	November,December,January,February	68.0	9	7	Family beaches away from party zones	f	2025-10-22 08:35:58.335687	2025-10-22 08:35:58.335687
35b60547-1009-454d-890d-c4b35f1ce3f2	Majorca	Spain	Europe	Beach	2.5	1	No	EUR	Spanish	Mid-Range	May,June,September,October	November,December,January,February	66.0	9	8	Beautiful coves and family resorts	f	2025-10-22 08:35:58.548125	2025-10-22 08:35:58.548125
ef893d9d-59a6-4714-91d3-132569a2fe06	Lisbon	Portugal	Europe	City	2.5	0	No	EUR	Portuguese	Mid-Range	April,May,June,September,October	December,January,February	58.0	5	7	Hills and nearby beaches	f	2025-10-22 08:35:58.759219	2025-10-22 08:35:58.759219
66ada0dc-7cb2-489c-909d-754e5e208a13	Porto	Portugal	Europe	City	2.5	0	No	EUR	Portuguese	Mid-Range	April,May,June,September,October	December,January,February	56.0	4	7	Port wine and Douro valley	f	2025-10-22 08:35:58.980363	2025-10-22 08:35:58.980363
a169c096-7d0e-4505-a487-d08fca579276	Athens	Greece	Europe	City	4.0	2	No	EUR	Greek	Mid-Range	April,May,June,September,October	July,August	54.0	6	7	Ancient ruins and nearby islands	f	2025-10-22 08:35:59.234306	2025-10-22 08:35:59.234306
351d9e16-cc72-4671-9e47-d43442749a9f	Santorini	Greece	Europe	Beach	4.0	2	No	EUR	Greek	Luxury	May,June,September,October	November,December,January,February	72.0	8	6	Volcanic island with stunning views	f	2025-10-22 08:35:59.480965	2025-10-22 08:35:59.480965
90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	Mykonos	Greece	Europe	Beach	4.0	2	No	EUR	Greek	Luxury	May,June,September,October	November,December,January,February	70.0	8	6	Beautiful beaches and whitewashed towns	f	2025-10-22 08:35:59.722612	2025-10-22 08:35:59.722612
d3a9895e-21c2-4aa7-92e5-3a04aee72014	Rhodes	Greece	Europe	Beach	4.5	2	No	EUR	Greek	Mid-Range	May,June,September,October	November,December,January,February	62.0	9	7	Medieval old town with beaches	f	2025-10-22 08:35:59.944169	2025-10-22 08:35:59.944169
e8af6b26-7aec-4d39-b34c-e849a70b2d2a	Corfu	Greece	Europe	Beach	3.5	2	No	EUR	Greek	Mid-Range	May,June,September,October	November,December,January,February	58.0	8	7	Green island with Venetian influence	f	2025-10-22 08:36:00.181793	2025-10-22 08:36:00.181793
f5ba86d5-4e8b-4abe-9feb-add2d374d219	Istanbul	Turkey	Europe	City	4.0	3	EVisa	TRY	Turkish	Budget	April,May,June,September,October	July,August	48.0	4	7	East meets West with rich history	f	2025-10-22 08:36:00.425783	2025-10-22 08:36:00.425783
9415905d-81c3-4577-b19a-8e60bd2459d8	Antalya	Turkey	Europe	Beach	4.5	3	EVisa	TRY	Turkish	Budget	May,June,September,October	November,December,January,February	56.0	9	8	Turkish Riviera with ancient ruins	f	2025-10-22 08:36:00.666559	2025-10-22 08:36:00.666559
fcd5fba1-05b5-47df-8205-d060f411f56c	Bodrum	Turkey	Europe	Beach	4.5	3	EVisa	TRY	Turkish	Budget	May,June,September,October	November,December,January,February	54.0	9	7	Aegean coast resort	f	2025-10-22 08:36:00.876484	2025-10-22 08:36:00.876484
fe29e631-c438-4178-978f-6ed4e12c4b49	Windermere	United Kingdom	Europe	Nature	0.5	0	No	GBP	English	Mid-Range	May,June,July,August,September	December,January,February	46.0	4	7	Lake District scenic beauty	f	2025-10-22 08:36:01.105882	2025-10-22 08:36:01.105882
bb97bdcb-63ab-4870-8514-747b141bb008	York	United Kingdom	Europe	City	0.5	0	No	GBP	English	Mid-Range	May,June,July,August,September	December,January,February	48.0	2	7	Viking history and medieval walls	f	2025-10-22 08:36:01.326772	2025-10-22 08:36:01.326772
4f5e2e34-2d78-47f9-9077-a33b0445ddfc	Bath	United Kingdom	Europe	City	0.3	0	No	GBP	English	Mid-Range	May,June,July,August,September	December,January,February	52.0	2	7	Roman baths and Georgian architecture	f	2025-10-22 08:36:01.539825	2025-10-22 08:36:01.539825
5a7f78e6-08af-46ee-8b5c-7c977948c82f	Abu Dhabi	UAE	Asia	Beach	7.0	4	EVisa	AED	Arabic	Luxury	November,December,January,February,March	June,July,August	76.0	8	9	Warner Bros World and beaches	f	2025-10-22 08:36:01.872537	2025-10-22 08:36:01.872537
a42651c6-4071-492e-8c3b-f271e2142216	Doha	Qatar	Asia	City	7.0	3	EVisa	QAR	Arabic	Luxury	November,December,January,February,March	June,July,August	74.0	7	8	Modern city with family attractions	f	2025-10-22 08:36:02.177023	2025-10-22 08:36:02.177023
30f65744-b572-488a-ab73-4d8e4867a82a	Bangkok	Thailand	Asia	City	11.0	7	EVisa	THB	Thai	Budget	November,December,January,February	April,May	48.0	5	7	Temples and street food	f	2025-10-22 08:36:02.404068	2025-10-22 08:36:02.404068
62db09a1-adc2-4359-bdb0-8b272a6acc47	Phuket	Thailand	Asia	Beach	12.0	7	EVisa	THB	Thai	Budget	November,December,January,February,March	May,June,September,October	56.0	9	8	Thailand's largest island with beaches	f	2025-10-22 08:36:02.620114	2025-10-22 08:36:02.620114
753bc31b-0e39-4b59-bc04-e0d266b1abc8	Koh Samui	Thailand	Asia	Beach	12.0	7	EVisa	THB	Thai	Budget	December,January,February	September,October,November	54.0	9	7	Island paradise with family resorts	f	2025-10-22 08:36:02.850221	2025-10-22 08:36:02.850221
a44c509e-e6d4-447f-a0d7-f39379b2ab9a	Krabi	Thailand	Asia	Beach	12.0	7	EVisa	THB	Thai	Budget	November,December,January,February,March	May,June,September,October	52.0	10	7	Limestone cliffs and pristine beaches	f	2025-10-22 08:36:03.086453	2025-10-22 08:36:03.086453
a582aaba-fda9-44cb-ab72-c6bc346b210c	Chiang Mai	Thailand	Asia	City	12.0	7	EVisa	THB	Thai	Budget	November,December,January,February	April,May	45.0	3	6	Cultural city with temples	f	2025-10-22 08:36:03.310937	2025-10-22 08:36:03.310937
817e316f-0af7-450b-afe9-61780f529d8e	Singapore	Singapore	Asia	City	13.0	8	EVisa	SGD	English	Luxury	February,March,April,July,August	November,December,January	72.0	6	10	Universal Studios and family parks	f	2025-10-22 08:36:03.524335	2025-10-22 08:36:03.524335
fefb26e2-8f48-4be8-995f-b27d70d356a9	Bali	Indonesia	Asia	Beach	15.0	8	EVisa	IDR	Indonesian	Mid-Range	April,May,June,July,August,September	December,January,February	64.0	9	8	Temples and beautiful beaches	f	2025-10-22 08:36:03.761671	2025-10-22 08:36:03.761671
2fd0938b-847f-4609-9f43-1db7708ed8f0	Kuala Lumpur	Malaysia	Asia	City	13.0	8	EVisa	MYR	Malay	Budget	May,June,July,August	November,December,January	50.0	5	8	Petronas Towers and theme parks	f	2025-10-22 08:36:03.995546	2025-10-22 08:36:03.995546
f044a094-f9ef-42ea-80fa-b66e5b7104ba	Langkawi	Malaysia	Asia	Beach	13.0	8	EVisa	MYR	Malay	Budget	November,December,January,February,March	May,June,July,August,September	52.0	9	7	Duty-free island with beaches	f	2025-10-22 08:36:04.219793	2025-10-22 08:36:04.219793
52e5f7b4-2418-49b7-a26e-728b5eaf1747	Penang	Malaysia	Asia	Beach	13.0	8	EVisa	MYR	Malay	Budget	December,January,February	April,May,September,October	48.0	7	7	UNESCO heritage and food	f	2025-10-22 08:36:04.468552	2025-10-22 08:36:04.468552
b4f1f567-9c30-440d-93cd-ff51bdcf94c3	Hanoi	Vietnam	Asia	City	11.0	7	EVisa	VND	Vietnamese	Budget	October,November,December,March,April	June,July,August	42.0	3	6	Old Quarter and culture	f	2025-10-22 08:36:04.715182	2025-10-22 08:36:04.715182
c4b42ac2-2047-466a-bdc1-708a04105814	Ho Chi Minh City	Vietnam	Asia	City	12.0	7	EVisa	VND	Vietnamese	Budget	December,January,February,March,April	May,June,July,August,September	44.0	4	6	War history and vibrant city	f	2025-10-22 08:36:04.959979	2025-10-22 08:36:04.959979
10ea4947-03b3-4147-b520-8c2f79850a9d	Phu Quoc	Vietnam	Asia	Beach	13.0	7	EVisa	VND	Vietnamese	Budget	November,December,January,February,March,April	June,July,August,September	48.0	9	6	Island beaches and nature	f	2025-10-22 08:36:05.217536	2025-10-22 08:36:05.217536
fa435d58-ea7b-493f-8956-52d0170834c0	Tokyo	Japan	Asia	City	12.0	9	No	JPY	Japanese	Luxury	March,April,May,October,November	July,August	66.0	3	9	Disneyland and unique culture	f	2025-10-22 08:36:05.43654	2025-10-22 08:36:05.43654
7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	Kyoto	Japan	Asia	City	12.0	9	No	JPY	Japanese	Luxury	March,April,May,October,November	July,August	64.0	2	8	Temples and traditional Japan	f	2025-10-22 08:36:05.657079	2025-10-22 08:36:05.657079
853f4a5b-9f62-40d4-89b3-e6ced9799b43	Osaka	Japan	Asia	City	12.0	9	No	JPY	Japanese	Luxury	March,April,May,October,November	July,August	62.0	3	9	Universal Studios and street food	f	2025-10-22 08:36:05.9205	2025-10-22 08:36:05.9205
99616273-bdf3-4c3d-a934-baeed91e1011	Okinawa	Japan	Asia	Beach	14.0	9	No	JPY	Japanese	Luxury	April,May,June,October,November	July,August,September	58.0	9	8	Tropical Japanese islands	f	2025-10-22 08:36:06.165108	2025-10-22 08:36:06.165108
020585b3-fd9b-4d1b-bff9-365b4d108d3a	Seoul	South Korea	Asia	City	11.0	9	EVisa	KRW	Korean	Mid-Range	April,May,June,September,October,November	July,August	56.0	2	8	Modern city with palaces	f	2025-10-22 08:36:06.37783	2025-10-22 08:36:06.37783
13a558af-9e5a-4014-9357-bc53cc10d2e8	Hong Kong	China	Asia	City	12.0	8	No	HKD	Cantonese	Luxury	October,November,December,March,April	June,July,August	68.0	5	9	Disneyland and harbor views	f	2025-10-22 08:36:06.634643	2025-10-22 08:36:06.634643
54907426-a944-4986-8049-d99d2ee2a65f	Shanghai	China	Asia	City	11.0	8	Yes	CNY	Mandarin	Mid-Range	April,May,September,October,November	July,August	58.0	3	7	Modern skyline and Disney	f	2025-10-22 08:36:06.877059	2025-10-22 08:36:06.877059
11af9dc6-389d-4827-96d4-018c2b9d244e	Beijing	China	Asia	City	10.0	8	Yes	CNY	Mandarin	Mid-Range	April,May,September,October	July,August	54.0	2	7	Great Wall and Forbidden City	f	2025-10-22 08:36:07.086013	2025-10-22 08:36:07.086013
569d7973-ddea-4161-94f1-c247f083427c	Delhi	India	Asia	City	8.0	6	EVisa	INR	Hindi	Budget	October,November,February,March	June,July,August	46.0	3	6	Historical monuments	f	2025-10-22 08:36:07.297158	2025-10-22 08:36:07.297158
c96f9299-3c94-48d5-ac6d-e3a0f258546d	Jaipur	India	Asia	City	9.0	6	EVisa	INR	Hindi	Budget	October,November,February,March	June,July,August	48.0	4	6	Pink City palaces	f	2025-10-22 08:36:07.520038	2025-10-22 08:36:07.520038
66ad2215-7608-44bc-888b-cf52a6f9abd3	Goa	India	Asia	Beach	10.0	6	EVisa	INR	Hindi	Budget	November,December,January,February,March	June,July,August,September	52.0	8	6	Beach parties and Portuguese heritage	f	2025-10-22 08:36:07.75269	2025-10-22 08:36:07.75269
c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	Kerala	India	Asia	Nature	10.0	6	EVisa	INR	Hindi	Budget	September,October,November,December,January,February,March	June,July,August	50.0	7	6	Backwaters and Ayurveda	f	2025-10-22 08:36:08.01826	2025-10-22 08:36:08.01826
ec4c8781-45d7-4340-ab1d-074681ca2966	Colombo	Sri Lanka	Asia	Beach	10.0	6	EVisa	LKR	Sinhala	Budget	December,January,February,March	May,June,September,October	46.0	8	6	Beaches and wildlife	f	2025-10-22 08:36:08.255439	2025-10-22 08:36:08.255439
c58451eb-3f30-48cf-bc87-2459e7c2a910	Marrakech	Morocco	Africa	City	3.5	0	No	MAD	Arabic	Budget	March,April,May,October,November	July,August	52.0	5	6	Souks and riads	f	2025-10-22 08:36:08.77258	2025-10-22 08:36:08.77258
f392bd89-c29f-44bb-86d5-72ab0afb2f31	Agadir	Morocco	Africa	Beach	4.0	0	No	MAD	Arabic	Budget	March,April,May,September,October,November	December,January,February	54.0	8	6	Atlantic beaches and sunshine	f	2025-10-22 08:36:09.095496	2025-10-22 08:36:09.095496
bb32438a-cdd2-4334-b47e-76fa8f05fa02	Cairo	Egypt	Africa	City	5.0	2	Yes	EGP	Arabic	Budget	October,November,December,January,February,March,April	June,July,August	48.0	3	6	Pyramids and ancient wonders	f	2025-10-22 08:36:09.31892	2025-10-22 08:36:09.31892
77bde8e3-6499-424b-b5be-c08527274254	Sharm el-Sheikh	Egypt	Africa	Beach	6.0	2	Yes	EGP	Arabic	Budget	October,November,December,January,February,March,April	June,July,August	56.0	9	7	Red Sea diving and beaches	f	2025-10-22 08:36:09.529789	2025-10-22 08:36:09.529789
1573b4b0-d2f5-4233-a921-d389464b2652	Cape Town	South Africa	Africa	City	11.0	-2	No	ZAR	English	Mid-Range	November,December,January,February,March	June,July,August	58.0	8	7	Table Mountain and beaches	f	2025-10-22 08:36:09.7707	2025-10-22 08:36:09.7707
6c0bd24e-14ca-4c80-b29c-71745928da50	Nairobi	Kenya	Africa	Nature	8.5	3	EVisa	KES	Swahili	Mid-Range	January,February,June,July,August,September,October	April,May,November	46.0	3	6	Safari gateway	f	2025-10-22 08:36:09.98214	2025-10-22 08:36:09.98214
d912c555-48dc-4e7e-966d-69dd759dbd67	Zanzibar	Tanzania	Africa	Beach	10.0	3	EVisa	TZS	Swahili	Mid-Range	June,July,August,September,October	March,April,May	54.0	10	6	Spice island with pristine beaches	f	2025-10-22 08:36:10.237728	2025-10-22 08:36:10.237728
233e5db9-17a5-4176-9ebf-a70ab0181294	Mauritius	Mauritius	Africa	Beach	12.0	4	No	MUR	English	Luxury	May,June,July,August,September,October,November,December	January,February	68.0	10	8	All-inclusive island paradise	f	2025-10-22 08:36:10.449525	2025-10-22 08:36:10.449525
21efc7c2-226e-4e70-ae43-276f5e08fb09	Seychelles	Seychelles	Africa	Beach	11.0	4	No	SCR	English	Ultra-Luxury	April,May,October,November	December,January,February	78.0	10	7	Granite islands and turquoise waters	f	2025-10-22 08:36:10.664924	2025-10-22 08:36:10.664924
a2220d3a-edc0-4b94-b63e-6f15223d08f7	New York	USA	Americas	City	7.5	-5	EVisa	USD	English	Luxury	April,May,June,September,October	January,February	64.0	2	9	Central Park and museums	f	2025-10-22 08:36:10.87719	2025-10-22 08:36:10.87719
308a9847-f5ea-42df-a771-7aba5195bd68	Orlando	USA	Americas	City	9.0	-5	EVisa	USD	English	Mid-Range	March,April,May,October,November	June,July,August	62.0	7	10	Disney World and theme parks	f	2025-10-22 08:36:11.136756	2025-10-22 08:36:11.136756
7f82c313-1e45-4860-8fa7-3cfc79e6f378	Miami	USA	Americas	Beach	9.5	-5	EVisa	USD	English	Mid-Range	December,January,February,March,April	June,July,August,September	66.0	9	8	Art Deco and beaches	f	2025-10-22 08:36:11.373402	2025-10-22 08:36:11.373402
c1d63475-0721-4bf5-b1d2-a19fd88051f3	Los Angeles	USA	Americas	City	11.0	-8	EVisa	USD	English	Luxury	March,April,May,September,October,November	December,January,February	68.0	8	9	Disneyland and Hollywood	f	2025-10-22 08:36:11.58425	2025-10-22 08:36:11.58425
93a3be11-bb34-4f71-a819-16c8e1ecb4e7	San Francisco	USA	Americas	City	11.0	-8	EVisa	USD	English	Luxury	September,October,November	June,July,August	70.0	5	8	Golden Gate and cable cars	f	2025-10-22 08:36:11.804973	2025-10-22 08:36:11.804973
56ae9458-2047-460e-a144-589720da6c92	Washington DC	USA	Americas	City	8.0	-5	EVisa	USD	English	Mid-Range	April,May,September,October	July,August	58.0	2	8	Museums and monuments	f	2025-10-22 08:36:12.027739	2025-10-22 08:36:12.027739
fc0875fa-a672-4034-925e-5070a23d5dde	Cancun	Mexico	Americas	Beach	10.5	-5	No	MXN	Spanish	Mid-Range	November,December,January,February,March,April	September,October	64.0	10	8	Mayan ruins and Caribbean beaches	f	2025-10-22 08:36:12.24421	2025-10-22 08:36:12.24421
c6f40f33-aebe-4842-a810-1454b5765789	Riviera Maya	Mexico	Americas	Beach	11.0	-5	No	MXN	Spanish	Mid-Range	November,December,January,February,March,April	September,October	66.0	10	8	All-inclusive beach resorts	f	2025-10-22 08:36:12.471869	2025-10-22 08:36:12.471869
cca3e83c-81e1-44b5-98c7-920d668fa450	Rio de Janeiro	Brazil	Americas	Beach	11.5	-3	EVisa	BRL	Portuguese	Mid-Range	December,January,February,March	June,July,August	56.0	9	7	Copacabana and Christ the Redeemer	f	2025-10-22 08:36:12.704321	2025-10-22 08:36:12.704321
de8907fb-039d-413e-9c03-920965ce771f	Buenos Aires	Argentina	Americas	City	13.5	-3	No	ARS	Spanish	Budget	October,November,December,March,April	June,July,August	52.0	3	7	Tango and steaks	f	2025-10-22 08:36:12.914122	2025-10-22 08:36:12.914122
da22f443-5e49-4961-8f29-172c69689f8f	Lima	Peru	Americas	City	12.5	-5	No	PEN	Spanish	Budget	December,January,February,March	June,July,August	48.0	5	6	Machu Picchu gateway	f	2025-10-22 08:36:13.146232	2025-10-22 08:36:13.146232
d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	Sydney	Australia	Oceania	City	22.0	10	EVisa	AUD	English	Luxury	September,October,November,December,January,February,March,April	June,July,August	72.0	9	9	Harbour Bridge and Opera House	f	2025-10-22 08:36:13.369825	2025-10-22 08:36:13.369825
a0da746c-34bf-41ec-a76d-8ba13eea02fa	Melbourne	Australia	Oceania	City	22.0	10	EVisa	AUD	English	Luxury	October,November,December,January,February,March	June,July,August	68.0	6	9	Coffee culture and sports	f	2025-10-22 08:36:13.587002	2025-10-22 08:36:13.587002
26ea7651-8b3a-4860-9615-cfd2daa5da7e	Gold Coast	Australia	Oceania	Beach	23.0	10	EVisa	AUD	English	Mid-Range	September,October,November,December,January,February,March,April	June,July,August	64.0	9	9	Surf beaches and theme parks	f	2025-10-22 08:36:13.812403	2025-10-22 08:36:13.812403
759e1ea0-6f6e-4748-bcff-feed6971984d	Cairns	Australia	Oceania	Beach	24.0	10	EVisa	AUD	English	Mid-Range	April,May,June,July,August,September,October	December,January,February	58.0	10	8	Great Barrier Reef access	f	2025-10-22 08:36:14.034638	2025-10-22 08:36:14.034638
bd56db35-e936-4a2f-9b9a-4f0dbdce449b	Auckland	New Zealand	Oceania	City	24.0	12	EVisa	NZD	English	Luxury	November,December,January,February,March	June,July,August	66.0	7	9	Harbourside city with nature	f	2025-10-22 08:36:14.266701	2025-10-22 08:36:14.266701
2d523087-d3c7-4703-ad6f-41446739da7e	Queenstown	New Zealand	Oceania	Nature	24.0	12	EVisa	NZD	English	Luxury	December,January,February,March	June,July,August	64.0	6	8	Adventure capital	f	2025-10-22 08:36:14.507189	2025-10-22 08:36:14.507189
909cd680-5725-4941-8ae5-a2ce18f4ca29	Fiji	Fiji	Oceania	Beach	23.0	12	No	FJD	English	Mid-Range	May,June,July,August,September,October	December,January,February,March	62.0	10	7	Friendly islands with resorts	f	2025-10-22 08:36:14.740961	2025-10-22 08:36:14.740961
889dc3df-b948-4b04-9c1c-0d9384027b7f	Bora Bora	French Polynesia	Oceania	Beach	24.0	-10	No	XPF	French	Ultra-Luxury	May,June,July,August,September,October	December,January,February	82.0	10	6	Overwater bungalows paradise	f	2025-10-22 08:36:14.963261	2025-10-22 08:36:14.963261
\.


--
-- Data for Name: holiday_periods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holiday_periods (id, name, start_date, end_date, year, created_at) FROM stdin;
7094bace-2d1c-4e11-a708-121f3f8c6448	Christmas 2025	2025-12-20	2026-01-05	2025	2025-10-22 08:21:44.957129
81ad8f7c-d7cb-446b-ae5f-c11e6566875a	February Half Term 2026	2026-02-14	2026-02-22	2026	2025-10-22 08:21:45.685721
74e40274-3010-4113-87ba-ef51accdb12d	Easter 2026	2026-04-03	2026-04-19	2026	2025-10-22 08:21:45.944185
47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	May Half Term 2026	2026-05-23	2026-05-31	2026	2025-10-22 08:21:46.237174
748ccce7-9e36-4a8f-84c6-55af30e31f4c	Summer 2026	2026-07-20	2026-09-06	2026	2025-10-22 08:21:46.484386
748bccfb-8b02-4052-9084-3e1bc103a2ca	October Half Term 2026	2026-10-24	2026-11-01	2026	2025-10-22 08:21:46.715301
7d15cb43-ec57-4ad7-8670-a4700b62ae3c	Christmas 2026	2026-12-19	2027-01-04	2026	2025-10-22 08:21:46.923101
e8178bc7-bddd-4e89-bfea-8bd8cc618613	February Half Term 2027	2027-02-13	2027-02-21	2027	2025-10-22 08:21:47.221551
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scores (id, destination_id, holiday_period_id, weather_score, flight_score, beach_score, kid_facilities_score, luxury_score, final_score, calculated_at) FROM stdin;
491d0e89-f0fb-491c-8b97-089f348b940e	04570fa5-4011-4591-af21-06093e7b6297	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	90	70	68	75	2025-10-22 08:49:41.914255
abac4b95-3c41-4db3-b2bf-4dcd889946fe	351d9e16-cc72-4671-9e47-d43442749a9f	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	80	60	72	84	2025-10-22 08:50:05.922449
89ed55e4-0d35-458a-8a71-c3cb6bc45b56	ef893d9d-59a6-4714-91d3-132569a2fe06	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	50	70	58	67	2025-10-22 08:49:51.58095
c7fbb243-0a0f-4f7f-9a12-c64fa36ae89f	66ada0dc-7cb2-489c-909d-754e5e208a13	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	40	70	56	65	2025-10-22 08:49:56.925776
f0166fd8-cc36-4492-9fd6-d6b5a44e0f23	7f82c313-1e45-4860-8fa7-3cfc79e6f378	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	45	90	80	66	71	2025-10-22 10:05:23.084925
74b934ee-0204-45d5-abc4-3463600655ae	11af9dc6-389d-4827-96d4-018c2b9d244e	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	45	20	70	54	51	2025-10-22 10:04:08.479642
63a91f32-06a3-486d-9fa2-6801e7ff2de1	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	30	50	80	70	53	2025-10-22 10:05:31.481682
aa0b5058-f6ed-40bc-bdab-a73c72abc3ef	fd5455a1-8f35-40e4-84f5-5cab30de8bea	7094bace-2d1c-4e11-a708-121f3f8c6448	60	100	70	70	45	71	2025-10-22 08:46:37.860148
a97566f4-e017-423f-a7e4-3242a11637e5	cbf0915e-da75-48b2-b85a-da06992d1b0b	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	90	20	80	58	73	2025-10-22 08:49:27.940098
9b6e5cff-47a8-48d9-91c7-8f551a4b11cf	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	90	40	70	56	71	2025-10-22 08:49:23.223439
edadcf55-bcba-450a-bd44-a9fb2b02816b	c4b42ac2-2047-466a-bdc1-708a04105814	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	30	40	60	44	53	2025-10-22 10:03:29.447382
e91bb718-b366-46fe-9908-37fc590209c7	2104f32a-c752-4132-ba7c-be5c16783703	7094bace-2d1c-4e11-a708-121f3f8c6448	70	90	90	80	65	79	2025-10-22 10:21:24.037417
a492cd19-7084-4788-87b2-abced474efbd	9c2f029b-d332-44c6-9942-291b958ee22b	7094bace-2d1c-4e11-a708-121f3f8c6448	60	45	100	80	85	69	2025-10-22 08:46:43.946385
26241408-2fe4-4250-9f43-4911c7ffe54c	9c2f029b-d332-44c6-9942-291b958ee22b	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	45	100	80	85	81	2025-10-22 08:46:43.946385
1e25b3e7-42c9-4587-82a3-f596cbd2d0bb	9c2f029b-d332-44c6-9942-291b958ee22b	74e40274-3010-4113-87ba-ef51accdb12d	70	45	100	80	85	72	2025-10-22 08:46:43.946385
3c1d1817-e2bd-4893-876b-5ae843bf3f1f	9c2f029b-d332-44c6-9942-291b958ee22b	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	45	100	80	85	69	2025-10-22 08:46:43.946385
e8692a62-456c-4e1f-8532-a8bba0363410	9c2f029b-d332-44c6-9942-291b958ee22b	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	45	100	80	85	72	2025-10-22 08:46:43.946385
93668730-5ce6-4e1d-9313-1c1ded4c83b3	9c2f029b-d332-44c6-9942-291b958ee22b	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	45	100	80	85	69	2025-10-22 08:46:43.946385
5e2a2a27-ae68-4afb-bef9-b2c586c73c8a	9c2f029b-d332-44c6-9942-291b958ee22b	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	45	100	80	85	69	2025-10-22 08:46:43.946385
eb1aa619-0ac5-4836-9808-ca846929fd85	9c2f029b-d332-44c6-9942-291b958ee22b	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	45	100	80	85	81	2025-10-22 08:46:43.946385
45940a84-a93a-4fe0-8683-691840b69458	d6094b52-39aa-43bd-8fca-511fc8a9432c	7094bace-2d1c-4e11-a708-121f3f8c6448	100	60	80	90	78	82	2025-10-22 08:46:48.392564
1e4d7646-380b-4939-85ce-c57f05d30709	d6094b52-39aa-43bd-8fca-511fc8a9432c	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	60	80	90	78	82	2025-10-22 08:46:48.392564
c624fa69-e691-4d6f-9008-191014841e1f	d6094b52-39aa-43bd-8fca-511fc8a9432c	74e40274-3010-4113-87ba-ef51accdb12d	100	60	80	90	78	82	2025-10-22 08:46:48.392564
4ddc9fa3-b037-4345-8e95-43d52c626766	d6094b52-39aa-43bd-8fca-511fc8a9432c	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	60	80	90	78	76	2025-10-22 08:46:48.392564
4494316e-bea9-4b3f-b72a-dd1b7db56cbe	13a558af-9e5a-4014-9357-bc53cc10d2e8	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	30	50	90	68	63	2025-10-22 10:04:00.117013
70ab2b67-913b-463d-b8dc-0decdf17f585	cbf0915e-da75-48b2-b85a-da06992d1b0b	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	90	20	80	58	73	2025-10-22 08:49:27.940098
fd739919-2bc1-4bb1-a79a-fcf049a66b8c	71d8e9dc-afd7-42b7-8211-140c424dd010	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	40	90	60	69	2025-10-22 08:46:57.719313
662c5bdb-a6e0-444f-bf92-ea2e49095309	94eae822-75c8-4ab6-9a19-60ea2be42719	7094bace-2d1c-4e11-a708-121f3f8c6448	70	90	90	70	55	76	2025-10-22 10:21:26.973944
97907f6d-88e0-4e7d-b054-2057ec465768	94eae822-75c8-4ab6-9a19-60ea2be42719	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	90	90	70	55	70	2025-10-22 10:21:26.973944
e65319a8-07a6-46a9-ba56-d3a7e8ef4275	94eae822-75c8-4ab6-9a19-60ea2be42719	74e40274-3010-4113-87ba-ef51accdb12d	90	90	90	70	55	82	2025-10-22 10:21:26.973944
f76cb4fc-d7f5-411a-8a08-b41be02a4d38	71d8e9dc-afd7-42b7-8211-140c424dd010	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	40	90	60	72	2025-10-22 08:46:57.719313
55c283a7-7b62-4e71-9572-52cb92bcd777	71d8e9dc-afd7-42b7-8211-140c424dd010	74e40274-3010-4113-87ba-ef51accdb12d	60	100	40	90	60	72	2025-10-22 08:46:57.719313
b4f71ad2-bccd-4907-95bd-2e4a81836375	c96f9299-3c94-48d5-ac6d-e3a0f258546d	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	45	40	60	48	63	2025-10-22 10:04:17.453758
ece035e5-da33-4a3a-9269-bfb8f91c1bc0	71d8e9dc-afd7-42b7-8211-140c424dd010	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	100	40	90	60	75	2025-10-22 08:46:57.719313
24c87d84-deb4-4978-ae48-8f2e8fc2e675	94eae822-75c8-4ab6-9a19-60ea2be42719	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	90	90	70	55	85	2025-10-22 10:21:26.973944
3aae41cb-30fa-4e0a-ae7f-d0da5a1d10e0	94eae822-75c8-4ab6-9a19-60ea2be42719	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	90	70	55	85	2025-10-22 10:21:26.973944
d4672a0f-237f-4ba2-9ae0-95e2138a20ff	94eae822-75c8-4ab6-9a19-60ea2be42719	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	90	90	70	55	79	2025-10-22 10:21:26.973944
e8014e2b-f980-4b7c-9e60-4ea3b206190f	94eae822-75c8-4ab6-9a19-60ea2be42719	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	70	90	90	70	55	76	2025-10-22 10:21:26.973944
64a078ee-e693-4832-9388-38759683bb00	94eae822-75c8-4ab6-9a19-60ea2be42719	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	90	90	70	55	70	2025-10-22 10:21:26.973944
76e60dd6-1bd6-4af5-b196-b1a26fa6ef9b	d6094b52-39aa-43bd-8fca-511fc8a9432c	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	60	80	90	78	73	2025-10-22 08:46:48.392564
bfd5fae1-d360-460a-abee-05dfaa327e09	d6094b52-39aa-43bd-8fca-511fc8a9432c	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	60	80	90	78	82	2025-10-22 08:46:48.392564
231be981-5561-4c29-8dd1-81bf541965ce	d6094b52-39aa-43bd-8fca-511fc8a9432c	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	100	60	80	90	78	82	2025-10-22 08:46:48.392564
cc9f907d-8b9e-450f-9b2b-f3a71ffab590	d6094b52-39aa-43bd-8fca-511fc8a9432c	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	60	80	90	78	82	2025-10-22 08:46:48.392564
67c6ba46-5b08-4240-a45b-2725e1755448	71d8e9dc-afd7-42b7-8211-140c424dd010	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	100	40	90	60	75	2025-10-22 08:46:57.719313
3d8f1e72-9271-48c8-91dc-f8a2125c1295	71d8e9dc-afd7-42b7-8211-140c424dd010	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	40	90	60	66	2025-10-22 08:46:57.719313
013e3204-da96-4c4f-adcd-ee9b09a31fce	71d8e9dc-afd7-42b7-8211-140c424dd010	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	40	90	60	69	2025-10-22 08:46:57.719313
dabe2e19-5042-4050-8f40-a76934174998	71d8e9dc-afd7-42b7-8211-140c424dd010	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	40	90	60	72	2025-10-22 08:46:57.719313
c4fba426-5bbf-4f9e-aa14-202eeb9b3f26	07575d0e-9875-487e-89b2-9736ff43952d	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	30	80	58	63	2025-10-22 08:47:02.300544
12acad1c-0bbc-457f-bdf0-8ba38484af07	07575d0e-9875-487e-89b2-9736ff43952d	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	30	80	58	66	2025-10-22 08:47:02.300544
66f2d3de-7d27-45ca-97f6-cc78d602052e	07575d0e-9875-487e-89b2-9736ff43952d	74e40274-3010-4113-87ba-ef51accdb12d	20	90	30	80	58	54	2025-10-22 08:47:02.300544
cad33b8f-30bc-41dd-9ab1-8d3084d6df6b	07575d0e-9875-487e-89b2-9736ff43952d	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	90	30	80	58	72	2025-10-22 08:47:02.300544
4fcd8058-fead-40b0-bf4e-198f78724077	07575d0e-9875-487e-89b2-9736ff43952d	748ccce7-9e36-4a8f-84c6-55af30e31f4c	40	90	30	80	58	60	2025-10-22 08:47:02.300544
d8b6e34e-72d5-430f-ba1d-bb1a926ca5d5	cbf0915e-da75-48b2-b85a-da06992d1b0b	748bccfb-8b02-4052-9084-3e1bc103a2ca	70	90	20	80	58	67	2025-10-22 08:49:27.940098
11b26a51-a173-4a48-a8cf-e0e30adf846d	07575d0e-9875-487e-89b2-9736ff43952d	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	30	80	58	63	2025-10-22 08:47:02.300544
160f0531-1f7a-4bf7-9d32-61918bff358a	07575d0e-9875-487e-89b2-9736ff43952d	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	30	80	58	63	2025-10-22 08:47:02.300544
6ff56dd5-1290-4c1a-8d0a-0f7c683830a9	07575d0e-9875-487e-89b2-9736ff43952d	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	30	80	58	66	2025-10-22 08:47:02.300544
bb19884b-a3b9-4012-8e73-64c0b4782140	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	40	80	52	63	2025-10-22 08:47:07.543454
e0422a94-78b8-4737-978b-3d1e368be32f	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	90	40	80	52	63	2025-10-22 08:47:07.543454
5661f3d7-0b4d-47df-b5e0-231269072a81	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	74e40274-3010-4113-87ba-ef51accdb12d	60	90	40	80	52	66	2025-10-22 08:47:07.543454
0580901a-20ab-499a-916e-d27f06e92e8a	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	90	40	80	52	66	2025-10-22 08:47:07.543454
9b560aa9-2606-4213-b685-ccc079837f36	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	90	40	80	52	69	2025-10-22 08:47:07.543454
41c3e732-d903-4d7e-9ece-08bf7cdd8496	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	90	40	80	52	60	2025-10-22 08:47:07.543454
20b55158-d704-4862-82b8-fb88a5f341ed	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	40	80	52	63	2025-10-22 08:47:07.543454
504d8365-a908-4123-88fe-860acc45972a	c63dd5b1-eece-4cea-ad8a-fc03a0be9738	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	90	40	80	52	63	2025-10-22 08:47:07.543454
1d554133-2f31-4cc8-a38f-c6a7ec74def3	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	80	60	70	84	2025-10-22 08:50:10.22845
f4ec1439-3a46-42b7-a572-c94ff0f227af	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	45	70	60	50	56	2025-10-22 10:04:26.118548
66dc919b-c51d-4f22-9771-65965cd360da	351d9e16-cc72-4671-9e47-d43442749a9f	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	90	80	60	72	81	2025-10-22 08:50:05.922449
64214788-4cf2-4a9e-81c6-37e5afe2aca7	ec4c8781-45d7-4340-ab1d-074681ca2966	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	45	80	60	46	66	2025-10-22 10:04:30.498582
2dd20fc4-6411-4273-80c3-bd51ba14f9f5	7b066287-4fd7-4149-bb8b-9c59096a664d	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	20	70	48	58	2025-10-22 08:47:16.451981
028a9c51-b71c-4386-a40a-1080f1496214	13a558af-9e5a-4014-9357-bc53cc10d2e8	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	30	50	90	68	63	2025-10-22 10:04:00.117013
d8f719f7-cde8-4992-86fa-5ae7fe5acb14	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	90	80	60	70	78	2025-10-22 08:50:10.22845
aefb6a00-b58e-42e0-b41a-9d2ab5cda122	cbf0915e-da75-48b2-b85a-da06992d1b0b	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	90	20	80	58	64	2025-10-22 08:49:27.940098
4242f45f-5ccb-4e93-9993-b1c296fb4f50	78063abb-e5c2-42b0-8d3d-d24f17c28d35	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	90	80	70	62	78	2025-10-22 08:49:37.148349
a53bcdb0-9691-4b91-85db-73ce993a2b68	95691984-3e58-4dec-9640-01c57ab9ac8a	7094bace-2d1c-4e11-a708-121f3f8c6448	80	100	30	60	45	69	2025-10-22 08:47:21.440038
b48215f1-b20b-47fa-9224-cde4ef86ae78	95691984-3e58-4dec-9640-01c57ab9ac8a	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	100	30	60	45	75	2025-10-22 08:47:21.440038
86d79d06-d7b5-4ec0-9571-5a09bcf6c7a5	95691984-3e58-4dec-9640-01c57ab9ac8a	74e40274-3010-4113-87ba-ef51accdb12d	90	100	30	60	45	72	2025-10-22 08:47:21.440038
38c47137-492c-412b-b059-a7a87cdbca5a	95691984-3e58-4dec-9640-01c57ab9ac8a	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	100	30	60	45	72	2025-10-22 08:47:21.440038
9066de66-ad98-4897-aad2-18acf4df2af0	95691984-3e58-4dec-9640-01c57ab9ac8a	748ccce7-9e36-4a8f-84c6-55af30e31f4c	40	100	30	60	45	57	2025-10-22 08:47:21.440038
739806c8-a91f-4da6-a457-0a0ffd8d9fb5	351d9e16-cc72-4671-9e47-d43442749a9f	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	90	80	60	72	78	2025-10-22 08:50:05.922449
3c2b8960-c2f2-4e24-b728-d5cf6feaaf92	d3a9895e-21c2-4aa7-92e5-3a04aee72014	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	75	90	70	62	82	2025-10-22 08:50:14.52398
dda71f7e-67b1-4591-90d6-46794037c8e1	95691984-3e58-4dec-9640-01c57ab9ac8a	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	100	30	60	45	72	2025-10-22 08:47:21.440038
193c7626-513b-4b4f-a3f8-74fa5621f80e	351d9e16-cc72-4671-9e47-d43442749a9f	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	80	60	72	72	2025-10-22 08:50:05.922449
34ac2f00-b87b-45d5-9cae-39ffb4a3cae2	95691984-3e58-4dec-9640-01c57ab9ac8a	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	100	30	60	45	69	2025-10-22 08:47:21.440038
604059e3-6606-4a9e-b7a8-493d084d9fcf	280ef307-84b2-4a03-b406-90255c159d25	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	30	70	52	63	2025-10-22 08:47:26.375032
38dd89de-1260-48b9-bb6c-f6f6bfcd0aca	280ef307-84b2-4a03-b406-90255c159d25	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	30	70	52	66	2025-10-22 08:47:26.375032
8cd38156-027c-4dd5-95b5-3d0a6471243a	280ef307-84b2-4a03-b406-90255c159d25	74e40274-3010-4113-87ba-ef51accdb12d	50	100	30	70	52	63	2025-10-22 08:47:26.375032
bfcf4c82-6e24-45da-9979-76f748c31d2e	280ef307-84b2-4a03-b406-90255c159d25	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	30	70	52	72	2025-10-22 08:47:26.375032
ac8b8228-11fe-4fe7-9038-f234c75ca70a	280ef307-84b2-4a03-b406-90255c159d25	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	100	30	70	52	66	2025-10-22 08:47:26.375032
1285117a-273d-4497-a990-e6d60b7ed495	280ef307-84b2-4a03-b406-90255c159d25	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	30	70	52	60	2025-10-22 08:47:26.375032
a7897467-0e98-4289-bcd5-38cc4d5b50c8	280ef307-84b2-4a03-b406-90255c159d25	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	30	70	52	63	2025-10-22 08:47:26.375032
b89ab5bc-c483-4469-9f13-4a3fc579129e	3a95aac2-b3ce-4810-af20-37bab52b15df	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	40	70	48	61	2025-10-22 08:47:30.809473
19ab2a3f-faf0-4496-a48e-b987636174f9	3a95aac2-b3ce-4810-af20-37bab52b15df	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	40	70	48	67	2025-10-22 08:47:30.809473
7118d836-4ae3-4e63-b270-d619f0a4f06e	3a95aac2-b3ce-4810-af20-37bab52b15df	74e40274-3010-4113-87ba-ef51accdb12d	50	100	40	70	48	64	2025-10-22 08:47:30.809473
16048d8e-a05b-4890-b931-78584d33c9a5	3a95aac2-b3ce-4810-af20-37bab52b15df	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	40	70	48	73	2025-10-22 08:47:30.809473
a6539bf3-35f3-4f4e-98eb-d8d54dea1b9e	3a95aac2-b3ce-4810-af20-37bab52b15df	748ccce7-9e36-4a8f-84c6-55af30e31f4c	40	100	40	70	48	61	2025-10-22 08:47:30.809473
9d9c6c54-3b30-47e5-be3e-514eb5180f3a	3a95aac2-b3ce-4810-af20-37bab52b15df	748bccfb-8b02-4052-9084-3e1bc103a2ca	20	100	40	70	48	55	2025-10-22 08:47:30.809473
0b62933f-b468-455f-a9f1-7df413353813	3a95aac2-b3ce-4810-af20-37bab52b15df	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	40	70	48	61	2025-10-22 08:47:30.809473
1ee98502-cc2a-4be6-9353-bb4edae85066	3a95aac2-b3ce-4810-af20-37bab52b15df	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	40	70	48	67	2025-10-22 08:47:30.809473
cde153b7-0b32-435f-a4f8-b0b6bc0ee04d	d3a9895e-21c2-4aa7-92e5-3a04aee72014	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	75	90	70	62	76	2025-10-22 08:50:14.52398
e8938322-17d3-4bfe-a152-ac2a3a3b71c6	d3a9895e-21c2-4aa7-92e5-3a04aee72014	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	75	90	70	62	70	2025-10-22 08:50:14.52398
b183cbb7-ec4c-4c2e-8f4a-4a956421c910	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	30	80	58	62	2025-10-22 08:47:35.425079
e3ad9dbb-e33f-4622-b00d-d24d87a68475	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	30	80	58	68	2025-10-22 08:47:35.425079
b4457744-ad6f-4cb3-ab04-a58d209bd5ce	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	74e40274-3010-4113-87ba-ef51accdb12d	50	100	30	80	58	65	2025-10-22 08:47:35.425079
c226bc8f-b067-4abd-b5bc-65eebd640dd6	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	100	30	80	58	71	2025-10-22 08:47:35.425079
a0140956-6ec1-41e2-876e-500d494d9c83	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	100	30	80	58	71	2025-10-22 08:47:35.425079
99ca2bc1-3821-40c3-9b1f-38f3997e6378	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	748bccfb-8b02-4052-9084-3e1bc103a2ca	20	100	30	80	58	56	2025-10-22 08:47:35.425079
3fc8283c-a58f-4c37-b2d2-fda7a6624c5c	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	30	80	58	62	2025-10-22 08:47:35.425079
24c460ca-d397-4c11-98bc-28321377850a	05abad90-6ae1-49df-84c2-1dfae020140d	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	20	70	55	62	2025-10-22 08:47:40.184582
3e3a8142-4f96-4ebd-a209-60d4a5c1e773	05abad90-6ae1-49df-84c2-1dfae020140d	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	20	70	55	65	2025-10-22 08:47:40.184582
4d16d423-8e46-4852-92aa-1517f8ab727f	05abad90-6ae1-49df-84c2-1dfae020140d	74e40274-3010-4113-87ba-ef51accdb12d	50	100	20	70	55	62	2025-10-22 08:47:40.184582
02fccd0b-6e52-478d-bd5c-243095d9eed4	05abad90-6ae1-49df-84c2-1dfae020140d	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	100	20	70	55	68	2025-10-22 08:47:40.184582
928821a7-fd65-49d6-8022-535b22425513	05abad90-6ae1-49df-84c2-1dfae020140d	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	100	20	70	55	71	2025-10-22 08:47:40.184582
3d4d1c74-1a29-425b-86f0-18b5b80ebf00	05abad90-6ae1-49df-84c2-1dfae020140d	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	20	70	55	59	2025-10-22 08:47:40.184582
ea654eb6-8fd2-4797-b1b1-3a816ebee2f3	05abad90-6ae1-49df-84c2-1dfae020140d	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	20	70	55	62	2025-10-22 08:47:40.184582
ab2a14d5-8b32-4a5d-b65e-5fa6c622ecb1	05abad90-6ae1-49df-84c2-1dfae020140d	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	20	70	55	65	2025-10-22 08:47:40.184582
50ab82d1-d45c-409b-9a71-838dc340cc14	ea431f38-c1da-433b-ba90-51bd7fee1a3e	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	30	80	62	66	2025-10-22 08:47:45.180547
439e1a17-bb0a-44e3-8433-d7c50a91e9a7	ea431f38-c1da-433b-ba90-51bd7fee1a3e	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	30	80	62	69	2025-10-22 08:47:45.180547
19fe2e94-117d-4689-a170-496996ab25b6	ea431f38-c1da-433b-ba90-51bd7fee1a3e	74e40274-3010-4113-87ba-ef51accdb12d	50	100	30	80	62	66	2025-10-22 08:47:45.180547
14232fe6-f86b-4111-83d2-eaeeff781662	ea431f38-c1da-433b-ba90-51bd7fee1a3e	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	100	30	80	62	72	2025-10-22 08:47:45.180547
ff9edee0-fb26-4aef-b272-caffdc2ab994	ea431f38-c1da-433b-ba90-51bd7fee1a3e	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	100	30	80	62	78	2025-10-22 08:47:45.180547
d5c550d2-ed76-4608-8442-94f54ac3f1b8	ea431f38-c1da-433b-ba90-51bd7fee1a3e	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	30	80	62	63	2025-10-22 08:47:45.180547
29a2dae4-74c8-429e-8465-7337387e7e5e	ea431f38-c1da-433b-ba90-51bd7fee1a3e	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	30	80	62	66	2025-10-22 08:47:45.180547
7e1a0ac9-516e-4fc2-8fee-b8feb67d5999	ae4bfff9-b173-44c7-b911-07148be73b72	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	80	70	64	72	2025-10-22 08:47:54.215963
5c5c88f7-d5fb-4945-8353-187d6782a6b6	1137f046-8540-4bac-9bee-86851f1484ab	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	20	70	56	62	2025-10-22 08:47:49.791373
e31d59b9-5143-4c03-b677-1c8204ba45c1	1137f046-8540-4bac-9bee-86851f1484ab	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	20	70	56	65	2025-10-22 08:47:49.791373
601a6254-98c9-47a1-bbac-00be5c7fae3e	1137f046-8540-4bac-9bee-86851f1484ab	74e40274-3010-4113-87ba-ef51accdb12d	70	100	20	70	56	68	2025-10-22 08:47:49.791373
bb4fdfbd-cb9b-456d-a5c3-64a86b300160	1137f046-8540-4bac-9bee-86851f1484ab	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	20	70	56	71	2025-10-22 08:47:49.791373
292b3a91-fea6-40a5-a10c-428730a6bd11	1137f046-8540-4bac-9bee-86851f1484ab	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	100	20	70	56	74	2025-10-22 08:47:49.791373
73b59358-eae5-4e8e-a685-c9d5cc6182f1	1137f046-8540-4bac-9bee-86851f1484ab	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	100	20	70	56	65	2025-10-22 08:47:49.791373
a16872c0-9979-4fc2-92e1-4c92b93c4e51	ae4bfff9-b173-44c7-b911-07148be73b72	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	80	70	64	75	2025-10-22 08:47:54.215963
a9b5d890-9bb8-4c05-a0db-29d184bf496b	1137f046-8540-4bac-9bee-86851f1484ab	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	20	70	56	62	2025-10-22 08:47:49.791373
28c3cfe0-f3ff-4de7-bb5f-209688a03838	1137f046-8540-4bac-9bee-86851f1484ab	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	20	70	56	65	2025-10-22 08:47:49.791373
343bfb54-b510-4b33-822c-45614344e092	ae4bfff9-b173-44c7-b911-07148be73b72	74e40274-3010-4113-87ba-ef51accdb12d	80	100	80	70	64	81	2025-10-22 08:47:54.215963
b5d1909f-1c3e-464f-9f3a-bc08d15220fc	9415905d-81c3-4577-b19a-8e60bd2459d8	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	75	90	80	56	71	2025-10-22 08:50:30.259232
d9727b72-6f80-488e-9e1f-4d9c77e2115e	f5ba86d5-4e8b-4abe-9feb-add2d374d219	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	40	70	48	64	2025-10-22 08:50:23.663104
1b414e92-5f2a-4fe1-8089-c54729f5cc13	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	90	80	60	70	78	2025-10-22 08:50:10.22845
44f6f8e4-aa37-4ef2-b7e7-0084c9db2031	13a558af-9e5a-4014-9357-bc53cc10d2e8	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	30	50	90	68	63	2025-10-22 10:04:00.117013
782b4cb4-0945-43ca-a38d-c84f465ba4ad	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	90	80	70	58	69	2025-10-22 08:50:19.099509
fde8575d-f5b9-435e-8cd2-da4ee43d5dc1	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	30	70	58	61	2025-10-22 08:47:59.640189
7bd6b3e9-5095-4e1b-a57d-0364c49df002	fe29e631-c438-4178-978f-6ed4e12c4b49	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	100	40	70	46	63	2025-10-22 08:50:40.782556
e67a61f7-9766-4ebb-be8c-4ca49e3e5d0e	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	80	60	70	72	2025-10-22 08:50:10.22845
fcf9ccaf-3a54-43fe-bbe3-42b30533b9ed	54907426-a944-4986-8049-d99d2ee2a65f	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	30	30	70	58	46	2025-10-22 10:04:04.30077
300b0927-01c1-47f6-b1ca-97eaedb71baa	d3a9895e-21c2-4aa7-92e5-3a04aee72014	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	75	90	70	62	70	2025-10-22 08:50:14.52398
7a2a3d34-eb93-4016-a287-4e2ab22280f0	538f180b-716f-4539-96e4-e47d79a02d86	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	20	80	60	64	2025-10-22 08:48:04.230477
e8df2efa-78ed-4c67-a6e5-1ec68f7ecdce	538f180b-716f-4539-96e4-e47d79a02d86	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	100	20	80	60	64	2025-10-22 08:48:04.230477
273ad60a-cb8a-476a-ab34-9af343285cef	538f180b-716f-4539-96e4-e47d79a02d86	74e40274-3010-4113-87ba-ef51accdb12d	40	100	20	80	60	61	2025-10-22 08:48:04.230477
a8114ffb-e7d1-442e-ac63-aa93f98495ed	538f180b-716f-4539-96e4-e47d79a02d86	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	100	20	80	60	67	2025-10-22 08:48:04.230477
b2633178-93e5-4367-be30-70ca5e230a27	538f180b-716f-4539-96e4-e47d79a02d86	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	100	20	80	60	76	2025-10-22 08:48:04.230477
c2f4f663-b4c4-4e03-82c6-3aaeedfdc8b5	f1af3688-db90-4f1b-a893-ceb12e4abebf	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	20	80	54	63	2025-10-22 08:48:09.010286
f389d302-dd61-4a89-b55f-2774ea002fd8	f1af3688-db90-4f1b-a893-ceb12e4abebf	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	20	80	54	66	2025-10-22 08:48:09.010286
edd65824-f0c3-46d7-96e2-647edbd88388	f1af3688-db90-4f1b-a893-ceb12e4abebf	74e40274-3010-4113-87ba-ef51accdb12d	60	100	20	80	54	66	2025-10-22 08:48:09.010286
7a07acf1-d82f-4022-b7d5-f566c0945f5d	f1af3688-db90-4f1b-a893-ceb12e4abebf	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	20	80	54	72	2025-10-22 08:48:09.010286
8f24ac53-d7f4-4704-9d86-57f8ea015015	f1af3688-db90-4f1b-a893-ceb12e4abebf	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	100	20	80	54	75	2025-10-22 08:48:09.010286
8616f3bd-429f-42e0-8bc7-7185b9b43ca2	f1af3688-db90-4f1b-a893-ceb12e4abebf	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	100	20	80	54	63	2025-10-22 08:48:09.010286
d6ce880b-e6cd-43c2-b2ac-94287ff6e772	f1af3688-db90-4f1b-a893-ceb12e4abebf	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	20	80	54	63	2025-10-22 08:48:09.010286
c94429a3-f98c-4139-9da3-b635a43ade39	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	15	90	90	72	69	2025-10-22 10:05:57.032088
605d1e3d-426a-4579-b08e-92999b60b09b	034e97c9-6c2e-4e8d-a2f6-045add3f3533	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	30	80	56	62	2025-10-22 08:48:13.723114
3993f011-e0b3-4c10-9e0e-a41c4058bc0c	034e97c9-6c2e-4e8d-a2f6-045add3f3533	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	100	30	80	56	65	2025-10-22 08:48:13.723114
dd7b7c73-343a-4fe9-8f60-4c4c23ee0cd2	034e97c9-6c2e-4e8d-a2f6-045add3f3533	74e40274-3010-4113-87ba-ef51accdb12d	50	100	30	80	56	65	2025-10-22 08:48:13.723114
cdbcaf6c-7302-4afe-b484-9455f116bc8e	034e97c9-6c2e-4e8d-a2f6-045add3f3533	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	30	80	56	74	2025-10-22 08:48:13.723114
46549c71-3cb4-4085-a94b-1f935f983d99	034e97c9-6c2e-4e8d-a2f6-045add3f3533	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	100	30	80	56	74	2025-10-22 08:48:13.723114
8e7eea08-b29c-4ba0-a81d-ddc93d3d1c7b	034e97c9-6c2e-4e8d-a2f6-045add3f3533	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	30	80	56	62	2025-10-22 08:48:13.723114
b096b38f-2f24-4300-a13f-c0db858d5ad1	034e97c9-6c2e-4e8d-a2f6-045add3f3533	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	30	80	56	62	2025-10-22 08:48:13.723114
205cffcf-781b-4eaf-98b6-63764546f0f5	968d1662-490e-408e-941d-d03e11ebc507	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	20	80	65	62	2025-10-22 08:48:18.158765
4817c61e-c7d7-443e-969e-7c45976f214b	968d1662-490e-408e-941d-d03e11ebc507	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	20	80	65	65	2025-10-22 08:48:18.158765
67162e4b-3844-44ac-9941-a9064fc50935	968d1662-490e-408e-941d-d03e11ebc507	74e40274-3010-4113-87ba-ef51accdb12d	40	90	20	80	65	59	2025-10-22 08:48:18.158765
27ac465c-afa3-40ab-8f88-a58d9c3855ab	968d1662-490e-408e-941d-d03e11ebc507	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	20	80	65	68	2025-10-22 08:48:18.158765
b23391f8-7015-4df7-b5bb-11e13e1873fb	968d1662-490e-408e-941d-d03e11ebc507	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	20	80	65	77	2025-10-22 08:48:18.158765
84840341-86d5-4d06-9412-d3f66e2761f4	968d1662-490e-408e-941d-d03e11ebc507	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	20	80	65	62	2025-10-22 08:48:18.158765
ecdbae92-4bd9-4108-bc1f-985d6fd133c9	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	15	90	90	72	66	2025-10-22 10:05:57.032088
a59011c4-48c6-4a52-b593-ba4fa4133e22	968d1662-490e-408e-941d-d03e11ebc507	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	20	80	65	62	2025-10-22 08:48:18.158765
a000f850-7a4b-4e42-89d7-61c92269cd87	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	15	90	90	72	66	2025-10-22 10:05:57.032088
d2256649-d46b-4da6-81b6-9633adb56ff0	7862827c-77e1-4e97-a2d6-61adacef3cb0	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	20	70	62	60	2025-10-22 08:48:22.836867
bc823bf2-f90a-448a-8353-7082f50fdeed	7862827c-77e1-4e97-a2d6-61adacef3cb0	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	100	20	70	62	63	2025-10-22 08:48:22.836867
376e48fa-fdd6-4019-b57a-0e45d343eba6	7862827c-77e1-4e97-a2d6-61adacef3cb0	74e40274-3010-4113-87ba-ef51accdb12d	20	100	20	70	62	54	2025-10-22 08:48:22.836867
cf27fb33-7731-46c2-8c40-4d20670a710f	7862827c-77e1-4e97-a2d6-61adacef3cb0	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	40	100	20	70	62	60	2025-10-22 08:48:22.836867
eabd2203-6a94-4ed9-bf7f-74c5638ac40e	7862827c-77e1-4e97-a2d6-61adacef3cb0	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	100	20	70	62	75	2025-10-22 08:48:22.836867
071f62ad-3a70-4433-8dc2-18289dc64af1	7862827c-77e1-4e97-a2d6-61adacef3cb0	748bccfb-8b02-4052-9084-3e1bc103a2ca	20	100	20	70	62	54	2025-10-22 08:48:22.836867
02998431-94e1-4b02-ac84-e3cfe00d8079	7862827c-77e1-4e97-a2d6-61adacef3cb0	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	20	70	62	60	2025-10-22 08:48:22.836867
a29c494b-d301-47dc-af15-5acf594e76c2	7862827c-77e1-4e97-a2d6-61adacef3cb0	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	100	20	70	62	63	2025-10-22 08:48:22.836867
ac7d88eb-4a23-4bbf-b1bf-518166f07c45	f5409693-946e-47c5-8f04-0babe818f750	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	20	70	52	61	2025-10-22 08:48:27.540207
d097f996-2d09-460c-aaa5-54a3378ac253	f5409693-946e-47c5-8f04-0babe818f750	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	20	70	52	64	2025-10-22 08:48:27.540207
324adbee-2a9a-42f6-a87a-1dd111ebb5aa	f5409693-946e-47c5-8f04-0babe818f750	74e40274-3010-4113-87ba-ef51accdb12d	50	100	20	70	52	61	2025-10-22 08:48:27.540207
bc0ec048-ed59-499d-9acb-e0df85099f7c	f5409693-946e-47c5-8f04-0babe818f750	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	100	20	70	52	73	2025-10-22 08:48:27.540207
fed63f09-85ff-4359-b9cc-353ffcac7e70	f5409693-946e-47c5-8f04-0babe818f750	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	100	20	70	52	76	2025-10-22 08:48:27.540207
070eea7a-d717-4bb6-83a1-357983a2b372	f5409693-946e-47c5-8f04-0babe818f750	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	100	20	70	52	61	2025-10-22 08:48:27.540207
ee79ed58-055c-4b2e-a176-adf7d9f4a293	f5409693-946e-47c5-8f04-0babe818f750	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	20	70	52	61	2025-10-22 08:48:27.540207
48b2449d-a1bc-40c9-ad86-6e66901826dc	4995c976-3d3a-441a-9521-2d21b9e6d231	7094bace-2d1c-4e11-a708-121f3f8c6448	40	90	20	70	48	55	2025-10-22 08:48:32.090922
1ab5a6f3-d114-44a0-bf51-4b83d83e7302	4995c976-3d3a-441a-9521-2d21b9e6d231	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	20	70	48	61	2025-10-22 08:48:32.090922
fd6fd381-256b-4532-b065-750aee35b8c3	4995c976-3d3a-441a-9521-2d21b9e6d231	74e40274-3010-4113-87ba-ef51accdb12d	50	90	20	70	48	58	2025-10-22 08:48:32.090922
76e0e245-01e1-4df2-935a-07de0ce384fd	4995c976-3d3a-441a-9521-2d21b9e6d231	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	20	70	48	64	2025-10-22 08:48:32.090922
898847de-e24d-4f7c-942b-ca73f0193728	4995c976-3d3a-441a-9521-2d21b9e6d231	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	90	20	70	48	70	2025-10-22 08:48:32.090922
303eaeee-1328-4caf-a9bb-a1afe1094079	4995c976-3d3a-441a-9521-2d21b9e6d231	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	20	70	48	58	2025-10-22 08:48:32.090922
8846e311-1d53-41f3-abde-d0005d26cb16	4995c976-3d3a-441a-9521-2d21b9e6d231	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	90	20	70	48	55	2025-10-22 08:48:32.090922
70c118d9-f7f9-4b31-9cb0-b8e5b38c3640	78486986-b3e9-49d4-b1e4-9113a38b21ed	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	20	60	45	56	2025-10-22 08:48:36.649351
61bd7b1f-bb03-43d4-b4ea-e53c09927282	4995c976-3d3a-441a-9521-2d21b9e6d231	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	20	70	48	61	2025-10-22 08:48:32.090922
9928ae10-2386-4475-9432-39bd082b3b84	78486986-b3e9-49d4-b1e4-9113a38b21ed	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	90	20	60	45	56	2025-10-22 08:48:36.649351
fd302d4b-af0f-4391-8ed7-dc18d1b905d9	78486986-b3e9-49d4-b1e4-9113a38b21ed	74e40274-3010-4113-87ba-ef51accdb12d	50	90	20	60	45	56	2025-10-22 08:48:36.649351
bc13e85d-0d96-49aa-b61f-e557cfc739ec	78486986-b3e9-49d4-b1e4-9113a38b21ed	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	20	60	45	62	2025-10-22 08:48:36.649351
54ae89fb-e254-44a0-84b4-053131bebe96	78486986-b3e9-49d4-b1e4-9113a38b21ed	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	90	20	60	45	65	2025-10-22 08:48:36.649351
77dfdc51-4efe-4ba8-9113-5c787e7fa0a5	78486986-b3e9-49d4-b1e4-9113a38b21ed	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	20	60	45	56	2025-10-22 08:48:36.649351
b1d815ae-489a-45e0-a512-b2bdb829aee7	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	20	70	52	64	2025-10-22 08:50:49.791518
fea2b14d-774c-4c37-b53b-0153409e0625	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	7094bace-2d1c-4e11-a708-121f3f8c6448	80	90	40	70	56	71	2025-10-22 08:49:23.223439
3eafdb07-3bae-4640-8613-775ffc3e1081	f392bd89-c29f-44bb-86d5-72ab0afb2f31	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	90	80	60	54	79	2025-10-22 10:04:39.178727
4bdde485-3a8c-4c86-8e12-3de9fd00cbb7	5a7f78e6-08af-46ee-8b5c-7c977948c82f	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	60	80	90	76	82	2025-10-22 10:21:29.730571
9ae965af-7650-41c4-964a-344822e2d33d	a42651c6-4071-492e-8c3b-f271e2142216	74e40274-3010-4113-87ba-ef51accdb12d	90	60	70	80	74	76	2025-10-22 10:01:28.523312
b27188f1-ea73-481f-8e79-2c3b8636f521	a42651c6-4071-492e-8c3b-f271e2142216	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	60	70	80	74	67	2025-10-22 10:01:28.523312
805b4e15-aca7-4e1d-aa99-58a7aaec18fb	a42651c6-4071-492e-8c3b-f271e2142216	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	60	70	80	74	67	2025-10-22 10:01:28.523312
5e45affc-f127-4955-8f47-3bfa31eef6e6	58006810-48b3-4b09-9e4a-cce139f122d3	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	20	60	42	56	2025-10-22 08:48:41.169152
52e4a8de-8886-4663-b2cb-7965c262b18c	58006810-48b3-4b09-9e4a-cce139f122d3	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	90	20	60	42	56	2025-10-22 08:48:41.169152
45cad42a-2745-4b7b-bec0-20ecf4bd52ce	26ea7651-8b3a-4860-9615-cfd2daa5da7e	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	15	90	90	64	67	2025-10-22 10:06:05.536165
08040cf8-5351-453e-bffd-760369862369	c41bab8a-909c-46b3-9c7f-daba35f04b3e	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	40	80	68	65	2025-10-22 08:48:45.583362
e7f95418-ceb3-4d40-b484-2671d42f8403	c41bab8a-909c-46b3-9c7f-daba35f04b3e	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	40	80	68	71	2025-10-22 08:48:45.583362
148670f4-e512-46ab-9829-00ae8ebb60e3	c41bab8a-909c-46b3-9c7f-daba35f04b3e	74e40274-3010-4113-87ba-ef51accdb12d	20	100	40	80	68	59	2025-10-22 08:48:45.583362
c978c7a5-6643-4c7d-9f70-4e3ac7409715	c41bab8a-909c-46b3-9c7f-daba35f04b3e	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	100	40	80	68	71	2025-10-22 08:48:45.583362
90d12632-825c-449c-9440-71c8410fee95	c41bab8a-909c-46b3-9c7f-daba35f04b3e	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	100	40	80	68	77	2025-10-22 08:48:45.583362
470480dd-f399-4c17-85ab-424de2745664	bb32438a-cdd2-4334-b47e-76fa8f05fa02	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	75	30	60	48	66	2025-10-22 10:04:43.510203
c23bacfb-b1ec-4b30-8566-e203ed2f5bd9	c41bab8a-909c-46b3-9c7f-daba35f04b3e	748bccfb-8b02-4052-9084-3e1bc103a2ca	20	100	40	80	68	59	2025-10-22 08:48:45.583362
410594aa-a255-4a79-9c56-288151df4683	dddcc5d6-25ef-46c9-9ac5-47d86806e102	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	50	80	70	67	2025-10-22 08:48:50.013503
c2e67924-11ac-4e7e-badc-f0ea1e2bbda8	dddcc5d6-25ef-46c9-9ac5-47d86806e102	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	50	80	70	73	2025-10-22 08:48:50.013503
79749539-687b-402d-8c59-847190416ddd	dddcc5d6-25ef-46c9-9ac5-47d86806e102	74e40274-3010-4113-87ba-ef51accdb12d	40	100	50	80	70	67	2025-10-22 08:48:50.013503
ff54fa06-3d9b-4c48-ba1a-48dcb2a25591	dddcc5d6-25ef-46c9-9ac5-47d86806e102	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	100	50	80	70	76	2025-10-22 08:48:50.013503
2adc0237-270a-4206-ab99-0a67023ac8de	dddcc5d6-25ef-46c9-9ac5-47d86806e102	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	100	50	80	70	79	2025-10-22 08:48:50.013503
9f5c9d8c-81d4-49cd-a0fa-554326ee9d84	a42651c6-4071-492e-8c3b-f271e2142216	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	60	70	80	74	73	2025-10-22 10:01:28.523312
7e8cb9ec-0788-40a1-a4cb-48e92035479f	dddcc5d6-25ef-46c9-9ac5-47d86806e102	748bccfb-8b02-4052-9084-3e1bc103a2ca	20	100	50	80	70	61	2025-10-22 08:48:50.013503
3ba755c4-eb81-49bd-956b-e18dc68e3b0d	dddcc5d6-25ef-46c9-9ac5-47d86806e102	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	50	80	70	67	2025-10-22 08:48:50.013503
a63de4ca-4430-4091-a43c-74f282414fdb	b35896d8-a00b-4d6b-be31-215b59fae616	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	30	70	58	64	2025-10-22 08:48:54.651935
08ea3d94-0ab6-4789-adac-0e0a477ab3bc	b35896d8-a00b-4d6b-be31-215b59fae616	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	30	70	58	67	2025-10-22 08:48:54.651935
e307efef-dc39-4022-9c19-3de86a4f3d2c	b35896d8-a00b-4d6b-be31-215b59fae616	74e40274-3010-4113-87ba-ef51accdb12d	70	100	30	70	58	70	2025-10-22 08:48:54.651935
2b774f2d-8b09-46a3-86eb-c3e1af8cfeb5	b35896d8-a00b-4d6b-be31-215b59fae616	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	100	30	70	58	64	2025-10-22 08:48:54.651935
12260a96-d67a-48a9-a0cf-df3eb3949db6	b35896d8-a00b-4d6b-be31-215b59fae616	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	100	30	70	58	73	2025-10-22 08:48:54.651935
dace724b-ebdd-4be6-82d9-fdbadf296121	b35896d8-a00b-4d6b-be31-215b59fae616	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	30	70	58	61	2025-10-22 08:48:54.651935
5a3ed0b7-671b-4e79-a16a-9f14ca196ebb	b35896d8-a00b-4d6b-be31-215b59fae616	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	30	70	58	64	2025-10-22 08:48:54.651935
18139b5f-f4d2-4557-a831-8e74c0473364	f0c15c68-5571-4643-88ca-b66d92034063	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	40	70	60	66	2025-10-22 08:48:59.171186
5996c2f9-22a9-41d7-a531-fae1344b3f18	f0c15c68-5571-4643-88ca-b66d92034063	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	40	70	60	69	2025-10-22 08:48:59.171186
fe278f5d-2ee3-4e97-9d57-dedcd9ccae81	f0c15c68-5571-4643-88ca-b66d92034063	74e40274-3010-4113-87ba-ef51accdb12d	70	100	40	70	60	72	2025-10-22 08:48:59.171186
85f10202-987b-4f84-a75a-eecdf9b63075	f0c15c68-5571-4643-88ca-b66d92034063	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	100	40	70	60	66	2025-10-22 08:48:59.171186
f94b3ab5-0e09-43cd-a14c-c546b6b0a7d9	f0c15c68-5571-4643-88ca-b66d92034063	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	100	40	70	60	78	2025-10-22 08:48:59.171186
f3595ede-e77c-4515-8b7c-4e863763be52	f0c15c68-5571-4643-88ca-b66d92034063	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	100	40	70	60	69	2025-10-22 08:48:59.171186
47bd6f24-8530-49cb-a29d-a7a7988eb5ce	f0c15c68-5571-4643-88ca-b66d92034063	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	40	70	60	66	2025-10-22 08:48:59.171186
ba45e1d4-1ec5-4c4b-bb03-60350b2b253a	f0c15c68-5571-4643-88ca-b66d92034063	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	40	70	60	69	2025-10-22 08:48:59.171186
ec592f14-56a6-4c71-8c89-ccf472e1c99e	2b6552a5-7838-4bbf-aa5a-503f34ef8637	7094bace-2d1c-4e11-a708-121f3f8c6448	40	90	30	70	62	59	2025-10-22 08:49:03.998693
17cc4200-55ab-4a4d-8281-e42ed9154c7b	2b6552a5-7838-4bbf-aa5a-503f34ef8637	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	30	70	62	65	2025-10-22 08:49:03.998693
0bf228eb-3b11-4d37-a4b3-a8580357472c	2b6552a5-7838-4bbf-aa5a-503f34ef8637	74e40274-3010-4113-87ba-ef51accdb12d	70	90	30	70	62	68	2025-10-22 08:49:03.998693
99cae1f3-cc27-4cf5-808d-bdbefb24aacc	2b6552a5-7838-4bbf-aa5a-503f34ef8637	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	30	70	62	68	2025-10-22 08:49:03.998693
4e13eca7-c45b-4414-85d7-4d781b129aff	2b6552a5-7838-4bbf-aa5a-503f34ef8637	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	90	30	70	62	74	2025-10-22 08:49:03.998693
a6880d62-09cb-4c46-adf6-a71f4ee4dc18	2b6552a5-7838-4bbf-aa5a-503f34ef8637	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	30	70	62	62	2025-10-22 08:49:03.998693
cc3b1a47-3dc6-49e7-88bd-a4d93167df5f	2b6552a5-7838-4bbf-aa5a-503f34ef8637	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	90	30	70	62	59	2025-10-22 08:49:03.998693
d51f2e46-eb86-44ee-8d44-6cf29b98a820	bd63a7eb-7275-4976-9597-d15f6ff96c1b	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	30	80	64	64	2025-10-22 08:49:08.698007
57277317-9c4f-4f35-9fdd-bc4d92e74a62	bd63a7eb-7275-4976-9597-d15f6ff96c1b	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	30	80	64	67	2025-10-22 08:49:08.698007
c0cf31d0-73e8-488a-89c6-658dd9eb89dc	bd63a7eb-7275-4976-9597-d15f6ff96c1b	74e40274-3010-4113-87ba-ef51accdb12d	70	90	30	80	64	70	2025-10-22 08:49:08.698007
72fb4256-1917-4044-bb7b-8afeba824c4d	bd63a7eb-7275-4976-9597-d15f6ff96c1b	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	30	80	64	70	2025-10-22 08:49:08.698007
f751b449-02a3-4b54-b63a-96c7fcf4d25b	bd63a7eb-7275-4976-9597-d15f6ff96c1b	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	90	30	80	64	76	2025-10-22 08:49:08.698007
de2e2e52-cf68-4c40-b977-245f8aaa94ad	bd63a7eb-7275-4976-9597-d15f6ff96c1b	748bccfb-8b02-4052-9084-3e1bc103a2ca	70	90	30	80	64	70	2025-10-22 08:49:08.698007
3753101b-8201-4b19-a8da-68344ba4a39d	bd63a7eb-7275-4976-9597-d15f6ff96c1b	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	30	80	64	64	2025-10-22 08:49:08.698007
4c810c2f-5636-4315-a403-7bba61cc5d51	bd63a7eb-7275-4976-9597-d15f6ff96c1b	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	30	80	64	67	2025-10-22 08:49:08.698007
f31e2544-dbdb-488f-a192-8f07e873256d	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	7094bace-2d1c-4e11-a708-121f3f8c6448	40	90	60	60	52	60	2025-10-22 08:49:13.728394
3346c7b1-3b22-49f8-8442-f39e1d3ab055	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	60	60	52	66	2025-10-22 08:49:13.728394
aff4c7d5-e9d1-44e7-9139-0b2ba5c52972	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	74e40274-3010-4113-87ba-ef51accdb12d	60	90	60	60	52	66	2025-10-22 08:49:13.728394
169a9e0c-d925-414b-a753-ea5cdce0b20f	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	90	60	60	52	63	2025-10-22 08:49:13.728394
ac7568a2-1677-4b95-8e05-d05204dd2106	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	60	60	52	78	2025-10-22 08:49:13.728394
cb7b36d5-98a6-4d53-8d81-291824ed8e63	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	748bccfb-8b02-4052-9084-3e1bc103a2ca	70	90	60	60	52	69	2025-10-22 08:49:13.728394
3225c126-9ad7-468e-986a-e1994a49116c	def70aeb-2af9-4e04-a014-d5d2bc0010a7	7094bace-2d1c-4e11-a708-121f3f8c6448	20	90	90	70	75	64	2025-10-22 08:49:18.368103
cfeda8b1-8264-471c-a1cf-b0cdbbe1c261	def70aeb-2af9-4e04-a014-d5d2bc0010a7	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	90	90	70	75	73	2025-10-22 08:49:18.368103
d0679490-7754-42f0-aa9d-72857eed5b32	def70aeb-2af9-4e04-a014-d5d2bc0010a7	74e40274-3010-4113-87ba-ef51accdb12d	40	90	90	70	75	70	2025-10-22 08:49:18.368103
7bc031c0-73a4-44c2-a565-2e8ebdedd12c	def70aeb-2af9-4e04-a014-d5d2bc0010a7	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	40	90	90	70	75	70	2025-10-22 08:49:18.368103
3ebbd09f-6511-4c0e-8136-e6a92399f6c6	def70aeb-2af9-4e04-a014-d5d2bc0010a7	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	90	70	75	88	2025-10-22 08:49:18.368103
6565a688-5076-4905-8000-808563e7271a	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	90	60	60	52	60	2025-10-22 08:49:13.728394
8d0bb973-faeb-44ac-9cb5-8599220074a3	def70aeb-2af9-4e04-a014-d5d2bc0010a7	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	90	90	70	75	70	2025-10-22 08:49:18.368103
3b7fab2c-d86e-47bf-a254-14872f52b80b	def70aeb-2af9-4e04-a014-d5d2bc0010a7	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	20	90	90	70	75	64	2025-10-22 08:49:18.368103
b0097049-2fd8-474c-be9b-ba4ef9e2b9c2	c58451eb-3f30-48cf-bc87-2459e7c2a910	7094bace-2d1c-4e11-a708-121f3f8c6448	90	90	50	60	52	74	2025-10-22 10:04:34.715128
bb1520c9-d21e-4f1b-bea5-4988e3796852	5a7f78e6-08af-46ee-8b5c-7c977948c82f	74e40274-3010-4113-87ba-ef51accdb12d	80	60	80	90	76	76	2025-10-22 10:21:29.730571
21bba1a9-dc9f-4fd6-9a83-565ac16c6e66	5a7f78e6-08af-46ee-8b5c-7c977948c82f	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	60	80	90	76	70	2025-10-22 10:21:29.730571
b99d5615-fa22-4a38-8f74-00819c6eff89	4d09e521-8224-4513-82fa-a6b42af3dcd6	7094bace-2d1c-4e11-a708-121f3f8c6448	80	100	70	70	54	78	2025-10-22 08:49:32.538622
f28c1810-31d3-430b-96ad-a0b424065409	4d09e521-8224-4513-82fa-a6b42af3dcd6	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	70	70	54	72	2025-10-22 08:49:32.538622
9b64ab40-6af2-41b5-9604-80c88ab38c57	4d09e521-8224-4513-82fa-a6b42af3dcd6	74e40274-3010-4113-87ba-ef51accdb12d	90	100	70	70	54	81	2025-10-22 08:49:32.538622
35dad07b-718f-4d04-a906-03389cd21fd7	5a7f78e6-08af-46ee-8b5c-7c977948c82f	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	60	80	90	76	70	2025-10-22 10:21:29.730571
16620054-046c-4e4d-9808-22eea3d236da	4d09e521-8224-4513-82fa-a6b42af3dcd6	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	70	70	54	78	2025-10-22 08:49:32.538622
33a003d5-8cce-4022-8d53-eb27855c1fd7	cbf0915e-da75-48b2-b85a-da06992d1b0b	7094bace-2d1c-4e11-a708-121f3f8c6448	60	90	20	80	58	64	2025-10-22 08:49:27.940098
aa207af9-4516-4c33-8d82-a48e596ac4d4	78063abb-e5c2-42b0-8d3d-d24f17c28d35	7094bace-2d1c-4e11-a708-121f3f8c6448	80	90	80	70	62	78	2025-10-22 08:49:37.148349
a0a6dc05-9138-43a9-a018-6d03b86ed750	cbf0915e-da75-48b2-b85a-da06992d1b0b	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	20	80	58	64	2025-10-22 08:49:27.940098
16cd745a-f992-4bc4-805d-94278471c1c0	cbf0915e-da75-48b2-b85a-da06992d1b0b	74e40274-3010-4113-87ba-ef51accdb12d	100	90	20	80	58	76	2025-10-22 08:49:27.940098
bdbfe71b-dd80-42e8-bda2-76764ad82447	4d09e521-8224-4513-82fa-a6b42af3dcd6	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	100	70	70	54	81	2025-10-22 08:49:32.538622
3292f65b-9154-4710-98dc-3fd3a9f938bd	4d09e521-8224-4513-82fa-a6b42af3dcd6	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	100	70	70	54	84	2025-10-22 08:49:32.538622
80bb7957-b1bd-424d-a035-494b617e308d	4d09e521-8224-4513-82fa-a6b42af3dcd6	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	100	70	70	54	78	2025-10-22 08:49:32.538622
e5ec6a51-809e-4c66-a919-aa261623de34	78063abb-e5c2-42b0-8d3d-d24f17c28d35	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	90	80	70	62	78	2025-10-22 08:49:37.148349
a47c6bc0-c028-410b-943d-b55675139fe7	78063abb-e5c2-42b0-8d3d-d24f17c28d35	74e40274-3010-4113-87ba-ef51accdb12d	90	90	80	70	62	81	2025-10-22 08:49:37.148349
5cecab0b-0feb-4188-b8f0-60d031aaaf5a	78063abb-e5c2-42b0-8d3d-d24f17c28d35	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	90	80	70	62	81	2025-10-22 08:49:37.148349
8cbe00f4-2448-4749-85df-cd1244d1df56	78063abb-e5c2-42b0-8d3d-d24f17c28d35	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	90	80	70	62	81	2025-10-22 08:49:37.148349
d2b4e1e6-fd23-45e0-9cb0-82e48dd7afc1	78063abb-e5c2-42b0-8d3d-d24f17c28d35	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	90	80	70	62	81	2025-10-22 08:49:37.148349
041fc550-1f51-4d1c-a2a2-85a84f0bd67a	78063abb-e5c2-42b0-8d3d-d24f17c28d35	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	90	80	70	62	78	2025-10-22 08:49:37.148349
1d857e6a-3320-4a12-a669-67a3567416b5	04570fa5-4011-4591-af21-06093e7b6297	7094bace-2d1c-4e11-a708-121f3f8c6448	80	90	90	70	68	81	2025-10-22 08:49:41.914255
b439ab28-004d-46cf-a06c-213e5b273e16	04570fa5-4011-4591-af21-06093e7b6297	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	90	70	68	75	2025-10-22 08:49:41.914255
dd457426-6027-4ac9-9da1-2b3ec2d00061	04570fa5-4011-4591-af21-06093e7b6297	74e40274-3010-4113-87ba-ef51accdb12d	90	90	90	70	68	84	2025-10-22 08:49:41.914255
743dfe93-56f2-4054-aac3-a4f231066ccd	04570fa5-4011-4591-af21-06093e7b6297	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	90	90	70	68	81	2025-10-22 08:49:41.914255
dc6a6f8f-8464-4660-b844-a1a21ac87df9	04570fa5-4011-4591-af21-06093e7b6297	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	90	70	68	87	2025-10-22 08:49:41.914255
50f21bf8-08fa-4e38-8476-c577dbc36332	04570fa5-4011-4591-af21-06093e7b6297	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	90	90	70	68	84	2025-10-22 08:49:41.914255
f68694ed-64c0-42bf-8fe5-c448ce37dafa	04570fa5-4011-4591-af21-06093e7b6297	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	90	90	70	68	81	2025-10-22 08:49:41.914255
d110407a-2784-4229-887f-bd4d2cae5429	35b60547-1009-454d-890d-c4b35f1ce3f2	7094bace-2d1c-4e11-a708-121f3f8c6448	60	90	90	80	66	76	2025-10-22 08:49:46.456539
a0a3e132-2fc3-488f-b05a-7790433bd73d	35b60547-1009-454d-890d-c4b35f1ce3f2	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	20	90	90	80	66	64	2025-10-22 08:49:46.456539
2acfa45e-ab43-4a4c-8db7-c2c0189066cd	35b60547-1009-454d-890d-c4b35f1ce3f2	74e40274-3010-4113-87ba-ef51accdb12d	90	90	90	80	66	85	2025-10-22 08:49:46.456539
7200b158-1710-4294-93a2-1a223a0690d8	35b60547-1009-454d-890d-c4b35f1ce3f2	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	90	90	80	66	85	2025-10-22 08:49:46.456539
a0ca37c8-5b0e-4dc9-b3c5-288da34aeb20	35b60547-1009-454d-890d-c4b35f1ce3f2	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	90	90	80	66	85	2025-10-22 08:49:46.456539
7a33670c-5e90-459f-96bf-41f32e5ccba5	35b60547-1009-454d-890d-c4b35f1ce3f2	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	90	90	80	66	85	2025-10-22 08:49:46.456539
43dbcd7c-5aae-43fd-ba72-43293dc5bbfc	35b60547-1009-454d-890d-c4b35f1ce3f2	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	90	90	80	66	76	2025-10-22 08:49:46.456539
644dfff6-029c-4efe-91e3-b825b9ef6b16	35b60547-1009-454d-890d-c4b35f1ce3f2	e8178bc7-bddd-4e89-bfea-8bd8cc618613	20	90	90	80	66	64	2025-10-22 08:49:46.456539
e547717e-1d3b-4ee4-8cc6-5bad989de867	ef893d9d-59a6-4714-91d3-132569a2fe06	7094bace-2d1c-4e11-a708-121f3f8c6448	60	90	50	70	58	67	2025-10-22 08:49:51.58095
6fffdde2-b4cb-4571-807f-e61acd4dd816	ef893d9d-59a6-4714-91d3-132569a2fe06	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	50	70	58	67	2025-10-22 08:49:51.58095
0b95283c-cc11-40b1-9a43-d5efe746db02	ef893d9d-59a6-4714-91d3-132569a2fe06	74e40274-3010-4113-87ba-ef51accdb12d	90	90	50	70	58	76	2025-10-22 08:49:51.58095
30861c9e-4bce-44e1-b470-20feef5f4c69	ef893d9d-59a6-4714-91d3-132569a2fe06	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	90	50	70	58	79	2025-10-22 08:49:51.58095
3cb16077-b2be-413d-9e85-82ab0024ad61	ef893d9d-59a6-4714-91d3-132569a2fe06	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	50	70	58	79	2025-10-22 08:49:51.58095
cbd97f40-885d-4246-b196-563c5ebce6e7	ef893d9d-59a6-4714-91d3-132569a2fe06	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	90	50	70	58	73	2025-10-22 08:49:51.58095
a28f58cc-0121-4452-bb37-28abe97cf5c4	ef893d9d-59a6-4714-91d3-132569a2fe06	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	90	50	70	58	67	2025-10-22 08:49:51.58095
879d30c6-cb42-499c-a857-a4f4844606d4	66ada0dc-7cb2-489c-909d-754e5e208a13	7094bace-2d1c-4e11-a708-121f3f8c6448	20	90	40	70	56	53	2025-10-22 08:49:56.925776
f24f61a5-7b27-4da0-a6a0-047b0581e746	66ada0dc-7cb2-489c-909d-754e5e208a13	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	40	70	56	65	2025-10-22 08:49:56.925776
4498d45e-bea3-49f0-9808-57469fcbf4f2	66ada0dc-7cb2-489c-909d-754e5e208a13	74e40274-3010-4113-87ba-ef51accdb12d	80	90	40	70	56	71	2025-10-22 08:49:56.925776
53805f15-d6b5-4acf-a1af-aef6320389c6	66ada0dc-7cb2-489c-909d-754e5e208a13	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	90	40	70	56	71	2025-10-22 08:49:56.925776
a4df4eca-6783-4c84-97cf-bca14780de90	66ada0dc-7cb2-489c-909d-754e5e208a13	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	90	40	70	56	71	2025-10-22 08:49:56.925776
aa8524b0-12bc-4b4a-8f78-a71ada2e45b5	66ada0dc-7cb2-489c-909d-754e5e208a13	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	90	40	70	56	59	2025-10-22 08:49:56.925776
b23f17fa-0f11-48ad-bb87-fc8f2e76cd57	66ada0dc-7cb2-489c-909d-754e5e208a13	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	20	90	40	70	56	53	2025-10-22 08:49:56.925776
4997c35c-a004-43d6-af0f-3b3029b79f04	a169c096-7d0e-4505-a487-d08fca579276	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	60	70	54	65	2025-10-22 08:50:01.406541
40e3ad05-8d9d-4fcd-9ceb-40fc251a3079	a169c096-7d0e-4505-a487-d08fca579276	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	60	70	54	68	2025-10-22 08:50:01.406541
f58e1603-cf4d-40d5-b2c6-f3c1f498f9ec	a169c096-7d0e-4505-a487-d08fca579276	74e40274-3010-4113-87ba-ef51accdb12d	80	90	60	70	54	74	2025-10-22 08:50:01.406541
a65663f0-5d4e-4ce9-a75c-ffaa75b7d00b	a169c096-7d0e-4505-a487-d08fca579276	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	60	70	54	71	2025-10-22 08:50:01.406541
76d2ff3e-ac82-41be-acad-e7f84ca1c073	a169c096-7d0e-4505-a487-d08fca579276	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	90	60	70	54	74	2025-10-22 08:50:01.406541
fd1a08f7-5e0f-4d98-88e8-8e376c6a5b4f	351d9e16-cc72-4671-9e47-d43442749a9f	7094bace-2d1c-4e11-a708-121f3f8c6448	80	90	80	60	72	78	2025-10-22 08:50:05.922449
8afa4468-f4f7-46d7-95d6-b919be9380b2	351d9e16-cc72-4671-9e47-d43442749a9f	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	80	60	72	72	2025-10-22 08:50:05.922449
d7a74540-ebeb-462a-9eb1-7a55d446a6b5	351d9e16-cc72-4671-9e47-d43442749a9f	74e40274-3010-4113-87ba-ef51accdb12d	80	90	80	60	72	78	2025-10-22 08:50:05.922449
2eb47b79-e7ef-4714-802f-7809fb1cc1b1	a169c096-7d0e-4505-a487-d08fca579276	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	90	60	70	54	77	2025-10-22 08:50:01.406541
14260a0b-10b7-4fd7-9355-7e0ee1bf11e8	a42651c6-4071-492e-8c3b-f271e2142216	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	60	70	80	74	73	2025-10-22 10:01:28.523312
cc2b011d-5d1f-4890-bd4e-586600bf345c	351d9e16-cc72-4671-9e47-d43442749a9f	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	90	80	60	72	81	2025-10-22 08:50:05.922449
cd99bd31-c008-4fec-9011-eff3c5ca111f	a169c096-7d0e-4505-a487-d08fca579276	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	60	70	54	65	2025-10-22 08:50:01.406541
627c1624-f829-4f11-836f-185208266911	a169c096-7d0e-4505-a487-d08fca579276	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	60	70	54	68	2025-10-22 08:50:01.406541
09bbbfbb-9c01-4ace-b131-c37862a9f46c	fd5455a1-8f35-40e4-84f5-5cab30de8bea	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	100	70	70	45	68	2025-10-22 08:46:37.860148
28af0258-f67f-4a25-a253-3f8b4b51d836	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	7094bace-2d1c-4e11-a708-121f3f8c6448	80	90	80	60	70	78	2025-10-22 08:50:10.22845
0b6c0a82-383d-46fd-b8f4-2c8a9fd9c583	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	80	60	70	72	2025-10-22 08:50:10.22845
418a368b-455e-48f7-a867-09cd9160bfea	c58451eb-3f30-48cf-bc87-2459e7c2a910	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	90	50	60	52	71	2025-10-22 10:04:34.715128
7b920b21-4d04-45dd-a5b6-4ef2d2168039	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	74e40274-3010-4113-87ba-ef51accdb12d	80	90	80	60	70	78	2025-10-22 08:50:10.22845
f6388d58-c239-49d3-979f-8fce069ac068	90709d7e-4b55-4f7f-9dc8-acdeadcbfc69	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	90	80	60	70	81	2025-10-22 08:50:10.22845
f88f3da0-602f-4750-918d-c29ece888db4	d3a9895e-21c2-4aa7-92e5-3a04aee72014	7094bace-2d1c-4e11-a708-121f3f8c6448	60	75	90	70	62	70	2025-10-22 08:50:14.52398
d8a74eb8-3d2b-47e5-af01-dbeaa11e24ef	d3a9895e-21c2-4aa7-92e5-3a04aee72014	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	75	90	70	62	70	2025-10-22 08:50:14.52398
99d441ca-7604-42e9-a459-1ffa8473b12e	d3a9895e-21c2-4aa7-92e5-3a04aee72014	74e40274-3010-4113-87ba-ef51accdb12d	70	75	90	70	62	73	2025-10-22 08:50:14.52398
22f38e18-4830-413a-9086-6dd690b54f7c	d3a9895e-21c2-4aa7-92e5-3a04aee72014	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	75	90	70	62	79	2025-10-22 08:50:14.52398
a465ac29-c5a1-4a26-9799-2f02b332e0ac	c58451eb-3f30-48cf-bc87-2459e7c2a910	74e40274-3010-4113-87ba-ef51accdb12d	90	90	50	60	52	74	2025-10-22 10:04:34.715128
fa73594c-c897-4faf-842b-079c0ede252e	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	7094bace-2d1c-4e11-a708-121f3f8c6448	20	90	80	70	58	60	2025-10-22 08:50:19.099509
ca2c9f66-1024-4324-b578-822b816dc38d	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	90	80	70	58	69	2025-10-22 08:50:19.099509
cbfcf7c3-e01d-4843-b2fb-71e221641fd1	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	74e40274-3010-4113-87ba-ef51accdb12d	60	90	80	70	58	72	2025-10-22 08:50:19.099509
7aaa3d15-cb11-4bc5-9a75-7db8f5b4baaa	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	80	70	58	75	2025-10-22 08:50:19.099509
a43890e6-288a-4fdc-ac4b-5105d9dbcfe2	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	90	80	70	58	81	2025-10-22 08:50:19.099509
fb8a4591-4f3c-4cd5-b694-4675246fe54f	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	80	70	58	69	2025-10-22 08:50:19.099509
55d189d3-e227-47d1-8892-21232bdd6c3c	e8af6b26-7aec-4d39-b34c-e849a70b2d2a	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	20	90	80	70	58	60	2025-10-22 08:50:19.099509
925aae92-b7f6-4223-a639-345a9b46351d	f5ba86d5-4e8b-4abe-9feb-add2d374d219	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	40	70	48	61	2025-10-22 08:50:23.663104
4b68eb65-ca1b-4405-b960-4063ca5850b2	f5ba86d5-4e8b-4abe-9feb-add2d374d219	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	40	70	48	64	2025-10-22 08:50:23.663104
db3d3954-c5e9-4eaf-9751-64215dd352a8	f5ba86d5-4e8b-4abe-9feb-add2d374d219	74e40274-3010-4113-87ba-ef51accdb12d	60	90	40	70	48	64	2025-10-22 08:50:23.663104
d7a8befc-3243-4c06-834b-77514da8fa44	f5ba86d5-4e8b-4abe-9feb-add2d374d219	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	40	70	48	67	2025-10-22 08:50:23.663104
80bfa4f3-1449-452b-99c7-1de811c0ccff	f5ba86d5-4e8b-4abe-9feb-add2d374d219	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	40	70	48	76	2025-10-22 08:50:23.663104
19352b01-1788-488a-b3bc-74d2a8929650	f5ba86d5-4e8b-4abe-9feb-add2d374d219	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	40	70	48	61	2025-10-22 08:50:23.663104
873b1132-ae0b-4b70-bf2f-bb586a0c498a	f5ba86d5-4e8b-4abe-9feb-add2d374d219	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	40	70	48	61	2025-10-22 08:50:23.663104
e3e783d7-961f-4893-ad07-cb334b7d41f3	9415905d-81c3-4577-b19a-8e60bd2459d8	7094bace-2d1c-4e11-a708-121f3f8c6448	40	75	90	80	56	65	2025-10-22 08:50:30.259232
f0553b4f-9770-485f-b438-6bf7a6d6e81f	9415905d-81c3-4577-b19a-8e60bd2459d8	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	75	90	80	56	71	2025-10-22 08:50:30.259232
a66542bf-3dd4-4c8c-b707-f85cce18eddd	9415905d-81c3-4577-b19a-8e60bd2459d8	74e40274-3010-4113-87ba-ef51accdb12d	80	75	90	80	56	77	2025-10-22 08:50:30.259232
7e98a10e-7ab2-47d1-958d-3c74e2011328	9415905d-81c3-4577-b19a-8e60bd2459d8	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	75	90	80	56	71	2025-10-22 08:50:30.259232
714b9400-a106-4ad5-83cb-4643b3f4c52c	9415905d-81c3-4577-b19a-8e60bd2459d8	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	75	90	80	56	71	2025-10-22 08:50:30.259232
f1cdd0cf-e716-443c-8710-7fa98c9ea227	9415905d-81c3-4577-b19a-8e60bd2459d8	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	75	90	80	56	83	2025-10-22 08:50:30.259232
2e2e3e96-2857-4ab1-aa5d-97c24bbaad07	9415905d-81c3-4577-b19a-8e60bd2459d8	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	75	90	80	56	65	2025-10-22 08:50:30.259232
0b5bf468-7a4f-4065-af23-40ed4071ac35	fcd5fba1-05b5-47df-8205-d060f411f56c	7094bace-2d1c-4e11-a708-121f3f8c6448	60	75	90	70	54	69	2025-10-22 08:50:35.065958
aef7f691-91f9-4c9e-b4c3-56975d7df0ff	fcd5fba1-05b5-47df-8205-d060f411f56c	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	75	90	70	54	69	2025-10-22 08:50:35.065958
d0d0ef0e-bf99-4624-9b05-a85700a56990	fcd5fba1-05b5-47df-8205-d060f411f56c	74e40274-3010-4113-87ba-ef51accdb12d	70	75	90	70	54	72	2025-10-22 08:50:35.065958
8d3067de-d625-4738-b270-39fffe1f44de	fcd5fba1-05b5-47df-8205-d060f411f56c	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	75	90	70	54	75	2025-10-22 08:50:35.065958
5352163c-65ea-49a1-b241-1e505e13b799	fcd5fba1-05b5-47df-8205-d060f411f56c	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	75	90	70	54	78	2025-10-22 08:50:35.065958
10a46f62-8cf9-4a6c-a78d-264df570dc5f	fcd5fba1-05b5-47df-8205-d060f411f56c	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	75	90	70	54	75	2025-10-22 08:50:35.065958
d06ed565-5324-4077-b7bf-77103c82054b	fcd5fba1-05b5-47df-8205-d060f411f56c	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	75	90	70	54	69	2025-10-22 08:50:35.065958
d6c6b254-361e-412c-9901-e3b301033eec	fcd5fba1-05b5-47df-8205-d060f411f56c	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	75	90	70	54	69	2025-10-22 08:50:35.065958
8e3aeb0b-46cf-4938-a51c-41e7ed0e7133	fe29e631-c438-4178-978f-6ed4e12c4b49	7094bace-2d1c-4e11-a708-121f3f8c6448	20	100	40	70	46	54	2025-10-22 08:50:40.782556
e973017e-babd-4802-be39-92797a1dd315	fe29e631-c438-4178-978f-6ed4e12c4b49	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	100	40	70	46	63	2025-10-22 08:50:40.782556
aaafb4c0-2c26-4602-96d0-40c945f2a9d1	fe29e631-c438-4178-978f-6ed4e12c4b49	74e40274-3010-4113-87ba-ef51accdb12d	40	100	40	70	46	60	2025-10-22 08:50:40.782556
39170da6-01bf-4776-ba3d-e8c7b25f6c82	fe29e631-c438-4178-978f-6ed4e12c4b49	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	100	40	70	46	69	2025-10-22 08:50:40.782556
82e7ce21-304d-49d6-a0b7-841bfac56fd6	fe29e631-c438-4178-978f-6ed4e12c4b49	748ccce7-9e36-4a8f-84c6-55af30e31f4c	40	100	40	70	46	60	2025-10-22 08:50:40.782556
1be55bb8-a569-4ed3-b668-f63acf7b0c90	fe29e631-c438-4178-978f-6ed4e12c4b49	748bccfb-8b02-4052-9084-3e1bc103a2ca	20	100	40	70	46	54	2025-10-22 08:50:40.782556
0340056c-3bf0-416b-a401-f6c2e1c9a147	fe29e631-c438-4178-978f-6ed4e12c4b49	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	20	100	40	70	46	54	2025-10-22 08:50:40.782556
f1bab56c-9ecb-42ad-94c7-c6cb5009ec90	bb97bdcb-63ab-4870-8514-747b141bb008	7094bace-2d1c-4e11-a708-121f3f8c6448	50	100	20	70	48	61	2025-10-22 08:50:45.199283
4b512dd4-2777-4263-8f4a-c29312589583	bb97bdcb-63ab-4870-8514-747b141bb008	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	20	70	48	64	2025-10-22 08:50:45.199283
b118661a-e219-420f-aed9-3b4b6f1b34ec	bb97bdcb-63ab-4870-8514-747b141bb008	74e40274-3010-4113-87ba-ef51accdb12d	50	100	20	70	48	61	2025-10-22 08:50:45.199283
d3b36950-7c23-47d7-b3fc-bc3dabbb5452	bb97bdcb-63ab-4870-8514-747b141bb008	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	20	70	48	70	2025-10-22 08:50:45.199283
fc681e40-ce62-42e4-a278-9cdd76e81a6c	bb97bdcb-63ab-4870-8514-747b141bb008	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	100	20	70	48	64	2025-10-22 08:50:45.199283
5e716ffa-e44d-467d-99a9-8dca35b2ad29	bb97bdcb-63ab-4870-8514-747b141bb008	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	100	20	70	48	61	2025-10-22 08:50:45.199283
270d71ba-5ceb-43e3-b67a-48b80d8cc845	bb97bdcb-63ab-4870-8514-747b141bb008	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	20	70	48	61	2025-10-22 08:50:45.199283
c31d9965-1f8a-454a-a1e3-87a035741cc0	bb97bdcb-63ab-4870-8514-747b141bb008	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	20	70	48	64	2025-10-22 08:50:45.199283
c1d42471-df18-497d-9fbd-16ffc814cbf6	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	7094bace-2d1c-4e11-a708-121f3f8c6448	40	100	20	70	52	58	2025-10-22 08:50:49.791518
c69cdce8-0b1d-4131-b1cc-e36d399657cf	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	20	70	52	64	2025-10-22 08:50:49.791518
99fad4b0-2696-4013-a47f-81eb0da81775	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	74e40274-3010-4113-87ba-ef51accdb12d	40	100	20	70	52	58	2025-10-22 08:50:49.791518
4ee9b13a-e0f2-4b63-97ec-cb96c2dc5bdd	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	100	20	70	52	67	2025-10-22 08:50:49.791518
b01e4a58-75c6-4d97-9032-159f23bf0f2b	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	100	20	70	52	67	2025-10-22 08:50:49.791518
935bca20-0ee9-495e-a3ab-beda94d2bd6a	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	20	70	52	58	2025-10-22 08:50:49.791518
c22b0eb5-077a-4729-85a6-9cad1f24f691	f044a094-f9ef-42ea-80fa-b66e5b7104ba	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	15	90	70	52	60	2025-10-22 10:03:15.081595
4711ebc9-6f61-47bf-ba23-ecda0c0feef7	4f5e2e34-2d78-47f9-9077-a33b0445ddfc	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	20	70	52	58	2025-10-22 08:50:49.791518
445adf3e-61ef-4dc5-b3b9-ffb5e448b6d9	f044a094-f9ef-42ea-80fa-b66e5b7104ba	74e40274-3010-4113-87ba-ef51accdb12d	80	15	90	70	52	60	2025-10-22 10:03:15.081595
9e0f2a38-76b7-434f-9f32-e1e37093369b	f044a094-f9ef-42ea-80fa-b66e5b7104ba	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	15	90	70	52	51	2025-10-22 10:03:15.081595
e55f5a0e-bbee-459d-978a-89e4566362eb	5a7f78e6-08af-46ee-8b5c-7c977948c82f	7094bace-2d1c-4e11-a708-121f3f8c6448	100	60	80	90	76	82	2025-10-22 10:21:29.730571
a913850c-403f-46fb-9652-231fef572ef8	a42651c6-4071-492e-8c3b-f271e2142216	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	60	70	80	74	79	2025-10-22 10:01:28.523312
7c4305f0-7c12-4017-b8a4-54fc7172a410	c58451eb-3f30-48cf-bc87-2459e7c2a910	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	90	50	60	52	77	2025-10-22 10:04:34.715128
1789ef85-93c4-4e55-901c-6fe426f79b68	c58451eb-3f30-48cf-bc87-2459e7c2a910	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	90	50	60	52	65	2025-10-22 10:04:34.715128
261fa489-9add-4e04-a5e1-27feb70a0bde	2104f32a-c752-4132-ba7c-be5c16783703	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	70	90	90	80	65	79	2025-10-22 10:21:24.037417
729a97bd-8062-4cc6-87f3-a215c882f14d	2104f32a-c752-4132-ba7c-be5c16783703	74e40274-3010-4113-87ba-ef51accdb12d	90	90	90	80	65	85	2025-10-22 10:21:24.037417
bfc28c68-990d-496c-8e01-d0a611983888	c58451eb-3f30-48cf-bc87-2459e7c2a910	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	90	50	60	52	77	2025-10-22 10:04:34.715128
8e0f3021-1bc3-4c3c-b306-e787edfeb30d	a42651c6-4071-492e-8c3b-f271e2142216	7094bace-2d1c-4e11-a708-121f3f8c6448	80	60	70	80	74	73	2025-10-22 10:01:28.523312
f8f01015-cad0-424d-aae4-9bdcefa42033	52e5f7b4-2418-49b7-a26e-728b5eaf1747	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	15	70	70	48	50	2025-10-22 10:03:19.79171
d8eebca3-4585-4322-8078-fd23a7b71e62	30f65744-b572-488a-ab73-4d8e4867a82a	7094bace-2d1c-4e11-a708-121f3f8c6448	90	30	50	70	48	60	2025-10-22 10:02:34.719528
697b02dc-092a-46a9-b21f-3b34cda21566	30f65744-b572-488a-ab73-4d8e4867a82a	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	30	50	70	48	57	2025-10-22 10:02:34.719528
35baa2c3-1836-46a2-b0c4-01a837f4b781	30f65744-b572-488a-ab73-4d8e4867a82a	74e40274-3010-4113-87ba-ef51accdb12d	70	30	50	70	48	54	2025-10-22 10:02:34.719528
054cd005-9f14-44c9-a755-7d62490a01bf	30f65744-b572-488a-ab73-4d8e4867a82a	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	30	50	70	48	51	2025-10-22 10:02:34.719528
7adad24e-9c28-4679-ac2e-2cac97430a5d	30f65744-b572-488a-ab73-4d8e4867a82a	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	30	50	70	48	48	2025-10-22 10:02:34.719528
87dc864d-a8ab-440a-8d42-fbbd2add2bd9	30f65744-b572-488a-ab73-4d8e4867a82a	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	30	50	70	48	48	2025-10-22 10:02:34.719528
5625cf51-0735-4018-9707-0272b7ec610e	30f65744-b572-488a-ab73-4d8e4867a82a	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	30	50	70	48	60	2025-10-22 10:02:34.719528
874ecc7e-5340-4c30-89a7-10c5a8966420	62db09a1-adc2-4359-bdb0-8b272a6acc47	7094bace-2d1c-4e11-a708-121f3f8c6448	90	30	90	80	56	68	2025-10-22 10:02:40.077853
2263fefc-3d7d-4605-8c99-8560950cff53	30f65744-b572-488a-ab73-4d8e4867a82a	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	30	50	70	48	57	2025-10-22 10:02:34.719528
441057eb-68ac-4827-897a-dcbeae59eafc	62db09a1-adc2-4359-bdb0-8b272a6acc47	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	30	90	80	56	68	2025-10-22 10:02:40.077853
e147f15a-6f24-4e03-974e-5ef453d36fec	62db09a1-adc2-4359-bdb0-8b272a6acc47	74e40274-3010-4113-87ba-ef51accdb12d	80	30	90	80	56	65	2025-10-22 10:02:40.077853
19604b08-3983-4d8f-93a0-e8b1cc028710	62db09a1-adc2-4359-bdb0-8b272a6acc47	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	30	90	80	56	56	2025-10-22 10:02:40.077853
98c96fea-009b-4259-9f15-47254d5488ed	62db09a1-adc2-4359-bdb0-8b272a6acc47	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	30	90	80	56	59	2025-10-22 10:02:40.077853
ae408aa9-967f-4d19-b2ba-105581d302f0	62db09a1-adc2-4359-bdb0-8b272a6acc47	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	30	90	80	56	59	2025-10-22 10:02:40.077853
97bcf0b8-b30e-49e9-9b93-c6636ff9987b	62db09a1-adc2-4359-bdb0-8b272a6acc47	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	30	90	80	56	68	2025-10-22 10:02:40.077853
b8b37957-6069-49c5-9e08-1b71872cd7e1	753bc31b-0e39-4b59-bc04-e0d266b1abc8	7094bace-2d1c-4e11-a708-121f3f8c6448	90	30	90	70	54	67	2025-10-22 10:02:45.01391
86a35c04-6cc0-4954-bc15-aa942d02f0c4	753bc31b-0e39-4b59-bc04-e0d266b1abc8	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	30	90	70	54	67	2025-10-22 10:02:45.01391
5f542b3a-2843-4abd-8bcb-4054e1b237fa	753bc31b-0e39-4b59-bc04-e0d266b1abc8	74e40274-3010-4113-87ba-ef51accdb12d	80	30	90	70	54	64	2025-10-22 10:02:45.01391
c856bbee-5ea3-42b0-85af-c52fd25a61b2	753bc31b-0e39-4b59-bc04-e0d266b1abc8	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	30	90	70	54	61	2025-10-22 10:02:45.01391
fcf6fcf3-1f9c-438f-b062-19f45d142401	753bc31b-0e39-4b59-bc04-e0d266b1abc8	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	30	90	70	54	55	2025-10-22 10:02:45.01391
e38504b4-2ab4-4188-b573-0c153a35245b	753bc31b-0e39-4b59-bc04-e0d266b1abc8	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	30	90	70	54	58	2025-10-22 10:02:45.01391
49e81da0-ef2f-4e9c-8b1a-0176a460277e	753bc31b-0e39-4b59-bc04-e0d266b1abc8	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	30	90	70	54	67	2025-10-22 10:02:45.01391
93038b07-a7aa-45f8-8c5c-4fd125bda94a	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	7094bace-2d1c-4e11-a708-121f3f8c6448	70	30	100	70	52	62	2025-10-22 10:02:49.835734
7f508893-c3ae-4e3b-88a9-45697a31236e	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	70	30	100	70	52	62	2025-10-22 10:02:49.835734
7daeaad4-9c63-4b24-9c93-c04cca66c091	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	74e40274-3010-4113-87ba-ef51accdb12d	60	30	100	70	52	59	2025-10-22 10:02:49.835734
7da24043-c184-49e6-bdcd-a379de5d7627	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	30	100	70	52	56	2025-10-22 10:02:49.835734
c93f86c2-cef5-4748-a07e-cce993de4e6f	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	30	100	70	52	59	2025-10-22 10:02:49.835734
165dd67a-a4d5-4cb6-99e0-8f1c82167c91	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	30	100	70	52	59	2025-10-22 10:02:49.835734
c8fafb5a-80b1-40ed-b97f-97a179a2e34a	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	70	30	100	70	52	62	2025-10-22 10:02:49.835734
8e709442-0fe9-4fa1-a8bd-92958c074d7a	a44c509e-e6d4-447f-a0d7-f39379b2ab9a	e8178bc7-bddd-4e89-bfea-8bd8cc618613	70	30	100	70	52	62	2025-10-22 10:02:49.835734
09ac0c8a-0f6b-4420-be49-711913dbe0f7	a582aaba-fda9-44cb-ab72-c6bc346b210c	7094bace-2d1c-4e11-a708-121f3f8c6448	100	30	30	60	45	58	2025-10-22 10:02:54.652978
cf555f77-7b64-4ee1-acac-c2d594b73f65	a582aaba-fda9-44cb-ab72-c6bc346b210c	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	30	30	60	45	58	2025-10-22 10:02:54.652978
c3643922-c552-4dbb-9e86-958e9681c054	a582aaba-fda9-44cb-ab72-c6bc346b210c	74e40274-3010-4113-87ba-ef51accdb12d	60	30	30	60	45	46	2025-10-22 10:02:54.652978
ac594bf5-1aba-4fa4-ac05-53ae92c8e00a	a582aaba-fda9-44cb-ab72-c6bc346b210c	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	40	30	30	60	45	40	2025-10-22 10:02:54.652978
c354108d-be79-4b1e-aab8-9a522817c37e	a582aaba-fda9-44cb-ab72-c6bc346b210c	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	30	30	60	45	43	2025-10-22 10:02:54.652978
4be4819c-69bf-4d8f-9a60-1e2f12186541	a582aaba-fda9-44cb-ab72-c6bc346b210c	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	30	30	60	45	52	2025-10-22 10:02:54.652978
a550df72-218b-45a5-9d8f-efc0e499fb8d	a582aaba-fda9-44cb-ab72-c6bc346b210c	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	100	30	30	60	45	58	2025-10-22 10:02:54.652978
2e429357-9980-4410-bc4f-1a0277a07e0c	817e316f-0af7-450b-afe9-61780f529d8e	7094bace-2d1c-4e11-a708-121f3f8c6448	60	15	60	100	72	57	2025-10-22 10:03:00.086925
df56156e-8010-429c-abb0-b91c4581bb48	817e316f-0af7-450b-afe9-61780f529d8e	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	15	60	100	72	63	2025-10-22 10:03:00.086925
006ca826-0a2e-4b71-a0f7-fe805d65daf3	817e316f-0af7-450b-afe9-61780f529d8e	74e40274-3010-4113-87ba-ef51accdb12d	60	15	60	100	72	57	2025-10-22 10:03:00.086925
317b24d3-2834-410a-9539-e7889b5ba84d	817e316f-0af7-450b-afe9-61780f529d8e	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	15	60	100	72	57	2025-10-22 10:03:00.086925
73e86a3b-0fe3-4cc4-9083-3c81d32e7ee7	817e316f-0af7-450b-afe9-61780f529d8e	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	15	60	100	72	54	2025-10-22 10:03:00.086925
4f1d9dcd-bfb2-4f8b-a19c-785c99de5c72	817e316f-0af7-450b-afe9-61780f529d8e	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	15	60	100	72	54	2025-10-22 10:03:00.086925
09bc64cd-81ba-46d1-ad4b-5adc408b038a	817e316f-0af7-450b-afe9-61780f529d8e	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	15	60	100	72	57	2025-10-22 10:03:00.086925
3df8ec9d-1c10-4c3f-85a5-b61deba75db1	fefb26e2-8f48-4be8-995f-b27d70d356a9	7094bace-2d1c-4e11-a708-121f3f8c6448	60	15	90	80	64	57	2025-10-22 10:03:05.126387
2a8cbaa5-5e1d-453c-b8ec-3f2270a7cbb2	817e316f-0af7-450b-afe9-61780f529d8e	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	15	60	100	72	63	2025-10-22 10:03:00.086925
c1656023-251e-4033-82f7-5ce0604e51bb	fefb26e2-8f48-4be8-995f-b27d70d356a9	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	15	90	80	64	57	2025-10-22 10:03:05.126387
073c1aae-acbd-420c-8681-4b928f3bb4a3	fefb26e2-8f48-4be8-995f-b27d70d356a9	74e40274-3010-4113-87ba-ef51accdb12d	60	15	90	80	64	57	2025-10-22 10:03:05.126387
63b3b9a6-b0ca-4cdf-b9fc-eb5bc15633d2	fefb26e2-8f48-4be8-995f-b27d70d356a9	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	15	90	80	64	66	2025-10-22 10:03:05.126387
b4fbb0f1-5ff8-434c-8bc0-dd182f754290	fefb26e2-8f48-4be8-995f-b27d70d356a9	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	15	90	80	64	66	2025-10-22 10:03:05.126387
0ac8fb1a-6ba4-4b71-bec2-866a7e62e214	2fd0938b-847f-4609-9f43-1db7708ed8f0	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	15	50	80	50	49	2025-10-22 10:03:10.357796
dec89bcf-8f24-480d-963c-ce083c6d9f51	2fd0938b-847f-4609-9f43-1db7708ed8f0	7094bace-2d1c-4e11-a708-121f3f8c6448	60	15	50	80	50	49	2025-10-22 10:03:10.357796
a212dd45-ca59-464d-bcc5-78626a5f9666	fefb26e2-8f48-4be8-995f-b27d70d356a9	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	90	80	64	57	2025-10-22 10:03:05.126387
b00de0b4-5038-45af-a58a-623af1d018c1	fefb26e2-8f48-4be8-995f-b27d70d356a9	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	15	90	80	64	57	2025-10-22 10:03:05.126387
1249d0fe-4160-4d4e-a66a-4693afc3b16c	f044a094-f9ef-42ea-80fa-b66e5b7104ba	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	15	90	70	52	54	2025-10-22 10:03:15.081595
65afea59-6924-4882-a0fd-4a73fe85dd16	f044a094-f9ef-42ea-80fa-b66e5b7104ba	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	90	70	52	54	2025-10-22 10:03:15.081595
9f421ebc-6df1-49a4-9e04-1c933fd85957	c58451eb-3f30-48cf-bc87-2459e7c2a910	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	90	50	60	52	74	2025-10-22 10:04:34.715128
29b61c90-da00-489f-b2a3-6a9a8c25f248	2104f32a-c752-4132-ba7c-be5c16783703	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	90	90	80	65	88	2025-10-22 10:21:24.037417
54282080-c502-4f2d-a87f-2c502ead885a	2104f32a-c752-4132-ba7c-be5c16783703	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	90	80	65	88	2025-10-22 10:21:24.037417
d20b60d4-c5a3-4f17-97e3-6ff998bc542b	f044a094-f9ef-42ea-80fa-b66e5b7104ba	7094bace-2d1c-4e11-a708-121f3f8c6448	60	15	90	70	52	54	2025-10-22 10:03:15.081595
77f623e9-770d-40a8-a56f-b19073de7702	fd5455a1-8f35-40e4-84f5-5cab30de8bea	74e40274-3010-4113-87ba-ef51accdb12d	80	100	70	70	45	77	2025-10-22 08:46:37.860148
429b2113-d064-4490-bd47-c1a62bcf0079	2104f32a-c752-4132-ba7c-be5c16783703	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	90	90	80	65	82	2025-10-22 10:21:24.037417
b9865b99-263f-4c36-a7b7-2fb1e5a4b601	52e5f7b4-2418-49b7-a26e-728b5eaf1747	7094bace-2d1c-4e11-a708-121f3f8c6448	60	15	70	70	48	50	2025-10-22 10:03:19.79171
985c3877-69f4-4172-b1b1-f1005cb94845	52e5f7b4-2418-49b7-a26e-728b5eaf1747	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	15	70	70	48	50	2025-10-22 10:03:19.79171
8ccbd658-ad7e-42ce-99c4-f599e1dabf52	52e5f7b4-2418-49b7-a26e-728b5eaf1747	74e40274-3010-4113-87ba-ef51accdb12d	60	15	70	70	48	50	2025-10-22 10:03:19.79171
a61fd736-c3dc-434d-9793-b1449c04e323	52e5f7b4-2418-49b7-a26e-728b5eaf1747	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	15	70	70	48	50	2025-10-22 10:03:19.79171
166eb835-7160-4cd7-ab24-a3a8e4a2cabc	52e5f7b4-2418-49b7-a26e-728b5eaf1747	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	15	70	70	48	50	2025-10-22 10:03:19.79171
db90c692-549b-4e04-aec9-2d1a21ec4e8a	52e5f7b4-2418-49b7-a26e-728b5eaf1747	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	70	70	48	50	2025-10-22 10:03:19.79171
5f22f6dc-ccf6-4830-8466-a3e5c71742b3	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	7094bace-2d1c-4e11-a708-121f3f8c6448	90	30	30	60	42	54	2025-10-22 10:03:24.263775
f473940e-1e2a-43d4-8e12-7bfc63e70db6	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	30	30	60	42	54	2025-10-22 10:03:24.263775
3ea9b941-cece-4dc7-afac-3ef046a811f7	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	74e40274-3010-4113-87ba-ef51accdb12d	90	30	30	60	42	54	2025-10-22 10:03:24.263775
ab6fc77a-d8a2-41f3-bf03-1abdafbbe0ad	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	40	30	30	60	42	39	2025-10-22 10:03:24.263775
d748b445-a24f-4577-af16-36816c63c123	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	748ccce7-9e36-4a8f-84c6-55af30e31f4c	40	30	30	60	42	39	2025-10-22 10:03:24.263775
202e0fe5-79a0-47a3-bc76-468162f31de3	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	30	30	60	42	54	2025-10-22 10:03:24.263775
f3ce7b91-c512-44fe-b72a-1712eb245ec3	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	30	30	60	42	54	2025-10-22 10:03:24.263775
2bd0fb3a-2964-4b84-8d7f-599038998124	c4b42ac2-2047-466a-bdc1-708a04105814	7094bace-2d1c-4e11-a708-121f3f8c6448	80	30	40	60	44	53	2025-10-22 10:03:29.447382
69f40de8-7c4b-421f-8c65-99bb9b8f9d04	c4b42ac2-2047-466a-bdc1-708a04105814	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	30	40	60	44	53	2025-10-22 10:03:29.447382
655fc2e0-2a54-48a5-84f1-6d369da6d2a0	c4b42ac2-2047-466a-bdc1-708a04105814	74e40274-3010-4113-87ba-ef51accdb12d	70	30	40	60	44	50	2025-10-22 10:03:29.447382
9d8866b9-7d1b-4ce5-8f15-35d852bdacdd	c4b42ac2-2047-466a-bdc1-708a04105814	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	40	30	40	60	44	41	2025-10-22 10:03:29.447382
95e7055d-8703-417b-ba65-cd73faf41762	c4b42ac2-2047-466a-bdc1-708a04105814	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	30	40	60	44	44	2025-10-22 10:03:29.447382
8b7e0028-62ec-44a3-a276-57017ab0c9dd	c4b42ac2-2047-466a-bdc1-708a04105814	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	30	40	60	44	44	2025-10-22 10:03:29.447382
1b7b356f-299b-4d98-a2d9-16dcdc671ce9	c4b42ac2-2047-466a-bdc1-708a04105814	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	30	40	60	44	53	2025-10-22 10:03:29.447382
c583fbf2-4c56-4a3e-9253-6eeae815a2dd	10ea4947-03b3-4147-b520-8c2f79850a9d	7094bace-2d1c-4e11-a708-121f3f8c6448	90	15	90	60	48	60	2025-10-22 10:03:34.466295
97c765b5-b737-42c7-bbc6-2bb4c28d4dbc	10ea4947-03b3-4147-b520-8c2f79850a9d	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	15	90	60	48	60	2025-10-22 10:03:34.466295
0c057133-e0da-4a12-af7c-7af6cdb1e8eb	10ea4947-03b3-4147-b520-8c2f79850a9d	74e40274-3010-4113-87ba-ef51accdb12d	70	15	90	60	48	54	2025-10-22 10:03:34.466295
d0cbb769-8895-48af-bed7-de27d0c38f3b	10ea4947-03b3-4147-b520-8c2f79850a9d	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	15	90	60	48	48	2025-10-22 10:03:34.466295
5b2adb86-f792-4f80-a197-24a5e1c16b83	10ea4947-03b3-4147-b520-8c2f79850a9d	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	15	90	60	48	51	2025-10-22 10:03:34.466295
ac461c82-15a0-4663-bd32-d7a4a5ba6126	10ea4947-03b3-4147-b520-8c2f79850a9d	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	90	60	48	51	2025-10-22 10:03:34.466295
b13a7fa3-0aac-4309-b251-157daa018b76	10ea4947-03b3-4147-b520-8c2f79850a9d	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	15	90	60	48	60	2025-10-22 10:03:34.466295
46b8e375-665a-4be0-86ba-f4dc632f242f	fa435d58-ea7b-493f-8956-52d0170834c0	7094bace-2d1c-4e11-a708-121f3f8c6448	60	30	30	90	66	53	2025-10-22 10:03:38.647684
dfec727a-9752-43de-a5b8-7e1bee503c7a	fa435d58-ea7b-493f-8956-52d0170834c0	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	30	30	90	66	53	2025-10-22 10:03:38.647684
2160fc6e-0537-4fe8-93ef-47409a576a6f	fa435d58-ea7b-493f-8956-52d0170834c0	74e40274-3010-4113-87ba-ef51accdb12d	70	30	30	90	66	56	2025-10-22 10:03:38.647684
9d722e7e-0017-4160-b4d4-acdcfe494784	fa435d58-ea7b-493f-8956-52d0170834c0	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	30	30	90	66	50	2025-10-22 10:03:38.647684
5c3c6232-da69-4896-8eca-502c89617177	fa435d58-ea7b-493f-8956-52d0170834c0	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	30	30	90	66	56	2025-10-22 10:03:38.647684
041f6b71-4cd5-47de-982a-a11c64efcd42	fa435d58-ea7b-493f-8956-52d0170834c0	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	30	30	90	66	59	2025-10-22 10:03:38.647684
8ff4c310-454e-4351-8806-937da895796e	fa435d58-ea7b-493f-8956-52d0170834c0	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	30	30	90	66	53	2025-10-22 10:03:38.647684
1df00aa6-d5d4-4470-a4a6-e9ed5e34fe28	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	7094bace-2d1c-4e11-a708-121f3f8c6448	50	30	20	80	64	47	2025-10-22 10:03:42.784842
7117c774-bee2-4beb-a07b-e922c4bf9a18	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	30	20	80	64	50	2025-10-22 10:03:42.784842
e6da7d2b-d0c4-4249-a29c-6c3342d06ead	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	74e40274-3010-4113-87ba-ef51accdb12d	40	30	20	80	64	44	2025-10-22 10:03:42.784842
6aa7d8a3-6c63-4c05-9c18-8ef5030331f3	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	30	20	80	64	47	2025-10-22 10:03:42.784842
0cd4ab3b-9a8c-49a4-a838-98ffef5fd691	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	30	20	80	64	53	2025-10-22 10:03:42.784842
7242e5d6-ab6c-456e-8a3d-df1c7e2d166e	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	748bccfb-8b02-4052-9084-3e1bc103a2ca	70	30	20	80	64	53	2025-10-22 10:03:42.784842
4348137f-300a-43fa-8cb2-24b3a0484788	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	30	20	80	64	47	2025-10-22 10:03:42.784842
6a385c5a-b648-4bff-9cff-73515e901d31	7ed3c0d1-ffa9-4e6b-8d2a-55fe44cdec9c	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	30	20	80	64	50	2025-10-22 10:03:42.784842
18430367-6dd1-4b19-acfb-bff9b34bc423	853f4a5b-9f62-40d4-89b3-e6ced9799b43	7094bace-2d1c-4e11-a708-121f3f8c6448	60	30	30	90	62	53	2025-10-22 10:03:47.73476
100d4e43-8f06-4436-9749-5f33b1ede99d	853f4a5b-9f62-40d4-89b3-e6ced9799b43	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	30	30	90	62	53	2025-10-22 10:03:47.73476
850d4bef-db9d-4554-b3e4-5ce7145c8da2	853f4a5b-9f62-40d4-89b3-e6ced9799b43	74e40274-3010-4113-87ba-ef51accdb12d	40	30	30	90	62	47	2025-10-22 10:03:47.73476
25358b2f-2cf1-4b35-9315-1b17e68346f5	853f4a5b-9f62-40d4-89b3-e6ced9799b43	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	30	30	90	62	50	2025-10-22 10:03:47.73476
e2e648e9-b014-4766-b96d-65674c95d71a	853f4a5b-9f62-40d4-89b3-e6ced9799b43	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	30	30	90	62	56	2025-10-22 10:03:47.73476
5bb0102f-0890-4363-9d6b-9f725a7523cf	853f4a5b-9f62-40d4-89b3-e6ced9799b43	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	30	30	90	62	53	2025-10-22 10:03:47.73476
04b985de-fa4e-414f-a7e0-15ad207aa2b7	99616273-bdf3-4c3d-a934-baeed91e1011	7094bace-2d1c-4e11-a708-121f3f8c6448	40	15	90	80	58	50	2025-10-22 10:03:51.904462
17800d67-335c-4902-87b5-b50b428a74d1	853f4a5b-9f62-40d4-89b3-e6ced9799b43	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	30	30	90	62	53	2025-10-22 10:03:47.73476
0859e70c-a760-4da1-b917-f599c8478564	99616273-bdf3-4c3d-a934-baeed91e1011	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	15	90	80	58	62	2025-10-22 10:03:51.904462
b664ba00-065a-4210-94b5-1352d0afc6d4	99616273-bdf3-4c3d-a934-baeed91e1011	74e40274-3010-4113-87ba-ef51accdb12d	70	15	90	80	58	59	2025-10-22 10:03:51.904462
d229cd95-4943-4913-b601-173444b934d5	99616273-bdf3-4c3d-a934-baeed91e1011	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	15	90	80	58	62	2025-10-22 10:03:51.904462
e4295a35-d5a2-45c3-b502-8ba36d4a8bbe	f392bd89-c29f-44bb-86d5-72ab0afb2f31	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	90	80	60	54	76	2025-10-22 10:04:39.178727
aa85cc2c-0d19-4b82-a97b-6bc66f718eb7	99616273-bdf3-4c3d-a934-baeed91e1011	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	15	90	80	58	62	2025-10-22 10:03:51.904462
557f7e11-695c-457a-a0f5-0e8d5ba08bbf	c58451eb-3f30-48cf-bc87-2459e7c2a910	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	90	50	60	52	71	2025-10-22 10:04:34.715128
86a65149-754e-4a1a-8f68-f02d598d107d	77bde8e3-6499-424b-b5be-c08527274254	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	75	90	70	56	78	2025-10-22 10:04:47.755611
62f80481-a142-4949-b0c0-49977f3d65ba	1573b4b0-d2f5-4233-a921-d389464b2652	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	30	80	70	58	69	2025-10-22 10:04:52.034671
3a0749e7-e3fd-4fd5-9daa-3c6e189fbfd1	d912c555-48dc-4e7e-966d-69dd759dbd67	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	45	100	60	54	67	2025-10-22 10:05:01.479508
5a04b2cb-af3e-432f-9740-3c91924185fa	2104f32a-c752-4132-ba7c-be5c16783703	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	70	90	90	80	65	79	2025-10-22 10:21:24.037417
95a623f2-3afa-4493-ba85-1691d8fc7f76	2104f32a-c752-4132-ba7c-be5c16783703	e8178bc7-bddd-4e89-bfea-8bd8cc618613	70	90	90	80	65	79	2025-10-22 10:21:24.037417
0ba3b64f-8344-42e6-a013-68f9f986d64c	13a558af-9e5a-4014-9357-bc53cc10d2e8	7094bace-2d1c-4e11-a708-121f3f8c6448	80	30	50	90	68	63	2025-10-22 10:04:00.117013
0268ddf3-a5f6-4213-aa72-1cb5710af461	020585b3-fd9b-4d1b-bff9-365b4d108d3a	7094bace-2d1c-4e11-a708-121f3f8c6448	50	30	20	80	56	46	2025-10-22 10:03:56.006751
b9846788-988d-420d-bc53-a9e5f8156e1b	020585b3-fd9b-4d1b-bff9-365b4d108d3a	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	30	20	80	56	49	2025-10-22 10:03:56.006751
9a65d4ae-daed-44e7-a0bd-2f3e5466d211	fd5455a1-8f35-40e4-84f5-5cab30de8bea	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	70	70	45	77	2025-10-22 08:46:37.860148
87d2eed7-c597-4d19-920b-6407d1c22e84	fd5455a1-8f35-40e4-84f5-5cab30de8bea	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	100	70	70	45	83	2025-10-22 08:46:37.860148
9acf5e7f-4dd0-4ec7-af6e-d7f6f3a8e61f	020585b3-fd9b-4d1b-bff9-365b4d108d3a	74e40274-3010-4113-87ba-ef51accdb12d	60	30	20	80	56	49	2025-10-22 10:03:56.006751
6741ec74-3ff1-4b1c-abde-370102c7ef6d	13a558af-9e5a-4014-9357-bc53cc10d2e8	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	30	50	90	68	63	2025-10-22 10:04:00.117013
10c10521-3e4a-438e-b346-f1935b27f2f6	13a558af-9e5a-4014-9357-bc53cc10d2e8	74e40274-3010-4113-87ba-ef51accdb12d	80	30	50	90	68	63	2025-10-22 10:04:00.117013
218b1719-2802-4046-9e77-7f3e9704259f	13a558af-9e5a-4014-9357-bc53cc10d2e8	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	30	50	90	68	57	2025-10-22 10:04:00.117013
73e88773-7b37-4818-bdac-44fbcb444c77	13a558af-9e5a-4014-9357-bc53cc10d2e8	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	30	50	90	68	57	2025-10-22 10:04:00.117013
5f2a21fb-8090-4554-be8c-17aed29bd4c3	54907426-a944-4986-8049-d99d2ee2a65f	7094bace-2d1c-4e11-a708-121f3f8c6448	50	30	30	70	58	46	2025-10-22 10:04:04.30077
ea7447ba-5ba3-46e9-9203-aee6859473a6	54907426-a944-4986-8049-d99d2ee2a65f	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	30	30	70	58	46	2025-10-22 10:04:04.30077
a311466c-a63e-46c1-a020-69da0c35cfc0	54907426-a944-4986-8049-d99d2ee2a65f	74e40274-3010-4113-87ba-ef51accdb12d	80	30	30	70	58	55	2025-10-22 10:04:04.30077
1dd352a8-f9a8-488d-9446-52ccd2178bb3	54907426-a944-4986-8049-d99d2ee2a65f	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	30	30	70	58	55	2025-10-22 10:04:04.30077
b61772a4-b6e8-4f2f-8374-375f71072e0f	54907426-a944-4986-8049-d99d2ee2a65f	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	30	30	70	58	46	2025-10-22 10:04:04.30077
5dcf0a08-e05b-40b2-bc34-91b90cb671e7	54907426-a944-4986-8049-d99d2ee2a65f	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	30	30	70	58	58	2025-10-22 10:04:04.30077
7eef21da-cbe3-43dc-a23d-9051e338f016	54907426-a944-4986-8049-d99d2ee2a65f	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	30	30	70	58	46	2025-10-22 10:04:04.30077
08440e72-4493-47e0-940a-b91c49d517cf	11af9dc6-389d-4827-96d4-018c2b9d244e	7094bace-2d1c-4e11-a708-121f3f8c6448	60	45	20	70	54	51	2025-10-22 10:04:08.479642
0adae2cb-4c6e-40ff-9075-684eec7ef1c9	11af9dc6-389d-4827-96d4-018c2b9d244e	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	45	20	70	54	51	2025-10-22 10:04:08.479642
8c8ea89a-3b96-4c18-bf87-0900770cdc7b	11af9dc6-389d-4827-96d4-018c2b9d244e	74e40274-3010-4113-87ba-ef51accdb12d	90	45	20	70	54	60	2025-10-22 10:04:08.479642
be4143e2-5b6a-43da-8eba-b58e9bca2c1e	11af9dc6-389d-4827-96d4-018c2b9d244e	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	45	20	70	54	63	2025-10-22 10:04:08.479642
2b8efc91-9eee-4da2-876c-ae2ff05c6951	11af9dc6-389d-4827-96d4-018c2b9d244e	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	45	20	70	54	48	2025-10-22 10:04:08.479642
2b98048c-83e1-4ef5-8d64-c49b3deee131	11af9dc6-389d-4827-96d4-018c2b9d244e	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	45	20	70	54	51	2025-10-22 10:04:08.479642
4bd72276-794b-4dee-9dc0-d5c75b13c982	11af9dc6-389d-4827-96d4-018c2b9d244e	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	45	20	70	54	51	2025-10-22 10:04:08.479642
6f80aaf5-de24-41a5-8e1c-d6624460563b	569d7973-ddea-4161-94f1-c247f083427c	7094bace-2d1c-4e11-a708-121f3f8c6448	90	60	30	60	46	62	2025-10-22 10:04:12.718838
4243b87a-b41b-4493-beea-426bd12f7c45	569d7973-ddea-4161-94f1-c247f083427c	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	60	30	60	46	65	2025-10-22 10:04:12.718838
ad837429-02e5-4595-a206-dfc086dbfeb4	569d7973-ddea-4161-94f1-c247f083427c	74e40274-3010-4113-87ba-ef51accdb12d	80	60	30	60	46	59	2025-10-22 10:04:12.718838
23fb4411-1909-4ea3-9894-dc0e9a0263ac	569d7973-ddea-4161-94f1-c247f083427c	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	60	30	60	46	53	2025-10-22 10:04:12.718838
093b0653-848f-42b3-b6a5-db5de4853a25	569d7973-ddea-4161-94f1-c247f083427c	748ccce7-9e36-4a8f-84c6-55af30e31f4c	40	60	30	60	46	47	2025-10-22 10:04:12.718838
7ec908c0-8c4b-43c0-a44e-8b6de1997c82	569d7973-ddea-4161-94f1-c247f083427c	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	60	30	60	46	65	2025-10-22 10:04:12.718838
c02fcb33-9a16-42c8-8649-999d01a9bd16	569d7973-ddea-4161-94f1-c247f083427c	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	60	30	60	46	62	2025-10-22 10:04:12.718838
94a00748-43c3-4b21-9efe-bf5acd0c906a	569d7973-ddea-4161-94f1-c247f083427c	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	60	30	60	46	65	2025-10-22 10:04:12.718838
a6bc9a2e-cbbb-4b49-9bf1-4d2291d1c698	c96f9299-3c94-48d5-ac6d-e3a0f258546d	7094bace-2d1c-4e11-a708-121f3f8c6448	90	45	40	60	48	60	2025-10-22 10:04:17.453758
3aa5e8ab-550d-4931-b1fe-edf2ef95ac5d	c96f9299-3c94-48d5-ac6d-e3a0f258546d	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	45	40	60	48	63	2025-10-22 10:04:17.453758
ab138a59-6fd6-45f1-9396-a6103a5c5502	c96f9299-3c94-48d5-ac6d-e3a0f258546d	74e40274-3010-4113-87ba-ef51accdb12d	80	45	40	60	48	57	2025-10-22 10:04:17.453758
bdc72a7d-0722-4b97-9e16-462e5f735640	c96f9299-3c94-48d5-ac6d-e3a0f258546d	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	45	40	60	48	51	2025-10-22 10:04:17.453758
c6cae157-89f7-478b-916d-21b160f9ce16	c96f9299-3c94-48d5-ac6d-e3a0f258546d	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	45	40	60	48	51	2025-10-22 10:04:17.453758
dff584b0-b3c3-4baa-9504-5bd735fd0381	21efc7c2-226e-4e70-ae43-276f5e08fb09	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	30	100	70	78	69	2025-10-22 10:05:10.112754
9c2a1bb0-819f-41f6-ba62-7d8beaf0899f	c96f9299-3c94-48d5-ac6d-e3a0f258546d	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	45	40	60	48	63	2025-10-22 10:04:17.453758
d248b60c-4156-4fc8-b213-622447908e67	c96f9299-3c94-48d5-ac6d-e3a0f258546d	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	45	40	60	48	60	2025-10-22 10:04:17.453758
d58c9ba1-0c3c-42cc-9b47-828f48d5af81	66ad2215-7608-44bc-888b-cf52a6f9abd3	7094bace-2d1c-4e11-a708-121f3f8c6448	40	45	80	60	52	52	2025-10-22 10:04:21.734122
b4a2c92a-a29b-4e77-9f1b-674c6e89ad09	66ad2215-7608-44bc-888b-cf52a6f9abd3	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	45	80	60	52	58	2025-10-22 10:04:21.734122
5c5dfb09-23f3-4019-8b65-9bd3e2bc3ee3	66ad2215-7608-44bc-888b-cf52a6f9abd3	74e40274-3010-4113-87ba-ef51accdb12d	70	45	80	60	52	61	2025-10-22 10:04:21.734122
da9a1311-305c-4d65-a657-15fd2c4074db	66ad2215-7608-44bc-888b-cf52a6f9abd3	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	45	80	60	52	64	2025-10-22 10:04:21.734122
c5fe3de3-45eb-4f47-a055-97b048e5b67c	66ad2215-7608-44bc-888b-cf52a6f9abd3	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	45	80	60	52	64	2025-10-22 10:04:21.734122
326a4a3d-4618-4126-8216-bc2289803e6b	66ad2215-7608-44bc-888b-cf52a6f9abd3	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	45	80	60	52	52	2025-10-22 10:04:21.734122
57649401-3cd8-46b0-af86-41fdecfc80b9	66ad2215-7608-44bc-888b-cf52a6f9abd3	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	45	80	60	52	52	2025-10-22 10:04:21.734122
f7ac8116-ee07-4450-8477-1bca193b5183	66ad2215-7608-44bc-888b-cf52a6f9abd3	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	45	80	60	52	58	2025-10-22 10:04:21.734122
014badb7-07f2-4010-ba0e-d6a121b12690	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	7094bace-2d1c-4e11-a708-121f3f8c6448	60	45	70	60	50	56	2025-10-22 10:04:26.118548
376cf826-eab9-484c-8fb7-ae57c6fe2f78	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	45	70	60	50	56	2025-10-22 10:04:26.118548
a0965e07-ac95-4940-942e-56d3a3ab1252	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	74e40274-3010-4113-87ba-ef51accdb12d	60	45	70	60	50	56	2025-10-22 10:04:26.118548
f5825fb8-1ff9-49dc-b0c4-5042155603e1	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	45	70	60	50	56	2025-10-22 10:04:26.118548
6c4f03b1-1f03-41e3-a169-8969ad95e3e9	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	45	70	60	50	56	2025-10-22 10:04:26.118548
9c4690b6-018f-48e3-99bc-10f5e9985f2c	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	45	70	60	50	53	2025-10-22 10:04:26.118548
ad4a88c8-ae02-48cd-94b9-a3f34a8aac86	c0de7ad6-8aaf-4799-8c7a-8bebb7d6f81b	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	45	70	60	50	56	2025-10-22 10:04:26.118548
d9e3f7be-a5fc-48c6-9fc0-d413a20f3a83	ec4c8781-45d7-4340-ab1d-074681ca2966	7094bace-2d1c-4e11-a708-121f3f8c6448	60	45	80	60	46	57	2025-10-22 10:04:30.498582
58c9e46e-6c34-4e34-9861-e4f93d080c74	ec4c8781-45d7-4340-ab1d-074681ca2966	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	45	80	60	46	66	2025-10-22 10:04:30.498582
0a391cb0-f15e-40f7-a2c8-7bdfd88e2f06	ec4c8781-45d7-4340-ab1d-074681ca2966	74e40274-3010-4113-87ba-ef51accdb12d	70	45	80	60	46	60	2025-10-22 10:04:30.498582
fc4611ad-e0f0-46cd-88b3-239bfaf44fec	ec4c8781-45d7-4340-ab1d-074681ca2966	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	45	80	60	46	57	2025-10-22 10:04:30.498582
647d6b17-7963-4d00-950b-251d3ea596f0	ec4c8781-45d7-4340-ab1d-074681ca2966	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	45	80	60	46	57	2025-10-22 10:04:30.498582
2c2ec3ce-60f9-4b6b-9253-2426f809e138	ec4c8781-45d7-4340-ab1d-074681ca2966	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	45	80	60	46	57	2025-10-22 10:04:30.498582
dc30d4b1-586e-4697-b5bb-75e1b26db9f9	ec4c8781-45d7-4340-ab1d-074681ca2966	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	45	80	60	46	57	2025-10-22 10:04:30.498582
c5295628-cb97-4b07-81b8-0206b0ff3c0c	fd5455a1-8f35-40e4-84f5-5cab30de8bea	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	100	70	70	45	68	2025-10-22 08:46:37.860148
d5fd096c-05c0-4a57-a6e8-4b0ee89cd1e9	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	30	80	55	62	2025-10-22 08:46:53.296304
b338da32-2b89-4fa3-9499-3a78b4ff8c53	fd5455a1-8f35-40e4-84f5-5cab30de8bea	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	100	70	70	45	77	2025-10-22 08:46:37.860148
1970fa64-ddca-4fbb-a685-e368fe78394c	fd5455a1-8f35-40e4-84f5-5cab30de8bea	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	100	70	70	45	71	2025-10-22 08:46:37.860148
f99a47d7-a752-4961-991c-a97f20238545	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	30	80	55	62	2025-10-22 08:46:53.296304
bb7f886c-e479-4d06-a7ea-2f82a62d8885	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	30	80	55	65	2025-10-22 08:46:53.296304
93eb9694-67f2-4c1b-9e00-7f559be38acb	58006810-48b3-4b09-9e4a-cce139f122d3	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	90	20	60	42	56	2025-10-22 08:48:41.169152
b1fe982e-4a52-45ea-a3a7-7771b4df31ec	c41bab8a-909c-46b3-9c7f-daba35f04b3e	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	40	80	68	65	2025-10-22 08:48:45.583362
36dd742e-9690-4c0c-acf5-0468d3db2e8e	dddcc5d6-25ef-46c9-9ac5-47d86806e102	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	50	80	70	73	2025-10-22 08:48:50.013503
e43e1b11-fbfb-4f13-9435-65a266805696	f392bd89-c29f-44bb-86d5-72ab0afb2f31	7094bace-2d1c-4e11-a708-121f3f8c6448	90	90	80	60	54	79	2025-10-22 10:04:39.178727
ecd4a797-911e-4e84-954c-324f3ddb05bc	f392bd89-c29f-44bb-86d5-72ab0afb2f31	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	90	80	60	54	76	2025-10-22 10:04:39.178727
64fdf11f-c6f0-4a90-bc4c-4cef621fe184	f392bd89-c29f-44bb-86d5-72ab0afb2f31	74e40274-3010-4113-87ba-ef51accdb12d	100	90	80	60	54	82	2025-10-22 10:04:39.178727
e74b7383-2af1-456f-9ea8-b7e7298bcd21	f392bd89-c29f-44bb-86d5-72ab0afb2f31	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	90	80	60	54	82	2025-10-22 10:04:39.178727
6bda169b-3e35-4254-8f62-effc9b04d457	f392bd89-c29f-44bb-86d5-72ab0afb2f31	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	80	60	54	82	2025-10-22 10:04:39.178727
ef7cc5e7-a78f-49e8-a5cf-ad33fa98b585	f392bd89-c29f-44bb-86d5-72ab0afb2f31	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	90	80	60	54	82	2025-10-22 10:04:39.178727
225409fb-dbaf-4bc7-8db7-65ad7ac425f2	bb32438a-cdd2-4334-b47e-76fa8f05fa02	7094bace-2d1c-4e11-a708-121f3f8c6448	90	75	30	60	48	66	2025-10-22 10:04:43.510203
3b433c1c-9876-46e6-9861-a83ebc719b1e	bb32438a-cdd2-4334-b47e-76fa8f05fa02	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	75	30	60	48	66	2025-10-22 10:04:43.510203
baa804d7-34f8-468c-be56-e69b66c31437	bb32438a-cdd2-4334-b47e-76fa8f05fa02	74e40274-3010-4113-87ba-ef51accdb12d	100	75	30	60	48	69	2025-10-22 10:04:43.510203
723cf54b-10de-4c8d-9f2a-beedc84c52aa	bb32438a-cdd2-4334-b47e-76fa8f05fa02	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	75	30	60	48	63	2025-10-22 10:04:43.510203
f1474aee-c345-4ea6-b905-f48bc33d7b14	bb32438a-cdd2-4334-b47e-76fa8f05fa02	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	75	30	60	48	57	2025-10-22 10:04:43.510203
c2d6c314-b287-4aa4-af76-65947984a677	bb32438a-cdd2-4334-b47e-76fa8f05fa02	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	75	30	60	48	69	2025-10-22 10:04:43.510203
260612fb-ea84-4351-ad84-20768e4d472a	bb32438a-cdd2-4334-b47e-76fa8f05fa02	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	75	30	60	48	66	2025-10-22 10:04:43.510203
8021ae40-ceba-4fdf-aacc-80515db5eadf	77bde8e3-6499-424b-b5be-c08527274254	7094bace-2d1c-4e11-a708-121f3f8c6448	100	75	90	70	56	81	2025-10-22 10:04:47.755611
b1b816fc-2379-40b0-b166-1ea21929edba	77bde8e3-6499-424b-b5be-c08527274254	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	75	90	70	56	78	2025-10-22 10:04:47.755611
6652ba82-e532-4e7f-a750-5661dce78891	77bde8e3-6499-424b-b5be-c08527274254	74e40274-3010-4113-87ba-ef51accdb12d	90	75	90	70	56	78	2025-10-22 10:04:47.755611
5e8a0dde-667f-4ed5-9e3e-4a006dd89956	77bde8e3-6499-424b-b5be-c08527274254	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	75	90	70	56	75	2025-10-22 10:04:47.755611
4838da7d-7a46-419d-8153-af82f442a12a	77bde8e3-6499-424b-b5be-c08527274254	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	75	90	70	56	69	2025-10-22 10:04:47.755611
b9f450e7-c23a-4aed-92a0-5f5449aaaee9	77bde8e3-6499-424b-b5be-c08527274254	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	75	90	70	56	78	2025-10-22 10:04:47.755611
3bb0abf3-871d-479e-86c3-c521a37fbce9	77bde8e3-6499-424b-b5be-c08527274254	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	100	75	90	70	56	81	2025-10-22 10:04:47.755611
ef9aa839-3351-4073-bef7-739380c18f00	1573b4b0-d2f5-4233-a921-d389464b2652	7094bace-2d1c-4e11-a708-121f3f8c6448	100	30	80	70	58	69	2025-10-22 10:04:52.034671
0ba226be-f98c-42b1-b528-8f9c5eeb71e5	1573b4b0-d2f5-4233-a921-d389464b2652	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	30	80	70	58	69	2025-10-22 10:04:52.034671
244f885f-3e82-428a-b3df-baf66aa0a8bd	1573b4b0-d2f5-4233-a921-d389464b2652	74e40274-3010-4113-87ba-ef51accdb12d	80	30	80	70	58	63	2025-10-22 10:04:52.034671
1ab1cd26-eef4-418b-b25e-793a695b4c5c	1573b4b0-d2f5-4233-a921-d389464b2652	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	30	80	70	58	60	2025-10-22 10:04:52.034671
c20e3205-35fb-47b1-8fda-8672cc6da994	1573b4b0-d2f5-4233-a921-d389464b2652	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	30	80	70	58	60	2025-10-22 10:04:52.034671
7b65f623-ef9d-40af-bfd4-d97613456130	1573b4b0-d2f5-4233-a921-d389464b2652	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	30	80	70	58	69	2025-10-22 10:04:52.034671
59a1ad6f-c28e-4385-9c5f-6c4c2e50809a	1573b4b0-d2f5-4233-a921-d389464b2652	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	100	30	80	70	58	69	2025-10-22 10:04:52.034671
82af515d-895b-411c-8f02-c77ce9ad7412	6c0bd24e-14ca-4c80-b29c-71745928da50	7094bace-2d1c-4e11-a708-121f3f8c6448	100	45	30	60	46	62	2025-10-22 10:04:56.194443
8302ffb5-7677-48ec-b5df-556f8e3c9575	6c0bd24e-14ca-4c80-b29c-71745928da50	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	45	30	60	46	62	2025-10-22 10:04:56.194443
2d5712fc-5161-4f23-be34-71bddeffc3af	6c0bd24e-14ca-4c80-b29c-71745928da50	74e40274-3010-4113-87ba-ef51accdb12d	60	45	30	60	46	50	2025-10-22 10:04:56.194443
4655a3b1-ea5c-47c2-b31a-1a2b3c3c5897	6c0bd24e-14ca-4c80-b29c-71745928da50	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	45	30	60	46	59	2025-10-22 10:04:56.194443
ebb0e1dc-6d51-4ce9-95d2-af8245d232d0	6c0bd24e-14ca-4c80-b29c-71745928da50	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	45	30	60	46	62	2025-10-22 10:04:56.194443
f0c8c8f4-7ff6-470d-8554-743dafddd1f6	6c0bd24e-14ca-4c80-b29c-71745928da50	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	45	30	60	46	56	2025-10-22 10:04:56.194443
e308f61f-0f68-4d90-8ad4-bd3b1e3d8623	6c0bd24e-14ca-4c80-b29c-71745928da50	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	100	45	30	60	46	62	2025-10-22 10:04:56.194443
750ae40f-a035-40af-94f1-4091d1c6a636	d912c555-48dc-4e7e-966d-69dd759dbd67	7094bace-2d1c-4e11-a708-121f3f8c6448	80	45	100	60	54	67	2025-10-22 10:05:01.479508
b6effdfe-46e7-4072-b064-fdfe59476360	6c0bd24e-14ca-4c80-b29c-71745928da50	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	45	30	60	46	62	2025-10-22 10:04:56.194443
43e83824-764a-4165-9a63-dd7236047dd9	d912c555-48dc-4e7e-966d-69dd759dbd67	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	45	100	60	54	67	2025-10-22 10:05:01.479508
a6e4e1b5-43c3-416b-a748-120f23d64729	a2220d3a-edc0-4b94-b63e-6f15223d08f7	7094bace-2d1c-4e11-a708-121f3f8c6448	20	60	20	90	64	47	2025-10-22 10:05:14.320991
fe74d5e0-6644-41ba-bdd1-178547f3877f	d912c555-48dc-4e7e-966d-69dd759dbd67	74e40274-3010-4113-87ba-ef51accdb12d	60	45	100	60	54	61	2025-10-22 10:05:01.479508
5d42593f-bc4c-4734-bd6b-62614ba6f3df	d912c555-48dc-4e7e-966d-69dd759dbd67	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	45	100	60	54	70	2025-10-22 10:05:01.479508
1843e9c9-0e85-46f3-9fd4-030577b39c06	d912c555-48dc-4e7e-966d-69dd759dbd67	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	45	100	60	54	70	2025-10-22 10:05:01.479508
37335ab9-d8f3-4a65-845f-31099ce4ca32	d912c555-48dc-4e7e-966d-69dd759dbd67	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	45	100	60	54	61	2025-10-22 10:05:01.479508
8806338e-bd13-4cdd-a83d-bfe6df4b9a7c	d912c555-48dc-4e7e-966d-69dd759dbd67	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	45	100	60	54	67	2025-10-22 10:05:01.479508
e2bf22e8-9ffe-4c58-9345-ac31d435b612	233e5db9-17a5-4176-9ebf-a70ab0181294	7094bace-2d1c-4e11-a708-121f3f8c6448	60	30	100	80	68	63	2025-10-22 10:05:05.764353
c9aa3b7a-89e1-4ad8-84c1-9c9127a99473	233e5db9-17a5-4176-9ebf-a70ab0181294	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	30	100	80	68	69	2025-10-22 10:05:05.764353
8b641a2f-8657-4218-82c3-3eec8f35e21a	233e5db9-17a5-4176-9ebf-a70ab0181294	74e40274-3010-4113-87ba-ef51accdb12d	80	30	100	80	68	69	2025-10-22 10:05:05.764353
88b48ee8-96f1-4e88-b991-31130d0af5e7	233e5db9-17a5-4176-9ebf-a70ab0181294	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	30	100	80	68	63	2025-10-22 10:05:05.764353
c52f7e90-3f7c-4973-9962-22bf091eae56	233e5db9-17a5-4176-9ebf-a70ab0181294	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	30	100	80	68	69	2025-10-22 10:05:05.764353
6f2ba4e7-a436-4ff0-bd5a-19cbbc4e220b	a2220d3a-edc0-4b94-b63e-6f15223d08f7	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	60	20	90	64	59	2025-10-22 10:05:14.320991
46fbe874-0b71-4c0c-8169-10e98ffdc37f	233e5db9-17a5-4176-9ebf-a70ab0181294	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	30	100	80	68	69	2025-10-22 10:05:05.764353
12016826-ebcb-4a90-b808-97ecdd68628b	233e5db9-17a5-4176-9ebf-a70ab0181294	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	30	100	80	68	63	2025-10-22 10:05:05.764353
b3e4541e-fb7e-4b6c-8f11-c0b6cf1f992a	a2220d3a-edc0-4b94-b63e-6f15223d08f7	74e40274-3010-4113-87ba-ef51accdb12d	60	60	20	90	64	59	2025-10-22 10:05:14.320991
12a596ad-82d7-4906-b1f9-5ba609d666c4	233e5db9-17a5-4176-9ebf-a70ab0181294	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	30	100	80	68	69	2025-10-22 10:05:05.764353
8d11841c-09e0-4467-a946-bf07446ced54	56ae9458-2047-460e-a144-589720da6c92	7094bace-2d1c-4e11-a708-121f3f8c6448	50	60	20	80	58	54	2025-10-22 10:21:32.42312
a7f3b15a-4d4e-4d78-bd1e-233a718258b5	56ae9458-2047-460e-a144-589720da6c92	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	60	20	80	58	54	2025-10-22 10:21:32.42312
639dce98-544c-49d0-888e-0d0216e275c9	56ae9458-2047-460e-a144-589720da6c92	74e40274-3010-4113-87ba-ef51accdb12d	80	60	20	80	58	63	2025-10-22 10:21:32.42312
e78a23fa-449c-40ec-be85-857f69a1cb2e	56ae9458-2047-460e-a144-589720da6c92	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	60	20	80	58	66	2025-10-22 10:21:32.42312
40ea651f-4cc2-4fae-b6d6-ec3da200099a	56ae9458-2047-460e-a144-589720da6c92	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	60	20	80	58	66	2025-10-22 10:21:32.42312
e61983f4-0b5c-42c4-bd05-ed658a997599	308a9847-f5ea-42df-a771-7aba5195bd68	7094bace-2d1c-4e11-a708-121f3f8c6448	80	45	70	100	62	70	2025-10-22 10:05:18.609931
c1688a72-5fda-4f06-b9f6-ee2914f1bf8b	7b066287-4fd7-4149-bb8b-9c59096a664d	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	20	70	48	64	2025-10-22 08:47:16.451981
3f8f3e12-9394-4019-9e5d-025964d9c917	56ae9458-2047-460e-a144-589720da6c92	748bccfb-8b02-4052-9084-3e1bc103a2ca	70	60	20	80	58	60	2025-10-22 10:21:32.42312
e137e14b-6c39-4dfe-891e-cc4cb8d27d0b	7b066287-4fd7-4149-bb8b-9c59096a664d	74e40274-3010-4113-87ba-ef51accdb12d	50	100	20	70	48	61	2025-10-22 08:47:16.451981
3525f91a-07eb-4da5-9c81-16b81cf4808b	308a9847-f5ea-42df-a771-7aba5195bd68	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	45	70	100	62	76	2025-10-22 10:05:18.609931
bd1ea82d-75ff-468c-b55c-725b5259dd27	308a9847-f5ea-42df-a771-7aba5195bd68	74e40274-3010-4113-87ba-ef51accdb12d	60	45	70	100	62	64	2025-10-22 10:05:18.609931
9bf11103-9cbf-4680-8c0b-555019977f91	7f82c313-1e45-4860-8fa7-3cfc79e6f378	7094bace-2d1c-4e11-a708-121f3f8c6448	80	45	90	80	66	71	2025-10-22 10:05:23.084925
ca8934ed-d2dd-4755-8ada-8c6647770831	308a9847-f5ea-42df-a771-7aba5195bd68	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	45	70	100	62	64	2025-10-22 10:05:18.609931
abc9dad7-6ea8-466d-a922-d20f1b14d14f	308a9847-f5ea-42df-a771-7aba5195bd68	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	45	70	100	62	61	2025-10-22 10:05:18.609931
7d733abd-c45f-42c2-b4b6-aff027fbb27b	7f82c313-1e45-4860-8fa7-3cfc79e6f378	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	45	90	80	66	74	2025-10-22 10:05:23.084925
66c9e5ad-ea81-4127-a242-97965d9d227a	56ae9458-2047-460e-a144-589720da6c92	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	60	20	80	58	54	2025-10-22 10:21:32.42312
419d4853-0546-4b47-b507-bf2822a35ebb	7f82c313-1e45-4860-8fa7-3cfc79e6f378	74e40274-3010-4113-87ba-ef51accdb12d	60	45	90	80	66	65	2025-10-22 10:05:23.084925
505d7b6e-9fee-4c58-b2e7-a8a7e3d1f25b	7f82c313-1e45-4860-8fa7-3cfc79e6f378	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	45	90	80	66	71	2025-10-22 10:05:23.084925
8a29fa0b-4929-4b23-898b-7f7057260d3e	7f82c313-1e45-4860-8fa7-3cfc79e6f378	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	45	90	80	66	62	2025-10-22 10:05:23.084925
f974ab5e-3e8d-4fa2-9714-604ddeb97926	56ae9458-2047-460e-a144-589720da6c92	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	60	20	80	58	54	2025-10-22 10:21:32.42312
8e7db000-f73a-4677-b3e1-74859af8fa96	7f82c313-1e45-4860-8fa7-3cfc79e6f378	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	45	90	80	66	65	2025-10-22 10:05:23.084925
1155ec4b-e2a7-46a0-ba74-05ac3aa77514	c1d63475-0721-4bf5-b1d2-a19fd88051f3	7094bace-2d1c-4e11-a708-121f3f8c6448	40	30	80	90	68	55	2025-10-22 10:05:27.333051
4b5dc8f2-b3bc-449c-a511-cd09ee0aa85a	c1d63475-0721-4bf5-b1d2-a19fd88051f3	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	30	80	90	68	61	2025-10-22 10:05:27.333051
d1ccf70d-31f6-466b-a15a-1aa0d3d9f8ed	c1d63475-0721-4bf5-b1d2-a19fd88051f3	74e40274-3010-4113-87ba-ef51accdb12d	90	30	80	90	68	70	2025-10-22 10:05:27.333051
5057be69-de30-40f2-bc79-e42def671c92	c1d63475-0721-4bf5-b1d2-a19fd88051f3	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	30	80	90	68	70	2025-10-22 10:05:27.333051
39a27fac-6696-4867-bc21-579db500622e	c1d63475-0721-4bf5-b1d2-a19fd88051f3	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	30	80	90	68	73	2025-10-22 10:05:27.333051
b28fd2bc-dd1b-4dbd-a3f1-f91ea4b0fdf3	c1d63475-0721-4bf5-b1d2-a19fd88051f3	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	30	80	90	68	73	2025-10-22 10:05:27.333051
ef1a08af-3dc6-47cc-b45a-7ac5b75488e1	c1d63475-0721-4bf5-b1d2-a19fd88051f3	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	30	80	90	68	55	2025-10-22 10:05:27.333051
d445eec7-9fa8-413f-85d6-fa337fa86c2b	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	7094bace-2d1c-4e11-a708-121f3f8c6448	20	30	50	80	70	44	2025-10-22 10:05:31.481682
eac18953-3499-4bbf-a22e-a65c839ef56d	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	30	50	80	70	53	2025-10-22 10:05:31.481682
1c78b647-16b7-496a-a334-d2c3ce369afc	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	74e40274-3010-4113-87ba-ef51accdb12d	60	30	50	80	70	56	2025-10-22 10:05:31.481682
edc78c6d-2f53-4a96-91c4-d32942d93bcd	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	30	50	80	70	56	2025-10-22 10:05:31.481682
0a571d45-d62b-4d01-99f5-de72e138f77c	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	30	50	80	70	62	2025-10-22 10:05:31.481682
6cb57d31-86ce-40e5-a92e-adebe6b33125	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	30	50	80	70	65	2025-10-22 10:05:31.481682
5ecd8e75-94c4-4668-9598-80ef990894a9	93a3be11-bb34-4f71-a819-16c8e1ecb4e7	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	20	30	50	80	70	44	2025-10-22 10:05:31.481682
5c43a502-1a3c-46a5-b6dd-90e1ddf1f40b	fc0875fa-a672-4034-925e-5070a23d5dde	7094bace-2d1c-4e11-a708-121f3f8c6448	90	30	100	80	64	71	2025-10-22 10:05:35.951603
1bf5a0af-2ed1-4f09-9269-29b3198bbdb4	fc0875fa-a672-4034-925e-5070a23d5dde	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	30	100	80	64	71	2025-10-22 10:05:35.951603
b76c4087-8218-4af9-b1f1-be57d507a03b	fc0875fa-a672-4034-925e-5070a23d5dde	74e40274-3010-4113-87ba-ef51accdb12d	100	30	100	80	64	74	2025-10-22 10:05:35.951603
e26bb135-92eb-46e8-ad33-8ffdd6102d39	fc0875fa-a672-4034-925e-5070a23d5dde	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	30	100	80	64	65	2025-10-22 10:05:35.951603
51a8a539-2bf6-4cde-8bb2-9b75d785ec9d	fc0875fa-a672-4034-925e-5070a23d5dde	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	30	100	80	64	68	2025-10-22 10:05:35.951603
0aec6a80-a4f8-41b7-a28e-b183ab54f188	fc0875fa-a672-4034-925e-5070a23d5dde	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	30	100	80	64	71	2025-10-22 10:05:35.951603
cca1fdb1-c963-4d4f-a732-a48ff4484a40	fc0875fa-a672-4034-925e-5070a23d5dde	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	30	100	80	64	71	2025-10-22 10:05:35.951603
5f91dd6e-fad4-4a04-afeb-085bb753a5d2	c6f40f33-aebe-4842-a810-1454b5765789	7094bace-2d1c-4e11-a708-121f3f8c6448	90	30	100	80	66	71	2025-10-22 10:05:40.200948
9cbd2cad-b2e2-4cfd-9051-05d8bd1fa2a9	c6f40f33-aebe-4842-a810-1454b5765789	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	30	100	80	66	74	2025-10-22 10:05:40.200948
4e375893-dc9b-4c66-8725-3345af77e01e	c6f40f33-aebe-4842-a810-1454b5765789	74e40274-3010-4113-87ba-ef51accdb12d	100	30	100	80	66	74	2025-10-22 10:05:40.200948
5e3827b0-2562-4f89-a30c-51fe2419df59	c6f40f33-aebe-4842-a810-1454b5765789	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	30	100	80	66	68	2025-10-22 10:05:40.200948
3e5f7373-647c-401c-91cc-61a424e634b0	c6f40f33-aebe-4842-a810-1454b5765789	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	30	100	80	66	68	2025-10-22 10:05:40.200948
d463fc74-d862-45b4-9d51-93f0bc9f113e	c6f40f33-aebe-4842-a810-1454b5765789	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	30	100	80	66	71	2025-10-22 10:05:40.200948
14c30dfd-acc9-4e1e-a25e-c4d9ff8538ba	c6f40f33-aebe-4842-a810-1454b5765789	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	30	100	80	66	71	2025-10-22 10:05:40.200948
03409ed7-c98c-4c5e-8b5c-427190d7bd69	c6f40f33-aebe-4842-a810-1454b5765789	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	30	100	80	66	74	2025-10-22 10:05:40.200948
420d1efd-f5da-4121-a484-a9e444dabc9d	cca3e83c-81e1-44b5-98c7-920d668fa450	7094bace-2d1c-4e11-a708-121f3f8c6448	50	30	90	70	56	55	2025-10-22 10:05:44.431322
2037d19f-8913-4368-8790-ad7569a2aa65	cca3e83c-81e1-44b5-98c7-920d668fa450	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	70	30	90	70	56	61	2025-10-22 10:05:44.431322
92582252-4baa-4fed-9402-17f6bd03c9ee	cca3e83c-81e1-44b5-98c7-920d668fa450	74e40274-3010-4113-87ba-ef51accdb12d	90	30	90	70	56	67	2025-10-22 10:05:44.431322
13b54a7a-056a-46a6-849c-d8b831d8a1cf	cca3e83c-81e1-44b5-98c7-920d668fa450	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	30	90	70	56	67	2025-10-22 10:05:44.431322
6703cdb3-8c5d-4a99-8508-d85dad516ede	cca3e83c-81e1-44b5-98c7-920d668fa450	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	30	90	70	56	70	2025-10-22 10:05:44.431322
bd8b4c99-1fae-40e6-8f53-d6b8cd40ccac	cca3e83c-81e1-44b5-98c7-920d668fa450	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	30	90	70	56	64	2025-10-22 10:05:44.431322
da85cc04-67bb-48c2-81f7-c0bd785a7dd2	cca3e83c-81e1-44b5-98c7-920d668fa450	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	30	90	70	56	55	2025-10-22 10:05:44.431322
2bb3883d-5f3d-4bdb-b40e-82042c465e3d	de8907fb-039d-413e-9c03-920965ce771f	7094bace-2d1c-4e11-a708-121f3f8c6448	90	15	30	70	52	54	2025-10-22 10:05:48.563938
8d0e68a5-6f7c-4062-967b-92d3d1d58e31	de8907fb-039d-413e-9c03-920965ce771f	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	15	30	70	52	57	2025-10-22 10:05:48.563938
97ae49c2-84d4-45ac-bb66-c343a8107c40	de8907fb-039d-413e-9c03-920965ce771f	74e40274-3010-4113-87ba-ef51accdb12d	80	15	30	70	52	51	2025-10-22 10:05:48.563938
b2ce56fb-2859-479a-9b9e-e4c0cc434577	de8907fb-039d-413e-9c03-920965ce771f	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	15	30	70	52	45	2025-10-22 10:05:48.563938
2511d097-a92a-4427-abb6-8e2fb15d660a	de8907fb-039d-413e-9c03-920965ce771f	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	15	30	70	52	48	2025-10-22 10:05:48.563938
219ee468-ce86-4a95-b875-2c229c8fea9c	de8907fb-039d-413e-9c03-920965ce771f	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	15	30	70	52	51	2025-10-22 10:05:48.563938
84c4e927-4a70-432a-bd16-619f2740804e	de8907fb-039d-413e-9c03-920965ce771f	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	15	30	70	52	54	2025-10-22 10:05:48.563938
70661c99-e96e-47d1-8056-831a8ac5babd	da22f443-5e49-4961-8f29-172c69689f8f	7094bace-2d1c-4e11-a708-121f3f8c6448	90	15	50	60	48	54	2025-10-22 10:05:52.746026
130a180b-e034-4542-8ca5-002f23ac6ddf	7b066287-4fd7-4149-bb8b-9c59096a664d	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	100	20	70	48	64	2025-10-22 08:47:16.451981
4b636667-844e-4698-a3b2-719ed91761c0	7b066287-4fd7-4149-bb8b-9c59096a664d	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	100	20	70	48	64	2025-10-22 08:47:16.451981
fd836ce6-5346-4fcb-b4b9-8762b79b7b96	7b066287-4fd7-4149-bb8b-9c59096a664d	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	20	70	48	58	2025-10-22 08:47:16.451981
5334b30c-4b22-4565-af1b-5f4763c1c29a	7b066287-4fd7-4149-bb8b-9c59096a664d	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	20	70	48	58	2025-10-22 08:47:16.451981
db2723aa-95ff-49ff-b085-a7c5fb56cce3	da22f443-5e49-4961-8f29-172c69689f8f	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	15	50	60	48	57	2025-10-22 10:05:52.746026
234e72d0-a04e-4434-84f3-dabecae22990	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	7094bace-2d1c-4e11-a708-121f3f8c6448	80	15	90	90	72	66	2025-10-22 10:05:57.032088
9fe2e221-44f5-4955-801b-5416c9a79c3e	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	15	90	90	72	69	2025-10-22 10:05:57.032088
1eb2dc71-6126-46be-a0a1-0f8ebdac6be1	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	74e40274-3010-4113-87ba-ef51accdb12d	80	15	90	90	72	66	2025-10-22 10:05:57.032088
888b9668-6dab-4f2d-a437-8f4e7d871fcc	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	15	90	90	72	66	2025-10-22 10:05:57.032088
fc671a84-085f-4f26-ad25-38cefae006d4	a0da746c-34bf-41ec-a76d-8ba13eea02fa	7094bace-2d1c-4e11-a708-121f3f8c6448	90	15	60	90	68	63	2025-10-22 10:06:01.289138
c696217a-6280-4abb-9f23-dcfb4c4a9b89	a0da746c-34bf-41ec-a76d-8ba13eea02fa	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	100	15	60	90	68	66	2025-10-22 10:06:01.289138
9203c4a6-3008-4cbe-a8f4-d686c64ac64b	a0da746c-34bf-41ec-a76d-8ba13eea02fa	74e40274-3010-4113-87ba-ef51accdb12d	80	15	60	90	68	60	2025-10-22 10:06:01.289138
ea13b64f-51b4-4afd-ae6e-c91dfea8f5fa	a0da746c-34bf-41ec-a76d-8ba13eea02fa	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	15	60	90	68	51	2025-10-22 10:06:01.289138
e04d786c-6f09-4dfc-ab8b-eaba9726f0a6	a0da746c-34bf-41ec-a76d-8ba13eea02fa	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	15	60	90	68	60	2025-10-22 10:06:01.289138
2dd67246-dd4d-4bcb-85f0-2c66ee593c96	a0da746c-34bf-41ec-a76d-8ba13eea02fa	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	15	60	90	68	60	2025-10-22 10:06:01.289138
9c3d4729-56e2-47ca-acaa-60c1c705d217	a0da746c-34bf-41ec-a76d-8ba13eea02fa	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	15	60	90	68	63	2025-10-22 10:06:01.289138
884d2ef9-2bff-4cad-a381-2dc1afe74fd9	26ea7651-8b3a-4860-9615-cfd2daa5da7e	7094bace-2d1c-4e11-a708-121f3f8c6448	80	15	90	90	64	64	2025-10-22 10:06:05.536165
8f1df9e5-5430-487f-b236-23db0c6be11e	26ea7651-8b3a-4860-9615-cfd2daa5da7e	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	90	15	90	90	64	67	2025-10-22 10:06:05.536165
95953abe-9e81-4c10-a263-6030cf5a49ba	26ea7651-8b3a-4860-9615-cfd2daa5da7e	74e40274-3010-4113-87ba-ef51accdb12d	90	15	90	90	64	67	2025-10-22 10:06:05.536165
c90b17d1-0945-4eb3-aeee-c329e4383c00	26ea7651-8b3a-4860-9615-cfd2daa5da7e	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	15	90	90	64	61	2025-10-22 10:06:05.536165
5225881f-9f6a-4828-a789-50f6070f61e9	26ea7651-8b3a-4860-9615-cfd2daa5da7e	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	15	90	90	64	67	2025-10-22 10:06:05.536165
c92c3c9d-dff5-4554-b22e-c8a565b29704	26ea7651-8b3a-4860-9615-cfd2daa5da7e	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	15	90	90	64	67	2025-10-22 10:06:05.536165
2881bcc2-c820-4e0a-a1a9-9bec997e4f46	26ea7651-8b3a-4860-9615-cfd2daa5da7e	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	15	90	90	64	64	2025-10-22 10:06:05.536165
8016a5ac-c2ce-4f8b-9f3c-e848f484e88c	759e1ea0-6f6e-4748-bcff-feed6971984d	7094bace-2d1c-4e11-a708-121f3f8c6448	60	15	100	80	58	57	2025-10-22 10:06:09.785535
fb0b1ba8-f29b-4000-8ce5-15c856986106	759e1ea0-6f6e-4748-bcff-feed6971984d	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	15	100	80	58	57	2025-10-22 10:06:09.785535
65e36b12-c81c-45b2-9fdb-c4b9ac6f6d1e	759e1ea0-6f6e-4748-bcff-feed6971984d	74e40274-3010-4113-87ba-ef51accdb12d	90	15	100	80	58	66	2025-10-22 10:06:09.785535
685d6437-e144-47ab-9496-69307873e303	759e1ea0-6f6e-4748-bcff-feed6971984d	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	15	100	80	58	69	2025-10-22 10:06:09.785535
4c7afbff-a187-4508-b370-de201140de3d	759e1ea0-6f6e-4748-bcff-feed6971984d	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	15	100	80	58	66	2025-10-22 10:06:09.785535
dc1998d0-0d71-458b-9ab0-8ec5506aa06d	759e1ea0-6f6e-4748-bcff-feed6971984d	748bccfb-8b02-4052-9084-3e1bc103a2ca	100	15	100	80	58	69	2025-10-22 10:06:09.785535
cdc6f5b8-9bf3-4067-862c-46b650e1592b	759e1ea0-6f6e-4748-bcff-feed6971984d	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	15	100	80	58	57	2025-10-22 10:06:09.785535
be6ce5a3-8b96-45cf-a6d6-4bba4a939a33	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	7094bace-2d1c-4e11-a708-121f3f8c6448	50	15	70	90	66	53	2025-10-22 10:06:14.291594
6a08f315-d176-43de-806a-1895f3b1d418	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	15	70	90	66	53	2025-10-22 10:06:14.291594
e5ac1c67-ffa0-4359-a0d9-3d7737c76af2	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	74e40274-3010-4113-87ba-ef51accdb12d	70	15	70	90	66	59	2025-10-22 10:06:14.291594
b64b3645-2575-44b0-b7ba-97c10acfd4fd	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	40	15	70	90	66	50	2025-10-22 10:06:14.291594
1381c2cd-1957-4bb9-927b-90076e061846	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	15	70	90	66	53	2025-10-22 10:06:14.291594
ad5e2109-749d-450f-ba75-2fc12eeca452	2d523087-d3c7-4703-ad6f-41446739da7e	7094bace-2d1c-4e11-a708-121f3f8c6448	80	15	60	80	64	58	2025-10-22 10:06:18.592447
1a5bb7d4-5aa0-42f5-97a8-d1d9bc92f674	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	70	90	66	56	2025-10-22 10:06:14.291594
9d56b8bd-1b00-41b5-97c0-8c23d07abea1	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	15	70	90	66	53	2025-10-22 10:06:14.291594
ae40aa06-beac-4d96-9123-1cf8385f759f	bd56db35-e936-4a2f-9b9a-4f0dbdce449b	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	15	70	90	66	53	2025-10-22 10:06:14.291594
ea1d17a3-0802-4220-a07c-a1e934ae2b5a	2d523087-d3c7-4703-ad6f-41446739da7e	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	70	15	60	80	64	55	2025-10-22 10:06:18.592447
1fbdf427-f673-44bb-beef-bddbf31c06fa	2d523087-d3c7-4703-ad6f-41446739da7e	74e40274-3010-4113-87ba-ef51accdb12d	70	15	60	80	64	55	2025-10-22 10:06:18.592447
6c76e4dc-179b-42ff-8b0e-c4d315f5b919	2d523087-d3c7-4703-ad6f-41446739da7e	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	20	15	60	80	64	40	2025-10-22 10:06:18.592447
09746514-73fb-4f6e-b229-836f30041796	2d523087-d3c7-4703-ad6f-41446739da7e	748ccce7-9e36-4a8f-84c6-55af30e31f4c	20	15	60	80	64	40	2025-10-22 10:06:18.592447
bed2d254-a1ca-42f8-8206-8efecf78c790	2d523087-d3c7-4703-ad6f-41446739da7e	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	15	60	80	64	46	2025-10-22 10:06:18.592447
c0b53d25-acf4-447f-a529-94c1a463ccbb	2d523087-d3c7-4703-ad6f-41446739da7e	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	15	60	80	64	58	2025-10-22 10:06:18.592447
c29f2ad7-853e-4932-9a40-20b7cceb90e2	909cd680-5725-4941-8ae5-a2ce18f4ca29	7094bace-2d1c-4e11-a708-121f3f8c6448	50	15	100	70	62	54	2025-10-22 10:06:22.685742
0fb00a43-958a-4d24-b168-2622befc3df8	909cd680-5725-4941-8ae5-a2ce18f4ca29	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	50	15	100	70	62	54	2025-10-22 10:06:22.685742
a54a7165-5990-4554-9c5e-31e7dd5c92a1	909cd680-5725-4941-8ae5-a2ce18f4ca29	74e40274-3010-4113-87ba-ef51accdb12d	80	15	100	70	62	63	2025-10-22 10:06:22.685742
d3f43b1e-edaf-48e4-8749-3ec7fb218387	909cd680-5725-4941-8ae5-a2ce18f4ca29	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	15	100	70	62	57	2025-10-22 10:06:22.685742
e73c8a18-b61f-45ab-ac0f-a9adf71974cc	909cd680-5725-4941-8ae5-a2ce18f4ca29	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	15	100	70	62	57	2025-10-22 10:06:22.685742
409c5d87-0c38-4d12-8820-c7cacbefee60	909cd680-5725-4941-8ae5-a2ce18f4ca29	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	100	70	62	57	2025-10-22 10:06:22.685742
25d17619-e170-4afb-9791-ef158138c71d	909cd680-5725-4941-8ae5-a2ce18f4ca29	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	15	100	70	62	54	2025-10-22 10:06:22.685742
2f0b31f4-7fb9-4bf2-be9b-0532d66dac6f	909cd680-5725-4941-8ae5-a2ce18f4ca29	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	15	100	70	62	54	2025-10-22 10:06:22.685742
69358c78-d630-4cfd-85b4-3ed5357ae535	889dc3df-b948-4b04-9c1c-0d9384027b7f	7094bace-2d1c-4e11-a708-121f3f8c6448	60	15	100	60	82	58	2025-10-22 10:06:26.780103
bbb473d2-1067-420a-8527-19d9f7d09543	889dc3df-b948-4b04-9c1c-0d9384027b7f	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	15	100	60	82	64	2025-10-22 10:06:26.780103
80cfa2d8-f820-4299-a066-396f4b2894f9	889dc3df-b948-4b04-9c1c-0d9384027b7f	74e40274-3010-4113-87ba-ef51accdb12d	60	15	100	60	82	58	2025-10-22 10:06:26.780103
233475cf-2f38-445d-9dee-bb07d79108da	889dc3df-b948-4b04-9c1c-0d9384027b7f	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	15	100	60	82	64	2025-10-22 10:06:26.780103
67b6ee17-489b-4489-ac35-38ec1b9504a0	889dc3df-b948-4b04-9c1c-0d9384027b7f	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	15	100	60	82	61	2025-10-22 10:06:26.780103
1d4ed267-44cd-4f49-aa46-51e9790772c3	889dc3df-b948-4b04-9c1c-0d9384027b7f	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	100	60	82	58	2025-10-22 10:06:26.780103
286d9105-d43d-4768-a077-36db46939cc2	889dc3df-b948-4b04-9c1c-0d9384027b7f	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	15	100	60	82	58	2025-10-22 10:06:26.780103
1f9adb3f-18b6-48b4-83dc-c965113ea0a7	21efc7c2-226e-4e70-ae43-276f5e08fb09	7094bace-2d1c-4e11-a708-121f3f8c6448	60	30	100	70	78	63	2025-10-22 10:05:10.112754
0ff35970-2e5e-4625-93ba-8b1253a231df	5a7f78e6-08af-46ee-8b5c-7c977948c82f	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	60	80	90	76	76	2025-10-22 10:21:29.730571
c922fa76-0668-4601-bc24-a78f1676b4ac	a582aaba-fda9-44cb-ab72-c6bc346b210c	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	30	30	60	45	58	2025-10-22 10:02:54.652978
8c34e061-e8b2-4297-80df-27fe1148ebbd	58006810-48b3-4b09-9e4a-cce139f122d3	74e40274-3010-4113-87ba-ef51accdb12d	50	90	20	60	42	56	2025-10-22 08:48:41.169152
681be823-18a4-4f08-9c26-906bdde9c4f9	4d09e521-8224-4513-82fa-a6b42af3dcd6	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	70	70	54	72	2025-10-22 08:49:32.538622
c00c5054-373c-48bd-8f44-e58e24361007	f1af3688-db90-4f1b-a893-ceb12e4abebf	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	20	80	54	66	2025-10-22 08:48:09.010286
bd1fa16a-3c8a-46e7-a008-c7760206c533	ee1ba396-efeb-414f-8a30-29f9c03d6bfe	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	30	80	58	68	2025-10-22 08:47:35.425079
bd893e08-927d-486d-b581-680478cbb9d3	5a7f78e6-08af-46ee-8b5c-7c977948c82f	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	100	60	80	90	76	82	2025-10-22 10:21:29.730571
375f4a8e-0f89-483d-a326-ef7cad08cb62	58006810-48b3-4b09-9e4a-cce139f122d3	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	70	90	20	60	42	62	2025-10-22 08:48:41.169152
882b2a1a-ee60-4951-b8c2-cfa51d62c1ea	58006810-48b3-4b09-9e4a-cce139f122d3	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	90	20	60	42	71	2025-10-22 08:48:41.169152
4e26269b-7c27-44fb-8186-9388fbe76551	58006810-48b3-4b09-9e4a-cce139f122d3	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	90	20	60	42	56	2025-10-22 08:48:41.169152
2fea70e0-c009-4547-8263-11d4df6cfe9e	78c34395-9186-472b-b93a-58fc587ca0f3	7094bace-2d1c-4e11-a708-121f3f8c6448	20	90	20	70	50	50	2025-10-22 08:47:12.017596
e099a2e4-8aa0-4fb5-a627-7aa039722606	78c34395-9186-472b-b93a-58fc587ca0f3	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	20	90	20	70	50	50	2025-10-22 08:47:12.017596
9f0f34cc-dfe6-4ffd-ad5e-32b28546c703	78c34395-9186-472b-b93a-58fc587ca0f3	74e40274-3010-4113-87ba-ef51accdb12d	20	90	20	70	50	50	2025-10-22 08:47:12.017596
0e231db6-3a26-496a-82c1-10b3250091c9	78c34395-9186-472b-b93a-58fc587ca0f3	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	20	90	20	70	50	50	2025-10-22 08:47:12.017596
4030bd7e-2680-4d4a-a63d-2b7469438581	78c34395-9186-472b-b93a-58fc587ca0f3	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	90	20	70	50	59	2025-10-22 08:47:12.017596
63629ec1-d2dd-469e-b444-2a82cb578e11	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	7094bace-2d1c-4e11-a708-121f3f8c6448	50	90	30	80	55	62	2025-10-22 08:46:53.296304
99210c1c-d61a-4618-9cfc-f57f8ae0eeb2	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	90	30	80	55	65	2025-10-22 08:46:53.296304
b0bede84-6de7-4244-a070-6c223a44af48	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	74e40274-3010-4113-87ba-ef51accdb12d	60	90	30	80	55	65	2025-10-22 08:46:53.296304
c9d5abf2-99c4-4d5f-95c4-e423a3b3a0bd	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	60	90	30	80	55	65	2025-10-22 08:46:53.296304
160c5c6e-0dd9-41c4-9061-8954a79740ec	5ba9d8a5-e734-47ee-88d6-ddfd39204ca8	748ccce7-9e36-4a8f-84c6-55af30e31f4c	70	90	30	80	55	68	2025-10-22 08:46:53.296304
49657c2a-b0d8-42f9-95e9-1f35e6e32a8e	5a7f78e6-08af-46ee-8b5c-7c977948c82f	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	60	80	90	76	82	2025-10-22 10:21:29.730571
d7521b7a-53b9-4c37-85a9-8d3885a5e1af	7b066287-4fd7-4149-bb8b-9c59096a664d	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	20	70	48	64	2025-10-22 08:47:16.451981
826c655a-312f-4501-bbd9-632647a91972	78c34395-9186-472b-b93a-58fc587ca0f3	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	90	20	70	50	56	2025-10-22 08:47:12.017596
fa2f939f-dc28-43e5-af27-b9dfb3b3ebf3	78c34395-9186-472b-b93a-58fc587ca0f3	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	20	90	20	70	50	50	2025-10-22 08:47:12.017596
7533f24e-8992-4bc6-b833-f1de92d4a61f	78c34395-9186-472b-b93a-58fc587ca0f3	e8178bc7-bddd-4e89-bfea-8bd8cc618613	20	90	20	70	50	50	2025-10-22 08:47:12.017596
6a883de7-258c-4e01-83b6-cdcd4995b983	b35896d8-a00b-4d6b-be31-215b59fae616	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	30	70	58	67	2025-10-22 08:48:54.651935
d9e29d82-6922-441c-a61d-6e95795410de	78486986-b3e9-49d4-b1e4-9113a38b21ed	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	20	60	45	56	2025-10-22 08:48:36.649351
51011865-6e75-47e2-92d0-179fe39a59bf	968d1662-490e-408e-941d-d03e11ebc507	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	20	80	65	65	2025-10-22 08:48:18.158765
1ea35741-4cc7-44d3-b23a-be5df4c3c7ff	ea431f38-c1da-433b-ba90-51bd7fee1a3e	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	30	80	62	69	2025-10-22 08:47:45.180547
3463f319-b781-4021-a675-6b1c0afc153d	753bc31b-0e39-4b59-bc04-e0d266b1abc8	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	30	90	70	54	67	2025-10-22 10:02:45.01391
71382fb4-739c-4c5b-9cfe-7cb7b5e2cd18	a42651c6-4071-492e-8c3b-f271e2142216	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	60	70	80	74	79	2025-10-22 10:01:28.523312
f9236aaa-34f9-49ef-8ef7-ea60a7411955	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	80	90	40	70	56	71	2025-10-22 08:49:23.223439
ccfb393d-e0b5-47c4-91ce-b07c059bcbd7	78486986-b3e9-49d4-b1e4-9113a38b21ed	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	90	20	60	45	56	2025-10-22 08:48:36.649351
e11cbb60-6d7a-4f96-a1de-3a4d9643e62f	2fd0938b-847f-4609-9f43-1db7708ed8f0	74e40274-3010-4113-87ba-ef51accdb12d	50	15	50	80	50	46	2025-10-22 10:03:10.357796
1a5c88fc-a1e7-4753-b9f2-a870a7e1d31b	280ef307-84b2-4a03-b406-90255c159d25	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	30	70	52	66	2025-10-22 08:47:26.375032
7f915034-8d7c-48b4-bbc5-94671cc22952	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	74e40274-3010-4113-87ba-ef51accdb12d	100	90	40	70	56	77	2025-10-22 08:49:23.223439
5e9ea86f-b6fc-4a12-864a-d70348b72ef4	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	100	90	40	70	56	77	2025-10-22 08:49:23.223439
4756d6cb-ce11-45cb-a72c-e745dc510c06	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	748ccce7-9e36-4a8f-84c6-55af30e31f4c	80	90	40	70	56	71	2025-10-22 08:49:23.223439
f6deae0c-dcd6-41fd-8c67-43b825bbc3f6	ae4bfff9-b173-44c7-b911-07148be73b72	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	80	70	64	81	2025-10-22 08:47:54.215963
a96002bf-6182-4cf7-ba65-852e5466a718	ae4bfff9-b173-44c7-b911-07148be73b72	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	100	80	70	64	87	2025-10-22 08:47:54.215963
e68cdb9a-1caf-4feb-a359-6c462fd80064	cbf0915e-da75-48b2-b85a-da06992d1b0b	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	20	80	58	64	2025-10-22 08:49:27.940098
e1454c25-c593-483b-aa82-377a05491bce	ae4bfff9-b173-44c7-b911-07148be73b72	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	100	80	70	64	81	2025-10-22 08:47:54.215963
ac69dae1-df5b-4378-85a5-686187b292e6	95691984-3e58-4dec-9640-01c57ab9ac8a	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	100	30	60	45	75	2025-10-22 08:47:21.440038
9de6ab0d-892f-4bd3-9b1f-e5e8959252ac	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	81ad8f7c-d7cb-446b-ae5f-c11e6566875a	60	100	30	70	58	67	2025-10-22 08:47:59.640189
d73fb44e-7d20-41c9-a7da-66823909661e	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	74e40274-3010-4113-87ba-ef51accdb12d	70	100	30	70	58	70	2025-10-22 08:47:59.640189
1a48caeb-c30c-4b1a-a1bb-4714a837aae0	f5409693-946e-47c5-8f04-0babe818f750	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	20	70	52	64	2025-10-22 08:48:27.540207
830b6bbd-75be-4e4e-aada-7a7038287dac	def70aeb-2af9-4e04-a014-d5d2bc0010a7	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	90	90	70	75	73	2025-10-22 08:49:18.368103
6dc8c668-4106-40ff-a531-edbdb6feefb9	c41bab8a-909c-46b3-9c7f-daba35f04b3e	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	40	80	68	71	2025-10-22 08:48:45.583362
c8c23079-2a5d-4196-8810-2eb25a1dcc6d	538f180b-716f-4539-96e4-e47d79a02d86	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	100	20	80	60	64	2025-10-22 08:48:04.230477
6359ba10-ef76-4cc6-9ab7-4aefb1bd05e9	2b6552a5-7838-4bbf-aa5a-503f34ef8637	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	30	70	62	65	2025-10-22 08:49:03.998693
0135e6f0-f3db-44cd-a135-0f63e0ca781c	2fd0938b-847f-4609-9f43-1db7708ed8f0	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	15	50	80	50	46	2025-10-22 10:03:10.357796
be9e4004-3e14-4d04-81da-ed14c7972059	58006810-48b3-4b09-9e4a-cce139f122d3	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	90	20	60	42	56	2025-10-22 08:48:41.169152
e36efd8b-e044-46f4-ae64-544cfc657f97	ae4bfff9-b173-44c7-b911-07148be73b72	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	80	70	64	72	2025-10-22 08:47:54.215963
24912dd3-6572-4371-ab92-d4af04661db1	dbb0fac7-ca77-4a4a-b2bc-f13145b5483d	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	90	60	60	52	66	2025-10-22 08:49:13.728394
ff4d12c5-c669-4d31-bdc6-f44673f38eda	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	90	40	70	56	74	2025-10-22 08:49:23.223439
8e826884-edaf-4a80-afaa-c5fd7ef9f262	2fd0938b-847f-4609-9f43-1db7708ed8f0	748ccce7-9e36-4a8f-84c6-55af30e31f4c	50	15	50	80	50	46	2025-10-22 10:03:10.357796
dea27ae2-446c-431a-bfb9-c3da42e015ed	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	30	70	58	61	2025-10-22 08:47:59.640189
b61148c7-850a-46fd-a391-921a29ef0317	62f8e02a-e96e-4d17-a3e2-1e4b21f0cf67	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	90	40	70	56	71	2025-10-22 08:49:23.223439
88747d4e-59b3-4cf6-8e84-e35945a76e67	ae4bfff9-b173-44c7-b911-07148be73b72	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	80	70	64	75	2025-10-22 08:47:54.215963
300b8045-69e1-4d33-91fc-cab552c7cd94	62db09a1-adc2-4359-bdb0-8b272a6acc47	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	30	90	80	56	68	2025-10-22 10:02:40.077853
be5cfc55-c56d-4a2c-83e6-31dd2bd1127b	fefb26e2-8f48-4be8-995f-b27d70d356a9	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	15	90	80	64	57	2025-10-22 10:03:05.126387
99a7b18f-b5b8-4f2b-8aa1-cbb474d4bdd2	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	100	30	70	58	61	2025-10-22 08:47:59.640189
6be5731f-abfa-4827-91ce-8a29030d3e75	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	100	30	70	58	67	2025-10-22 08:47:59.640189
fea03482-0406-4e8c-8959-7ef55fe44aa1	2fd0938b-847f-4609-9f43-1db7708ed8f0	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	15	50	80	50	49	2025-10-22 10:03:10.357796
7ba0f77b-e097-4ee7-8edc-455ccd626582	020585b3-fd9b-4d1b-bff9-365b4d108d3a	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	30	20	80	56	49	2025-10-22 10:03:56.006751
78610f4e-0739-4131-8e12-18ef2e42b0d4	21efc7c2-226e-4e70-ae43-276f5e08fb09	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	30	100	70	78	63	2025-10-22 10:05:10.112754
a8127f74-c68c-4ece-b5ba-9bd554207704	99616273-bdf3-4c3d-a934-baeed91e1011	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	15	90	80	58	65	2025-10-22 10:03:51.904462
ae0e6a15-a00f-4fe7-b342-0b2d2d68f59d	99616273-bdf3-4c3d-a934-baeed91e1011	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	40	15	90	80	58	50	2025-10-22 10:03:51.904462
b1cb2428-e3ce-442e-ac47-4be0e85046bf	52e5f7b4-2418-49b7-a26e-728b5eaf1747	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	15	70	70	48	50	2025-10-22 10:03:19.79171
8b75fddf-3ccc-4156-9f1d-a59e8ff42fac	f044a094-f9ef-42ea-80fa-b66e5b7104ba	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	15	90	70	52	54	2025-10-22 10:03:15.081595
da0f3a55-9e75-411b-88aa-27f25c9ff6d8	99616273-bdf3-4c3d-a934-baeed91e1011	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	15	90	80	58	62	2025-10-22 10:03:51.904462
1ee01022-eda8-40c5-b027-135174a94a03	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	80	100	30	70	58	73	2025-10-22 08:47:59.640189
49150b3f-20dd-4c94-bce4-5f6ac5373840	91b54feb-5c07-4c9e-9d67-e5f9a0849f76	748ccce7-9e36-4a8f-84c6-55af30e31f4c	100	100	30	70	58	79	2025-10-22 08:47:59.640189
7a3ac5fb-d152-4f1d-be44-454474a78fc6	f044a094-f9ef-42ea-80fa-b66e5b7104ba	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	15	90	70	52	60	2025-10-22 10:03:15.081595
e703dde4-03d6-4108-bb7b-6d8d94f72d33	da22f443-5e49-4961-8f29-172c69689f8f	748ccce7-9e36-4a8f-84c6-55af30e31f4c	90	15	50	60	48	54	2025-10-22 10:05:52.746026
cdf50ace-ba04-447c-95ca-c0241eff2d2b	308a9847-f5ea-42df-a771-7aba5195bd68	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	45	70	100	62	76	2025-10-22 10:05:18.609931
eb236803-a91c-4e38-976d-8f0d93e98c12	a2220d3a-edc0-4b94-b63e-6f15223d08f7	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	60	20	90	64	59	2025-10-22 10:05:14.320991
7049f488-9ce2-47aa-8456-f0491e275722	de8907fb-039d-413e-9c03-920965ce771f	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	15	30	70	52	57	2025-10-22 10:05:48.563938
237cfe89-f007-4e3b-9491-ccf880de8ae6	da22f443-5e49-4961-8f29-172c69689f8f	748bccfb-8b02-4052-9084-3e1bc103a2ca	90	15	50	60	48	54	2025-10-22 10:05:52.746026
ab03ce53-6650-4110-bd5d-744054075374	cca3e83c-81e1-44b5-98c7-920d668fa450	e8178bc7-bddd-4e89-bfea-8bd8cc618613	70	30	90	70	56	61	2025-10-22 10:05:44.431322
6d1041ce-226f-4fe2-b6af-f50603ef5d3b	853f4a5b-9f62-40d4-89b3-e6ced9799b43	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	30	30	90	62	53	2025-10-22 10:03:47.73476
fbd40a9c-0595-4695-bf5e-958869626c3e	fc0875fa-a672-4034-925e-5070a23d5dde	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	30	100	80	64	71	2025-10-22 10:05:35.951603
ac7e054f-2b39-47af-804d-ec2967bcee59	7f82c313-1e45-4860-8fa7-3cfc79e6f378	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	45	90	80	66	74	2025-10-22 10:05:23.084925
68fc244e-bad9-45e6-bb09-18de29e6d28c	c1d63475-0721-4bf5-b1d2-a19fd88051f3	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	30	80	90	68	61	2025-10-22 10:05:27.333051
cb59ba40-3102-4edd-b048-e30533e3c6ac	2fd0938b-847f-4609-9f43-1db7708ed8f0	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	15	50	80	50	49	2025-10-22 10:03:10.357796
471c0081-75ef-446d-8dae-2659f971e71c	21efc7c2-226e-4e70-ae43-276f5e08fb09	748bccfb-8b02-4052-9084-3e1bc103a2ca	60	30	100	70	78	63	2025-10-22 10:05:10.112754
b1d4a25f-edda-484d-a31a-360c069b61d6	fa435d58-ea7b-493f-8956-52d0170834c0	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	30	30	90	66	53	2025-10-22 10:03:38.647684
437a6bfd-235a-475d-bc0e-31d94d8cd9c1	21efc7c2-226e-4e70-ae43-276f5e08fb09	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	60	30	100	70	78	63	2025-10-22 10:05:10.112754
db0b5d06-a90f-4471-8aac-43f7b9d4fba2	21efc7c2-226e-4e70-ae43-276f5e08fb09	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	30	100	70	78	69	2025-10-22 10:05:10.112754
5c21b756-dbd6-4e4b-b797-15ce7fa18297	da22f443-5e49-4961-8f29-172c69689f8f	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	90	15	50	60	48	54	2025-10-22 10:05:52.746026
6731d005-c924-4605-b406-cedf1fd5addb	a0da746c-34bf-41ec-a76d-8ba13eea02fa	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	15	60	90	68	66	2025-10-22 10:06:01.289138
964e147a-8ebb-4dea-89a9-8208ed7acbf9	da22f443-5e49-4961-8f29-172c69689f8f	e8178bc7-bddd-4e89-bfea-8bd8cc618613	100	15	50	60	48	57	2025-10-22 10:05:52.746026
e0de936c-8176-434b-a238-bd50c6a7a7f6	2fd0938b-847f-4609-9f43-1db7708ed8f0	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	15	50	80	50	49	2025-10-22 10:03:10.357796
f593cb69-6a98-424f-b329-41a510116fb5	10ea4947-03b3-4147-b520-8c2f79850a9d	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	15	90	60	48	60	2025-10-22 10:03:34.466295
3fab82f0-72fc-419f-b064-302862b63d40	b4f1f567-9c30-440d-93cd-ff51bdcf94c3	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	30	30	60	42	54	2025-10-22 10:03:24.263775
225d9f27-8900-4a39-9f4f-4db30754d61d	a2220d3a-edc0-4b94-b63e-6f15223d08f7	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	60	20	90	64	68	2025-10-22 10:05:14.320991
a81bebc9-8eb0-48be-bd73-f5e129c3393d	d5cb9dd8-7fac-44f8-bc2c-5d5ddb195a15	e8178bc7-bddd-4e89-bfea-8bd8cc618613	90	15	90	90	72	69	2025-10-22 10:05:57.032088
9b654003-774c-414a-8579-1f934494e033	538f180b-716f-4539-96e4-e47d79a02d86	748bccfb-8b02-4052-9084-3e1bc103a2ca	40	100	20	80	60	61	2025-10-22 08:48:04.230477
e211235b-cae5-4074-bec7-c938164200d8	da22f443-5e49-4961-8f29-172c69689f8f	74e40274-3010-4113-87ba-ef51accdb12d	100	15	50	60	48	57	2025-10-22 10:05:52.746026
3fc44884-e45c-4d8d-8f76-504fc60199bb	034e97c9-6c2e-4e8d-a2f6-045add3f3533	e8178bc7-bddd-4e89-bfea-8bd8cc618613	50	100	30	80	56	65	2025-10-22 08:48:13.723114
49ad2ec3-aa2a-4bf4-bad3-b2f84a0b4776	538f180b-716f-4539-96e4-e47d79a02d86	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	100	20	80	60	64	2025-10-22 08:48:04.230477
60ece3b2-8936-47a3-affd-b5ac93814f4a	a2220d3a-edc0-4b94-b63e-6f15223d08f7	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	60	20	90	64	59	2025-10-22 10:05:14.320991
acb5b2b7-6132-4e64-90d2-cccfb2af9f35	21efc7c2-226e-4e70-ae43-276f5e08fb09	74e40274-3010-4113-87ba-ef51accdb12d	60	30	100	70	78	63	2025-10-22 10:05:10.112754
1d8335a0-a8ed-45aa-b0ba-09df416ffd73	da22f443-5e49-4961-8f29-172c69689f8f	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	15	50	60	48	54	2025-10-22 10:05:52.746026
5e25e673-6318-4340-9bcb-d85a4e5dfa4b	889dc3df-b948-4b04-9c1c-0d9384027b7f	e8178bc7-bddd-4e89-bfea-8bd8cc618613	80	15	100	60	82	64	2025-10-22 10:06:26.780103
1b59493f-7598-4f65-a29c-a164302216b6	020585b3-fd9b-4d1b-bff9-365b4d108d3a	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	50	30	20	80	56	46	2025-10-22 10:03:56.006751
5f2718da-f25c-4c74-bb2b-ae1b7ba3da52	020585b3-fd9b-4d1b-bff9-365b4d108d3a	748ccce7-9e36-4a8f-84c6-55af30e31f4c	60	30	20	80	56	49	2025-10-22 10:03:56.006751
e4a29db8-2d96-4ac4-8618-b25c844027bb	020585b3-fd9b-4d1b-bff9-365b4d108d3a	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	30	20	80	56	46	2025-10-22 10:03:56.006751
e9cb147f-9d2a-4ab8-baad-84b6789eb655	2d523087-d3c7-4703-ad6f-41446739da7e	e8178bc7-bddd-4e89-bfea-8bd8cc618613	70	15	60	80	64	55	2025-10-22 10:06:18.592447
f173ae65-4912-4739-bf93-bb9145534c73	020585b3-fd9b-4d1b-bff9-365b4d108d3a	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	50	30	20	80	56	46	2025-10-22 10:03:56.006751
8ba452b2-d63c-4f56-b84a-c3019786a7a8	759e1ea0-6f6e-4748-bcff-feed6971984d	e8178bc7-bddd-4e89-bfea-8bd8cc618613	60	15	100	80	58	57	2025-10-22 10:06:09.785535
2a3178bd-0c7e-4443-81d5-1c6c0fd8d164	21efc7c2-226e-4e70-ae43-276f5e08fb09	47dd6f69-5d4b-43e6-a71f-d8c8c47c115b	90	30	100	70	78	72	2025-10-22 10:05:10.112754
8faf96c1-db55-4039-a3d1-dbc3f77c8045	a2220d3a-edc0-4b94-b63e-6f15223d08f7	748bccfb-8b02-4052-9084-3e1bc103a2ca	50	60	20	90	64	56	2025-10-22 10:05:14.320991
2787a302-24a6-46f6-b56d-8222d55921fc	a2220d3a-edc0-4b94-b63e-6f15223d08f7	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	20	60	20	90	64	47	2025-10-22 10:05:14.320991
dbcd670a-0a35-4d6a-ac4d-5827e2b1a881	308a9847-f5ea-42df-a771-7aba5195bd68	748bccfb-8b02-4052-9084-3e1bc103a2ca	80	45	70	100	62	70	2025-10-22 10:05:18.609931
5f054c28-9a0e-4d55-a644-25f418ff4440	308a9847-f5ea-42df-a771-7aba5195bd68	7d15cb43-ec57-4ad7-8670-a4700b62ae3c	80	45	70	100	62	70	2025-10-22 10:05:18.609931
\.


--
-- Data for Name: user_shortlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_shortlists (id, user_id, destination_id, holiday_period_id, status, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-10-22 08:11:34
20211116045059	2025-10-22 08:11:37
20211116050929	2025-10-22 08:11:39
20211116051442	2025-10-22 08:11:40
20211116212300	2025-10-22 08:11:43
20211116213355	2025-10-22 08:11:44
20211116213934	2025-10-22 08:11:46
20211116214523	2025-10-22 08:11:49
20211122062447	2025-10-22 08:11:50
20211124070109	2025-10-22 08:11:52
20211202204204	2025-10-22 08:11:54
20211202204605	2025-10-22 08:11:56
20211210212804	2025-10-22 08:12:02
20211228014915	2025-10-22 08:12:04
20220107221237	2025-10-22 08:12:05
20220228202821	2025-10-22 08:12:07
20220312004840	2025-10-22 08:12:09
20220603231003	2025-10-22 08:12:12
20220603232444	2025-10-22 08:12:14
20220615214548	2025-10-22 08:12:16
20220712093339	2025-10-22 08:12:18
20220908172859	2025-10-22 08:12:20
20220916233421	2025-10-22 08:12:21
20230119133233	2025-10-22 08:12:23
20230128025114	2025-10-22 08:12:26
20230128025212	2025-10-22 08:12:27
20230227211149	2025-10-22 08:12:29
20230228184745	2025-10-22 08:12:31
20230308225145	2025-10-22 08:12:33
20230328144023	2025-10-22 08:12:35
20231018144023	2025-10-22 08:12:37
20231204144023	2025-10-22 08:12:40
20231204144024	2025-10-22 08:12:41
20231204144025	2025-10-22 08:12:43
20240108234812	2025-10-22 08:12:45
20240109165339	2025-10-22 08:12:47
20240227174441	2025-10-22 08:12:50
20240311171622	2025-10-22 08:12:53
20240321100241	2025-10-22 08:12:56
20240401105812	2025-10-22 08:13:02
20240418121054	2025-10-22 08:13:04
20240523004032	2025-10-22 08:13:11
20240618124746	2025-10-22 08:13:12
20240801235015	2025-10-22 08:13:14
20240805133720	2025-10-22 08:13:16
20240827160934	2025-10-22 08:13:18
20240919163303	2025-10-22 08:13:20
20240919163305	2025-10-22 08:13:22
20241019105805	2025-10-22 08:13:24
20241030150047	2025-10-22 08:13:31
20241108114728	2025-10-22 08:13:33
20241121104152	2025-10-22 08:13:35
20241130184212	2025-10-22 08:13:37
20241220035512	2025-10-22 08:13:39
20241220123912	2025-10-22 08:13:41
20241224161212	2025-10-22 08:13:43
20250107150512	2025-10-22 08:13:44
20250110162412	2025-10-22 08:13:46
20250123174212	2025-10-22 08:13:48
20250128220012	2025-10-22 08:13:50
20250506224012	2025-10-22 08:13:51
20250523164012	2025-10-22 08:13:53
20250714121412	2025-10-22 08:13:55
20250905041441	2025-10-22 08:13:57
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (id, type, format, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-10-22 08:11:35.366899
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-10-22 08:11:35.383265
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-10-22 08:11:35.393286
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-10-22 08:11:35.417337
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-10-22 08:11:35.45541
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-10-22 08:11:35.46027
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-10-22 08:11:35.464658
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-10-22 08:11:35.469659
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-10-22 08:11:35.473674
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-10-22 08:11:35.478026
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-10-22 08:11:35.483099
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-10-22 08:11:35.488191
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-10-22 08:11:35.497256
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-10-22 08:11:35.501758
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-10-22 08:11:35.506288
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-10-22 08:11:35.529125
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-10-22 08:11:35.533609
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-10-22 08:11:35.53889
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-10-22 08:11:35.54346
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-10-22 08:11:35.548898
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-10-22 08:11:35.553441
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-10-22 08:11:35.561281
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-10-22 08:11:35.574274
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-10-22 08:11:35.585059
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-10-22 08:11:35.58938
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-10-22 08:11:35.593673
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-10-22 08:11:35.597981
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-10-22 08:11:35.609983
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-10-22 08:11:35.882529
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-10-22 08:11:35.889704
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-10-22 08:11:35.895933
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-10-22 08:11:35.902954
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-10-22 08:11:35.909806
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-10-22 08:11:35.916803
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-10-22 08:11:35.918678
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-10-22 08:11:35.924463
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-10-22 08:11:35.928701
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-10-22 08:11:35.934892
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-10-22 08:11:35.9402
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-10-22 08:11:35.947701
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-10-22 08:11:35.952526
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-10-22 08:11:35.964992
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-10-22 08:11:35.970043
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-10-22 08:11:35.978617
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
001	{"-- Migration: Create destinations table\n-- Description: Main table for holiday destinations with all attributes\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\n-- Create destinations table\nCREATE TABLE destinations (\n  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),\n  name TEXT NOT NULL,\n  country TEXT NOT NULL,\n  region TEXT NOT NULL CHECK (region IN ('Europe', 'Asia', 'Americas', 'Africa', 'Oceania')),\n  type TEXT CHECK (type IN ('Beach', 'City', 'Mountain', 'Nature', 'Mixed')),\n  flight_hours DECIMAL NOT NULL CHECK (flight_hours >= 0 AND flight_hours <= 24),\n  time_difference INTEGER CHECK (time_difference >= -12 AND time_difference <= 14),\n  visa_required TEXT CHECK (visa_required IN ('Yes', 'No', 'EVisa')),\n  currency TEXT,\n  language TEXT,\n  budget_level TEXT CHECK (budget_level IN ('Budget', 'Mid-Range', 'Luxury', 'Ultra-Luxury')),\n  best_months TEXT,\n  worst_months TEXT,\n  high_star_share DECIMAL CHECK (high_star_share >= 0 AND high_star_share <= 100),\n  beach_pool_quality INTEGER NOT NULL CHECK (beach_pool_quality >= 1 AND beach_pool_quality <= 10),\n  kid_facilities_quality INTEGER NOT NULL CHECK (kid_facilities_quality >= 1 AND kid_facilities_quality <= 10),\n  notes TEXT,\n  visited BOOLEAN DEFAULT FALSE,\n  created_at TIMESTAMP DEFAULT NOW(),\n  updated_at TIMESTAMP DEFAULT NOW()\n)","-- Create indexes for common queries\nCREATE INDEX idx_destinations_region ON destinations(region)","CREATE INDEX idx_destinations_country ON destinations(country)","CREATE INDEX idx_destinations_name ON destinations(name)","CREATE INDEX idx_destinations_visited ON destinations(visited)","-- Create unique constraint on name + country (prevent duplicates)\nCREATE UNIQUE INDEX idx_destinations_unique ON destinations(LOWER(name), LOWER(country))","-- Add comment to table\nCOMMENT ON TABLE destinations IS 'Holiday destinations with ratings and logistics info'","-- Add comments to key columns\nCOMMENT ON COLUMN destinations.high_star_share IS 'Percentage of 4/5-star hotels (0-100)'","COMMENT ON COLUMN destinations.beach_pool_quality IS 'Beach/pool quality rating (1-10 scale)'","COMMENT ON COLUMN destinations.kid_facilities_quality IS 'Kid facilities rating (1-10 scale)'","COMMENT ON COLUMN destinations.flight_hours IS 'Flight time from London in hours'"}	create_destinations
002	{"-- Migration: Create climate_data table\n-- Description: Monthly temperature and rainfall data for each destination\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\nCREATE TABLE climate_data (\n  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),\n  destination_id UUID NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,\n  month INTEGER NOT NULL CHECK (month >= 1 AND month <= 12),\n  temperature_celsius DECIMAL NOT NULL CHECK (temperature_celsius >= -50 AND temperature_celsius <= 60),\n  rainfall_mm DECIMAL NOT NULL CHECK (rainfall_mm >= 0 AND rainfall_mm <= 2000),\n  created_at TIMESTAMP DEFAULT NOW(),\n  UNIQUE(destination_id, month)\n)","-- Create indexes for performance\nCREATE INDEX idx_climate_destination ON climate_data(destination_id)","CREATE INDEX idx_climate_month ON climate_data(month)","-- Add comments\nCOMMENT ON TABLE climate_data IS 'Monthly climate averages (temperature and rainfall) for each destination'","COMMENT ON COLUMN climate_data.month IS 'Month number (1=January, 12=December)'","COMMENT ON COLUMN climate_data.temperature_celsius IS 'Average temperature in Celsius'","COMMENT ON COLUMN climate_data.rainfall_mm IS 'Average monthly rainfall in millimeters'"}	create_climate_data
003	{"-- Migration: Create holiday_periods table\n-- Description: School holiday periods for scoring destinations\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\nCREATE TABLE holiday_periods (\n  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),\n  name TEXT NOT NULL,\n  start_date DATE NOT NULL,\n  end_date DATE NOT NULL,\n  year INTEGER NOT NULL,\n  created_at TIMESTAMP DEFAULT NOW(),\n  CHECK (end_date > start_date)\n)","-- Create indexes\nCREATE INDEX idx_holiday_periods_year ON holiday_periods(year)","CREATE INDEX idx_holiday_periods_dates ON holiday_periods(start_date, end_date)","-- Create unique constraint (prevent duplicate holiday periods)\nCREATE UNIQUE INDEX idx_holiday_unique ON holiday_periods(name, year)","-- Add comments\nCOMMENT ON TABLE holiday_periods IS 'School holiday periods for family trips'","COMMENT ON COLUMN holiday_periods.name IS 'Holiday name (e.g., \\"Christmas 2025\\", \\"Easter 2026\\")'"}	create_holiday_periods
004	{"-- Migration: Create scores table\n-- Description: Stores calculated scores for each destination-holiday combination\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\nCREATE TABLE scores (\n  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),\n  destination_id UUID NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,\n  holiday_period_id UUID NOT NULL REFERENCES holiday_periods(id) ON DELETE CASCADE,\n  weather_score INTEGER NOT NULL CHECK (weather_score >= 0 AND weather_score <= 100),\n  flight_score INTEGER NOT NULL CHECK (flight_score >= 0 AND flight_score <= 100),\n  beach_score INTEGER NOT NULL CHECK (beach_score >= 0 AND beach_score <= 100),\n  kid_facilities_score INTEGER NOT NULL CHECK (kid_facilities_score >= 0 AND kid_facilities_score <= 100),\n  luxury_score INTEGER NOT NULL CHECK (luxury_score >= 0 AND luxury_score <= 100),\n  final_score INTEGER NOT NULL CHECK (final_score >= 0 AND final_score <= 100),\n  calculated_at TIMESTAMP DEFAULT NOW(),\n  UNIQUE(destination_id, holiday_period_id)\n)","-- Create indexes for performance\nCREATE INDEX idx_scores_destination ON scores(destination_id)","CREATE INDEX idx_scores_holiday ON scores(holiday_period_id)","CREATE INDEX idx_scores_final ON scores(final_score DESC)","CREATE INDEX idx_scores_combined ON scores(holiday_period_id, final_score DESC)","-- Add comments\nCOMMENT ON TABLE scores IS 'Calculated scores for each destination-holiday period combination'","COMMENT ON COLUMN scores.weather_score IS 'Weather score (0-100) based on temperature and rainfall'","COMMENT ON COLUMN scores.flight_score IS 'Flight time score (0-100) with gradual penalty curve'","COMMENT ON COLUMN scores.beach_score IS 'Beach/pool quality score (0-100)'","COMMENT ON COLUMN scores.kid_facilities_score IS 'Kid facilities quality score (0-100)'","COMMENT ON COLUMN scores.luxury_score IS 'Hotel quality score (0-100) based on high star share %'","COMMENT ON COLUMN scores.final_score IS 'Weighted final score: Weather 30%, Flight 25%, Beach 15%, Kids 15%, Luxury 15%'"}	create_scores
005	{"-- Migration: Create scoring functions\n-- Description: PostgreSQL functions for calculating destination scores\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\n-- Function 1: Calculate flight time score (gradual penalty curve)\nCREATE OR REPLACE FUNCTION calculate_flight_score(flight_hours DECIMAL)\nRETURNS INTEGER AS $$\nBEGIN\n  RETURN CASE\n    WHEN flight_hours IS NULL THEN 0\n    WHEN flight_hours <= 2 THEN 100\n    WHEN flight_hours <= 4 THEN 90\n    WHEN flight_hours <= 6 THEN 75\n    WHEN flight_hours <= 8 THEN 60\n    WHEN flight_hours <= 10 THEN 45\n    WHEN flight_hours <= 12 THEN 30\n    ELSE 15\n  END;\nEND;\n$$ LANGUAGE plpgsql IMMUTABLE","COMMENT ON FUNCTION calculate_flight_score IS 'Calculate flight time score with gradual penalties (0-100)'","-- Function 2: Calculate weather score based on temperature and rainfall\nCREATE OR REPLACE FUNCTION calculate_weather_score(dest_id UUID, holiday_id UUID)\nRETURNS INTEGER AS $$\nDECLARE\n  holiday_start_month INTEGER;\n  holiday_end_month INTEGER;\n  avg_temp DECIMAL;\n  avg_rainfall DECIMAL;\n  temp_score INTEGER;\n  rainfall_score INTEGER;\nBEGIN\n  -- Get the months for this holiday period\n  SELECT EXTRACT(MONTH FROM start_date), EXTRACT(MONTH FROM end_date)\n  INTO holiday_start_month, holiday_end_month\n  FROM holiday_periods\n  WHERE id = holiday_id;\n\n  -- Get average temperature and rainfall for relevant months\n  -- If holiday spans multiple months, average them\n  SELECT\n    AVG(temperature_celsius),\n    AVG(rainfall_mm)\n  INTO avg_temp, avg_rainfall\n  FROM climate_data\n  WHERE destination_id = dest_id\n    AND (\n      (holiday_start_month = holiday_end_month AND month = holiday_start_month) OR\n      (holiday_start_month != holiday_end_month AND month IN (holiday_start_month, holiday_end_month))\n    );\n\n  -- Handle NULL climate data\n  IF avg_temp IS NULL OR avg_rainfall IS NULL THEN\n    RETURN 50; -- Default score if no climate data\n  END IF;\n\n  -- Calculate temperature score (50% of weather score)\n  temp_score := CASE\n    WHEN avg_temp >= 20 AND avg_temp <= 28 THEN 100\n    WHEN (avg_temp >= 18 AND avg_temp < 20) OR (avg_temp > 28 AND avg_temp <= 30) THEN 80\n    WHEN (avg_temp >= 15 AND avg_temp < 18) OR (avg_temp > 30 AND avg_temp <= 33) THEN 60\n    WHEN (avg_temp >= 12 AND avg_temp < 15) OR (avg_temp > 33 AND avg_temp <= 36) THEN 40\n    ELSE 20\n  END;\n\n  -- Calculate rainfall score (50% of weather score)\n  rainfall_score := CASE\n    WHEN avg_rainfall < 50 THEN 100\n    WHEN avg_rainfall < 100 THEN 80\n    WHEN avg_rainfall < 150 THEN 60\n    WHEN avg_rainfall < 200 THEN 40\n    ELSE 20\n  END;\n\n  -- Return weighted average (50% temp, 50% rainfall)\n  RETURN ROUND((temp_score + rainfall_score) / 2.0);\nEND;\n$$ LANGUAGE plpgsql STABLE","COMMENT ON FUNCTION calculate_weather_score IS 'Calculate weather score based on temperature and rainfall for holiday dates'","-- Function 3: Calculate beach/pool score (simple linear transformation)\nCREATE OR REPLACE FUNCTION calculate_beach_score(beach_pool_quality INTEGER)\nRETURNS INTEGER AS $$\nBEGIN\n  IF beach_pool_quality IS NULL THEN\n    RETURN 0;\n  END IF;\n  RETURN beach_pool_quality * 10; -- 1-10 scale → 0-100 scale\nEND;\n$$ LANGUAGE plpgsql IMMUTABLE","COMMENT ON FUNCTION calculate_beach_score IS 'Convert 1-10 beach quality rating to 0-100 score'","-- Function 4: Calculate kid facilities score (simple linear transformation)\nCREATE OR REPLACE FUNCTION calculate_kid_facilities_score(kid_facilities_quality INTEGER)\nRETURNS INTEGER AS $$\nBEGIN\n  IF kid_facilities_quality IS NULL THEN\n    RETURN 0;\n  END IF;\n  RETURN kid_facilities_quality * 10; -- 1-10 scale → 0-100 scale\nEND;\n$$ LANGUAGE plpgsql IMMUTABLE","COMMENT ON FUNCTION calculate_kid_facilities_score IS 'Convert 1-10 kid facilities rating to 0-100 score'","-- Function 5: Calculate luxury hotels score (direct percentage mapping)\nCREATE OR REPLACE FUNCTION calculate_luxury_score(high_star_share DECIMAL)\nRETURNS INTEGER AS $$\nBEGIN\n  IF high_star_share IS NULL THEN\n    RETURN 0;\n  END IF;\n  RETURN ROUND(high_star_share); -- Percentage directly maps to 0-100 score\nEND;\n$$ LANGUAGE plpgsql IMMUTABLE","COMMENT ON FUNCTION calculate_luxury_score IS 'Use high star share percentage as luxury score'","-- Function 6: Calculate final weighted score\nCREATE OR REPLACE FUNCTION calculate_final_score(\n  dest_id UUID,\n  holiday_id UUID\n)\nRETURNS INTEGER AS $$\nDECLARE\n  dest RECORD;\n  weather_sc INTEGER;\n  flight_sc INTEGER;\n  beach_sc INTEGER;\n  kids_sc INTEGER;\n  luxury_sc INTEGER;\n  final_sc DECIMAL;\nBEGIN\n  -- Get destination data\n  SELECT * INTO dest FROM destinations WHERE id = dest_id;\n\n  IF NOT FOUND THEN\n    RETURN 0;\n  END IF;\n\n  -- Calculate component scores\n  weather_sc := calculate_weather_score(dest_id, holiday_id);\n  flight_sc := calculate_flight_score(dest.flight_hours);\n  beach_sc := calculate_beach_score(dest.beach_pool_quality);\n  kids_sc := calculate_kid_facilities_score(dest.kid_facilities_quality);\n  luxury_sc := calculate_luxury_score(dest.high_star_share);\n\n  -- Calculate weighted final score\n  -- Weights: Weather 30%, Flight 25%, Beach 15%, Kids 15%, Luxury 15%\n  final_sc := (\n    (weather_sc * 0.30) +\n    (flight_sc * 0.25) +\n    (beach_sc * 0.15) +\n    (kids_sc * 0.15) +\n    (luxury_sc * 0.15)\n  );\n\n  RETURN ROUND(final_sc);\nEND;\n$$ LANGUAGE plpgsql STABLE","COMMENT ON FUNCTION calculate_final_score IS 'Calculate weighted final score: Weather 30%, Flight 25%, Beach 15%, Kids 15%, Luxury 15%'","-- Function 7: Update all scores for a destination (called by triggers)\nCREATE OR REPLACE FUNCTION update_all_scores_for_destination(dest_id UUID)\nRETURNS VOID AS $$\nDECLARE\n  holiday RECORD;\n  weather_sc INTEGER;\n  flight_sc INTEGER;\n  beach_sc INTEGER;\n  kids_sc INTEGER;\n  luxury_sc INTEGER;\n  final_sc INTEGER;\nBEGIN\n  -- Get destination data\n  DECLARE\n    dest RECORD;\n  BEGIN\n    SELECT * INTO dest FROM destinations WHERE id = dest_id;\n    IF NOT FOUND THEN\n      RETURN; -- Destination doesn't exist, nothing to update\n    END IF;\n  END;\n\n  -- Loop through all holiday periods and calculate scores\n  FOR holiday IN SELECT id FROM holiday_periods LOOP\n    -- Calculate component scores\n    weather_sc := calculate_weather_score(dest_id, holiday.id);\n    flight_sc := calculate_flight_score((SELECT flight_hours FROM destinations WHERE id = dest_id));\n    beach_sc := calculate_beach_score((SELECT beach_pool_quality FROM destinations WHERE id = dest_id));\n    kids_sc := calculate_kid_facilities_score((SELECT kid_facilities_quality FROM destinations WHERE id = dest_id));\n    luxury_sc := calculate_luxury_score((SELECT high_star_share FROM destinations WHERE id = dest_id));\n    final_sc := calculate_final_score(dest_id, holiday.id);\n\n    -- Upsert score record (insert or update if exists)\n    INSERT INTO scores (\n      destination_id,\n      holiday_period_id,\n      weather_score,\n      flight_score,\n      beach_score,\n      kid_facilities_score,\n      luxury_score,\n      final_score,\n      calculated_at\n    ) VALUES (\n      dest_id,\n      holiday.id,\n      weather_sc,\n      flight_sc,\n      beach_sc,\n      kids_sc,\n      luxury_sc,\n      final_sc,\n      NOW()\n    )\n    ON CONFLICT (destination_id, holiday_period_id)\n    DO UPDATE SET\n      weather_score = EXCLUDED.weather_score,\n      flight_score = EXCLUDED.flight_score,\n      beach_score = EXCLUDED.beach_score,\n      kid_facilities_score = EXCLUDED.kid_facilities_score,\n      luxury_score = EXCLUDED.luxury_score,\n      final_score = EXCLUDED.final_score,\n      calculated_at = NOW();\n  END LOOP;\nEND;\n$$ LANGUAGE plpgsql","COMMENT ON FUNCTION update_all_scores_for_destination IS 'Recalculate and update scores for all holiday periods for a given destination'"}	scoring_functions
006	{"-- Migration: Create triggers for auto-scoring\n-- Description: Automatically recalculate scores when data changes\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\n-- Trigger 1: Auto-update scores when destination changes\nCREATE OR REPLACE FUNCTION trigger_update_destination_scores()\nRETURNS TRIGGER AS $$\nBEGIN\n  PERFORM update_all_scores_for_destination(NEW.id);\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql","CREATE TRIGGER auto_update_destination_scores\nAFTER INSERT OR UPDATE ON destinations\nFOR EACH ROW\nEXECUTE FUNCTION trigger_update_destination_scores()","COMMENT ON TRIGGER auto_update_destination_scores ON destinations IS 'Auto-recalculate scores when destination is added or updated'","-- Trigger 2: Auto-update scores when climate data changes\nCREATE OR REPLACE FUNCTION trigger_update_climate_scores()\nRETURNS TRIGGER AS $$\nBEGIN\n  PERFORM update_all_scores_for_destination(NEW.destination_id);\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql","CREATE TRIGGER auto_update_climate_scores\nAFTER INSERT OR UPDATE ON climate_data\nFOR EACH ROW\nEXECUTE FUNCTION trigger_update_climate_scores()","COMMENT ON TRIGGER auto_update_climate_scores ON climate_data IS 'Auto-recalculate scores when climate data is added or updated'","-- Trigger 3: Recalculate ALL scores when holiday periods change\nCREATE OR REPLACE FUNCTION trigger_recalculate_all_scores()\nRETURNS TRIGGER AS $$\nDECLARE\n  dest RECORD;\nBEGIN\n  -- Loop through all destinations and recalculate scores\n  FOR dest IN SELECT id FROM destinations LOOP\n    PERFORM update_all_scores_for_destination(dest.id);\n  END LOOP;\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql","CREATE TRIGGER auto_recalculate_all_scores\nAFTER INSERT OR UPDATE ON holiday_periods\nFOR EACH ROW\nEXECUTE FUNCTION trigger_recalculate_all_scores()","COMMENT ON TRIGGER auto_recalculate_all_scores ON holiday_periods IS 'Recalculate ALL destination scores when holiday periods change'","-- Trigger 4: Update timestamps on destination changes\nCREATE OR REPLACE FUNCTION trigger_update_timestamp()\nRETURNS TRIGGER AS $$\nBEGIN\n  NEW.updated_at = NOW();\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql","CREATE TRIGGER update_destination_timestamp\nBEFORE UPDATE ON destinations\nFOR EACH ROW\nEXECUTE FUNCTION trigger_update_timestamp()","COMMENT ON TRIGGER update_destination_timestamp ON destinations IS 'Auto-update updated_at timestamp on destination changes'"}	triggers
007	{"-- Migration: Add temperature_high and temperature_low to climate_data\n-- Description: Track daily high/low temps in addition to average for better beach holiday planning\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\n-- Add new columns for temperature high and low\nALTER TABLE climate_data\n  ADD COLUMN temperature_high DECIMAL CHECK (temperature_high >= -50 AND temperature_high <= 60),\n  ADD COLUMN temperature_low DECIMAL CHECK (temperature_low >= -50 AND temperature_low <= 60)","-- Add comments\nCOMMENT ON COLUMN climate_data.temperature_high IS 'Average daily high temperature in Celsius (daytime)'","COMMENT ON COLUMN climate_data.temperature_low IS 'Average daily low temperature in Celsius (nighttime)'","COMMENT ON COLUMN climate_data.temperature_celsius IS 'Average temperature in Celsius (mean of high and low)'"}	add_temperature_high_low
008	{"-- Migration: Update weather scoring to use temperature_high\n-- Description: Use daytime high temperature for more accurate beach holiday scoring\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\n-- Drop and recreate the weather scoring function to use temperature_high\nCREATE OR REPLACE FUNCTION calculate_weather_score(dest_id UUID, holiday_id UUID)\nRETURNS INTEGER AS $$\nDECLARE\n  holiday_start_month INTEGER;\n  holiday_end_month INTEGER;\n  avg_temp_high DECIMAL;\n  avg_rainfall DECIMAL;\n  temp_score INTEGER;\n  rainfall_score INTEGER;\nBEGIN\n  -- Get months for holiday period\n  SELECT EXTRACT(MONTH FROM start_date), EXTRACT(MONTH FROM end_date)\n  INTO holiday_start_month, holiday_end_month\n  FROM holiday_periods WHERE id = holiday_id;\n\n  -- Get average climate data using temperature_high (daytime high is what matters for beach holidays)\n  SELECT\n    COALESCE(AVG(temperature_high), AVG(temperature_celsius)),\n    AVG(rainfall_mm)\n  INTO avg_temp_high, avg_rainfall\n  FROM climate_data\n  WHERE destination_id = dest_id\n    AND month IN (holiday_start_month, holiday_end_month);\n\n  -- If no data, return 0\n  IF avg_temp_high IS NULL THEN\n    RETURN 0;\n  END IF;\n\n  -- Temperature scoring based on daytime high (ideal for beach: 24-30°C)\n  -- Updated scoring curve for daytime highs:\n  -- 24-30°C = Perfect beach weather (100 points)\n  -- 20-24°C or 30-32°C = Good (80 points)\n  -- 16-20°C or 32-35°C = Acceptable (60 points)\n  -- Below 16°C or above 35°C = Too cold/hot (20 points)\n  temp_score := CASE\n    WHEN avg_temp_high >= 24 AND avg_temp_high <= 30 THEN 100\n    WHEN (avg_temp_high >= 20 AND avg_temp_high < 24) OR (avg_temp_high > 30 AND avg_temp_high <= 32) THEN 80\n    WHEN (avg_temp_high >= 16 AND avg_temp_high < 20) OR (avg_temp_high > 32 AND avg_temp_high <= 35) THEN 60\n    ELSE 20\n  END;\n\n  -- Rainfall scoring: <50mm = 100 points (remains unchanged)\n  rainfall_score := CASE\n    WHEN avg_rainfall < 50 THEN 100\n    WHEN avg_rainfall < 100 THEN 80\n    WHEN avg_rainfall < 150 THEN 60\n    ELSE 20\n  END;\n\n  RETURN ROUND((temp_score + rainfall_score) / 2.0);\nEND;\n$$ LANGUAGE plpgsql STABLE","-- Add comment explaining the change\nCOMMENT ON FUNCTION calculate_weather_score IS 'Calculates weather score using temperature_high (daytime) for more accurate beach holiday recommendations. Ideal daytime high: 24-30°C. Rainfall penalties apply above 50mm.'"}	update_weather_scoring_high_temp
009	{"-- Migration: Create user_shortlists table\n-- Description: Stores user shortlists (candidate/chosen/dismissed) per holiday period\n-- Author: AI-Assisted\n-- Date: 2025-10-22\n\n-- Create user_shortlists table\nCREATE TABLE user_shortlists (\n  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),\n  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,\n  destination_id UUID NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,\n  holiday_period_id UUID NOT NULL REFERENCES holiday_periods(id) ON DELETE CASCADE,\n  status TEXT NOT NULL CHECK (status IN ('candidate', 'chosen', 'dismissed')),\n  notes TEXT,\n  created_at TIMESTAMP DEFAULT NOW(),\n  updated_at TIMESTAMP DEFAULT NOW(),\n  UNIQUE(user_id, destination_id, holiday_period_id)\n)","-- Create indexes for performance\nCREATE INDEX idx_shortlists_user ON user_shortlists(user_id)","CREATE INDEX idx_shortlists_destination ON user_shortlists(destination_id)","CREATE INDEX idx_shortlists_holiday ON user_shortlists(holiday_period_id)","CREATE INDEX idx_shortlists_status ON user_shortlists(status)","CREATE INDEX idx_shortlists_user_holiday ON user_shortlists(user_id, holiday_period_id)","-- Add comments\nCOMMENT ON TABLE user_shortlists IS 'User shortlists: candidate/chosen/dismissed per holiday period'","COMMENT ON COLUMN user_shortlists.user_id IS 'User who created this shortlist entry'","COMMENT ON COLUMN user_shortlists.destination_id IS 'Destination being shortlisted'","COMMENT ON COLUMN user_shortlists.holiday_period_id IS 'Holiday period context for this shortlist entry'","COMMENT ON COLUMN user_shortlists.status IS 'Status: candidate (considering), chosen (final choice), dismissed (not interested)'","COMMENT ON COLUMN user_shortlists.notes IS 'Personal notes about this destination for this holiday'","-- Enable Row Level Security (RLS)\nALTER TABLE user_shortlists ENABLE ROW LEVEL SECURITY","-- RLS Policy: Users can only view their own shortlists\nCREATE POLICY \\"Users can view own shortlists\\"\n  ON user_shortlists FOR SELECT\n  USING (auth.uid() = user_id)","-- RLS Policy: Users can only insert their own shortlists\nCREATE POLICY \\"Users can insert own shortlists\\"\n  ON user_shortlists FOR INSERT\n  WITH CHECK (auth.uid() = user_id)","-- RLS Policy: Users can only update their own shortlists\nCREATE POLICY \\"Users can update own shortlists\\"\n  ON user_shortlists FOR UPDATE\n  USING (auth.uid() = user_id)\n  WITH CHECK (auth.uid() = user_id)","-- RLS Policy: Users can only delete their own shortlists\nCREATE POLICY \\"Users can delete own shortlists\\"\n  ON user_shortlists FOR DELETE\n  USING (auth.uid() = user_id)","-- Create function to auto-update updated_at timestamp (if not exists)\nCREATE OR REPLACE FUNCTION update_updated_at_column()\nRETURNS TRIGGER AS $$\nBEGIN\n  NEW.updated_at = NOW();\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql","-- Create trigger to auto-update updated_at timestamp\nCREATE TRIGGER update_user_shortlists_updated_at\n  BEFORE UPDATE ON user_shortlists\n  FOR EACH ROW\n  EXECUTE FUNCTION update_updated_at_column()"}	create_user_shortlists
\.


--
-- Data for Name: seed_files; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.seed_files (path, hash) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 4, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: climate_data climate_data_destination_id_month_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.climate_data
    ADD CONSTRAINT climate_data_destination_id_month_key UNIQUE (destination_id, month);


--
-- Name: climate_data climate_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.climate_data
    ADD CONSTRAINT climate_data_pkey PRIMARY KEY (id);


--
-- Name: destinations destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: holiday_periods holiday_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_periods
    ADD CONSTRAINT holiday_periods_pkey PRIMARY KEY (id);


--
-- Name: scores scores_destination_id_holiday_period_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_destination_id_holiday_period_id_key UNIQUE (destination_id, holiday_period_id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- Name: user_shortlists user_shortlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_shortlists
    ADD CONSTRAINT user_shortlists_pkey PRIMARY KEY (id);


--
-- Name: user_shortlists user_shortlists_user_id_destination_id_holiday_period_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_shortlists
    ADD CONSTRAINT user_shortlists_user_id_destination_id_holiday_period_id_key UNIQUE (user_id, destination_id, holiday_period_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: seed_files seed_files_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.seed_files
    ADD CONSTRAINT seed_files_pkey PRIMARY KEY (path);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_climate_destination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_climate_destination ON public.climate_data USING btree (destination_id);


--
-- Name: idx_climate_month; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_climate_month ON public.climate_data USING btree (month);


--
-- Name: idx_destinations_country; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_destinations_country ON public.destinations USING btree (country);


--
-- Name: idx_destinations_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_destinations_name ON public.destinations USING btree (name);


--
-- Name: idx_destinations_region; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_destinations_region ON public.destinations USING btree (region);


--
-- Name: idx_destinations_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_destinations_unique ON public.destinations USING btree (lower(name), lower(country));


--
-- Name: idx_destinations_visited; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_destinations_visited ON public.destinations USING btree (visited);


--
-- Name: idx_holiday_periods_dates; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_holiday_periods_dates ON public.holiday_periods USING btree (start_date, end_date);


--
-- Name: idx_holiday_periods_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_holiday_periods_year ON public.holiday_periods USING btree (year);


--
-- Name: idx_holiday_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_holiday_unique ON public.holiday_periods USING btree (name, year);


--
-- Name: idx_scores_combined; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scores_combined ON public.scores USING btree (holiday_period_id, final_score DESC);


--
-- Name: idx_scores_destination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scores_destination ON public.scores USING btree (destination_id);


--
-- Name: idx_scores_final; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scores_final ON public.scores USING btree (final_score DESC);


--
-- Name: idx_scores_holiday; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scores_holiday ON public.scores USING btree (holiday_period_id);


--
-- Name: idx_shortlists_destination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shortlists_destination ON public.user_shortlists USING btree (destination_id);


--
-- Name: idx_shortlists_holiday; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shortlists_holiday ON public.user_shortlists USING btree (holiday_period_id);


--
-- Name: idx_shortlists_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shortlists_status ON public.user_shortlists USING btree (status);


--
-- Name: idx_shortlists_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shortlists_user ON public.user_shortlists USING btree (user_id);


--
-- Name: idx_shortlists_user_holiday; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shortlists_user_holiday ON public.user_shortlists USING btree (user_id, holiday_period_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: holiday_periods auto_recalculate_all_scores; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auto_recalculate_all_scores AFTER INSERT OR UPDATE ON public.holiday_periods FOR EACH ROW EXECUTE FUNCTION public.trigger_recalculate_all_scores();


--
-- Name: TRIGGER auto_recalculate_all_scores ON holiday_periods; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER auto_recalculate_all_scores ON public.holiday_periods IS 'Recalculate ALL destination scores when holiday periods change';


--
-- Name: climate_data auto_update_climate_scores; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auto_update_climate_scores AFTER INSERT OR UPDATE ON public.climate_data FOR EACH ROW EXECUTE FUNCTION public.trigger_update_climate_scores();


--
-- Name: TRIGGER auto_update_climate_scores ON climate_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER auto_update_climate_scores ON public.climate_data IS 'Auto-recalculate scores when climate data is added or updated';


--
-- Name: destinations auto_update_destination_scores; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auto_update_destination_scores AFTER INSERT OR UPDATE ON public.destinations FOR EACH ROW EXECUTE FUNCTION public.trigger_update_destination_scores();


--
-- Name: TRIGGER auto_update_destination_scores ON destinations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER auto_update_destination_scores ON public.destinations IS 'Auto-recalculate scores when destination is added or updated';


--
-- Name: destinations update_destination_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_destination_timestamp BEFORE UPDATE ON public.destinations FOR EACH ROW EXECUTE FUNCTION public.trigger_update_timestamp();


--
-- Name: TRIGGER update_destination_timestamp ON destinations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER update_destination_timestamp ON public.destinations IS 'Auto-update updated_at timestamp on destination changes';


--
-- Name: user_shortlists update_user_shortlists_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_user_shortlists_updated_at BEFORE UPDATE ON public.user_shortlists FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: climate_data climate_data_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.climate_data
    ADD CONSTRAINT climate_data_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(id) ON DELETE CASCADE;


--
-- Name: scores scores_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(id) ON DELETE CASCADE;


--
-- Name: scores scores_holiday_period_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_holiday_period_id_fkey FOREIGN KEY (holiday_period_id) REFERENCES public.holiday_periods(id) ON DELETE CASCADE;


--
-- Name: user_shortlists user_shortlists_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_shortlists
    ADD CONSTRAINT user_shortlists_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(id) ON DELETE CASCADE;


--
-- Name: user_shortlists user_shortlists_holiday_period_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_shortlists
    ADD CONSTRAINT user_shortlists_holiday_period_id_fkey FOREIGN KEY (holiday_period_id) REFERENCES public.holiday_periods(id) ON DELETE CASCADE;


--
-- Name: user_shortlists user_shortlists_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_shortlists
    ADD CONSTRAINT user_shortlists_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: user_shortlists Users can delete own shortlists; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete own shortlists" ON public.user_shortlists FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: user_shortlists Users can insert own shortlists; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert own shortlists" ON public.user_shortlists FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: user_shortlists Users can update own shortlists; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own shortlists" ON public.user_shortlists FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: user_shortlists Users can view own shortlists; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own shortlists" ON public.user_shortlists FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: user_shortlists; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_shortlists ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION calculate_beach_score(beach_pool_quality integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.calculate_beach_score(beach_pool_quality integer) TO anon;
GRANT ALL ON FUNCTION public.calculate_beach_score(beach_pool_quality integer) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_beach_score(beach_pool_quality integer) TO service_role;


--
-- Name: FUNCTION calculate_final_score(dest_id uuid, holiday_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.calculate_final_score(dest_id uuid, holiday_id uuid) TO anon;
GRANT ALL ON FUNCTION public.calculate_final_score(dest_id uuid, holiday_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_final_score(dest_id uuid, holiday_id uuid) TO service_role;


--
-- Name: FUNCTION calculate_flight_score(flight_hours numeric); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.calculate_flight_score(flight_hours numeric) TO anon;
GRANT ALL ON FUNCTION public.calculate_flight_score(flight_hours numeric) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_flight_score(flight_hours numeric) TO service_role;


--
-- Name: FUNCTION calculate_kid_facilities_score(kid_facilities_quality integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.calculate_kid_facilities_score(kid_facilities_quality integer) TO anon;
GRANT ALL ON FUNCTION public.calculate_kid_facilities_score(kid_facilities_quality integer) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_kid_facilities_score(kid_facilities_quality integer) TO service_role;


--
-- Name: FUNCTION calculate_luxury_score(high_star_share numeric); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.calculate_luxury_score(high_star_share numeric) TO anon;
GRANT ALL ON FUNCTION public.calculate_luxury_score(high_star_share numeric) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_luxury_score(high_star_share numeric) TO service_role;


--
-- Name: FUNCTION calculate_weather_score(dest_id uuid, holiday_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.calculate_weather_score(dest_id uuid, holiday_id uuid) TO anon;
GRANT ALL ON FUNCTION public.calculate_weather_score(dest_id uuid, holiday_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.calculate_weather_score(dest_id uuid, holiday_id uuid) TO service_role;


--
-- Name: FUNCTION trigger_recalculate_all_scores(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.trigger_recalculate_all_scores() TO anon;
GRANT ALL ON FUNCTION public.trigger_recalculate_all_scores() TO authenticated;
GRANT ALL ON FUNCTION public.trigger_recalculate_all_scores() TO service_role;


--
-- Name: FUNCTION trigger_update_climate_scores(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.trigger_update_climate_scores() TO anon;
GRANT ALL ON FUNCTION public.trigger_update_climate_scores() TO authenticated;
GRANT ALL ON FUNCTION public.trigger_update_climate_scores() TO service_role;


--
-- Name: FUNCTION trigger_update_destination_scores(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.trigger_update_destination_scores() TO anon;
GRANT ALL ON FUNCTION public.trigger_update_destination_scores() TO authenticated;
GRANT ALL ON FUNCTION public.trigger_update_destination_scores() TO service_role;


--
-- Name: FUNCTION trigger_update_timestamp(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.trigger_update_timestamp() TO anon;
GRANT ALL ON FUNCTION public.trigger_update_timestamp() TO authenticated;
GRANT ALL ON FUNCTION public.trigger_update_timestamp() TO service_role;


--
-- Name: FUNCTION update_all_scores_for_destination(dest_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_all_scores_for_destination(dest_id uuid) TO anon;
GRANT ALL ON FUNCTION public.update_all_scores_for_destination(dest_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.update_all_scores_for_destination(dest_id uuid) TO service_role;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE climate_data; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.climate_data TO anon;
GRANT ALL ON TABLE public.climate_data TO authenticated;
GRANT ALL ON TABLE public.climate_data TO service_role;


--
-- Name: TABLE destinations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.destinations TO anon;
GRANT ALL ON TABLE public.destinations TO authenticated;
GRANT ALL ON TABLE public.destinations TO service_role;


--
-- Name: TABLE holiday_periods; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.holiday_periods TO anon;
GRANT ALL ON TABLE public.holiday_periods TO authenticated;
GRANT ALL ON TABLE public.holiday_periods TO service_role;


--
-- Name: TABLE scores; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scores TO anon;
GRANT ALL ON TABLE public.scores TO authenticated;
GRANT ALL ON TABLE public.scores TO service_role;


--
-- Name: TABLE user_shortlists; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_shortlists TO anon;
GRANT ALL ON TABLE public.user_shortlists TO authenticated;
GRANT ALL ON TABLE public.user_shortlists TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict kmrBqlWh1EgoKjzHjXMvhcyfybvgyC1asYv8tFSmgCSlhOhv4Po8ahu1e9CXZPi

