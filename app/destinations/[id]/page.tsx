'use client'

import { useState, useEffect } from 'react'
import { useParams, useRouter, useSearchParams } from 'next/navigation'
import Link from 'next/link'
import { getDestinationById, getClimateDataForDestination, getScoresForDestination, getHolidayPeriodById, getScoresForHolidayPeriod } from '@/lib/queries'
import type { Destination, ClimateData, HolidayPeriod } from '@/lib/supabase'
import ScoreBreakdown from '@/app/components/ScoreBreakdown'

export default function DestinationDetailPage() {
  const params = useParams()
  const router = useRouter()
  const searchParams = useSearchParams()
  const destinationId = params.id as string
  const periodId = searchParams.get('period')

  const [destination, setDestination] = useState<Destination | null>(null)
  const [climate, setClimate] = useState<ClimateData[]>([])
  const [scores, setScores] = useState<any[]>([])
  const [selectedPeriod, setSelectedPeriod] = useState<HolidayPeriod | null>(null)
  const [selectedPeriodScore, setSelectedPeriodScore] = useState<any>(null)
  const [rankInPeriod, setRankInPeriod] = useState<number | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchDestinationDetails() {
      try {
        setLoading(true)

        const basePromises = [
          getDestinationById(destinationId),
          getClimateDataForDestination(destinationId),
          getScoresForDestination(destinationId)
        ]

        // If periodId is provided, fetch period-specific data
        if (periodId) {
          basePromises.push(
            getHolidayPeriodById(periodId) as any,
            getScoresForHolidayPeriod(periodId) as any
          )
        }

        const results = await Promise.all(basePromises)
        const [destResult, climateResult, scoresResult, periodResult, allPeriodScoresResult] = results

        if (destResult.error) throw new Error('Failed to load destination')
        if (!destResult.data) {
          setError('Destination not found')
          return
        }

        setDestination(destResult.data)
        setClimate(climateResult.data || [])
        setScores(scoresResult.data || [])

        // Handle period-specific data
        if (periodId && periodResult && allPeriodScoresResult) {
          if (!periodResult.error && periodResult.data) {
            setSelectedPeriod(periodResult.data)
          }

          // Find this destination's score in the period
          if (!allPeriodScoresResult.error && allPeriodScoresResult.data) {
            const thisDestScore = allPeriodScoresResult.data.find(
              (s: any) => s.destination_id === destinationId
            )
            if (thisDestScore) {
              setSelectedPeriodScore(thisDestScore)

              // Calculate rank
              const rank = allPeriodScoresResult.data.findIndex(
                (s: any) => s.destination_id === destinationId
              ) + 1
              setRankInPeriod(rank)
            }
          }
        }
      } catch (err) {
        console.error('Error fetching destination details:', err)
        setError('Failed to load destination details')
      } finally {
        setLoading(false)
      }
    }

    fetchDestinationDetails()
  }, [destinationId, periodId])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="inline-block animate-spin rounded-full h-16 w-16 border-b-2 border-blue-600"></div>
          <p className="mt-4 text-gray-600 dark:text-gray-400">Loading destination...</p>
        </div>
      </div>
    )
  }

  if (error || !destination) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center max-w-md mx-auto p-8">
          <div className="text-6xl mb-4">❌</div>
          <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
            Destination Not Found
          </h2>
          <p className="text-gray-600 dark:text-gray-400 mb-6">{error}</p>
          <button
            onClick={() => router.push('/destinations')}
            className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors"
          >
            Back to Destinations
          </button>
        </div>
      </div>
    )
  }

  const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr)
    return date.toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })
  }

  const getRankBadgeColor = (rank: number) => {
    if (rank === 1) return 'from-yellow-400 to-yellow-600 text-white'
    if (rank === 2) return 'from-gray-300 to-gray-400 text-gray-900'
    if (rank === 3) return 'from-orange-400 to-orange-600 text-white'
    return 'from-blue-500 to-blue-600 text-white'
  }

  const getRankEmoji = (rank: number) => {
    if (rank === 1) return '🥇'
    if (rank === 2) return '🥈'
    if (rank === 3) return '🥉'
    return `#${rank}`
  }

  return (
    <div className="p-8">
      <div className="max-w-7xl mx-auto">
        {/* Breadcrumb / Back Button */}
        {periodId && selectedPeriod ? (
          <div className="mb-6 text-sm text-gray-600 dark:text-gray-400">
            <Link href="/periods" className="hover:text-blue-600 dark:hover:text-blue-400">
              Holiday Periods
            </Link>
            <span className="mx-2">›</span>
            <Link
              href={`/periods/${periodId}/results`}
              className="hover:text-blue-600 dark:hover:text-blue-400"
            >
              {selectedPeriod.name}
            </Link>
            <span className="mx-2">›</span>
            <span>{destination?.name}</span>
          </div>
        ) : (
          <button
            onClick={() => router.back()}
            className="mb-6 flex items-center text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white"
          >
            <svg className="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
            </svg>
            Back
          </button>
        )}

        {/* Period-Specific Score Highlight */}
        {selectedPeriod && selectedPeriodScore && rankInPeriod && (
          <div className="bg-gradient-to-r from-blue-600 to-blue-700 dark:from-blue-700 dark:to-blue-800 rounded-lg shadow-xl p-6 mb-8 text-white">
            <div className="flex items-start gap-6">
              <div className={`flex-shrink-0 w-20 h-20 rounded-full bg-gradient-to-br ${getRankBadgeColor(rankInPeriod)} flex items-center justify-center text-2xl font-bold shadow-lg`}>
                {getRankEmoji(rankInPeriod)}
              </div>
              <div className="flex-1">
                <h2 className="text-2xl font-bold mb-2">
                  Ranked #{rankInPeriod} for {selectedPeriod.name}
                </h2>
                <p className="text-blue-100 mb-4">
                  {formatDate(selectedPeriod.start_date)} - {formatDate(selectedPeriod.end_date)}
                </p>
                <div className="flex items-baseline gap-3 mb-4">
                  <span className="text-4xl font-bold">{Math.round(selectedPeriodScore.final_score)}</span>
                  <span className="text-xl text-blue-100">/ 100</span>
                </div>
                <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
                  <div className="text-sm text-blue-100 mb-2">Score Breakdown</div>
                  <div className="grid grid-cols-3 md:grid-cols-6 gap-3 text-sm">
                    <div>
                      <div className="text-blue-200">Weather</div>
                      <div className="font-bold">{Math.round(selectedPeriodScore.weather_score)}</div>
                    </div>
                    <div>
                      <div className="text-blue-200">Flight</div>
                      <div className="font-bold">{Math.round(selectedPeriodScore.flight_score)}</div>
                    </div>
                    <div>
                      <div className="text-blue-200">Jet-lag</div>
                      <div className="font-bold">{Math.round(selectedPeriodScore.jet_lag_score)}</div>
                    </div>
                    <div>
                      <div className="text-blue-200">Beach</div>
                      <div className="font-bold">{Math.round(selectedPeriodScore.beach_score)}</div>
                    </div>
                    <div>
                      <div className="text-blue-200">Kids</div>
                      <div className="font-bold">{Math.round(selectedPeriodScore.kid_facilities_score)}</div>
                    </div>
                    <div>
                      <div className="text-blue-200">Luxury</div>
                      <div className="font-bold">{Math.round(selectedPeriodScore.luxury_score)}</div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="flex-shrink-0">
                <Link
                  href={`/periods/${periodId}/results`}
                  className="inline-block bg-white text-blue-600 font-semibold px-4 py-2 rounded-lg hover:bg-blue-50 transition-colors"
                >
                  See All Rankings
                </Link>
              </div>
            </div>
          </div>
        )}

        {/* Header */}
        <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-8 mb-8">
          <div className="flex justify-between items-start">
            <div>
              <h1 className="text-4xl font-bold text-gray-900 dark:text-white mb-2">
                {destination.name}
              </h1>
              <p className="text-xl text-gray-600 dark:text-gray-400">
                {destination.country} • {destination.region}
              </p>
            </div>
            <div className="text-6xl">
              {destination.type === 'Beach' && '🏖️'}
              {destination.type === 'City' && '🏙️'}
              {destination.type === 'Nature' && '🏔️'}
              {destination.type === 'Cultural' && '🏛️'}
            </div>
          </div>

          {/* Key Details */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-8">
            <div className="bg-gray-50 dark:bg-gray-700 rounded-lg p-4">
              <div className="text-sm text-gray-600 dark:text-gray-400 mb-1">Flight Time</div>
              <div className="text-2xl font-bold text-gray-900 dark:text-white">{destination.flight_hours}h</div>
            </div>
            <div className="bg-gray-50 dark:bg-gray-700 rounded-lg p-4">
              <div className="text-sm text-gray-600 dark:text-gray-400 mb-1">Time Diff</div>
              <div className="text-2xl font-bold text-gray-900 dark:text-white">
                {destination.time_difference > 0 ? '+' : ''}{destination.time_difference}h
              </div>
            </div>
            <div className="bg-gray-50 dark:bg-gray-700 rounded-lg p-4">
              <div className="text-sm text-gray-600 dark:text-gray-400 mb-1">Visa</div>
              <div className="text-lg font-bold text-gray-900 dark:text-white">{destination.visa_required}</div>
            </div>
            <div className="bg-gray-50 dark:bg-gray-700 rounded-lg p-4">
              <div className="text-sm text-gray-600 dark:text-gray-400 mb-1">Budget</div>
              <div className="text-lg font-bold text-gray-900 dark:text-white">{destination.budget_level}</div>
            </div>
          </div>
        </div>

        {/* Additional Details */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
          {/* General Info */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">General Information</h2>
            <div className="space-y-3">
              <div className="flex justify-between">
                <span className="text-gray-600 dark:text-gray-400">Currency:</span>
                <span className="font-medium text-gray-900 dark:text-white">{destination.currency}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-gray-600 dark:text-gray-400">Language:</span>
                <span className="font-medium text-gray-900 dark:text-white">{destination.language}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-gray-600 dark:text-gray-400">Type:</span>
                <span className="font-medium text-gray-900 dark:text-white">{destination.type}</span>
              </div>
              {destination.best_months && (
                <div className="flex justify-between">
                  <span className="text-gray-600 dark:text-gray-400">Best Months:</span>
                  <span className="font-medium text-gray-900 dark:text-white">{destination.best_months}</span>
                </div>
              )}
              {destination.worst_months && (
                <div className="flex justify-between">
                  <span className="text-gray-600 dark:text-gray-400">Avoid:</span>
                  <span className="font-medium text-gray-900 dark:text-white">{destination.worst_months}</span>
                </div>
              )}
            </div>
          </div>

          {/* Ratings */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">Ratings</h2>
            <div className="space-y-4">
              <div>
                <div className="flex justify-between mb-2">
                  <span className="text-gray-600 dark:text-gray-400">Beach/Pool Quality</span>
                  <span className="font-bold text-gray-900 dark:text-white">{destination.beach_pool_quality}/10</span>
                </div>
                <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
                  <div
                    className="bg-blue-600 h-2 rounded-full"
                    style={{ width: `${destination.beach_pool_quality * 10}%` }}
                  />
                </div>
              </div>

              <div>
                <div className="flex justify-between mb-2">
                  <span className="text-gray-600 dark:text-gray-400">Kid Facilities</span>
                  <span className="font-bold text-gray-900 dark:text-white">{destination.kid_facilities_quality}/10</span>
                </div>
                <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
                  <div
                    className="bg-green-600 h-2 rounded-full"
                    style={{ width: `${destination.kid_facilities_quality * 10}%` }}
                  />
                </div>
              </div>

              <div>
                <div className="flex justify-between mb-2">
                  <span className="text-gray-600 dark:text-gray-400">Luxury Hotels</span>
                  <span className="font-bold text-gray-900 dark:text-white">{Math.round(destination.high_star_share * 100)}%</span>
                </div>
                <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
                  <div
                    className="bg-purple-600 h-2 rounded-full"
                    style={{ width: `${destination.high_star_share * 100}%` }}
                  />
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Climate Data Table */}
        {climate.length > 0 && (
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6 mb-8">
            <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">Climate Data</h2>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-gray-200 dark:border-gray-700">
                    <th className="text-left py-2 px-2 text-gray-600 dark:text-gray-400">Month</th>
                    <th className="text-center py-2 px-2 text-gray-600 dark:text-gray-400">Avg Temp</th>
                    <th className="text-center py-2 px-2 text-gray-600 dark:text-gray-400">High</th>
                    <th className="text-center py-2 px-2 text-gray-600 dark:text-gray-400">Low</th>
                    <th className="text-center py-2 px-2 text-gray-600 dark:text-gray-400">Rainfall</th>
                  </tr>
                </thead>
                <tbody>
                  {climate.map((c) => (
                    <tr key={c.id} className="border-b border-gray-100 dark:border-gray-700">
                      <td className="py-2 px-2 font-medium text-gray-900 dark:text-white">{monthNames[c.month - 1]}</td>
                      <td className="py-2 px-2 text-center text-gray-900 dark:text-white">{c.temperature_celsius}°C</td>
                      <td className="py-2 px-2 text-center text-gray-600 dark:text-gray-400">{c.temperature_high}°C</td>
                      <td className="py-2 px-2 text-center text-gray-600 dark:text-gray-400">{c.temperature_low}°C</td>
                      <td className="py-2 px-2 text-center text-gray-600 dark:text-gray-400">{c.rainfall_mm}mm</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* Scores for Holiday Periods */}
        {scores.length > 0 && (
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">Holiday Period Scores</h2>
            <div className="space-y-4">
              {scores.slice(0, 5).map((score: any) => (
                <div key={score.id} className="bg-gray-50 dark:bg-gray-700 rounded-lg p-4">
                  <div className="flex justify-between items-center mb-2">
                    <h3 className="font-bold text-gray-900 dark:text-white">
                      {score.holiday_periods?.name || 'Holiday Period'}
                    </h3>
                    <div className="text-2xl font-bold text-blue-600 dark:text-blue-400">
                      {score.final_score.toFixed(0)}
                    </div>
                  </div>
                  <div className="grid grid-cols-5 gap-2 text-xs">
                    <div>
                      <div className="text-gray-600 dark:text-gray-400">Weather</div>
                      <div className="font-medium text-gray-900 dark:text-white">{score.weather_score.toFixed(0)}</div>
                    </div>
                    <div>
                      <div className="text-gray-600 dark:text-gray-400">Flight</div>
                      <div className="font-medium text-gray-900 dark:text-white">{score.flight_score.toFixed(0)}</div>
                    </div>
                    <div>
                      <div className="text-gray-600 dark:text-gray-400">Beach</div>
                      <div className="font-medium text-gray-900 dark:text-white">{score.beach_score.toFixed(0)}</div>
                    </div>
                    <div>
                      <div className="text-gray-600 dark:text-gray-400">Kids</div>
                      <div className="font-medium text-gray-900 dark:text-white">{score.kid_facilities_score.toFixed(0)}</div>
                    </div>
                    <div>
                      <div className="text-gray-600 dark:text-gray-400">Luxury</div>
                      <div className="font-medium text-gray-900 dark:text-white">{score.luxury_score.toFixed(0)}</div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {destination.notes && (
          <div className="bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800 rounded-lg p-6 mt-8">
            <h3 className="font-bold text-blue-900 dark:text-blue-200 mb-2">Notes</h3>
            <p className="text-blue-800 dark:text-blue-300">{destination.notes}</p>
          </div>
        )}
      </div>
    </div>
  )
}
