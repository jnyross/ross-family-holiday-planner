# Product Brief: Ross Family Holiday Planner and Tracker

**Date:** 2025-10-22
**Author:** John
**Status:** Draft for PM Review

---

## Executive Summary

**Core Vision:** Family holiday destination scoring and planning system for young children (0-7 years), helping parents select the best destinations from 200+ options across 8 annual holiday periods.

**Key Insight from Previous Work:** Existing PRD (v1.0) defined the scoring algorithm and data model. However, technical implementations have been unreliable. Need to pivot focus to:
- Bulletproof, minimal-setup cloud backend
- Proper frontend for candidate/selection workflow
- Proven, reliable technology choices

**Critical User Workflow:**
1. View scored destinations for specific holiday period
2. Mark destinations as "candidates" for consideration
3. Compare candidates and mark final "selection"
4. Track selections across multiple holidays

**Technical Priorities:** Reliability over features, minimal setup/maintenance, proper UI for family use.

---

## Problem Statement

### The Core Problem

Planning family holidays for young children (0-7 years) requires evaluating 200+ destinations across 8 annual holiday periods, considering multiple factors: weather, flight time, beach/pool quality, kid facilities, and hotel luxury. Manual research is time-consuming and inconsistent.

### Technical Frustrations from Previous Attempts

**Notion/Airtable (Manual Tools):**
- Required constant manual updates and maintenance
- Not automatable via CLI/APIs
- Claude Code couldn't configure or manage them
- Data entry was tedious and error-prone

**Supabase (Backend-Only Solution):**
- Backend/database setup was promising
- **Critical Gap:** No integrated frontend hosting solution
- Deployment complexity for frontend was a blocker
- Requires separate hosting service and DevOps knowledge

### What's Actually Needed

**Non-negotiable requirements:**
1. **Fully automatable:** Claude Code must be able to configure everything via CLI/APIs
2. **End-to-end managed:** Backend + Frontend + Hosting in one platform
3. **Zero DevOps:** No manual deployment, infrastructure management, or maintenance
4. **Family-friendly UI:** Simple web app that works on mobile and desktop
5. **Reliability over features:** Proven, stable technology choices

**The gap:** Need a single managed platform that handles database, business logic, frontend hosting, and deployment - all configurable via CLI.

---

## Proposed Solution

### Platform Decision: Supabase + Vercel

**Based on expert multi-model consensus analysis (3 AI models consulted via Zen MCP), this architecture was selected as the optimal solution.**

**Why Supabase + Vercel Won:**

| Criteria | Assessment |
|----------|------------|
| **Architectural Fit** | ⭐⭐⭐⭐⭐ Perfectly preserves PostgreSQL-based design from existing PRD |
| **Database-Native Automation** | ✅ SQL triggers/functions provide immediate consistency, <1s updates |
| **End-to-End Solution** | ✅ Supabase (backend) + Vercel (frontend) = complete stack |
| **CLI Automation** | ✅ Both have excellent CLIs - fully automatable by Claude Code |
| **Zero DevOps** | ✅ `supabase deploy` + `vercel deploy` - no infrastructure management |
| **Reliability** | ✅ PostgreSQL constraints guarantee data integrity |
| **Free Tier** | ✅ Both platforms offer generous free tiers for family use |
| **Maintenance** | ✅ Low - logic lives in SQL, frontend is static build |

**Architecture Components:**

1. **Backend: Supabase (PostgreSQL)**
   - Database with 200+ destinations, climate data, scores
   - SQL functions for scoring calculations (weather, flight, beach, kids, luxury)
   - Database triggers for automatic score recalculation
   - Auto-generated REST API for frontend access
   - Supabase CLI for schema migrations and deployment

2. **Frontend: Vercel (Next.js/React)**
   - Simple responsive web app (mobile + desktop)
   - View ranked destinations by holiday period
   - Mark destinations as candidates
   - Select final destination for each holiday
   - Vercel CLI for automated deployment

3. **Data Import: Python Scripts**
   - One-time climate data import via APIs
   - Destination data import from CSV
   - Runs locally, deployed once via Supabase CLI

**Phased Implementation Approach:**

**Phase 1 (Quick Validation - Week 1):**
- Set up Supabase database with PRD schema
- Implement SQL functions and triggers
- Import initial destination data
- Use Supabase Studio UI for testing
- **Deliverable:** Working scoring system, no custom frontend yet

**Phase 2 (Production UI - 1-2 days):**
- Build minimal Next.js frontend on Vercel
- 3 core pages: Holiday selector, Destination list, Candidate management
- Deploy to Vercel with automatic SSL and CDN
- **Deliverable:** Complete family-friendly web app

**Why Firebase Was Rejected:**

Expert consensus identified critical architectural mismatches:
- ❌ NoSQL (Firestore) conflicts with SQL-based scoring design in existing PRD
- ❌ Eventual consistency + cold-start delays risk violating <1s update requirement
- ❌ Would require complete rewrite of well-designed PostgreSQL triggers/functions
- ❌ Weaker data integrity guarantees (no UNIQUE constraints, foreign keys in database)
- ⚠️ Single-platform simplicity doesn't justify abandoning solid architectural foundation

**Consensus Confidence:** 2 of 3 models strongly recommended Supabase + Vercel (8/10 and 9/10 confidence). 1 model advocated Firebase but acknowledged NoSQL trade-offs.

---

## Target Users

### Primary User Segment

**Profile:** Parent (John) planning family holidays for young children (0-7 years old)

**Characteristics:**
- Based in London/Southeast England
- Plans 3-5 family holidays per year
- Prefers luxury/high-quality stays (no budget constraints)
- Prioritizes shorter flights for young children
- Values reliable, predictable weather
- Needs high-quality beach/pool facilities and kid amenities

**Pain Points:**
- Manual research across 200+ destinations is time-consuming
- Difficult to compare destinations across multiple scoring factors
- Hard to remember which destinations were considered and why
- Weather data changes seasonally - need to evaluate 8 different holiday periods
- Previous tools (Notion, Airtable) required too much manual maintenance

**Success Criteria:**
- Can quickly view top-ranked destinations for any holiday period
- Can mark destinations as candidates for consideration
- Can track final selections across all holidays
- System updates automatically - zero manual intervention needed

### Secondary User Segment

**Family Members:** Other family members who may view and provide input

**Characteristics:**
- Access same ranked destination data
- May have different preferences (e.g., partner, older children)
- Need simple, intuitive interface

**Usage Pattern:**
- View-only access initially (Phase 1)
- May provide feedback on candidate destinations
- Future: Could mark their own preferences/votes

---

## Goals and Success Metrics

### Business Objectives

**Primary Goal:** Create a reliable, zero-maintenance holiday planning system that provides automated destination scoring and selection tracking.

**Success Metrics:**
1. ✅ System fully operational with 200+ destinations scored
2. ✅ Zero manual script execution required for daily use
3. ✅ Complete working system deployed within 2 weeks
4. ✅ All 8 holiday periods have ranked destinations
5. ✅ Frontend and backend fully automated via CLI (Claude Code can configure)

### User Success Metrics

**Planning Efficiency:**
- Reduce destination research time from hours to minutes per holiday
- View top 20 destinations for any holiday period in <2 seconds
- Mark candidates and selections in <5 clicks

**Data Quality:**
- 100% of destinations have complete climate data (12 months)
- 100% of destinations have all scoring factors (beach, kids, luxury, flight time)
- Scores auto-update within 1 second of any data change

**User Confidence:**
- User trusts scores for real holiday booking decisions
- Top recommendations align with user preferences (validated against past choices)
- Can maintain database independently without technical help

### Key Performance Indicators (KPIs)

| KPI | Target | Measurement |
|-----|--------|-------------|
| **Destination Coverage** | 200+ destinations | Database record count |
| **Climate Data Completeness** | 100% | No NULL values in climate_data table |
| **Score Update Speed** | <1 second | Trigger execution time |
| **User Adoption** | Daily use during planning | Access logs during planning periods |
| **System Reliability** | 99%+ uptime | Supabase/Vercel status monitoring |
| **Candidate → Selection Rate** | Track conversion | User marks candidate, then selects |

---

## Strategic Alignment and Financial Impact

### Financial Impact

{{financial_impact}}

### Company Objectives Alignment

{{company_objectives_alignment}}

### Strategic Initiatives

{{strategic_initiatives}}

---

## MVP Scope

### Core Features (Must Have)

**Phase 1: Backend & Scoring System**
1. **Destination Database**
   - 200+ destinations with complete data (name, country, region, flight time, etc.)
   - Beach/pool quality ratings (1-10 scale)
   - Kid facilities quality ratings (1-10 scale)
   - High star share percentage (luxury hotels metric)

2. **Climate Data**
   - 12 months of temperature data per destination
   - 12 months of rainfall data per destination
   - Automated import via Weather APIs (Visual Crossing, Open-Meteo fallback)

3. **Automated Scoring**
   - SQL functions for all scoring components (weather, flight, beach, kids, luxury)
   - Database triggers for automatic score recalculation
   - Scores for all 8 holiday periods (Christmas 2025, Feb Half-Term 2026, Easter 2026, May Half-Term 2026, Summer 2026, Oct Half-Term 2026, Christmas 2026, Easter 2027)
   - Component scores visible (not just final score)

4. **Supabase Studio Interface (Phase 1 UI)**
   - View/edit destinations via Supabase Studio web UI
   - View ranked scores per holiday period
   - Manual data entry for new destinations

**Phase 2: Custom Frontend (Production)**
5. **Holiday Period Selection**
   - Simple dropdown/menu to select which holiday period to view
   - Display current period prominently

6. **Ranked Destination List**
   - Top 20 destinations per selected holiday period
   - Display: Rank, Name, Country, Final Score, Component Scores
   - Sort by final score (default), filterable by region
   - Color coding: Green (90-100), Yellow (70-89), Gray (<70)

7. **Candidate Management**
   - Mark/unmark destinations as "candidates" for consideration
   - View all candidates for a specific holiday period
   - Compare candidates side-by-side (basic comparison view)

8. **Selection Tracking**
   - Mark one destination as "selected" for each holiday period
   - View all selections across all holidays (planning overview)
   - Clear visual distinction between candidates and final selection

9. **Responsive Design**
   - Works on desktop and mobile browsers
   - Simple, clean interface
   - No authentication required (single family use)

### Out of Scope for MVP

**Not Included in V1 (Future Enhancements):**
- ❌ Real-time flight price integration
- ❌ Hotel booking integration
- ❌ Multi-user authentication and permissions
- ❌ Voting/rating system for family members
- ❌ Trip history and past holiday tracking
- ❌ Budget/cost tracking
- ❌ Packing lists or itinerary planning
- ❌ Native mobile apps (use responsive web app)
- ❌ Offline support
- ❌ Push notifications
- ❌ Social sharing features
- ❌ AI-powered recommendations beyond scoring
- ❌ Custom scoring weight adjustments via UI (can be changed in SQL)

**Why These Are Out:**
- Focus on core scoring and selection workflow first
- Keep MVP scope achievable within 2-week timeline
- Validate core concept before adding complexity
- Many features available in other apps (Google Flights, Booking.com)

### MVP Success Criteria

**Phase 1 Complete When:**
- ✅ 200+ destinations with complete data in Supabase
- ✅ All 8 holiday periods have scored destinations
- ✅ Scores auto-update when data changes (validated via Supabase Studio)
- ✅ Climate data 100% complete
- ✅ Top 20 destinations per holiday make intuitive sense

**Phase 2 Complete When:**
- ✅ Vercel frontend deployed and accessible
- ✅ Can view ranked destinations for any holiday period
- ✅ Can mark candidates and select final destination
- ✅ Works on mobile and desktop
- ✅ User can complete full planning workflow without technical help

**Overall MVP Success:**
- ✅ User trusts system for real holiday planning decisions
- ✅ Complete planning for one holiday period using the system
- ✅ Zero manual intervention needed after initial setup
- ✅ System deployed and accessible 24/7

---

## Post-MVP Vision

### Phase 2 Features

{{phase_2_features}}

### Long-term Vision

{{long_term_vision}}

### Expansion Opportunities

{{expansion_opportunities}}

---

## Technical Considerations

### Platform Requirements

**Supabase (Backend/Database):**
- PostgreSQL database (managed service)
- Free tier: 500MB database, 2GB bandwidth/month
- Region: Europe-west (closest to UK user)
- Supabase CLI for all configuration and deployment
- Auto-generated REST API for frontend access
- Built-in Supabase Studio for database management

**Vercel (Frontend Hosting):**
- Next.js framework (React-based)
- Free tier: 100GB bandwidth, automatic SSL, global CDN
- Vercel CLI for deployment automation
- Git integration for CI/CD (optional)
- Automatic preview deployments

**Development Tools:**
- Node.js (latest LTS) for CLIs and build tools
- Python 3.x for data import scripts
- Git for version control
- VSCode or preferred IDE

### Technology Stack

**Backend:**
- **Database:** PostgreSQL 15+ (via Supabase)
- **Schema Migrations:** Supabase CLI migrations
- **Functions:** PostgreSQL PL/pgSQL functions
- **Triggers:** PostgreSQL database triggers
- **API:** Auto-generated PostgREST API (Supabase)

**Frontend:**
- **Framework:** Next.js 14+ (React)
- **Language:** TypeScript (type safety)
- **Styling:** Tailwind CSS (rapid development)
- **State:** React hooks + Supabase client
- **API Client:** Supabase JavaScript client

**Data Import:**
- **Language:** Python 3.x
- **APIs:** Visual Crossing Weather API (primary), Open-Meteo (fallback)
- **Libraries:** supabase-py, requests, pandas

### Architecture Patterns

**Database-Native Automation:**
- All scoring logic lives in PostgreSQL functions
- Triggers fire automatically on data changes
- No application-layer scoring code (reliability priority)
- Single source of truth in database

**Stateless Frontend:**
- Frontend is thin client (display + interaction only)
- All data comes from Supabase REST API
- No frontend state persistence (read from database)
- Simple, maintainable codebase

**CLI-First Development:**
- All infrastructure as code
- Supabase: migrations in SQL files
- Vercel: configuration in vercel.json
- Reproducible deployments

**Phased Deployment:**
- Phase 1: Backend only (Supabase Studio UI)
- Phase 2: Add custom frontend (Vercel)
- Allows validation at each phase

---

## Constraints and Assumptions

### Constraints

**Time:**
- Target: Complete MVP within 2 weeks
- Phase 1 (backend): 1 week
- Phase 2 (frontend): 3-5 days

**Budget:**
- Zero cost requirement (use free tiers only)
- Supabase free tier: 500MB database (sufficient for 200-500 destinations)
- Vercel free tier: adequate for personal use
- Weather API free tier: 1,000 requests/day (may need to batch over 2-3 days)

**Technical:**
- Must be fully automatable via CLI (Claude Code requirement)
- No DevOps knowledge assumed
- SQL knowledge handled by Claude Code
- Must work on mobile and desktop browsers

**Scope:**
- Single-family use only (no multi-tenancy needed)
- 8 holiday periods per year
- 200+ destinations (scalable to 500+)
- UK-based user (London flights, school calendar)

### Key Assumptions

**User Behavior:**
- User will plan holidays 2-3 months in advance
- Primary planning happens on desktop, occasional mobile checks
- User comfortable with web applications
- Single user initially, family members may view later

**Data:**
- Climate data (monthly averages) doesn't change year-to-year significantly
- Destination ratings (beach, kids, luxury) remain relatively stable
- Flight times from London are consistent
- User will manually update if destination characteristics change significantly

**Technical:**
- Supabase and Vercel free tiers remain available and sufficient
- Weather APIs maintain free tier access
- PostgreSQL triggers/functions provide adequate performance at this scale
- No need for real-time collaboration (single user editing)

**Scoring:**
- Existing PRD scoring weights (30% weather, 25% flight, 15% beach, 15% kids, 15% luxury) are appropriate
- Scoring algorithm from PRD is fundamentally sound
- User can adjust weights by modifying SQL functions if needed

**Success:**
- System will be used for actual holiday planning (not just theoretical)
- User will trust automated scores for decision-making
- Manual maintenance burden must be near-zero for long-term adoption

---

## Risks and Open Questions

### Key Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| **Weather API rate limits** | HIGH | MEDIUM | Use multiple APIs (Visual Crossing, Open-Meteo), batch imports over 2-3 days |
| **Scoring weights don't match preferences** | MEDIUM | MEDIUM | Weights easily adjustable in SQL functions, validate with past holidays |
| **Learning curve for Supabase + Vercel** | MEDIUM | LOW | Both have excellent documentation, Claude Code handles configuration |
| **Frontend development complexity** | MEDIUM | LOW | Keep UI minimal (3 pages), use component libraries (Tailwind, shadcn/ui) |
| **Data quality issues** | MEDIUM | MEDIUM | Pre-import validation, multi-source verification for top 50 destinations |
| **Free tier limitations** | LOW | LOW | All free tiers have generous limits for this use case |

### Open Questions

**Technical Decisions (To Be Resolved During Implementation):**

1. **Frontend Framework Details:**
   - Next.js App Router or Pages Router?
   - Which component library? (shadcn/ui, Material UI, or plain Tailwind?)
   - Server-side rendering or client-side only?

2. **Data Import Strategy:**
   - Import all 200 destinations at once or in batches?
   - Manual entry for first 20 destinations to test system?
   - Which weather API performs best in practice?

3. **UI/UX Details:**
   - How should candidate comparison view work?
   - Should selections be editable or locked once made?
   - Display all 8 holidays on one page or separate pages?

4. **Authentication:**
   - None for Phase 1 (public Vercel URL)
   - Simple password protection for Phase 2?
   - Or trust "security through obscurity" of random URL?

**Product Questions:**
1. Do other family members need their own candidate lists, or shared?
2. Should system track WHY a destination was rejected (notes field)?
3. Is candidate comparison feature truly needed or nice-to-have?

### Areas Needing Further Research

**Before Implementation:**
- Verify Visual Crossing API free tier current limits (as of 2025)
- Test Supabase CLI workflow for migrations
- Validate Next.js + Supabase client integration
- Check Vercel deployment process for Next.js

**During Implementation:**
- Monitor Weather API response times and data quality
- Validate scoring algorithm with real destination data
- Test UI on various mobile devices
- Assess whether 200 destinations is manageable or should start with 50

---

## Implementation Timeline

### Phase 1: Backend & Database (Week 1)

**Day 1-2: Supabase Setup (6 hours)**
- Install Supabase CLI
- Create Supabase project (Europe-west region)
- Initialize local development environment
- Create database schema (migrations 001-004 from existing PRD)
- Test schema in Supabase Studio

**Day 3-4: Scoring Logic (8 hours)**
- Implement SQL functions (weather, flight, beach, kids, luxury, final score)
- Implement database triggers
- Test functions with sample data
- Validate trigger behavior

**Day 5-7: Data Import (10 hours)**
- Set up Python environment
- Create data import scripts (destinations, climate, holiday periods)
- Import 200+ destinations with climate data
- Validate data quality (100% coverage check)
- Verify automated scoring works

**Phase 1 Deliverable:** Working backend with 200+ scored destinations, accessible via Supabase Studio

### Phase 2: Frontend Development (Days 8-12, ~20 hours)

**Day 8-9: Next.js Setup & Core Pages (8 hours)**
- Create Next.js project with TypeScript + Tailwind
- Set up Supabase client integration
- Build holiday selector page
- Build ranked destination list page
- Deploy initial version to Vercel

**Day 10-11: Candidate & Selection Features (8 hours)**
- Add candidate marking functionality
- Build candidate comparison view
- Add selection tracking
- Implement filters and sorting

**Day 12: Polish & Testing (4 hours)**
- Responsive design testing (mobile + desktop)
- Performance optimization
- Final deployment to Vercel
- User acceptance testing

**Phase 2 Deliverable:** Complete family-friendly web app deployed and accessible

### Total Timeline: 12 days (44 hours actual work)

**Contingency:** 2 extra days for unexpected issues = **2-week target**

---

## Next Steps

**Immediate (Post-Brief):**
1. ✅ Approve this Product Brief
2. Create implementation project in development environment
3. Set up Supabase account
4. Set up Vercel account
5. Install required CLIs (Supabase, Vercel, Node.js, Python)

**Phase 1 Kickoff:**
1. Execute Supabase setup (Claude Code can automate)
2. Deploy database schema from existing PRD
3. Begin data import process

**Phase 2 Kickoff (After Phase 1 validation):**
1. Initialize Next.js project
2. Build minimal UI for candidate/selection workflow
3. Deploy to Vercel

**Success Checkpoint:**
- After Phase 1: Validate scoring works via Supabase Studio
- After Phase 2: Complete one full holiday planning cycle using the app
- Final: Use system for actual holiday booking decision

---

## Conclusion

This Product Brief documents the strategic decision to build the Ross Family Holiday Planner and Tracker using **Supabase + Vercel architecture**.

**Key Decisions:**
- Platform: Supabase (PostgreSQL backend) + Vercel (Next.js frontend)
- Based on expert multi-model consensus (3 AI models via Zen MCP)
- Preserves existing PRD's well-designed SQL-based scoring architecture
- Fully automatable via CLI for Claude Code configuration
- Zero DevOps burden with managed services
- Phased approach allows validation before full commitment

**Value Proposition:**
- Automated scoring of 200+ destinations across 8 holiday periods
- Candidate management and selection tracking
- <1 second score updates with database-native automation
- Zero maintenance burden after initial setup
- Family-friendly web interface (mobile + desktop)

**Next Milestone:** Execute Phase 1 implementation (Supabase backend setup)

---

## Appendices

### A. Research Summary

**Expert Consensus Analysis (Zen MCP Multi-Model Debate):**

Three AI models evaluated platform options:
1. **Google Gemini 2.5 Pro (Neutral):** Recommended Supabase + Vercel (9/10 confidence)
2. **OpenAI GPT-5 Pro (Advocate):** Recommended Supabase + Vercel (8/10 confidence)
3. **Anthropic Claude 3.7 Sonnet (Challenger):** Advocated Firebase (8/10 confidence)

**Consensus:** 2 of 3 models strongly favored Supabase + Vercel due to architectural fit with existing PostgreSQL-based PRD design.

**Key Insight:** Firebase's NoSQL architecture conflicts with database-native automation requirements and would require complete rewrite of existing SQL-based scoring design.

### B. Stakeholder Input

**Primary Stakeholder:** John (product owner and primary user)

**Key Requirements:**
- End-to-end managed platform (no DevOps knowledge)
- Fully automatable via CLI (Claude Code can configure)
- Reliability over features (learned from previous failed attempts)
- Simple frontend for candidate/selection workflow

**Previous Attempts:**
- Notion/Airtable: Too manual, not automatable
- Supabase solo: Backend promising, but frontend hosting was a blocker

### C. References

**Platform Documentation:**
- Supabase: https://supabase.com/docs
- Vercel: https://vercel.com/docs
- Next.js: https://nextjs.org/docs
- PostgreSQL: https://www.postgresql.org/docs

**Weather APIs:**
- Visual Crossing: https://www.visualcrossing.com/weather-api
- Open-Meteo: https://open-meteo.com

**Existing Project Documentation:**
- Product Requirements Document (PRD) v1.0 (PRODUCT_REQUIREMENTS_DOCUMENT.md)
- Detailed database schema, SQL functions, and scoring algorithms

---

**Document Version:** 1.0
**Status:** ✅ APPROVED FOR IMPLEMENTATION
**Date:** 2025-10-22
**Next Step:** Execute Phase 1 (Supabase Backend Setup)

---

_This Product Brief serves as the foundational document for implementing the Ross Family Holiday Planner and Tracker. It supersedes previous platform considerations and provides clear technical direction based on expert consensus analysis._
