// Debug ranking issues for Egypt vs Dubai
import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function debugRankings() {
  console.log('🔍 Debugging Rankings: Egypt vs Dubai\n');
  console.log('═══════════════════════════════════════════════════\n');

  // Get Egypt and Dubai destination data
  const { data: destinations, error: destError } = await supabase
    .from('destinations')
    .select('*')
    .or('name.ilike.%Egypt%,name.ilike.%Dubai%');

  if (destError) {
    console.error('Error fetching destinations:', destError);
    return;
  }

  console.log(`📍 Found ${destinations.length} destinations:\n`);
  destinations.forEach(d => {
    console.log(`${d.name} (${d.country})`);
    console.log(`  Flight Hours: ${d.flight_hours}h`);
    console.log(`  Beach/Pool Quality: ${d.beach_pool_quality}/10`);
    console.log(`  Kid Facilities: ${d.kid_facilities_quality}/10`);
    console.log(`  High Star Share: ${(d.high_star_share * 100).toFixed(1)}%`);
    console.log('');
  });

  // Get scores for each destination across all holiday periods
  for (const dest of destinations) {
    console.log(`\n⭐ Scores for ${dest.name}:\n`);

    const { data: scores, error: scoreError } = await supabase
      .from('scores')
      .select(`
        *,
        holiday_periods:holiday_period_id (name, start_date, end_date)
      `)
      .eq('destination_id', dest.id)
      .order('final_score', { ascending: false });

    if (scoreError) {
      console.error('Error fetching scores:', scoreError);
      continue;
    }

    if (scores.length === 0) {
      console.log('  No scores found\n');
      continue;
    }

    console.log(`Period                    | Final | Weather | Flight | Beach | Kids | Luxury`);
    console.log(`------------------------- | ----- | ------- | ------ | ----- | ---- | ------`);

    scores.forEach(s => {
      const periodName = s.holiday_periods?.name || 'Unknown';
      console.log(
        `${periodName.padEnd(25)} | ${String(s.final_score).padStart(5)} | ` +
        `${String(s.weather_score).padStart(7)} | ${String(s.flight_score).padStart(6)} | ` +
        `${String(s.beach_score).padStart(5)} | ${String(s.kid_facilities_score).padStart(4)} | ` +
        `${String(s.luxury_score).padStart(6)}`
      );
    });
  }

  // Compare side by side for a specific holiday period
  console.log('\n\n📊 Side-by-Side Comparison:\n');

  const { data: holidayPeriods } = await supabase
    .from('holiday_periods')
    .select('*')
    .order('start_date');

  for (const period of holidayPeriods.slice(0, 3)) {
    console.log(`\n${period.name} (${period.start_date} to ${period.end_date}):`);
    console.log('─'.repeat(80));

    const egyptDest = destinations.find(d => d.name.includes('Egypt'));
    const dubaiDest = destinations.find(d => d.name.includes('Dubai'));

    if (egyptDest && dubaiDest) {
      const { data: egyptScore } = await supabase
        .from('scores')
        .select('*')
        .eq('destination_id', egyptDest.id)
        .eq('holiday_period_id', period.id)
        .single();

      const { data: dubaiScore } = await supabase
        .from('scores')
        .select('*')
        .eq('destination_id', dubaiDest.id)
        .eq('holiday_period_id', period.id)
        .single();

      if (egyptScore && dubaiScore) {
        console.log(`\nMetric          | Egypt | Dubai | Difference`);
        console.log(`--------------- | ----- | ----- | ----------`);
        console.log(`Weather         | ${String(egyptScore.weather_score).padStart(5)} | ${String(dubaiScore.weather_score).padStart(5)} | ${dubaiScore.weather_score - egyptScore.weather_score > 0 ? '+' : ''}${dubaiScore.weather_score - egyptScore.weather_score}`);
        console.log(`Flight          | ${String(egyptScore.flight_score).padStart(5)} | ${String(dubaiScore.flight_score).padStart(5)} | ${dubaiScore.flight_score - egyptScore.flight_score > 0 ? '+' : ''}${dubaiScore.flight_score - egyptScore.flight_score}`);
        console.log(`Beach           | ${String(egyptScore.beach_score).padStart(5)} | ${String(dubaiScore.beach_score).padStart(5)} | ${dubaiScore.beach_score - egyptScore.beach_score > 0 ? '+' : ''}${dubaiScore.beach_score - egyptScore.beach_score}`);
        console.log(`Kids            | ${String(egyptScore.kid_facilities_score).padStart(5)} | ${String(dubaiScore.kid_facilities_score).padStart(5)} | ${dubaiScore.kid_facilities_score - egyptScore.kid_facilities_score > 0 ? '+' : ''}${dubaiScore.kid_facilities_score - egyptScore.kid_facilities_score}`);
        console.log(`Luxury          | ${String(egyptScore.luxury_score).padStart(5)} | ${String(dubaiScore.luxury_score).padStart(5)} | ${dubaiScore.luxury_score - egyptScore.luxury_score > 0 ? '+' : ''}${dubaiScore.luxury_score - egyptScore.luxury_score}`);
        console.log(`--------------- | ----- | ----- | ----------`);
        console.log(`FINAL SCORE     | ${String(egyptScore.final_score).padStart(5)} | ${String(dubaiScore.final_score).padStart(5)} | ${dubaiScore.final_score - egyptScore.final_score > 0 ? '+' : ''}${dubaiScore.final_score - egyptScore.final_score}`);

        if (egyptScore.final_score > dubaiScore.final_score) {
          console.log(`\n⚠️  Egypt ranks HIGHER than Dubai by ${egyptScore.final_score - dubaiScore.final_score} points`);
        } else if (dubaiScore.final_score > egyptScore.final_score) {
          console.log(`\n✅ Dubai ranks HIGHER than Egypt by ${dubaiScore.final_score - egyptScore.final_score} points`);
        } else {
          console.log(`\n🤝 Egypt and Dubai are tied`);
        }
      }
    }
  }

  // Get top 10 destinations for first holiday period
  console.log('\n\n🏆 Top 10 Destinations for', holidayPeriods[0]?.name);
  console.log('═══════════════════════════════════════════════════\n');

  const { data: topScores } = await supabase
    .from('scores')
    .select(`
      *,
      destinations:destination_id (name, country)
    `)
    .eq('holiday_period_id', holidayPeriods[0]?.id)
    .order('final_score', { ascending: false })
    .limit(15);

  console.log(`Rank | Destination                   | Final | Weather | Flight | Beach | Kids | Luxury`);
  console.log(`---- | ----------------------------- | ----- | ------- | ------ | ----- | ---- | ------`);

  topScores?.forEach((s, i) => {
    const destName = `${s.destinations.name}, ${s.destinations.country}`;
    const highlight = (destName.includes('Egypt') || destName.includes('Dubai')) ? '>>> ' : '    ';
    console.log(
      `${highlight}${String(i + 1).padStart(2)}  | ${destName.padEnd(29)} | ${String(s.final_score).padStart(5)} | ` +
      `${String(s.weather_score).padStart(7)} | ${String(s.flight_score).padStart(6)} | ` +
      `${String(s.beach_score).padStart(5)} | ${String(s.kid_facilities_score).padStart(4)} | ` +
      `${String(s.luxury_score).padStart(6)}`
    );
  });
}

debugRankings();
