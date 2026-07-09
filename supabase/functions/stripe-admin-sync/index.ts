import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@17.7.0";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function buildProductSummary(meta: Record<string, string>): string {
  const parts: string[] = [];
  if (meta.listingType) parts.push(meta.listingType);
  if (meta.rank) parts.push(`Rank #${meta.rank}`);
  if (meta.stateSlug) parts.push(meta.stateSlug);
  return parts.join(" · ");
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: corsHeaders });

  const authResult = await authenticateAdmin(req);
  if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

  const stripeSecret = Deno.env.get("STRIPE_SECRET_KEY");
  if (!stripeSecret) return json({ error: "STRIPE_SECRET_KEY not configured" }, 500);

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    { auth: { autoRefreshToken: false, persistSession: false } }
  );

  const stripe = new Stripe(stripeSecret, { appInfo: { name: "Gappsy Admin Sync", version: "2.0.0" } });

  let body: { days?: number } = {};
  try { body = await req.json(); } catch (_) {}
  const days = Math.min(body.days ?? 90, 180);
  const since = Math.floor((Date.now() / 1000) - days * 86400);

  let syncedOrders = 0;
  let syncedSubscriptionOrders = 0;
  let repairedOrders = 0;
  let syncedItems = 0;
  let syncedInvoices = 0;
  let syncedCustomers = 0;
  const errors: string[] = [];

  try {
    // ── 1. Sync checkout sessions (payment AND subscription modes) ───────────
    let hasMore = true;
    let startingAfter: string | undefined;

    while (hasMore) {
      const sessions = await stripe.checkout.sessions.list({
        limit: 100,
        created: { gte: since },
        ...(startingAfter ? { starting_after: startingAfter } : {}),
        expand: ["data.customer"],
      }) as Stripe.ApiList<Stripe.Checkout.Session>;

      for (const session of sessions.data) {
        try {
          const customerId = typeof session.customer === "string" ? session.customer : session.customer?.id ?? null;
          const customerEmail = session.customer_email ?? session.customer_details?.email ?? (session.customer as Stripe.Customer | null)?.email ?? null;
          const customerName = session.customer_details?.name ?? (session.customer as Stripe.Customer | null)?.name ?? null;
          const piId = typeof session.payment_intent === "string" ? session.payment_intent : session.payment_intent?.id ?? null;
          const subId = typeof session.subscription === "string" ? session.subscription : (session.subscription as any)?.id ?? null;
          const meta = session.metadata ?? {};
          const productSummary = buildProductSummary(meta as Record<string, string>);

          if (session.mode === "payment" && session.payment_status === "paid") {
            // ── One-time payment: existing behaviour ──────────────────────────
            const { error: orderErr } = await supabase.from("stripe_orders").upsert({
              checkout_session_id: session.id,
              payment_intent_id: piId,
              customer_id: customerId ?? "",
              customer_email: customerEmail,
              customer_name: customerName,
              amount_subtotal: session.amount_subtotal ?? 0,
              amount_total: session.amount_total ?? 0,
              currency: session.currency ?? "usd",
              payment_status: session.payment_status,
              status: "completed",
              livemode: session.livemode,
              state_slug: meta.stateSlug ?? null,
              funnel_type: meta.listingType ?? null,
              source_listing_type: meta.listingType ?? null,
              submission_id: meta.submissionId ?? null,
              metadata: meta,
              product_summary: productSummary || null,
              checkout_mode: "payment",
              stripe_created_at: new Date(session.created * 1000).toISOString(),
            }, { onConflict: "checkout_session_id" });

            if (orderErr) { errors.push(`order ${session.id}: ${orderErr.message}`); }
            else {
              syncedOrders++;
              console.info(`[stripe-admin-sync] Synced payment order ${session.id}`);
            }

            // Sync line items
            if (session.id) {
              try {
                const lineItems = await stripe.checkout.sessions.listLineItems(session.id, {
                  limit: 100,
                  expand: ["data.price.product"],
                });
                await supabase.from("stripe_order_items").delete().eq("stripe_checkout_session_id", session.id);
                const items = lineItems.data.map((item) => {
                  const price = item.price as Stripe.Price | null;
                  const product = price?.product as Stripe.Product | null;
                  return {
                    stripe_checkout_session_id: session.id,
                    stripe_payment_intent_id: piId,
                    stripe_customer_id: customerId,
                    price_id: price?.id ?? null,
                    product_id: typeof price?.product === "string" ? price.product : product?.id ?? null,
                    description: item.description ?? product?.name ?? null,
                    quantity: item.quantity ?? 1,
                    amount_subtotal: item.amount_subtotal ?? 0,
                    amount_total: item.amount_total ?? 0,
                    currency: session.currency ?? "usd",
                    metadata: (product?.metadata ?? {}) as any,
                  };
                });
                if (items.length > 0) {
                  const { error: itemErr } = await supabase.from("stripe_order_items").insert(items);
                  if (itemErr) errors.push(`items ${session.id}: ${itemErr.message}`);
                  else syncedItems += items.length;
                }
              } catch (lineErr: any) {
                errors.push(`line_items ${session.id}: ${lineErr.message}`);
              }
            }

          } else if (session.mode === "subscription") {
            // ── Subscription checkout: always upsert row ──────────────────────
            const isPaid = session.payment_status === "paid";
            const orderStatus = isPaid ? "completed" : "subscription_pending";

            const { error: orderErr } = await supabase.from("stripe_orders").upsert({
              checkout_session_id: session.id,
              payment_intent_id: piId,
              customer_id: customerId ?? "",
              customer_email: customerEmail,
              customer_name: customerName,
              amount_subtotal: session.amount_subtotal ?? 0,
              amount_total: session.amount_total ?? 0,
              currency: session.currency ?? "usd",
              payment_status: session.payment_status ?? "unpaid",
              status: orderStatus,
              livemode: session.livemode,
              state_slug: meta.stateSlug ?? null,
              funnel_type: meta.listingType ?? null,
              source_listing_type: meta.listingType ?? null,
              submission_id: meta.submissionId ?? null,
              metadata: meta,
              product_summary: productSummary || null,
              checkout_mode: "subscription",
              subscription_id: subId,
              agency_id: meta.agencyId || null,
              agency_name: meta.agencyName || null,
              top25_slot_id: meta.top25SlotId || null,
              top25_rank: meta.rank ? parseInt(meta.rank, 10) : null,
              stripe_created_at: new Date(session.created * 1000).toISOString(),
            }, { onConflict: "checkout_session_id" });

            if (orderErr) { errors.push(`sub_order ${session.id}: ${orderErr.message}`); }
            else {
              syncedSubscriptionOrders++;
              console.info(`[stripe-admin-sync] Synced subscription order ${session.id} status=${orderStatus}`);
            }
          }

          // Upsert customer record
          if (customerId && customerEmail) {
            await supabase.from("stripe_customers").upsert({
              customer_id: customerId,
              email: customerEmail,
              name: customerName,
              livemode: session.livemode,
            }, { onConflict: "customer_id" });
            syncedCustomers++;
          }
        } catch (sessionErr: any) {
          errors.push(`session ${session.id}: ${sessionErr.message}`);
        }
      }

      hasMore = sessions.has_more;
      if (sessions.data.length > 0) {
        startingAfter = sessions.data[sessions.data.length - 1].id;
      } else {
        hasMore = false;
      }
    }

    // ── 2. Sync invoices + repair missing subscription stripe_orders ─────────
    let invoiceHasMore = true;
    let invoiceStartingAfter: string | undefined;

    while (invoiceHasMore) {
      const invoices = await stripe.invoices.list({
        limit: 100,
        created: { gte: since },
        status: "paid",
        ...(invoiceStartingAfter ? { starting_after: invoiceStartingAfter } : {}),
      }) as Stripe.ApiList<Stripe.Invoice>;

      for (const invoice of invoices.data) {
        if (!invoice.id) continue;
        const piId = typeof invoice.payment_intent === "string" ? invoice.payment_intent : invoice.payment_intent?.id ?? null;
        const custId = typeof invoice.customer === "string" ? invoice.customer : invoice.customer?.id ?? null;
        const subId = typeof invoice.subscription === "string" ? invoice.subscription : invoice.subscription?.id ?? null;

        // Upsert invoice record
        const { error: invErr } = await supabase.from("stripe_invoices").upsert({
          stripe_invoice_id: invoice.id,
          stripe_customer_id: custId,
          stripe_payment_intent_id: piId,
          stripe_subscription_id: subId,
          hosted_invoice_url: invoice.hosted_invoice_url ?? null,
          invoice_pdf: invoice.invoice_pdf ?? null,
          status: invoice.status ?? null,
          amount_paid: invoice.amount_paid ?? 0,
          amount_due: invoice.amount_due ?? 0,
          currency: invoice.currency ?? "usd",
          customer_email: invoice.customer_email ?? null,
          livemode: invoice.livemode,
          raw: invoice as any,
        }, { onConflict: "stripe_invoice_id" });

        if (invErr) errors.push(`invoice ${invoice.id}: ${invErr.message}`);
        else syncedInvoices++;

        // Link invoice to existing order via payment_intent_id
        if (piId) {
          await supabase.from("stripe_orders").update({ invoice_id: invoice.id }).eq("payment_intent_id", piId);
        }

        // ── Repair: if this is a subscription invoice with no matching stripe_orders row, create one ──
        if (!subId) continue;

        let existingOrder: { id: string } | null = null;

        const { data: bySubscription } = await supabase
          .from("stripe_orders").select("id").eq("subscription_id", subId).maybeSingle();
        existingOrder = bySubscription ?? null;

        if (!existingOrder && invoice.id) {
          const { data: byInvoice } = await supabase
            .from("stripe_orders").select("id").eq("invoice_id", invoice.id).maybeSingle();
          existingOrder = byInvoice ?? null;
        }

        if (!existingOrder && piId) {
          const { data: byPi } = await supabase
            .from("stripe_orders").select("id").eq("payment_intent_id", piId).maybeSingle();
          existingOrder = byPi ?? null;
        }

        if (!existingOrder) {
          // Repair: fetch subscription metadata and build fallback order
          let subMeta: Record<string, string> = {};
          let periodEnd: number | null = null;
          try {
            const sub = await stripe.subscriptions.retrieve(subId);
            subMeta = sub.metadata ?? {};
            periodEnd = sub.current_period_end;
          } catch (_) {}

          const listingType = subMeta.listingType ?? subMeta.funnel ?? null;
          const productSummary = buildProductSummary(subMeta);
          const fallbackSessionId = `inv_${invoice.id}`;

          const { error: repairErr } = await supabase.from("stripe_orders").upsert({
            checkout_session_id: fallbackSessionId,
            payment_intent_id: piId,
            customer_id: custId ?? "",
            customer_email: invoice.customer_email ?? null,
            amount_subtotal: invoice.subtotal ?? invoice.amount_paid ?? 0,
            amount_total: invoice.amount_paid ?? invoice.amount_due ?? 0,
            currency: invoice.currency ?? "usd",
            payment_status: "paid",
            status: "completed",
            livemode: invoice.livemode,
            state_slug: subMeta.stateSlug ?? null,
            funnel_type: listingType,
            source_listing_type: listingType,
            metadata: subMeta,
            product_summary: productSummary || null,
            checkout_mode: "subscription",
            subscription_id: subId,
            agency_id: subMeta.agencyId || null,
            agency_name: subMeta.agencyName || null,
            top25_slot_id: subMeta.top25SlotId || null,
            top25_rank: subMeta.rank ? parseInt(subMeta.rank, 10) : null,
            stripe_created_at: invoice.created ? new Date(invoice.created * 1000).toISOString() : null,
            invoice_id: invoice.id,
            current_period_end: periodEnd,
            paid_at: new Date().toISOString(),
          }, { onConflict: "checkout_session_id" });

          if (repairErr) {
            errors.push(`repair invoice ${invoice.id}: ${repairErr.message}`);
            console.error(`[stripe-admin-sync] REPAIR FAILED for invoice ${invoice.id}: ${repairErr.message}`);
          } else {
            repairedOrders++;
            console.info(`[stripe-admin-sync] REPAIRED missing stripe_orders row from invoice ${invoice.id} / subscription ${subId}`);
          }
        }
      }

      invoiceHasMore = invoices.has_more;
      if (invoices.data.length > 0) {
        invoiceStartingAfter = invoices.data[invoices.data.length - 1].id;
      } else {
        invoiceHasMore = false;
      }
    }

    return json({
      ok: true,
      syncedOrders,
      syncedSubscriptionOrders,
      repairedOrders,
      syncedItems,
      syncedInvoices,
      syncedCustomers,
      errors: errors.slice(0, 20),
      syncedAt: new Date().toISOString(),
    });
  } catch (err: any) {
    console.error("[stripe-admin-sync] Fatal error:", err.message);
    return json({ error: err.message, syncedOrders, syncedSubscriptionOrders, repairedOrders, syncedInvoices, errors }, 500);
  }
});
