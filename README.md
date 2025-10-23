# Ross Family Holiday Planner

A Next.js application for planning family holidays with destination scoring, climate data, and shortlist management.

## Tech Stack

- **Frontend**: Next.js 15 (App Router), React 19, TypeScript, Tailwind CSS
- **Backend**: Supabase (PostgreSQL)
- **Deployment**: Vercel

## Database

The database contains:
- 112 holiday destinations
- 1,344 climate data records (monthly averages)
- 8 holiday periods
- Automatic scoring system with triggers

## Setup Instructions

### 1. Install Dependencies

```bash
npm install
```

### 2. Configure Supabase

Get your Supabase credentials from the Supabase dashboard:
1. Go to https://supabase.com/dashboard
2. Select your "Holiday Destinations" project
3. Go to Settings > API
4. Copy your Project URL and anon/public key

Create a `.env.local` file:

```bash
cp .env.local.example .env.local
```

Edit `.env.local` and add your credentials:

```env
NEXT_PUBLIC_SUPABASE_URL=https://jqsdxpqoasrurvsvnnqx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

### 3. Run the Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## Project Structure

```
├── app/                # Next.js App Router pages
│   ├── layout.tsx     # Root layout
│   ├── page.tsx       # Home page
│   └── globals.css    # Global styles
├── lib/               # Utility functions
│   └── supabase.ts    # Supabase client & types
├── supabase/          # Database migrations
│   └── migrations/    # SQL schema files
└── public/            # Static assets
```

## Features (Planned)

- ✅ Supabase backend with 112 destinations
- ✅ Climate data for each destination
- ✅ Automatic destination scoring system
- 🚧 Destination browsing and filtering
- 🚧 Holiday period selection
- 🚧 Candidate marking interface
- 🚧 Selection workflow
- 🚧 Shortlist management

## Development

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Run production server
- `npm run lint` - Run ESLint

## Database Schema

### Tables
- `destinations` - Master list of 112 holiday destinations
- `climate_data` - Monthly temperature and rainfall data
- `holiday_periods` - School holiday periods for planning
- `scores` - Calculated scores for destination/holiday combinations
- `user_shortlists` - User candidate selections and notes

### Scoring Algorithm

Each destination receives scores (0-100) for:
- **Weather** (30%): Temperature & rainfall during holiday period
- **Flight** (25%): Flight duration from UK
- **Beach** (15%): Beach/pool quality rating
- **Kids** (15%): Kid-friendly facilities rating
- **Luxury** (15%): High-star hotel availability

Scores are automatically recalculated when destinations, climate data, or holiday periods change.
