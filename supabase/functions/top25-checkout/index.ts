import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from 'npm:stripe@17.7.0';
import { createClient } from 'npm:@supabase/supabase-js@2';
import { sendEmail } from '../_shared/emailClient.ts';
import { buildAgencyAdminUrl } from '../_shared/adminEmailContext.ts';
import { extractVisitorContext } from '../_shared/visitorContext.ts';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

// ── Price Catalog ─────────────────────────────────────────────────────────────

type PriceEntry = { name: string; amount: number; isUpsell: boolean; isRecurring: boolean };

const EDGE_PRICE_CATALOG: Record<string, PriceEntry> = {
  'price_1SZGKxIoPJm5BB2X1My3vHBJ': { name: 'Standard Listing (Ranks 17–25)', amount: 197, isUpsell: false, isRecurring: true },
  'price_1SZKW7IoPJm5BB2Xom28TCYo': { name: 'Priority Listing (Ranks 9–16)', amount: 247, isUpsell: false, isRecurring: true },
  'price_1SZKecIoPJm5BB2Xf1ZNcRmt': { name: 'Premium Listing (Ranks 1–8)', amount: 297, isUpsell: false, isRecurring: true },
  'price_1SZQ3qIoPJm5BB2XVzBy9qRD': { name: 'Featured Spotlight Placement', amount: 997, isUpsell: false, isRecurring: true },
  'price_1SZPw3IoPJm5BB2Xh8ji6xPt': { name: 'Card Visual Upgrade', amount: 37, isUpsell: true, isRecurring: true },
  'price_1SZPzfIoPJm5BB2XKJYYwTlM': { name: 'Get Matched Add-on', amount: 97, isUpsell: true, isRecurring: true },
  'price_1SaplSIoPJm5BB2XIP4XKqGS': { name: 'Agency Activation', amount: 97, isUpsell: false, isRecurring: true },
};

const ALL_UPSELL_PRICE_IDS = [
  'price_1SZPw3IoPJm5BB2Xh8ji6xPt',
  'price_1SZPzfIoPJm5BB2XKJYYwTlM',
];

// ── Basket types & helpers ────────────────────────────────────────────────────

type BasketItem = {
  priceId: string;
  name: string;
  amount: number;
  quantity: number;
  isUpsell: boolean;
  isRecurring: boolean;
  lineTotal: number;
};

type Totals = { subtotal: number; discountAmount: number; total: number; recurringTotal: number };
type Badge = { emoji: string; label: string; bg: string; color: string };

function fmt$(n: number): string {
  return `$${n.toFixed(2).replace(/\.00$/, '')}`;
}

async function buildBasket(
  lineItems: Array<{ price: string; quantity: number }>,
  stripe: Stripe,
  sessionId: string
): Promise<BasketItem[]> {
  const basket: BasketItem[] = [];
  let stripeLineItems: Stripe.LineItem[] | null = null;

  for (const li of lineItems) {
    const entry = EDGE_PRICE_CATALOG[li.price];
    if (entry) {
      basket.push({
        priceId: li.price,
        name: entry.name,
        amount: entry.amount,
        quantity: li.quantity ?? 1,
        isUpsell: entry.isUpsell,
        isRecurring: entry.isRecurring,
        lineTotal: entry.amount * (li.quantity ?? 1),
      });
    } else {
      console.warn(`[top25-checkout] Unknown price ID ${li.price} — fetching from Stripe API`);
      if (!stripeLineItems) {
        try {
          const resp = await stripe.checkout.sessions.listLineItems(sessionId, {
            expand: ['data.price.product'],
          });
          stripeLineItems = resp.data;
          console.log(`[top25-checkout] Stripe listLineItems returned ${stripeLineItems.length} items`);
        } catch (e) {
          console.error('[top25-checkout] Stripe listLineItems failed:', e);
          stripeLineItems = [];
        }
      }
      const stripeItem = stripeLineItems.find((sli) => sli.price?.id === li.price);
      if (stripeItem) {
        const prod = stripeItem.price?.product;
        const name = prod && typeof prod === 'object' && 'name' in prod
          ? (prod as Stripe.Product).name
          : `Product (${li.price.slice(-8)})`;
        const amount = (stripeItem.price?.unit_amount ?? 0) / 100;
        basket.push({
          priceId: li.price,
          name,
          amount,
          quantity: li.quantity ?? 1,
          isUpsell: false,
          isRecurring: stripeItem.price?.type === 'recurring',
          lineTotal: amount * (li.quantity ?? 1),
        });
      } else {
        basket.push({
          priceId: li.price,
          name: `Unknown product (${li.price.slice(-8)})`,
          amount: 0,
          quantity: li.quantity ?? 1,
          isUpsell: false,
          isRecurring: false,
          lineTotal: 0,
        });
      }
    }
  }
  return basket;
}

function computeTotals(
  basket: BasketItem[],
  discountType: string | undefined,
  discountValue: string | undefined,
  offerApplied: boolean
): Totals {
  const subtotal = basket.reduce((sum, item) => sum + item.lineTotal, 0);
  const recurringTotal = basket.filter((i) => i.isRecurring).reduce((sum, i) => sum + i.lineTotal, 0);
  let discountAmount = 0;
  if (offerApplied && discountValue) {
    if (discountType === 'percentage') {
      discountAmount = subtotal * (Number(discountValue) / 100);
    } else {
      discountAmount = Math.min(Number(discountValue), subtotal);
    }
    discountAmount = Math.round(discountAmount * 100) / 100;
  }
  const total = Math.max(0, Math.round((subtotal - discountAmount) * 100) / 100);
  return { subtotal, discountAmount, total, recurringTotal: Math.max(0, recurringTotal - discountAmount) };
}

function computeConversionLikelihood(upsellCount: number, total: number): 'HIGH' | 'MEDIUM' | 'LOW' {
  if (upsellCount >= 2 || total >= 300) return 'HIGH';
  if (upsellCount === 1) return 'MEDIUM';
  return 'LOW';
}

function getEmailBadges(total: number, upsellCount: number, offerApplied: boolean): Badge[] {
  const badges: Badge[] = [];
  if (total >= 300) badges.push({ emoji: '🔥', label: 'HIGH VALUE CHECKOUT', bg: '#fef3c7', color: '#92400e' });
  if (upsellCount >= 2) badges.push({ emoji: '⚡', label: 'UPSELL HEAVY', bg: '#dbeafe', color: '#1e40af' });
  if (upsellCount === 0) badges.push({ emoji: '❄️', label: 'NO UPSELLS', bg: '#e0f2fe', color: '#0369a1' });
  if (offerApplied) badges.push({ emoji: '🚨', label: 'DISCOUNT USED', bg: '#fee2e2', color: '#991b1b' });
  return badges;
}

function basketSummaryText(basket: BasketItem[]): string {
  return basket.map((i) => `${i.name} ${fmt$(i.lineTotal)}`).join(' + ') || 'No items';
}

// ── Email HTML builder ────────────────────────────────────────────────────────

function buildCheckoutOpenedHtml(opts: {
  agencyName: string;
  agencySlug: string | undefined;
  agencyId: string | undefined;
  agencyEmail: string | undefined;
  stateName: string;
  stateSlug: string;
  positionLabel: string;
  listingType: string;
  listingTier: string | undefined;
  basket: BasketItem[];
  totals: Totals;
  upsellPriceIds: string[];
  offerApplied: boolean;
  discountType: string | undefined;
  discountValue: string | undefined;
  offer_token: string | undefined;
  fsid: string | undefined;
  entryPath: string | undefined;
  sessionId: string;
  sessionCreatedAt: string;
  likelihood: 'HIGH' | 'MEDIUM' | 'LOW';
  badges: Badge[];
}): string {
  const { totals } = opts;

  // ── Intent pill config
  const intentCfg = {
    HIGH:   { bg: '#d1fae5', color: '#065f46', label: 'HIGH intent' },
    MEDIUM: { bg: '#fef3c7', color: '#92400e', label: 'MEDIUM intent' },
    LOW:    { bg: '#f3f4f6', color: '#374151', label: 'LOW intent' },
  }[opts.likelihood];

  // ── Header badge pills (HIGH VALUE, UPSELL HEAVY, etc.)
  const badgePills = opts.badges.map((b) =>
    `<span style="display:inline-block;background:${b.bg};color:${b.color};font-size:11px;font-weight:700;padding:3px 10px;border-radius:20px;margin:0 6px 6px 0;letter-spacing:0.04em;word-break:keep-all">${b.emoji} ${b.label}</span>`
  ).join('');

  // ── Upsell + intent summary pills
  const selectedUpsells = opts.basket.filter((i) => i.isUpsell);
  const upsellCount = selectedUpsells.length;
  const missedUpsellIds = ALL_UPSELL_PRICE_IDS.filter(
    (id) => !selectedUpsells.map((i) => i.priceId).includes(id)
  );

  const upsellPill = upsellCount > 0
    ? `<span style="display:inline-block;background:#dbeafe;color:#1d4ed8;font-size:12px;font-weight:700;padding:4px 12px;border-radius:20px;margin:0 6px 6px 0;word-break:keep-all">${upsellCount} upsell${upsellCount > 1 ? 's' : ''}</span>`
    : '';
  const intentPill = `<span style="display:inline-block;background:${intentCfg.bg};color:${intentCfg.color};font-size:12px;font-weight:700;padding:4px 12px;border-radius:20px;margin:0 6px 6px 0;word-break:keep-all">${intentCfg.label}</span>`;

  // ── Basket rows
  const basketRows = opts.basket.map((item) =>
    `<tr>
      <td style="padding:9px 0;font-size:14px;color:#374151;word-break:break-word;overflow-wrap:anywhere;padding-right:16px;line-height:1.4">
        ${item.name}${item.isUpsell ? `<br><span style="font-size:11px;color:#2563eb;font-weight:600">+ Add-on</span>` : ''}
      </td>
      <td style="padding:9px 0;font-size:14px;color:#111827;font-weight:700;text-align:right;white-space:nowrap;vertical-align:top">${fmt$(item.lineTotal)}</td>
    </tr>`
  ).join('') || `<tr><td colspan="2" style="padding:9px 0;font-size:14px;color:#9ca3af">No items</td></tr>`;

  const discountRow = opts.offerApplied && totals.discountAmount > 0
    ? `<tr>
        <td style="padding:6px 0;font-size:13px;color:#dc2626;padding-right:16px">
          Discount (${opts.discountType === 'percentage' ? opts.discountValue + '%' : 'flat'})
        </td>
        <td style="padding:6px 0;font-size:13px;color:#dc2626;font-weight:700;text-align:right;white-space:nowrap">&minus;${fmt$(totals.discountAmount)}</td>
      </tr>`
    : '';

  // ── Missed upsells (shown in Insights)
  const missedHtml = missedUpsellIds.length > 0
    ? missedUpsellIds.map((id) => {
        const e = EDGE_PRICE_CATALOG[id];
        return `<span style="display:inline-block;background:#fff1f2;color:#be123c;font-size:12px;font-weight:600;padding:3px 10px;border-radius:6px;margin:0 6px 6px 0;word-break:break-word">&plus;${fmt$(e?.amount ?? 0)} ${e?.name ?? 'Add-on'}</span>`;
      }).join('')
    : `<span style="color:#10b981;font-size:13px;font-weight:600">All selected</span>`;

  // ── Source label
  const sourceLabel = opts.entryPath
    ? (opts.entryPath.split('/').filter(Boolean).pop() || opts.entryPath)
    : (opts.listingType === 'spotlight' ? 'spotlight' : 'top25');

  // ── URLs
  const agencyFunnelUrl = opts.agencySlug
    ? `https://www.gappsy.com/wp-admin/funnel?agency=${encodeURIComponent(opts.agencySlug)}`
    : 'https://www.gappsy.com/wp-admin/funnel';
  const replyHelperUrl = buildAgencyAdminUrl({ agency_id: opts.agencyId, agency_slug: opts.agencySlug, email: opts.agencyEmail });
  const stripeUrl = `https://dashboard.stripe.com/checkout/sessions/${opts.sessionId}`;

  // ── Full-width block button
  const fullBtn = (label: string, href: string, bg: string, border = 'none') =>
    `<a href="${href}" style="display:block;background:${bg};color:#fff;text-align:center;padding:15px 16px;border-radius:10px;text-decoration:none;font-size:14px;font-weight:700;margin-bottom:10px;word-break:keep-all;border:${border}">${label}</a>`;

  // ── Debug table rows
  const debugFields: [string, string][] = [
    ['Session ID', opts.sessionId],
    ['Agency ID', opts.agencyId || '—'],
    ['Agency slug', opts.agencySlug || '—'],
    ['State slug', opts.stateSlug],
    ['Listing type', opts.listingType],
    ['Listing tier', opts.listingTier || '—'],
    ['Offer token', opts.offer_token || '—'],
    ['Funnel session', opts.fsid || '—'],
    ['Entry path', opts.entryPath || '—'],
    ['Created at', opts.sessionCreatedAt],
  ];
  const debugRows = debugFields.map(([label, val], i) =>
    `<tr style="background:${i % 2 === 0 ? '#f9fafb' : '#fff'}">
      <td style="padding:6px 10px;font-size:11px;color:#6b7280;white-space:nowrap;width:110px;vertical-align:top">${label}</td>
      <td style="padding:6px 10px;font-size:11px;color:#374151;word-break:break-all;overflow-wrap:anywhere">${val}</td>
    </tr>`
  ).join('');

  return `<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body style="margin:0;padding:0;background:#f3f4f6;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif;-webkit-text-size-adjust:100%">

<div style="padding:20px 12px 32px">
<div style="max-width:560px;margin:0 auto">

  <div style="background:#ffffff;border-radius:16px;overflow:hidden;box-shadow:0 1px 8px rgba(0,0,0,0.06)">

    <!-- ── HEADER ───────────────────────────────────────────── -->
    <div style="padding:24px 20px 20px;background:#ffffff;border-bottom:2px solid #f3f4f6">

      ${badgePills ? `<div style="margin-bottom:12px">${badgePills}</div>` : ''}

      <h1 style="margin:0 0 4px;font-size:22px;font-weight:800;color:#111827;line-height:1.25;word-break:break-word;overflow-wrap:anywhere">${opts.agencyName}</h1>

      <p style="margin:0 0 16px;font-size:14px;color:#6b7280;line-height:1.5;word-break:break-word">${opts.positionLabel} &mdash; ${opts.stateName}</p>

      <div style="margin-bottom:10px">
        <span style="font-size:28px;font-weight:800;color:#111827;line-height:1">${fmt$(totals.total)}</span>
        <span style="font-size:13px;color:#9ca3af;margin-left:5px">/ 6 months</span>
      </div>

      <div>${upsellPill}${intentPill}</div>

    </div>

    <!-- ── BASKET ────────────────────────────────────────────── -->
    <div style="padding:22px 20px 0">
      <div style="font-size:11px;font-weight:700;color:#9ca3af;text-transform:uppercase;letter-spacing:0.08em;margin-bottom:14px">Basket</div>

      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
        ${basketRows}
        ${discountRow}
        <tr>
          <td style="padding:14px 0 0;border-top:2px solid #f3f4f6;font-size:15px;font-weight:700;color:#111827;padding-right:16px">Total</td>
          <td style="padding:14px 0 0;border-top:2px solid #f3f4f6;font-size:16px;font-weight:800;color:#111827;text-align:right;white-space:nowrap">${fmt$(totals.total)} <span style="font-size:12px;font-weight:400;color:#9ca3af">/ 6&nbsp;mo</span></td>
        </tr>
      </table>
    </div>

    <!-- ── INSIGHTS ──────────────────────────────────────────── -->
    <div style="padding:22px 20px 0">
      <div style="font-size:11px;font-weight:700;color:#9ca3af;text-transform:uppercase;letter-spacing:0.08em;margin-bottom:14px">Insights</div>

      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
        <tr>
          <td style="font-size:13px;color:#6b7280;padding:6px 0;width:90px;vertical-align:top;white-space:nowrap">Upsells</td>
          <td style="font-size:13px;color:#111827;font-weight:600;padding:6px 0;word-break:break-word;overflow-wrap:anywhere">
            ${upsellCount > 0
              ? selectedUpsells.map((i) => i.name).join(', ')
              : '<span style="color:#9ca3af">None selected</span>'}
          </td>
        </tr>
        <tr>
          <td style="font-size:13px;color:#6b7280;padding:6px 0;vertical-align:top;white-space:nowrap">Missed</td>
          <td style="font-size:13px;padding:6px 0;word-break:break-word;overflow-wrap:anywhere">${missedHtml}</td>
        </tr>
        <tr>
          <td style="font-size:13px;color:#6b7280;padding:6px 0;white-space:nowrap">Source</td>
          <td style="font-size:13px;color:#111827;font-weight:600;padding:6px 0;word-break:break-word;overflow-wrap:anywhere">${sourceLabel}</td>
        </tr>
        ${opts.agencyEmail ? `<tr>
          <td style="font-size:13px;color:#6b7280;padding:6px 0;vertical-align:top;white-space:nowrap">Contact</td>
          <td style="font-size:13px;padding:6px 0;word-break:break-word;overflow-wrap:anywhere">
            <a href="mailto:${opts.agencyEmail}" style="color:#2563eb;text-decoration:none;font-weight:600">${opts.agencyEmail}</a>
          </td>
        </tr>` : ''}
      </table>
    </div>

    <!-- ── ACTIONS ───────────────────────────────────────────── -->
    <div style="padding:22px 20px 24px">
      <div style="font-size:11px;font-weight:700;color:#9ca3af;text-transform:uppercase;letter-spacing:0.08em;margin-bottom:14px">Actions</div>
      ${fullBtn('Open Funnel', agencyFunnelUrl, '#111827')}
      ${fullBtn('Open Admin', replyHelperUrl, '#0369a1')}
      ${fullBtn('View in Stripe', stripeUrl, '#dc2626')}
    </div>

    <!-- ── DEBUG (collapsible) ───────────────────────────────── -->
    <details style="border-top:2px solid #f3f4f6">
      <summary style="padding:13px 20px;font-size:12px;font-weight:600;color:#9ca3af;cursor:pointer;list-style:none;-webkit-appearance:none;user-select:none">&#9654; Debug Info</summary>
      <div style="padding:0 0 16px">
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
          ${debugRows}
        </table>
      </div>
    </details>

  </div>

  <p style="text-align:center;font-size:11px;color:#9ca3af;margin:14px 0 0;line-height:1.5">
    Internal admin notification &middot; Gappsy &middot; Stripe checkout
  </p>

</div>
</div>

</body>
</html>`;
}

// ── Notification orchestrator ─────────────────────────────────────────────────

async function fireCheckoutOpenedNotification(
  supabase: ReturnType<typeof createClient>,
  stripe: Stripe,
  opts: {
    sessionId: string;
    agencyName: string;
    agencySlug: string | undefined;
    agencyId: string | undefined;
    stateName: string;
    stateSlug: string;
    rank: number | null | undefined;
    listingType: string;
    listingTier: string | undefined;
    lineItems: Array<{ price: string; quantity: number }>;
    upsells: { cardVisual?: boolean; getMatched?: boolean; spotlight?: boolean } | undefined;
    offer_token: string | undefined;
    offerApplied: boolean;
    discountType: string | undefined;
    discountValue: string | undefined;
    fsid: string | undefined;
    entryPath: string | undefined;
  }
): Promise<void> {
  const NOTIF_TYPE = 'stripe_checkout_opened';
  const { sessionId, agencyName, stateName, stateSlug } = opts;

  try {
    // ── Step 1: Short ordering delay (2 seconds) — gives profile_click/avail events time to land
    console.log(`[top25-checkout] ${NOTIF_TYPE}: 2-second ordering delay starting`, { sessionId, fsid: opts.fsid });
    await new Promise((r) => setTimeout(r, 2000));

    // ── Step 2: Dedupe — never send twice for the same checkout session
    const { data: existing } = await supabase
      .from('email_notification_logs')
      .select('id')
      .eq('notification_type', NOTIF_TYPE)
      .eq('request_id', sessionId)
      .maybeSingle();

    if (existing) {
      console.log(`[top25-checkout] ${NOTIF_TYPE}: already logged for ${sessionId} — skipping (dedupe)`);
      return;
    }

    // ── Step 3: Check for preceding funnel events (ordering signal, non-blocking)
    let priorEventCount = 0;
    let priorEventTypes: string[] = [];
    if (opts.fsid) {
      try {
        const { data: priorEvents } = await supabase
          .from('email_notification_logs')
          .select('notification_type, created_at')
          .in('notification_type', ['your_agency_profile_click', 'availability_check', 'activation_page_viewed'])
          .filter('payload->>funnel_session_id', 'eq', opts.fsid)
          .limit(10);
        priorEventCount = priorEvents?.length ?? 0;
        priorEventTypes = priorEvents?.map((e) => e.notification_type) ?? [];
      } catch (e) {
        console.warn('[top25-checkout] Prior event check failed (non-blocking):', e);
      }
    }

    // ── Step 3a: Chronology guarantee — activation_page_viewed MUST precede checkout_opened
    // If the user opened checkout without us having logged activation_page_viewed first,
    // backfill an activation_page_viewed log row with an earlier created_at so
    // /wp-admin/email-notifications shows the correct order: activation → checkout_opened.
    if (opts.fsid) {
      try {
        const dedupAgencyId = opts.agencyId ?? '';
        const { data: existingActivation } = await supabase
          .from('email_notification_logs')
          .select('id')
          .eq('notification_type', 'activation_page_viewed')
          .filter('payload->>fsid', 'eq', opts.fsid)
          .filter('payload->>agency_id', 'eq', dedupAgencyId)
          .limit(1)
          .maybeSingle();

        if (!existingActivation) {
          const backfillTs = new Date(Date.now() - 1000).toISOString();
          await supabase.from('email_notification_logs').insert({
            notification_type: 'activation_page_viewed',
            is_test: false,
            to_emails: 'bartu@gappsy.com',
            subject: `Activation Page Viewed (backfill): ${opts.agencyName || 'Unknown Agency'}`,
            status: 'sent',
            provider: 'backfill',
            error_message: null,
            created_at: backfillTs,
            payload: {
              fsid: opts.fsid,
              agency_id: opts.agencyId ?? '',
              agency_slug: opts.agencySlug ?? '',
              agency_name: opts.agencyName ?? '',
              state_slug: opts.stateSlug ?? '',
              listing_type: opts.listingType ?? '',
              rank: opts.rank != null ? String(opts.rank) : '',
              funnel_session_id: opts.fsid,
              entry_path: opts.entryPath ?? '',
              checkout_opened: 'true',
              backfilled_from: 'top25-checkout',
            },
          });
          console.log(`[top25-checkout] activation_page_viewed backfilled before ${NOTIF_TYPE} for fsid=${opts.fsid}`);
        }
      } catch (e) {
        console.warn('[top25-checkout] activation_page_viewed backfill failed (non-blocking):', e);
      }
    }

    console.log(`[top25-checkout] ${NOTIF_TYPE}: ordering check`, {
      sessionId,
      fsid: opts.fsid,
      priorEventCount,
      priorEventTypes,
      eventOrderPosition: priorEventCount + 1,
      delayStatus: 'completed_2s',
    });

    // ── Step 4: Load admin notification settings
    const { data: setting } = await supabase
      .from('email_notification_settings')
      .select('is_enabled, recipient_emails, subject_template, body_html')
      .eq('notification_type', NOTIF_TYPE)
      .maybeSingle();

    if (setting?.is_enabled === false) {
      console.log(`[top25-checkout] ${NOTIF_TYPE}: disabled in settings — skipping`);
      return;
    }

    const recipientsList: string[] = setting?.recipient_emails
      ? setting.recipient_emails.split(',').map((r: string) => r.trim()).filter(Boolean)
      : ['bartu@gappsy.com'];
    if (recipientsList.length === 0) recipientsList.push('bartu@gappsy.com');

    // ── Step 5: Derive presentation fields
    const positionLabel = opts.rank
      ? (opts.listingType === 'spotlight' ? 'Spotlight Placement' : `Top 25 #${opts.rank}`)
      : opts.listingType === 'spotlight'
        ? 'Spotlight Placement'
        : 'Standard Listing';

    // ── Step 6: Build basket with real names and prices (Stripe fallback for unknowns)
    const basket = await buildBasket(opts.lineItems, stripe, sessionId);
    const upsellPriceIds = basket.filter((i) => i.isUpsell).map((i) => i.priceId);
    const upsellCount = upsellPriceIds.length;

    const totals = computeTotals(basket, opts.discountType, opts.discountValue, opts.offerApplied);
    const likelihood = computeConversionLikelihood(upsellCount, totals.total);
    const badges = getEmailBadges(totals.total, upsellCount, opts.offerApplied);
    const summaryText = basketSummaryText(basket);

    const upsellItems: string[] = upsellPriceIds.map((id) => EDGE_PRICE_CATALOG[id]?.name ?? id);
    const upsellSummary = upsellCount > 0 ? `Yes — ${upsellItems.join(', ')}` : 'None';

    // ── Step 7: Look up agency contact email (non-blocking)
    let agencyEmail: string | undefined;
    if (opts.agencyId) {
      try {
        const { data: emailRow } = await supabase
          .from('other_agency_emails')
          .select('email')
          .eq('agency_id', opts.agencyId)
          .eq('is_primary', true)
          .maybeSingle();
        agencyEmail = emailRow?.email;
        if (!agencyEmail) {
          const { data: anyEmail } = await supabase
            .from('other_agency_emails')
            .select('email')
            .eq('agency_id', opts.agencyId)
            .limit(1)
            .maybeSingle();
          agencyEmail = anyEmail?.email;
        }
      } catch (e) {
        console.warn('[top25-checkout] Agency email lookup failed (non-blocking):', e);
      }
    }

    // ── Step 8: Debug summary log
    console.log(`[top25-checkout] ${NOTIF_TYPE}: ready to send`, {
      sessionId,
      agencyName,
      stateName,
      total: fmt$(totals.total),
      subtotal: fmt$(totals.subtotal),
      discountAmount: fmt$(totals.discountAmount),
      recurringTotal: fmt$(totals.recurringTotal),
      upsellCount,
      upsellItems,
      likelihood,
      badges: badges.map((b) => b.label),
      offerApplied: opts.offerApplied,
      discountType: opts.discountType || 'none',
      agencyEmail: agencyEmail || 'not found',
      dedupeStatus: 'new',
      eventOrderPosition: priorEventCount + 1,
    });

    // ── Step 9: Build subject
    const defaultSubject = `[${likelihood}] Checkout opened: ${agencyName} — ${stateName} — ${positionLabel} — ${fmt$(totals.total)}`;
    const subject = setting?.subject_template
      ? setting.subject_template
          .replace(/\{\{agency_name\}\}/g, agencyName)
          .replace(/\{\{agency\}\}/g, agencyName)
          .replace(/\{\{state_name\}\}/g, stateName)
          .replace(/\{\{state\}\}/g, stateName)
          .replace(/\{\{position\}\}/g, positionLabel)
          .replace(/\{\{checkout_session_id\}\}/g, sessionId)
          .replace(/\{\{total\}\}/g, fmt$(totals.total))
          .replace(/\{\{likelihood\}\}/g, likelihood)
      : defaultSubject;

    // ── Step 10: Build email body
    const sessionCreatedAt = new Date().toISOString();
    const htmlBody = setting?.body_html?.trim()
      ? setting.body_html
          .replace(/\{\{agency_name\}\}/g, agencyName)
          .replace(/\{\{agency\}\}/g, agencyName)
          .replace(/\{\{state_name\}\}/g, stateName)
          .replace(/\{\{state\}\}/g, stateName)
          .replace(/\{\{checkout_session_id\}\}/g, sessionId)
          .replace(/\{\{position\}\}/g, positionLabel)
          .replace(/\{\{upsell_summary\}\}/g, upsellSummary)
          .replace(/\{\{upsell_count\}\}/g, String(upsellCount))
          .replace(/\{\{basket_summary\}\}/g, summaryText)
          .replace(/\{\{subtotal\}\}/g, fmt$(totals.subtotal))
          .replace(/\{\{discount_amount\}\}/g, fmt$(totals.discountAmount))
          .replace(/\{\{total\}\}/g, fmt$(totals.total))
          .replace(/\{\{recurring_total\}\}/g, fmt$(totals.recurringTotal))
          .replace(/\{\{likelihood\}\}/g, likelihood)
          .replace(/\{\{agency_email\}\}/g, agencyEmail || '')
          .replace(/\{\{agency_slug\}\}/g, opts.agencySlug || '')
          .replace(/\{\{entry_path\}\}/g, opts.entryPath || '')
      : buildCheckoutOpenedHtml({
          agencyName,
          agencySlug: opts.agencySlug,
          agencyId: opts.agencyId,
          agencyEmail,
          stateName,
          stateSlug,
          positionLabel,
          listingType: opts.listingType,
          listingTier: opts.listingTier,
          basket,
          totals,
          upsellPriceIds,
          offerApplied: opts.offerApplied,
          discountType: opts.discountType,
          discountValue: opts.discountValue,
          offer_token: opts.offer_token,
          fsid: opts.fsid,
          entryPath: opts.entryPath,
          sessionId,
          sessionCreatedAt,
          likelihood,
          badges,
        });

    // ── Step 11: Send
    const result = await sendEmail({ to: recipientsList, subject, html: htmlBody });

    console.log(`[top25-checkout] ${NOTIF_TYPE}: send result`, {
      sessionId,
      notificationSent: result.success,
      reason: result.success ? 'ok' : result.error,
    });

    // ── Step 12: Log with enriched payload (dedupe key = sessionId)
    await supabase.from('email_notification_logs').insert({
      notification_type: NOTIF_TYPE,
      is_test: false,
      to_emails: recipientsList.join(', '),
      subject,
      status: result.success ? 'sent' : 'failed',
      provider: 'smtp',
      error_message: result.error ?? null,
      request_id: sessionId,
      payload: {
        agency_name: agencyName,
        agency_slug: opts.agencySlug || '',
        agency_id: opts.agencyId || '',
        agency_email: agencyEmail || '',
        state_name: stateName,
        state_slug: stateSlug,
        checkout_session_id: sessionId,
        position: positionLabel,
        listing_type: opts.listingType,
        listing_tier: opts.listingTier || '',
        basket_summary: summaryText,
        subtotal: fmt$(totals.subtotal),
        discount_amount: fmt$(totals.discountAmount),
        total: fmt$(totals.total),
        recurring_total: `${fmt$(totals.recurringTotal)} / 6 months`,
        likelihood,
        upsell_summary: upsellSummary,
        upsell_count: String(upsellCount),
        offer_applied: String(opts.offerApplied),
        discount_type: opts.discountType || '',
        discount_value: opts.discountValue || '',
        offer_token: opts.offer_token || '',
        funnel_session_id: opts.fsid || '',
        entry_path: opts.entryPath || '',
      },
    });

  } catch (e) {
    console.error(`[top25-checkout] ${NOTIF_TYPE}: notification error`, e);
  }
}

// ── Main handler ───────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const visitor = extractVisitorContext(req);

  try {
    const stripeKey = Deno.env.get('STRIPE_SECRET_KEY');
    if (!stripeKey) {
      console.error('[top25-checkout] STRIPE_SECRET_KEY not configured');
      return new Response(
        JSON.stringify({ error: 'Stripe not configured', details: 'Missing STRIPE_SECRET_KEY' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const stripe = new Stripe(stripeKey, { apiVersion: '2023-10-16' });

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const {
      listingType,
      stateSlug,
      stateName,
      rank,
      agencyName,
      agencyWebsite,
      agencyDescription,
      agencyServices,
      listingTier,
      lineItems,
      upsells,
      customSuccessUrl,
      customCancelUrl,
      agencyId,
      top25SlotId,
      logoUrl,
      fsid,
      agencySlug,
      entryPath,
      offer_token,
      upgrade_offer_id,
      creditCents,
      extraDiscountCents,
      upgradeDiscountPercent,
      checkoutSource,
    } = await req.json();

    console.log('[top25-checkout] Request received:', {
      listingType,
      stateSlug,
      stateName,
      agencyName,
      lineItemsCount: lineItems?.length,
      hasCustomUrls: !!(customSuccessUrl && customCancelUrl),
      hasOfferToken: !!offer_token,
      hasUpgradeOfferId: !!upgrade_offer_id,
    });

    const isTop25Listing = listingType === 'top25' || listingType === 'top25_upgrade';
    const isUpgradeListing = listingType === 'top25_upgrade';
    let reservedSlotId: string | null = null;
    let reservedLockStartedAt: string | null = null;
    if (isTop25Listing && !isUpgradeListing && stateSlug && typeof rank === 'number' && rank >= 1 && rank <= 25) {
      // Sweep stale reservations (10-minute hold expired and never paid)
      try {
        await supabase
          .from('top25_slots')
          .update({ slot_status: 'available', lock_expires_at: null, lock_started_at: null })
          .eq('state_slug', stateSlug)
          .eq('rank', rank)
          .eq('slot_status', 'reserved')
          .eq('is_paid', false)
          .is('agency_id', null)
          .lt('lock_expires_at', new Date().toISOString());
      } catch (sweepErr) {
        console.warn('[top25-checkout] stale reservation sweep failed (non-blocking):', sweepErr);
      }

      // Atomic reservation: only succeeds when the slot is actually free.
      const lockStarted = new Date();
      const lockExpires = new Date(lockStarted.getTime() + 10 * 60 * 1000);
      const { data: reservedRows, error: reserveErr } = await supabase
        .from('top25_slots')
        .update({
          slot_status: 'reserved',
          lock_started_at: lockStarted.toISOString(),
          lock_expires_at: lockExpires.toISOString(),
          status_reason: 'checkout_reservation',
          status_updated_at: lockStarted.toISOString(),
        })
        .eq('state_slug', stateSlug)
        .eq('rank', rank)
        .eq('slot_status', 'available')
        .eq('is_paid', false)
        .is('agency_id', null)
        .select('id');

      if (reserveErr) {
        console.error('[top25-checkout] atomic reservation DB error:', reserveErr);
      }

      if (!reservedRows || reservedRows.length === 0) {
        console.warn('[top25-checkout] slot NOT reservable — returning not_available:', { stateSlug, rank });
        return new Response(
          JSON.stringify({ ok: false, reason: 'not_available', state_slug: stateSlug, rank }),
          { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
      }

      reservedSlotId = reservedRows[0].id;
      reservedLockStartedAt = lockStarted.toISOString();
      console.log('[top25-checkout] slot reserved atomically:', { stateSlug, rank, slotId: reservedSlotId, lockStartedAt: reservedLockStartedAt, lockExpires });
    }

    if (!stateSlug || !stateName || !agencyName || !lineItems || lineItems.length === 0) {
      console.error('[top25-checkout] Missing required fields:', {
        hasStateSlug: !!stateSlug,
        hasStateName: !!stateName,
        hasAgencyName: !!agencyName,
        hasLineItems: !!lineItems,
        lineItemsLength: lineItems?.length,
      });
      return new Response(
        JSON.stringify({ error: 'Missing required fields', details: 'Required: stateSlug, stateName, agencyName, lineItems' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    if (lineItems[0]?.price === 'price_ACTIVATION_97') {
      console.error('[top25-checkout] Placeholder price ID detected');
      return new Response(
        JSON.stringify({
          error: 'Invalid price ID',
          details: 'Activation product not configured. Please update the price ID in src/config/stripe.ts with your real Stripe price ID.',
        }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const origin = req.headers.get('origin') ?? 'https://www.gappsy.com';
    const funnel = listingType || 'top25';

    const defaultCancelUrl = funnel === 'spotlight'
      ? `${origin}/spotlight/confirm?canceled=true`
      : `${origin}/top-25/confirm?canceled=true`;

    const defaultSuccessUrl = `${origin}/order/complete?session_id={CHECKOUT_SESSION_ID}`;

    const finalSuccessUrl = customSuccessUrl || defaultSuccessUrl;
    const finalCancelUrl = customCancelUrl || defaultCancelUrl;

    // ── For standard/$97 listings: resolve agencyId server-side so it is never blank in Stripe metadata
    // This prevents the webhook from receiving an empty agencyId and failing to activate the listing.
    const isStandardCheckout = listingType === 'other_listing' || listingType === 'standard' || listingType === 'activation';
    let resolvedAgencyId = agencyId || '';

    if (isStandardCheckout && !agencyId && stateSlug && (agencySlug || agencyName)) {
      console.log('[top25-checkout:resolve] agencyId missing for standard listing — resolving from DB:', { agencySlug, agencyName, stateSlug });
      try {
        let q = supabase.from('other_agencies').select('id, name').eq('state_slug', stateSlug);
        if (agencySlug) {
          q = q.eq('slug', agencySlug);
        } else {
          q = q.ilike('name', agencyName.trim());
        }
        const { data: resolved } = await q.maybeSingle();
        if (resolved?.id) {
          resolvedAgencyId = resolved.id;
          console.log('[top25-checkout:resolve] agencyId resolved:', { resolvedAgencyId, name: resolved.name });
        } else {
          console.warn('[top25-checkout:resolve] Could not resolve agencyId — checkout will proceed without it:', { agencySlug, agencyName, stateSlug });
        }
      } catch (resolveErr) {
        console.error('[top25-checkout:resolve] Resolution error (non-blocking):', resolveErr);
      }
    }

    const sharedMeta: Record<string, string> = {
      funnel,
      listingType: listingType || 'top25',
      stateSlug,
      stateName,
      rank: rank != null ? String(rank) : '',
      agencyName,
      agencyWebsite: agencyWebsite || '',
      agencyDescription: agencyDescription || '',
      agencyServices: Array.isArray(agencyServices) ? agencyServices.join(',') : '',
      listingTier: listingTier || '',
      agencyId: resolvedAgencyId,
      top25SlotId: top25SlotId || reservedSlotId || '',
      reservedSlotId: reservedSlotId || '',
      reservedLockStartedAt: reservedLockStartedAt || '',
      logoUrl: logoUrl || '',
      upsellCardVisual: upsells?.cardVisual ? 'true' : 'false',
      upsellGetMatched: upsells?.getMatched ? 'true' : 'false',
      upsellSpotlight: upsells?.spotlight ? 'true' : 'false',
    };

    if (fsid) sharedMeta.fsid = fsid;
    if (agencySlug) sharedMeta.agencySlug = agencySlug;
    if (entryPath) sharedMeta.entryPath = entryPath;

    let stripeCouponId: string | undefined;
    let offerApplied = false;
    let offerDiscountType: string | undefined;
    let offerDiscountValue: string | undefined;
    let offerActivationDiscountCents = 0;
    let offerRenewalMessage: string | undefined;

    const ACTIVATION_PRICE_ID = 'price_1SaplSIoPJm5BB2XIP4XKqGS';
    const BASE_ACTIVATION_AMOUNT = 9700;

    if (offer_token) {
      const { data: offer, error: offerError } = await supabase
        .from('discount_offers')
        .select('*')
        .eq('token', offer_token)
        .maybeSingle();

      const ALLOWED_DISCOUNT_PERCENTS = [15, 20, 25];
      const now = new Date();

      // Full server-side revalidation — never trust client-supplied discount amounts
      const percentValid =
        offer?.discount_type !== 'percentage' ||
        ALLOWED_DISCOUNT_PERCENTS.includes(Math.round(Number(offer?.discount_value)));
      const expiryValid =
        !offer?.expires_at || new Date(offer.expires_at) > now;
      const usageValid =
        offer?.max_uses == null || (offer?.usage_count ?? 0) < offer.max_uses;
      const scopeExpiryValid =
        !offer?.scope_expires_at || new Date(offer.scope_expires_at) > now;

      // Agency-scope guard: if offer is agency-bound, resolvedAgencyId MUST exist and match.
      // Use the server-resolved agency id (declared earlier at line ~856) rather than shadowing with raw request input.
      let agencyScopeValid = true;
      let agencyScopeReason = '';
      if (offer?.agency_id) {
        if (!resolvedAgencyId) {
          agencyScopeValid = false;
          agencyScopeReason = 'agency_context_missing';
        } else if (offer.agency_id !== resolvedAgencyId) {
          agencyScopeValid = false;
          agencyScopeReason = 'agency_mismatch';
        }
      }

      // State-scope guard: if offer is state-bound, resolvedStateSlug MUST exist and match.
      const resolvedStateSlug: string = (stateSlug as string) || '';
      let stateScopeValid = true;
      let stateScopeReason = '';
      if (offer?.state_slug) {
        if (!resolvedStateSlug) {
          stateScopeValid = false;
          stateScopeReason = 'state_context_missing';
        } else if (offer.state_slug !== resolvedStateSlug) {
          stateScopeValid = false;
          stateScopeReason = 'state_mismatch';
        }
      }

      if (!agencyScopeValid) {
        console.warn('[top25-checkout] Offer scope invalid — discount not applied:', {
          reason: agencyScopeReason,
          offer_agency_id: offer?.agency_id,
          resolved_agency_id: resolvedAgencyId,
        });
      }
      if (!stateScopeValid) {
        console.warn('[top25-checkout] Offer scope invalid — discount not applied:', {
          reason: stateScopeReason,
          offer_state_slug: offer?.state_slug,
          resolved_state_slug: resolvedStateSlug,
        });
      }

      const offerValid = !offerError
        && offer
        && offer.is_active
        && percentValid
        && expiryValid
        && usageValid
        && scopeExpiryValid
        && agencyScopeValid
        && stateScopeValid;

      console.log('[top25-checkout:offer] pre-apply diagnostics:', {
        offer_token,
        offer_valid: !!offerValid,
        resolved_agency_id: resolvedAgencyId,
        resolved_state_slug: resolvedStateSlug,
        listing_type: listingType,
      });

      if (offerValid) {
        const products: string[] = offer.allowed_products ?? ['all'];
        const ACTIVATION_ALIASES = ['all', 'activation', 'agency_activation', 'standard', 'standard_listing', 'other_listing'];
        const allowedForActivation = products.some((p) => ACTIVATION_ALIASES.includes(p))
          || products.includes(listingType || 'top25');

        if (allowedForActivation) {
          try {
            const cartSubtotalCents = lineItems.reduce((sum: number, li: { price: string; quantity: number }) => {
              const entry = EDGE_PRICE_CATALOG[li.price];
              return sum + (entry ? Math.round(entry.amount * 100) * (li.quantity ?? 1) : 0);
            }, 0);

            let discountAmountCents: number;
            if (offer.discount_type === 'percentage') {
              discountAmountCents = Math.round(cartSubtotalCents * (Number(offer.discount_value) / 100));
            } else {
              discountAmountCents = Math.min(cartSubtotalCents, Math.round(Number(offer.discount_value) * 100));
            }

            if (discountAmountCents > 0 && discountAmountCents <= cartSubtotalCents) {
              const discountLabel = offer.discount_type === 'percentage'
                ? `${offer.discount_value}% off — first billing cycle`
                : `$${(discountAmountCents / 100).toFixed(2)} off — first billing cycle`;

              const coupon = await stripe.coupons.create({
                amount_off: discountAmountCents,
                currency: 'usd',
                duration: 'once',
                name: discountLabel,
                metadata: {
                  offer_token,
                  source: 'activation_offer_token',
                  discount_type: offer.discount_type,
                  discount_value: String(offer.discount_value),
                  cart_subtotal_cents: String(cartSubtotalCents),
                  applies_to: 'full_cart',
                },
              });

              stripeCouponId = coupon.id;
              offerApplied = true;
              offerDiscountType = offer.discount_type;
              offerDiscountValue = String(offer.discount_value);
              offerActivationDiscountCents = discountAmountCents;

              const discountedFirstCycleCents = cartSubtotalCents - discountAmountCents;
              const renewalAmountDisplay = `$${(cartSubtotalCents / 100).toFixed(2)}`;
              offerRenewalMessage = `${offer.discount_type === 'percentage' ? offer.discount_value + '%' : '$' + (discountAmountCents / 100).toFixed(2)} off applied to your first 6 months. Renews at ${renewalAmountDisplay} every 6 months.`;

              sharedMeta.offer_token = offer_token;
              sharedMeta.offer_discount_type = offer.discount_type;
              sharedMeta.offer_discount_value = String(offer.discount_value);
              sharedMeta.discount_percentage = offer.discount_type === 'percentage' ? String(Math.round(Number(offer.discount_value))) : '';
              sharedMeta.intent_score_at_creation = offer.intent_score_at_creation != null ? String(offer.intent_score_at_creation) : '';
              sharedMeta.discount_source = offer.created_by || 'direct';
              sharedMeta.cart_subtotal_cents = String(cartSubtotalCents);
              sharedMeta.discount_amount_cents = String(discountAmountCents);
              sharedMeta.first_cycle_cents = String(discountedFirstCycleCents);
              sharedMeta.renewal_cents = String(cartSubtotalCents);
              sharedMeta.discount_duration = 'first_cycle_only';

              // usage_count is incremented only after successful Stripe payment in stripe-webhook
              console.log('[top25-checkout] Discount applied to full cart via first-cycle coupon:', {
                token: offer_token,
                type: offer.discount_type,
                value: offer.discount_value,
                cartSubtotalCents,
                discountAmountCents,
                firstCycleCents: discountedFirstCycleCents,
                renewalCents: cartSubtotalCents,
                couponId: coupon.id,
                duration: 'once',
              });
            } else {
              console.warn('[top25-checkout] Computed discount invalid:', { discountAmountCents, cartSubtotalCents });
            }
          } catch (couponErr) {
            console.error('[top25-checkout] Activation coupon creation failed, proceeding without discount:', couponErr);
          }
        } else {
          console.warn('[top25-checkout] Offer not valid for activation product:', products);
        }
      } else {
        console.warn('[top25-checkout] Offer token invalid or expired:', offer_token);
      }
    }

    if (!offerApplied && upgrade_offer_id) {
      const { data: upgradeOffer, error: upgradeOfferError } = await supabase
        .from('upgrade_offers')
        .select('stripe_coupon_id, credit_cents, extra_discount_cents, final_upgrade_price_cents')
        .eq('id', upgrade_offer_id)
        .eq('status', 'pending_checkout')
        .maybeSingle();

      if (upgradeOfferError) {
        console.error('[top25-checkout] Failed to fetch upgrade offer:', upgradeOfferError);
      } else if (upgradeOffer?.stripe_coupon_id) {
        stripeCouponId = upgradeOffer.stripe_coupon_id;
        offerApplied = true;
        sharedMeta.upgrade_offer_id = upgrade_offer_id;
        sharedMeta.upgrade_credit_cents = String(upgradeOffer.credit_cents ?? 0);
        sharedMeta.upgrade_extra_discount_cents = String(upgradeOffer.extra_discount_cents ?? 0);
        console.log('[top25-checkout] Upgrade offer coupon applied:', {
          upgrade_offer_id,
          stripe_coupon_id: upgradeOffer.stripe_coupon_id,
          final_upgrade_price_cents: upgradeOffer.final_upgrade_price_cents,
        });
      } else {
        console.warn('[top25-checkout] Upgrade offer not found or already used:', upgrade_offer_id);
      }
    }

    if (!offerApplied && listingType === 'top25_upgrade') {
      const credit = Math.max(0, Number(creditCents) || 0);
      const extra = Math.max(0, Number(extraDiscountCents) || 0);
      const totalDiscountCents = credit + extra;
      const upgradePct = Number(upgradeDiscountPercent) || 20;
      if (totalDiscountCents > 0) {
        try {
          const coupon = await stripe.coupons.create({
            amount_off: totalDiscountCents,
            currency: 'usd',
            duration: 'once',
            name: `${upgradePct}% OFF — today only`,
            metadata: {
              agency_name: agencyName,
              state_slug: stateSlug,
              credit_cents: String(credit),
              extra_discount_cents: String(extra),
              source: 'top25_upgrade_explicit',
              discount_type: `${upgradePct}_percent_upgrade_offer`,
            },
          });
          stripeCouponId = coupon.id;
          offerApplied = true;
          sharedMeta.upgrade_credit_cents = String(credit);
          sharedMeta.upgrade_extra_discount_cents = String(extra);
          console.log('[top25-checkout] Upgrade discount coupon created (explicit):', {
            couponId: coupon.id,
            credit,
            extra,
            totalDiscountCents,
          });
        } catch (couponErr) {
          console.error('[top25-checkout] Explicit upgrade coupon creation failed:', couponErr);
        }
      }
    }

    console.log('[top25-checkout] Creating Stripe session:', {
      mode: 'subscription',
      priceId: lineItems[0]?.price,
      quantity: lineItems[0]?.quantity,
      successUrl: finalSuccessUrl,
      cancelUrl: finalCancelUrl,
      offerApplied,
      hasCoupon: !!stripeCouponId,
      discountDuration: offerActivationDiscountCents > 0 ? 'first_cycle_only' : 'n/a',
    });

    // If offer_token was present but no coupon got applied, log loudly.
    // We do NOT block the checkout — this avoids false negatives when the offer
    // simply did not pass agency/state/product scope after server-side resolution.
    // The agency-scope validation above already uses resolvedAgencyId (not raw agencyId).
    if (offer_token && !stripeCouponId) {
      console.error('[top25-checkout] offer_token supplied but no coupon applied — proceeding without discount:', {
        offer_token,
        offerApplied,
        resolved_agency_id: resolvedAgencyId,
        resolved_state_slug: (stateSlug as string) || '',
        listing_type: listingType,
      });
    }

    const sessionParams: Stripe.Checkout.SessionCreateParams = {
      mode: 'subscription',
      line_items: lineItems,
      success_url: finalSuccessUrl,
      cancel_url: finalCancelUrl,
      metadata: sharedMeta,
      subscription_data: { metadata: sharedMeta },
    };

    if (stripeCouponId) {
      sessionParams.discounts = [{ coupon: stripeCouponId }];
    }

    console.log('[top25-checkout:session] Stripe params diagnostics:', {
      offer_token_received: !!offer_token,
      offerApplied,
      coupon_created: !!stripeCouponId,
      stripeCouponId: stripeCouponId || null,
      session_discounts_present: !!sessionParams.discounts,
      resolved_agency_id: resolvedAgencyId,
      resolved_state_slug: (stateSlug as string) || '',
    });

    const checkoutMessage = offerRenewalMessage
      ? `${offerRenewalMessage} Cancel anytime.`
      : 'Renews every 6 months. Cancel anytime.';

    sessionParams.custom_text = {
      submit: { message: 'Billed every 6 months \u2014 cancel anytime.' },
      after_submit: { message: checkoutMessage },
    };

    const session = await stripe.checkout.sessions.create(sessionParams);

    console.log('[top25-checkout] Session created successfully:', {
      sessionId: session.id,
      hasUrl: !!session.url,
      offerApplied,
    });

    // ── Insert checkout_opened funnel event (non-blocking) ────────────────────
    // Dedupe per Stripe checkout session id (unique per real attempt).
    // Legitimate retries (new Stripe session) produce new events; client-side
    // inFlightRef in useFastCheckout prevents double-click races from producing
    // multiple Stripe sessions in the first place.
    EdgeRuntime.waitUntil(
      (async () => {
        try {
          const funnelName = listingType === "spotlight" ? "spotlight" : "top25";

          const { data: existing } = await supabase
            .from("funnel_events")
            .select("id")
            .eq("event_name", "checkout_page_viewed")
            .eq("metadata->>checkout_session_id", session.id)
            .limit(1)
            .maybeSingle();

          if (!existing) {
            await supabase.from("funnel_events").insert({
              funnel_type:  funnelName,
              funnel_name:  funnelName,
              event_name:   "checkout_page_viewed",
              step_number:  150,
              state_slug:   stateSlug ?? null,
              is_demo:      false,
              fsid:         fsid ?? null,
              agency_id:    resolvedAgencyId ?? null,
              metadata: {
                agency_id:            resolvedAgencyId    ?? null,
                agency_name:          agencyName  ?? null,
                agency_slug:          agencySlug  ?? null,
                checkout_session_id:  session.id,
                rank:                 rank        ?? null,
                listing_type:         listingType ?? null,
                listing_tier:         listingTier ?? null,
                upsell_card_visual:   upsells?.cardVisual   ?? false,
                upsell_get_matched:   upsells?.getMatched   ?? false,
                offer_applied:        offerApplied          ?? false,
                entry_path:           entryPath             ?? null,
                checkout_source:      checkoutSource        ?? null,
                source: "top25-checkout",
              },
              ...visitor,
            });
          }
          // Stamp the checkout_session_id onto the funnel session so the webhook
          // can match it later when marking the session as paid.
          if (fsid) {
            await supabase.from("funnel_sessions").update({
              checkout_session_id: session.id,
              stage:               "checkout_started",
              last_event_name:     "checkout_page_viewed",
              last_event_at:       new Date().toISOString(),
              updated_at:          new Date().toISOString(),
            }).eq("fsid", fsid);
          }

          // Update lead_funnel_state when checkout is opened (marks checkout intent)
          if (resolvedAgencyId) {
            await supabase.from("lead_funnel_state").update({
              has_started_checkout: true,
              last_activity_at: new Date().toISOString(),
              updated_at: new Date().toISOString(),
            }).eq("agency_id", resolvedAgencyId);
          }
        } catch (e) {
          console.error("[top25-checkout] funnel checkout_opened insert failed:", e);
        }
      })()
    );

    // ── Fire admin notification (non-blocking, must not delay the redirect) ──
    EdgeRuntime.waitUntil(
      fireCheckoutOpenedNotification(supabase, stripe, {
        sessionId: session.id,
        agencyName,
        agencySlug,
        agencyId,
        stateName,
        stateSlug,
        rank,
        listingType: funnel,
        listingTier,
        lineItems: lineItems ?? [],
        upsells,
        offer_token,
        offerApplied,
        discountType: offerDiscountType,
        discountValue: offerDiscountValue,
        fsid,
        entryPath,
      })
    );

    return new Response(
      JSON.stringify({ url: session.url, offerApplied }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  } catch (error) {
    console.error('[top25-checkout] Error creating checkout session:', error);

    let errorMessage = 'Unknown error';
    let errorDetails = '';

    if (error instanceof Error) {
      errorMessage = error.message;
      errorDetails = error.stack || '';

      if (error.message.includes('No such price')) {
        errorDetails = 'The Stripe price ID does not exist. Please verify your Stripe product configuration.';
      } else if (error.message.includes('Invalid')) {
        errorDetails = 'Invalid Stripe configuration. Please check your price IDs.';
      }
    }

    console.error('[top25-checkout] Error details:', { errorMessage, errorDetails });

    return new Response(
      JSON.stringify({
        error: 'Failed to create checkout session',
        details: errorDetails || errorMessage,
      }),
      { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
