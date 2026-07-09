/**
 * SINGLE SOURCE OF TRUTH for all "missed client requests" KPI data.
 *
 * ONE function:   getUnifiedAgencyKpi(agencySlug)
 * ONE hook:       useUnifiedAgencyKpi(agencySlug)
 * ONE identifier: agencySlug — NEVER agencyId
 * ONE backend:    canonical_replay_state via request-replay-stats edge function
 *
 * Rules:
 *   - anchor is created once per agency on first backend hit, never regenerated
 *   - count is stored server-side and reused
 *   - hoursAgo = floor((Date.now() - anchorMs) / 1h) — increases naturally over time
 *   - identical across all devices — zero per-device randomness
 *   - NO local fallback — if server unavailable, kpi is null and UI shows loading
 */

import { useState, useEffect } from 'react';

export interface UnifiedAgencyKpi {
  missedCount: number;
  anchorMs: number;
  hoursAgo: number;
}

export async function getUnifiedAgencyKpi(agencySlug: string): Promise<UnifiedAgencyKpi | null> {
  if (!agencySlug) return null;

  const base = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/request-replay-stats`;
  const qs = new URLSearchParams({ agencySlug });

  const res = await fetch(`${base}?${qs.toString()}`, {
    headers: { apikey: import.meta.env.VITE_SUPABASE_ANON_KEY },
  });

  if (!res.ok) return null;

  const body = await res.json() as {
    canonicalAnchorMs?: number | null;
    missedRequestsLast30Days?: number | null;
  };

  const anchorMs = typeof body.canonicalAnchorMs === 'number' && body.canonicalAnchorMs > 0
    ? body.canonicalAnchorMs
    : null;

  const missedCount = typeof body.missedRequestsLast30Days === 'number' && body.missedRequestsLast30Days >= 0
    ? body.missedRequestsLast30Days
    : null;

  if (anchorMs === null || missedCount === null) return null;

  const hoursAgo = Math.max(1, Math.floor((Date.now() - anchorMs) / 3_600_000));

  return { missedCount, anchorMs, hoursAgo };
}

const STALE_THRESHOLD_MS = 30 * 24 * 3_600_000;
const MAX_DISPLAY_HOURS = 720;

export const DISPLAYED_MISSED_FLOOR = 7;

export function normalizeDisplayedMissedCount(
  count: number | null | undefined,
): number {
  if (count == null || count < DISPLAYED_MISSED_FLOOR) return DISPLAYED_MISSED_FLOOR;
  return count;
}

export function safeHoursAgo(anchorMs: number): number {
  const raw = Math.max(1, Math.floor((Date.now() - anchorMs) / 3_600_000));
  return Math.min(raw, MAX_DISPLAY_HOURS);
}

export function formatCanonicalTimeAgo(anchorMs: number): string {
  const ageMs = Date.now() - anchorMs;
  if (ageMs < 0) return '3 hours ago';

  const hours = Math.max(3, Math.floor(ageMs / 3_600_000));

  if (hours <= 72) {
    return hours === 1 ? '1 hour ago' : `${hours} hours ago`;
  }

  const days = Math.floor(hours / 24);

  if (days <= 30) {
    return days === 1 ? '1 day ago' : `${days} days ago`;
  }

  return '30+ days ago';
}

export function formatCanonicalTimeAgoShort(anchorMs: number): string {
  const ageMs = Date.now() - anchorMs;
  if (ageMs < 0) return '3h ago';

  const hours = Math.max(3, Math.floor(ageMs / 3_600_000));

  if (hours <= 72) return `${hours}h ago`;

  const days = Math.floor(hours / 24);

  if (days <= 30) return `${days}d ago`;

  return '30+ days ago';
}

export function isStaleAnchor(anchorMs: number): boolean {
  return (Date.now() - anchorMs) > STALE_THRESHOLD_MS;
}

export function useUnifiedAgencyKpi(agencySlug: string | null | undefined): {
  kpi: UnifiedAgencyKpi | null;
  ready: boolean;
} {
  const slug = agencySlug || '';
  const [kpi, setKpi] = useState<UnifiedAgencyKpi | null>(null);
  const [ready, setReady] = useState(false);

  useEffect(() => {
    if (!slug) {
      setKpi(null);
      setReady(true);
      return;
    }

    let cancelled = false;
    setKpi(null);
    setReady(false);

    getUnifiedAgencyKpi(slug)
      .then(data => {
        if (!cancelled) {
          setKpi(data);
          setReady(true);
        }
      })
      .catch(() => {
        if (!cancelled) {
          setKpi(null);
          setReady(true);
        }
      });

    return () => {
      cancelled = true;
    };
  }, [slug]);

  return { kpi, ready };
}
