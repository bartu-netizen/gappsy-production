import { useState } from 'react';
import { Lock, Loader, AlertTriangle } from 'lucide-react';
import { useAdminSession } from '../../contexts/AdminSessionContext';

interface AdminReAuthCardProps {
  onSuccess?: () => void;
  message?: string;
}

export default function AdminReAuthCard({ onSuccess, message }: AdminReAuthCardProps) {
  const { login } = useAdminSession();
  const [secret, setSecret] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!secret.trim()) {
      setError('Please enter the admin secret');
      return;
    }

    setIsLoading(true);
    setError('');

    const result = await login(secret.trim());

    if (result.ok) {
      setSecret('');
      onSuccess?.();
    } else {
      setError(result.error || 'Invalid secret');
    }

    setIsLoading(false);
  };

  return (
    <div className="bg-amber-50 border border-amber-200 rounded-lg p-6">
      <div className="flex gap-3 mb-4">
        <AlertTriangle className="w-6 h-6 text-amber-600 shrink-0" />
        <div>
          <h3 className="font-semibold text-amber-900">Session Expired</h3>
          <p className="text-sm text-amber-800 mt-1">
            {message || 'Your admin session has expired. Please log in again to continue.'}
          </p>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="mt-4">
        <div className="flex gap-2">
          <div className="relative flex-1">
            <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="password"
              value={secret}
              onChange={(e) => setSecret(e.target.value)}
              placeholder="Enter admin secret"
              className="w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent"
              disabled={isLoading}
              autoFocus
            />
          </div>
          <button
            type="submit"
            disabled={isLoading || !secret.trim()}
            className="px-4 py-2 bg-amber-600 text-white rounded-lg font-medium hover:bg-amber-700 disabled:bg-gray-400 disabled:cursor-not-allowed flex items-center gap-2 whitespace-nowrap"
          >
            {isLoading ? (
              <>
                <Loader className="w-4 h-4 animate-spin" />
                Logging in...
              </>
            ) : (
              'Log In'
            )}
          </button>
        </div>

        {error && (
          <p className="mt-2 text-sm text-red-600">{error}</p>
        )}
      </form>
    </div>
  );
}
