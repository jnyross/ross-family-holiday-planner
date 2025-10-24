interface RankBadgeProps {
  rank: number
}

export default function RankBadge({ rank }: RankBadgeProps) {
  // Determine badge style based on rank
  const getBadgeStyle = () => {
    if (rank === 1) {
      return 'bg-gradient-to-br from-yellow-400 to-yellow-600 text-white shadow-lg scale-110'
    }
    if (rank === 2) {
      return 'bg-gradient-to-br from-gray-300 to-gray-400 text-gray-900 shadow-md scale-105'
    }
    if (rank === 3) {
      return 'bg-gradient-to-br from-orange-400 to-orange-600 text-white shadow-md scale-105'
    }
    return 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200'
  }

  // Get medal emoji for top 3
  const getMedal = () => {
    if (rank === 1) return '🥇'
    if (rank === 2) return '🥈'
    if (rank === 3) return '🥉'
    return null
  }

  const medal = getMedal()

  return (
    <div className={`
      flex items-center justify-center
      rounded-full
      font-bold
      transition-transform
      ${rank <= 3 ? 'w-16 h-16 text-xl' : 'w-12 h-12 text-lg'}
      ${getBadgeStyle()}
    `}>
      {medal ? (
        <span className="text-2xl">{medal}</span>
      ) : (
        <span>#{rank}</span>
      )}
    </div>
  )
}
