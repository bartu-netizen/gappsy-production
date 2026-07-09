/**
 * Smart Routing Context Utilities
 *
 * Helpers for preserving smart routing parameters across internal funnel navigation.
 * Uses consistent param format: aid, lid, ts, sig, cid, cn, sn, es
 */

export interface SmartRoutingParams {
  aid?: string | null;           // agency_id
  lid?: string | null;           // lead_key
  ts?: string | null;            // timestamp
  sig?: string | null;           // signature
  cid?: string | null;           // campaign_id
  cn?: string | null;            // campaign_name
  sn?: string | null;            // sequence_name
  es?: string | null;            // email_step
}

/**
 * Extract smart routing params from URLSearchParams
 */
export function getSmartRoutingContext(searchParams: URLSearchParams): SmartRoutingParams {
  return {
    aid: searchParams.get('aid'),
    lid: searchParams.get('lid'),
    ts: searchParams.get('ts'),
    sig: searchParams.get('sig'),
    cid: searchParams.get('cid'),
    cn: searchParams.get('cn'),
    sn: searchParams.get('sn'),
    es: searchParams.get('es'),
  };
}

/**
 * Append smart routing params to a URL, preserving existing query params
 */
export function appendSmartRoutingParams(
  url: string,
  params: SmartRoutingParams
): string {
  // Handle both absolute and relative URLs
  const baseUrl = url.startsWith('http') ? url : `https://dummy.com${url.startsWith('/') ? url : `/${url}`}`;
  const urlObj = new URL(baseUrl);

  // Append smart routing params if they exist
  if (params.aid) urlObj.searchParams.set('aid', params.aid);
  if (params.lid) urlObj.searchParams.set('lid', params.lid);
  if (params.ts) urlObj.searchParams.set('ts', params.ts);
  if (params.sig) urlObj.searchParams.set('sig', params.sig);
  if (params.cid) urlObj.searchParams.set('cid', params.cid);
  if (params.cn) urlObj.searchParams.set('cn', params.cn);
  if (params.sn) urlObj.searchParams.set('sn', params.sn);
  if (params.es) urlObj.searchParams.set('es', params.es);

  // Return path + search for relative URLs, full URL for absolute
  if (url.startsWith('http')) {
    return urlObj.href;
  }
  return urlObj.pathname + urlObj.search;
}

/**
 * Check if current visit has smart routing context
 */
export function hasSmartRoutingContext(searchParams: URLSearchParams): boolean {
  return !!(searchParams.get('aid') && searchParams.get('lid'));
}

/**
 * Build query string from smart routing params
 */
export function buildSmartRoutingQuery(params: SmartRoutingParams): string {
  const queryParams = new URLSearchParams();

  if (params.aid) queryParams.set('aid', params.aid);
  if (params.lid) queryParams.set('lid', params.lid);
  if (params.ts) queryParams.set('ts', params.ts);
  if (params.sig) queryParams.set('sig', params.sig);
  if (params.cid) queryParams.set('cid', params.cid);
  if (params.cn) queryParams.set('cn', params.cn);
  if (params.sn) queryParams.set('sn', params.sn);
  if (params.es) queryParams.set('es', params.es);

  const query = queryParams.toString();
  return query ? `?${query}` : '';
}
