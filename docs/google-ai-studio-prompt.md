# Google AI Studio Prompt: Ross Family Holiday Planner

## Meta-Instructions for AI Studio

You are a **Multi-Agent Orchestrator** in Google AI Studio. Your task is to build a comprehensive family holiday planning application using a consensus-based approach with specialized research agents.

### Available Tools You Must Use:
1. **Code Execution** - Run Python/Node.js code to validate logic, test algorithms, prototype features
2. **Google Search** - Research latest frameworks, best practices, competitor analysis, travel APIs
3. **File Upload/Analysis** - Analyze reference files, schemas, design patterns
4. **Multi-Turn Conversation** - Maintain context across planning, research, and implementation phases

### Working Method:

Before starting ANY task, you will:
1. **Deploy Research Agents** - Create 3 specialized agents to research the task from different angles
2. **Synthesize Consensus** - Combine their findings into a unified recommendation
3. **Execute with Validation** - Implement the consensus decision with code execution validation
4. **Document Decisions** - Record all architectural and technical decisions

---

## Project Brief

Build a **Next.js family holiday planning application** that helps families find and evaluate vacation destinations based on data-driven scoring.

### Core Requirements

#### 1. Technology Stack (Research Required)
**Research Agents Should Investigate:**
- Agent 1: Latest Next.js best practices (App Router vs Pages, RSC, streaming)
- Agent 2: Database options (Supabase, PlanetScale, Neon, Firebase)
- Agent 3: Deployment platforms (Vercel, Netlify, Railway, Fly.io)

**Consensus Decision Needed On:**
- Framework version and features
- Database choice and rationale
- Deployment strategy
- State management approach
- UI library (Tailwind, shadcn/ui, MUI, etc.)

#### 2. Data Model (112 Destinations)

**Destinations Table:**
```typescript
interface Destination {
  id: string
  name: string
  country: string
  region: string // e.g., "Caribbean", "Mediterranean", "Southeast Asia"
  type: string // "Beach", "City", "Nature", "Cultural"

  // Logistics
  flight_hours: number // from UK
  time_difference: number // hours from GMT
  visa_required: string // "None", "Visa on arrival", "eVisa required"
  currency: string
  language: string
  budget_level: string // "Budget", "Mid-range", "Luxury"

  // Ratings (0-10)
  beach_pool_quality: number
  kid_facilities_quality: number
  high_star_share: number // 0-1 (percentage of 4-5 star hotels)

  // Planning
  best_months: string // "April-October"
  worst_months: string // "November-March"
  notes: string
}
```

**Climate Data Table:**
```typescript
interface ClimateData {
  id: string
  destination_id: string
  month: number // 1-12
  temperature_celsius: number // average
  temperature_high: number
  temperature_low: number
  rainfall_mm: number
}
```

**Holiday Periods Table:**
```typescript
interface HolidayPeriod {
  id: string
  name: string // "February Half Term 2025"
  start_date: date
  end_date: date
  duration_days: number
  year: number
  term: string // "February Half Term", "Easter", "Summer", etc.
}
```

**Scores Table (Auto-calculated):**
```typescript
interface Score {
  id: string
  destination_id: string
  holiday_period_id: string

  // Component scores (0-100)
  weather_score: number // 30% weight
  flight_score: number // 25% weight
  beach_score: number // 15% weight
  kid_facilities_score: number // 15% weight
  luxury_score: number // 15% weight

  final_score: number // weighted sum
}
```

**User Shortlists Table:**
```typescript
interface UserShortlist {
  id: string
  user_id: string
  destination_id: string
  holiday_period_id: string
  status: "candidate" | "selected" | "rejected"
  notes: string
  created_at: timestamp
}
```

#### 3. Scoring Algorithm (Research Required)

**Research Agents Should:**
- Agent 1: Research weather scoring algorithms (temperature ranges, rainfall thresholds)
- Agent 2: Study family travel ranking factors and weightings
- Agent 3: Analyze competitor scoring methodologies (TripAdvisor, Booking.com)

**Scoring Logic to Implement:**

```python
# Weather Score (30%) - Based on climate during holiday period
def calculate_weather_score(temp_avg, rainfall_mm):
    # Ideal: 24-30°C, <50mm rain
    # Research optimal temperature ranges for family beach holidays
    pass

# Flight Score (25%) - Inversely proportional to flight hours
def calculate_flight_score(flight_hours):
    # Max 15 hours, prefer <8 hours
    pass

# Beach Quality Score (15%)
def calculate_beach_score(beach_pool_quality):
    # 0-10 rating, scale to 0-100
    pass

# Kid Facilities Score (15%)
def calculate_kid_facilities_score(kid_facilities_quality):
    # 0-10 rating, scale to 0-100
    pass

# Luxury Score (15%)
def calculate_luxury_score(high_star_share):
    # Percentage of 4-5 star hotels
    pass
```

**Code Execution Task:**
Prototype the scoring algorithm with sample data and validate results.

#### 4. Core Features (Phase 1: MVP)

**Feature 1: Destination Browsing**
- Grid/list view of all 112 destinations
- Destination cards showing: name, country, type, image, key stats
- Click to view detailed page

**Research Required:**
- Agent 1: Best practices for large dataset rendering (virtualization, pagination)
- Agent 2: Image optimization strategies (next/image, cloudinary, imgix)
- Agent 3: Loading states and skeleton screens

**Feature 2: Advanced Filtering**
- Filter by: region, budget level, destination type, max flight hours
- Search by destination name or country
- Real-time filter updates (debounced)

**Research Required:**
- Agent 1: Client-side vs server-side filtering trade-offs
- Agent 2: URL state management for filters (nuqs, next-usequerystate)
- Agent 3: Filter UI patterns (drawer, sidebar, top bar)

**Feature 3: Destination Detail Page**
- All destination information
- Climate data visualization (table or chart)
- Scores for each holiday period
- "Add to Shortlist" button

**Research Required:**
- Agent 1: Data visualization libraries (Recharts, Chart.js, Victory)
- Agent 2: Climate chart best practices for travel sites
- Agent 3: Detail page layout patterns

**Feature 4: Holiday Period Selection**
- View all 8 UK school holiday periods
- Filter destinations by selected period
- Show scores relevant to selected period

**Feature 5: Shortlist Management**
- View candidate destinations
- Mark as selected/rejected
- Add personal notes
- Compare destinations side-by-side

**Research Required:**
- Agent 1: Comparison table patterns and UX
- Agent 2: Note-taking UI (inline editing, modal, drawer)
- Agent 3: State persistence strategies

#### 5. User Experience

**Research Required for Each:**

**Responsive Design:**
- Agent 1: Mobile-first design patterns for travel apps
- Agent 2: Tailwind responsive breakpoints best practices
- Agent 3: Touch-friendly UI components

**Dark Mode:**
- Agent 1: Dark mode implementation strategies (CSS vars, Tailwind classes)
- Agent 2: Color palette selection for dark mode
- Agent 3: User preference persistence

**Performance:**
- Agent 1: Next.js App Router optimization techniques
- Agent 2: Database query optimization patterns
- Agent 3: Image and asset optimization

**Accessibility:**
- Agent 1: WCAG 2.1 AA compliance checklist
- Agent 2: Keyboard navigation patterns
- Agent 3: Screen reader optimization

#### 6. Architecture Decisions Needed

**Multi-Agent Research Topics:**

1. **Database Choice**
   - Agent 1: Supabase (Postgres, realtime, auth, storage)
   - Agent 2: PlanetScale (MySQL, branching, edge)
   - Agent 3: Firebase (NoSQL, realtime, auth)
   - **Consensus:** Compare pricing, features, developer experience, scaling

2. **Authentication**
   - Agent 1: NextAuth.js (multiple providers, flexible)
   - Agent 2: Supabase Auth (built-in, magic links, social)
   - Agent 3: Clerk (beautiful UI, complete solution)
   - **Consensus:** Evaluate based on UX, cost, maintenance

3. **State Management**
   - Agent 1: React Context + useReducer (native, simple)
   - Agent 2: Zustand (lightweight, flexible)
   - Agent 3: TanStack Query (server state focus)
   - **Consensus:** Consider app complexity and data flow

4. **UI Component Library**
   - Agent 1: shadcn/ui (customizable, accessible, Tailwind)
   - Agent 2: Radix UI primitives (unstyled, accessible)
   - Agent 3: Custom components (full control)
   - **Consensus:** Balance speed, customization, bundle size

5. **Image Handling**
   - Agent 1: next/image with Vercel Image Optimization
   - Agent 2: Cloudinary (transformations, CDN)
   - Agent 3: Unsplash API for stock photos
   - **Consensus:** Cost, performance, developer experience

---

## Your Multi-Agent Workflow

### Phase 1: Research & Architecture (Use Google Search extensively)

**Step 1: Deploy Specialist Agents**

Create detailed research briefs for 3 agents:

```
AGENT 1: Frontend Architect
Research Focus:
- Latest Next.js 15 App Router patterns and best practices
- React 19 Server Components and streaming
- Tailwind CSS 4.0 features and customization
- UI component libraries comparison (shadcn/ui vs others)
- Image optimization strategies for travel apps
- Performance optimization techniques
Use Google Search to find:
- Official Next.js documentation on App Router
- React 19 migration guides
- Tailwind CSS blog posts on new features
- shadcn/ui component examples
- Vercel blog posts on performance

AGENT 2: Backend Architect
Research Focus:
- Database comparison: Supabase vs PlanetScale vs Firebase
- Real-time data synchronization patterns
- PostgreSQL optimization for read-heavy apps
- Scoring algorithm implementation strategies
- Database trigger patterns for auto-calculation
Use Google Search to find:
- Supabase pricing and features documentation
- PlanetScale branching and scaling features
- PostgreSQL performance tuning guides
- Database trigger best practices
- Scoring algorithm implementations in travel sites

AGENT 3: Product & UX Designer
Research Focus:
- Travel website UI/UX patterns (Booking.com, Airbnb, Kayak)
- Filtering and search best practices
- Mobile-first responsive design patterns
- Accessibility standards for travel apps
- Dark mode implementation patterns
Use Google Search to find:
- UX case studies of travel booking sites
- Nielsen Norman Group articles on search/filter
- A11y Project guidelines for travel websites
- Dark mode color palette generators
- Mobile UI patterns for complex filters
```

**Step 2: Synthesize Consensus**

For each decision point, create a comparison table:

```markdown
| Criterion | Option 1 | Option 2 | Option 3 | Winner |
|-----------|----------|----------|----------|--------|
| Developer Experience | ... | ... | ... | ... |
| Performance | ... | ... | ... | ... |
| Cost | ... | ... | ... | ... |
| Scaling | ... | ... | ... | ... |
| Community Support | ... | ... | ... | ... |

Consensus Decision: [Winner + Rationale]
```

### Phase 2: Data Generation (Use Code Execution)

**Step 1: Generate 112 Sample Destinations**

```python
# Use Code Execution to generate realistic sample data
import json
import random

regions = ["Caribbean", "Mediterranean", "Southeast Asia", "Middle East", "Indian Ocean"]
types = ["Beach", "City", "Nature", "Cultural"]

destinations = []
for i in range(112):
    dest = {
        "id": f"dest-{i+1}",
        "name": f"Destination {i+1}",  # Replace with real names
        "country": "...",
        "region": random.choice(regions),
        "type": random.choice(types),
        # ... generate other fields
    }
    destinations.append(dest)

# Generate climate data for each destination (12 months)
climate_data = []
for dest in destinations:
    for month in range(1, 13):
        climate_data.append({
            "destination_id": dest["id"],
            "month": month,
            "temperature_celsius": random.randint(15, 35),
            "rainfall_mm": random.randint(10, 200)
        })

print(json.dumps(destinations, indent=2))
```

**Step 2: Generate 8 UK Holiday Periods**

```python
# Generate 8 UK school holiday periods for 2025-2026
from datetime import datetime, timedelta

periods = [
    ("October Half Term 2025", "2025-10-27", "2025-11-03"),
    ("Christmas 2025", "2025-12-22", "2026-01-05"),
    ("February Half Term 2026", "2026-02-16", "2026-02-23"),
    ("Easter 2026", "2026-03-30", "2026-04-13"),
    ("May Half Term 2026", "2026-05-25", "2026-06-01"),
    ("Summer 2026", "2026-07-20", "2026-08-31"),
    ("October Half Term 2026", "2026-10-26", "2026-11-02"),
    ("Christmas 2026", "2026-12-21", "2027-01-04")
]

holiday_periods = []
for name, start, end in periods:
    start_date = datetime.strptime(start, "%Y-%m-%d")
    end_date = datetime.strptime(end, "%Y-%m-%d")
    duration = (end_date - start_date).days

    holiday_periods.append({
        "name": name,
        "start_date": start,
        "end_date": end,
        "duration_days": duration,
        "year": start_date.year,
        "term": name.split(" ")[0]  # "October", "Christmas", etc.
    })

print(json.dumps(holiday_periods, indent=2))
```

**Step 3: Calculate Scores (Validate Algorithm)**

```python
# Implement and validate scoring algorithm
def calculate_scores(destination, holiday_period, climate_data):
    # Get climate data for the holiday period months
    # Calculate weather score
    # Calculate other component scores
    # Return final weighted score
    pass

# Test with sample data
sample_dest = destinations[0]
sample_period = holiday_periods[0]
sample_climate = [c for c in climate_data if c["destination_id"] == sample_dest["id"]]

score = calculate_scores(sample_dest, sample_period, sample_climate)
print(f"Calculated Score: {score}")
```

### Phase 3: Implementation Plan

**Step 1: Create Project Structure**

```bash
npx create-next-app@latest ross-family-holiday-planner
cd ross-family-holiday-planner

# Install dependencies based on consensus decisions
npm install @supabase/supabase-js
npm install -D tailwindcss postcss autoprefixer
npm install lucide-react  # icons
npm install @tanstack/react-query  # data fetching
```

**Step 2: Database Setup (Use Research Findings)**

Based on consensus, provide:
1. Database schema SQL
2. Seed data scripts
3. Database trigger for auto-calculating scores
4. Connection setup code

**Step 3: Core Components (Provide Scaffolding)**

Generate starter code for:
- `/app/layout.tsx` - Root layout with nav and footer
- `/app/page.tsx` - Homepage with hero and features
- `/app/destinations/page.tsx` - Destinations list with filters
- `/app/destinations/[id]/page.tsx` - Destination detail
- `/app/periods/page.tsx` - Holiday periods selection
- `/app/shortlist/page.tsx` - User shortlist management
- `/components/DestinationCard.tsx` - Reusable destination card
- `/components/FilterPanel.tsx` - Advanced filtering UI
- `/components/ClimateChart.tsx` - Climate visualization
- `/lib/supabase.ts` - Database client and types
- `/lib/queries.ts` - Database query functions

**Step 4: Styling System**

Based on consensus, provide:
- Tailwind configuration with custom colors
- Dark mode setup
- Typography scale
- Component variants

### Phase 4: Validation & Testing (Use Code Execution)

**Test 1: Scoring Algorithm Accuracy**
```python
# Validate scoring produces reasonable results
# Test edge cases (extreme weather, very long flights)
# Ensure scores fall in 0-100 range
```

**Test 2: Filter Performance**
```python
# Benchmark filtering with 112 destinations
# Test debouncing effectiveness
# Validate filter combinations
```

**Test 3: Data Integrity**
```python
# Verify all destinations have 12 climate records
# Check foreign key relationships
# Validate score calculations
```

---

## Expected Deliverables

At the end of this multi-agent process, you should provide:

1. **Architecture Decision Record (ADR)**
   - All consensus decisions with rationale
   - Technology stack with version numbers
   - Trade-off analysis for key decisions

2. **Complete Database Schema**
   - SQL migration files
   - Seed data (112 destinations, climate data, holiday periods)
   - Database triggers for score calculation

3. **Application Code**
   - Fully typed TypeScript Next.js application
   - All pages and components
   - Styling with Tailwind CSS
   - Database queries and API routes

4. **Deployment Guide**
   - Step-by-step deployment to chosen platform
   - Environment variable setup
   - Database migration instructions
   - CI/CD setup if applicable

5. **User Documentation**
   - README with setup instructions
   - Feature documentation
   - API documentation if applicable

6. **Testing Documentation**
   - Test results from code execution validation
   - Performance benchmarks
   - Edge case handling

---

## Reference Implementation

A reference implementation exists at:
- **Live Site:** https://ross-family-holiday-planner.vercel.app
- **GitHub:** https://github.com/jnyross/ross-family-holiday-planner

Use Google Search to explore this implementation, but make independent decisions based on your research consensus.

---

## Success Criteria

Your implementation is successful when:

1. ✅ All 112 destinations are browsable with filtering
2. ✅ Destination detail pages show complete information
3. ✅ Climate data is visualized clearly
4. ✅ Scoring algorithm produces reasonable rankings
5. ✅ Holiday period selection changes scores
6. ✅ Shortlist functionality works end-to-end
7. ✅ Application is responsive (mobile, tablet, desktop)
8. ✅ Dark mode works without visual bugs
9. ✅ Performance is good (Core Web Vitals)
10. ✅ Application is deployed and accessible online

---

## Start Your Multi-Agent Process Now

**Your First Prompt:**

"I am building a family holiday planning application. Let me deploy three research agents to investigate the optimal technology stack:

**Agent 1: Frontend Architect** - Research Next.js 15 App Router, React 19, Tailwind CSS 4.0, and UI component libraries. Use Google Search to find the latest documentation and best practices.

**Agent 2: Backend Architect** - Research Supabase, PlanetScale, and Firebase. Compare features, pricing, and developer experience for a read-heavy travel app. Use Google Search to find real-world case studies.

**Agent 3: Product & UX Designer** - Research travel booking UX patterns, filtering best practices, and mobile-first design. Use Google Search to find examples from Booking.com, Airbnb, and Kayak.

After research, synthesize consensus recommendations and present a comparison table for each decision point."

Good luck! 🚀
