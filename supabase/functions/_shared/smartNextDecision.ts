/**
 * Smart Next Step Decision Logic
 *
 * Server-side routing decision engine for the smart follow-up system.
 * Determines the best next destination for each lead based on their funnel state.
 */

export interface LeadFunnelState {
  // Visit tracking
  your_agency_raw_clicks: number;
  your_agency_qualified_views_count: number;

  // Funnel progression
  has_seen_loss_step: boolean;
  has_seen_offer_page: boolean;
  has_started_checkout: boolean;
  has_completed_payment: boolean;

  // Payment status
  has_standard_paid: boolean;
  is_top25_upgrade_eligible: boolean;
  has_seen_top25_upgrade_offer: boolean;

  // Active offers
  has_active_discount_link: boolean;
  active_discount_url: string | null;
  active_discount_offer_id: string | null;
  last_discount_issued_at: string | null;

  active_upgrade_offer_url: string | null;
  active_upgrade_offer_id: string | null;
  last_upgrade_offer_issued_at: string | null;

  // Request Compare tracking
  has_viewed_your_agency?: boolean;
  has_viewed_request_replay?: boolean;
  has_opened_request_compare?: boolean;

  // Activity
  last_activity_at: string | null;
}

export interface RoutingDecision {
  step: string;
  reason: string;
  intent_score: number;
}

/**
 * Check if discount offer is still valid and not too old
 */
function isDiscountValid(state: LeadFunnelState): boolean {
  if (!state.has_active_discount_link || !state.active_discount_url) {
    return false;
  }

  // Check if discount was issued recently (within 30 days)
  if (state.last_discount_issued_at) {
    const issuedAt = new Date(state.last_discount_issued_at).getTime();
    const age = Date.now() - issuedAt;
    const maxAge = 30 * 24 * 60 * 60 * 1000; // 30 days

    if (age > maxAge) {
      return false;
    }
  }

  return true;
}

/**
 * Check if upgrade offer is still valid and not too old
 */
function isUpgradeOfferValid(state: LeadFunnelState): boolean {
  if (!state.active_upgrade_offer_url) {
    return false;
  }

  // Check if offer was issued recently (within 60 days)
  if (state.last_upgrade_offer_issued_at) {
    const issuedAt = new Date(state.last_upgrade_offer_issued_at).getTime();
    const age = Date.now() - issuedAt;
    const maxAge = 60 * 24 * 60 * 60 * 1000; // 60 days

    if (age > maxAge) {
      return false;
    }
  }

  return true;
}

/**
 * Compute intent score (0-100) based on engagement signals
 */
function calculateIntentScore(state: LeadFunnelState): number {
  let score = 0;

  // Qualified views show real engagement
  score += Math.min(state.your_agency_qualified_views_count * 15, 45);

  // Progression through funnel steps
  if (state.has_seen_loss_step) score += 10;
  if (state.has_seen_offer_page) score += 20;
  if (state.has_started_checkout) score += 30;
  if (state.has_completed_payment) score = 100;

  // Active engagement signals
  if (state.last_activity_at) {
    const daysSinceActivity = (Date.now() - new Date(state.last_activity_at).getTime()) / (1000 * 60 * 60 * 24);
    if (daysSinceActivity < 1) score += 10;
    else if (daysSinceActivity < 7) score += 5;
  }

  return Math.min(score, 100);
}

/**
 * Core routing decision logic
 * Returns the best next step based on current funnel state
 */
export function computeBestNextStep(state: LeadFunnelState): RoutingDecision {
  const intent_score = calculateIntentScore(state);

  // Rule 1: Already paid and not eligible for upgrade → post-payment destination
  if (state.has_completed_payment && !state.is_top25_upgrade_eligible) {
    return {
      step: 'paid_no_sales_flow',
      reason: 'Payment completed — routing to order complete page',
      intent_score,
    };
  }

  // Rule 2: Standard paid + upgrade eligible → Top 25 upgrade offer
  if (state.has_standard_paid && state.is_top25_upgrade_eligible) {
    if (isUpgradeOfferValid(state)) {
      return {
        step: 'top25_upgrade_offer',
        reason: 'Eligible for Top 25 upgrade with valid offer',
        intent_score,
      };
    }
    // Upgrade eligible but need to generate offer
    return {
      step: 'top25_upgrade_offer',
      reason: 'Eligible for Top 25 upgrade — offer needs generation',
      intent_score,
    };
  }

  // Rule 3: Checkout abandoner with valid discount
  if (state.has_started_checkout && !state.has_completed_payment) {
    if (isDiscountValid(state)) {
      return {
        step: 'discount_checkout',
        reason: 'Checkout abandoned — active discount available',
        intent_score,
      };
    }
    return {
      step: 'checkout_resume',
      reason: 'Checkout abandoned — resume at checkout',
      intent_score,
    };
  }

  // Rule 4: Saw offer page but didn't start checkout
  if (state.has_seen_offer_page && !state.has_started_checkout) {
    return {
      step: 'direct_offer',
      reason: 'Viewed pricing but did not start checkout',
      intent_score,
    };
  }

  // Rule 5: Multiple qualified views + hasn't seen loss step → show missed-clients flow
  if (state.your_agency_qualified_views_count >= 2 && !state.has_seen_loss_step) {
    return {
      step: 'loss_step',
      reason: `${state.your_agency_qualified_views_count} qualified visits — show owner missed-client opportunity`,
      intent_score,
    };
  }

  // Default: Route to /your-agency profile for initial discovery
  return {
    step: 'your_agency',
    reason: 'Initial discovery phase',
    intent_score,
  };
}

/**
 * Deterministic step-based routing (canonical system).
 *
 * ALL routing decisions are based solely on max_step — the highest
 * funnel step number the lead has reached.
 *
 * Canonical step → route mapping (strict, no exceptions):
 *   >= 160  checkout_completed              → manage_listing
 *   >= 150  checkout_page_viewed            → checkout_resume
 *   >= 140  listing_activation_offer_...    → direct_offer
 *   >= 120  owner_preview_missed_clients_*  → loss_step
 *   >= 100  check_availability_result_*     → availability_result
 *   default                                 → your_agency
 *
 * NEVER use flags, last_event, or any other signal. Only max_step.
 * NEVER downgrade: the caller must pass the effective max (stored vs fresh).
 */
export function computeStepBasedNextStep(maxStep: number): RoutingDecision {
  if (maxStep >= 160) {
    return {
      step: 'manage_listing',
      reason: 'Paid (step 160) — route to manage listing',
      intent_score: 100,
    };
  }
  if (maxStep >= 150) {
    return {
      step: 'checkout_resume',
      reason: 'Checkout page reached (step 150) — resume checkout',
      intent_score: 90,
    };
  }
  if (maxStep >= 140) {
    return {
      step: 'direct_offer',
      reason: 'Offer page reached (step 140) — show activation offer',
      intent_score: 70,
    };
  }
  if (maxStep >= 120) {
    return {
      step: 'loss_step',
      reason: 'Missed clients page reached (step 120) — show loss step',
      intent_score: 50,
    };
  }
  if (maxStep >= 100) {
    return {
      step: 'availability_result',
      reason: 'Availability result viewed (step 100) — continue owner demo flow',
      intent_score: 30,
    };
  }
  return {
    step: 'your_agency',
    reason: `Early funnel (step ${maxStep}) — route to profile`,
    intent_score: Math.min(maxStep, 20),
  };
}

/**
 * Compute the admin-facing next-best-action label for Request Compare funnel.
 *
 * Rules (strict, in order):
 *   1. Viewed /your-agency AND viewed /request-replay AND no purchase
 *      → "Send Request Compare link"
 *   2. Opened /request-compare AND no purchase
 *      → "Final push follow-up"
 *   3. Otherwise: null (caller falls back to existing recommendation)
 */
export function computeRequestCompareNextAction(
  state: Pick<
    LeadFunnelState,
    | 'has_viewed_your_agency'
    | 'has_viewed_request_replay'
    | 'has_opened_request_compare'
    | 'has_completed_payment'
  >,
): { action: string; reason: string } | null {
  if (state.has_completed_payment) return null;

  if (state.has_opened_request_compare) {
    return {
      action: 'Final push follow-up',
      reason: 'Lead opened /request-compare but has not purchased',
    };
  }

  if (state.has_viewed_your_agency && state.has_viewed_request_replay) {
    return {
      action: 'Send Request Compare link',
      reason: 'Lead viewed /your-agency and /request-replay without purchase',
    };
  }

  return null;
}

/**
 * Apply manual override if present
 */
export function applyManualOverride(
  computed: RoutingDecision,
  override: {
    override_step: string | null;
    override_reason: string | null;
    expires_at: string | null;
  } | null
): RoutingDecision {
  if (!override || !override.override_step || override.override_step === 'none') {
    return computed;
  }

  // Check expiration
  if (override.expires_at) {
    const expired = new Date(override.expires_at).getTime() < Date.now();
    if (expired) {
      return computed;
    }
  }

  // Map override to actual step
  const overrideMap: Record<string, string> = {
    'force_your_agency': 'your_agency',
    'force_loss_step': 'loss_step',
    'force_direct_offer': 'direct_offer',
    'force_checkout_resume': 'checkout_resume',
    'force_discount_checkout': 'discount_checkout',
    'force_top25_upgrade_offer': 'top25_upgrade_offer',
  };

  const step = overrideMap[override.override_step] || computed.step;

  return {
    step,
    reason: `Manual override: ${override.override_reason || 'Admin-set routing'}`,
    intent_score: computed.intent_score,
  };
}
