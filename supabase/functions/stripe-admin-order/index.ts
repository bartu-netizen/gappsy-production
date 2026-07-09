import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@17.7.0";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";
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
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: corsHeaders });

  const authResult = await authenticateAdmin(req);
  if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

  const stripeSecret = Deno.env.get("STRIPE_SECRET_KEY");
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    { auth: { autoRefreshToken: false, persistSession: false } }
  );

  const url = new URL(req.url);
  const checkoutSessionId = url.searchParams.get("checkout_session_id");
  const paymentIntentId = url.searchParams.get("payment_intent_id");
  const orderId = url.searchParams.get("id");

  if (!checkoutSessionId && !paymentIntentId && !orderId) {
    return json({ error: "Provide checkout_session_id, payment_intent_id, or id" }, 400);
  }

  try {
    // ── Fetch order row ───────────────────────────────────────────────────────
    let orderQuery = supabase.from("stripe_orders").select("*");
    if (checkoutSessionId) orderQuery = orderQuery.eq("checkout_session_id", checkoutSessionId);
    else if (paymentIntentId) orderQuery = orderQuery.eq("payment_intent_id", paymentIntentId);
    else orderQuery = orderQuery.eq("id", orderId);

    const { data: order, error: orderErr } = await orderQuery.maybeSingle();
    if (orderErr) return json({ error: orderErr.message }, 500);
    if (!order) return json({ error: "Order not found" }, 404);

    // ── Fetch customer ────────────────────────────────────────────────────────
    let customer = null;
    if (order.customer_id) {
      const { data: cust } = await supabase
        .from("stripe_customers")
        .select("*")
        .eq("customer_id", order.customer_id)
        .maybeSingle();
      customer = cust;
    }

    // ── Fetch line items (DB first, fallback to Stripe live) ─────────────────
    let lineItems: unknown[] = [];
    const { data: dbItems } = await supabase
      .from("stripe_order_items")
      .select("*")
      .eq("stripe_checkout_session_id", order.checkout_session_id ?? "")
      .order("id", { ascending: true });

    if (dbItems && dbItems.length > 0) {
      lineItems = dbItems;
    } else if (stripeSecret && order.checkout_session_id) {
      try {
        const stripe = new Stripe(stripeSecret, { appInfo: { name: "Gappsy Admin", version: "1.0.0" } });
        const items = await stripe.checkout.sessions.listLineItems(order.checkout_session_id, {
          limit: 100,
          expand: ["data.price.product"],
        });
        lineItems = items.data;
      } catch (_) {}
    }

    // ── Fetch invoice (DB first, fallback to Stripe live) ────────────────────
    let invoice = null;
    if (order.invoice_id) {
      const { data: dbInv } = await supabase
        .from("stripe_invoices")
        .select("stripe_invoice_id, hosted_invoice_url, invoice_pdf, status, amount_paid, amount_due, currency, customer_email")
        .eq("stripe_invoice_id", order.invoice_id)
        .maybeSingle();
      invoice = dbInv;

      if (!invoice && stripeSecret) {
        try {
          const stripe = new Stripe(stripeSecret, { appInfo: { name: "Gappsy Admin", version: "1.0.0" } });
          const inv = await stripe.invoices.retrieve(order.invoice_id);
          invoice = {
            stripe_invoice_id: inv.id,
            hosted_invoice_url: inv.hosted_invoice_url,
            invoice_pdf: inv.invoice_pdf,
            status: inv.status,
            amount_paid: inv.amount_paid,
            amount_due: inv.amount_due,
            currency: inv.currency,
            customer_email: inv.customer_email,
          };
        } catch (_) {}
      }
    }

    // ── Build Stripe dashboard URLs ───────────────────────────────────────────
    const livemode = order.livemode ?? false;
    const stripeDashBase = livemode
      ? "https://dashboard.stripe.com"
      : "https://dashboard.stripe.com/test";

    const stripeUrls: Record<string, string | null> = {
      payment_intent: order.payment_intent_id
        ? `${stripeDashBase}/payments/${order.payment_intent_id}`
        : null,
      checkout_session: order.checkout_session_id
        ? `${stripeDashBase}/checkout/sessions/${order.checkout_session_id}`
        : null,
      customer: order.customer_id
        ? `${stripeDashBase}/customers/${order.customer_id}`
        : null,
      invoice: order.invoice_id
        ? `${stripeDashBase}/invoices/${order.invoice_id}`
        : null,
    };

    // ── Fetch funnel session if submission_id exists ──────────────────────────
    let funnelSession = null;
    if (order.submission_id || order.checkout_session_id) {
      const fq = supabase
        .from("funnel_sessions")
        .select("id, stage, funnel_type, state_slug, lead_email, lead_name, agency_name, selected_offer, selected_upsell, dropoff_path, dropoff_stage, last_event_name, last_event_at, amount_total, currency, created_at")
        .order("created_at", { ascending: false })
        .limit(1);

      const { data: fs } = order.checkout_session_id
        ? await fq.eq("checkout_session_id", order.checkout_session_id).maybeSingle()
        : order.submission_id
        ? await fq.eq("submission_id", order.submission_id).maybeSingle()
        : { data: null };

      funnelSession = fs;
    }

    return json({
      order,
      customer,
      lineItems,
      invoice,
      stripeUrls,
      funnelSession,
    });
  } catch (err: any) {
    console.error("[stripe-admin-order] error:", err.message);
    return json({ error: err.message }, 500);
  }
});
