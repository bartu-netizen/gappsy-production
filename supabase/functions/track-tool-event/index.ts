import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

// Public ingest endpoint for tool page-view / outbound-click analytics
// (see 20260716020000_20260716_tool_analytics.sql). Called by the Netlify
// edge function (netlify/edge-functions/track-event.js), which attaches
// real geo/IP data before relaying here — this function never talks to
// the browser directly, only to that relay, using the anon key like every
// other public-facing edge function in this repo.
//
// Deliberately best-effort: malformed payloads or an unknown tool_slug
// just return ok:false rather than throwing, since a broken analytics call
// must never surface as a visible error to a real visitor.

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, apikey",
};

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

// Generous — real browsing (several tool pages + clicks across tabs in a
// few minutes) can easily reach a few dozen; this only catches a scripted
// flood, keyed by IP (not visitor_id, which is a client-controlled
// localStorage value trivial to regenerate per request).
const RATE_LIMIT_WINDOW_MINUTES = 5;
const RATE_LIMIT_MAX_EVENTS = 120;

// deno-lint-ignore no-explicit-any
async function checkRateLimit(supabase: any, ip: string): Promise<boolean> {
  const since = new Date(Date.now() - RATE_LIMIT_WINDOW_MINUTES * 60 * 1000).toISOString();
  const [pageViews, clicks] = await Promise.all([
    supabase.from("tool_page_views").select("id", { count: "exact", head: true }).eq("ip_address", ip).gte("created_at", since),
    supabase.from("tool_outbound_clicks").select("id", { count: "exact", head: true }).eq("ip_address", ip).gte("created_at", since),
  ]);
  const total = (pageViews.count ?? 0) + (clicks.count ?? 0);
  return total < RATE_LIMIT_MAX_EVENTS;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const payload = await req.json();
    const eventType = payload.event_type;
    const toolSlug = typeof payload.tool_slug === "string" ? payload.tool_slug : null;
    if (!toolSlug || (eventType !== "page_view" && eventType !== "outbound_click")) {
      return jsonResponse({ ok: false, error: "Invalid payload" }, 400);
    }

    const ipAddress = typeof payload.ip === "string" ? payload.ip : null;
    if (ipAddress) {
      const withinLimit = await checkRateLimit(supabase, ipAddress);
      if (!withinLimit) return jsonResponse({ ok: false, error: "Too many events" }, 429);
    }

    const { data: tool } = await supabase.from("tools").select("id").eq("slug", toolSlug).maybeSingle();
    if (!tool) return jsonResponse({ ok: false, error: "Unknown tool" }, 404);

    const shared = {
      tool_id: tool.id,
      ip_address: ipAddress,
      country_code: typeof payload.country_code === "string" ? payload.country_code : null,
      country_name: typeof payload.country_name === "string" ? payload.country_name : null,
      user_agent: typeof payload.user_agent === "string" ? payload.user_agent : null,
      referrer: typeof payload.referrer === "string" ? payload.referrer : null,
      visitor_id: typeof payload.visitor_id === "string" ? payload.visitor_id : null,
    };

    if (eventType === "page_view") {
      const { error } = await supabase.from("tool_page_views").insert({
        ...shared,
        utm_source: typeof payload.utm_source === "string" ? payload.utm_source : null,
        utm_medium: typeof payload.utm_medium === "string" ? payload.utm_medium : null,
        utm_campaign: typeof payload.utm_campaign === "string" ? payload.utm_campaign : null,
      });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true });
    }

    const linkType = ["visit_website", "affiliate", "other", "claim_listing", "get_featured"].includes(payload.link_type) ? payload.link_type : "other";
    const { error } = await supabase.from("tool_outbound_clicks").insert({
      ...shared,
      link_type: linkType,
      destination_url: typeof payload.destination_url === "string" ? payload.destination_url.slice(0, 2048) : null,
    });
    if (error) return jsonResponse({ ok: false, error: error.message }, 500);
    return jsonResponse({ ok: true });
  } catch (error) {
    console.error("[track-tool-event] error:", error);
    return jsonResponse({ ok: false }, 200);
  }
});
