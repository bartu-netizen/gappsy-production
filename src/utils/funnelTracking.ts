import { reliablePost } from './trackingTransport';

const VISITOR_ID_KEY = 'gappsy_visitor_id';

function generateUUID(): string {
  if (typeof crypto !== 'undefined' && crypto.randomUUID) {
    return crypto.randomUUID();
  }
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
    const r = (Math.random() * 16) | 0;
    return (c === 'x' ? r : (r & 0x3) | 0x8).toString(16);
  });
}

export function getVisitorId(): string {
  try {
    let id = localStorage.getItem(VISITOR_ID_KEY);
    if (!id) {
      id = generateUUID();
      localStorage.setItem(VISITOR_ID_KEY, id);
    }
    return id;
  } catch {
    return generateUUID();
  }
}

export interface TrackEventParams {
  funnelType: 'top25' | 'spotlight' | 'demo' | 'availability' | 'matched';
  stateSlug?: string;
  leadEmail?: string;
  leadName?: string;
  agencyName?: string;
  agencyId?: string;
  eventName:
    | 'page_view'
    | 'offer_view'
    | 'upsell_view'
    | 'cta_click'
    | 'form_submit'
    | 'checkout_start'
    | 'payment_success'
    | 'payment_failed'
    | 'confirm_connection_submit';
  eventStage?: 'offer' | 'upsell' | 'checkout' | 'thankyou';
  pagePath?: string;
  referrer?: string;
  submissionType?: string;
  submissionId?: string;
  selectedOffer?: string;
  selectedUpsell?: string;
  checkoutSessionId?: string;
  paymentIntentId?: string;
  paymentStatus?: string;
  amountTotal?: number;
  currency?: string;
  metadata?: Record<string, unknown>;
}

export function trackFunnelEvent(params: TrackEventParams): void {
  const visitorId = getVisitorId();
  const pagePath = params.pagePath ?? (typeof window !== 'undefined' ? window.location.pathname : undefined);
  const referrer = params.referrer ?? (typeof document !== 'undefined' ? document.referrer || undefined : undefined);

  const isStatepageHosted =
    typeof window !== 'undefined' &&
    pagePath !== undefined &&
    !pagePath.startsWith('/availability') &&
    params.funnelType === 'availability';

  const metadata = isStatepageHosted
    ? { ...params.metadata, flow_host: 'state_page' }
    : params.funnelType === 'availability'
    ? { ...params.metadata, flow_host: 'availability_route' }
    : params.metadata;

  reliablePost(
    'funnel-track',
    { ...params, visitorId, pagePath, referrer, metadata } as Record<string, unknown>,
    `${params.funnelType}:${params.eventName}`,
  );
}
