import { Link, useLocation } from 'react-router-dom';
import { Home, Search } from 'lucide-react';

export default function NotFoundPage() {
  const location = useLocation();
  const windowPathname = typeof window !== 'undefined' ? window.location.pathname : 'N/A';

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-gray-50 to-gray-100">
      <div className="text-center max-w-2xl mx-auto px-4">
        <div className="mb-8">
          <h1 className="text-9xl font-bold text-gray-200">404</h1>
          <div className="flex justify-center mb-6">
            <Search className="w-24 h-24 text-gray-300" />
          </div>
        </div>

        <div className="mb-6 p-4 bg-yellow-50 border-2 border-yellow-400 rounded-lg">
          <p className="text-sm font-mono text-gray-800 mb-2">
            <strong>DEBUG - Router Pathname:</strong>
            <br />
            <code className="bg-yellow-100 px-2 py-1 rounded">{location.pathname}</code>
          </p>
          <p className="text-sm font-mono text-gray-800">
            <strong>DEBUG - Window Pathname:</strong>
            <br />
            <code className="bg-yellow-100 px-2 py-1 rounded">{windowPathname}</code>
          </p>
        </div>

        <h2 className="text-3xl font-bold text-gray-900 mb-4">
          Page Not Found
        </h2>

        <p className="text-lg text-gray-600 mb-8">
          The page you're looking for doesn't exist or has been moved.
        </p>

        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link
            to="/"
            className="inline-flex items-center justify-center gap-2 bg-indigo-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors"
          >
            <Home className="w-5 h-5" />
            Go Home
          </Link>

          <Link
            to="/marketing-agencies/usa"
            className="inline-flex items-center justify-center gap-2 bg-white text-indigo-600 px-8 py-3 rounded-lg font-semibold border-2 border-indigo-600 hover:bg-indigo-50 transition-colors"
          >
            <Search className="w-5 h-5" />
            Browse States
          </Link>
        </div>

        <div className="mt-12 pt-8 border-t border-gray-200">
          <p className="text-sm text-gray-500">
            Looking for marketing agencies? Check out our{' '}
            <Link to="/marketing-agencies/usa" className="text-indigo-600 hover:underline">
              state-by-state directory
            </Link>
            .
          </p>
        </div>
      </div>
    </div>
  );
}
