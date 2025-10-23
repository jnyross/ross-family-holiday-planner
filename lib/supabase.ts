import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// Database Types
export type Destination = {
  id: string
  name: string
  country: string
  region: string
  type: string
  flight_hours: number
  time_difference: number
  visa_required: string
  currency: string
  language: string
  budget_level: string
  best_months: string | null
  worst_months: string | null
  high_star_share: number
  beach_pool_quality: number
  kid_facilities_quality: number
  notes: string | null
  visited: boolean
  created_at: string
  updated_at: string
}

export type ClimateData = {
  id: string
  destination_id: string
  month: number
  temperature_celsius: number
  rainfall_mm: number
  temperature_high: number | null
  temperature_low: number | null
  created_at: string
}

export type HolidayPeriod = {
  id: string
  name: string
  start_date: string
  end_date: string
  year: number
  created_at: string
}

export type Score = {
  id: string
  destination_id: string
  holiday_period_id: string
  weather_score: number
  flight_score: number
  beach_score: number
  kid_facilities_score: number
  luxury_score: number
  final_score: number
  calculated_at: string
}

export type UserShortlist = {
  id: string
  user_id: string
  destination_id: string
  holiday_period_id: string
  status: 'candidate' | 'selected' | 'rejected'
  notes: string | null
  created_at: string
  updated_at: string
}
