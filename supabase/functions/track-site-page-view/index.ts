import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { extractVisitorContext } from "../_shared/visitorContext.ts";

// Public, site-wide page-view + time-on-page ingest — the generic counterpart
// to track-tool-event (which only covers tool detail pages). Called directly
// from the browser via useSitePageViewTracking, so (unlike track-tool-event)
// this one does its own geo/IP extraction from the request instead of relying
// on a Netlify relay to attach it.
//
// Deliberately best-effort: malformed payloads return ok:false rather than
// throwing, since a broken analytics call must never surface as a visible
// error to a real visitor.

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, apikey",
};

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

const supabase = createClient(Deno.env.get("SUPABASE_URL") ?? "", Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "");

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    let payload: Record<string, unknown>;
    try {
      payload = await req.json();
    } catch {
      return jsonResponse({ ok: false, error: "Invalid JSON body" }, 400);
    }

    const action = typeof payload.action === "string" ? payload.action : null;
    const id = typeof payload.id === "string" ? payload.id : null;
    if (!id || (action !== "start" && action !== "duration")) {
      return jsonResponse({ ok: false, error: "Invalid payload" }, 400);
    }

    if (action === "start") {
      const path = typeof payload.path === "string" ? payload.path : null;
      if (!path) return jsonResponse({ ok: false, error: "Invalid payload" }, 400);

      const visitor = extractVisitorContext(req);
      const { error } = await supabase.from("site_page_views").insert({
        id,
        visitor_id: typeof payload.visitor_id === "string" ? payload.visitor_id : null,
        path,
        referrer: typeof payload.referrer === "string" ? payload.referrer : null,
        utm_source: typeof payload.utm_source === "string" ? payload.utm_source : null,
        utm_medium: typeof payload.utm_medium === "string" ? payload.utm_medium : null,
        utm_campaign: typeof payload.utm_campaign === "string" ? payload.utm_campaign : null,
        ip_address: visitor.ip_address,
        country_code: visitor.country,
        country_name: visitor.country,
        city: visitor.city,
        user_agent: visitor.user_agent,
      });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true });
    }

    // action === "duration"
    const durationSeconds = typeof payload.duration_seconds === "number" && Number.isFinite(payload.duration_seconds)
      ? Math.max(0, Math.round(payload.duration_seconds))
      : null;
    if (durationSeconds === null) return jsonResponse({ ok: false, error: "Invalid payload" }, 400);

    const { error } = await supabase
      .from("site_page_views")
      .update({ duration_seconds: durationSeconds, updated_at: new Date().toISOString() })
      .eq("id", id);
    if (error) return jsonResponse({ ok: false, error: error.message }, 500);
    return jsonResponse({ ok: true });
  } catch (error) {
    console.error("[track-site-page-view] error:", error);
    return jsonResponse({ ok: false }, 200);
  }
});
