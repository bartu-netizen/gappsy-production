import { useEffect } from 'react';
import { useParams, useLocation, useNavigate } from 'react-router-dom';
import { Loader2 } from 'lucide-react';
import { useNoindex } from '../components/NoindexMeta';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;

/**
 * Smart Continue Page
 *
 * Lightweight redirect handler for /continue/:agencySlug smart routing links.
 * - Shows loading state
 * - Calls smart-next-resolver edge function
 * - Redirects to resolved destination
 * - Falls back gracefully on errors
 */
export default function SmartContinuePage() {
  useNoindex();
  const { agencySlug } = useParams<{ agencySlug: string }>();
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    const resolve = async () => {
      if (!agencySlug) {
        console.error('[SmartContinuePage] No agency slug provided');
        navigate('/your-agency/not-found', { replace: true });
        return;
      }

      // ============================================================================
      // CRITICAL: flow=manage CLIENT-SIDE FAILSAFE
      // ============================================================================
      // If flow=manage is present, SHORT-CIRCUIT and go directly to manage listing
      // This ensures manage links NEVER redirect to /your-agency/:agencySlug
      // even if the server-side resolver fails or returns incorrect destination
      const searchParams = new URLSearchParams(location.search);
      const flowParam = searchParams.get('flow');
      const cToken = searchParams.get('c');

      if (flowParam === 'manage') {
        // Preserve all attribution params — only strip `flow` itself
        const destParams = new URLSearchParams(searchParams);
        destParams.delete('flow');

        const queryString = destParams.toString();
        const manageDestination = queryString
          ? `/manage-listing/${agencySlug}?${queryString}`
          : `/manage-listing/${agencySlug}`;

        console.log('[SmartContinuePage] flow=manage detected - CLIENT-SIDE SHORT-CIRCUIT', {
          agencySlug,
          manageDestination,
          hasToken: !!cToken,
          hasLid: !!destParams.get('lid'),
          hasUtmSource: !!destParams.get('utm_source'),
        });

        navigate(manageDestination, { replace: true });
        return;
      }

      // ============================================================================
      // CLIENT-SIDE SHORTCUT: mode=recent_request_replay
      // ============================================================================
      // If mode=recent_request_replay is present, skip the server resolver entirely
      // and go directly to the request replay page, preserving all attribution params.
      const modeParam = searchParams.get('mode');
      if (modeParam === 'recent_request_replay') {
        const destParams = new URLSearchParams(searchParams);
        destParams.delete('mode');
        const qs = destParams.toString();
        const replayDest = qs ? `/request-replay/${agencySlug}?${qs}` : `/request-replay/${agencySlug}`;
        console.log('[SmartContinuePage] mode=recent_request_replay — CLIENT-SIDE SHORT-CIRCUIT', {
          agencySlug,
          replayDest,
        });
        navigate(replayDest, { replace: true });
        return;
      }

      try {
        // Preserve all query parameters from original link
        const queryString = location.search;

        // Call resolver with full query string
        const resolverUrl = `${SUPABASE_URL}/functions/v1/smart-next-resolver/${agencySlug}${queryString}`;

        console.log('[SmartContinuePage] Resolving smart link', {
          agencySlug,
          hasQuery: !!queryString,
        });

        const response = await fetch(resolverUrl, {
          method: 'GET',
        });

        if (!response.ok) {
          throw new Error(`Resolver returned ${response.status}`);
        }

        const data = await response.json();

        if (data.ok && data.destination) {
          console.log('[SmartContinuePage] Resolved to:', data.destination);

          // Navigate to resolved destination
          if (data.destination.startsWith('/')) {
            navigate(data.destination, { replace: true });
          } else if (data.destination.startsWith('http')) {
            window.location.href = data.destination;
          } else {
            // Relative path, prepend /
            navigate(`/${data.destination}`, { replace: true });
          }
        } else {
          // Fallback if no valid destination
          console.warn('[SmartContinuePage] No valid destination, falling back to profile');
          navigate(`/your-agency/${agencySlug}`, { replace: true });
        }

      } catch (error) {
        console.error('[SmartContinuePage] Resolution failed:', error);
        // Fallback to basic profile page
        navigate(`/your-agency/${agencySlug}`, { replace: true });
      }
    };

    resolve();
  }, [agencySlug, location.search, navigate]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100">
      <div className="text-center">
        <div className="inline-flex items-center justify-center w-16 h-16 bg-white rounded-2xl shadow-lg mb-6">
          <Loader2 className="w-8 h-8 text-blue-600 animate-spin" />
        </div>
        <h2 className="text-xl font-semibold text-slate-800 mb-2">
          Finding your perfect match...
        </h2>
        <p className="text-sm text-slate-500">
          Redirecting you to the best next step
        </p>
      </div>
    </div>
  );
}
