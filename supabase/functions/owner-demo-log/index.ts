import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    return jsonResponse({ error: "Missing server config" }, 500);
  }

  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return jsonResponse({ error: "Invalid JSON body" }, 400);
  }

  const event = (body.event as string) || "confirm_connection";
  const state_slug = (body.state_slug as string) || null;
  const agencyObj = (body.agency as Record<string, unknown>) || {};
  const personObj = (body.person as Record<string, unknown>) || {};
  const contextObj = (body.context as Record<string, unknown>) || {};

  const agency_name = (agencyObj.name as string) || null;
  const agency_id_raw = agencyObj.id as string | undefined;
  const agency_id = agency_id_raw && agency_id_raw.match(/^[0-9a-f-]{36}$/i) ? agency_id_raw : null;

  const userAgent = req.headers.get("user-agent") || null;
  const ip =
    req.headers.get("cf-connecting-ip") ||
    req.headers.get("x-forwarded-for")?.split(",")[0]?.trim() ||
    null;

  const metadata: Record<string, unknown> = {
    agency: {
      id: agency_id_raw || null,
      name: agency_name,
      rank: agencyObj.rank ?? null,
      website: agencyObj.website ?? null,
      phone: agencyObj.phone ?? null,
    },
    person: {
      name: personObj.name ?? null,
      email: personObj.email ?? null,
      phone: personObj.phone ?? null,
      role: personObj.role ?? null,
    },
    context: {
      page_url: contextObj.page_url ?? null,
      referrer: contextObj.referrer ?? null,
      flow: contextObj.flow ?? null,
      step: contextObj.step ?? null,
      notes: contextObj.notes ?? null,
    },
    ua: userAgent,
    ip,
  };

  const source_page = (contextObj.page_url as string) || null;

  const row = {
    event_name: event,
    state_slug,
    agency_name,
    agency_id,
    source_page,
    owner_user_id: null,
    metadata,
  };

  const stored = Object.entries(row)
    .filter(([, v]) => v !== null && v !== undefined)
    .map(([k]) => k);

  const { data, error } = await supabase
    .from("owner_demo_events")
    .insert(row)
    .select("id")
    .maybeSingle();

  if (error) {
    console.error("[owner-demo-log] Insert error:", error);
    return jsonResponse({ error: error.message, details: error }, 500);
  }

  return jsonResponse({ ok: true, id: data?.id ?? null, stored });
});
