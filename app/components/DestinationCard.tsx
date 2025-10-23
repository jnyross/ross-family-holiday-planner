import Link from 'next/link'
import type { Destination } from '@/lib/supabase'

interface DestinationCardProps {
  destination: Destination
}

export default function DestinationCard({ destination }: DestinationCardProps) {
  // Determine type icon
  const getTypeIcon = (type: string) => {
    switch (type.toLowerCase()) {
      case 'beach':
        return '🏖️'
      case 'city':
        return '🏙️'
      case 'nature':
        return '🏔️'
      case 'cultural':
        return '🏛️'
      default:
        return '✈️'
    }
  }

  // Determine budget color
  const getBudgetColor = (budget: string) => {
    switch (budget.toLowerCase()) {
      case 'budget':
        return 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200'
      case 'mid-range':
        return 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200'
      case 'luxury':
        return 'bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200'
      default:
        return 'bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-200'
    }
  }

  return (
    <Link href={`/destinations/${destination.id}`}>
      <div className="bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-xl transition-shadow p-6 h-full cursor-pointer">
        {/* Header */}
        <div className="flex justify-between items-start mb-4">
          <div className="flex-1">
            <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-1">
              {destination.name}
            </h3>
            <p className="text-sm text-gray-600 dark:text-gray-400">
              {destination.country} • {destination.region}
            </p>
          </div>
          <div className="text-3xl ml-2">
            {getTypeIcon(destination.type)}
          </div>
        </div>

        {/* Details */}
        <div className="space-y-2 mb-4">
          <div className="flex items-center text-sm text-gray-600 dark:text-gray-400">
            <svg className="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            {destination.flight_hours}h flight from UK
          </div>

          <div className="flex items-center text-sm text-gray-600 dark:text-gray-400">
            <svg className="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3" />
            </svg>
            {destination.visa_required}
          </div>
        </div>

        {/* Badges */}
        <div className="flex flex-wrap gap-2 mb-4">
          <span className={`px-2 py-1 rounded-full text-xs font-medium ${getBudgetColor(destination.budget_level)}`}>
            {destination.budget_level}
          </span>
          <span className="px-2 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-200">
            {destination.type}
          </span>
        </div>

        {/* Ratings */}
        <div className="grid grid-cols-2 gap-2 text-sm">
          <div className="flex items-center">
            <span className="text-gray-600 dark:text-gray-400 mr-1">Beach:</span>
            <span className="font-medium text-gray-900 dark:text-white">{destination.beach_pool_quality}/10</span>
          </div>
          <div className="flex items-center">
            <span className="text-gray-600 dark:text-gray-400 mr-1">Kids:</span>
            <span className="font-medium text-gray-900 dark:text-white">{destination.kid_facilities_quality}/10</span>
          </div>
        </div>

        {/* View Details CTA */}
        <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700">
          <span className="text-blue-600 dark:text-blue-400 text-sm font-medium hover:underline">
            View Details →
          </span>
        </div>
      </div>
    </Link>
  )
}
