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

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const url = new URL(req.url);
    const search = (url.searchParams.get("search") || "").trim().toLowerCase();
    const includeExcluded = url.searchParams.get("include_excluded") === "true";
    const page = Math.max(1, parseInt(url.searchParams.get("page") || "1", 10));
    const limit = Math.min(100, Math.max(1, parseInt(url.searchParams.get("limit") || "50", 10)));
    const offset = (page - 1) * limit;
    const orderId = url.searchParams.get("id");

    // Single order lookup
    if (orderId) {
      const { data, error } = await supabase
        .from("stripe_orders")
        .select("*")
        .eq("id", orderId)
        .maybeSingle();
      if (error) return json({ error: error.message }, 500);
      return json({ ok: true, order: data });
    }

    // List orders
    let query = supabase
      .from("stripe_orders")
      .select("*", { count: "exact" })
      .order("created_at", { ascending: false });

    if (!includeExcluded) {
      query = query.neq("reporting_category", "excluded_legacy_unrelated");
    }

    if (search) {
      query = query.or([
        `agency_name.ilike.%${search}%`,
        `customer_email.ilike.%${search}%`,
        `customer_name.ilike.%${search}%`,
        `checkout_session_id.ilike.%${search}%`,
        `subscription_id.ilike.%${search}%`,
        `state_slug.ilike.%${search}%`,
        `product_summary.ilike.%${search}%`,
      ].join(","));
    }

    const { data, error, count } = await query.range(offset, offset + limit - 1);

    if (error) {
      console.error("[stripe-admin-orders] Query error:", error.message);
      return json({ error: error.message }, 500);
    }

    const orderRows = data ?? [];
    const orderIds = orderRows.map((o) => o.id).filter((x) => x != null);

    // Aggregate refunds & disputes per order for badges/net
    const refundAgg = new Map<
      number,
      { refunded_cents: number; succeeded_count: number; pending_count: number }
    >();
    const disputeAgg = new Map<
      number,
      {
        open_cents: number;
        lost_cents: number;
        won_cents: number;
        open_count: number;
        lost_count: number;
        won_count: number;
      }
    >();

    if (orderIds.length > 0) {
      const [{ data: refunds }, { data: disputes }] = await Promise.all([
        supabase
          .from("stripe_refunds")
          .select("stripe_order_id, amount_cents, status")
          .in("stripe_order_id", orderIds),
        supabase
          .from("stripe_disputes")
          .select("stripe_order_id, amount_cents, status, won")
          .in("stripe_order_id", orderIds),
      ]);

      for (const r of refunds ?? []) {
        if (!r.stripe_order_id) continue;
        const cur = refundAgg.get(r.stripe_order_id) ?? {
          refunded_cents: 0,
          succeeded_count: 0,
          pending_count: 0,
        };
        if (r.status === "succeeded") {
          cur.refunded_cents += r.amount_cents ?? 0;
          cur.succeeded_count += 1;
        } else if (r.status === "pending") {
          cur.pending_count += 1;
        }
        refundAgg.set(r.stripe_order_id, cur);
      }

      for (const d of disputes ?? []) {
        if (!d.stripe_order_id) continue;
        const cur = disputeAgg.get(d.stripe_order_id) ?? {
          open_cents: 0,
          lost_cents: 0,
          won_cents: 0,
          open_count: 0,
          lost_count: 0,
          won_count: 0,
        };
        const status = (d.status ?? "").toLowerCase();
        const isLost = status === "lost" || d.won === false;
        const isWon = status === "won" || d.won === true;
        const isOpen =
          !isLost &&
          !isWon &&
          (status.includes("needs_response") ||
            status.includes("under_review") ||
            status === "warning_needs_response" ||
            status === "warning_under_review" ||
            status === "");
        const amount = d.amount_cents ?? 0;
        if (isLost) {
          cur.lost_cents += amount;
          cur.lost_count += 1;
        } else if (isWon) {
          cur.won_cents += amount;
          cur.won_count += 1;
        } else if (isOpen) {
          cur.open_cents += amount;
          cur.open_count += 1;
        }
        disputeAgg.set(d.stripe_order_id, cur);
      }
    }

    const enriched = orderRows.map((o) => {
      const r = refundAgg.get(o.id) ?? { refunded_cents: 0, succeeded_count: 0, pending_count: 0 };
      const d = disputeAgg.get(o.id) ?? {
        open_cents: 0,
        lost_cents: 0,
        won_cents: 0,
        open_count: 0,
        lost_count: 0,
        won_count: 0,
      };
      const gross = o.amount_total ?? 0;
      const netCents = Math.max(0, gross - r.refunded_cents - d.lost_cents);
      const hasRefund = r.refunded_cents > 0;
      const hasPartialRefund = hasRefund && r.refunded_cents < gross;
      const hasFullRefund = hasRefund && gross > 0 && r.refunded_cents >= gross;
      return {
        ...o,
        refunded_cents: r.refunded_cents,
        refund_count: r.succeeded_count,
        disputed_open_cents: d.open_cents,
        disputed_lost_cents: d.lost_cents,
        disputed_won_cents: d.won_cents,
        dispute_open_count: d.open_count,
        dispute_lost_count: d.lost_count,
        dispute_won_count: d.won_count,
        net_cents: netCents,
        has_refund: hasRefund,
        has_partial_refund: hasPartialRefund,
        has_full_refund: hasFullRefund,
        has_open_dispute: d.open_count > 0,
        has_lost_dispute: d.lost_count > 0,
      };
    });

    return json({
      ok: true,
      orders: enriched,
      total: count ?? 0,
      page,
      limit,
      pages: Math.ceil((count ?? 0) / limit),
      has_next: offset + limit < (count ?? 0),
      has_prev: page > 1,
    });
  } catch (e) {
    console.error("[stripe-admin-orders] Error:", e);
    return json({ error: String(e instanceof Error ? e.message : e) }, 500);
  }
});
