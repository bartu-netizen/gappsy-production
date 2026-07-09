/**
 * Agency-Specific Destination Builders
 *
 * Builds smart routing destination URLs using real funnel conventions.
 * Each builder follows existing patterns from the actual pages.
 */

interface RoutingContext {
  agency_id: string;
  lead_key: string;
  campaign_id?: string | null;
  campaign_name?: string | null;
  sequence_name?: string | null;
  email_step?: string | null;
  timestamp: number | null;
  sig?: string;
}

/**
 * Append smart routing params to URL
 */
function appendRoutingParams(url: URL, context: RoutingContext): string {
  url.searchParams.set('aid', context.agency_id);
  url.searchParams.set('lid', context.lead_key);
  if (context.timestamp) url.searchParams.set('ts', context.timestamp.toString());
  if (context.sig) url.searchParams.set('sig', context.sig);
  if (context.campaign_id) url.searchParams.set('cid', context.campaign_id);
  if (context.campaign_name) url.searchParams.set('cn', context.campaign_name);
  if (context.sequence_name) url.searchParams.set('sn', context.sequence_name);
  if (context.email_step) url.searchParams.set('es', context.email_step);
  return url.pathname + url.search;
}

/**
 * Build /your-agency/:agencySlug destination
 */
export function buildYourAgencyDestination(
  agencySlug: string,
  context: RoutingContext
): string {
  const url = new URL(`/your-agency/${agencySlug}`, 'https://dummy.com');
  return appendRoutingParams(url, context);
}

/**
 * Build /availability/owner-demo destination (loss step)
 */
export function buildLossStepDestination(
  agencySlug: string,
  stateSlug: string | null,
  context: RoutingContext
): string {
  const url = new URL('/availability/owner-demo', 'https://dummy.com');
  url.searchParams.set('agencySlug', agencySlug);
  if (stateSlug) url.searchParams.set('state', stateSlug);
  return appendRoutingParams(url, context);
}

/**
 * Build /activation/upgrade destination (direct offer)
 */
export function buildDirectOfferDestination(
  agencyId: string,
  agencySlug: string,
  context: RoutingContext
): string {
  const url = new URL('/activation/upgrade', 'https://dummy.com');
  url.searchParams.set('agencyId', agencyId);
  url.searchParams.set('agencySlug', agencySlug);
  return appendRoutingParams(url, context);
}

/**
 * Build checkout resume destination (same as direct offer with resume intent)
 */
export function buildCheckoutResumeDestination(
  agencyId: string,
  agencySlug: string,
  context: RoutingContext
): string {
  const url = new URL('/activation/upgrade', 'https://dummy.com');
  url.searchParams.set('agencyId', agencyId);
  url.searchParams.set('agencySlug', agencySlug);
  url.searchParams.set('resume', 'true');
  return appendRoutingParams(url, context);
}

/**
 * Build discount checkout destination (uses active_discount_url)
 */
export function buildDiscountCheckoutDestination(
  activeDiscountUrl: string | null,
  fallbackAgencyId: string,
  fallbackAgencySlug: string,
  context: RoutingContext
): string {
  if (activeDiscountUrl) {
    // Parse existing discount URL and append routing params
    const url = new URL(activeDiscountUrl, 'https://dummy.com');
    return appendRoutingParams(url, context);
  }

  // Fallback to direct offer
  return buildDirectOfferDestination(fallbackAgencyId, fallbackAgencySlug, context);
}

/**
 * Build top 25 upgrade offer destination
 */
export function buildTop25UpgradeDestination(
  activeUpgradeUrl: string | null,
  stateSlug: string | null,
  agencyId: string,
  context: RoutingContext
): string {
  if (activeUpgradeUrl) {
    // Parse existing upgrade URL and append routing params
    const url = new URL(activeUpgradeUrl, 'https://dummy.com');
    return appendRoutingParams(url, context);
  }

  // Fallback to top25 upgrade page
  const url = new URL('/top25/upgrade', 'https://dummy.com');
  url.searchParams.set('agencyId', agencyId);
  if (stateSlug) url.searchParams.set('state', stateSlug);
  return appendRoutingParams(url, context);
}

/**
 * Build /manage-listing/:agencySlug destination (paid users and manage flow)
 */
export function buildManageListingDestination(
  agencySlug: string,
  cToken: string | null,
  context: RoutingContext,
  stateSlug?: string | null,
): string {
  const url = new URL(`/manage-listing/${agencySlug}`, 'https://dummy.com');
  if (cToken) url.searchParams.set('c', cToken);
  if (stateSlug) url.searchParams.set('stateSlug', stateSlug);
  return appendRoutingParams(url, context);
}

/**
 * Build /request-replay/:agencySlug destination (state-safe)
 */
export function buildRequestReplayDestination(
  agencySlug: string,
  cToken: string | null,
  agencyId: string | null,
  stateSlug: string | null,
  context: RoutingContext
): string {
  const url = new URL(`/request-replay/${agencySlug}`, 'https://dummy.com');
  if (cToken) url.searchParams.set('c', cToken);
  if (agencyId) url.searchParams.set('aid', agencyId);
  if (stateSlug) url.searchParams.set('stateSlug', stateSlug);
  return appendRoutingParams(url, context);
}

/**
 * Build availability result / owner-demo destination (step >= 100)
 * Routes back into the owner demo flow so the lead can continue naturally.
 */
export function buildAvailabilityResultDestination(
  agencySlug: string,
  stateSlug: string | null,
  context: RoutingContext
): string {
  const url = new URL('/availability/owner-demo', 'https://dummy.com');
  url.searchParams.set('agencySlug', agencySlug);
  if (stateSlug) url.searchParams.set('state', stateSlug);
  url.searchParams.set('resume', 'true');
  return appendRoutingParams(url, context);
}

/**
 * Build paid no-sales-flow destination (order complete)
 */
export function buildPaidNoSalesDestination(
  agencyName: string | null,
  stateSlug: string | null,
  context: RoutingContext
): string {
  const url = new URL('/order/complete', 'https://dummy.com');
  if (agencyName) url.searchParams.set('agency', agencyName);
  if (stateSlug) url.searchParams.set('state', stateSlug);
  return appendRoutingParams(url, context);
}
