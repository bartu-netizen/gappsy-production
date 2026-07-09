import { useState, useEffect, useRef } from 'react';
import { findState } from '../lib/usStates';
import {
  buildDeterministicFallback,
  deriveHoursAgo,
} from '../utils/deterministicFallback';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export type ResolveSource = 'token' | 'agencyId' | 'slug' | 'name' | 'deterministic';

export interface CanonicalOverrideEntry {
  service: string | null;
  budget: string | null;
  timeline: string | null;
  location: string | null;
  maskedIp: string | null;
  device: string | null;
  absoluteMs: number;
}

export interface CanonicalAgency {
  agencyId: string;
  agencySlug: string;
  agencyName: string;
  agencyDomain: string | null;
  stateSlug: string;
  stateName: string;
  stateAbbr: string;
  listingType: 'top25' | 'other' | null;
  rank: number | null;
  missedCount: number;
  /** Number of deterministic rows (base count without overrides).
   *  Pass as baseGeneratedCount to buildInitialEntries to prevent ledger shifting. */
  baseGeneratedCount: number;
  /** Display anchor = max(baseAnchorMs, newest override in 30d) */
  anchorMs: number;
  /** Stable generation anchor — ONLY for deterministic entry generation.
   *  Never bumped by admin overrides. May be null for deterministic agencies. */
  baseAnchorMs: number;
  listingManagementStatus: string | null;
  isDeterministic: boolean;
  source: ResolveSource;
  canonicalUrl: string;
  /** Admin-injected override entries to merge into the canonical ledger */
  overrideEntries: CanonicalOverrideEntry[];
}

export interface CanonicalAgencyResult {
  agency: CanonicalAgency;
  loading: boolean;
  failed: boolean;
}

interface ServerResponse {
  ok: boolean;
  reason?: string;
  resolve_source?: string;
  agency?: {
    id: string;
    name: string;
    slug: string;
    domain: string | null;
    listing_management_status?: string | null;
  };
  canonical_state_slug?: string;
  canonical_state_name?: string;
  canonical_state_abbr?: string;
  canonical_url?: string;
  listings?: Array<{
    state_slug: string;
    section: string;
    rank: number | null;
    other_position: number | null;
    page_path: string;
  }>;
  best_listing?: {
    state_slug: string;
    section: string;
    rank: number | null;
  } | null;
  kpi?: {
    missedCount: number | null;
    baseGeneratedCount?: number | null;
    anchorMs: number | null;
    baseAnchorMs?: number | null;
    overrideEntries?: Array<{
      service: string | null;
      budget: string | null;
      timeline: string | null;
      location: string | null;
      maskedIp: string | null;
      device: string | null;
      absoluteMs: number;
    }>;
  };
}

const memoryCache = new Map<string, { data: CanonicalAgency; ts: number }>();
const CACHE_TTL = 90_000;
const FETCH_TIMEOUT_MS = 10_000;
const RETRY_BACKOFFS_MS = [400, 900];

type FetchStatus = 'success' | 'permanent_error' | 'transient_error';
interface FetchResult {
  status: FetchStatus;
  data: ServerResponse | null;
}

const IS_DEV =
  typeof import.meta !== 'undefined' &&
  (import.meta as { env?: { DEV?: boolean } })?.env?.DEV === true;

function devLog(...args: unknown[]): void {
  if (IS_DEV) {
    // eslint-disable-next-line no-console
    console.log('[useCanonicalAgency]', ...args);
  }
}

function cacheKey(
  token?: string,
  agencyId?: string,
  slug?: string,
  stateHint?: string,
  agencyName?: string,
): string {
  const state = stateHint ? `|st:${stateHint}` : '';
  if (token) return `token:${token}${state}`;
  if (agencyId) return `aid:${agencyId}${state}`;
  if (slug) return `slug:${slug}${state}`;
  if (agencyName) return `name:${agencyName.toLowerCase()}${state}`;
  return `unknown${state}`;
}

function buildFromServer(
  res: ServerResponse,
  slug: string,
): CanonicalAgency | null {
  if (!res.ok || !res.agency) return null;

  const canonicalStateSlug = res.canonical_state_slug ?? '';
  const canonicalStateName = res.canonical_state_name ?? '';
  const canonicalStateAbbr = res.canonical_state_abbr ?? '';

  const stateInfo = canonicalStateSlug ? findState(canonicalStateSlug) : null;
  const finalStateName = canonicalStateName || stateInfo?.name || '';
  const finalStateAbbr = canonicalStateAbbr || stateInfo?.abbr || '';

  const bestListing = res.best_listing ?? null;

  const serverMissed = res.kpi?.missedCount;
  const serverAnchor = res.kpi?.anchorMs;

  const hasServerKpi =
    typeof serverMissed === 'number' &&
    serverMissed > 0 &&
    typeof serverAnchor === 'number' &&
    serverAnchor > 0;

  let missedCount: number;
  let baseGeneratedCount: number;
  let anchorMs: number;
  let isDeterministic: boolean;

  const resolveSource = (res.resolve_source || 'slug') as ResolveSource;

  let baseAnchorMs: number;

  if (hasServerKpi) {
    missedCount = serverMissed!;
    anchorMs = serverAnchor!;
    // Use server-provided baseAnchorMs when available; fall back to display anchor
    baseAnchorMs = (res.kpi?.baseAnchorMs && res.kpi.baseAnchorMs > 0)
      ? res.kpi.baseAnchorMs
      : serverAnchor!;
    // baseGeneratedCount: deterministic row count (base without overrides)
    const overrideCount = (res.kpi?.overrideEntries ?? []).length;
    baseGeneratedCount =
      (typeof res.kpi?.baseGeneratedCount === 'number' && res.kpi.baseGeneratedCount >= 0)
        ? res.kpi.baseGeneratedCount
        : Math.max(0, serverMissed! - overrideCount);
    isDeterministic = false;
  } else {
    const fallback = buildDeterministicFallback(slug);
    missedCount = fallback.missedCount;
    anchorMs = fallback.anchorMs;
    baseAnchorMs = fallback.anchorMs;
    baseGeneratedCount = fallback.missedCount;
    isDeterministic = true;
  }

  const overrideEntries: CanonicalOverrideEntry[] = (res.kpi?.overrideEntries ?? []).map((e) => ({
    service: e.service ?? null,
    budget: e.budget ?? null,
    timeline: e.timeline ?? null,
    location: e.location ?? null,
    maskedIp: e.maskedIp ?? null,
    device: e.device ?? null,
    absoluteMs: e.absoluteMs,
  }));

  return {
    agencyId: res.agency.id,
    agencySlug: res.agency.slug || slug,
    agencyName: res.agency.name,
    agencyDomain: res.agency.domain,
    stateSlug: canonicalStateSlug,
    stateName: finalStateName,
    stateAbbr: finalStateAbbr,
    listingType: (bestListing?.section as 'top25' | 'other') ?? null,
    rank: bestListing?.rank ?? null,
    missedCount,
    baseGeneratedCount,
    anchorMs,
    baseAnchorMs,
    listingManagementStatus:
      res.agency.listing_management_status ?? null,
    isDeterministic,
    source: isDeterministic ? 'deterministic' : resolveSource,
    canonicalUrl: res.canonical_url ?? '',
    overrideEntries,
  };
}

function buildFullDeterministic(slug: string): CanonicalAgency {
  const fb = buildDeterministicFallback(slug);
  return {
    agencyId: '',
    agencySlug: slug,
    agencyName: fb.agencyName,
    agencyDomain: null,
    stateSlug: '',
    stateName: '',
    stateAbbr: '',
    listingType: 'other',
    rank: null,
    missedCount: fb.missedCount,
    baseGeneratedCount: fb.missedCount,
    anchorMs: fb.anchorMs,
    baseAnchorMs: fb.anchorMs,
    listingManagementStatus: null,
    isDeterministic: true,
    source: 'deterministic',
    canonicalUrl: '',
    overrideEntries: [],
  };
}

// Build a fallback canonical agency directly from the URL-trusted params so
// funnel pages can render meaningfully when canonical resolution is delayed
// or temporarily unavailable. CSV/smartlink-generated URLs are trusted.
function buildUrlFallback(
  slug: string,
  agencyId?: string,
  stateHint?: string,
  agencyName?: string,
): CanonicalAgency {
  const base = buildFullDeterministic(slug || agencyName || 'unknown');
  const stateInfo = stateHint ? findState(stateHint) : null;
  return {
    ...base,
    agencyId: agencyId || base.agencyId,
    stateSlug: stateHint || base.stateSlug,
    stateName: stateInfo?.name || base.stateName,
    stateAbbr: stateInfo?.abbr || base.stateAbbr,
  };
}

async function fetchContextOnce(
  params: {
    agency_slug?: string;
    agency_name?: string;
    token?: string;
    agency_id?: string;
    state_slug?: string;
  },
): Promise<FetchResult> {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS);

  try {
    const res = await fetch(
      `${SUPABASE_URL}/functions/v1/resolve-agency-context`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
          apikey: SUPABASE_ANON_KEY,
        },
        body: JSON.stringify(params),
        signal: controller.signal,
      },
    );
    if (res.status >= 500 && res.status <= 599) {
      return { status: 'transient_error', data: null };
    }
    const body = (await res.json().catch(() => null)) as ServerResponse | null;
    if (!res.ok) {
      return { status: 'permanent_error', data: body };
    }
    if (!body || typeof body !== 'object') {
      return { status: 'transient_error', data: null };
    }
    return { status: 'success', data: body };
  } catch {
    return { status: 'transient_error', data: null };
  } finally {
    clearTimeout(timeout);
  }
}

async function fetchContext(
  params: {
    agency_slug?: string;
    agency_name?: string;
    token?: string;
    agency_id?: string;
    state_slug?: string;
  },
): Promise<FetchResult> {
  let last: FetchResult = { status: 'transient_error', data: null };
  for (let attempt = 0; attempt < RETRY_BACKOFFS_MS.length + 1; attempt++) {
    last = await fetchContextOnce(params);
    devLog('fetch attempt', {
      attempt: attempt + 1,
      status: last.status,
      hasToken: !!params.token,
      hasAgencyId: !!params.agency_id,
      hasSlug: !!params.agency_slug,
      stateSlug: params.state_slug,
    });
    if (last.status === 'success' || last.status === 'permanent_error') {
      return last;
    }
    if (attempt < RETRY_BACKOFFS_MS.length) {
      await new Promise((r) => setTimeout(r, RETRY_BACKOFFS_MS[attempt]));
    }
  }
  return last;
}

export function useCanonicalAgency(
  agencySlug: string | undefined,
  options?: {
    token?: string;
    agencyId?: string;
    stateHint?: string;
    agencyName?: string;
  },
): CanonicalAgencyResult {
  const slug = agencySlug || '';
  const token = options?.token;
  const agencyId = options?.agencyId;
  const stateHint = (options?.stateHint || '').trim();
  const agencyName = (options?.agencyName || '').trim();
  const hasToken = !!token;
  const hasAnyIdentifier = !!(slug || token || agencyId || agencyName);

  const ck = cacheKey(token, agencyId, slug, stateHint, agencyName);

  const [agency, setAgency] = useState<CanonicalAgency>(() => {
    if (!hasAnyIdentifier) return buildFullDeterministic('unknown');
    const cached = memoryCache.get(ck);
    if (cached && Date.now() - cached.ts < CACHE_TTL) return cached.data;
    if (hasToken) {
      return {
        ...buildFullDeterministic(slug || 'unknown'),
        stateSlug: '',
        stateName: '',
        stateAbbr: '',
      };
    }
    return buildFullDeterministic(slug || 'unknown');
  });

  const [loading, setLoading] = useState(() => {
    if (!hasAnyIdentifier) return false;
    const cached = memoryCache.get(ck);
    return !(cached && Date.now() - cached.ts < CACHE_TTL);
  });

  const [failed, setFailed] = useState(false);

  const fetchedKey = useRef('');

  useEffect(() => {
    if (!hasAnyIdentifier) {
      setAgency(buildFullDeterministic('unknown'));
      setLoading(false);
      setFailed(false);
      return;
    }

    const currentKey = `${slug}:${token || ''}:${agencyId || ''}:${agencyName}:${stateHint}`;

    if (fetchedKey.current === currentKey && !loading) return;

    const cached = memoryCache.get(ck);
    if (cached && Date.now() - cached.ts < CACHE_TTL) {
      setAgency(cached.data);
      setLoading(false);
      setFailed(false);
      fetchedKey.current = currentKey;
      return;
    }

    let cancelled = false;
    setLoading(true);
    setFailed(false);

    const params: Record<string, string> = {};
    if (token) params.token = token;
    if (agencyId) params.agency_id = agencyId;
    if (slug) params.agency_slug = slug;
    if (agencyName) params.agency_name = agencyName;
    if (stateHint) params.state_slug = stateHint;

    fetchContext(params)
      .then(async (result) => {
        if (cancelled) return;

        const res = result.data;

        if (result.status === 'success' && res && res.ok) {
          const built = buildFromServer(res, slug || agencyName || '');
          if (built) {
            memoryCache.set(ck, { data: built, ts: Date.now() });
            if (built.agencyId) {
              const aidKey = stateHint
                ? `aid:${built.agencyId}|st:${stateHint}`
                : `aid:${built.agencyId}`;
              memoryCache.set(aidKey, { data: built, ts: Date.now() });
            }
            if (built.agencySlug) {
              const slugKey = stateHint
                ? `slug:${built.agencySlug}|st:${stateHint}`
                : `slug:${built.agencySlug}`;
              memoryCache.set(slugKey, { data: built, ts: Date.now() });
            }
            setAgency(built);
            setLoading(false);
            setFailed(false);
            fetchedKey.current = currentKey;
            return;
          }
        }

        // Transient: never hard-fail. Use URL params as trusted fallback so the
        // funnel keeps rendering. Background resolution will refresh on next mount.
        if (result.status === 'transient_error') {
          devLog('transient_error after retries — using URL fallback', {
            hasToken,
            hasAgencyId: !!agencyId,
            hasSlug: !!slug,
            stateSlug: stateHint,
          });
          const fallback = buildUrlFallback(slug, agencyId, stateHint, agencyName);
          setAgency(fallback);
          setLoading(false);
          setFailed(false);
          fetchedKey.current = currentKey;
          return;
        }

        // Legacy: retry without token if token expired and we have other IDs.
        if (res && !res.ok && res.reason === 'token_expired' && (slug || agencyId || agencyName)) {
          const retryParams: Record<string, string> = {};
          if (agencyId) retryParams.agency_id = agencyId;
          if (slug) retryParams.agency_slug = slug;
          if (agencyName) retryParams.agency_name = agencyName;
          if (stateHint) retryParams.state_slug = stateHint;
          const retry = await fetchContext(retryParams);
          if (retry.status === 'success' && retry.data && retry.data.ok) {
            const builtRetry = buildFromServer(retry.data, slug || agencyName || '');
            if (builtRetry) {
              memoryCache.set(ck, { data: builtRetry, ts: Date.now() });
              setAgency(builtRetry);
              setLoading(false);
              setFailed(false);
              fetchedKey.current = currentKey;
              return;
            }
          }
          if (retry.status === 'transient_error') {
            const fallback = buildUrlFallback(slug, agencyId, stateHint, agencyName);
            setAgency(fallback);
            setLoading(false);
            setFailed(false);
            fetchedKey.current = currentKey;
            return;
          }
          // Permanent failure on the retry too: only hard-fail if no usable URL fallback.
          if (!slug && !agencyId && !stateHint) {
            setFailed(true);
            setLoading(false);
            fetchedKey.current = currentKey;
            return;
          }
          const fallbackPerm = buildUrlFallback(slug, agencyId, stateHint, agencyName);
          setAgency(fallbackPerm);
          setLoading(false);
          setFailed(false);
          fetchedKey.current = currentKey;
          return;
        }

        // Permanent error from server (token-only, no other usable URL identifier):
        // only hard-fail when there is genuinely no fallback context to render.
        if (hasToken && !slug && !agencyId && !stateHint) {
          setFailed(true);
          setLoading(false);
          fetchedKey.current = currentKey;
          return;
        }

        // Name-only lookups that fail are genuine unknown agencies.
        if (!slug && !agencyId && agencyName) {
          setFailed(true);
          setLoading(false);
          fetchedKey.current = currentKey;
          return;
        }

        // Permanent error but we have URL identifiers → keep funnel alive.
        if (hasToken || agencyId || stateHint) {
          const fallback = buildUrlFallback(slug, agencyId, stateHint, agencyName);
          setAgency(fallback);
          setLoading(false);
          setFailed(false);
          fetchedKey.current = currentKey;
          return;
        }

        const deterministic = buildFullDeterministic(slug);
        setAgency(deterministic);
        setLoading(false);
        setFailed(false);
        fetchedKey.current = currentKey;
      })
      .catch(() => {
        if (cancelled) return;
        // Unexpected throw (should not happen). Treat as transient and fall back.
        const fallback = buildUrlFallback(slug, agencyId, stateHint, agencyName);
        setAgency(fallback);
        setLoading(false);
        setFailed(false);
        fetchedKey.current = currentKey;
      });

    return () => {
      cancelled = true;
    };
  }, [slug, token, agencyId, agencyName, stateHint]);

  return { agency, loading, failed };
}

export function getCanonicalHoursAgo(anchorMs: number): number {
  return deriveHoursAgo(anchorMs);
}

export function getCachedCanonicalAgency(
  slug: string,
): CanonicalAgency | null {
  const cached = memoryCache.get(`slug:${slug}`);
  if (cached && Date.now() - cached.ts < CACHE_TTL) return cached.data;
  return null;
}
