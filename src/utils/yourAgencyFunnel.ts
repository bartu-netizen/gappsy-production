import { reliablePost } from './trackingTransport';
import { getSignals } from './humanSignalCollector';

const FSID_KEY = 'gappsy_fsid';
const FSID_URL_PARAM = 'fsid';
const ENTRY_PATH_KEY = 'gappsy_funnel_entry_path';

function generateUUID(): string {
  if (typeof crypto !== 'undefined' && crypto.randomUUID) {
    return crypto.randomUUID();
  }
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
    const r = (Math.random() * 16) | 0;
    return (c === 'x' ? r : (r & 0x3) | 0x8).toString(16);
  });
}

export function getFsid(createIfMissing = true): string | null {
  try {
    const urlParam = new URLSearchParams(window.location.search).get(FSID_URL_PARAM);
    if (urlParam) {
      localStorage.setItem(FSID_KEY, urlParam);
      return urlParam;
    }
    const stored = localStorage.getItem(FSID_KEY);
    if (stored) return stored;
    if (!createIfMissing) return null;
    const fresh = generateUUID();
    localStorage.setItem(FSID_KEY, fresh);
    return fresh;
  } catch {
    return generateUUID();
  }
}

export function createFsid(): string {
  try {
    const fresh = generateUUID();
    localStorage.setItem(FSID_KEY, fresh);
    return fresh;
  } catch {
    return generateUUID();
  }
}

export function appendFsidToUrl(url: string): string {
  const fsid = getFsid(false);
  if (!fsid) return url;
  try {
    const sep = url.includes('?') ? '&' : '?';
    if (url.includes(`${FSID_URL_PARAM}=`)) return url;
    return `${url}${sep}${FSID_URL_PARAM}=${encodeURIComponent(fsid)}`;
  } catch {
    return url;
  }
}

export type EntryPath = 'search' | 'direct_profile' | 'manage_listing_to_your_agency';

export function setEntryPath(path: EntryPath): void {
  try {
    localStorage.setItem(ENTRY_PATH_KEY, path);
  } catch {}
}

export function getEntryPath(): EntryPath | null {
  try {
    const v = localStorage.getItem(ENTRY_PATH_KEY);
    if (v === 'search' || v === 'direct_profile' || v === 'manage_listing_to_your_agency') return v as EntryPath;
    return null;
  } catch {
    return null;
  }
}

export interface FunnelEventParams {
  event_name: string;
  step_number: number;
  agency_id?: string;
  agency_slug?: string;
  state_slug?: string;
  is_demo?: boolean;
  metadata?: Record<string, unknown>;
  lead_email?: string;
  lead_name?: string;
  agency_name?: string;
  checkout_session_id?: string;
  fsid_override?: string;
  entry_path?: EntryPath;
  purchased_product?: string;
  purchased_amount?: number;
  upsell_taken?: boolean;
  open_instance_id?: string;
}

export function logFunnelEvent(params: FunnelEventParams): void {
  const fsid = params.fsid_override || getFsid(true);
  if (!fsid) return;

  const resolvedEntryPath = params.entry_path || getEntryPath() || undefined;

  const payload: Record<string, unknown> = {
    fsid,
    funnel_name: 'your_agency',
    event_name: params.event_name,
    step_number: params.step_number,
    page_path: typeof window !== 'undefined' ? window.location.pathname : undefined,
    agency_id: params.agency_id,
    agency_slug: params.agency_slug,
    state_slug: params.state_slug,
    is_demo: params.is_demo ?? false,
    metadata: params.metadata,
    lead_email: params.lead_email,
    lead_name: params.lead_name,
    agency_name: params.agency_name,
    checkout_session_id: params.checkout_session_id,
    entry_path: resolvedEntryPath,
    purchased_product: params.purchased_product,
    purchased_amount: params.purchased_amount,
    upsell_taken: params.upsell_taken,
    open_instance_id: params.open_instance_id,
  };

  reliablePost('log-funnel-event', payload, params.event_name);
}

export function logEngagement(params: {
  agency_id?: string;
  agency_slug?: string;
  time_on_page_seconds: number;
  scroll_depth_percent: number;
}): void {
  const fsid = getFsid(false);
  if (!fsid) return;

  // Enrich with human signal timing deltas for engagement quality scoring
  let timingEnrichment: Record<string, unknown> = {};
  try {
    const signals = getSignals();
    timingEnrichment = {
      active_time_ms: signals.active_visible_ms,
      interaction_count: signals.manual_click_count + signals.tap_count,
      thinking_time_to_first_input_ms: signals.thinking_time_to_first_input_ms,
      thinking_time_first_input_to_cta_ms: signals.thinking_time_first_input_to_cta_ms,
    };
  } catch {
    // never throw from tracking
  }

  const payload: Record<string, unknown> = {
    fsid,
    agency_id: params.agency_id,
    agency_slug: params.agency_slug,
    page_path: typeof window !== 'undefined' ? window.location.pathname : undefined,
    time_on_page_seconds: params.time_on_page_seconds,
    scroll_depth_percent: params.scroll_depth_percent,
    ...timingEnrichment,
  };

  reliablePost('agency-funnel-engagement', payload, 'engagement');
}

export const FUNNEL_EVENTS = {
  LANDING_VIEWED:              { event_name: 'your_agency_landing_page_viewed',                      step_number: 10  },
  SEARCH_SUBMITTED:            { event_name: 'your_agency_search_submitted',                          step_number: 20  },
  PROFILE_CLICKED:             { event_name: 'your_agency_profile_clicked',                           step_number: 25  },
  PROFILE_PAGE_VIEWED:         { event_name: 'your_agency_profile_page_viewed',                       step_number: 30  },
  OWNER_VIEW_REQUESTS_CLICKED: { event_name: 'your_agency_view_requests_clicked',                     step_number: 32  },
  OWNER_LEDGER_VIEW_OPENED:    { event_name: 'your_agency_ledger_page_viewed',                        step_number: 34  },
  OWNER_LEDGER_ENGAGED:        { event_name: 'your_agency_requests_visible',                          step_number: 36  },
  OWNER_LEDGER_ACTIVATION_CLICKED: { event_name: 'your_agency_activate_clicked',                      step_number: 38  },
  OWNER_PREVIEW_ENTRY_CLICKED: { event_name: 'owner_preview_entry_clicked',                            step_number: 40  },
  OWNER_PREVIEW_INTRO_VIEWED:  { event_name: 'owner_preview_intro_viewed',                             step_number: 45  },
  OWNER_PREVIEW_STARTED:       { event_name: 'owner_preview_started',                                  step_number: 48  },
  STATE_PAGE_VIEWED:           { event_name: 'owner_preview_state_page_viewed',                       step_number: 50  },
  SCROLL_TO_LISTING_CLICKED:   { event_name: 'owner_preview_scroll_to_listing_cta_clicked',           step_number: 60  },
  STEP2_STARTED:               { event_name: 'owner_preview_check_availability_opened',               step_number: 70  },
  DEMO_MODAL_OPENED:           { event_name: 'owner_preview_check_availability_modal_opened',         step_number: 80  },
  DEMO_SUBMITTED:              { event_name: 'owner_preview_check_availability_submitted',            step_number: 90  },
  DEMO_RESULT_VIEWED:          { event_name: 'owner_preview_check_availability_result_page_viewed',   step_number: 100 },
  MISSED_CLIENTS_CTA_CLICKED:  { event_name: 'owner_preview_missed_clients_cta_clicked',              step_number: 110 },
  MISSED_CLIENTS_PAGE_VIEWED:  { event_name: 'owner_preview_missed_clients_page_viewed',              step_number: 120 },
  ACTIVATE_CLICKED:            { event_name: 'owner_preview_activate_listing_cta_clicked',            step_number: 130 },
  ACTIVATION_OFFER_VIEWED:     { event_name: 'listing_activation_offer_page_viewed',                  step_number: 140 },
  ACTIVATION_PAGE_VIEWED:      { event_name: 'activation_page_viewed',                                step_number: 141 },
  ACTIVATION_OPTION_CLICKED:   { event_name: 'activation_option_clicked',                             step_number: 142 },
  ACTIVATION_STANDARD_PHASE1_CLICKED: { event_name: 'activation_standard_phase1_clicked',              step_number: 142 },
  ACTIVATION_TOP25_OPTIONS_VIEWED: { event_name: 'activation_top25_options_viewed',                    step_number: 143 },
  ACTIVATION_FINAL_OPTION_CLICKED: { event_name: 'activation_final_option_clicked',                    step_number: 144 },
  STANDARD_UPGRADE_OFFER_VIEWED: { event_name: 'standard_upgrade_offer_viewed',                        step_number: 144 },
  STANDARD_UPGRADE_OFFER_STANDARD_CONTINUED: { event_name: 'standard_upgrade_offer_standard_continued', step_number: 145 },
  STANDARD_UPGRADE_OFFER_UPGRADE_CLICKED: { event_name: 'standard_upgrade_offer_upgrade_clicked',      step_number: 146 },
  TOP25_CONFIRM_VIEWED:        { event_name: 'top25_confirm_viewed',                                  step_number: 147 },
  TOP25_CONFIRM_ADDON_TOGGLED: { event_name: 'top25_confirm_addon_toggled',                           step_number: 148 },
  TOP25_CONFIRM_CONTINUE_CLICKED: { event_name: 'top25_confirm_continue_clicked',                     step_number: 149 },
  STRIPE_CHECKOUT_OPENED:      { event_name: 'checkout_page_viewed',                                  step_number: 150 },
  STRIPE_CHECKOUT_COMPLETED:   { event_name: 'checkout_completed',                                    step_number: 160 },
} as const;

export const STEP_LABELS: Record<number, string> = {
  10:  'Your-agency profile — Viewed landing page',
  20:  'Your-agency profile — Submitted search',
  25:  'Your-agency profile — Clicked profile card',
  30:  'Your-agency profile — Viewed agency profile',
  32:  'Your-agency profile — Clicked "See recent client requests"',
  34:  'Your-agency ledger — Viewed missed client requests',
  36:  'Your-agency ledger — Requests visible',
  38:  'Your-agency ledger — Clicked "Start receiving these clients"',
  40:  'Your-agency ledger — Clicked owner preview entry CTA',
  45:  'Owner preview — Viewed full-screen intro',
  48:  'Owner preview — Clicked "Show me my listing"',
  50:  'Owner preview — Viewed state page',
  60:  'Owner preview — Clicked "Scroll to my listing"',
  70:  'Owner preview — Opened availability form',
  80:  'Owner preview — Opened availability modal',
  90:  'Owner preview — Submitted availability form',
  100: 'Owner preview — Viewed availability result',
  110: 'Owner preview — Clicked "See missed clients"',
  120: 'Owner preview — Viewed missed clients page',
  130: 'Owner preview — Clicked "activate your listing now"',
  140: 'Activation offer — Viewed offer page',
  141: 'Activation upgrade — Viewed page',
  142: 'Activation upgrade — Standard clicked / Top-25 revealed',
  143: 'Activation upgrade — Top-25 options viewed',
  144: 'Activation upgrade — Final option selected',
  145: 'Standard upgrade offer — Continued with Standard',
  146: 'Standard upgrade offer — Clicked Top-25 upgrade',
  147: 'Top-25 confirm — Viewed page',
  148: 'Top-25 confirm — Toggled add-on',
  149: 'Top-25 confirm — Clicked continue',
  150: 'Checkout — Opened Stripe checkout',
  160: 'Sale — Listing activated',
};

// ── Unified tracking helper ──────────────────────────────────────
// Adds deduplication (page-view once per fsid+page+agency+state; clicks
// protected by a short 1000–1500ms lock that never blocks different
// dedupe keys). Additive layer on top of logFunnelEvent.

const PAGEVIEW_STORAGE_KEY = 'gappsy_funnel_pv_seen_v1';
const pageViewSet = new Set<string>();
const clickLock = new Map<string, number>();

function loadPageViewCache(): void {
  if (pageViewSet.size > 0) return;
  try {
    const raw = sessionStorage.getItem(PAGEVIEW_STORAGE_KEY);
    if (!raw) return;
    const parsed = JSON.parse(raw);
    if (Array.isArray(parsed)) parsed.forEach((k) => pageViewSet.add(String(k)));
  } catch {}
}

function persistPageViewCache(): void {
  try {
    sessionStorage.setItem(PAGEVIEW_STORAGE_KEY, JSON.stringify(Array.from(pageViewSet)));
  } catch {}
}

export interface AgencyFunnelEventOptions {
  kind?: 'page_view' | 'click' | 'toggle';
  dedupeKey?: string;
  lockMs?: number;
  agency_id?: string;
  agency_slug?: string;
  agency_name?: string;
  state_slug?: string;
  state_name?: string;
  stepNumber?: number;
  fsid_override?: string;
}

export function trackAgencyFunnelEvent(
  eventName: string,
  metadata: Record<string, unknown> = {},
  options: AgencyFunnelEventOptions = {}
): void {
  try {
    const kind = options.kind || 'click';
    const fsid = options.fsid_override || getFsid(true);
    if (!fsid) return;

    const pathname = typeof window !== 'undefined' ? window.location.pathname : '';
    const search = typeof window !== 'undefined' ? window.location.search : '';

    if (kind === 'page_view') {
      loadPageViewCache();
      const key = `${fsid}|${eventName}|${pathname}|${options.agency_id || ''}|${options.state_slug || ''}`;
      if (pageViewSet.has(key)) return;
      pageViewSet.add(key);
      persistPageViewCache();
    } else {
      const dedupeKey = options.dedupeKey || eventName;
      const lockMs = options.lockMs ?? 1200;
      const lockKey = `${eventName}|${dedupeKey}`;
      const now = Date.now();
      const last = clickLock.get(lockKey) || 0;
      if (now - last < lockMs) return;
      clickLock.set(lockKey, now);
    }

    const enriched: Record<string, unknown> = {
      ...metadata,
      pathname,
      search,
      source_page: typeof document !== 'undefined' ? document.referrer || null : null,
      timestamp: new Date().toISOString(),
    };

    const stepNumber = options.stepNumber ?? 0;

    logFunnelEvent({
      event_name: eventName,
      step_number: stepNumber,
      agency_id: options.agency_id,
      agency_slug: options.agency_slug,
      agency_name: options.agency_name,
      state_slug: options.state_slug,
      metadata: enriched,
      fsid_override: options.fsid_override,
    });
  } catch {
    // never throw from tracking
  }
}

