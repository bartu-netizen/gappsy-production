import { reliablePost } from './trackingTransport';
import { getFsid, getEntryPath } from './yourAgencyFunnel';

const DEDUP_WINDOW_MS = 10 * 60 * 1000;

export type ActivationListingType =
  | 'standard'
  | 'activation'
  | 'other_listing'
  | 'top25'
  | 'top25_claim_bundle'
  | 'top25_standard_only_release'
  | 'spotlight';

export interface ActivationPageViewParams {
  agency_id?: string | null;
  agency_slug?: string | null;
  agency_name?: string | null;
  state_slug?: string | null;
  listing_type: ActivationListingType | string;
  rank?: number | null;
  prev_step?: string | null;
  checkout_opened?: boolean;
}

const inFlightKeys = new Set<string>();

function buildDedupKey(params: ActivationPageViewParams): string {
  const identity = params.agency_id || params.agency_slug || 'unknown';
  const state = params.state_slug || '_';
  const type = params.listing_type || '_';
  return `activation_viewed:${identity}:${state}:${type}`;
}

export function trackActivationPageView(params: ActivationPageViewParams): void {
  if (typeof window === 'undefined') return;

  const fsid = getFsid(true);
  if (!fsid) return;

  const dedupKey = buildDedupKey(params);

  // In-flight guard: prevent duplicate network calls while request is pending
  if (inFlightKeys.has(dedupKey)) return;

  // sessionStorage dedupe with 10-minute window
  const storageKey = `gappsy_apv_${dedupKey}`;
  try {
    const prev = sessionStorage.getItem(storageKey);
    if (prev) {
      const prevTs = Number(prev);
      if (Number.isFinite(prevTs) && Date.now() - prevTs < DEDUP_WINDOW_MS) {
        return;
      }
    }
    sessionStorage.setItem(storageKey, String(Date.now()));
  } catch {
    // sessionStorage unavailable — proceed; server-side dedup catches it
  }

  const payload: Record<string, unknown> = {
    fsid,
    agency_id: params.agency_id ?? null,
    agency_slug: params.agency_slug ?? null,
    agency_name: params.agency_name ?? null,
    state_slug: params.state_slug ?? null,
    listing_type: params.listing_type,
    rank: params.rank ?? null,
    page_url: window.location.href,
    prev_step: params.prev_step ?? null,
    entry_path: getEntryPath() ?? null,
    checkout_opened: params.checkout_opened ?? false,
  };

  inFlightKeys.add(dedupKey);
  reliablePost('activation-page-viewed', payload, 'activation_page_viewed');
  setTimeout(() => { inFlightKeys.delete(dedupKey); }, 5000);
}
