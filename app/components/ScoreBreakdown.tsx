interface ScoreBreakdownProps {
  weatherScore: number
  flightScore: number
  jetLagScore: number
  beachScore: number
  kidFacilitiesScore: number
  luxuryScore: number
  compact?: boolean
}

export default function ScoreBreakdown({
  weatherScore,
  flightScore,
  jetLagScore,
  beachScore,
  kidFacilitiesScore,
  luxuryScore,
  compact = false
}: ScoreBreakdownProps) {

  // Get color based on score
  const getScoreColor = (score: number) => {
    if (score >= 90) return 'bg-green-500'
    if (score >= 75) return 'bg-blue-500'
    if (score >= 60) return 'bg-yellow-500'
    return 'bg-orange-500'
  }

  // Get text color based on score
  const getTextColor = (score: number) => {
    if (score >= 90) return 'text-green-600 dark:text-green-400'
    if (score >= 75) return 'text-blue-600 dark:text-blue-400'
    if (score >= 60) return 'text-yellow-600 dark:text-yellow-400'
    return 'text-orange-600 dark:text-orange-400'
  }

  const scores = [
    { label: 'Weather', value: weatherScore, weight: '20%' },
    { label: 'Flight', value: flightScore, weight: '25%' },
    { label: 'Jet-lag', value: jetLagScore, weight: '5%' },
    { label: 'Beach', value: beachScore, weight: '15%' },
    { label: 'Kids', value: kidFacilitiesScore, weight: '15%' },
    { label: 'Luxury', value: luxuryScore, weight: '20%' },
  ]

  if (compact) {
    return (
      <div className="grid grid-cols-3 gap-2">
        {scores.map((score) => (
          <div key={score.label} className="flex flex-col items-center">
            <div className="text-xs text-gray-500 dark:text-gray-400 mb-1">
              {score.label}
            </div>
            <div className={`text-sm font-bold ${getTextColor(score.value)}`}>
              {Math.round(score.value)}
            </div>
          </div>
        ))}
      </div>
    )
  }

  return (
    <div className="space-y-3">
      {scores.map((score) => (
        <div key={score.label}>
          <div className="flex justify-between items-center mb-1">
            <div className="flex items-center gap-2">
              <span className="text-sm font-medium text-gray-700 dark:text-gray-300">
                {score.label}
              </span>
              <span className="text-xs text-gray-500 dark:text-gray-400">
                ({score.weight})
              </span>
            </div>
            <span className={`text-sm font-bold ${getTextColor(score.value)}`}>
              {Math.round(score.value)}
            </span>
          </div>
          <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
            <div
              className={`h-2 rounded-full transition-all ${getScoreColor(score.value)}`}
              style={{ width: `${score.value}%` }}
            />
          </div>
        </div>
      ))}
    </div>
  )
}
