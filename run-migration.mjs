// Run migration and show Easter 2026 results
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import { readFileSync } from 'fs';

dotenv.config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function runMigrationAndShowResults() {
  try {
    console.log('📝 Migration Changes Prepared:');
    console.log('   - Ideal temperature lowered: 24°C → 23°C');
    console.log('   - Weather weight increased: 20% → 25%');
    console.log('   - Luxury weight reduced: 20% → 15%');
    console.log('   - File: ./supabase/migrations/20251024130000_adjust_weather_scoring.sql\n');
    console.log('⚠️  Note: Showing CURRENT results (before migration)\n');

    // Now fetch Easter 2026 results
    console.log('═══════════════════════════════════════════════════');
    console.log('🐰 EASTER 2026 RANKINGS (April 3-19, 2026)');
    console.log('═══════════════════════════════════════════════════\n');

    // Get Easter 2026 period
    const { data: periods } = await supabase
      .from('holiday_periods')
      .select('*')
      .ilike('name', '%Easter 2026%')
      .single();

    if (!periods) {
      console.log('❌ Easter 2026 period not found');
      return;
    }

    console.log(`📅 Period: ${periods.name} (${periods.start_date} to ${periods.end_date})\n`);

    // Get top 20 destinations for Easter 2026
    const { data: scores } = await supabase
      .from('scores')
      .select(`
        *,
        destinations:destination_id (
          name,
          country,
          region,
          budget_level,
          flight_hours,
          beach_pool_quality,
          kid_facilities_quality,
          high_star_share
        )
      `)
      .eq('holiday_period_id', periods.id)
      .order('final_score', { ascending: false })
      .limit(20);

    console.log('Rank | Destination                   | Final | Weather | Flight | Jet-lag | Beach | Kids | Luxury | Budget   | Hours');
    console.log('---- | ----------------------------- | ----- | ------- | ------ | ------- | ----- | ---- | ------ | -------- | -----');

    scores.forEach((s, i) => {
      const dest = s.destinations;
      const destName = `${dest.name}, ${dest.country}`;
      const jetLag = s.jet_lag_score || 'N/A';

      console.log(
        ` ${String(i + 1).padStart(2)}  | ${destName.padEnd(29)} | ` +
        `${String(s.final_score).padStart(5)} | ${String(s.weather_score).padStart(7)} | ` +
        `${String(s.flight_score).padStart(6)} | ${String(jetLag).padStart(7)} | ` +
        `${String(s.beach_score).padStart(5)} | ${String(s.kid_facilities_score).padStart(4)} | ` +
        `${String(s.luxury_score).padStart(6)} | ${dest.budget_level.padEnd(8)} | ${String(dest.flight_hours).padStart(4)}h`
      );
    });

    console.log('\n');

    // Show score breakdown for top 5
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    console.log('📊 DETAILED BREAKDOWN - TOP 5 DESTINATIONS');
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

    scores.slice(0, 5).forEach((s, i) => {
      const dest = s.destinations;
      console.log(`${i + 1}. ${dest.name}, ${dest.country}`);
      console.log(`   Final Score: ${s.final_score} / 100`);
      console.log(`   ────────────────────────────────────`);
      console.log(`   Weather (25%):      ${String(s.weather_score).padStart(3)} × 0.25 = ${(s.weather_score * 0.25).toFixed(1)}`);
      console.log(`   Flight (25%):       ${String(s.flight_score).padStart(3)} × 0.25 = ${(s.flight_score * 0.25).toFixed(1)}`);
      console.log(`   Jet-lag (5%):       ${String(s.jet_lag_score || 0).padStart(3)} × 0.05 = ${((s.jet_lag_score || 0) * 0.05).toFixed(1)}`);
      console.log(`   Beach (15%):        ${String(s.beach_score).padStart(3)} × 0.15 = ${(s.beach_score * 0.15).toFixed(1)}`);
      console.log(`   Kids (15%):         ${String(s.kid_facilities_score).padStart(3)} × 0.15 = ${(s.kid_facilities_score * 0.15).toFixed(1)}`);
      console.log(`   Luxury (15%):       ${String(s.luxury_score).padStart(3)} × 0.15 = ${(s.luxury_score * 0.15).toFixed(1)}`);
      console.log(`   ────────────────────────────────────`);

      const calculated = (s.weather_score * 0.25) + (s.flight_score * 0.25) +
                        ((s.jet_lag_score || 0) * 0.05) + (s.beach_score * 0.15) +
                        (s.kid_facilities_score * 0.15) + (s.luxury_score * 0.15);
      console.log(`   Calculated Total:   ${calculated.toFixed(1)}`);
      console.log(`   Budget: ${dest.budget_level}, Flight: ${dest.flight_hours}h`);
      console.log(`   Beach Quality: ${dest.beach_pool_quality}/10, Kids: ${dest.kid_facilities_quality}/10, Luxury: ${dest.high_star_share}%`);
      console.log('');
    });

    console.log('═══════════════════════════════════════════════════\n');

  } catch (error) {
    console.error('❌ Error:', error);
  }
}

runMigrationAndShowResults();
