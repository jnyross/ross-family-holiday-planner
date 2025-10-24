import Link from 'next/link'

export default function Home() {
  return (
    <div className="p-8 pb-20 sm:p-20">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-5xl font-bold text-gray-900 dark:text-white mb-4">
            Find Your Perfect Holiday Destination
          </h1>
          <p className="text-xl text-gray-600 dark:text-gray-400">
            Select your dates, we&apos;ll rank the best destinations for that time of year
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-12">
          {/* Feature Card 1 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">📅</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Period-Based Rankings
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Select your holiday dates to see destinations ranked specifically for that time
            </p>
          </div>

          {/* Feature Card 2 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">📊</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              6-Factor Scoring
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Weather, flight time, jet-lag, beach quality, kids facilities, and luxury hotels
            </p>
          </div>

          {/* Feature Card 3 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">🌤️</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Climate-Aware
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Monthly temperature and rainfall data analyzed for your exact holiday period
            </p>
          </div>

          {/* Feature Card 4 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">✈️</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              112 Destinations
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Worldwide destinations from quick European breaks to long-haul adventures
            </p>
          </div>

          {/* Feature Card 5 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">🇬🇧</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              UK School Holidays
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              8 pre-configured periods aligned with UK school holiday dates
            </p>
          </div>

          {/* Feature Card 6 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">👨‍👩‍👧‍👦</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Family-Focused
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Ratings for kid facilities, beach quality, and family-friendly amenities
            </p>
          </div>
        </div>

        {/* CTA Section */}
        <div className="bg-gradient-to-r from-blue-600 to-blue-700 dark:from-blue-700 dark:to-blue-800 rounded-lg shadow-xl p-8 text-center text-white">
          <h2 className="text-3xl font-bold mb-4">Ready to Find Your Perfect Destination?</h2>
          <p className="text-xl mb-6">
            Select your holiday period to see ranked recommendations
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <Link
              href="/periods"
              className="inline-block bg-white text-blue-600 font-semibold px-8 py-3 rounded-lg hover:bg-gray-100 transition-colors shadow-lg"
            >
              Select Your Holiday Period →
            </Link>
            <Link
              href="/destinations"
              className="inline-block bg-blue-800 dark:bg-blue-900 text-white font-semibold px-8 py-3 rounded-lg hover:bg-blue-900 dark:hover:bg-blue-950 transition-colors border-2 border-white/30"
            >
              Browse All Destinations
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
