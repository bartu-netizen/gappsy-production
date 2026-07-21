// netlify/edge-functions/smart-search-relay.js
//
// Thin geo-capture relay for the homepage/tools smart-search chat, same
// pattern as track-event.js: Netlify Edge Functions get context.geo (city +
// country) and context.ip for free — something the Supabase edge function
// alone can't reliably provide. Attaches that geo data to the client's
// query payload, forwards to the real Supabase router (smart-search-route),
// and relays its JSON response back unchanged (unlike track-event, the
// caller needs the actual routing result — path/message/buttonLabel — not
// just a fire-and-forget ack).

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
    if (!body || typeof body.query !== "string") {
      return new Response(JSON.stringify({ ok: false, error: "Invalid payload" }), {
        status: 400,
        headers: { ...CORS_HEADERS, "content-type": "application/json" },
      });
    }

    const payload = {
      ...body,
      ip: context.ip || null,
      city: context.geo?.city || null,
      country_code: context.geo?.country?.code || null,
      country_name: context.geo?.country?.name || null,
    };

    const upstream = await fetch(`${SUPABASE_URL}/functions/v1/smart-search-route`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        apikey: SUPABASE_ANON_KEY,
      },
      body: JSON.stringify(payload),
    });

    const data = await upstream.text();
    return new Response(data, {
      status: upstream.status,
      headers: { ...CORS_HEADERS, "content-type": "application/json" },
    });
  } catch (error) {
    console.error("[smart-search-relay] relay failed:", error);
    return new Response(JSON.stringify({ ok: false, error: "Search is temporarily unavailable." }), {
      status: 502,
      headers: { ...CORS_HEADERS, "content-type": "application/json" },
    });
  }
};
