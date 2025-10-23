'use client'

import { useState, useEffect, useMemo, useCallback } from 'react'
import { getAllDestinations } from '@/lib/queries'
import DestinationCard from '../components/DestinationCard'
import DestinationFilter from '../components/DestinationFilter'
import type { Destination } from '@/lib/supabase'

interface FilterOptions {
  regions: string[]
  budgetLevels: string[]
  types: string[]
  maxFlightHours: number
  searchTerm: string
}

export default function DestinationsPage() {
  const [allDestinations, setAllDestinations] = useState<Destination[]>([])
  const [filters, setFilters] = useState<FilterOptions>({
    regions: [],
    budgetLevels: [],
    types: [],
    maxFlightHours: 15,
    searchTerm: ''
  })
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchDestinations() {
      try {
        setLoading(true)
        const { data, error } = await getAllDestinations()

        if (error) {
          throw error
        }

        setAllDestinations(data || [])
      } catch (err) {
        console.error('Error fetching destinations:', err)
        setError('Failed to load destinations. Please try again later.')
      } finally {
        setLoading(false)
      }
    }

    fetchDestinations()
  }, [])

  // Filter destinations based on current filters
  const filteredDestinations = useMemo(() => {
    return allDestinations.filter(dest => {
      // Region filter
      if (filters.regions.length > 0 && !filters.regions.includes(dest.region)) {
        return false
      }

      // Budget level filter
      if (filters.budgetLevels.length > 0 && !filters.budgetLevels.includes(dest.budget_level)) {
        return false
      }

      // Type filter
      if (filters.types.length > 0 && !filters.types.includes(dest.type)) {
        return false
      }

      // Flight hours filter
      if (dest.flight_hours > filters.maxFlightHours) {
        return false
      }

      // Search term filter
      if (filters.searchTerm) {
        const searchLower = filters.searchTerm.toLowerCase()
        const nameMatch = dest.name.toLowerCase().includes(searchLower)
        const countryMatch = dest.country.toLowerCase().includes(searchLower)
        if (!nameMatch && !countryMatch) {
          return false
        }
      }

      return true
    })
  }, [allDestinations, filters])

  const handleFilterChange = useCallback((newFilters: FilterOptions) => {
    setFilters(newFilters)
  }, [])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-16 w-16 border-b-2 border-blue-600"></div>
          <p className="mt-4 text-gray-600 dark:text-gray-400">Loading destinations...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center max-w-md mx-auto p-8">
          <div className="text-6xl mb-4">⚠️</div>
          <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
            Oops! Something went wrong
          </h2>
          <p className="text-gray-600 dark:text-gray-400 mb-6">{error}</p>
          <button
            onClick={() => window.location.reload()}
            className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors"
          >
            Try Again
          </button>
        </div>
      </div>
    )
  }

  return (
    <div className="p-8">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-4xl font-bold text-gray-900 dark:text-white mb-2">
            Browse Destinations
          </h1>
          <p className="text-lg text-gray-600 dark:text-gray-400">
            Explore {allDestinations.length} handpicked family-friendly destinations worldwide
          </p>
        </div>

        {/* Stats Bar */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow p-4">
            <div className="text-3xl font-bold text-blue-600 dark:text-blue-400">
              {allDestinations.length}
            </div>
            <div className="text-sm text-gray-600 dark:text-gray-400">Total Destinations</div>
          </div>
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow p-4">
            <div className="text-3xl font-bold text-green-600 dark:text-green-400">
              {new Set(allDestinations.map(d => d.region)).size}
            </div>
            <div className="text-sm text-gray-600 dark:text-gray-400">Regions</div>
          </div>
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow p-4">
            <div className="text-3xl font-bold text-purple-600 dark:text-purple-400">
              {new Set(allDestinations.map(d => d.country)).size}
            </div>
            <div className="text-sm text-gray-600 dark:text-gray-400">Countries</div>
          </div>
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow p-4">
            <div className="text-3xl font-bold text-orange-600 dark:text-orange-400">
              {allDestinations.filter(d => d.type.toLowerCase() === 'beach').length}
            </div>
            <div className="text-sm text-gray-600 dark:text-gray-400">Beach Destinations</div>
          </div>
        </div>

        {/* Filters */}
        <DestinationFilter
          onFilterChange={handleFilterChange}
          totalResults={filteredDestinations.length}
        />

        {/* Destinations Grid */}
        {filteredDestinations.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredDestinations.map((destination) => (
              <DestinationCard key={destination.id} destination={destination} />
            ))}
          </div>
        ) : (
          <div className="text-center py-12">
            <div className="text-6xl mb-4">🔍</div>
            <h3 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
              No destinations found
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Try adjusting your filters to see more results
            </p>
          </div>
        )}
      </div>
    </div>
  )
}
