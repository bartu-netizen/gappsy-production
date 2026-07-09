import { useState, FormEvent, useEffect } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Lock, AlertCircle } from 'lucide-react';
import { useAdminSession } from '../contexts/AdminSessionContext';

export default function WpAdminLoginPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const { login, status } = useAdminSession();
  const [secret, setSecret] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const reason = searchParams.get('reason');

  useEffect(() => {
    if (status === 'valid') {
      navigate('/wp-admin/dashboard', { replace: true });
    }
  }, [status, navigate]);

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    if (!secret.trim()) { setError('Admin secret is required'); return; }
    setLoading(true);
    setError('');
    const result = await login(secret.trim());
    setLoading(false);
    if (result.ok) {
      navigate('/wp-admin/dashboard', { replace: true });
    } else {
      setError(result.error ?? 'Login failed');
    }
  };

  if (status === 'loading') {
    return (
      <div className="min-h-screen bg-slate-50 flex items-center justify-center">
        <div className="w-6 h-6 border-2 border-blue-600 border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center px-4">
      <div className="w-full max-w-md">
        <div className="bg-white rounded-2xl shadow-xl p-8">
          <div className="text-center mb-8">
            <div className="inline-flex items-center justify-center w-14 h-14 bg-slate-900 rounded-xl mb-4">
              <Lock className="w-7 h-7 text-white" />
            </div>
            <h1 className="text-2xl font-bold text-gray-900">Gappsy Admin</h1>
            <p className="mt-1.5 text-sm text-gray-500">
              Enter your admin secret to access the dashboard
            </p>
          </div>

          {reason === 'session_expired' && (
            <div className="mb-4 flex items-start gap-2.5 p-3 bg-amber-50 border border-amber-200 rounded-lg">
              <AlertCircle className="w-4 h-4 text-amber-600 shrink-0 mt-0.5" />
              <p className="text-sm text-amber-800">Your session expired. Please login again.</p>
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-5">
            <div>
              <label htmlFor="admin-secret" className="block text-sm font-medium text-gray-700 mb-1.5">
                Admin Secret
              </label>
              <input
                type="password"
                id="admin-secret"
                value={secret}
                onChange={(e) => { setSecret(e.target.value); setError(''); }}
                placeholder="Enter admin secret..."
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent transition-all text-sm"
                disabled={loading}
              />
            </div>

            {error && (
              <div className="flex items-start gap-2.5 p-3 bg-red-50 border border-red-200 rounded-lg">
                <AlertCircle className="w-4 h-4 text-red-500 shrink-0 mt-0.5" />
                <p className="text-sm text-red-800">{error}</p>
              </div>
            )}

            <button
              type="submit"
              disabled={loading}
              className="w-full bg-slate-900 text-white py-3 px-4 rounded-lg font-semibold hover:bg-slate-800 active:bg-black transition-colors shadow-sm disabled:opacity-60 disabled:cursor-not-allowed flex items-center justify-center gap-2"
            >
              {loading ? (
                <>
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  Verifying...
                </>
              ) : 'Login'}
            </button>
          </form>
        </div>

        <p className="mt-6 text-center text-xs text-gray-400">
          Gappsy Admin Panel &copy; {new Date().getFullYear()}
        </p>
      </div>
    </div>
  );
}
