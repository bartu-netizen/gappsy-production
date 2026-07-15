// netlify/edge-functions/track-event.js
//
// Thin geo-capture relay for tool page-view / outbound-click tracking.
// Netlify Edge Functions get context.geo (country) and context.ip for free
// (no external geo-IP service, no extra latency/cost) — something a
// Supabase edge function alone can't reliably provide. This function's
// only job is to attach that geo data to the client's event payload and
// forward it to the real Supabase ingest function (track-tool-event),
// which does the actual DB write with the service-role key.
//
// Uses the same public anon key already embedded in the client bundle —
// deliberately NOT the service-role key, so no new secret is needed in
// Netlify's environment at all.

const SUPABASE_URL = "https://jczdgzhnsyzvbpfqueyy.supabase.co";
const SUPABASE_ANON_KEY =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjemRnemhuc3l6dmJwZnF1ZXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxOTMzMjAsImV4cCI6MjA3OTc2OTMyMH0.YBz187aDqkiNHaURnGHcOfK5moytq7mcmVZYVGjHP3M";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type",
};

export default async (request, context) => {
  if (request.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }
  if (request.method !== "POST") {
    return new Response(null, { status: 405, headers: CORS_HEADERS });
  }

  try {
    const body = await request.json().catch(() => null);
    if (!body || typeof body.tool_slug !== "string" || typeof body.event_type !== "string") {
      return new Response(JSON.stringify({ ok: false, error: "Invalid payload" }), {
        status: 400,
        headers: { ...CORS_HEADERS, "content-type": "application/json" },
      });
    }

    const payload = {
      event_type: body.event_type,
      tool_slug: body.tool_slug,
      link_type: body.link_type,
      destination_url: body.destination_url,
      ip: context.ip || null,
      country_code: context.geo?.country?.code || null,
      country_name: context.geo?.country?.name || null,
      user_agent: request.headers.get("user-agent") || null,
      referrer: request.headers.get("referer") || null,
    };

    // Fire-and-forget from the caller's perspective, but we still await
    // here so errors surface in Netlify's function logs rather than
    // vanishing silently.
    const upstream = await fetch(`${SUPABASE_URL}/functions/v1/track-tool-event`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        apikey: SUPABASE_ANON_KEY,
      },
      body: JSON.stringify(payload),
    });

    return new Response(JSON.stringify({ ok: upstream.ok }), {
      status: 200,
      headers: { ...CORS_HEADERS, "content-type": "application/json" },
    });
  } catch (error) {
    console.error("[track-event] relay failed:", error);
    // Never fail loudly for a best-effort analytics call.
    return new Response(JSON.stringify({ ok: false }), {
      status: 200,
      headers: { ...CORS_HEADERS, "content-type": "application/json" },
    });
  }
};
