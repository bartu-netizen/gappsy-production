import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
);

// ─── types ────────────────────────────────────────────────────────────────────

type DemoFilter = "all" | "demo_only" | "no_demo";

// ─── pagination helper ────────────────────────────────────────────────────────
// Fetches ALL rows matching the query in batches, working around PostgREST's
// default 1000-row cap.  The factory is called once per batch; each invocation
// builds a fresh, fully-configured query to which .range(from, to) is appended
// before execution.  Uses created_at desc + id desc ordering (enforced by the
// factory) so the cursor is deterministic even when rows share the same timestamp.

const BATCH_SIZE = 1000;

// deno-lint-ignore no-explicit-any
async function fetchAllRows<T = Record<string, unknown>>(
  label: string,
  // deno-lint-ignore no-explicit-any
  queryFactory: () => any,
): Promise<T[]> {
  const allRows: T[] = [];
  let offset = 0;
  let batchNum = 0;
  const t0 = Date.now();

  while (true) {
    batchNum++;
    // deno-lint-ignore no-explicit-any
    const { data, error } = await (queryFactory() as any).range(offset, offset + BATCH_SIZE - 1);

    if (error) {
      console.error(`[fetchAllRows:${label}] batch ${batchNum} error:`, error.message);
      break;
    }

    const batch = (data ?? []) as T[];
    allRows.push(...batch);

    console.log(
      `[fetchAllRows:${label}] batch ${batchNum}: got ${batch.length} rows` +
      ` (running total: ${allRows.length})`
    );

    if (batch.length < BATCH_SIZE) break;
    offset += BATCH_SIZE;
  }

  console.log(
    `[fetchAllRows:${label}] complete — ${allRows.length} rows in ${batchNum} batch(es), ${Date.now() - t0}ms`
  );
  return allRows;
}

// ─── helpers ─────────────────────────────────────────────────────────────────

function isUnresolvedSession(s: {
  agency_name: string | null;
  agency_slug: string | null;
  agency_id:   string | null;
}): boolean {
  return !(s.agency_name || s.agency_slug || s.agency_id);
}

function deriveSource(s: {
  entry_path:  string | null;
  funnel_type: string | null;
  funnel_name: string | null;
}): string {
  const ep = (s.entry_path  || "").toLowerCase();
  const ft = (s.funnel_type || s.funnel_name || "").toLowerCase();
  if (ep === "search")                          return "Search (/your-agency)";
  if (ep === "direct_profile")                  return "Direct Profile Link";
  if (ep === "manage_listing_to_your_agency")   return "Manage listing \u2192 /your-agency";
  if (ft.includes("top25"))               return "Top 25 Page";
  if (ft.includes("spotlight"))           return "Spotlight Page";
  if (ft.includes("availability"))        return "Availability Page";
  if (ft.includes("your_agency"))         return "Your-Agency Funnel";
  if (ep === "/" || ep === "landing")     return "Direct / Landing";
  if (ep === "email" || ft.includes("email")) return "Email Campaign";
  return "Unknown";
}

function labelForSession(s: {
  agency_name:  string | null;
  agency_slug:  string | null;
  agency_id:    string | null;
  step_number:  number | null;
  entry_path:   string | null;
  funnel_type:  string | null;
  funnel_name:  string | null;
}): string {
  if (s.agency_name) return s.agency_name;
  if (s.agency_slug) return s.agency_slug;
  const ep   = (s.entry_path  || "").toLowerCase();
  const ft   = (s.funnel_type || s.funnel_name || "").toLowerCase();
  const step = s.step_number ?? 0;
  if (ep === "search"  || ft.includes("search"))   return "Search Visitor";
  if (ep === "landing" || ep === "/" || step <= 2)  return "Landing Visitor";
  if (ft.includes("top25"))                         return "Top 25 Browser";
  if (ft.includes("spotlight"))                     return "Spotlight Browser";
  if (step >= 8)                                    return "Late Funnel Visitor";
  return "Anonymous Visitor";
}

// ─── date range helpers ───────────────────────────────────────────────────────

function buildDateRange(days: number, sinceDate?: string, untilDate?: string): {
  since: string;
  until: string | null;
} {
  if (sinceDate) {
    return { since: sinceDate, until: untilDate || null };
  }
  if (days <= 0) {
    return { since: "2024-01-01T00:00:00.000Z", until: null };
  }
  return {
    since: new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString(),
    until: null,
  };
}

// ─── demo filter helper ───────────────────────────────────────────────────────
// Applies the demo_filter to a Supabase query builder.
// "all"       → no filter (include both demo and non-demo)
// "demo_only" → only sessions where is_demo = true
// "no_demo"   → only sessions where is_demo = false OR is_demo is null
//
// IMPORTANT: The previous hard-coded .or("is_demo.eq.false,is_demo.is.null")
// was permanently hiding all demo sessions from the dashboard.
// Now the default is "all" — show everything, let the caller filter if needed.

function applyDemoFilter<T>(q: T & { or: (s: string) => T; eq: (col: string, val: unknown) => T }, demoFilter: DemoFilter): T {
  if (demoFilter === "demo_only") {
    return (q as unknown as { eq: (col: string, val: unknown) => T }).eq("is_demo", true);
  }
  if (demoFilter === "no_demo") {
    return (q as unknown as { or: (s: string) => T }).or("is_demo.eq.false,is_demo.is.null");
  }
  // "all" → no filter
  return q;
}

// ─── confidence filter helper ─────────────────────────────────────────────────
// deno-lint-ignore no-explicit-any
function applySessionConfidenceFilter(q: any, cf: string): any {
  if (cf === "likely_human") {
    return q.or("is_scanner_flagged.is.null,is_scanner_flagged.eq.false");
  }
  if (cf === "verified_only") {
    return q.eq("intent_level", "verified_human");
  }
  return q;
}

// ─── per_agency helpers ───────────────────────────────────────────────────────

function getDropOffLabel(maxStep: number, isPaid: boolean, hasCheckout: boolean): string {
  if (isPaid) return "Converted — Paid";
  if (hasCheckout) return "Dropped at Checkout";
  if (maxStep >= 110) return "Dropped at Upsell";
  if (maxStep >= 80) return "Dropped after Demo";
  if (maxStep >= 40) return "Dropped at Profile";
  if (maxStep >= 10) return "Early Exit";
  return "No engagement";
}

function getIntentSignal(isPaid: boolean, hasCheckout: boolean, maxStep: number): "high" | "medium" | "low" {
  if (isPaid || hasCheckout) return "high";
  if (maxStep >= 80) return "medium";
  return "low";
}

// ─── action: per_agency ───────────────────────────────────────────────────────

async function handlePerAgency(days: number, demoFilter: DemoFilter, sinceDate?: string, untilDate?: string, confidenceFilter = "all") {
  const { since, until } = buildDateRange(days, sinceDate, untilDate);

  // ── Fetch ALL funnel_sessions (batched) ───────────────────────────────────
  const sessions = await fetchAllRows<{
    id: string;
    funnel_type: string | null;
    funnel_name: string | null;
    stage: string | null;
    agency_name: string | null;
    agency_slug: string | null;
    agency_id: string | null;
    state_slug: string | null;
    step_number: number | null;
    entry_path: string | null;
    purchased_product: string | null;
    purchased_amount: number | null;
    upsell_taken: boolean | null;
    payment_status: string | null;
    payment_source: string | null;
    checkout_session_id: string | null;
    payment_intent_id: string | null;
    created_at: string;
    is_demo: boolean | null;
    last_event_at: string | null;
    drop_off_step_number: number | null;
  }>("per_agency:funnel_sessions", () => {
    // deno-lint-ignore no-explicit-any
    let q: any = supabase
      .from("funnel_sessions")
      .select(
        "id, funnel_type, funnel_name, stage, agency_name, agency_slug, agency_id, " +
        "state_slug, step_number, entry_path, purchased_product, purchased_amount, " +
        "upsell_taken, payment_status, payment_source, checkout_session_id, " +
        "payment_intent_id, created_at, is_demo, last_event_at, drop_off_step_number"
      )
      .or(`created_at.gte.${since},last_event_at.gte.${since}`);

    if (demoFilter === "demo_only") q = q.eq("is_demo", true);
    else if (demoFilter === "no_demo") q = q.or("is_demo.eq.false,is_demo.is.null");
    q = applySessionConfidenceFilter(q, confidenceFilter);

    q = q.order("created_at", { ascending: false }).order("id", { ascending: false });
    if (until) q = q.lte("created_at", until);
    return q;
  });

  // ── Fetch ALL stripe_orders (batched) ─────────────────────────────────────
  const stripeOrders = await fetchAllRows<{
    id: string;
    checkout_session_id: string | null;
    payment_intent_id: string | null;
    amount_total: number | null;
    payment_status: string | null;
    status: string | null;
    agency_id: string | null;
    agency_name: string | null;
    state_slug: string | null;
    funnel_type: string | null;
    created_at: string;
    paid_at: string | null;
    product_summary: string | null;
    subscription_id: string | null;
    top25_rank: number | null;
    customer_email: string | null;
  }>("per_agency:stripe_orders", () => {
    // deno-lint-ignore no-explicit-any
    let sq: any = supabase
      .from("stripe_orders")
      .select(
        "id, checkout_session_id, payment_intent_id, amount_total, payment_status, status, " +
        "agency_id, agency_name, state_slug, funnel_type, created_at, paid_at, product_summary, " +
        "subscription_id, top25_rank, customer_email"
      )
      .or("payment_status.eq.paid,status.eq.completed,status.eq.complete")
      .gte("created_at", since);
    if (until) sq = sq.lte("created_at", until);
    sq = sq.order("created_at", { ascending: false }).order("id", { ascending: false });
    return sq;
  });

  // ── Fetch ALL manage_funnel_events (batched) ──────────────────────────────
  const manageFunnelEvents = await fetchAllRows<{
    id: string;
    event_type: string;
    agency_id: string;
    agency_slug: string | null;
    agency_name: string;
    state_slug: string | null;
    recovery_type: string | null;
    created_at: string;
  }>("per_agency:manage_funnel_events", () => {
    // deno-lint-ignore no-explicit-any
    let mq: any = supabase
      .from("manage_funnel_events")
      .select("id, event_type, agency_id, agency_slug, agency_name, state_slug, recovery_type, created_at")
      .gte("created_at", since);
    if (until) mq = mq.lte("created_at", until);
    mq = mq.order("created_at", { ascending: false }).order("id", { ascending: false });
    return mq;
  });

  console.log(
    `[per_agency] loaded ${sessions.length} funnel_sessions, ${stripeOrders.length} stripe_orders, ${manageFunnelEvents.length} manage_funnel_events`
  );

  // ── Build agency map ──────────────────────────────────────────────────────
  type AgencyAgg = {
    agency_key:             string;
    agency_name:            string | null;
    agency_slug:            string | null;
    agency_id:              string | null;
    state_slug:             string | null;
    total_sessions:         number;
    demo_sessions:          number;
    paid_sessions:          number;
    revenue_cents:          number;
    upsells:                number;
    payment_source_client:  number;
    payment_source_webhook: number;
    last_seen:              string | null;
    last_event_at:          string | null;
    last_activity_stage:    string | null;
    funnel_types:           Set<string>;
    sources:                Set<string>;
    is_unresolved:          boolean;
    covered_checkout_ids:   Set<string>;
    covered_payment_intents:Set<string>;
    checkout_opens:         number;
    demo_opens:             number;
    max_step:               number;
    // Manage funnel metrics
    has_manage_activity:    boolean;
    manage_opened_count:    number;
    manage_remove_intent_count: number;
    manage_recovered_count: number;
    manage_removed_count:   number;
    last_manage_event_type: string | null;
    last_manage_event_at:   string | null;
    // Replay funnel metrics
    replay_opens_count:     number;
    last_replay_opened_at:  string | null;
  };

  const agencyMap = new Map<string, AgencyAgg>();

  for (const sess of sessions) {
    const unresolved = isUnresolvedSession(sess);
    const agencyKey  =
      sess.agency_id ||
      sess.agency_slug ||
      (sess.agency_name ? `name:${sess.agency_name}` : null);

    if (!agencyKey) continue;

    if (!agencyMap.has(agencyKey)) {
      agencyMap.set(agencyKey, {
        agency_key:              agencyKey,
        agency_name:             sess.agency_name || null,
        agency_slug:             sess.agency_slug || null,
        agency_id:               sess.agency_id   || null,
        state_slug:              sess.state_slug  || null,
        total_sessions:          0,
        demo_sessions:           0,
        paid_sessions:           0,
        revenue_cents:           0,
        upsells:                 0,
        payment_source_client:   0,
        payment_source_webhook:  0,
        last_seen:               null,
        last_event_at:           null,
        last_activity_stage:     null,
        funnel_types:            new Set<string>(),
        sources:                 new Set<string>(),
        is_unresolved:           unresolved,
        covered_checkout_ids:    new Set<string>(),
        covered_payment_intents: new Set<string>(),
        checkout_opens:          0,
        demo_opens:              0,
        max_step:                0,
        has_manage_activity:     false,
        manage_opened_count:     0,
        manage_remove_intent_count: 0,
        manage_recovered_count:  0,
        manage_removed_count:    0,
        last_manage_event_type:  null,
        last_manage_event_at:    null,
        replay_opens_count:      0,
        last_replay_opened_at:   null,
      });
    }

    const a = agencyMap.get(agencyKey)!;
    if (!a.agency_name && sess.agency_name) a.agency_name = sess.agency_name;
    if (!a.agency_slug && sess.agency_slug) a.agency_slug = sess.agency_slug;
    if (!a.agency_id   && sess.agency_id)   a.agency_id   = sess.agency_id;
    if (!a.state_slug  && sess.state_slug)  a.state_slug  = sess.state_slug;
    if (sess.funnel_type) a.funnel_types.add(sess.funnel_type);
    a.sources.add(deriveSource(sess));

    a.total_sessions++;
    if (sess.is_demo) a.demo_sessions++;

    const sn = sess.step_number ?? 0;
    if (sn > a.max_step) a.max_step = sn;

    // Use last_event_at as primary activity timestamp, fall back to created_at
    const refAt = sess.last_event_at || sess.created_at;
    if (!a.last_seen || refAt > a.last_seen) {
      a.last_seen = refAt;
      a.last_activity_stage = sess.stage || null;
    }
    if (!a.last_event_at || (sess.last_event_at && sess.last_event_at > a.last_event_at)) {
      a.last_event_at = sess.last_event_at;
    }

    if (sn === 150) a.checkout_opens++;
    if (sn >= 80)  a.demo_opens++;

    const isPaid = sess.stage === "paid" || sess.payment_status === "paid";
    if (isPaid) {
      a.paid_sessions++;
      a.revenue_cents += sess.purchased_amount ?? 0;
      if (sess.upsell_taken) a.upsells++;
      if (sess.payment_source === "client")      a.payment_source_client++;
      else if (sess.payment_source === "webhook") a.payment_source_webhook++;
      if (sess.checkout_session_id) a.covered_checkout_ids.add(sess.checkout_session_id);
      if (sess.payment_intent_id)   a.covered_payment_intents.add(sess.payment_intent_id);
    }

    if (unresolved) a.is_unresolved = true;
  }

  // ── Process manage_funnel_events ──────────────────────────────────────────
  for (const mEvent of manageFunnelEvents) {
    const agencyKey = mEvent.agency_id || mEvent.agency_slug || (mEvent.agency_name ? `name:${mEvent.agency_name}` : null);
    if (!agencyKey) continue;

    if (!agencyMap.has(agencyKey)) {
      agencyMap.set(agencyKey, {
        agency_key:              agencyKey,
        agency_name:             mEvent.agency_name || null,
        agency_slug:             mEvent.agency_slug || null,
        agency_id:               mEvent.agency_id   || null,
        state_slug:              mEvent.state_slug  || null,
        total_sessions:          0,
        demo_sessions:           0,
        paid_sessions:           0,
        revenue_cents:           0,
        upsells:                 0,
        payment_source_client:   0,
        payment_source_webhook:  0,
        last_seen:               mEvent.created_at,
        last_event_at:           null,
        last_activity_stage:     mEvent.event_type,
        funnel_types:            new Set<string>(["manage"]),
        sources:                 new Set<string>(["Manage Funnel"]),
        is_unresolved:           false,
        covered_checkout_ids:    new Set<string>(),
        covered_payment_intents: new Set<string>(),
        checkout_opens:          0,
        demo_opens:              0,
        max_step:                0,
        has_manage_activity:     true,
        manage_opened_count:     0,
        manage_remove_intent_count: 0,
        manage_recovered_count:  0,
        manage_removed_count:    0,
        last_manage_event_type:  mEvent.event_type,
        last_manage_event_at:    mEvent.created_at,
        replay_opens_count:      0,
        last_replay_opened_at:   null,
      });
    }

    const a = agencyMap.get(agencyKey)!;
    if (!a.agency_name && mEvent.agency_name) a.agency_name = mEvent.agency_name;
    if (!a.agency_slug && mEvent.agency_slug) a.agency_slug = mEvent.agency_slug;
    if (!a.agency_id   && mEvent.agency_id)   a.agency_id   = mEvent.agency_id;
    if (!a.state_slug  && mEvent.state_slug)  a.state_slug  = mEvent.state_slug;

    a.has_manage_activity = true;
    a.funnel_types.add("manage");
    a.sources.add("Manage Funnel");

    // Count by event type
    if (mEvent.event_type === "manage_funnel_opened") {
      a.manage_opened_count++;
    } else if (mEvent.event_type === "manage_remove_started") {
      a.manage_remove_intent_count++;
    } else if (mEvent.event_type === "manage_recovered") {
      a.manage_recovered_count++;
    } else if (mEvent.event_type === "manage_remove_confirmed") {
      a.manage_removed_count++;
    }

    // Track last event
    if (!a.last_manage_event_at || mEvent.created_at > a.last_manage_event_at) {
      a.last_manage_event_at = mEvent.created_at;
      a.last_manage_event_type = mEvent.event_type;
    }

    // Update last_seen if this is the most recent activity
    if (!a.last_seen || mEvent.created_at > a.last_seen) {
      a.last_seen = mEvent.created_at;
      a.last_activity_stage = mEvent.event_type;
    }
  }

  // ── Reconcile Stripe ───────────────────────────────────────────────────────
  const allCoveredCheckout = new Set<string>();
  const allCoveredPI       = new Set<string>();
  for (const agg of agencyMap.values()) {
    for (const id of agg.covered_checkout_ids)    allCoveredCheckout.add(id);
    for (const id of agg.covered_payment_intents) allCoveredPI.add(id);
  }

  let stripeReconcileCount  = 0;
  let stripeRevenueRecTotal = 0;

  for (const order of stripeOrders) {
    if (order.checkout_session_id && allCoveredCheckout.has(order.checkout_session_id)) continue;
    if (order.payment_intent_id   && allCoveredPI.has(order.payment_intent_id))         continue;

    const amountCents: number = order.amount_total ?? 0;
    stripeReconcileCount++;
    stripeRevenueRecTotal += amountCents;

    const matchKey = order.agency_id || (order.agency_name ? `name:${order.agency_name}` : null);
    if (matchKey && agencyMap.has(matchKey)) {
      const a = agencyMap.get(matchKey)!;
      a.paid_sessions++;
      a.revenue_cents += amountCents;
      a.payment_source_webhook++;
      const refAt = order.paid_at || order.created_at;
      if (!a.last_seen || refAt > a.last_seen) a.last_seen = refAt;
    } else if (matchKey) {
      agencyMap.set(matchKey, {
        agency_key:              matchKey,
        agency_name:             order.agency_name || null,
        agency_slug:             null,
        agency_id:               order.agency_id   || null,
        state_slug:              order.state_slug  || null,
        total_sessions:          1,
        demo_sessions:           0,
        paid_sessions:           1,
        revenue_cents:           amountCents,
        upsells:                 0,
        payment_source_client:   0,
        payment_source_webhook:  1,
        last_seen:               order.paid_at || order.created_at,
        last_event_at:           null,
        last_activity_stage:     "paid",
        funnel_types:            new Set(order.funnel_type ? [order.funnel_type] : []),
        sources:                 new Set(["Stripe Reconciled"]),
        is_unresolved:           false,
        covered_checkout_ids:    new Set(),
        covered_payment_intents: new Set(),
        checkout_opens:          1,
        demo_opens:              0,
        max_step:                160,
        has_manage_activity:     false,
        manage_opened_count:     0,
        manage_remove_intent_count: 0,
        manage_recovered_count:  0,
        manage_removed_count:    0,
        last_manage_event_type:  null,
        last_manage_event_at:    null,
        replay_opens_count:      0,
        last_replay_opened_at:   null,
      });
    }
  }

  // ── Fetch replay sessions (deduped opens per agency) ──────────────────────
  const replaySessions = await fetchAllRows<{
    id: string;
    agency_id: string | null;
    agency_slug: string | null;
    agency_name: string | null;
    created_at: string;
  }>("per_agency:replay_sessions", () => {
    // deno-lint-ignore no-explicit-any
    let rq: any = supabase
      .from("funnel_sessions")
      .select("id, agency_id, agency_slug, agency_name, created_at")
      .eq("funnel_name", "request_replay")
      .gte("created_at", since);
    if (until) rq = rq.lte("created_at", until);
    rq = rq.order("created_at", { ascending: false }).order("id", { ascending: false });
    return rq;
  });

  for (const rs of replaySessions) {
    const agencyKey = rs.agency_id || rs.agency_slug || (rs.agency_name ? `name:${rs.agency_name}` : null);
    if (!agencyKey) continue;

    if (!agencyMap.has(agencyKey)) {
      agencyMap.set(agencyKey, {
        agency_key:              agencyKey,
        agency_name:             rs.agency_name || null,
        agency_slug:             rs.agency_slug || null,
        agency_id:               rs.agency_id   || null,
        state_slug:              null,
        total_sessions:          0,
        demo_sessions:           0,
        paid_sessions:           0,
        revenue_cents:           0,
        upsells:                 0,
        payment_source_client:   0,
        payment_source_webhook:  0,
        last_seen:               rs.created_at,
        last_event_at:           null,
        last_activity_stage:     "replay_opened",
        funnel_types:            new Set<string>(["request_replay"]),
        sources:                 new Set<string>(["Request Replay"]),
        is_unresolved:           false,
        covered_checkout_ids:    new Set<string>(),
        covered_payment_intents: new Set<string>(),
        checkout_opens:          0,
        demo_opens:              0,
        max_step:                0,
        has_manage_activity:     false,
        manage_opened_count:     0,
        manage_remove_intent_count: 0,
        manage_recovered_count:  0,
        manage_removed_count:    0,
        last_manage_event_type:  null,
        last_manage_event_at:    null,
        replay_opens_count:      0,
        last_replay_opened_at:   null,
      });
    }

    const a = agencyMap.get(agencyKey)!;
    if (!a.agency_name && rs.agency_name) a.agency_name = rs.agency_name;
    if (!a.agency_slug && rs.agency_slug) a.agency_slug = rs.agency_slug;
    if (!a.agency_id   && rs.agency_id)   a.agency_id   = rs.agency_id;
    a.funnel_types.add("request_replay");

    a.replay_opens_count++;
    if (!a.last_replay_opened_at || rs.created_at > a.last_replay_opened_at) {
      a.last_replay_opened_at = rs.created_at;
    }
    if (!a.last_seen || rs.created_at > a.last_seen) {
      a.last_seen = rs.created_at;
    }
  }

  // ── Output rows ────────────────────────────────────────────────────────────
  const rows = Array.from(agencyMap.values())
    .sort((a, b) => b.paid_sessions - a.paid_sessions || b.total_sessions - a.total_sessions)
    .map((a) => {
      const isPaid      = a.paid_sessions > 0;
      const hasCheckout = a.checkout_opens > 0;
      return {
        agency_key:             a.agency_key,
        agency_name:            a.agency_name,
        agency_slug:            a.agency_slug,
        agency_id:              a.agency_id,
        state_slug:             a.state_slug,
        total_sessions:         a.total_sessions,
        demo_sessions:          a.demo_sessions,
        paid_sessions:          a.paid_sessions,
        revenue:                a.revenue_cents / 100,
        upsells:                a.upsells,
        payment_source_client:  a.payment_source_client,
        payment_source_webhook: a.payment_source_webhook,
        last_seen:              a.last_seen,
        last_activity_stage:    a.last_activity_stage,
        funnel_types:           Array.from(a.funnel_types),
        sources:                Array.from(a.sources),
        is_unresolved:          a.is_unresolved,
        checkout_opens:         a.checkout_opens,
        demo_opens:             a.demo_opens,
        highest_step_reached:   a.max_step,
        drop_off_label:         getDropOffLabel(a.max_step, isPaid, hasCheckout),
        intent_signal:          getIntentSignal(isPaid, hasCheckout, a.max_step),
        // Manage funnel metrics
        has_manage_activity:    a.has_manage_activity,
        manage_opened_count:    a.manage_opened_count,
        manage_remove_intent_count: a.manage_remove_intent_count,
        manage_recovered_count: a.manage_recovered_count,
        manage_removed_count:   a.manage_removed_count,
        last_manage_event_type: a.last_manage_event_type,
        last_manage_event_at:   a.last_manage_event_at,
        replay_opens_count:     a.replay_opens_count,
        last_replay_opened_at:  a.last_replay_opened_at,
      };
    });

  // ── KPI totals ─────────────────────────────────────────────────────────────
  const paidSessions  = sessions.filter(
    (s) => s.stage === "paid" || s.payment_status === "paid"
  );
  const funnelRevenue = paidSessions.reduce((sum, s) => sum + (s.purchased_amount ?? 0), 0);
  const totalUpsells  = paidSessions.filter((s) => s.upsell_taken).length;
  const reconciledRev = funnelRevenue + stripeRevenueRecTotal;

  const checkoutOpenCount = sessions.filter((s) => (s.step_number ?? 0) === 150).length;
  const demoOpenCount     = sessions.filter((s) => (s.step_number ?? 0) >= 80).length;
  const demoSessions      = sessions.filter((s) => s.is_demo).length;

  // ── Manage funnel KPIs ─────────────────────────────────────────────────────
  const manageOpenedCount = manageFunnelEvents.filter(e => e.event_type === "manage_funnel_opened").length;
  const manageRemoveIntentCount = manageFunnelEvents.filter(e => e.event_type === "manage_remove_started").length;
  const manageRecoveredCount = manageFunnelEvents.filter(e => e.event_type === "manage_recovered").length;
  const manageRemovedCount = manageFunnelEvents.filter(e => e.event_type === "manage_remove_confirmed").length;

  const manageRecoveryRate = manageRemoveIntentCount > 0
    ? (manageRecoveredCount / manageRemoveIntentCount) * 100
    : 0;
  const manageRemovalRate = manageRemoveIntentCount > 0
    ? (manageRemovedCount / manageRemoveIntentCount) * 100
    : 0;

  const totalFunnelEntries = sessions.length + manageOpenedCount;
  const totalConversions = paidSessions.length + stripeReconcileCount + manageRecoveredCount;

  return {
    rows,
    demo_filter: demoFilter,
    kpis: {
      total_sessions:    sessions.length,
      demo_sessions:     demoSessions,
      non_demo_sessions: sessions.length - demoSessions,
      paid_sessions:     paidSessions.length + stripeReconcileCount,
      revenue:           reconciledRev / 100,
      upsells:           totalUpsells,
      stripe_orders:     stripeOrders.length,
      stripe_revenue:    stripeOrders.reduce((s, o) => s + (o.amount_total ?? 0), 0) / 100,
      checkout_opens:    checkoutOpenCount,
      demo_opens:        demoOpenCount,
      conv_rate:         sessions.length > 0
        ? ((paidSessions.length + stripeReconcileCount) / sessions.length) * 100
        : 0,
      // Manage funnel KPIs
      manage_opened_count: manageOpenedCount,
      manage_remove_intent_count: manageRemoveIntentCount,
      manage_recovered_count: manageRecoveredCount,
      manage_removed_count: manageRemovedCount,
      manage_recovery_rate: manageRecoveryRate,
      manage_removal_rate: manageRemovalRate,
      // Unified totals
      total_funnel_entries: totalFunnelEntries,
      total_conversions: totalConversions,
    },
  };
}

// ─── action: session_detail ───────────────────────────────────────────────────

async function handleSessionDetail(sessionId: string) {
  const { data: session, error: sErr } = await supabase
    .from("funnel_sessions")
    .select("*")
    .eq("id", sessionId)
    .maybeSingle();

  if (sErr || !session) return { error: sErr?.message || "Session not found" };

  const { data: rawEvents } = await supabase
    .from("funnel_events")
    .select("id, created_at, event_name, event_stage, page_path, referrer, metadata")
    .eq("session_id", sessionId)
    .order("created_at", { ascending: true });

  const evts = rawEvents ?? [];
  const events = evts.map((e, i) => {
    const prev    = i > 0 ? evts[i - 1] : null;
    const msFromPrev = prev
      ? new Date(e.created_at).getTime() - new Date(prev.created_at).getTime()
      : null;
    return {
      ...e,
      ms_from_prev: msFromPrev,
      s_from_prev:  msFromPrev !== null ? Math.round(msFromPrev / 1000) : null,
    };
  });

  let stripe_order = null;
  if (session.checkout_session_id) {
    const { data: order } = await supabase
      .from("stripe_orders")
      .select(
        "id, checkout_session_id, payment_intent_id, amount_total, payment_status, status, " +
        "product_summary, top25_rank, customer_email, paid_at, created_at, subscription_id, " +
        "agency_name, state_slug"
      )
      .eq("checkout_session_id", session.checkout_session_id)
      .maybeSingle();
    stripe_order = order;
  }

  const totalDuration =
    evts.length >= 2
      ? new Date(evts[evts.length - 1].created_at).getTime() -
        new Date(evts[0].created_at).getTime()
      : null;

  return {
    session: {
      ...session,
      source_label: deriveSource(session),
    },
    events,
    stripe_order,
    total_duration_ms: totalDuration,
    event_count: evts.length,
  };
}

// ─── action: funnel_steps ─────────────────────────────────────────────────────

async function handleFunnelSteps(days: number, demoFilter: DemoFilter, sinceDate?: string, untilDate?: string, confidenceFilter = "all") {
  const { since, until } = buildDateRange(days, sinceDate, untilDate);

  // Fetch ALL sessions in batches — no accidental row cap on funnel counts
  const all = await fetchAllRows<{
    step_number: number | null;
    stage: string | null;
    payment_status: string | null;
    entry_path: string | null;
    funnel_type: string | null;
    funnel_name: string | null;
    created_at: string;
    is_demo: boolean | null;
  }>("funnel_steps:funnel_sessions", () => {
    // deno-lint-ignore no-explicit-any
    let q: any = supabase
      .from("funnel_sessions")
      .select("step_number, stage, payment_status, entry_path, funnel_type, funnel_name, created_at, is_demo")
      .or(`created_at.gte.${since},last_event_at.gte.${since}`);

    if (demoFilter === "demo_only") q = q.eq("is_demo", true);
    else if (demoFilter === "no_demo") q = q.or("is_demo.eq.false,is_demo.is.null");
    q = applySessionConfidenceFilter(q, confidenceFilter);

    if (until) q = q.lte("created_at", until);
    q = q.order("created_at", { ascending: false }).order("id", { ascending: false });
    return q;
  });

  // Fetch manage_funnel_events
  const manageFunnelEvents = await fetchAllRows<{
    event_type: string;
    agency_id: string;
    created_at: string;
  }>("funnel_steps:manage_funnel_events", () => {
    // deno-lint-ignore no-explicit-any
    let mq: any = supabase
      .from("manage_funnel_events")
      .select("event_type, agency_id, created_at")
      .gte("created_at", since);
    if (until) mq = mq.lte("created_at", until);
    mq = mq.order("created_at", { ascending: false }).order("id", { ascending: false });
    return mq;
  });

  console.log(`[funnel_steps] loaded ${all.length} sessions, ${manageFunnelEvents.length} manage_funnel_events`);

  const total = all.length + manageFunnelEvents.length;

  const paidCount = all.filter(
    (s) => s.stage === "paid" || s.payment_status === "paid"
  ).length;

  const STEP_THRESHOLDS = [
    { step: 0,   label: "All Sessions" },
    { step: 30,  label: 'Your-agency profile — Viewed agency profile' },
    { step: 50,  label: 'Owner preview — Viewed state page' },
    { step: 80,  label: 'Owner preview — Opened availability modal' },
    { step: 130, label: 'Owner preview — Clicked "activate your listing now"' },
    { step: 140, label: 'Activation offer — Viewed offer page' },
    { step: 150, label: 'Checkout — Opened Stripe checkout' },
    { step: 999, label: 'Sale — Listing activated' },
  ];

  const steps = STEP_THRESHOLDS.map((t) => ({
    step:  t.step,
    label: t.label,
    count: t.step === 999
      ? paidCount
      : all.filter((s) => (s.step_number ?? 0) >= t.step).length,
  }));

  // ── Manage funnel steps ────────────────────────────────────────────────────
  const manageOpenedCount = manageFunnelEvents.filter(e => e.event_type === "manage_funnel_opened").length;
  const manageRemoveIntentCount = manageFunnelEvents.filter(e => e.event_type === "manage_remove_started").length;
  const manageRecoveredCount = manageFunnelEvents.filter(e => e.event_type === "manage_recovered").length;
  const manageRemovedCount = manageFunnelEvents.filter(e => e.event_type === "manage_remove_confirmed").length;

  const manageFunnelSteps = [
    { step: 1, label: 'Manage listing — Opened manage listing', count: manageOpenedCount },
    { step: 2, label: 'Manage listing — Started removal', count: manageRemoveIntentCount },
    { step: 3, label: 'Manage listing — Recovered listing', count: manageRecoveredCount },
    { step: 4, label: 'Manage listing — Confirmed removal', count: manageRemovedCount },
  ];

  const stepDist: Record<number, number> = {};
  for (const s of all) {
    const sn = s.step_number ?? 0;
    stepDist[sn] = (stepDist[sn] || 0) + 1;
  }
  const STEP_LABELS: Record<number, string> = {
    0:   "No Step",
    10:  'Your-agency profile — Viewed landing page',
    20:  'Your-agency profile — Submitted search',
    30:  'Your-agency profile — Viewed agency profile',
    40:  'Your-agency profile — Clicked "See my listing"',
    50:  'Owner preview — Viewed state page',
    60:  'Owner preview — Clicked "Scroll to my listing"',
    70:  'Owner preview — Opened availability form',
    80:  'Owner preview — Opened availability modal',
    90:  'Owner preview — Submitted availability form',
    100: 'Owner preview — Viewed availability result',
    110: 'Activation offer — Viewed upsell',
    120: 'Owner preview — Viewed missed clients page',
    130: 'Owner preview — Clicked "activate your listing now"',
    140: 'Activation offer — Viewed offer page',
    150: 'Checkout — Opened Stripe checkout',
    160: 'Sale — Listing activated',
  };
  const dropOff = Object.entries(stepDist)
    .map(([step, count]) => ({
      step:  parseInt(step),
      label: STEP_LABELS[parseInt(step)] || `Step ${step}`,
      count,
    }))
    .sort((a, b) => b.count - a.count);

  const sourceMap: Record<string, number> = {};
  for (const s of all) {
    const src = deriveSource(s);
    sourceMap[src] = (sourceMap[src] || 0) + 1;
  }
  // Add manage funnel events to sources
  if (manageFunnelEvents.length > 0) {
    sourceMap["Manage Funnel"] = manageFunnelEvents.length;
  }
  const sources = Object.entries(sourceMap)
    .map(([source, count]) => ({ source, count }))
    .sort((a, b) => b.count - a.count);

  const dailyMap: Record<string, number> = {};
  for (const s of all) {
    const day = s.created_at.slice(0, 10);
    dailyMap[day] = (dailyMap[day] || 0) + 1;
  }
  // Add manage funnel events to daily breakdown
  for (const m of manageFunnelEvents) {
    const day = m.created_at.slice(0, 10);
    dailyMap[day] = (dailyMap[day] || 0) + 1;
  }
  const daily = Object.entries(dailyMap)
    .map(([date, count]) => ({ date, count }))
    .sort((a, b) => a.date.localeCompare(b.date));

  // Calculate manage funnel conversion rates
  const manageConversionRate = manageOpenedCount > 0
    ? ((manageRecoveredCount / manageOpenedCount) * 100)
    : 0;
  const manageRemovalConversionRate = manageOpenedCount > 0
    ? ((manageRemovedCount / manageOpenedCount) * 100)
    : 0;

  return {
    total,
    steps,
    drop_off: dropOff,
    sources,
    paid_count: paidCount,
    daily,
    // Manage funnel data
    manage_funnel: {
      steps: manageFunnelSteps,
      conversion_rate: manageConversionRate,
      removal_rate: manageRemovalConversionRate,
      recovery_count: manageRecoveredCount,
      removal_count: manageRemovedCount,
    },
  };
}

// ─── action: agency_detail ────────────────────────────────────────────────────

async function handleAgencyDetail(agencyKey: string, days: number, demoFilter: DemoFilter, sinceDate?: string, untilDate?: string, confidenceFilter = "all") {
  const { since, until } = buildDateRange(days, sinceDate, untilDate);

  const uuidPattern = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  const isUuid = uuidPattern.test(agencyKey);

  // Fetch ALL sessions for this agency in batches
  // deno-lint-ignore no-explicit-any
  const list = await fetchAllRows<Record<string, any>>(
    `agency_detail:${agencyKey.slice(0, 8)}`,
    () => {
      // deno-lint-ignore no-explicit-any
      let q: any = supabase
        .from("funnel_sessions")
        .select("*")
        .or(`created_at.gte.${since},last_event_at.gte.${since}`);

      if (demoFilter === "demo_only") q = q.eq("is_demo", true);
      else if (demoFilter === "no_demo") q = q.or("is_demo.eq.false,is_demo.is.null");
      q = applySessionConfidenceFilter(q, confidenceFilter);

      q = isUuid
        ? q.eq("agency_id", agencyKey)
        : q.eq("agency_slug", agencyKey);

      if (until) q = q.lte("created_at", until);
      q = q.order("created_at", { ascending: false }).order("id", { ascending: false });
      return q;
    }
  );

  console.log(`[agency_detail] loaded ${list.length} sessions for key=${agencyKey.slice(0, 12)}`);

  const paid = list.filter((s) => s.stage === "paid" || s.payment_status === "paid");

  return {
    sessions: list.map((s) => ({
      id:                  s.id,
      funnel_type:         s.funnel_type,
      funnel_name:         s.funnel_name,
      stage:               s.stage,
      agency_name:         s.agency_name,
      agency_slug:         s.agency_slug,
      agency_id:           s.agency_id,
      state_slug:          s.state_slug,
      step_number:         s.step_number,
      entry_path:          s.entry_path,
      purchased_product:   s.purchased_product,
      purchased_amount:    s.purchased_amount,
      upsell_taken:        s.upsell_taken,
      payment_status:      s.payment_status,
      payment_source:      s.payment_source,
      checkout_session_id: s.checkout_session_id,
      last_event_name:     s.last_event_name,
      last_event_at:       s.last_event_at,
      is_demo:             s.is_demo,
      created_at:          s.created_at,
      source_label:        deriveSource(s),
    })),
    totals: {
      total_sessions:  list.length,
      paid_sessions:   paid.length,
      revenue:         paid.reduce((sum, s) => sum + (s.purchased_amount ?? 0), 0) / 100,
      checkout_opens:  list.filter((s) => (s.step_number ?? 0) === 150).length,
      demo_opens:      list.filter((s) => (s.step_number ?? 0) >= 80).length,
      demo_sessions:   list.filter((s) => s.is_demo).length,
    },
  };
}

// ─── action: recent_activity ──────────────────────────────────────────────────
// Intentional limit — this is a live feed, not an analytics aggregate.

async function handleRecentActivity(limit: number, days: number, demoFilter: DemoFilter, sinceDate?: string, untilDate?: string, confidenceFilter = "all") {
  const { since, until } = buildDateRange(days, sinceDate, untilDate);

  // Use or(created_at, last_event_at) consistent with per_agency handler
  let q = supabase
    .from("funnel_sessions")
    .select(
      "id, funnel_type, funnel_name, stage, agency_name, agency_slug, agency_id, " +
      "state_slug, step_number, entry_path, purchased_product, purchased_amount, " +
      "upsell_taken, payment_status, payment_source, checkout_session_id, " +
      "last_event_name, last_event_at, created_at, is_demo, drop_off_step_number"
    )
    .or(`created_at.gte.${since},last_event_at.gte.${since}`);

  q = applyDemoFilter(q as unknown as typeof q & { or: (s: string) => typeof q; eq: (col: string, val: unknown) => typeof q }, demoFilter) as typeof q;
  q = applySessionConfidenceFilter(q, confidenceFilter);

  // Sort by last_event_at first (most recent activity), fallback to created_at
  q = (q as unknown as { order: (col: string, opts: { ascending: boolean; nullsFirst?: boolean }) => typeof q })
    .order("last_event_at", { ascending: false, nullsFirst: false }) as typeof q;
  q = (q as unknown as { limit: (n: number) => typeof q }).limit(limit * 2) as typeof q;  // Fetch more to allow merging
  if (until) q = (q as unknown as { lte: (col: string, val: string) => typeof q }).lte("created_at", until) as typeof q;

  const { data: sessions, error } = await q;
  if (error) return { error: error.message };

  // Fetch manage_funnel_events in parallel
  let mq = supabase
    .from("manage_funnel_events")
    .select("id, event_type, agency_id, agency_slug, agency_name, state_slug, recovery_type, entry_reason, engaged_leads_count, total_interactions, created_at")
    .gte("created_at", since);
  if (until) mq = mq.lte("created_at", until);
  mq = mq.order("created_at", { ascending: false }).limit(limit * 2);

  const { data: manageEvents, error: manageError } = await mq;
  if (manageError) console.warn("[handleRecentActivity] manage_funnel_events fetch failed:", manageError.message);

  // Map sessions to unified format
  const sessionRows = (sessions ?? []).map((s) => {
    const unresolved  = isUnresolvedSession(s);
    const displayName = labelForSession(s);
    return {
      id:                    s.id,
      source:                "funnel_session",
      funnel_type:           s.funnel_type,
      funnel_name:           s.funnel_name,
      stage:                 s.stage,
      agency_name:           s.agency_name    ?? null,
      agency_slug:           s.agency_slug    ?? null,
      agency_id:             s.agency_id      ?? null,
      display_name:          displayName,
      is_unresolved_session: unresolved,
      is_demo:               s.is_demo        ?? false,
      state_slug:            s.state_slug,
      step_number:           s.step_number,
      entry_path:            s.entry_path,
      purchased_product:     s.purchased_product,
      purchased_amount:      s.purchased_amount,
      upsell_taken:          s.upsell_taken,
      payment_status:        s.payment_status,
      payment_source:        s.payment_source,
      checkout_session_id:   s.checkout_session_id,
      last_event_name:       s.last_event_name,
      last_event_at:         s.last_event_at,
      drop_off_step_number:  s.drop_off_step_number,
      created_at:            s.created_at,
      source_label:          deriveSource(s),
      event_type:            null,
    };
  });

  // Map manage_funnel_events to unified format
  const manageRows = (manageEvents ?? []).map((m) => {
    const eventLabels: Record<string, string> = {
      "manage_funnel_opened": "Opened Manage Page",
      "manage_remove_started": "Removal Intent",
      "manage_recovered": m.recovery_type === "activate" ? "Activated Listing" : "Kept Visible",
      "manage_remove_confirmed": "Confirmed Removal",
    };

    return {
      id:                    m.id,
      source:                "manage",
      funnel_type:           "manage",
      funnel_name:           "Manage Funnel",
      stage:                 m.event_type,
      agency_name:           m.agency_name    ?? null,
      agency_slug:           m.agency_slug    ?? null,
      agency_id:             m.agency_id      ?? null,
      display_name:          eventLabels[m.event_type] || m.event_type,
      is_unresolved_session: false,
      is_demo:               false,
      state_slug:            m.state_slug,
      step_number:           null,
      entry_path:            null,
      purchased_product:     null,
      purchased_amount:      null,
      upsell_taken:          null,
      payment_status:        null,
      payment_source:        null,
      checkout_session_id:   null,
      last_event_name:       eventLabels[m.event_type] || m.event_type,
      last_event_at:         m.created_at,
      drop_off_step_number:  null,
      created_at:            m.created_at,
      source_label:          "Manage Funnel",
      event_type:            m.event_type,
    };
  });

  // Merge and sort by created_at DESC
  const allRows = [...sessionRows, ...manageRows]
    .sort((a, b) => {
      const aTime = a.last_event_at || a.created_at;
      const bTime = b.last_event_at || b.created_at;
      return bTime.localeCompare(aTime);
    })
    .slice(0, limit);  // Apply final limit after merging

  return { sessions: allRows };
}

// ─── action: recent_events ────────────────────────────────────────────────────
// Intentional limit — this is a live event stream, not an analytics aggregate.

const RECENT_EVENT_STEP_LABELS: Record<number, string> = {
  10:  'Your-agency profile — Viewed landing page',
  20:  'Your-agency profile — Submitted search',
  25:  'Your-agency profile — Clicked profile card',
  30:  'Your-agency profile — Viewed agency profile',
  40:  'Your-agency ledger — Clicked "Start receiving these clients"',
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
  150: 'Checkout — Opened Stripe checkout',
  160: 'Sale — Listing activated',
};

async function handleRecentEvents(limit: number, days: number, demoFilter: DemoFilter, sinceDate?: string, untilDate?: string) {
  const { since, until } = buildDateRange(days, sinceDate, untilDate);

  let q = supabase
    .from("funnel_events")
    .select("id, fsid, session_id, event_name, step_number, page_path, is_demo, created_at, metadata, lead_email, funnel_name, funnel_type, state_slug")
    .gte("created_at", since)
    .not("step_number", "is", null)
    .gt("step_number", 0);

  if (until) {
    q = (q as unknown as { lte: (col: string, val: string) => typeof q }).lte("created_at", until) as typeof q;
  }

  if (demoFilter === "demo_only") {
    q = (q as unknown as { eq: (col: string, val: unknown) => typeof q }).eq("is_demo", true) as typeof q;
  } else if (demoFilter === "no_demo") {
    q = (q as unknown as { or: (s: string) => typeof q }).or("is_demo.eq.false,is_demo.is.null") as typeof q;
  }

  q = (q as unknown as { order: (col: string, opts: { ascending: boolean }) => typeof q })
    .order("created_at", { ascending: false }) as typeof q;
  q = (q as unknown as { limit: (n: number) => typeof q }).limit(limit) as typeof q;

  const { data: events, error } = await q;
  if (error) return { error: error.message };

  const sessionIds = [...new Set((events ?? []).map((e) => e.session_id).filter(Boolean))];
  const sessionMap = new Map<string, { agency_name: string | null; agency_slug: string | null; agency_id: string | null; stage: string | null }>();

  if (sessionIds.length > 0) {
    const { data: sessions } = await supabase
      .from("funnel_sessions")
      .select("id, agency_name, agency_slug, agency_id, stage")
      .in("id", sessionIds);

    for (const s of sessions ?? []) {
      sessionMap.set(s.id, {
        agency_name: s.agency_name,
        agency_slug: s.agency_slug,
        agency_id:   s.agency_id,
        stage:       s.stage,
      });
    }
  }

  const dedupSeen = new Set<string>();
  const deduped: typeof events = [];
  for (const e of (events ?? [])) {
    const meta = (e.metadata as Record<string, unknown>) ?? {};
    const fsid = e.fsid ?? (meta.fsid as string) ?? e.session_id ?? "";
    const oiid = (meta.open_instance_id as string) ?? "";

    let dedupKey: string;
    if (oiid) {
      dedupKey = `${fsid}::${e.event_name}::${oiid}`;
    } else {
      const step = e.step_number ?? 0;
      const agencyId = (meta.agency_id as string) ?? "";
      const stSlug = e.state_slug ?? "";
      const token = (meta.token as string) ?? "";
      const ts5s = Math.floor(new Date(e.created_at).getTime() / 5000);
      dedupKey = `${fsid}::${e.event_name}::${step}::${agencyId}::${stSlug}::${token}::${ts5s}`;
    }

    if (dedupSeen.has(dedupKey)) continue;
    dedupSeen.add(dedupKey);
    deduped.push(e);
  }

  const rows = deduped.map((e) => {
    const sess = e.session_id ? sessionMap.get(e.session_id) ?? null : null;
    const meta = (e.metadata as Record<string, unknown>) ?? {};
    return {
      id:           e.id,
      session_id:   e.session_id,
      event_name:   e.event_name,
      step_number:  e.step_number,
      step_label:   RECENT_EVENT_STEP_LABELS[e.step_number as number] ?? e.event_name,
      agency_name:  (meta.agency_name as string | null) ?? sess?.agency_name ?? null,
      agency_slug:  sess?.agency_slug ?? null,
      agency_id:    (meta.agency_id as string | null) ?? sess?.agency_id ?? null,
      state_slug:   e.state_slug ?? null,
      is_demo:      e.is_demo ?? false,
      stage:        sess?.stage ?? null,
      lead_email:   e.lead_email ?? null,
      page_path:    e.page_path ?? null,
      search_query: (meta.search_query as string | null) ?? null,
      funnel_name:  e.funnel_name ?? null,
      created_at:   e.created_at,
    };
  });

  return { events: rows };
}

// ─── action: recent_manage_funnel ─────────────────────────────────────────────
// Fetches recent manage_funnel_events for live feed display.

async function handleRecentManageFunnel(limit: number, days: number, sinceDate?: string, untilDate?: string) {
  const { since, until } = buildDateRange(days, sinceDate, untilDate);

  let q = supabase
    .from("manage_funnel_events")
    .select("id, event_type, agency_id, agency_slug, agency_name, state_slug, recovery_type, entry_reason, engaged_leads_count, total_interactions, engagement_hint, created_at")
    .gte("created_at", since);

  if (until) {
    q = (q as unknown as { lte: (col: string, val: string) => typeof q }).lte("created_at", until) as typeof q;
  }

  q = (q as unknown as { order: (col: string, opts: { ascending: boolean }) => typeof q })
    .order("created_at", { ascending: false }) as typeof q;
  q = (q as unknown as { limit: (n: number) => typeof q }).limit(limit) as typeof q;

  const { data: events, error } = await q;
  if (error) return { error: error.message };

  const rows = (events ?? []).map((e) => {
    let eventLabel = "";
    let eventBadge = "";
    let eventColor = "";

    switch (e.event_type) {
      case "manage_funnel_opened":
        eventLabel = "Opened Manage Page";
        eventBadge = "Funnel Entry";
        eventColor = "blue";
        break;
      case "manage_remove_started":
        eventLabel = "Removal Intent";
        eventBadge = "High Intent";
        eventColor = "red";
        break;
      case "manage_recovered":
        eventLabel = e.recovery_type === "activate" ? "Activated Listing" : "Kept Visible";
        eventBadge = "Recovery";
        eventColor = "green";
        break;
      case "manage_remove_confirmed":
        eventLabel = "Confirmed Removal";
        eventBadge = "Removed";
        eventColor = "gray";
        break;
      default:
        eventLabel = e.event_type;
        eventBadge = "Unknown";
        eventColor = "gray";
    }

    return {
      id:                    e.id,
      event_type:            e.event_type,
      event_label:           eventLabel,
      event_badge:           eventBadge,
      event_color:           eventColor,
      agency_id:             e.agency_id,
      agency_slug:           e.agency_slug ?? null,
      agency_name:           e.agency_name,
      state_slug:            e.state_slug ?? null,
      recovery_type:         e.recovery_type ?? null,
      entry_reason:          e.entry_reason ?? null,
      engaged_leads_count:   e.engaged_leads_count ?? 0,
      total_interactions:    e.total_interactions ?? 0,
      engagement_hint:       e.engagement_hint ?? null,
      created_at:            e.created_at,
    };
  });

  return { events: rows };
}

// ─── action: activation_upgrade_breakdown ─────────────────────────────────────
// Aggregates the new activation/upsell tracking events into per-event counts
// with metadata-grouped breakdowns and CTR calculations.
//
// Canonical events:
//   - activation_page_viewed
//   - activation_option_clicked                 (grouped by plan / position / price)
//   - standard_upgrade_offer_viewed
//   - standard_upgrade_offer_standard_continued
//   - standard_upgrade_offer_upgrade_clicked
//   - top25_confirm_viewed
//   - top25_confirm_addon_toggled               (grouped by action / addon)
//   - top25_confirm_continue_clicked
//   - checkout_page_viewed                      (treated as checkout_started signal)

const ACTIVATION_UPGRADE_EVENT_NAMES = [
  "activation_page_viewed",
  "activation_option_clicked",
  "standard_upgrade_offer_viewed",
  "standard_upgrade_offer_standard_continued",
  "standard_upgrade_offer_upgrade_clicked",
  "top25_confirm_viewed",
  "top25_confirm_addon_toggled",
  "top25_confirm_continue_clicked",
  "checkout_page_viewed",
] as const;

async function handleActivationUpgradeBreakdown(
  days: number,
  demoFilter: DemoFilter,
  sinceDate?: string,
  untilDate?: string,
  agencyIdFilter?: string,
  stateSlugFilter?: string,
) {
  const { since, until } = buildDateRange(days, sinceDate, untilDate);

  const events = await fetchAllRows<{
    id: string;
    event_name: string;
    metadata: Record<string, unknown> | null;
    is_demo: boolean | null;
    created_at: string;
    agency_id: string | null;
    state_slug: string | null;
  }>("activation_upgrade_breakdown:funnel_events", () => {
    // deno-lint-ignore no-explicit-any
    let q: any = supabase
      .from("funnel_events")
      .select("id, event_name, metadata, is_demo, created_at, agency_id, state_slug")
      .in("event_name", ACTIVATION_UPGRADE_EVENT_NAMES as unknown as string[])
      .gte("created_at", since);

    if (until) q = q.lte("created_at", until);
    if (demoFilter === "demo_only") q = q.eq("is_demo", true);
    else if (demoFilter === "no_demo") q = q.or("is_demo.eq.false,is_demo.is.null");
    if (agencyIdFilter) q = q.eq("agency_id", agencyIdFilter);
    if (stateSlugFilter) q = q.eq("state_slug", stateSlugFilter);

    q = q.order("created_at", { ascending: false }).order("id", { ascending: false });
    return q;
  });

  const counts: Record<string, number> = {};
  for (const name of ACTIVATION_UPGRADE_EVENT_NAMES) counts[name] = 0;

  // activation_option_clicked breakdowns
  const optionByPlan = new Map<string, number>();
  const optionByPosition = new Map<string, number>();
  const optionByPlanPosition = new Map<string, { plan: string; position: string; price: number | null; count: number }>();

  // top25_confirm_addon_toggled breakdowns
  const addonByAction = new Map<string, number>();
  const addonByAddon = new Map<string, number>();

  // checkout_page_viewed breakdowns by source (canonical mapping to the
  // specific funnel step that produced the checkout). Each real Stripe session
  // produces one row (deduped by checkout_session_id in top25-checkout).
  const checkoutBySource: Record<string, number> = {
    standard_upgrade_offer_skip: 0,
    standard_upgrade_offer_converted: 0,
    top25_confirm: 0,
    top25_claim_confirm: 0,
    spotlight_confirm: 0,
    activation_upgrade: 0,
    upsell_modal: 0,
    unknown: 0,
  };

  for (const e of events) {
    const name = e.event_name;
    if (counts[name] === undefined) continue;
    counts[name]++;

    const meta = (e.metadata ?? {}) as Record<string, unknown>;

    if (name === "checkout_page_viewed") {
      const rawSource = meta.checkout_source ?? meta.source;
      const src = typeof rawSource === "string" ? rawSource : "";
      if (src && checkoutBySource[src] !== undefined) {
        checkoutBySource[src]++;
      } else if (src === "top25_confirm_page") {
        checkoutBySource.top25_confirm++;
      } else if (src === "claim_confirm_page") {
        checkoutBySource.top25_claim_confirm++;
      } else if (src === "spotlight_confirm_page") {
        checkoutBySource.spotlight_confirm++;
      } else {
        checkoutBySource.unknown++;
      }
    }

    if (name === "activation_option_clicked") {
      const plan = String(meta.plan ?? "unknown");
      const position = meta.position !== undefined && meta.position !== null ? String(meta.position) : "n/a";
      const priceRaw = meta.price;
      const price = typeof priceRaw === "number" ? priceRaw : (typeof priceRaw === "string" ? Number(priceRaw) : null);

      optionByPlan.set(plan, (optionByPlan.get(plan) ?? 0) + 1);
      optionByPosition.set(position, (optionByPosition.get(position) ?? 0) + 1);

      const key = `${plan}::${position}`;
      const existing = optionByPlanPosition.get(key);
      if (existing) {
        existing.count++;
        if (existing.price === null && price !== null) existing.price = price;
      } else {
        optionByPlanPosition.set(key, { plan, position, price, count: 1 });
      }
    }

    if (name === "top25_confirm_addon_toggled") {
      const action = String(meta.action ?? "unknown");
      const addon = String(meta.addon ?? meta.addon_name ?? "unknown");
      addonByAction.set(action, (addonByAction.get(action) ?? 0) + 1);
      addonByAddon.set(addon, (addonByAddon.get(addon) ?? 0) + 1);
    }
  }

  const pct = (num: number, den: number): number =>
    den > 0 ? Math.round((num / den) * 10000) / 100 : 0;

  const activationViewed = counts["activation_page_viewed"];
  const activationClicked = counts["activation_option_clicked"];
  const standardViewed = counts["standard_upgrade_offer_viewed"];
  const standardContinued = counts["standard_upgrade_offer_standard_continued"];
  const standardUpgraded = counts["standard_upgrade_offer_upgrade_clicked"];
  const confirmViewed = counts["top25_confirm_viewed"];
  const confirmContinued = counts["top25_confirm_continue_clicked"];
  const checkoutStarted = counts["checkout_page_viewed"]; // canonical checkout-open

  // Source-specific checkout rates — each rate uses the matching denominator
  // so mixed historical events don't corrupt specific funnel percentages.
  const standardSkipCheckouts = checkoutBySource.standard_upgrade_offer_skip;
  const standardUpgradeCheckouts = checkoutBySource.standard_upgrade_offer_converted;
  const top25ConfirmCheckouts = checkoutBySource.top25_confirm;

  return {
    since,
    until,
    demo_filter: demoFilter,
    counts,
    conversion: {
      activation_option_ctr_pct: pct(activationClicked, activationViewed),
      standard_upgrade_ctr_pct: pct(standardUpgraded, standardViewed),
      standard_continue_rate_pct: pct(standardContinued, standardViewed),
      top25_confirm_continue_ctr_pct: pct(confirmContinued, confirmViewed),
      // Source-matched checkout rates (denominator aligns with source):
      standard_skip_checkout_rate_pct: pct(standardSkipCheckouts, standardContinued),
      standard_upgrade_checkout_rate_pct: pct(standardUpgradeCheckouts, standardUpgraded),
      top25_confirm_checkout_rate_pct: pct(top25ConfirmCheckouts, confirmContinued),
    },
    checkout_started_count: checkoutStarted,
    checkout_by_source: checkoutBySource,
    breakdowns: {
      activation_option_by_plan: [...optionByPlan.entries()]
        .map(([plan, count]) => ({ plan, count }))
        .sort((a, b) => b.count - a.count),
      activation_option_by_position: [...optionByPosition.entries()]
        .map(([position, count]) => ({ position, count }))
        .sort((a, b) => b.count - a.count),
      activation_option_by_plan_position: [...optionByPlanPosition.values()]
        .map((r) => ({
          plan: r.plan,
          position: r.position,
          price: r.price,
          count: r.count,
          ctr_pct: pct(r.count, activationViewed),
        }))
        .sort((a, b) => b.count - a.count),
      top25_addon_by_action: [...addonByAction.entries()]
        .map(([action, count]) => ({ action, count }))
        .sort((a, b) => b.count - a.count),
      top25_addon_by_addon: [...addonByAddon.entries()]
        .map(([addon, count]) => ({ addon, count }))
        .sort((a, b) => b.count - a.count),
    },
    total_events: events.length,
  };
}

// ─── main handler ─────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url        = new URL(req.url);
    const action     = url.searchParams.get("action") || "per_agency";
    const days       = parseInt(url.searchParams.get("days") || "30", 10);
    const sinceDate  = url.searchParams.get("since_date") || undefined;
    const untilDate  = url.searchParams.get("until_date") || undefined;
    const agencyKey  = url.searchParams.get("agency_key") || url.searchParams.get("agency_id") || "";
    const breakdownAgencyId = url.searchParams.get("breakdown_agency_id") || "";
    const breakdownStateSlug = url.searchParams.get("breakdown_state_slug") || "";
    const sessionId  = url.searchParams.get("session_id") || "";
    const limit      = parseInt(url.searchParams.get("limit") || "150", 10);
    const rawDemo    = url.searchParams.get("demo_filter") || "all";
    const demoFilter: DemoFilter =
      rawDemo === "demo_only" ? "demo_only"
      : rawDemo === "no_demo" ? "no_demo"
      : "all";
    const rawCf = url.searchParams.get("confidence_filter") || "all";
    const confidenceFilter = rawCf === "human_only" ? "likely_human" : rawCf;

    console.log("[agency-funnel-analytics] action:", action, "days:", days, "demo_filter:", demoFilter, "since:", sinceDate);

    let result: unknown;

    switch (action) {
      case "per_agency":
        result = await handlePerAgency(days, demoFilter, sinceDate, untilDate, confidenceFilter);
        break;

      case "session_detail":
        if (!sessionId) {
          return new Response(
            JSON.stringify({ error: "Missing session_id" }),
            { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
          );
        }
        result = await handleSessionDetail(sessionId);
        break;

      case "funnel_steps":
        result = await handleFunnelSteps(days, demoFilter, sinceDate, untilDate, confidenceFilter);
        break;

      case "agency_detail":
        if (!agencyKey) {
          return new Response(
            JSON.stringify({ error: "Missing agency_key" }),
            { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
          );
        }
        result = await handleAgencyDetail(agencyKey, days, demoFilter, sinceDate, untilDate, confidenceFilter);
        break;

      case "recent_activity":
        result = await handleRecentActivity(Math.min(limit, 300), days, demoFilter, sinceDate, untilDate, confidenceFilter);
        break;

      case "recent_events":
        result = await handleRecentEvents(Math.min(limit, 500), days, demoFilter, sinceDate, untilDate);
        break;

      case "recent_manage_funnel":
        result = await handleRecentManageFunnel(Math.min(limit, 300), days, sinceDate, untilDate);
        break;

      case "activation_upgrade_breakdown":
        result = await handleActivationUpgradeBreakdown(
          days,
          demoFilter,
          sinceDate,
          untilDate,
          breakdownAgencyId || undefined,
          breakdownStateSlug || undefined,
        );
        break;

      default:
        return new Response(
          JSON.stringify({ error: `Unknown action: ${action}` }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
    }

    return new Response(JSON.stringify(result), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("[agency-funnel-analytics] Error:", error);
    return new Response(
      JSON.stringify({ error: "Internal server error", details: (error as Error).message }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
