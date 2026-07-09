export type FunnelSource =
  | 'your_agency'
  | 'request_replay'
  | 'manage_listing';

export type CanonicalStep =
  | 'your_agency_visit'
  | 'your_agency_profile_viewed'
  | 'your_agency_listing_scrolled_to'
  | 'owner_preview_viewed'
  | 'request_replay_opened'
  | 'request_replay_ledger_viewed'
  | 'missed_clients_ledger_viewed'
  | 'activation_cta_clicked'
  | 'check_availability_opened'
  | 'check_availability_submitted'
  | 'check_availability_recommended'
  | 'check_availability_redirected'
  | 'manage_listing_opened'
  | 'manage_remove_started'
  | 'manage_remove_confirmed'
  | 'keep_listing_clicked'
  | 'activation_page_viewed'
  | 'checkout_opened'
  | 'checkout_started'
  | 'purchase_completed'
  | 'listing_removed';

export const CANONICAL_STEP_LABELS: Record<CanonicalStep, string> = {
  your_agency_visit: '/your-agency visit',
  your_agency_profile_viewed: 'Your-Agency profile viewed',
  your_agency_listing_scrolled_to: 'Your-Agency listing scrolled to',
  owner_preview_viewed: 'Owner preview viewed',
  request_replay_opened: 'Request Replay opened',
  request_replay_ledger_viewed: 'Replay ledger viewed',
  missed_clients_ledger_viewed: 'Missed-clients ledger viewed',
  activation_cta_clicked: 'Activation CTA clicked',
  check_availability_opened: 'Check Availability opened',
  check_availability_submitted: 'Check Availability submitted',
  check_availability_recommended: 'Availability recommended match',
  check_availability_redirected: 'Availability redirected',
  manage_listing_opened: 'Manage Listing opened',
  manage_remove_started: 'Manage remove started',
  manage_remove_confirmed: 'Manage remove confirmed',
  keep_listing_clicked: 'Keep listing clicked',
  activation_page_viewed: 'Activation page viewed',
  checkout_opened: 'Checkout opened',
  checkout_started: 'Checkout started',
  purchase_completed: 'Purchase completed',
  listing_removed: 'Listing removed',
};

export const STEP_ORDER: CanonicalStep[] = [
  'your_agency_visit',
  'your_agency_profile_viewed',
  'your_agency_listing_scrolled_to',
  'owner_preview_viewed',
  'request_replay_opened',
  'request_replay_ledger_viewed',
  'missed_clients_ledger_viewed',
  'activation_cta_clicked',
  'check_availability_opened',
  'check_availability_submitted',
  'check_availability_recommended',
  'check_availability_redirected',
  'manage_listing_opened',
  'manage_remove_started',
  'keep_listing_clicked',
  'manage_remove_confirmed',
  'activation_page_viewed',
  'checkout_opened',
  'checkout_started',
  'purchase_completed',
  'listing_removed',
];

export const STEP_RANK: Record<CanonicalStep, number> = Object.fromEntries(
  STEP_ORDER.map((s, i) => [s, i]),
) as Record<CanonicalStep, number>;

export function getStepRank(step: CanonicalStep): number {
  return STEP_RANK[step] ?? -1;
}

export function furthestStep(steps: CanonicalStep[]): CanonicalStep | null {
  let best: CanonicalStep | null = null;
  let bestRank = -1;
  for (const s of steps) {
    const r = getStepRank(s);
    if (r > bestRank) {
      bestRank = r;
      best = s;
    }
  }
  return best;
}

export function stepToFunnelSource(step: CanonicalStep): FunnelSource | null {
  switch (step) {
    case 'your_agency_visit':
    case 'your_agency_profile_viewed':
    case 'your_agency_listing_scrolled_to':
    case 'owner_preview_viewed':
      return 'your_agency';
    case 'check_availability_opened':
    case 'check_availability_submitted':
    case 'check_availability_recommended':
    case 'check_availability_redirected':
      return 'your_agency';
    case 'request_replay_opened':
      return 'request_replay';
    case 'manage_listing_opened':
    case 'manage_remove_started':
    case 'manage_remove_confirmed':
    case 'keep_listing_clicked':
    case 'listing_removed':
      return 'manage_listing';
    default:
      return null;
  }
}

export const FUNNEL_SOURCE_LABELS: Record<FunnelSource, string> = {
  your_agency: 'Your Agency',
  request_replay: 'Request Replay',
  manage_listing: 'Manage Listing',
};

export interface RawEvent {
  event_name?: string | null;
  funnel_type?: string | null;
  funnel_name?: string | null;
  page_path?: string | null;
  metadata?: Record<string, unknown> | null;
  is_demo?: boolean | null;
}

function norm(s: string | null | undefined): string {
  return (s ?? '').toLowerCase().trim();
}

export function normalizeFunnelEvent(raw: RawEvent): CanonicalStep | null {
  const ev = norm(raw.event_name);
  const ft = norm(raw.funnel_type);
  const fn = norm(raw.funnel_name);
  const page = norm(raw.page_path);
  const meta = raw.metadata ?? {};

  // ── Activation / Checkout (highest priority)
  if (
    ev === 'purchase_completed' ||
    ev === 'checkout_completed' ||
    ev === 'stripe_checkout_completed' ||
    ev === 'payment_success' ||
    ev === 'stripe_order_completed'
  ) {
    return 'purchase_completed';
  }
  if (
    ev === 'checkout_started' ||
    ev === 'stripe_checkout_started' ||
    ev === 'stripe_checkout_clicked' ||
    ev === 'stripe_checkout_created' ||
    ev === 'checkout_session_created' ||
    ev === 'stripe_checkout_session_created'
  ) {
    return 'checkout_started';
  }
  if (
    ev === 'checkout_opened' ||
    ev === 'stripe_checkout_opened' ||
    ev === 'checkout_view' ||
    ev === 'checkout_page_viewed' ||
    ev === 'checkout_page_opened' ||
    ev === 'discount_checkout_link_opened' ||
    ev === 'discount_checkout_opened' ||
    ev === 'discount_validated' ||
    (page.startsWith('/checkout') && (ev === 'page_view' || ev === 'view'))
  ) {
    return 'checkout_opened';
  }
  if (
    ev === 'activation_page_viewed' ||
    ev === 'activation_page_opened' ||
    ev === 'activation_viewed' ||
    ev === 'activation_opened' ||
    ev === 'activation_page_view' ||
    ev === 'upgrade_page_viewed' ||
    ev === 'upgrade_page_opened' ||
    ev === 'upgrade_viewed' ||
    ev === 'listing_activation_offer_page_viewed' ||
    ev === 'listing_activation_page_viewed' ||
    ev === 'listing_activation_viewed' ||
    (page.startsWith('/activation') && (ev === 'page_view' || ev === 'view')) ||
    (page.startsWith('/upgrade') && (ev === 'page_view' || ev === 'view'))
  ) {
    return 'activation_page_viewed';
  }

  // ── Your Agency
  if (
    ev === 'your_agency_profile_page_viewed' ||
    ev === 'your_agency_profile_viewed' ||
    ev === 'your_agency_profile_clicked' ||
    ev === 'your_agency_profile_click' ||
    ev === 'your_agency_result_view' ||
    ev === 'your_agency_select' ||
    (ev === 'profile_viewed' && (ft === 'your_agency' || fn.includes('your-agency')))
  ) {
    return 'your_agency_profile_viewed';
  }
  if (
    ev === 'your_agency_listing_scrolled_to' ||
    ev === 'listing_scrolled_to' ||
    ev === 'your_agency_scroll_to_listing' ||
    ev === 'owner_preview_scroll_to_listing_cta_clicked' ||
    ev === 'owner_preview_scroll_to_listing_clicked' ||
    ev === 'your_agency_view_listing_click'
  ) {
    return 'your_agency_listing_scrolled_to';
  }
  if (
    ev === 'owner_preview_viewed' ||
    ev === 'owner_preview_opened' ||
    ev === 'owner_preview_started' ||
    ev === 'owner_preview_intro_viewed' ||
    ev === 'owner_preview_state_page_viewed' ||
    ev === 'owner_preview_entry_clicked' ||
    ev === 'availability_owner_preview_viewed'
  ) {
    return 'owner_preview_viewed';
  }
  if (
    ev === 'your_agency_visit' ||
    ev === 'your_agency_viewed' ||
    ev === 'your_agency_landing_page_viewed' ||
    ev === 'your_agency_page_view' ||
    ev === 'your_agency_search' ||
    ev === 'your_agency_search_submitted' ||
    ev === 'your_agency_start_receiving_cta_clicked' ||
    ev === 'state_page_highlight_shown' ||
    (page.startsWith('/your-agency') && (ev === 'page_view' || ev === 'view'))
  ) {
    return 'your_agency_visit';
  }

  // ── Activation CTA (shared across funnels — attribution inferred from raw source/page/session)
  if (
    ev === 'activation_cta_clicked' ||
    ev === 'request_replay_activation_clicked' ||
    ev === 'replay_activation_clicked' ||
    ev === 'replay_cta_activation_clicked' ||
    ev === 'replay_cta_click' ||
    ev === 'your_agency_activate_clicked' ||
    ev === 'owner_ledger_activation_clicked' ||
    ev === 'owner_preview_activate_listing_cta_clicked' ||
    ev === 'manage_listing_activate_clicked'
  ) {
    return 'activation_cta_clicked';
  }
  if (
    ev === 'missed_clients_ledger_viewed' ||
    ev === 'missed_clients_viewed' ||
    ev === 'missed_clients_ledger_opened' ||
    ev === 'owner_preview_missed_clients_page_viewed' ||
    ev === 'owner_preview_missed_clients_cta_clicked'
  ) {
    return 'missed_clients_ledger_viewed';
  }
  if (
    ev === 'request_replay_ledger_viewed' ||
    ev === 'replay_ledger_viewed' ||
    ev === 'replay_ledger_opened' ||
    ev === 'your_agency_ledger_page_viewed' ||
    ev === 'your_agency_requests_visible' ||
    ev === 'your_agency_view_requests_clicked' ||
    ev === 'owner_ledger_engaged' ||
    ev === 'owner_ledger_view_opened' ||
    ev === 'owner_view_requests_clicked'
  ) {
    return 'request_replay_ledger_viewed';
  }
  if (
    ev === 'replay_opened' ||
    ev === 'request_replay_opened' ||
    ev === 'request_replay_open' ||
    ev === 'request_replay_viewed' ||
    ev === 'request_replay_page_viewed' ||
    ev === 'request_replay_entry' ||
    ev === 'replay_open' ||
    ev === 'replay_scene_view' ||
    ev === 'replay_abandoned' ||
    ev === 'replay_completed' ||
    ev === 'replay_auto_continue_started' ||
    ev === 'replay_auto_continue_completed' ||
    (ft === 'request_replay' && (ev === 'view' || ev === 'opened' || ev === 'page_view')) ||
    page.startsWith('/request-replay')
  ) {
    return 'request_replay_opened';
  }

  // ── Check Availability (submitted — owner preview result page means submitted)
  if (
    ev === 'check_availability_submitted' ||
    ev === 'availability_submitted' ||
    ev === 'demo_submitted' ||
    ev === 'owner_preview_check_availability_submitted' ||
    ev === 'owner_preview_check_availability_result_page_viewed' ||
    ev === 'confirm_connection_submit' ||
    ev === 'confirm_connection'
  ) {
    const hasRec = typeof meta.recommended_agency_id === 'string' && (meta.recommended_agency_id as string).length > 0;
    return hasRec ? 'check_availability_recommended' : 'check_availability_submitted';
  }
  if (
    ev === 'demo_result_viewed' ||
    ev === 'availability_result_viewed' ||
    ev === 'check_availability_result'
  ) {
    const hasRec = typeof meta.recommended_agency_id === 'string' && (meta.recommended_agency_id as string).length > 0;
    return hasRec ? 'check_availability_recommended' : 'check_availability_submitted';
  }
  if (
    ev === 'check_availability_redirected' ||
    ev === 'availability_redirected' ||
    ev === 'availability_redirect_followed'
  ) {
    return 'check_availability_redirected';
  }
  if (
    ev === 'check_availability_opened' ||
    ev === 'availability_check' ||
    ev === 'availability_opened' ||
    ev === 'get_matched' ||
    ev === 'demo_modal_opened' ||
    ev === 'availability_modal_opened' ||
    ev === 'owner_preview_check_availability_opened' ||
    ev === 'owner_preview_check_availability_modal_opened'
  ) {
    return 'check_availability_opened';
  }

  // ── Manage Listing
  if (ev === 'manage_remove_confirmed' || ev === 'manage_listing_remove_confirmed') {
    return 'manage_remove_confirmed';
  }
  if (
    ev === 'keep_listing_clicked' ||
    ev === 'manage_keep_listing_clicked' ||
    ev === 'manage_recovered_listing' ||
    ev === 'manage_recovered' ||
    ev === 'manage_listing_keep_visible' ||
    ev === 'manage_listing_keep_visible_saved' ||
    ev === 'manage_listing_remove_cancelled'
  ) {
    return 'keep_listing_clicked';
  }
  if (
    ev === 'manage_remove_started' ||
    ev === 'manage_listing_remove_started' ||
    ev === 'manage_listing_remove_recovery_viewed'
  ) {
    return 'manage_remove_started';
  }
  if (
    ev === 'manage_listing_opened' ||
    ev === 'manage_listing_viewed' ||
    ev === 'manage_opened' ||
    ev === 'manage_funnel_opened' ||
    ev === 'manage_listing_page_view' ||
    page.startsWith('/manage-listing')
  ) {
    return 'manage_listing_opened';
  }
  if (ev === 'listing_removed' || ev === 'listing_hidden') {
    return 'listing_removed';
  }

  return null;
}

export interface FunnelFlow {
  source: FunnelSource;
  label: string;
  steps: CanonicalStep[];
}

export const FUNNEL_FLOWS: FunnelFlow[] = [
  {
    source: 'your_agency',
    label: 'Your Agency',
    steps: [
      'your_agency_visit',
      'your_agency_profile_viewed',
      'your_agency_listing_scrolled_to',
      'owner_preview_viewed',
      'check_availability_opened',
      'check_availability_submitted',
      'activation_cta_clicked',
      'activation_page_viewed',
      'checkout_opened',
      'checkout_started',
      'purchase_completed',
    ],
  },
  {
    source: 'request_replay',
    label: 'Request Replay',
    steps: [
      'request_replay_opened',
      'activation_cta_clicked',
      'activation_page_viewed',
      'checkout_opened',
      'checkout_started',
      'purchase_completed',
    ],
  },
  {
    source: 'manage_listing',
    label: 'Manage Listing',
    steps: [
      'manage_listing_opened',
      'manage_remove_started',
      'keep_listing_clicked',
      'activation_cta_clicked',
      'activation_page_viewed',
      'checkout_opened',
      'checkout_started',
      'purchase_completed',
    ],
  },
];

export function inferRawSource(raw: RawEvent): FunnelSource | null {
  const meta = raw.metadata ?? {};
  const metaCandidates = [
    meta.funnel_source, meta.entry_funnel, meta.source, meta.funnel,
    meta.referrer, meta.return_url, meta.activation_url, meta.path, meta.origin_path,
  ];
  for (const v of metaCandidates) {
    if (typeof v !== 'string') continue;
    const s = v.toLowerCase().trim();
    if (!s) continue;
    if (s.includes('your_agency') || s.includes('your-agency') || s === 'youragency') return 'your_agency';
    if (s.includes('request_replay') || s.includes('request-replay') || s.includes('replay')) return 'request_replay';
    if (s.includes('manage_listing') || s.includes('manage-listing') || s === 'manage' || s === 'manage_funnel') return 'manage_listing';
  }
  const ft = norm(raw.funnel_type);
  if (ft === 'your_agency' || ft === 'your-agency') return 'your_agency';
  if (ft === 'request_replay' || ft === 'replay') return 'request_replay';
  if (ft === 'manage_listing' || ft === 'manage' || ft === 'manage_funnel') return 'manage_listing';

  const fn = norm(raw.funnel_name);
  if (fn.includes('your-agency') || fn.includes('your_agency')) return 'your_agency';
  if (fn.includes('replay')) return 'request_replay';
  if (fn.includes('manage')) return 'manage_listing';

  const page = norm(raw.page_path);
  if (page.startsWith('/your-agency')) return 'your_agency';
  if (page.startsWith('/request-replay')) return 'request_replay';
  if (page.startsWith('/manage-listing') || page.startsWith('/manage')) return 'manage_listing';

  return null;
}

export type Attribution = FunnelSource | 'unknown';

export const ATTRIBUTION_LABELS: Record<Attribution, string> = {
  your_agency: 'Your Agency',
  request_replay: 'Request Replay',
  manage_listing: 'Manage Listing',
  unknown: 'Direct / Unknown',
};

export const ENGAGEMENT_MODULE_STEPS: CanonicalStep[] = [
  'missed_clients_ledger_viewed',
  'request_replay_ledger_viewed',
  'your_agency_profile_viewed',
  'your_agency_listing_scrolled_to',
  'check_availability_opened',
  'check_availability_submitted',
];

export const ENGAGEMENT_MODULE_LABELS: Partial<Record<CanonicalStep, string>> = {
  missed_clients_ledger_viewed: 'Ledger — Missed clients viewed',
  request_replay_ledger_viewed: 'Ledger — Replay ledger viewed',
};

export const UNIFIED_CONVERSION_STEPS: CanonicalStep[] = [
  'activation_page_viewed',
  'checkout_opened',
  'checkout_started',
  'purchase_completed',
];
