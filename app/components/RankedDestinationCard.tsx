import Link from 'next/link'
import RankBadge from './RankBadge'
import ScoreBreakdown from './ScoreBreakdown'

interface RankedDestinationCardProps {
  rank: number
  destination: {
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
  score: {
    final_score: number
    weather_score: number
    flight_score: number
    jet_lag_score: number
    beach_score: number
    kid_facilities_score: number
    luxury_score: number
  }
  periodId: string
}

export default function RankedDestinationCard({
  rank,
  destination,
  score,
  periodId
}: RankedDestinationCardProps) {
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

  // Get final score color
  const getFinalScoreColor = (finalScore: number) => {
    if (finalScore >= 90) return 'text-green-600 dark:text-green-400'
    if (finalScore >= 75) return 'text-blue-600 dark:text-blue-400'
    if (finalScore >= 60) return 'text-yellow-600 dark:text-yellow-400'
    return 'text-orange-600 dark:text-orange-400'
  }

  return (
    <div className="bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-xl transition-shadow p-6">
      {/* Header with Rank Badge */}
      <div className="flex gap-4 mb-4">
        <div className="flex-shrink-0">
          <RankBadge rank={rank} />
        </div>

        <div className="flex-1">
          <div className="flex justify-between items-start mb-2">
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

          {/* Final Score */}
          <div className="mt-3">
            <div className="flex items-baseline gap-2">
              <span className="text-sm text-gray-600 dark:text-gray-400">
                Overall Score:
              </span>
              <span className={`text-2xl font-bold ${getFinalScoreColor(score.final_score)}`}>
                {Math.round(score.final_score)}
              </span>
              <span className="text-sm text-gray-500 dark:text-gray-400">
                / 100
              </span>
            </div>
            {/* Progress bar for final score */}
            <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2 mt-2">
              <div
                className={`h-2 rounded-full ${
                  score.final_score >= 90 ? 'bg-green-500' :
                  score.final_score >= 75 ? 'bg-blue-500' :
                  score.final_score >= 60 ? 'bg-yellow-500' : 'bg-orange-500'
                }`}
                style={{ width: `${score.final_score}%` }}
              />
            </div>
          </div>
        </div>
      </div>

      {/* Quick Info */}
      <div className="flex flex-wrap gap-2 mb-4">
        <span className={`px-2 py-1 rounded-full text-xs font-medium ${getBudgetColor(destination.budget_level)}`}>
          {destination.budget_level}
        </span>
        <span className="px-2 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-200">
          {destination.type}
        </span>
        <span className="px-2 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-200">
          {destination.flight_hours}h flight
        </span>
      </div>

      {/* Score Breakdown - Compact Version */}
      <div className="mb-4 p-3 bg-gray-50 dark:bg-gray-900/50 rounded-lg">
        <div className="text-xs font-medium text-gray-600 dark:text-gray-400 mb-2">
          Score Components
        </div>
        <ScoreBreakdown
          weatherScore={score.weather_score}
          flightScore={score.flight_score}
          jetLagScore={score.jet_lag_score}
          beachScore={score.beach_score}
          kidFacilitiesScore={score.kid_facilities_score}
          luxuryScore={score.luxury_score}
          compact={true}
        />
      </div>

      {/* View Details CTA */}
      <Link href={`/destinations/${destination.id}?period=${periodId}`}>
        <div className="pt-4 border-t border-gray-200 dark:border-gray-700">
          <span className="text-blue-600 dark:text-blue-400 text-sm font-medium hover:underline cursor-pointer">
            View Full Details →
          </span>
        </div>
      </Link>
    </div>
  )
}
