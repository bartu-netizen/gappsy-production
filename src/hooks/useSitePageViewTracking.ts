import { useEffect, useRef } from 'react';
import { useLocation } from 'react-router-dom';
import { getVisitorId } from '../utils/funnelTracking';

// Site-wide page-view + time-on-page tracking — the generic counterpart to
// the tool-detail-only tracking in src/lib/trackToolEvent.ts. Mounted once
// near the app root (by someone else); fires on every route change via
// react-router's useLocation, skipping admin's own navigation.
//
// Fire-and-forget by design: a broken analytics call must never affect the
// page, so every send is best-effort and never throws to the caller.

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;
const ENDPOINT = `${SUPABASE_URL}/functions/v1/track-site-page-view`;

interface ActivePageView {
  id: string;
  enteredAt: number;
}

function send(payload: Record<string, unknown>, useBeacon = false): void {
  try {
    const body = JSON.stringify(payload);
    if (useBeacon && typeof navigator !== 'undefined' && navigator.sendBeacon) {
      // sendBeacon doesn't support custom headers/auth, but this endpoint is
      // anon-callable like track-tool-event — a JSON blob is enough for it
      // to accept the request.
      const sent = navigator.sendBeacon(ENDPOINT, new Blob([body], { type: 'application/json' }));
      if (sent) return;
    }
    fetch(ENDPOINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        apikey: SUPABASE_ANON_KEY,
      },
      body,
      keepalive: true,
    }).catch(() => {});
  } catch {
    // ignore — analytics must never affect the page
  }
}

export function useSitePageViewTracking(): void {
  const location = useLocation();
  const activeRef = useRef<ActivePageView | null>(null);

  useEffect(() => {
    function flushActive() {
      const active = activeRef.current;
      if (!active) return;
      const durationSeconds = Math.round((Date.now() - active.enteredAt) / 1000);
      send({ action: 'duration', id: active.id, duration_seconds: durationSeconds });
      activeRef.current = null;
    }

    function flushActiveViaBeacon() {
      const active = activeRef.current;
      if (!active) return;
      const durationSeconds = Math.round((Date.now() - active.enteredAt) / 1000);
      send({ action: 'duration', id: active.id, duration_seconds: durationSeconds }, true);
      activeRef.current = null;
    }

    function handleVisibilityChange() {
      if (document.hidden) flushActiveViaBeacon();
    }

    function handlePageHide() {
      flushActiveViaBeacon();
    }

    // Flush whatever page was active before this navigation, then start a
    // new one — unless this is an admin route, which is never tracked.
    flushActive();

    if (!location.pathname.startsWith('/wp-admin')) {
      const id = crypto.randomUUID();
      const params = new URLSearchParams(window.location.search);
      activeRef.current = { id, enteredAt: Date.now() };
      send({
        action: 'start',
        id,
        path: location.pathname,
        referrer: document.referrer || null,
        utm_source: params.get('utm_source'),
        utm_medium: params.get('utm_medium'),
        utm_campaign: params.get('utm_campaign'),
        visitor_id: getVisitorId(),
      });
    }

    document.addEventListener('visibilitychange', handleVisibilityChange);
    window.addEventListener('pagehide', handlePageHide);

    return () => {
      document.removeEventListener('visibilitychange', handleVisibilityChange);
      window.removeEventListener('pagehide', handlePageHide);
    };
    // Re-run on every path (+ query string) change — a new "page" for
    // tracking purposes even if only the search params changed.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [location.pathname, location.search]);
}

export default useSitePageViewTracking;
