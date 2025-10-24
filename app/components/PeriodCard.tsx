import Link from 'next/link'
import type { HolidayPeriod } from '@/lib/supabase'

interface PeriodCardProps {
  period: HolidayPeriod
}

export default function PeriodCard({ period }: PeriodCardProps) {
  // Format dates for display
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr)
    return date.toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })
  }

  // Calculate number of days in the period
  const calculateDays = () => {
    const start = new Date(period.start_date)
    const end = new Date(period.end_date)
    const diffTime = Math.abs(end.getTime() - start.getTime())
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1 // +1 to include both days
    return diffDays
  }

  // Get season emoji based on month
  const getSeasonIcon = () => {
    const month = new Date(period.start_date).getMonth() + 1
    if (month >= 3 && month <= 5) return '🌸' // Spring
    if (month >= 6 && month <= 8) return '☀️' // Summer
    if (month >= 9 && month <= 11) return '🍂' // Autumn
    return '❄️' // Winter
  }

  const days = calculateDays()

  return (
    <Link href={`/periods/${period.id}/results`}>
      <div className="bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-xl transition-all hover:scale-105 p-6 h-full cursor-pointer border-2 border-transparent hover:border-blue-500">
        {/* Header with Icon */}
        <div className="flex items-start justify-between mb-4">
          <div className="flex-1">
            <h3 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
              {period.name}
            </h3>
            <p className="text-sm text-gray-500 dark:text-gray-400">
              {period.year}
            </p>
          </div>
          <div className="text-4xl ml-2">
            {getSeasonIcon()}
          </div>
        </div>

        {/* Date Range */}
        <div className="mb-4">
          <div className="flex items-center text-gray-700 dark:text-gray-300 mb-2">
            <svg className="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
            <span className="font-medium">
              {formatDate(period.start_date)} - {formatDate(period.end_date)}
            </span>
          </div>
          <div className="flex items-center text-sm text-gray-600 dark:text-gray-400">
            <svg className="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            {days} days
          </div>
        </div>

        {/* CTA */}
        <div className="mt-6 pt-4 border-t border-gray-200 dark:border-gray-700">
          <div className="flex items-center justify-between">
            <span className="text-blue-600 dark:text-blue-400 font-semibold">
              See Top Destinations
            </span>
            <svg className="w-5 h-5 text-blue-600 dark:text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
            </svg>
          </div>
        </div>
      </div>
    </Link>
  )
}
