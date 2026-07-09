import { AlertTriangle, RefreshCw, LogIn, WifiOff, Clock, Server, Shield } from 'lucide-react';
import type { AdminApiError, AdminErrorCode } from '../../lib/adminApiFetch';

interface AdminErrorBannerProps {
  error: AdminApiError;
  onRetry?: () => void;
  onLogin?: () => void;
  className?: string;
  compact?: boolean;
}

const ERROR_ICONS: Record<AdminErrorCode, typeof AlertTriangle> = {
  auth_error: Shield,
  session_expired: LogIn,
  no_session: LogIn,
  network_error: WifiOff,
  timeout_error: Clock,
  cors_error: Shield,
  backend_html_error: Server,
  server_error: Server,
  parse_error: Server,
  empty_response: Server,
  provider_error: Server,
  unknown_error: AlertTriangle,
};

const ERROR_COLORS: Record<AdminErrorCode, { bg: string; border: string; text: string; icon: string }> = {
  auth_error: { bg: 'bg-amber-50', border: 'border-amber-200', text: 'text-amber-800', icon: 'text-amber-500' },
  session_expired: { bg: 'bg-amber-50', border: 'border-amber-200', text: 'text-amber-800', icon: 'text-amber-500' },
  no_session: { bg: 'bg-amber-50', border: 'border-amber-200', text: 'text-amber-800', icon: 'text-amber-500' },
  network_error: { bg: 'bg-slate-50', border: 'border-slate-200', text: 'text-slate-700', icon: 'text-slate-500' },
  timeout_error: { bg: 'bg-slate-50', border: 'border-slate-200', text: 'text-slate-700', icon: 'text-slate-500' },
  cors_error: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-800', icon: 'text-red-500' },
  backend_html_error: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-800', icon: 'text-red-500' },
  server_error: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-700', icon: 'text-red-500' },
  parse_error: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-700', icon: 'text-red-500' },
  empty_response: { bg: 'bg-slate-50', border: 'border-slate-200', text: 'text-slate-700', icon: 'text-slate-500' },
  provider_error: { bg: 'bg-orange-50', border: 'border-orange-200', text: 'text-orange-700', icon: 'text-orange-500' },
  unknown_error: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-700', icon: 'text-red-500' },
};

export function AdminErrorBanner({
  error,
  onRetry,
  onLogin,
  className = '',
  compact = false,
}: AdminErrorBannerProps) {
  const Icon = ERROR_ICONS[error.code] || AlertTriangle;
  const colors = ERROR_COLORS[error.code] || ERROR_COLORS.unknown_error;

  const isAuthRelated = error.code === 'auth_error' || error.code === 'session_expired' || error.code === 'no_session';
  const showRetry = error.retryable && onRetry;
  const showLogin = isAuthRelated && onLogin;

  if (compact) {
    return (
      <div className={`flex items-center gap-2 px-3 py-2 rounded-lg ${colors.bg} ${colors.border} border ${className}`}>
        <Icon className={`w-4 h-4 shrink-0 ${colors.icon}`} />
        <span className={`text-sm ${colors.text}`}>{error.message}</span>
        {showRetry && (
          <button
            onClick={onRetry}
            className="ml-auto text-xs font-medium text-slate-600 hover:text-slate-800 flex items-center gap-1"
          >
            <RefreshCw className="w-3 h-3" />
            Retry
          </button>
        )}
      </div>
    );
  }

  return (
    <div className={`rounded-xl ${colors.bg} ${colors.border} border p-4 ${className}`}>
      <div className="flex items-start gap-3">
        <div className={`shrink-0 mt-0.5 ${colors.icon}`}>
          <Icon className="w-5 h-5" />
        </div>
        <div className="flex-1 min-w-0">
          <p className={`text-sm font-medium ${colors.text}`}>{error.message}</p>
          {error.raw && (
            <details className="mt-2">
              <summary className="text-xs text-slate-500 cursor-pointer hover:text-slate-700">
                Show technical details
              </summary>
              <pre className="mt-2 text-xs bg-slate-100 rounded p-2 overflow-x-auto text-slate-600 max-h-24">
                {error.raw}
              </pre>
            </details>
          )}
          {(showRetry || showLogin) && (
            <div className="flex items-center gap-3 mt-3">
              {showRetry && (
                <button
                  onClick={onRetry}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors"
                >
                  <RefreshCw className="w-3.5 h-3.5" />
                  Try again
                </button>
              )}
              {showLogin && (
                <button
                  onClick={onLogin}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium bg-slate-800 text-white rounded-lg hover:bg-slate-700 transition-colors"
                >
                  <LogIn className="w-3.5 h-3.5" />
                  Log in
                </button>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

interface AdminLoadingStateProps {
  message?: string;
  className?: string;
}

export function AdminLoadingState({ message = 'Loading...', className = '' }: AdminLoadingStateProps) {
  return (
    <div className={`flex flex-col items-center justify-center py-12 ${className}`}>
      <div className="w-8 h-8 border-2 border-slate-200 border-t-slate-600 rounded-full animate-spin" />
      <p className="mt-3 text-sm text-slate-500">{message}</p>
    </div>
  );
}

interface AdminEmptyStateProps {
  title?: string;
  message?: string;
  icon?: typeof AlertTriangle;
  className?: string;
}

export function AdminEmptyState({
  title = 'No data',
  message = 'There is no data to display.',
  icon: Icon,
  className = '',
}: AdminEmptyStateProps) {
  return (
    <div className={`flex flex-col items-center justify-center py-12 text-center ${className}`}>
      {Icon && <Icon className="w-8 h-8 text-slate-300 mb-3" />}
      <p className="text-sm font-medium text-slate-600">{title}</p>
      <p className="text-xs text-slate-400 mt-1">{message}</p>
    </div>
  );
}
