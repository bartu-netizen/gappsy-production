import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

interface AutoRedirectProps {
  targetUrl: string;
  agencyName: string;
  onCancel: () => void;
  cancelled: boolean;
  mode?: string;
  agencyId?: string;
  stateSlug?: string;
}

export default function AutoRedirect({ targetUrl, agencyName, onCancel, cancelled, mode, agencyId, stateSlug }: AutoRedirectProps) {
  const navigate = useNavigate();
  const isOwnerSimulation = mode === 'owner-sim';
  const [countdown, setCountdown] = useState(10);
  const [popupBlocked, setPopupBlocked] = useState(false);

  const handleManualRedirect = () => {
    if (isOwnerSimulation && agencyId && stateSlug) {
      const dashboardUrl = `/availability/owner-preview?agencyId=${agencyId}&state=${stateSlug}&edited=1&fromDemo=1`;
      navigate(dashboardUrl, { replace: true });
    }
  };

  useEffect(() => {
    if (cancelled || popupBlocked) return;

    if (countdown > 0) {
      const timer = setTimeout(() => {
        setCountdown(countdown - 1);
      }, 1000);
      return () => clearTimeout(timer);
    } else {
      if (isOwnerSimulation && agencyId && stateSlug) {
        const dashboardUrl = `/availability/owner-preview?agencyId=${agencyId}&state=${stateSlug}&edited=1&fromDemo=1`;
        if (import.meta.env.DEV) {
          console.log('[AutoRedirect] 🎯 Owner simulation complete!');
          console.log('[AutoRedirect] Redirecting to Owner Dashboard:', dashboardUrl);
        }
        navigate(dashboardUrl, { replace: true });
      } else {
        const newWindow = window.open(targetUrl, '_blank');
        if (!newWindow || newWindow.closed || typeof newWindow.closed === 'undefined') {
          setPopupBlocked(true);
        }
      }
    }
  }, [countdown, cancelled, popupBlocked, targetUrl, isOwnerSimulation, agencyId, stateSlug, navigate]);

  const progressPercentage = ((10 - countdown) / 10) * 100;

  if (cancelled) {
    return (
      <div className="mt-8 text-center">
        <p className="text-sm text-gray-600">
          Redirect cancelled. You can still visit the agency using the button above.
        </p>
      </div>
    );
  }

  if (popupBlocked) {
    return (
      <div className="mt-8 text-center">
        <div className="inline-flex items-center gap-2 bg-yellow-50 border border-yellow-200 text-yellow-800 px-4 py-2 rounded-lg text-sm">
          <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
          </svg>
          <span>
            Your browser blocked the automatic redirect. Click the button above to visit {agencyName} manually.
          </span>
        </div>
      </div>
    );
  }

  if (countdown > 0) {
    return (
      <div className="mt-8 text-center">
        <p className="text-sm text-gray-600 mb-3">
          {isOwnerSimulation ? (
            <>
              We'll automatically return you to your private report in <span className="font-semibold text-indigo-600">{countdown}</span> seconds...
            </>
          ) : (
            <>
              We'll automatically redirect you to {agencyName} in <span className="font-semibold text-indigo-600">{countdown}</span> seconds...{' '}
              <button
                onClick={onCancel}
                className="text-indigo-600 hover:text-indigo-600 font-medium underline"
              >
                Cancel
              </button>
            </>
          )}
        </p>
        <div className="max-w-xs mx-auto h-1.5 bg-gray-200 rounded-full overflow-hidden mb-4">
          <div
            className="h-full bg-gradient-to-r from-blue-600 to-blue-700 transition-all duration-1000 ease-linear"
            style={{ width: `${progressPercentage}%` }}
          ></div>
        </div>
        {isOwnerSimulation && (
          <button
            onClick={handleManualRedirect}
            className="w-full max-w-xs mx-auto bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-600 transition-colors shadow-sm hover:shadow-md"
          >
            Complete your listing activation now
          </button>
        )}
      </div>
    );
  }

  return null;
}
