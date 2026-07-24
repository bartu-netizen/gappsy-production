import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@17.7.0";
import { CORS_HEADERS } from "../_shared/adminSession.ts";
import { createServiceClient, requireVendorSession, listVendorTools, VendorAuthError, VendorMultipleToolsError } from "../_shared/vendorAuth.ts";

// Self-service dashboard for a vendor who owns a listing (tools.owner_user_id
// = auth.uid(), set only by vendor-claim-account). Deliberately mirrors the
// admin-* edge function shape (service role + one gate function), but the
// gate here is ownership of a specific tool row rather than an admin
// session. Column whitelist below is the actual security boundary — never
// slug/status/featured/verified/rating/review_count/affiliate_link/seo_*/
// og_*/editorial_*, all of which stay admin-only to protect SEO and trust.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const VENDOR_EDITABLE_TOOL_FIELDS = [
  "logo",
  "website",
  "short_description",
  "long_description",
  "pricing_model",
  "starting_price",
  "youtube_url",
  "founded_year",
  "company_size",
  "headquarters",
  "languages",
  "best_for",
  "target_audience",
  "pricing_summary",
  "features_summary",
  "integrations_summary",
  "company_summary",
] as const;

function pickWhitelisted(input: Record<string, unknown>): Record<string, unknown> {
  const out: Record<string, unknown> = {};
  for (const key of VENDOR_EDITABLE_TOOL_FIELDS) {
    if (Object.prototype.hasOwnProperty.call(input, key)) out[key] = input[key];
  }
  return out;
}

// deno-lint-ignore no-explicit-any
async function hasActiveFeatured(supabase: any, toolId: string): Promise<boolean> {
  const { data } = await supabase
    .from("vendor_feature_subscriptions")
    .select("status")
    .eq("tool_id", toolId)
    .eq("product", "featured")
    .eq("status", "active")
    .limit(1)
    .maybeSingle();
  return Boolean(data);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const supabase = createServiceClient();
    const url = new URL(req.url);
    const toolId = url.searchParams.get("tool_id");

    // Tool-switcher support: list every tool this account owns, independent
    // of the single-tool resolution below (which would throw for an account
    // owning 2+ tools before the picker could ever be shown).
    if (req.method === "GET" && url.searchParams.get("list_tools") === "1") {
      const tools = await listVendorTools(req, supabase);
      return jsonResponse({ ok: true, tools });
    }

    const session = await requireVendorSession(req, supabase, toolId);

    if (req.method === "GET") {
      const [toolResult, featuresResult, prosResult, consResult, faqsResult, reviewsResult, claimResult, featuredResult, comparisonRequestsResult] = await Promise.all([
        supabase.from("tools").select(
          `id, slug, name, logo, website, short_description, long_description, pricing_model, starting_price,
           youtube_url, founded_year, company_size, headquarters, languages, best_for, target_audience,
           pricing_summary, features_summary, integrations_summary, company_summary, rating, review_count,
           verified, featured, featured_until, billing_interval, status, updated_at`
        ).eq("id", session.toolId).single(),
        supabase.from("tool_features").select("id, title, description, sort_order").eq("tool_id", session.toolId).order("sort_order"),
        supabase.from("tool_pros").select("id, text, sort_order").eq("tool_id", session.toolId).order("sort_order"),
        supabase.from("tool_cons").select("id, text, sort_order").eq("tool_id", session.toolId).order("sort_order"),
        supabase.from("tool_faqs").select("id, question, answer, sort_order").eq("tool_id", session.toolId).eq("status", "published").order("sort_order"),
        supabase.from("tool_user_reviews").select("id, reviewer_name, rating, title, body, status, vendor_response, vendor_response_at, created_at").eq("tool_id", session.toolId).order("created_at", { ascending: false }),
        // Claim and Featured are two independent products (see the v2 vendor
        // claim/featured migration) — queried separately so the dashboard can
        // show accurate, distinct status for each instead of whichever
        // subscription row happens to be newest.
        supabase.from("vendor_feature_subscriptions").select("status, created_at").eq("tool_id", session.toolId).eq("product", "claim").order("created_at", { ascending: false }).limit(1).maybeSingle(),
        supabase.from("vendor_feature_subscriptions").select("status, billing_interval, current_period_end, featured_until, stripe_customer_id, canceled_at").eq("tool_id", session.toolId).eq("product", "featured").order("created_at", { ascending: false }).limit(1).maybeSingle(),
        supabase.from("vendor_comparison_requests").select("id, status, admin_notes, created_at, requested_tool:tools!vendor_comparison_requests_requested_tool_id_fkey(slug, name, logo)").eq("tool_id", session.toolId).order("created_at", { ascending: false }),
      ]);

      if (toolResult.error) return jsonResponse({ ok: false, error: "Failed to load listing" }, 500);

      // Analytics is a Featured perk — only queried (and only ever returned)
      // for a listing with an actually-paid, currently-active Featured
      // subscription, never for Claim-only or a pending/past-due one.
      let analytics = null;
      let chatQuestions: { content: string; created_at: string }[] = [];
      if (featuredResult.data?.status === "active") {
        const since30d = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString();
        const [viewsTotal, views30d, clicksTotal, clicks30d, chatQuestionsResult] = await Promise.all([
          supabase.from("tool_page_views").select("id", { count: "exact", head: true }).eq("tool_id", session.toolId),
          supabase.from("tool_page_views").select("id", { count: "exact", head: true }).eq("tool_id", session.toolId).gte("created_at", since30d),
          supabase.from("tool_outbound_clicks").select("id", { count: "exact", head: true }).eq("tool_id", session.toolId),
          supabase.from("tool_outbound_clicks").select("id", { count: "exact", head: true }).eq("tool_id", session.toolId).gte("created_at", since30d),
          // Anonymized by design — never session_id or ip_address, only the
          // question text and its date. A Featured perk showing genuine buyer
          // intent/objections asked on this listing's own Ask Gappsy chat.
          supabase.from("tool_chat_messages").select("content, created_at").eq("tool_id", session.toolId).eq("role", "user").order("created_at", { ascending: false }).limit(200),
        ]);
        analytics = {
          views_total: viewsTotal.count || 0,
          views_30d: views30d.count || 0,
          clicks_total: clicksTotal.count || 0,
          clicks_30d: clicks30d.count || 0,
        };
        chatQuestions = chatQuestionsResult.data || [];
      }

      return jsonResponse({
        ok: true,
        tool: toolResult.data,
        features: featuresResult.data || [],
        pros: prosResult.data || [],
        cons: consResult.data || [],
        faqs: faqsResult.data || [],
        reviews: reviewsResult.data || [],
        claimSubscription: claimResult.data || null,
        featuredSubscription: featuredResult.data || null,
        analytics,
        chatQuestions,
        comparisonRequests: comparisonRequestsResult.data || [],
      });
    }

    if (req.method === "POST") {
      const payload = await req.json();
      const action = payload.action;

      if (action === "update_listing") {
        const updates = pickWhitelisted(payload.fields || {});
        if (Object.keys(updates).length === 0) return jsonResponse({ ok: false, error: "No editable fields provided" }, 400);
        const { data, error } = await supabase.from("tools").update({ ...updates, updated_at: new Date().toISOString() }).eq("id", session.toolId).select().single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, tool: data });
      }

      if (action === "set_features" || action === "set_pros" || action === "set_cons" || action === "set_faqs") {
        const table = action === "set_features" ? "tool_features" : action === "set_pros" ? "tool_pros" : action === "set_cons" ? "tool_cons" : "tool_faqs";
        // tool_faqs (unlike features/pros/cons) has a draft/published status
        // column used by admin editorial workflow — scope the replace-all to
        // published rows only so a vendor edit never wipes out an admin's
        // in-progress draft FAQ for the same tool.
        let deleteQuery = supabase.from(table).delete().eq("tool_id", session.toolId);
        if (table === "tool_faqs") deleteQuery = deleteQuery.eq("status", "published");
        const { error: deleteError } = await deleteQuery;
        if (deleteError) return jsonResponse({ ok: false, error: deleteError.message }, 500);

        const items = Array.isArray(payload.items) ? payload.items : [];
        if (items.length > 0) {
          const rows = items.map((item: Record<string, unknown>, index: number) => {
            if (table === "tool_features") return { tool_id: session.toolId, title: item.title, description: item.description ?? null, sort_order: index };
            if (table === "tool_faqs") return { tool_id: session.toolId, question: item.question, answer: item.answer, status: "published", sort_order: index };
            return { tool_id: session.toolId, text: item.text, sort_order: index };
          });
          const { error: insertError } = await supabase.from(table).insert(rows);
          if (insertError) return jsonResponse({ ok: false, error: insertError.message }, 500);
        }

        let selectQuery = supabase.from(table).select("*").eq("tool_id", session.toolId).order("sort_order");
        if (table === "tool_faqs") selectQuery = selectQuery.eq("status", "published");
        const { data: refreshed } = await selectQuery;
        return jsonResponse({ ok: true, items: refreshed || [] });
      }

      if (action === "respond_to_review" || action === "remove_review" || action === "restore_review") {
        const reviewId = typeof payload.review_id === "string" ? payload.review_id : null;
        if (!reviewId) return jsonResponse({ ok: false, error: "review_id is required" }, 400);

        // Guard: the review must belong to this vendor's own tool — the
        // service-role client bypasses RLS, so this check IS the boundary.
        const { data: review, error: reviewFetchError } = await supabase.from("tool_user_reviews").select("id, tool_id, status").eq("id", reviewId).maybeSingle();
        if (reviewFetchError || !review || review.tool_id !== session.toolId) {
          return jsonResponse({ ok: false, error: "Review not found" }, 404);
        }

        if (action === "respond_to_review") {
          const responseText = typeof payload.response === "string" ? payload.response.trim() : "";
          if (!responseText) return jsonResponse({ ok: false, error: "response is required" }, 400);
          const { data, error } = await supabase.from("tool_user_reviews").update({ vendor_response: responseText, vendor_response_at: new Date().toISOString() }).eq("id", reviewId).select().single();
          if (error) return jsonResponse({ ok: false, error: error.message }, 500);
          return jsonResponse({ ok: true, review: data });
        }

        // remove/restore: soft — flips status between 'approved' and
        // 'rejected' rather than deleting the row, so a removed review still
        // shows up in the admin moderation queue (oversight against a vendor
        // suppressing legitimate criticism) instead of disappearing forever.
        // Featured-exclusive: Claim & Verify includes replying to reviews, but
        // not removing/hiding them.
        if (!(await hasActiveFeatured(supabase, session.toolId))) {
          return jsonResponse({ ok: false, error: "Removing or restoring reviews is a Featured feature — upgrade to remove reviews from your listing." }, 403);
        }

        if (review.status !== "approved" && review.status !== "rejected") {
          return jsonResponse({ ok: false, error: "Only published reviews can be removed/restored" }, 400);
        }
        const newStatus = action === "remove_review" ? "rejected" : "approved";
        const { data, error } = await supabase.from("tool_user_reviews").update({ status: newStatus }).eq("id", reviewId).select().single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, review: data });
      }

      if (action === "request_comparison") {
        // Featured-exclusive: request to be paired against a specific
        // competitor. Only queues the request — the actual tool_comparisons
        // row is still hand-created by an admin via the existing editor
        // (including its open-source-pair guard), never auto-created here.
        if (!(await hasActiveFeatured(supabase, session.toolId))) {
          return jsonResponse({ ok: false, error: "Requesting a comparison is a Featured feature." }, 403);
        }
        const requestedToolSlug = typeof payload.requested_tool_slug === "string" ? payload.requested_tool_slug : null;
        if (!requestedToolSlug) return jsonResponse({ ok: false, error: "requested_tool_slug is required" }, 400);

        const { data: requestedTool } = await supabase.from("tools").select("id, status").eq("slug", requestedToolSlug).maybeSingle();
        if (!requestedTool || requestedTool.status !== "published") {
          return jsonResponse({ ok: false, error: "That tool couldn't be found" }, 404);
        }
        const requestedToolId = requestedTool.id;
        if (requestedToolId === session.toolId) return jsonResponse({ ok: false, error: "Cannot request a comparison against your own listing" }, 400);

        const { data: existing } = await supabase
          .from("vendor_comparison_requests")
          .select("id")
          .eq("tool_id", session.toolId)
          .eq("requested_tool_id", requestedToolId)
          .eq("status", "pending")
          .maybeSingle();
        if (existing) return jsonResponse({ ok: false, error: "You already have a pending request for this comparison" }, 409);

        const { data, error } = await supabase
          .from("vendor_comparison_requests")
          .insert({ tool_id: session.toolId, requested_tool_id: requestedToolId })
          .select("id, status, admin_notes, created_at, requested_tool:tools!vendor_comparison_requests_requested_tool_id_fkey(slug, name, logo)")
          .single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, request: data });
      }

      if (action === "create_billing_portal_session") {
        // Only Featured is a real recurring subscription — Claim is a one-time
        // charge with nothing to manage in a billing portal (no upcoming
        // renewal, no payment method to update for it).
        const { data: sub } = await supabase.from("vendor_feature_subscriptions").select("stripe_customer_id").eq("tool_id", session.toolId).eq("product", "featured").not("stripe_customer_id", "is", null).order("created_at", { ascending: false }).limit(1).maybeSingle();
        if (!sub?.stripe_customer_id) return jsonResponse({ ok: false, error: "No Featured subscription found for this listing" }, 404);

        const stripeKey = Deno.env.get("STRIPE_SECRET_KEY");
        if (!stripeKey) return jsonResponse({ ok: false, error: "Billing is not configured" }, 500);
        const stripe = new Stripe(stripeKey, { apiVersion: "2024-11-20.acacia" });
        const returnUrl = typeof payload.return_url === "string" ? payload.return_url : undefined;
        const portalSession = await stripe.billingPortal.sessions.create({
          customer: sub.stripe_customer_id,
          return_url: returnUrl || "https://gappsy.com/vendor/dashboard",
        });
        return jsonResponse({ ok: true, url: portalSession.url });
      }

      return jsonResponse({ ok: false, error: "Unknown action" }, 400);
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    if (error instanceof VendorMultipleToolsError) {
      return jsonResponse({ ok: false, error: error.message, error_code: "multiple_tools", tools: error.tools }, error.status);
    }
    if (error instanceof VendorAuthError) return jsonResponse({ ok: false, error: error.message }, error.status);
    console.error("[vendor-dashboard] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
