# Ranking Algorithm Analysis: Dubai vs Sharm el-Sheikh

## Summary
I've analyzed the ranking algorithm and found **critical data inconsistencies** that are affecting the rankings.

## Current Data

### Destination Properties

| Property | Dubai | Sharm el-Sheikh |
|----------|-------|-----------------|
| Flight Hours | 7.0h | 6.0h |
| Beach/Pool Quality | 8/10 | 9/10 |
| Kid Facilities | 9/10 | 7/10 |
| High Star Share (Luxury) | 78% | 56% |
| Budget Level | Luxury | Budget |

### Sample Scores (Holiday Period e8178bc7)

| Component | Dubai | Sharm el-Sheikh |
|-----------|-------|-----------------|
| Weather Score | 100 | 90 |
| Flight Score | 60 | 75 |
| Beach Score | 80 | 90 |
| Kids Score | 90 | 70 |
| Luxury Score | 78 | 56 |
| **FINAL SCORE** | **82** | **78** |

## Scoring Formula

```
final_score = (weather * 0.30) + (flight * 0.25) + (beach * 0.15) +
              (kids * 0.15) + (luxury * 0.15)
```

### Weight Breakdown:
- Weather: 30%
- Flight: 25%
- Beach: 15%
- Kids: 15%
- Luxury: 15%

## Issues Identified

### 1. Flight Score Calculation Mismatch

**Expected Formula:**
```sql
flight_score = 100 - ((flight_hours / 12.0) * 100)
```

**Expected Scores:**
- Dubai (7h): 100 - (7/12 * 100) = 100 - 58.3 = **42**
- Sharm (6h): 100 - (6/12 * 100) = 100 - 50 = **50**

**Actual Scores in Database:**
- Dubai: **60** (should be 42) ← 18 points too high!
- Sharm: **75** (should be 50) ← 25 points too high!

**Impact:** Both destinations have inflated flight scores, but Sharm benefits more from this error (+25 vs +18).

### 2. Luxury Score for "Budget" Destination

**User Feedback:** "Sharm el Sheikh is not luxury"

**Current Data:**
- Sharm el-Sheikh has `high_star_share = 56%` (56% of hotels are high-star)
- This gives a luxury_score of **56**
- However, it's classified as a "Budget" destination

**Expected:** A "Budget" destination should have much lower luxury scores (probably 20-30%)

**Impact:** Sharm is getting too many points (8.4) from the luxury component when it should get much less (~3-4.5).

### 3. Beach Score Advantage

Sharm has slightly better beach quality (9 vs 8), giving it:
- Sharm: beach_score = 90 (90 * 0.15 = 13.5 points)
- Dubai: beach_score = 80 (80 * 0.15 = 12.0 points)

This 1.5 point advantage is reasonable given the data.

## Corrected Calculation

If we fix ONLY the flight scores and recalculate with correct formula:

### Dubai Corrected Score:
```
(100 * 0.30) + (42 * 0.25) + (80 * 0.15) + (90 * 0.15) + (78 * 0.15)
= 30 + 10.5 + 12 + 13.5 + 11.7
= 77.7 ≈ 78
```

### Sharm el-Sheikh Corrected Score:
```
(90 * 0.30) + (50 * 0.25) + (90 * 0.15) + (70 * 0.15) + (56 * 0.15)
= 27 + 12.5 + 13.5 + 10.5 + 8.4
= 71.9 ≈ 72
```

**Result:** Dubai (78) > Sharm (72) by 6 points ✓

## If We Also Fix Luxury Score

If Sharm's luxury score should be ~25 instead of 56:

### Sharm el-Sheikh with Both Fixes:
```
(90 * 0.30) + (50 * 0.25) + (90 * 0.15) + (70 * 0.15) + (25 * 0.15)
= 27 + 12.5 + 13.5 + 10.5 + 3.75
= 67.25 ≈ 67
```

**Result:** Dubai (78) > Sharm (67) by 11 points ✓

## Recommendations

### Priority 1: Fix Flight Score Calculation
The flight scores in the database don't match the formula. Need to:
1. Verify the `calculate_flight_score()` function is correct
2. Recalculate all scores in the database
3. Check if there's a data import issue

### Priority 2: Review Luxury Data for Sharm el-Sheikh
The `high_star_share` of 56% seems too high for a "Budget" destination. Options:
1. Research actual luxury hotel percentage in Sharm el-Sheikh
2. Update the value to reflect reality (probably 20-30%)
3. Recalculate scores after correction

### Priority 3: Verify Other Destinations
If Sharm el-Sheikh has incorrect data, other destinations might too. Run a full audit:
- Check that Budget destinations have low luxury scores
- Check that Mid-Range destinations have medium luxury scores
- Check that Luxury destinations have high luxury scores

## Root Cause Hypothesis

The scores in the database appear to have been imported or calculated with a different formula than what's currently in the code. The database needs a full recalculation using the `update_all_scores_for_destination()` function for all destinations.
