import { getAllHolidayPeriods } from '@/lib/queries'
import PeriodCard from '@/app/components/PeriodCard'

export default async function PeriodsPage() {
  const { data: periods, error } = await getAllHolidayPeriods()

  if (error) {
    return (
      <div className="p-8">
        <div className="max-w-7xl mx-auto">
          <h1 className="text-4xl font-bold text-gray-900 dark:text-white mb-4">
            Holiday Periods
          </h1>
          <div className="bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 rounded-lg p-6">
            <p className="text-red-900 dark:text-red-200">
              Error loading holiday periods. Please try again later.
            </p>
          </div>
        </div>
      </div>
    )
  }

  if (!periods || periods.length === 0) {
    return (
      <div className="p-8">
        <div className="max-w-7xl mx-auto">
          <h1 className="text-4xl font-bold text-gray-900 dark:text-white mb-4">
            Holiday Periods
          </h1>
          <div className="bg-yellow-50 dark:bg-yellow-900/20 border border-yellow-200 dark:border-yellow-800 rounded-lg p-6">
            <p className="text-yellow-900 dark:text-yellow-200">
              No holiday periods found.
            </p>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="p-8">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-4xl font-bold text-gray-900 dark:text-white mb-4">
            Select Your Holiday Period
          </h1>
          <p className="text-lg text-gray-600 dark:text-gray-400">
            Choose a UK school holiday to see the best destinations ranked for that time of year.
          </p>
        </div>

        {/* Stats Bar */}
        <div className="bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800 rounded-lg p-4 mb-8">
          <div className="flex items-center text-blue-900 dark:text-blue-200">
            <svg className="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span className="font-medium">
              {periods.length} UK school holiday periods available • 112 destinations ranked for each period
            </span>
          </div>
        </div>

        {/* Period Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {periods.map((period) => (
            <PeriodCard key={period.id} period={period} />
          ))}
        </div>
      </div>
    </div>
  )
}
