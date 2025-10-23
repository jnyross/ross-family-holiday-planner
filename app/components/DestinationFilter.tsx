'use client'

import { useState, useEffect } from 'react'

interface FilterOptions {
  regions: string[]
  budgetLevels: string[]
  types: string[]
  maxFlightHours: number
  searchTerm: string
}

interface DestinationFilterProps {
  onFilterChange: (filters: FilterOptions) => void
  totalResults: number
}

export default function DestinationFilter({ onFilterChange, totalResults }: DestinationFilterProps) {
  const [isOpen, setIsOpen] = useState(true)
  const [regions, setRegions] = useState<string[]>([])
  const [budgetLevels, setBudgetLevels] = useState<string[]>([])
  const [types, setTypes] = useState<string[]>([])
  const [maxFlightHours, setMaxFlightHours] = useState(15)
  const [searchTerm, setSearchTerm] = useState('')

  // Available filter options
  const availableRegions = ['Europe', 'Asia', 'Americas', 'Africa', 'Oceania', 'Middle East']
  const availableBudgetLevels = ['Budget', 'Mid-range', 'Luxury']
  const availableTypes = ['Beach', 'City', 'Nature', 'Cultural']

  // Update parent component when filters change
  useEffect(() => {
    onFilterChange({
      regions,
      budgetLevels,
      types,
      maxFlightHours,
      searchTerm
    })
  }, [regions, budgetLevels, types, maxFlightHours, searchTerm, onFilterChange])

  const toggleRegion = (region: string) => {
    setRegions(prev =>
      prev.includes(region)
        ? prev.filter(r => r !== region)
        : [...prev, region]
    )
  }

  const toggleBudgetLevel = (level: string) => {
    setBudgetLevels(prev =>
      prev.includes(level)
        ? prev.filter(l => l !== level)
        : [...prev, level]
    )
  }

  const toggleType = (type: string) => {
    setTypes(prev =>
      prev.includes(type)
        ? prev.filter(t => t !== type)
        : [...prev, type]
    )
  }

  const clearAllFilters = () => {
    setRegions([])
    setBudgetLevels([])
    setTypes([])
    setMaxFlightHours(15)
    setSearchTerm('')
  }

  const hasActiveFilters = regions.length > 0 || budgetLevels.length > 0 || types.length > 0 || maxFlightHours < 15 || searchTerm.length > 0

  return (
    <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6 mb-8">
      {/* Filter Header */}
      <div className="flex justify-between items-center mb-4">
        <div className="flex items-center">
          <h2 className="text-xl font-bold text-gray-900 dark:text-white">
            Filters
          </h2>
          {hasActiveFilters && (
            <span className="ml-3 px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-sm rounded-full">
              {totalResults} results
            </span>
          )}
        </div>
        <div className="flex items-center space-x-2">
          {hasActiveFilters && (
            <button
              onClick={clearAllFilters}
              className="text-sm text-blue-600 dark:text-blue-400 hover:underline"
            >
              Clear All
            </button>
          )}
          <button
            onClick={() => setIsOpen(!isOpen)}
            className="md:hidden p-2 text-gray-600 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 rounded"
          >
            {isOpen ? '▲' : '▼'}
          </button>
        </div>
      </div>

      {/* Filter Content */}
      <div className={`${isOpen ? 'block' : 'hidden'} md:block space-y-6`}>
        {/* Search */}
        <div>
          <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
            Search by name or country
          </label>
          <input
            type="text"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            placeholder="e.g., Maldives, Spain..."
            className="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
          />
        </div>

        {/* Region Filter */}
        <div>
          <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
            Region
          </label>
          <div className="flex flex-wrap gap-2">
            {availableRegions.map(region => (
              <button
                key={region}
                onClick={() => toggleRegion(region)}
                className={`px-3 py-1 rounded-full text-sm font-medium transition-colors ${
                  regions.includes(region)
                    ? 'bg-blue-600 text-white'
                    : 'bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-600'
                }`}
              >
                {region}
              </button>
            ))}
          </div>
        </div>

        {/* Budget Level Filter */}
        <div>
          <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
            Budget Level
          </label>
          <div className="flex flex-wrap gap-2">
            {availableBudgetLevels.map(level => (
              <button
                key={level}
                onClick={() => toggleBudgetLevel(level)}
                className={`px-3 py-1 rounded-full text-sm font-medium transition-colors ${
                  budgetLevels.includes(level)
                    ? 'bg-green-600 text-white'
                    : 'bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-600'
                }`}
              >
                {level}
              </button>
            ))}
          </div>
        </div>

        {/* Type Filter */}
        <div>
          <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
            Destination Type
          </label>
          <div className="flex flex-wrap gap-2">
            {availableTypes.map(type => (
              <button
                key={type}
                onClick={() => toggleType(type)}
                className={`px-3 py-1 rounded-full text-sm font-medium transition-colors ${
                  types.includes(type)
                    ? 'bg-purple-600 text-white'
                    : 'bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-600'
                }`}
              >
                {type}
              </button>
            ))}
          </div>
        </div>

        {/* Flight Hours Slider */}
        <div>
          <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
            Max Flight Hours: {maxFlightHours}h
          </label>
          <input
            type="range"
            min="1"
            max="15"
            value={maxFlightHours}
            onChange={(e) => setMaxFlightHours(parseInt(e.target.value))}
            className="w-full h-2 bg-gray-200 dark:bg-gray-700 rounded-lg appearance-none cursor-pointer accent-blue-600"
          />
          <div className="flex justify-between text-xs text-gray-500 dark:text-gray-400 mt-1">
            <span>1h</span>
            <span>15h</span>
          </div>
        </div>

        {/* Active Filters Summary */}
        {hasActiveFilters && (
          <div className="pt-4 border-t border-gray-200 dark:border-gray-700">
            <div className="text-sm text-gray-600 dark:text-gray-400">
              <strong>Active filters:</strong>
              {regions.length > 0 && <span className="ml-2">Regions ({regions.length})</span>}
              {budgetLevels.length > 0 && <span className="ml-2">Budget ({budgetLevels.length})</span>}
              {types.length > 0 && <span className="ml-2">Types ({types.length})</span>}
              {maxFlightHours < 15 && <span className="ml-2">Max {maxFlightHours}h</span>}
              {searchTerm && <span className="ml-2">&quot;{searchTerm}&quot;</span>}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
