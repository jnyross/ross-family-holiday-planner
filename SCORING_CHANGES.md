# Scoring Algorithm Changes

## Summary

Updated the scoring algorithm to better reflect weather preferences:

1. **Temperature Threshold**: Lowered ideal daytime high from 24°C to 23°C
2. **Weather Weight**: Increased from 20% to 25%
3. **Luxury Weight**: Reduced from 20% to 15% (to accommodate weather increase)

## New Scoring Weights

| Component | Old Weight | New Weight | Change |
|-----------|------------|------------|--------|
| Weather   | 20%        | **25%**    | +5%    |
| Flight    | 25%        | 25%        | -      |
| Jet-lag   | 5%         | 5%         | -      |
| Beach     | 15%        | 15%        | -      |
| Kids      | 15%        | 15%        | -      |
| Luxury    | 20%        | **15%**    | -5%    |
| **Total** | **100%**   | **100%**   | -      |

## Temperature Scoring Changes

### Old: Ideal Range 24-29°C
- < 20°C: 0-50 points (very cold penalty)
- 20-24°C: 50-100 points (mild cold penalty)
- **24-29°C**: 100 points (perfect)
- 29-35°C: 100-50 points (warm penalty)
- > 35°C: 50-0 points (very hot penalty)

### New: Ideal Range 23-29°C ✨
- < 20°C: 0-50 points (very cold penalty)
- 20-**23**°C: 50-100 points (mild cold penalty)
- ****23-29°C**: 100 points (perfect) ← **1°C lower**
- 29-35°C: 100-50 points (warm penalty)
- > 35°C: 50-0 points (very hot penalty)

## Impact Examples

### Example 1: Destination with 23°C average
**Old scoring:**
- Temperature score: ~90 (not quite perfect)
- Weather weight: × 0.20 = ~18 points

**New scoring:**
- Temperature score: 100 (now perfect!)
- Weather weight: × 0.25 = 25 points
- **Net gain: +7 points to final score**

### Example 2: Destination with 26°C average, high luxury
**Old scoring:**
- Weather: 100 × 0.20 = 20 points
- Luxury: 87 × 0.20 = 17.4 points
- Combined: 37.4 points

**New scoring:**
- Weather: 100 × 0.25 = 25 points
- Luxury: 87 × 0.15 = 13.05 points
- Combined: 38.05 points
- **Net gain: +0.65 points to final score**

## How to Apply Migration

The migration file is ready at:
```
./supabase/migrations/20251024130000_adjust_weather_scoring.sql
```

To apply:
1. **If using Supabase CLI:**
   ```bash
   supabase db push
   ```

2. **If using Supabase Dashboard:**
   - Go to SQL Editor
   - Paste the contents of the migration file
   - Run

3. **Manual execution:**
   - The migration will automatically recalculate all scores for all destinations
   - This may take a few seconds depending on database size

## Expected Changes for Easter 2026

Easter 2026 (April 3-19) corresponds to months 4 (April):
- Most Mediterranean destinations will benefit (+5-7 points)
- Northern European destinations with 23°C+ will see improvements
- Luxury-focused destinations may see slight decreases (-1 to -3 points)
- Weather becomes more influential in final rankings

## Files Modified

1. `supabase/migrations/20251024130000_adjust_weather_scoring.sql` (NEW)
   - Updated `calculate_temp_high_score()` function
   - Updated `calculate_final_score()` function
   - Recalculates all scores automatically

2. `app/components/ScoreBreakdown.tsx` (requires update)
   - Update weight displays: Weather 20% → 25%, Luxury 20% → 15%
