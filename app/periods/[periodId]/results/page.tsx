'use client'

import { useEffect, useState, useMemo } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import RankedDestinationCard from '@/app/components/RankedDestinationCard'
import { getScoresForHolidayPeriod, getHolidayPeriodById } from '@/lib/queries'
import type { HolidayPeriod } from '@/lib/supabase'

interface ScoreWithDestination {
  id: string
  final_score: number
  weather_score: number
  flight_score: number
  jet_lag_score: number
  beach_score: number
  kid_facilities_score: number
  luxury_score: number
  destinations: {
    id: string
    name: string
    country: string
    region: string
    type: string
    flight_hours: number
    budget_level: string
    beach_pool_quality: number
    kid_facilities_quality: number
  }
}

export default function ResultsPage() {
  const params = useParams()
  const periodId = params.periodId as string

  const [period, setPeriod] = useState<HolidayPeriod | null>(null)
  const [scores, setScores] = useState<ScoreWithDestination[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  // Filters
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedRegion, setSelectedRegion] = useState<string>('all')
  const [selectedBudget, setSelectedBudget] = useState<string>('all')
  const [selectedType, setSelectedType] = useState<string>('all')
  const [maxFlightHours, setMaxFlightHours] = useState<number>(15)

  useEffect(() => {
    async function fetchData() {
      setLoading(true)
      setError(null)

      try {
        const [periodResult, scoresResult] = await Promise.all([
          getHolidayPeriodById(periodId),
          getScoresForHolidayPeriod(periodId)
        ])

        if (periodResult.error) {
          setError('Failed to load holiday period')
          return
        }

        if (scoresResult.error) {
          setError('Failed to load destination scores')
          return
        }

        setPeriod(periodResult.data)
        setScores(scoresResult.data || [])
      } catch (err) {
        setError('An unexpected error occurred')
        console.error(err)
      } finally {
        setLoading(false)
      }
    }

    fetchData()
  }, [periodId])

  // Filter destinations
  const filteredScores = useMemo(() => {
    return scores.filter((scoreEntry) => {
      const dest = scoreEntry.destinations

      // Search filter
      if (searchTerm && !dest.name.toLowerCase().includes(searchTerm.toLowerCase()) &&
          !dest.country.toLowerCase().includes(searchTerm.toLowerCase())) {
        return false
      }

      // Region filter
      if (selectedRegion !== 'all' && dest.region !== selectedRegion) {
        return false
      }

      // Budget filter
      if (selectedBudget !== 'all' && dest.budget_level !== selectedBudget) {
        return false
      }

      // Type filter
      if (selectedType !== 'all' && dest.type !== selectedType) {
        return false
      }

      // Flight hours filter
      if (dest.flight_hours > maxFlightHours) {
        return false
      }

      return true
    })
  }, [scores, searchTerm, selectedRegion, selectedBudget, selectedType, maxFlightHours])

  // Get unique values for filters
  const regions = useMemo(() => {
    const uniqueRegions = new Set(scores.map(s => s.destinations.region))
    return Array.from(uniqueRegions).sort()
  }, [scores])

  const budgetLevels = ['Budget', 'Mid-range', 'Luxury']
  const types = useMemo(() => {
    const uniqueTypes = new Set(scores.map(s => s.destinations.type))
    return Array.from(uniqueTypes).sort()
  }, [scores])

  if (loading) {
    return (
      <div className="p-8">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center justify-center h-64">
            <div className="text-gray-600 dark:text-gray-400">Loading ranked destinations...</div>
          </div>
        </div>
      </div>
    )
  }

  if (error || !period) {
    return (
      <div className="p-8">
        <div className="max-w-7xl mx-auto">
          <div className="bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 rounded-lg p-6">
            <p className="text-red-900 dark:text-red-200">
              {error || 'Failed to load period information'}
            </p>
          </div>
        </div>
      </div>
    )
  }

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr)
    return date.toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })
  }

  return (
    <div className="p-8">
      <div className="max-w-7xl mx-auto">
        {/* Breadcrumb */}
        <div className="mb-4 text-sm text-gray-600 dark:text-gray-400">
          <Link href="/periods" className="hover:text-blue-600 dark:hover:text-blue-400">
            Holiday Periods
          </Link>
          <span className="mx-2">›</span>
          <span>{period.name}</span>
        </div>

        {/* Header */}
        <div className="mb-8">
          <h1 className="text-4xl font-bold text-gray-900 dark:text-white mb-2">
            {period.name} Rankings
          </h1>
          <p className="text-lg text-gray-600 dark:text-gray-400">
            {formatDate(period.start_date)} - {formatDate(period.end_date)}
          </p>
        </div>

        {/* Stats */}
        <div className="bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800 rounded-lg p-4 mb-6">
          <div className="flex items-center text-blue-900 dark:text-blue-200">
            <svg className="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span>
              Showing <strong>{filteredScores.length}</strong> of <strong>{scores.length}</strong> destinations ranked by overall score
            </span>
          </div>
        </div>

        {/* Filters */}
        <div className="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6 mb-6">
          <h2 className="text-lg font-semibold text-gray-900 dark:text-white mb-4">
            Filter Results
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {/* Search */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                Search
              </label>
              <input
                type="text"
                placeholder="Destination or country..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
              />
            </div>

            {/* Region */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                Region
              </label>
              <select
                value={selectedRegion}
                onChange={(e) => setSelectedRegion(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
              >
                <option value="all">All Regions</option>
                {regions.map(region => (
                  <option key={region} value={region}>{region}</option>
                ))}
              </select>
            </div>

            {/* Budget */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                Budget Level
              </label>
              <select
                value={selectedBudget}
                onChange={(e) => setSelectedBudget(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
              >
                <option value="all">All Budgets</option>
                {budgetLevels.map(budget => (
                  <option key={budget} value={budget}>{budget}</option>
                ))}
              </select>
            </div>

            {/* Type */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                Destination Type
              </label>
              <select
                value={selectedType}
                onChange={(e) => setSelectedType(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
              >
                <option value="all">All Types</option>
                {types.map(type => (
                  <option key={type} value={type}>{type}</option>
                ))}
              </select>
            </div>

            {/* Flight Hours */}
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                Max Flight Hours: {maxFlightHours}h
              </label>
              <input
                type="range"
                min="1"
                max="15"
                step="1"
                value={maxFlightHours}
                onChange={(e) => setMaxFlightHours(Number(e.target.value))}
                className="w-full"
              />
            </div>
          </div>

          {/* Reset Filters */}
          {(searchTerm || selectedRegion !== 'all' || selectedBudget !== 'all' || selectedType !== 'all' || maxFlightHours < 15) && (
            <button
              onClick={() => {
                setSearchTerm('')
                setSelectedRegion('all')
                setSelectedBudget('all')
                setSelectedType('all')
                setMaxFlightHours(15)
              }}
              className="mt-4 text-sm text-blue-600 dark:text-blue-400 hover:underline"
            >
              Reset all filters
            </button>
          )}
        </div>

        {/* Results Grid */}
        {filteredScores.length === 0 ? (
          <div className="bg-yellow-50 dark:bg-yellow-900/20 border border-yellow-200 dark:border-yellow-800 rounded-lg p-6">
            <p className="text-yellow-900 dark:text-yellow-200">
              No destinations match your current filters. Try adjusting your criteria.
            </p>
          </div>
        ) : (
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
            {filteredScores.map((scoreEntry, index) => (
              <RankedDestinationCard
                key={scoreEntry.id}
                rank={index + 1}
                destination={scoreEntry.destinations}
                score={{
                  final_score: scoreEntry.final_score,
                  weather_score: scoreEntry.weather_score,
                  flight_score: scoreEntry.flight_score,
                  jet_lag_score: scoreEntry.jet_lag_score,
                  beach_score: scoreEntry.beach_score,
                  kid_facilities_score: scoreEntry.kid_facilities_score,
                  luxury_score: scoreEntry.luxury_score,
                }}
                periodId={periodId}
              />
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
