# Product Requirements Document
## Ross Family Holiday Planner and Tracker

**Version:** 2.0
**Date:** 2025-10-23
**Project Level:** 2 (Medium - 5-15 stories)
**Project Type:** Brownfield Software
**Status:** Phase 1 Complete (Backend), Phase 2 Planning (Frontend)

---

## Executive Summary

The Ross Family Holiday Planner is a web application designed to help families discover, evaluate, and plan holidays to destinations worldwide. The system uses a data-driven scoring algorithm to recommend destinations based on weather conditions, flight duration, and family-friendly amenities during specific holiday periods.

**Phase 1 (Complete):** Supabase backend with 112 destinations, 1,344 climate records, 8 holiday periods, and automated scoring system
**Phase 2 (In Progress):** Next.js frontend for browsing, filtering, and managing holiday selections

### Core Value Proposition

- **Data-Driven Discovery:** Browse 112 destinations with objective climate data and scoring
- **Family-Focused:** Prioritize kid-friendly facilities, beach quality, and suitable weather
- **Time-Efficient:** Pre-calculated scores for each destination/holiday period combination
- **Selection Workflow:** Simple candidate → selection → tracking process

---

## 1. Product Context

### 1.1 Problem Statement

Planning family holidays requires juggling multiple factors: school holiday dates, weather conditions, flight duration, child-friendly amenities, and budget constraints. Current solutions require manual research across multiple websites and lack an integrated view of how destinations perform during specific holiday periods.

### 1.2 Target Users

**Primary:** Families with children planning 1-2 week holidays during school breaks

**User Characteristics:**
- Tech-comfortable but prioritize simplicity
- Want reliable recommendations over extensive features
- Need to coordinate around fixed school holiday dates
- Value objective data (weather, flight times) over subjective reviews

### 1.3 Success Criteria

**Phase 2 Completion:**
- Users can browse and filter 112 destinations
- Users can mark candidates for specific holiday periods
- Users can make final selections and add notes
- System displays pre-calculated scores for destination/period combinations
- Frontend deployed on Vercel with Supabase integration

---

## 2. User Workflows

### 2.1 Primary User Journey

```
1. VIEW destinations
   ↓
2. MARK candidates for a holiday period
   ↓
3. SELECT final destination(s)
   ↓
4. TRACK selections with notes
```

### 2.2 Core Use Cases

**UC1: Browse Destinations**
- User views list of 112 destinations with key attributes
- User filters by region, budget level, flight duration, or type
- User sees climate data for selected months
- User views destination scores for specific holiday periods

**UC2: Mark Candidates**
- User selects a holiday period from 8 available periods
- User marks destinations as "candidates" for that period
- User can add notes to candidate destinations
- User sees all candidates grouped by holiday period

**UC3: Make Selections**
- User reviews candidate destinations
- User changes status from "candidate" to "selected"
- User can reject candidates (status: "rejected")
- User tracks selected destinations with notes

**UC4: View Climate & Scoring**
- User sees monthly temperature (avg, high, low) and rainfall for any destination
- User views weather score, flight score, beach score, kids score, luxury score
- User sees final weighted score (0-100) for destination/period combinations
- Scores automatically account for holiday period dates and climate data

---

## 3. Functional Requirements

### 3.1 Destination Management

**FR1.1 Destination Database**
- System maintains 112 holiday destinations across 6 continents
- Each destination includes: name, country, region, type (beach/city/nature/cultural)
- Flight hours from UK, time difference, visa requirements
- Currency, language, budget level (budget/mid-range/luxury)
- Best/worst months for visiting

**FR1.2 Destination Attributes**
- High-star hotel share (0.0-1.0 representing % of 4-5 star hotels)
- Beach/pool quality rating (1-10)
- Kid facilities quality rating (1-10)
- Visited flag (boolean)
- User notes field

### 3.2 Climate Data

**FR2.1 Monthly Climate Records**
- System stores 1,344 climate data records (112 destinations × 12 months)
- Each record includes: average temperature, high temperature, low temperature, rainfall (mm)
- Climate data sourced from historical weather databases
- Temperature in Celsius, rainfall in millimeters

**FR2.2 Climate Display**
- Frontend displays climate graphs/charts for selected destinations
- Show temperature ranges (high/low) and rainfall by month
- Highlight holiday period months in climate visualizations

### 3.3 Holiday Periods

**FR3.1 School Holiday Tracking**
- System maintains 8 UK school holiday periods
- Each period includes: name, start date, end date, year
- Examples: Summer 2025, February Half-Term 2026, Easter 2026

**FR3.2 Period Selection**
- Users select one or more holiday periods for planning
- System filters/sorts destinations based on selected period
- Scores recalculate automatically for selected period dates

### 3.4 Scoring System

**FR4.1 Automated Scoring Algorithm**
- System calculates 5 component scores for each destination/period:
  - **Weather Score (30% weight):** Based on temperature and rainfall during holiday period
  - **Flight Score (25% weight):** Based on flight duration from UK
  - **Beach Score (15% weight):** Based on beach/pool quality rating
  - **Kid Facilities Score (15% weight):** Based on kid facilities rating
  - **Luxury Score (15% weight):** Based on high-star hotel share

**FR4.2 Score Calculation Rules**

*Weather Score:*
- Optimal temperature: 25-30°C (score: 100)
- Acceptable: 20-25°C or 30-35°C (score: 70-99)
- Marginal: 15-20°C or 35-40°C (score: 40-69)
- Poor: <15°C or >40°C (score: 0-39)
- Rainfall penalty: -10 points per 50mm over 50mm threshold

*Flight Score:*
- <4 hours: 100 points
- 4-8 hours: 80 points
- 8-12 hours: 50 points
- >12 hours: 20 points

*Beach Score:*
- Direct mapping: rating × 10 (e.g., 8/10 → 80 points)

*Kid Facilities Score:*
- Direct mapping: rating × 10 (e.g., 7/10 → 70 points)

*Luxury Score:*
- Direct mapping: high_star_share × 100 (e.g., 0.65 → 65 points)

**FR4.3 Score Persistence**
- Scores pre-calculated in database for all destination/period combinations
- Scores automatically recalculate when destinations, climate data, or periods change
- Database triggers maintain score integrity

### 3.5 User Shortlist Management

**FR5.1 Candidate Marking**
- Users mark destinations as "candidate" for specific holiday periods
- Multiple candidates allowed per holiday period
- Candidates tracked per user and per holiday period
- Status options: candidate, selected, rejected

**FR5.2 Selection Workflow**
- Users can change candidate status to "selected"
- Users can reject candidates (status: "rejected")
- Users can add/edit notes for any shortlist entry
- System tracks creation and update timestamps

**FR5.3 Shortlist Views**
- Frontend displays all candidates grouped by holiday period
- Filter/sort by status (candidate/selected/rejected)
- Show destination details and scores alongside shortlist entries
- Allow quick navigation from shortlist to full destination details

---

## 4. Technical Architecture

### 4.1 Technology Stack

**Backend:**
- Supabase (PostgreSQL 15+)
- SQL functions for scoring calculations
- Database triggers for automatic recalculation
- Row Level Security (RLS) for user data isolation

**Frontend:**
- Next.js 15 (App Router)
- React 19 with TypeScript
- Tailwind CSS for styling
- Supabase JS client for API integration

**Deployment:**
- Backend: Supabase Cloud (deployed)
- Frontend: Vercel (planned)

### 4.2 Database Schema

**Tables:**

```sql
destinations (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL,
  region TEXT NOT NULL,
  type TEXT NOT NULL,
  flight_hours DECIMAL(4,2),
  time_difference DECIMAL(3,1),
  visa_required TEXT,
  currency TEXT,
  language TEXT,
  budget_level TEXT,
  best_months TEXT,
  worst_months TEXT,
  high_star_share DECIMAL(3,2),
  beach_pool_quality INTEGER,
  kid_facilities_quality INTEGER,
  notes TEXT,
  visited BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ
)

climate_data (
  id UUID PRIMARY KEY,
  destination_id UUID REFERENCES destinations(id),
  month INTEGER CHECK (month BETWEEN 1 AND 12),
  temperature_celsius DECIMAL(4,1),
  rainfall_mm DECIMAL(5,1),
  temperature_high DECIMAL(4,1),
  temperature_low DECIMAL(4,1),
  created_at TIMESTAMPTZ
)

holiday_periods (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  year INTEGER NOT NULL,
  created_at TIMESTAMPTZ
)

scores (
  id UUID PRIMARY KEY,
  destination_id UUID REFERENCES destinations(id),
  holiday_period_id UUID REFERENCES holiday_periods(id),
  weather_score DECIMAL(5,2),
  flight_score DECIMAL(5,2),
  beach_score DECIMAL(5,2),
  kid_facilities_score DECIMAL(5,2),
  luxury_score DECIMAL(5,2),
  final_score DECIMAL(5,2),
  calculated_at TIMESTAMPTZ,
  UNIQUE(destination_id, holiday_period_id)
)

user_shortlists (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id),
  destination_id UUID REFERENCES destinations(id),
  holiday_period_id UUID REFERENCES holiday_periods(id),
  status TEXT CHECK (status IN ('candidate', 'selected', 'rejected')),
  notes TEXT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  UNIQUE(user_id, destination_id, holiday_period_id)
)
```

### 4.3 Scoring Functions

**Database Functions (PostgreSQL):**

```sql
-- Calculate weather score based on temperature and rainfall
calculate_weather_score(destination_id, holiday_period_id) RETURNS DECIMAL

-- Calculate flight score based on duration
calculate_flight_score(flight_hours) RETURNS DECIMAL

-- Calculate beach score (direct mapping)
calculate_beach_score(beach_pool_quality) RETURNS DECIMAL

-- Calculate kid facilities score (direct mapping)
calculate_kid_facilities_score(kid_facilities_quality) RETURNS DECIMAL

-- Calculate luxury score (direct mapping)
calculate_luxury_score(high_star_share) RETURNS DECIMAL

-- Calculate final weighted score
calculate_final_score(weather, flight, beach, kids, luxury) RETURNS DECIMAL

-- Recalculate all scores for destination/period combination
recalculate_scores(destination_id, holiday_period_id) RETURNS VOID
```

**Triggers:**
- `trigger_recalculate_on_destination_update`: Fires when destination attributes change
- `trigger_recalculate_on_climate_update`: Fires when climate data changes
- `trigger_recalculate_on_period_update`: Fires when holiday period dates change

### 4.4 Frontend Architecture

**Pages (Next.js App Router):**

```
app/
├── layout.tsx              # Root layout with navigation
├── page.tsx                # Home/dashboard
├── destinations/
│   ├── page.tsx            # Destination list with filters
│   └── [id]/
│       └── page.tsx        # Destination detail view
├── shortlist/
│   └── page.tsx            # User shortlist management
└── periods/
    └── page.tsx            # Holiday period selection
```

**Components:**
- `DestinationCard`: Display destination summary with score
- `DestinationFilter`: Filter UI (region, budget, type, flight hours)
- `ClimateChart`: Visualize monthly temperature and rainfall
- `ScoreBreakdown`: Show component scores (weather, flight, beach, kids, luxury)
- `ShortlistButton`: Add/remove from candidates
- `PeriodSelector`: Select active holiday period

**State Management:**
- React hooks for local component state
- URL query parameters for filter state
- Supabase real-time subscriptions for score updates (optional)

### 4.5 API Integration

**Supabase Client:**
- Read-only access to destinations, climate_data, holiday_periods, scores
- Read/write access to user_shortlists (with RLS)
- Authentication via Supabase Auth (email/password or magic link)

**API Calls:**
```typescript
// Fetch destinations with filters
supabase.from('destinations').select('*').eq('region', 'Europe')

// Fetch scores for specific period
supabase.from('scores')
  .select('*, destinations(*)')
  .eq('holiday_period_id', periodId)
  .order('final_score', { ascending: false })

// Add to shortlist
supabase.from('user_shortlists').insert({
  user_id, destination_id, holiday_period_id, status: 'candidate'
})
```

---

## 5. Non-Functional Requirements

### 5.1 Performance
- Destination list loads in <2 seconds
- Filter operations respond in <500ms
- Score queries leverage database indexes for fast retrieval

### 5.2 Reliability
- 99.9% uptime (Supabase SLA)
- Database triggers ensure score consistency
- Graceful error handling with user-friendly messages

### 5.3 Usability
- Mobile-responsive design (Tailwind CSS)
- Accessible UI (WCAG 2.1 Level AA)
- Clear visual hierarchy for scores and climate data

### 5.4 Security
- Row Level Security (RLS) ensures users only see their own shortlists
- Environment variables for API keys
- Supabase handles authentication and authorization

### 5.5 Maintainability
- TypeScript for type safety
- Modular component architecture
- Database functions encapsulate business logic
- Automated score recalculation reduces manual maintenance

---

## 6. Implementation Status

### 6.1 Phase 1: Backend Setup (COMPLETE ✅)

**Completed:**
- ✅ Supabase project created and configured
- ✅ Database schema implemented (5 tables)
- ✅ 112 destinations loaded with full attribute data
- ✅ 1,344 climate records loaded (monthly data for all destinations)
- ✅ 8 holiday periods defined (school holidays 2025-2026)
- ✅ Scoring SQL functions implemented (weather, flight, beach, kids, luxury)
- ✅ Database triggers created for automatic score recalculation
- ✅ Scores pre-calculated for all destination/period combinations
- ✅ Row Level Security (RLS) policies configured

**Validation:**
- Database contains 112 unique destinations
- Climate data coverage: 100% (all destinations × 12 months)
- Score calculations verified against test cases
- Triggers confirmed working on test data updates

### 6.2 Phase 2: Frontend Development (IN PROGRESS 🚧)

**Completed:**
- ✅ Next.js 15 project initialized with TypeScript and Tailwind CSS
- ✅ Supabase client configured with TypeScript types
- ✅ Project structure established (App Router)
- ✅ Basic layout and home page created

**In Progress:**
- 🚧 Destination list view with filtering
- 🚧 Destination detail pages with climate charts
- 🚧 Holiday period selector
- 🚧 Candidate marking interface
- 🚧 Shortlist management page
- 🚧 Score display components
- 🚧 Deployment to Vercel

**Pending:**
- ⏳ User authentication (Supabase Auth)
- ⏳ Mobile responsive testing
- ⏳ Performance optimization
- ⏳ Accessibility audit

---

## 7. Constraints & Assumptions

### 7.1 Constraints

**Technical:**
- Must use Supabase for backend (already deployed)
- Must deploy frontend to Vercel
- Database schema is fixed (112 destinations, existing structure)
- Scoring algorithm is implemented in SQL functions (cannot modify without database migration)

**User:**
- UK-based users (flight hours and holiday periods assume UK origin)
- School holiday periods are UK-specific
- Single currency display (convert to GBP)

**Timeline:**
- Phase 2 (Frontend) target: 2-3 weeks for MVP
- No major database schema changes during Phase 2

### 7.2 Assumptions

**Data:**
- Climate data is reasonably accurate (sourced from historical averages)
- Destination attributes (beach quality, kid facilities) are subjective but consistent
- 112 destinations provide sufficient coverage for initial release

**Users:**
- Users trust data-driven scoring over subjective reviews
- Users are comfortable with web application (not mobile app initially)
- Users can self-serve without extensive onboarding

**Technical:**
- Supabase free tier sufficient for initial user base
- Vercel free tier sufficient for frontend hosting
- No real-time collaboration features needed (single user per family)

---

## 8. Success Metrics

### 8.1 Phase 2 Launch Criteria

**Functional Completeness:**
- [ ] Users can browse all 112 destinations
- [ ] Users can filter by region, budget, type, flight hours
- [ ] Users can view destination details with climate data
- [ ] Users can select a holiday period
- [ ] Users can mark destinations as candidates
- [ ] Users can change candidate status to selected/rejected
- [ ] Users can add notes to shortlist entries
- [ ] Scores display correctly for all destination/period combinations

**Technical Readiness:**
- [ ] Frontend deployed to Vercel
- [ ] Environment variables configured
- [ ] Supabase integration tested
- [ ] Mobile responsive on iOS and Android
- [ ] Page load times <2 seconds
- [ ] No console errors or warnings

### 8.2 Post-Launch Metrics (Future)

**Engagement:**
- Average number of candidates marked per user
- Conversion rate: candidates → selections
- Time spent browsing destinations
- Filter usage patterns

**Data Quality:**
- User feedback on score accuracy
- Destinations with most candidate selections
- Popular holiday periods

---

## 9. Future Enhancements

**Post-MVP Features (Not in Scope for Phase 2):**

- **Advanced Filtering:** Multi-select filters, saved filter presets
- **Comparison View:** Side-by-side destination comparison
- **Budget Tracking:** Estimated costs per destination
- **Trip Planning:** Multi-destination itineraries
- **Collaboration:** Share shortlists with family members
- **Mobile App:** Native iOS/Android apps
- **Notifications:** Price alerts, weather updates
- **Reviews:** User-generated reviews and photos
- **AI Recommendations:** Machine learning for personalized suggestions

---

## 10. Appendices

### A. Scoring Algorithm Examples

**Example 1: Maldives in July**
- Weather Score: 85 (avg temp 28°C, rainfall 150mm = -20 penalty)
- Flight Score: 50 (11 hours)
- Beach Score: 100 (10/10 beach quality)
- Kid Facilities Score: 60 (6/10 kid facilities)
- Luxury Score: 95 (0.95 high-star share)
- **Final Score:** (85×0.3) + (50×0.25) + (100×0.15) + (60×0.15) + (95×0.15) = **79.75**

**Example 2: Cornwall, UK in August**
- Weather Score: 65 (avg temp 18°C, rainfall 80mm)
- Flight Score: 100 (<1 hour drive, counted as <4 hours)
- Beach Score: 70 (7/10 beach quality)
- Kid Facilities Score: 80 (8/10 kid facilities)
- Luxury Score: 40 (0.40 high-star share)
- **Final Score:** (65×0.3) + (100×0.25) + (70×0.15) + (80×0.15) + (40×0.15) = **73.00**

### B. References

**Weather Data Sources:**
- World Weather Online Historical Data
- Climate-Data.org
- National Meteorological Services

**Destination Data:**
- TripAdvisor destination categories
- Booking.com property data (for high-star share)
- Family travel blogs and reviews (for kid facilities ratings)

---

**Document Control**

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-10-22 | John | Initial PRD for backend setup |
| 2.0 | 2025-10-23 | John | Merged with Product Brief, updated for Phase 2 frontend |

**Approval Status:** Draft (awaiting review and epic breakdown)
