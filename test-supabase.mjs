// Test Supabase connection and data fetching
// Run with: node test-supabase.js

import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';

// Load environment variables
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

console.log('🔧 Testing Supabase Connection...\n');
console.log(`URL: ${supabaseUrl}`);
console.log(`Key: ${supabaseAnonKey.substring(0, 20)}...\n`);

// Create Supabase client
const supabase = createClient(supabaseUrl, supabaseAnonKey);

async function testSupabaseConnection() {
  try {
    // Test 1: Fetch destinations
    console.log('📍 Test 1: Fetching destinations...');
    const { data: destinations, error: destError } = await supabase
      .from('destinations')
      .select('id, name, country, region, type, flight_hours')
      .limit(5);

    if (destError) {
      console.error('❌ Error fetching destinations:', destError);
      return;
    }

    console.log(`✅ Successfully fetched ${destinations.length} destinations (showing first 5):`);
    destinations.forEach(dest => {
      console.log(`   - ${dest.name}, ${dest.country} (${dest.type}, ${dest.flight_hours}h flight)`);
    });

    // Count total destinations
    const { count: totalDest } = await supabase
      .from('destinations')
      .select('*', { count: 'exact', head: true });
    console.log(`   Total destinations in database: ${totalDest}\n`);

    // Test 2: Fetch climate data
    console.log('🌤️  Test 2: Fetching climate data...');
    const { data: climate, error: climateError } = await supabase
      .from('climate_data')
      .select('id, destination_id, month, temperature_celsius, rainfall_mm')
      .limit(5);

    if (climateError) {
      console.error('❌ Error fetching climate data:', climateError);
      return;
    }

    console.log(`✅ Successfully fetched ${climate.length} climate records (showing first 5):`);
    climate.forEach(c => {
      console.log(`   - Month ${c.month}: ${c.temperature_celsius}°C, ${c.rainfall_mm}mm rainfall`);
    });

    // Count total climate records
    const { count: totalClimate } = await supabase
      .from('climate_data')
      .select('*', { count: 'exact', head: true });
    console.log(`   Total climate records in database: ${totalClimate}\n`);

    // Test 3: Fetch holiday periods
    console.log('📅 Test 3: Fetching holiday periods...');
    const { data: periods, error: periodError } = await supabase
      .from('holiday_periods')
      .select('id, name, start_date, end_date, year')
      .order('start_date');

    if (periodError) {
      console.error('❌ Error fetching holiday periods:', periodError);
      return;
    }

    console.log(`✅ Successfully fetched ${periods.length} holiday periods:`);
    periods.forEach(p => {
      console.log(`   - ${p.name} (${p.start_date} to ${p.end_date})`);
    });
    console.log();

    // Test 4: Fetch scores
    console.log('⭐ Test 4: Fetching scores...');
    const { data: scores, error: scoresError } = await supabase
      .from('scores')
      .select('id, destination_id, holiday_period_id, final_score, weather_score, flight_score')
      .order('final_score', { ascending: false })
      .limit(5);

    if (scoresError) {
      console.error('❌ Error fetching scores:', scoresError);
      return;
    }

    console.log(`✅ Successfully fetched ${scores.length} score records (top 5 by final score):`);
    scores.forEach(s => {
      console.log(`   - Final: ${s.final_score.toFixed(2)}, Weather: ${s.weather_score.toFixed(2)}, Flight: ${s.flight_score.toFixed(2)}`);
    });

    // Count total scores
    const { count: totalScores } = await supabase
      .from('scores')
      .select('*', { count: 'exact', head: true });
    console.log(`   Total score records in database: ${totalScores}\n`);

    // Test 5: Join query (destinations with scores)
    console.log('🔗 Test 5: Testing join query (destinations with scores)...');
    const { data: joinData, error: joinError } = await supabase
      .from('scores')
      .select(`
        final_score,
        weather_score,
        flight_score,
        destinations:destination_id (
          name,
          country,
          region
        ),
        holiday_periods:holiday_period_id (
          name,
          start_date
        )
      `)
      .order('final_score', { ascending: false })
      .limit(3);

    if (joinError) {
      console.error('❌ Error with join query:', joinError);
      return;
    }

    console.log(`✅ Successfully fetched joined data (top 3):`);
    joinData.forEach(item => {
      console.log(`   - ${item.destinations.name}, ${item.destinations.country}`);
      console.log(`     Holiday: ${item.holiday_periods.name}`);
      console.log(`     Score: ${item.final_score.toFixed(2)}`);
    });
    console.log();

    // Summary
    console.log('═══════════════════════════════════════════════════');
    console.log('✅ All Supabase connection tests passed!');
    console.log('═══════════════════════════════════════════════════');
    console.log(`Total records:`);
    console.log(`  - Destinations: ${totalDest}`);
    console.log(`  - Climate Data: ${totalClimate}`);
    console.log(`  - Holiday Periods: ${periods.length}`);
    console.log(`  - Scores: ${totalScores}`);
    console.log('═══════════════════════════════════════════════════\n');

  } catch (error) {
    console.error('❌ Unexpected error:', error);
  }
}

// Run the tests
testSupabaseConnection();
