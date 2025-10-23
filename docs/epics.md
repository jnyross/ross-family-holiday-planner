# Epic Breakdown - Phase 2: Frontend Development
## Ross Family Holiday Planner and Tracker

**Project Level:** 2 (Medium - 5-15 stories)
**Phase:** Phase 2 - Planning & Implementation
**Target Stories:** 11 stories across 4 epics
**Estimated Duration:** 2-3 weeks

---

## Epic 1: Foundation & Setup

**Goal:** Complete Next.js project setup, environment configuration, and Supabase integration

**Value:** Establishes solid technical foundation for all frontend features

**Acceptance Criteria:**
- Next.js development server runs without errors
- Supabase client successfully connects to backend
- TypeScript types match database schema
- Environment variables properly configured
- Basic navigation and layout functional

### Stories:

#### Story 1.1: Complete Next.js Project Setup
**Description:** Finalize Next.js project configuration, install all dependencies, and verify build process

**Tasks:**
- Run `npm install` to install all dependencies
- Create `.env.local` file with Supabase credentials
- Test development server (`npm run dev`)
- Verify TypeScript compilation
- Test production build (`npm run build`)
- Fix any dependency conflicts or warnings

**Acceptance Criteria:**
- [ ] Development server starts on http://localhost:3000
- [ ] No TypeScript errors in terminal
- [ ] Production build completes successfully
- [ ] All environment variables loaded correctly

**Estimated Effort:** 0.5 days

---

#### Story 1.2: Supabase Client Integration & Testing
**Description:** Verify Supabase client connection and test data fetching for all tables

**Tasks:**
- Test connection to Supabase using client
- Fetch sample data from `destinations` table
- Fetch sample data from `climate_data` table
- Fetch sample data from `holiday_periods` table
- Fetch sample data from `scores` table
- Verify TypeScript types match database schema
- Create utility functions for common queries

**Acceptance Criteria:**
- [ ] Can successfully fetch data from all 5 tables
- [ ] TypeScript types prevent type errors
- [ ] Error handling works for failed queries
- [ ] Console logs confirm 112 destinations loaded

**Estimated Effort:** 0.5 days

---

#### Story 1.3: Navigation & Layout Components
**Description:** Build reusable layout components with navigation header and responsive design

**Tasks:**
- Create navigation header with links (Home, Destinations, Shortlist, Periods)
- Add mobile-responsive menu (hamburger on mobile)
- Create footer with copyright and links
- Implement dark mode toggle (Tailwind CSS)
- Test layout on mobile, tablet, desktop breakpoints

**Acceptance Criteria:**
- [ ] Navigation works on all pages
- [ ] Mobile menu opens/closes correctly
- [ ] Dark mode toggles between light/dark themes
- [ ] Layout is responsive on mobile (375px) and desktop (1920px)

**Estimated Effort:** 1 day

---

## Epic 2: Destination Browsing & Discovery

**Goal:** Enable users to browse, filter, and view detailed information about all 112 destinations

**Value:** Core discovery experience - users can explore destinations and make informed decisions

**Acceptance Criteria:**
- Users can view all 112 destinations in a list
- Users can filter by region, budget, type, flight hours
- Users can search by destination name or country
- Users can view detailed destination pages with climate data and scores

### Stories:

#### Story 2.1: Destination List View
**Description:** Build main destination list page with cards showing key information

**Tasks:**
- Create `app/destinations/page.tsx` route
- Fetch all destinations from Supabase
- Create `DestinationCard` component showing:
  - Name, country, region
  - Type icon (beach/city/nature/cultural)
  - Flight hours badge
  - Budget level indicator
  - "View Details" link
- Implement grid layout (responsive: 1 col mobile, 2 col tablet, 3 col desktop)
- Add loading state while fetching data
- Add error state if fetch fails

**Acceptance Criteria:**
- [ ] All 112 destinations display in grid layout
- [ ] Cards show correct data from database
- [ ] Loading spinner appears while fetching
- [ ] Error message displays if fetch fails
- [ ] Grid is responsive on all screen sizes

**Estimated Effort:** 1 day

---

#### Story 2.2: Destination Filtering UI
**Description:** Add filter sidebar/panel to narrow destinations by criteria

**Tasks:**
- Create `DestinationFilter` component with:
  - Region multi-select (Europe, Asia, Americas, Africa, Oceania, Middle East)
  - Budget level select (Budget, Mid-range, Luxury)
  - Type multi-select (Beach, City, Nature, Cultural)
  - Flight hours slider (0-15 hours)
  - Search input (name or country)
- Implement filter logic using client-side filtering
- Add "Clear Filters" button
- Show count of filtered results
- Persist filters in URL query parameters

**Acceptance Criteria:**
- [ ] All filters work independently and in combination
- [ ] Filter count updates correctly
- [ ] "Clear Filters" resets to show all 112 destinations
- [ ] Filters persist when refreshing page (URL params)
- [ ] Mobile: filters collapse into expandable panel

**Estimated Effort:** 1.5 days

---

#### Story 2.3: Destination Detail Page
**Description:** Build detailed view for individual destinations with all attributes and scores

**Tasks:**
- Create `app/destinations/[id]/page.tsx` dynamic route
- Fetch destination by ID from Supabase
- Fetch climate data for destination (12 monthly records)
- Fetch scores for destination (all holiday periods)
- Create layout with sections:
  - Hero section (name, country, region, type)
  - Key attributes (flight hours, visa, currency, language, budget)
  - Climate data table (monthly temp and rainfall)
  - Scores section (all holiday periods with breakdown)
  - Notes section (if user has added notes)
- Add "Back to List" navigation
- Add "Add to Shortlist" button (placeholder for Epic 3)

**Acceptance Criteria:**
- [ ] Detail page loads for any destination ID
- [ ] All 12 months of climate data display correctly
- [ ] Scores show for all 8 holiday periods
- [ ] 404 page if destination ID not found
- [ ] Page is mobile-responsive

**Estimated Effort:** 1.5 days

---

#### Story 2.4: Climate Chart Visualization
**Description:** Add visual chart showing temperature and rainfall trends

**Tasks:**
- Install charting library (e.g., Recharts or Chart.js)
- Create `ClimateChart` component
- Plot monthly temperature (line chart with high/low range)
- Plot monthly rainfall (bar chart)
- Highlight holiday period months with different color
- Add legend and axis labels
- Make chart responsive

**Acceptance Criteria:**
- [ ] Chart displays temperature and rainfall for all 12 months
- [ ] Holiday period months are visually highlighted
- [ ] Chart is readable on mobile and desktop
- [ ] Tooltip shows exact values on hover

**Estimated Effort:** 1 day

---

## Epic 3: Candidate & Selection Workflow

**Goal:** Enable users to mark destinations as candidates, make selections, and manage their shortlist

**Value:** Core workflow for decision-making - transforms browsing into actionable holiday planning

**Acceptance Criteria:**
- Users can select a holiday period
- Users can mark destinations as candidates for that period
- Users can change candidate status to selected or rejected
- Users can add notes to shortlist entries
- Users can view all candidates/selections grouped by period

### Stories:

#### Story 3.1: Holiday Period Selector
**Description:** Add UI to select active holiday period for planning

**Tasks:**
- Create `PeriodSelector` component (dropdown or cards)
- Fetch all 8 holiday periods from Supabase
- Display period name, dates, and year
- Allow user to select one active period
- Store selected period in React state (or URL param)
- Show selected period in navigation/header
- Default to next upcoming period

**Acceptance Criteria:**
- [ ] All 8 holiday periods load from database
- [ ] User can select one active period
- [ ] Selected period persists across page navigation
- [ ] Period dates display in readable format (e.g., "Jul 20 - Aug 30, 2025")

**Estimated Effort:** 0.5 days

---

#### Story 3.2: Add to Shortlist (Candidate Marking)
**Description:** Allow users to mark destinations as candidates for selected holiday period

**Tasks:**
- Add "Add to Shortlist" button on destination detail page
- Add "Add to Shortlist" icon button on destination cards
- Implement Supabase insert to `user_shortlists` table
- Set status to "candidate" by default
- Handle duplicate prevention (unique constraint on user/destination/period)
- Show success message/toast
- Update button state (disable if already added)
- Handle authentication requirement (must be logged in)

**Acceptance Criteria:**
- [ ] Button inserts record into `user_shortlists` table
- [ ] Duplicate adds show error message
- [ ] Button disables after adding to prevent duplicates
- [ ] Unauthenticated users see "Login to add" message

**Estimated Effort:** 1 day

---

#### Story 3.3: Shortlist Management Page
**Description:** Build dedicated page to view and manage all shortlist entries

**Tasks:**
- Create `app/shortlist/page.tsx` route
- Fetch user's shortlist entries with joined destination and score data
- Group entries by holiday period
- Show cards for each shortlist entry with:
  - Destination name, country, score
  - Status (candidate/selected/rejected)
  - Notes field (editable)
  - Change status buttons
  - Remove from shortlist button
- Implement status update (candidate → selected/rejected)
- Implement notes update (inline editing or modal)
- Implement remove from shortlist
- Show empty state if no shortlist entries

**Acceptance Criteria:**
- [ ] All shortlist entries display grouped by period
- [ ] User can change status from candidate to selected/rejected
- [ ] User can add/edit notes inline
- [ ] User can remove entries from shortlist
- [ ] Empty state shows helpful message ("No destinations in shortlist yet")

**Estimated Effort:** 1.5 days

---

#### Story 3.4: Score Display & Breakdown
**Description:** Show score breakdown (weather, flight, beach, kids, luxury) on destination pages and shortlist

**Tasks:**
- Create `ScoreBreakdown` component
- Fetch score data for destination/period combination
- Display final score (0-100) prominently
- Show component scores with labels:
  - Weather (30%)
  - Flight (25%)
  - Beach (15%)
  - Kids (15%)
  - Luxury (15%)
- Add visual indicators (progress bars or color-coded badges)
- Show score calculation weights
- Add tooltip explaining scoring algorithm

**Acceptance Criteria:**
- [ ] Final score displays correctly (matches database)
- [ ] All 5 component scores display with weights
- [ ] Visual indicators make scores easy to compare
- [ ] Tooltip explains scoring methodology

**Estimated Effort:** 1 day

---

## Epic 4: Deployment & Polish

**Goal:** Deploy application to production and ensure quality, performance, and usability

**Value:** Makes application accessible to real users with production-grade quality

**Acceptance Criteria:**
- Application deployed to Vercel with custom domain
- All pages load in <2 seconds
- Mobile responsive on iOS and Android
- No console errors or accessibility violations
- Basic authentication working

### Stories:

#### Story 4.1: Vercel Deployment & Environment Setup
**Description:** Deploy Next.js application to Vercel and configure production environment

**Tasks:**
- Connect GitHub repository to Vercel
- Configure environment variables in Vercel dashboard:
  - `NEXT_PUBLIC_SUPABASE_URL`
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- Set up production domain (e.g., holiday-planner.vercel.app)
- Configure build settings (Next.js framework preset)
- Test deployment pipeline (git push → auto deploy)
- Verify Supabase connection in production
- Set up preview deployments for branches

**Acceptance Criteria:**
- [ ] Application accessible at production URL
- [ ] Environment variables loaded correctly
- [ ] Supabase queries work in production
- [ ] Auto-deployment triggers on git push to main
- [ ] Preview URLs work for PR branches

**Estimated Effort:** 0.5 days

---

#### Story 4.2: Basic Authentication Setup
**Description:** Implement user authentication using Supabase Auth

**Tasks:**
- Enable email authentication in Supabase dashboard
- Create `app/login/page.tsx` route
- Add login form (email + password)
- Add "Sign Up" option
- Implement Supabase Auth sign-in/sign-up
- Add authentication check to protected pages (shortlist)
- Create auth context/provider for user state
- Add "Logout" button in navigation
- Redirect unauthenticated users to login

**Acceptance Criteria:**
- [ ] Users can sign up with email/password
- [ ] Users can log in with credentials
- [ ] Shortlist page requires authentication
- [ ] User state persists on page refresh
- [ ] Logout clears user session

**Estimated Effort:** 1 day

---

#### Story 4.3: Performance, Accessibility & Final Polish
**Description:** Optimize performance, ensure accessibility, and fix any remaining issues

**Tasks:**
- Run Lighthouse audit (Performance, Accessibility, Best Practices, SEO)
- Fix any accessibility violations (WCAG 2.1 Level AA)
- Optimize images (use Next.js Image component)
- Add meta tags for SEO (title, description, Open Graph)
- Test on real mobile devices (iOS Safari, Android Chrome)
- Fix any console errors or warnings
- Add loading skeletons for better perceived performance
- Test all user flows end-to-end
- Create favicon and app icons

**Acceptance Criteria:**
- [ ] Lighthouse Performance score >90
- [ ] Lighthouse Accessibility score >95
- [ ] No console errors in production
- [ ] All pages load in <2 seconds
- [ ] Mobile responsive on iOS and Android devices
- [ ] Meta tags and favicon present

**Estimated Effort:** 1 day

---

## Summary

**Total Stories:** 11 stories across 4 epics
**Estimated Total Effort:** 13 days (approximately 2-3 weeks)

### Epic Summary:

| Epic | Stories | Estimated Days |
|------|---------|----------------|
| Epic 1: Foundation & Setup | 3 | 2 days |
| Epic 2: Destination Browsing & Discovery | 4 | 5 days |
| Epic 3: Candidate & Selection Workflow | 4 | 4 days |
| Epic 4: Deployment & Polish | 3 | 2 days |
| **TOTAL** | **11** | **13 days** |

### Story Priority Order:

**Phase 1: Foundation (Must Have)**
1. Story 1.1: Complete Next.js Project Setup
2. Story 1.2: Supabase Client Integration & Testing
3. Story 1.3: Navigation & Layout Components

**Phase 2: Core Features (Must Have)**
4. Story 2.1: Destination List View
5. Story 2.2: Destination Filtering UI
6. Story 2.3: Destination Detail Page
7. Story 3.1: Holiday Period Selector
8. Story 3.2: Add to Shortlist (Candidate Marking)
9. Story 3.3: Shortlist Management Page

**Phase 3: Polish & Deploy (Should Have)**
10. Story 2.4: Climate Chart Visualization
11. Story 3.4: Score Display & Breakdown
12. Story 4.1: Vercel Deployment & Environment Setup
13. Story 4.2: Basic Authentication Setup
14. Story 4.3: Performance, Accessibility & Final Polish

### Dependencies:

- Story 1.2 requires Story 1.1 (setup before testing)
- Story 2.2 requires Story 2.1 (list before filtering)
- Story 2.3 requires Story 2.1 (detail requires list navigation)
- Story 3.2 requires Story 3.1 (period selection before candidate marking)
- Story 3.3 requires Story 3.2 (shortlist page requires add functionality)
- Story 4.1 requires all core features complete (deployment after development)
- Story 4.2 can run in parallel with other stories
- Story 4.3 must be last (final polish after all features)

---

**Next Steps:**

1. Review and approve epic breakdown
2. Begin Story 1.1: Complete Next.js Project Setup
3. Track progress in workflow status file

**Notes:**

- All stories assume Supabase backend is fully functional (Phase 1 complete)
- Stories are sized for 1 developer working solo
- Effort estimates include implementation, testing, and basic documentation
- Adjust priorities based on user feedback after deploying MVP
