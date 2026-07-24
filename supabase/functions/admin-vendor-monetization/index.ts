// deno-lint-ignore-file no-explicit-any
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import Stripe from "npm:stripe@17.7.0";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const SESSION_STATUSES = new Set([
  "started", "url_submitted", "matched_existing", "matched_new", "contact_collected",
  "checkout_pending", "checkout_completed", "verified", "abandoned",
]);
const DEFAULT_PER_PAGE = 25;
const MAX_PER_PAGE = 100;

// Display-only estimate, same consts as vendor-onboarding/index.ts and
// admin-visitor-journey — never used for billing, just so the Sales view can
// show an approximate amount without a live Stripe lookup per row.
const CLAIM_AMOUNT_CENTS = 2900;
const FEATURED_AMOUNT_CENTS: Record<string, number> = { month: 8900, year: 69900 };
function estimateAmountCents(product: string | null, billingInterval: string | null): number | null {
  if (product === "claim") return CLAIM_AMOUNT_CENTS;
  if (product === "featured" && billingInterval) return FEATURED_AMOUNT_CENTS[billingInterval] ?? null;
  return null;
}

function generateSecureToken(length = 32): string {
  const alphabet = "ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";
  const bytes = new Uint8Array(length);
  crypto.getRandomValues(bytes);
  let token = "";
  for (let i = 0; i < length; i++) token += alphabet[bytes[i] % alphabet.length];
  return token;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data: sessionRow, error } = await supabase.from("vendor_onboarding_sessions").select("*").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!sessionRow) return jsonResponse({ ok: false, error: "Not found" }, 404);

        const { data: subscription } = await supabase.from("vendor_feature_subscriptions").select("*").eq("onboarding_session_id", id).order("created_at", { ascending: false }).limit(1).maybeSingle();
        const { data: tokens } = await supabase.from("vendor_ownership_tokens").select("*").eq("onboarding_session_id", id).order("created_at", { ascending: false });
        const { data: events } = await supabase.from("vendor_funnel_events").select("event_name, created_at, metadata").eq("onboarding_session_id", id).order("created_at", { ascending: true });
        let tool = null;
        let discoveredTool = null;
        if (sessionRow.matched_tool_id) {
          const { data } = await supabase.from("tools").select("id, name, slug, website, status, featured, featured_until").eq("id", sessionRow.matched_tool_id).maybeSingle();
          tool = data;
        }
        if (sessionRow.matched_discovered_tool_id) {
          const { data } = await supabase.from("discovered_tools").select("id, name, official_website, status, approved_by, approved_at").eq("id", sessionRow.matched_discovered_tool_id).maybeSingle();
          discoveredTool = data;
        }

        return jsonResponse({ ok: true, data: { session: sessionRow, subscription, tokens: tokens || [], events: events || [], tool, discovered_tool: discoveredTool } });
      }

      const q = (url.searchParams.get("q") || "").trim();
      const statusFilter = url.searchParams.get("status");
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const perPage = Math.min(MAX_PER_PAGE, Math.max(1, Number(url.searchParams.get("per_page")) || DEFAULT_PER_PAGE));
      const rangeFrom = (page - 1) * perPage;
      const rangeTo = rangeFrom + perPage - 1;

      // Sales view: actual completed purchases (vendor_feature_subscriptions
      // with status='active'), not funnel sessions — "where do sales land"
      // for the software directory, mirroring what stripe_orders is for
      // agency listings. Separate branch since the underlying table/shape
      // (amount, product, tool name) is entirely different from a session row.
      if (url.searchParams.get("view") === "sales") {
        let salesQuery = supabase
          .from("vendor_feature_subscriptions")
          .select("id, tool_id, discovered_tool_id, product, billing_interval, contact_email, stripe_subscription_id, stripe_checkout_session_id, current_period_end, created_at, tools(name, slug)", { count: "exact" })
          .eq("status", "active");
        if (q) salesQuery = salesQuery.or(`contact_email.ilike.%${q}%`);
        salesQuery = salesQuery.order("created_at", { ascending: false }).range(rangeFrom, rangeTo);

        const { data: sales, error: salesError, count: salesCount } = await salesQuery;
        if (salesError) return jsonResponse({ ok: false, error: salesError.message }, 500);

        const enrichedSales = (sales || []).map((s: any) => ({
          ...s,
          estimated_amount_cents: estimateAmountCents(s.product, s.billing_interval),
        }));
        return jsonResponse({ ok: true, data: enrichedSales, total: salesCount || 0, page, page_size: perPage });
      }

      let query = supabase.from("vendor_onboarding_sessions").select("*", { count: "exact" });
      if (statusFilter && SESSION_STATUSES.has(statusFilter)) query = query.eq("status", statusFilter);
      if (q) query = query.or(`contact_email.ilike.%${q}%,product_name_input.ilike.%${q}%,normalized_hostname.ilike.%${q}%`);
      query = query.order("created_at", { ascending: false }).range(rangeFrom, rangeTo);

      const { data: sessions, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const sessionIds = (sessions || []).map((s: any) => s.id);
      const { data: subs } = sessionIds.length
        ? await supabase.from("vendor_feature_subscriptions").select("id, onboarding_session_id, status, contact_email, stripe_subscription_id, current_period_end").in("onboarding_session_id", sessionIds)
        : { data: [] as any[] };
      const subsBySession = new Map((subs || []).map((s: any) => [s.onboarding_session_id, s]));

      const enriched = (sessions || []).map((s: any) => ({ ...s, subscription: subsBySession.get(s.id) || null }));
      return jsonResponse({ ok: true, data: enriched, total: count || 0, page, page_size: perPage });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();
    const actorEmail = session.email || "unknown";

    switch (payload.action) {
      case "link_to_tool": {
        const sessionId = payload.session_id as string;
        const toolId = payload.tool_id as string;
        if (!sessionId || !toolId) return jsonResponse({ ok: false, error: "session_id and tool_id are required" }, 400);
        await supabase.from("vendor_onboarding_sessions").update({ matched_tool_id: toolId, is_new_product: false, updated_at: new Date().toISOString() }).eq("id", sessionId);
        await supabase.from("vendor_feature_subscriptions").update({ tool_id: toolId }).eq("onboarding_session_id", sessionId);
        await writeAuditLog({ actor_session_type: "session_token", actor_email: actorEmail, action: "vendor_monetization_link_to_tool", target_table: "vendor_onboarding_sessions", target_id: sessionId, status: "success" });
        return jsonResponse({ ok: true });
      }

      case "merge_duplicate": {
        const keepId = payload.keep_session_id as string;
        const dupeId = payload.duplicate_session_id as string;
        if (!keepId || !dupeId || keepId === dupeId) return jsonResponse({ ok: false, error: "keep_session_id and duplicate_session_id are required and must differ" }, 400);
        await supabase.from("vendor_onboarding_sessions").update({ status: "abandoned", updated_at: new Date().toISOString() }).eq("id", dupeId);
        await supabase.from("vendor_funnel_events").insert({ onboarding_session_id: dupeId, event_name: "checkout_abandoned", metadata: { merged_into: keepId, merged_by: actorEmail } });
        await writeAuditLog({ actor_session_type: "session_token", actor_email: actorEmail, action: "vendor_monetization_merge_duplicate", target_table: "vendor_onboarding_sessions", target_id: dupeId, status: "success", rejection_reason: `merged into ${keepId}` });
        return jsonResponse({ ok: true });
      }

      case "resend_verification": {
        const subscriptionId = payload.subscription_id as string;
        if (!subscriptionId) return jsonResponse({ ok: false, error: "subscription_id is required" }, 400);
        const { data: sub } = await supabase.from("vendor_feature_subscriptions").select("*").eq("id", subscriptionId).maybeSingle();
        if (!sub) return jsonResponse({ ok: false, error: "Subscription not found" }, 404);
        const newToken = generateSecureToken();
        const { data: inserted } = await supabase.from("vendor_ownership_tokens").insert({
          token: newToken,
          onboarding_session_id: sub.onboarding_session_id,
          vendor_subscription_id: sub.id,
          tool_id: sub.tool_id,
          contact_email: sub.contact_email,
          verification_target: generateSecureToken(16),
        }).select("token").single();
        await writeAuditLog({ actor_session_type: "session_token", actor_email: actorEmail, action: "vendor_monetization_resend_verification", target_table: "vendor_feature_subscriptions", target_id: subscriptionId, status: "success" });
        return jsonResponse({ ok: true, token: inserted?.token });
      }

      case "manual_verify": {
        const subscriptionId = payload.subscription_id as string;
        const reason = typeof payload.reason === "string" ? payload.reason.trim() : "";
        if (!subscriptionId || !reason) return jsonResponse({ ok: false, error: "subscription_id and reason are required" }, 400);
        const { data: tokenRow } = await supabase.from("vendor_ownership_tokens").select("id").eq("vendor_subscription_id", subscriptionId).order("created_at", { ascending: false }).limit(1).maybeSingle();
        if (tokenRow) {
          await supabase.from("vendor_ownership_tokens").update({ verified: true, verified_at: new Date().toISOString(), verification_method: "manual", verified_by: actorEmail }).eq("id", tokenRow.id);
        }
        await writeAuditLog({ actor_session_type: "session_token", actor_email: actorEmail, action: "vendor_monetization_manual_verify", target_table: "vendor_feature_subscriptions", target_id: subscriptionId, status: "success", rejection_reason: reason });
        return jsonResponse({ ok: true });
      }

      case "approve_listing":
      case "reject_listing": {
        const discoveredToolId = payload.discovered_tool_id as string;
        const reason = typeof payload.reason === "string" ? payload.reason.trim() : "";
        if (!discoveredToolId) return jsonResponse({ ok: false, error: "discovered_tool_id is required" }, 400);
        const newStatus = payload.action === "approve_listing" ? "approved_for_crawl" : "rejected";
        await supabase.from("discovered_tools").update({ status: newStatus, reviewed_by: actorEmail, reviewed_at: new Date().toISOString() }).eq("id", discoveredToolId);
        await writeAuditLog({ actor_session_type: "session_token", actor_email: actorEmail, action: `vendor_monetization_${payload.action}`, target_table: "discovered_tools", target_id: discoveredToolId, status: "success", rejection_reason: reason || undefined });
        return jsonResponse({ ok: true });
      }

      case "toggle_featured": {
        const toolId = payload.tool_id as string;
        const featured = Boolean(payload.featured);
        if (!toolId) return jsonResponse({ ok: false, error: "tool_id is required" }, 400);
        await supabase.from("tools").update({ featured, featured_until: featured ? payload.featured_until || null : null }).eq("id", toolId);
        await writeAuditLog({ actor_session_type: "session_token", actor_email: actorEmail, action: "vendor_monetization_toggle_featured", target_table: "tools", target_id: toolId, status: "success", rejection_reason: featured ? "activated" : "deactivated" });
        return jsonResponse({ ok: true });
      }

      case "stripe_lookup": {
        const stripeCheckoutSessionId = payload.stripe_checkout_session_id as string;
        const stripeSubscriptionId = payload.stripe_subscription_id as string;
        const stripeKey = Deno.env.get("STRIPE_SECRET_KEY");
        if (!stripeKey) return jsonResponse({ ok: false, error: "Stripe not configured" }, 500);
        const stripe = new Stripe(stripeKey, { apiVersion: "2024-11-20.acacia" });
        try {
          if (stripeSubscriptionId) {
            const sub = await stripe.subscriptions.retrieve(stripeSubscriptionId);
            return jsonResponse({ ok: true, type: "subscription", status: sub.status, current_period_end: sub.current_period_end, livemode: sub.livemode, cancel_at_period_end: sub.cancel_at_period_end });
          }
          if (stripeCheckoutSessionId) {
            const cs = await stripe.checkout.sessions.retrieve(stripeCheckoutSessionId);
            return jsonResponse({ ok: true, type: "checkout_session", status: cs.status, payment_status: cs.payment_status, livemode: cs.livemode });
          }
          return jsonResponse({ ok: false, error: "stripe_checkout_session_id or stripe_subscription_id required" }, 400);
        } catch (e) {
          return jsonResponse({ ok: false, error: (e as Error).message }, 502);
        }
      }

      default:
        return jsonResponse({ ok: false, error: "Unknown action" }, 400);
    }
  } catch (err) {
    const message = (err as Error).message || "Unknown error";
    const status = message.includes("session") || message.includes("token") ? 401 : 500;
    return jsonResponse({ ok: false, error: message }, status);
  }
});
