import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

// Fallback only: price ID → total amount in cents for a 6-month billing cycle.
// This map is ONLY used when canonical stripe_prices data is unavailable.
// MRR fallback = cycle_cents / 6 (normalized monthly equivalent)
const PRICE_CYCLE_CENTS_FALLBACK: Record<string, number> = {
  "price_1SaplSIoPJm5BB2XIP4XKqGS": 9700,
  "price_1SZGKxIoPJm5BB2X1My3vHBJ": 19700,
  "price_1SZKW7IoPJm5BB2Xom28TCYo": 24700,
  "price_1SZKecIoPJm5BB2Xf1ZNcRmt": 29700,
  "price_1SZQ3qIoPJm5BB2XVzBy9qRD": 99700,
  "price_1SZPw3IoPJm5BB2Xh8ji6xPt": 3700,
  "price_1SZPzfIoPJm5BB2XKJYYwTlM": 9700,
};

type BillingInterval = "day" | "week" | "month" | "year";

function normalizeToMonthlyCents(
  amountCents: number,
  interval: BillingInterval | null,
  intervalCount: number,
): number {
  if (!interval) return 0;
  const ic = Math.max(1, intervalCount);
  switch (interval) {
    case "month": return Math.round(amountCents / ic);
    case "year":  return Math.round(amountCents / (12 * ic));
    case "week":  return Math.round((amountCents * 52) / (12 * ic));
    case "day":   return Math.round((amountCents * 365) / (12 * ic));
    default:      return 0;
  }
}

function mrrFromFallback(priceId: string | null): number {
  if (!priceId) return 0;
  const cycle = PRICE_CYCLE_CENTS_FALLBACK[priceId];
  if (!cycle) return 0;
  return Math.round(cycle / 6);
}

// CRITICAL: In PostgreSQL, NULL != 'value' evaluates to NULL (not TRUE).
// So .neq("col", "val") silently excludes all NULL rows.
// This is the root cause of count mismatches between tabs.
// We must explicitly include NULL rows: reporting_category IS NULL OR != excluded
// deno-lint-ignore no-explicit-any
function applyNotExcluded(query: any) {
  return query.or(
    "reporting_category.is.null,reporting_category.neq.excluded_legacy_unrelated"
  );
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const url = new URL(req.url);
    const range = url.searchParams.get("range") || "30d";
    const interval = url.searchParams.get("interval") || "day";
    const includeUnresolvedInMrr = url.searchParams.get("include_unresolved") === "true";

    const now = new Date();
    let daysBack = 30;
    if (range === "7d") daysBack = 7;
    else if (range === "30d") daysBack = 30;
    else if (range === "90d") daysBack = 90;
    else if (range === "365d") daysBack = 365;
    else if (range === "all") daysBack = 9999;

    const windowStart = range === "all"
      ? new Date("2020-01-01").toISOString()
      : new Date(now.getTime() - daysBack * 24 * 60 * 60 * 1000).toISOString();

    // ── Orders within date window (excluding legacy) ───────────────────────
    const ordersRaw = supabase
      .from("stripe_orders")
      .select("id, amount_total, payment_status, status, created_at, paid_at, checkout_mode, reporting_category")
      .gte("created_at", windowStart)
      .order("created_at", { ascending: true });

    const { data: orders, error: ordersError } = await applyNotExcluded(ordersRaw);
    if (ordersError) return json({ error: ordersError.message }, 500);

    const allOrders = orders ?? [];
    const paidOrders = allOrders.filter(
      (o) => o.payment_status === "paid" || o.status === "completed"
    );
    const totalRevenueCents = paidOrders.reduce((sum, o) => sum + (o.amount_total ?? 0), 0);
    const aovCents = paidOrders.length > 0 ? Math.round(totalRevenueCents / paidOrders.length) : 0;

    // ── All subscriptions (excluding legacy) for MRR and counts ─────────────
    const subsRaw = supabase
      .from("stripe_subscriptions")
      .select("id, subscription_id, price_id, status, cancel_at_period_end, reporting_category");

    const { data: allSubsRaw, error: subsError } = await applyNotExcluded(subsRaw);
    if (subsError) return json({ error: subsError.message }, 500);

    const allSubs = allSubsRaw ?? [];

    // Active = 'active' OR 'trialing' (both represent currently billing subscriptions)
    const activeSubsArr = allSubs.filter(
      (s) => s.status === "active" || s.status === "trialing"
    );
    const trialingSubsArr = allSubs.filter((s) => s.status === "trialing");
    const cancelledSubsArr = allSubs.filter(
      (s) => s.status === "cancelled" || s.status === "canceled"
    );
    // cancelling = active but scheduled to cancel at period end
    const cancellingSubsArr = allSubs.filter(
      (s) => s.status === "active" && s.cancel_at_period_end
    );
    const pastDueSubsArr = allSubs.filter((s) => s.status === "past_due");
    const unresolvedSubsArr = allSubs.filter(
      (s) => s.status === "incomplete" || s.status === "incomplete_expired" || s.status === "unpaid"
    );

    // ── Canonical MRR: join stripe_subscription_items + stripe_prices ───────
    // Same normalization as stripe-admin-recurring-metrics.
    // Falls back to 6-month hardcoded map only when canonical price row missing.
    const activeSubIds = activeSubsArr
      .map((s) => s.subscription_id)
      .filter((x): x is string => !!x);

    // ── Resolve agency for each active subscription via stripe_orders ───────
    // A sub is "resolved" if subscription_id matches an order with agency_id present.
    const resolvedSubIds = new Set<string>();
    if (activeSubIds.length > 0) {
      const { data: ordersForSubs } = await supabase
        .from("stripe_orders")
        .select("subscription_id, agency_id")
        .in("subscription_id", activeSubIds);
      for (const o of ordersForSubs ?? []) {
        if (o.subscription_id && o.agency_id) {
          resolvedSubIds.add(o.subscription_id);
        }
      }
    }

    // Compute per-subscription MRR contributions (resolved vs unresolved)
    const subMrrContrib = new Map<string, number>();
    const usedCanonical = new Set<string>();

    if (activeSubIds.length > 0) {
      const { data: items } = await supabase
        .from("stripe_subscription_items")
        .select("subscription_id, price_id, quantity, active")
        .in("subscription_id", activeSubIds);

      const itemRows = (items ?? []).filter((i) => i.active !== false);
      const priceIds = Array.from(
        new Set(itemRows.map((i) => i.price_id).filter((x): x is string => !!x))
      );

      const priceMap = new Map<string, {
        unit_amount: number;
        interval: BillingInterval | null;
        interval_count: number;
      }>();

      if (priceIds.length > 0) {
        const { data: prices } = await supabase
          .from("stripe_prices")
          .select("stripe_price_id, unit_amount, recurring_interval, recurring_interval_count")
          .in("stripe_price_id", priceIds);

        for (const p of prices ?? []) {
          priceMap.set(p.stripe_price_id, {
            unit_amount: p.unit_amount ?? 0,
            interval: (p.recurring_interval ?? null) as BillingInterval | null,
            interval_count: p.recurring_interval_count ?? 1,
          });
        }
      }

      for (const item of itemRows) {
        const price = item.price_id ? priceMap.get(item.price_id) : null;
        const qty = Math.max(1, item.quantity ?? 1);
        if (price && price.interval && item.subscription_id) {
          const m = normalizeToMonthlyCents(
            price.unit_amount * qty,
            price.interval,
            price.interval_count,
          );
          subMrrContrib.set(
            item.subscription_id,
            (subMrrContrib.get(item.subscription_id) ?? 0) + m
          );
          usedCanonical.add(item.subscription_id);
        }
      }
    }

    // Fallback for active subs that didn't match canonical items
    for (const s of activeSubsArr) {
      if (!s.subscription_id) continue;
      if (usedCanonical.has(s.subscription_id)) continue;
      const fb = mrrFromFallback(s.price_id);
      if (fb > 0) {
        subMrrContrib.set(
          s.subscription_id,
          (subMrrContrib.get(s.subscription_id) ?? 0) + fb
        );
      }
    }

    // Split MRR into resolved (linked to agency) and unresolved
    let mrrResolvedCents = 0;
    let mrrUnresolvedCents = 0;
    for (const [subId, contrib] of subMrrContrib.entries()) {
      if (resolvedSubIds.has(subId)) {
        mrrResolvedCents += contrib;
      } else {
        mrrUnresolvedCents += contrib;
      }
    }

    // Default: only resolved counted; opt-in toggle includes unresolved
    const mrrCents = includeUnresolvedInMrr
      ? mrrResolvedCents + mrrUnresolvedCents
      : mrrResolvedCents;
    const yrrCents = mrrCents * 12;

    const includedSubCount = activeSubsArr.filter(
      (s) => s.subscription_id && resolvedSubIds.has(s.subscription_id)
    ).length;
    const unresolvedActiveSubCount = activeSubsArr.filter(
      (s) => !s.subscription_id || !resolvedSubIds.has(s.subscription_id)
    ).length;

    // ── Timeseries: group paid orders into date buckets ────────────────────
    type Bucket = { date: string; revenue: number; orders: number };
    const buckets = new Map<string, Bucket>();

    for (const order of paidOrders) {
      const d = new Date(order.paid_at || order.created_at);
      let key: string;
      if (interval === "week") {
        const weekStart = new Date(d);
        weekStart.setDate(d.getDate() - d.getDay());
        key = weekStart.toISOString().slice(0, 10);
      } else if (interval === "month") {
        key = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-01`;
      } else {
        key = d.toISOString().slice(0, 10);
      }
      const existing = buckets.get(key) || { date: key, revenue: 0, orders: 0 };
      existing.revenue += order.amount_total ?? 0;
      existing.orders += 1;
      buckets.set(key, existing);
    }

    const timeseries = Array.from(buckets.values()).sort((a, b) =>
      a.date.localeCompare(b.date)
    );

    // ── All-time totals (not range-filtered) ───────────────────────────────
    // IMPORTANT: the OR for paid/completed must be combined correctly,
    // then the legacy exclusion applied on top.
    const allTimeRaw = supabase
      .from("stripe_orders")
      .select("amount_total")
      .or("payment_status.eq.paid,status.eq.completed");

    const { data: allTimePaid } = await applyNotExcluded(allTimeRaw);
    const allTimeRevenueCents = (allTimePaid ?? []).reduce(
      (sum, o) => sum + (o.amount_total ?? 0),
      0
    );

    // ── Refunds within window ──────────────────────────────────────────────
    const { data: refundsRows } = await supabase
      .from("stripe_refunds")
      .select("amount_cents, status, created_at")
      .gte("created_at", windowStart);

    const succeededRefunds = (refundsRows ?? []).filter((r) => r.status === "succeeded");
    const refundedCents = succeededRefunds.reduce((s, r) => s + (r.amount_cents ?? 0), 0);
    const refundCount = succeededRefunds.length;

    // ── Disputes within window ─────────────────────────────────────────────
    const { data: disputeRows } = await supabase
      .from("stripe_disputes")
      .select("amount_cents, status, won, created_at")
      .gte("created_at", windowStart);

    const allDisputes = disputeRows ?? [];
    const openDisputes = allDisputes.filter(
      (d) =>
        d.status === "warning_needs_response" ||
        d.status === "warning_under_review" ||
        d.status === "needs_response" ||
        d.status === "under_review"
    );
    const lostDisputes = allDisputes.filter((d) => d.status === "lost");
    const wonDisputes = allDisputes.filter((d) => d.status === "won");
    const disputedOpenCents = openDisputes.reduce((s, d) => s + (d.amount_cents ?? 0), 0);
    const disputeLostCents = lostDisputes.reduce((s, d) => s + (d.amount_cents ?? 0), 0);

    const grossRevenueCents = totalRevenueCents;
    const netRevenueCents = grossRevenueCents - refundedCents - disputeLostCents;

    return json({
      ok: true,
      range,
      interval,
      window_start: windowStart,
      metrics: {
        total_revenue_cents: totalRevenueCents,
        all_time_revenue_cents: allTimeRevenueCents,
        gross_revenue_cents: grossRevenueCents,
        net_revenue_cents: netRevenueCents,
        refunded_cents: refundedCents,
        refund_cents: refundedCents,
        disputed_open_cents: disputedOpenCents,
        open_dispute_cents: disputedOpenCents,
        dispute_lost_cents: disputeLostCents,
        lost_dispute_cents: disputeLostCents,
        refund_count: refundCount,
        dispute_count: allDisputes.length,
        open_dispute_count: openDisputes.length,
        lost_dispute_count: lostDisputes.length,
        won_dispute_count: wonDisputes.length,
        paid_order_count: paidOrders.length,
        total_order_count: allOrders.length,
        aov_cents: aovCents,
        mrr_cents: mrrCents,
        yrr_cents: yrrCents,
        mrr_resolved_cents: mrrResolvedCents,
        unresolved_mrr_cents: mrrUnresolvedCents,
        include_unresolved_in_mrr: includeUnresolvedInMrr,
        included_subscription_count: includedSubCount,
        excluded_subscription_count: unresolvedActiveSubCount,
        unresolved_subscription_count: unresolvedActiveSubCount,
        active_sub_count: activeSubsArr.length,
        trialing_sub_count: trialingSubsArr.length,
        cancelled_sub_count: cancelledSubsArr.length,
        cancelling_sub_count: cancellingSubsArr.length,
        past_due_sub_count: pastDueSubsArr.length,
        unresolved_sub_count: unresolvedSubsArr.length,
      },
      timeseries,
    });
  } catch (e) {
    console.error("[stripe-admin-metrics] Error:", e);
    return json({ error: String(e instanceof Error ? e.message : e) }, 500);
  }
});
