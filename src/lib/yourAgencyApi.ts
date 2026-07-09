const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export const INDEX_AGENCY_PAGES = false;

export interface AgencyListing {
  state_slug: string;
  section: 'top25' | 'other';
  rank: number | null;
  other_position: number | null;
  page_path: string;
}

export interface AgencyResult {
  agency_id?: string;
  agency_name: string;
  agency_slug: string;
  agency_domain: string | null;
  logo_url?: string | null;
  match_type?: string;
  score?: number;
  states?: Array<{
    state_slug: string;
    section: string;
    rank: number | null;
    page_path: string;
  }>;
  listings?: Array<{
    state_slug: string;
    section: string;
    rank: number | null;
    page_path: string;
  }>;
}

export interface ResolvedAgency {
  id: string;
  name: string;
  slug: string;
  domain: string | null;
  listing_management_status?: string | null;
}

export interface GetAgencyListingsResult {
  agency: ResolvedAgency;
  listings: AgencyListing[];
  best_listing: AgencyListing | null;
}

export interface PrefetchedAgencyData {
  agency_id?: string;
  agency_name: string;
  agency_slug: string;
  agency_domain: string | null;
  listings: Array<{
    state_slug: string;
    section: string;
    rank: number | null;
    page_path: string;
  }>;
  prefetchedAt: number;
  searchQuery?: string;
}

export interface FetchDebugInfo {
  slug: string;
  hadNavigationState: boolean;
  fetchStartTime: number;
  fetchEndTime?: number;
  timeoutOccurred: boolean;
  retryAttempts: number;
  fallbackToAgencyId: boolean;
  finalSource: 'slug' | 'agency_id' | 'prefetched_state' | 'cache' | 'failed';
  totalDuration?: number;
  error?: string;
}

function headers() {
  return {
    'Content-Type': 'application/json',
    Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
  };
}

const searchCache = new Map<string, { data: AgencyResult[]; ts: number }>();
const listingsCache = new Map<string, { data: GetAgencyListingsResult; ts: number }>();
const prefetchCache = new Map<string, { data: GetAgencyListingsResult; ts: number; promise?: Promise<GetAgencyListingsResult | null> }>();

const CACHE_TTL = 60_000;
const PREFETCH_CACHE_TTL = 30_000;
const FETCH_TIMEOUT_MS = 7000;
const RETRY_DELAY_MS = 500;
const MAX_RETRIES = 2;

async function fetchWithTimeout(
  url: string,
  options: RequestInit,
  timeoutMs: number
): Promise<Response> {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeoutMs);

  try {
    const response = await fetch(url, {
      ...options,
      signal: controller.signal,
    });
    return response;
  } finally {
    clearTimeout(timeoutId);
  }
}

async function fetchAgencyListingsOnce(params: {
  agency_slug?: string;
  token?: string;
  agency_id?: string;
}): Promise<GetAgencyListingsResult | null> {
  const res = await fetchWithTimeout(
    `${SUPABASE_URL}/functions/v1/get-agency-listings`,
    {
      method: 'POST',
      headers: headers(),
      body: JSON.stringify(params),
    },
    FETCH_TIMEOUT_MS
  );
  const data = await res.json();
  if (!data.ok) return null;
  return data;
}

export function normalizeAgencyResult(r: AgencyResult): AgencyResult {
  const listings = r.listings ?? r.states ?? [];
  return { ...r, listings, states: listings };
}

export async function searchAgencies(q: string, limit = 12): Promise<AgencyResult[]> {
  if (!q.trim()) return [];
  const key = `${q.toLowerCase().trim()}:${limit}`;
  const cached = searchCache.get(key);
  if (cached && Date.now() - cached.ts < CACHE_TTL) return cached.data;

  const res = await fetch(`${SUPABASE_URL}/functions/v1/search-agencies`, {
    method: 'POST',
    headers: headers(),
    body: JSON.stringify({ q, limit }),
  });
  const data = await res.json();
  const raw: AgencyResult[] = data.ok ? (data.results ?? []) : [];
  const results = raw.map(normalizeAgencyResult);
  searchCache.set(key, { data: results, ts: Date.now() });
  return results;
}

export async function getAgencyListings(
  params: {
    agency_slug?: string;
    token?: string;
    agency_id?: string;
  },
  options?: {
    skipCache?: boolean;
    debugCallback?: (info: FetchDebugInfo) => void;
  }
): Promise<GetAgencyListingsResult | null> {
  const key = JSON.stringify(params);
  const debugInfo: FetchDebugInfo = {
    slug: params.agency_slug || params.agency_id || 'unknown',
    hadNavigationState: false,
    fetchStartTime: performance.now(),
    timeoutOccurred: false,
    retryAttempts: 0,
    fallbackToAgencyId: false,
    finalSource: 'failed',
  };

  if (!options?.skipCache) {
    const cached = listingsCache.get(key);
    if (cached && Date.now() - cached.ts < CACHE_TTL) {
      debugInfo.finalSource = 'cache';
      debugInfo.fetchEndTime = performance.now();
      debugInfo.totalDuration = debugInfo.fetchEndTime - debugInfo.fetchStartTime;
      options?.debugCallback?.(debugInfo);
      console.log(`[getAgencyListings] cache hit key=${key} duration=${debugInfo.totalDuration.toFixed(0)}ms`);
      return cached.data;
    }

    const prefetched = prefetchCache.get(params.agency_slug || '');
    if (prefetched && Date.now() - prefetched.ts < PREFETCH_CACHE_TTL) {
      debugInfo.finalSource = 'cache';
      debugInfo.fetchEndTime = performance.now();
      debugInfo.totalDuration = debugInfo.fetchEndTime - debugInfo.fetchStartTime;
      options?.debugCallback?.(debugInfo);
      console.log(`[getAgencyListings] prefetch cache hit slug=${params.agency_slug} duration=${debugInfo.totalDuration.toFixed(0)}ms`);
      listingsCache.set(key, { data: prefetched.data, ts: Date.now() });
      return prefetched.data;
    }
  }

  console.log(`[getAgencyListings] fetch start params=${JSON.stringify(params)}`);

  for (let attempt = 0; attempt <= MAX_RETRIES; attempt++) {
    debugInfo.retryAttempts = attempt;

    try {
      const result = await fetchAgencyListingsOnce(params);

      if (result) {
        debugInfo.finalSource = params.agency_slug ? 'slug' : 'agency_id';
        debugInfo.fetchEndTime = performance.now();
        debugInfo.totalDuration = debugInfo.fetchEndTime - debugInfo.fetchStartTime;
        options?.debugCallback?.(debugInfo);
        console.log(`[getAgencyListings] success attempt=${attempt} source=${debugInfo.finalSource} duration=${debugInfo.totalDuration.toFixed(0)}ms`);
        listingsCache.set(key, { data: result, ts: Date.now() });
        return result;
      }

      console.log(`[getAgencyListings] attempt=${attempt} returned null`);
      break;

    } catch (err: unknown) {
      const isAbort = err instanceof Error && err.name === 'AbortError';
      if (isAbort) {
        debugInfo.timeoutOccurred = true;
        console.log(`[getAgencyListings] timeout attempt=${attempt} after ${FETCH_TIMEOUT_MS}ms`);
      } else {
        console.error(`[getAgencyListings] error attempt=${attempt}:`, err);
        debugInfo.error = err instanceof Error ? err.message : String(err);
      }

      if (attempt < MAX_RETRIES) {
        console.log(`[getAgencyListings] retrying in ${RETRY_DELAY_MS}ms...`);
        await new Promise((r) => setTimeout(r, RETRY_DELAY_MS * (attempt + 1)));
      }
    }
  }

  debugInfo.fetchEndTime = performance.now();
  debugInfo.totalDuration = debugInfo.fetchEndTime - debugInfo.fetchStartTime;
  options?.debugCallback?.(debugInfo);
  console.log(`[getAgencyListings] all attempts failed duration=${debugInfo.totalDuration.toFixed(0)}ms`);
  return null;
}

export async function getAgencyListingsWithFallback(
  primaryParams: { agency_slug?: string; token?: string },
  fallbackAgencyId?: string,
  debugCallback?: (info: FetchDebugInfo) => void
): Promise<GetAgencyListingsResult | null> {
  const debugInfo: FetchDebugInfo = {
    slug: primaryParams.agency_slug || 'unknown',
    hadNavigationState: !!fallbackAgencyId,
    fetchStartTime: performance.now(),
    timeoutOccurred: false,
    retryAttempts: 0,
    fallbackToAgencyId: false,
    finalSource: 'failed',
  };

  console.log(`[getAgencyListingsWithFallback] start slug=${primaryParams.agency_slug} fallbackId=${fallbackAgencyId}`);

  const result = await getAgencyListings(primaryParams, {
    debugCallback: (info) => {
      debugInfo.retryAttempts = info.retryAttempts;
      debugInfo.timeoutOccurred = info.timeoutOccurred;
      debugInfo.error = info.error;
    },
  });

  if (result) {
    debugInfo.finalSource = 'slug';
    debugInfo.fetchEndTime = performance.now();
    debugInfo.totalDuration = debugInfo.fetchEndTime - debugInfo.fetchStartTime;
    debugCallback?.(debugInfo);
    return result;
  }

  if (fallbackAgencyId) {
    console.log(`[getAgencyListingsWithFallback] slug failed, trying agency_id=${fallbackAgencyId}`);
    debugInfo.fallbackToAgencyId = true;

    const fallbackResult = await getAgencyListings({ agency_id: fallbackAgencyId });

    if (fallbackResult) {
      debugInfo.finalSource = 'agency_id';
      debugInfo.fetchEndTime = performance.now();
      debugInfo.totalDuration = debugInfo.fetchEndTime - debugInfo.fetchStartTime;
      debugCallback?.(debugInfo);
      console.log(`[getAgencyListingsWithFallback] agency_id fallback success`);
      return fallbackResult;
    }
  }

  debugInfo.fetchEndTime = performance.now();
  debugInfo.totalDuration = debugInfo.fetchEndTime - debugInfo.fetchStartTime;
  debugCallback?.(debugInfo);
  console.log(`[getAgencyListingsWithFallback] all attempts failed`);
  return null;
}

export function prefetchAgencyListings(agencySlug: string): void {
  if (!agencySlug) return;

  const existing = prefetchCache.get(agencySlug);
  if (existing && Date.now() - existing.ts < PREFETCH_CACHE_TTL) {
    return;
  }

  console.log(`[prefetchAgencyListings] starting prefetch for slug=${agencySlug}`);

  const promise = getAgencyListings({ agency_slug: agencySlug }, { skipCache: true })
    .then((result) => {
      if (result) {
        prefetchCache.set(agencySlug, { data: result, ts: Date.now() });
        console.log(`[prefetchAgencyListings] cached result for slug=${agencySlug}`);
      }
      return result;
    })
    .catch((err) => {
      console.warn(`[prefetchAgencyListings] failed for slug=${agencySlug}:`, err);
      return null;
    });

  prefetchCache.set(agencySlug, { data: null as unknown as GetAgencyListingsResult, ts: Date.now(), promise });
}

export function getPrefetchedResult(agencySlug: string): GetAgencyListingsResult | null {
  const cached = prefetchCache.get(agencySlug);
  if (cached && cached.data && Date.now() - cached.ts < PREFETCH_CACHE_TTL) {
    return cached.data;
  }
  return null;
}

export async function waitForPrefetch(agencySlug: string, maxWaitMs = 2000): Promise<GetAgencyListingsResult | null> {
  const cached = prefetchCache.get(agencySlug);
  if (!cached) return null;

  if (cached.data && Date.now() - cached.ts < PREFETCH_CACHE_TTL) {
    return cached.data;
  }

  if (cached.promise) {
    const timeout = new Promise<null>((resolve) => setTimeout(() => resolve(null), maxWaitMs));
    const result = await Promise.race([cached.promise, timeout]);
    return result;
  }

  return null;
}

export function convertPrefetchedToResult(prefetched: PrefetchedAgencyData): GetAgencyListingsResult {
  return {
    agency: {
      id: prefetched.agency_id || '',
      name: prefetched.agency_name,
      slug: prefetched.agency_slug,
      domain: prefetched.agency_domain,
    },
    listings: prefetched.listings.map((l) => ({
      state_slug: l.state_slug,
      section: l.section as 'top25' | 'other',
      rank: l.rank,
      other_position: null,
      page_path: l.page_path,
    })),
    best_listing: prefetched.listings[0]
      ? {
          state_slug: prefetched.listings[0].state_slug,
          section: prefetched.listings[0].section as 'top25' | 'other',
          rank: prefetched.listings[0].rank,
          other_position: null,
          page_path: prefetched.listings[0].page_path,
        }
      : null,
  };
}

export function trackYourAgencyEvent(payload: {
  event_name: string;
  agency_id?: string;
  agency_slug?: string;
  state_slug?: string;
  section?: string;
  token?: string;
  meta?: Record<string, unknown>;
}): void {
  fetch(`${SUPABASE_URL}/functions/v1/track-your-agency-event`, {
    method: 'POST',
    headers: headers(),
    body: JSON.stringify(payload),
  }).catch(() => {});
}

export { formatStateName as slugToStateName } from '../utils/formatLocation';

export function buildStatePageUrl(
  pagePath: string,
  agencyId: string,
  section: string
): string {
  const base = pagePath.endsWith('/') ? pagePath : `${pagePath}/`;
  return `${base}?agency=${encodeURIComponent(agencyId)}&section=${encodeURIComponent(section)}&from=your-agency`;
}
