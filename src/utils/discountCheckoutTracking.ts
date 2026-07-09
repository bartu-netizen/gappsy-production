import { reliablePost } from './trackingTransport';
import { getVisitorId } from './funnelTracking';
import type { DiscountOffer } from './discountOffer';

export type DiscountSource = 'smartlead' | 'replay' | 'direct' | 'admin';

export type DiscountEventName =
  | 'discount_checkout_link_opened'
  | 'discount_validated'
  | 'discount_invalid_or_expired_viewed'
  | 'discount_checkout_opened'
  | 'discount_checkout_completed'
  | 'discount_consumed';

interface DiscountEventContext {
  agency_id?: string | null;
  agency_slug?: string | null;
  offer_id?: string | null;
  offer_token?: string | null;
  discount_type?: string | null;
  discount_value?: number | null;
  discount_percentage?: number | null;
  link_variant?: string | null;
  intent_score_at_creation?: number | null;
  allowed_products?: string[] | null;
  source: DiscountSource;
  campaign_id?: string | null;
  export_batch_id?: string | null;
  lead_key?: string | null;
}

export function detectDiscountSource(): DiscountSource {
  if (typeof window === 'undefined') return 'direct';
  const params = new URLSearchParams(window.location.search);

  if (params.get('src') === 'smartlead' || params.get('cid')) return 'smartlead';
  if (params.get('src') === 'replay') return 'replay';
  if (params.get('src') === 'admin') return 'admin';

  const ref = document.referrer || '';
  if (ref.includes('/wp-admin') || ref.includes('/admin')) return 'admin';

  return 'direct';
}

export function extractDiscountContext(
  offer?: DiscountOffer | null,
  overrides?: Partial<DiscountEventContext>,
): DiscountEventContext {
  const params = typeof window !== 'undefined'
    ? new URLSearchParams(window.location.search)
    : new URLSearchParams();

  const source = overrides?.source ?? detectDiscountSource();

  const discountPercentage = overrides?.discount_percentage
    ?? (offer?.discount_type === 'percentage' ? offer.discount_value : null)
    ?? null;

  const createdBy = offer?.created_by ?? null;
  const derivedSource: DiscountSource = overrides?.source
    ?? (createdBy === 'smartlead_export' ? 'smartlead' : source);

  return {
    agency_id: overrides?.agency_id ?? offer?.agency_id ?? params.get('aid') ?? null,
    agency_slug: overrides?.agency_slug ?? offer?.agency_slug ?? null,
    offer_id: overrides?.offer_id ?? offer?.id ?? null,
    offer_token: overrides?.offer_token ?? offer?.token ?? params.get('offer') ?? null,
    discount_type: offer?.discount_type ?? null,
    discount_value: offer?.discount_value ?? null,
    discount_percentage: discountPercentage != null ? Math.round(Number(discountPercentage)) : null,
    link_variant: discountPercentage != null ? String(Math.round(Number(discountPercentage))) : null,
    intent_score_at_creation: overrides?.intent_score_at_creation ?? offer?.intent_score_at_creation ?? null,
    allowed_products: offer?.allowed_products ?? null,
    source: derivedSource,
    campaign_id: overrides?.campaign_id ?? params.get('cid') ?? null,
    export_batch_id: overrides?.export_batch_id ?? params.get('ebid') ?? null,
    lead_key: overrides?.lead_key ?? params.get('lid') ?? null,
  };
}

function fireDiscountEvent(
  eventName: DiscountEventName,
  ctx: DiscountEventContext,
  extra?: Record<string, unknown>,
): void {
  const visitorId = getVisitorId();
  const pagePath = typeof window !== 'undefined' ? window.location.pathname : undefined;
  const referrer = typeof document !== 'undefined' ? document.referrer || undefined : undefined;

  reliablePost(
    'funnel-track',
    {
      funnelType: 'discount',
      eventName,
      visitorId,
      pagePath,
      referrer,
      agencyId: ctx.agency_id,
      metadata: {
        ...ctx,
        ...extra,
      },
    } as Record<string, unknown>,
    `discount:${eventName}`,
  );
}

export function trackDiscountLinkOpened(ctx: DiscountEventContext): void {
  fireDiscountEvent('discount_checkout_link_opened', ctx);
}

export function trackDiscountValidated(ctx: DiscountEventContext): void {
  fireDiscountEvent('discount_validated', ctx);
}

export function trackDiscountInvalidOrExpired(
  ctx: DiscountEventContext,
  reason?: string,
): void {
  fireDiscountEvent('discount_invalid_or_expired_viewed', ctx, { reason });
}

export function trackDiscountCheckoutOpened(ctx: DiscountEventContext): void {
  fireDiscountEvent('discount_checkout_opened', ctx);
}

export function trackDiscountCheckoutCompleted(
  ctx: DiscountEventContext,
  payment?: { checkoutSessionId?: string; amountTotal?: number; currency?: string },
): void {
  fireDiscountEvent('discount_checkout_completed', ctx, payment);
}

export function trackDiscountConsumed(ctx: DiscountEventContext): void {
  fireDiscountEvent('discount_consumed', ctx);
}
