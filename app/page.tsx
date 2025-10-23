import Link from 'next/link'

export default function Home() {
  return (
    <div className="p-8 pb-20 sm:p-20">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-5xl font-bold text-gray-900 dark:text-white mb-4">
            Plan Your Perfect Family Holiday
          </h1>
          <p className="text-xl text-gray-600 dark:text-gray-400">
            Discover destinations with data-driven recommendations tailored for families
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-12">
          {/* Feature Card 1 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">✈️</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              112 Destinations
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Browse worldwide destinations with detailed information and climate data
            </p>
          </div>

          {/* Feature Card 2 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">📊</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Smart Scoring
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Data-driven scoring based on weather, flight time, and family-friendly amenities
            </p>
          </div>

          {/* Feature Card 3 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">🌤️</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Climate Data
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Monthly temperature and rainfall data for informed planning
            </p>
          </div>

          {/* Feature Card 4 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">📋</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Shortlist Management
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Mark candidates and track your favorite destinations
            </p>
          </div>

          {/* Feature Card 5 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">📅</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Holiday Periods
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Plan around school holidays with 8 pre-configured periods
            </p>
          </div>

          {/* Feature Card 6 */}
          <div className="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
            <div className="text-4xl mb-4">⭐</div>
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              Family-Focused
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Kid facilities, beach quality, and luxury ratings included
            </p>
          </div>
        </div>

        {/* CTA Section */}
        <div className="bg-blue-600 dark:bg-blue-700 rounded-lg shadow-xl p-8 text-center text-white">
          <h2 className="text-3xl font-bold mb-4">Ready to Start Planning?</h2>
          <p className="text-xl mb-6">
            Browse destinations and find your perfect family getaway
          </p>
          <Link
            href="/destinations"
            className="inline-block bg-white text-blue-600 font-semibold px-8 py-3 rounded-lg hover:bg-gray-100 transition-colors"
          >
            Explore Destinations
          </Link>
        </div>
      </div>
    </div>
  );
}
