/**
 * Common Supabase query functions for Holiday Planner
 *
 * This file contains reusable query functions for fetching data from Supabase.
 * All functions return { data, error } objects following Supabase conventions.
 */

import { supabase } from './supabase'
import type { Destination, ClimateData, HolidayPeriod, Score, UserShortlist } from './supabase'

// ============================================================================
// DESTINATIONS
// ============================================================================

/**
 * Fetch all destinations with optional filtering
 */
export async function getAllDestinations(filters?: {
  region?: string
  type?: string
  budgetLevel?: string
  maxFlightHours?: number
}) {
  let query = supabase
    .from('destinations')
    .select('*')
    .order('name')

  // Apply filters if provided
  if (filters?.region) {
    query = query.eq('region', filters.region)
  }
  if (filters?.type) {
    query = query.eq('type', filters.type)
  }
  if (filters?.budgetLevel) {
    query = query.eq('budget_level', filters.budgetLevel)
  }
  if (filters?.maxFlightHours) {
    query = query.lte('flight_hours', filters.maxFlightHours)
  }

  return query
}

/**
 * Fetch a single destination by ID
 */
export async function getDestinationById(id: string) {
  return supabase
    .from('destinations')
    .select('*')
    .eq('id', id)
    .single()
}

/**
 * Search destinations by name or country
 */
export async function searchDestinations(searchTerm: string) {
  return supabase
    .from('destinations')
    .select('*')
    .or(`name.ilike.%${searchTerm}%,country.ilike.%${searchTerm}%`)
    .order('name')
}

// ============================================================================
// CLIMATE DATA
// ============================================================================

/**
 * Fetch climate data for a specific destination (all 12 months)
 */
export async function getClimateDataForDestination(destinationId: string) {
  return supabase
    .from('climate_data')
    .select('*')
    .eq('destination_id', destinationId)
    .order('month')
}

/**
 * Fetch climate data for a specific destination and month
 */
export async function getClimateDataForMonth(destinationId: string, month: number) {
  return supabase
    .from('climate_data')
    .select('*')
    .eq('destination_id', destinationId)
    .eq('month', month)
    .single()
}

// ============================================================================
// HOLIDAY PERIODS
// ============================================================================

/**
 * Fetch all holiday periods
 */
export async function getAllHolidayPeriods() {
  return supabase
    .from('holiday_periods')
    .select('*')
    .order('start_date')
}

/**
 * Fetch a single holiday period by ID
 */
export async function getHolidayPeriodById(id: string) {
  return supabase
    .from('holiday_periods')
    .select('*')
    .eq('id', id)
    .single()
}

/**
 * Fetch upcoming holiday periods (from today onwards)
 */
export async function getUpcomingHolidayPeriods() {
  const today = new Date().toISOString().split('T')[0]
  return supabase
    .from('holiday_periods')
    .select('*')
    .gte('start_date', today)
    .order('start_date')
}

// ============================================================================
// SCORES
// ============================================================================

/**
 * Fetch score for a specific destination and holiday period
 */
export async function getScoreForDestinationAndPeriod(
  destinationId: string,
  holidayPeriodId: string
) {
  return supabase
    .from('scores')
    .select('*')
    .eq('destination_id', destinationId)
    .eq('holiday_period_id', holidayPeriodId)
    .single()
}

/**
 * Fetch all scores for a specific holiday period, sorted by final score
 * Includes destination details via join
 */
export async function getScoresForHolidayPeriod(holidayPeriodId: string, limit?: number) {
  let query = supabase
    .from('scores')
    .select(`
      *,
      destinations:destination_id (
        id,
        name,
        country,
        region,
        type,
        flight_hours,
        budget_level,
        beach_pool_quality,
        kid_facilities_quality
      )
    `)
    .eq('holiday_period_id', holidayPeriodId)
    .order('final_score', { ascending: false })

  if (limit) {
    query = query.limit(limit)
  }

  return query
}

/**
 * Fetch all scores for a specific destination across all holiday periods
 */
export async function getScoresForDestination(destinationId: string) {
  return supabase
    .from('scores')
    .select(`
      *,
      holiday_periods:holiday_period_id (
        id,
        name,
        start_date,
        end_date
      )
    `)
    .eq('destination_id', destinationId)
    .order('final_score', { ascending: false })
}

/**
 * Fetch top N destinations by score for a specific holiday period
 */
export async function getTopDestinationsForPeriod(holidayPeriodId: string, limit: number = 10) {
  return getScoresForHolidayPeriod(holidayPeriodId, limit)
}

// ============================================================================
// USER SHORTLISTS
// ============================================================================

/**
 * Fetch all shortlist entries for a user
 */
export async function getUserShortlist(userId: string) {
  return supabase
    .from('user_shortlists')
    .select(`
      *,
      destinations:destination_id (
        id,
        name,
        country,
        region,
        type,
        flight_hours
      ),
      holiday_periods:holiday_period_id (
        id,
        name,
        start_date,
        end_date
      )
    `)
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
}

/**
 * Fetch shortlist entries for a user filtered by status
 */
export async function getUserShortlistByStatus(
  userId: string,
  status: 'candidate' | 'selected' | 'rejected'
) {
  return supabase
    .from('user_shortlists')
    .select(`
      *,
      destinations:destination_id (
        id,
        name,
        country,
        region,
        type,
        flight_hours
      ),
      holiday_periods:holiday_period_id (
        id,
        name,
        start_date,
        end_date
      )
    `)
    .eq('user_id', userId)
    .eq('status', status)
    .order('created_at', { ascending: false })
}

/**
 * Fetch shortlist entries for a user and specific holiday period
 */
export async function getUserShortlistForPeriod(userId: string, holidayPeriodId: string) {
  return supabase
    .from('user_shortlists')
    .select(`
      *,
      destinations:destination_id (
        id,
        name,
        country,
        region,
        type,
        flight_hours
      )
    `)
    .eq('user_id', userId)
    .eq('holiday_period_id', holidayPeriodId)
    .order('created_at', { ascending: false })
}

/**
 * Add a destination to user's shortlist
 */
export async function addToShortlist(
  userId: string,
  destinationId: string,
  holidayPeriodId: string,
  status: 'candidate' | 'selected' | 'rejected' = 'candidate',
  notes?: string
) {
  return supabase
    .from('user_shortlists')
    .insert({
      user_id: userId,
      destination_id: destinationId,
      holiday_period_id: holidayPeriodId,
      status,
      notes,
    })
    .select()
    .single()
}

/**
 * Update shortlist entry status or notes
 */
export async function updateShortlistEntry(
  id: string,
  updates: {
    status?: 'candidate' | 'selected' | 'rejected'
    notes?: string
  }
) {
  return supabase
    .from('user_shortlists')
    .update(updates)
    .eq('id', id)
    .select()
    .single()
}

/**
 * Remove entry from shortlist
 */
export async function removeFromShortlist(id: string) {
  return supabase
    .from('user_shortlists')
    .delete()
    .eq('id', id)
}

/**
 * Check if destination is already in user's shortlist for a specific period
 */
export async function isInShortlist(
  userId: string,
  destinationId: string,
  holidayPeriodId: string
) {
  const { data, error } = await supabase
    .from('user_shortlists')
    .select('id, status')
    .eq('user_id', userId)
    .eq('destination_id', destinationId)
    .eq('holiday_period_id', holidayPeriodId)
    .maybeSingle()

  if (error) {
    return { isInShortlist: false, status: null, error }
  }

  return {
    isInShortlist: !!data,
    status: data?.status || null,
    error: null
  }
}

// ============================================================================
// COMBINED QUERIES
// ============================================================================

/**
 * Fetch destination with climate data and scores for a specific holiday period
 */
export async function getDestinationWithDetailsForPeriod(
  destinationId: string,
  holidayPeriodId: string
) {
  const [destinationResult, climateResult, scoreResult] = await Promise.all([
    getDestinationById(destinationId),
    getClimateDataForDestination(destinationId),
    getScoreForDestinationAndPeriod(destinationId, holidayPeriodId)
  ])

  return {
    destination: destinationResult.data,
    climate: climateResult.data,
    score: scoreResult.data,
    errors: {
      destination: destinationResult.error,
      climate: climateResult.error,
      score: scoreResult.error
    }
  }
}

/**
 * Fetch user's candidates with scores for a specific holiday period
 */
export async function getCandidatesWithScoresForPeriod(
  userId: string,
  holidayPeriodId: string
) {
  return supabase
    .from('user_shortlists')
    .select(`
      *,
      destinations:destination_id (
        id,
        name,
        country,
        region,
        type,
        flight_hours,
        budget_level
      ),
      scores:destination_id (
        final_score,
        weather_score,
        flight_score,
        beach_score,
        kid_facilities_score,
        luxury_score
      )
    `)
    .eq('user_id', userId)
    .eq('holiday_period_id', holidayPeriodId)
    .eq('status', 'candidate')
    .order('created_at', { ascending: false })
}
