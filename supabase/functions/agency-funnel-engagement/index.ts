import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, X-Client-Info, Apikey",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

interface EngagementPayload {
  fsid: string;
  agency_id?: string;
  agency_slug?: string;
  page_path?: string;
  time_on_page_seconds: number;
  scroll_depth_percent: number;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  try {
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
    const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
      return jsonResponse({ error: "Missing server config" }, 500);
    }

    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    let body: EngagementPayload;
    try {
      body = await req.json();
    } catch {
      return jsonResponse({ error: "Invalid JSON" }, 400);
    }

    const {
      fsid,
      agency_id,
      agency_slug,
      page_path,
      time_on_page_seconds,
      scroll_depth_percent,
    } = body;

    if (!fsid) {
      return jsonResponse({ error: "fsid is required" }, 400);
    }

    const safeTime = Math.max(0, Math.min(time_on_page_seconds ?? 0, 3600));
    const safeScroll = Math.max(0, Math.min(scroll_depth_percent ?? 0, 100));

    await supabase.from("agency_funnel_engagement").insert({
      fsid,
      agency_id: agency_id ?? null,
      agency_slug: agency_slug ?? null,
      page_path: page_path ?? null,
      time_on_page_seconds: safeTime,
      scroll_depth_percent: safeScroll,
    });

    const { data: session } = await supabase
      .from("funnel_sessions")
      .select("id, avg_time_on_page_seconds, max_scroll_depth_percent")
      .eq("fsid", fsid)
      .maybeSingle();

    if (session) {
      const updateFields: Record<string, unknown> = {};
      const currentMax = session.max_scroll_depth_percent ?? 0;
      if (safeScroll > currentMax) {
        updateFields.max_scroll_depth_percent = safeScroll;
      }
      const currentAvg = session.avg_time_on_page_seconds ?? 0;
      if (safeTime > currentAvg) {
        updateFields.avg_time_on_page_seconds = safeTime;
      }
      if (Object.keys(updateFields).length > 0) {
        updateFields.updated_at = new Date().toISOString();
        await supabase
          .from("funnel_sessions")
          .update(updateFields)
          .eq("id", session.id);
      }
    }

    return jsonResponse({ ok: true });
  } catch (err) {
    console.error("[agency-funnel-engagement] Error:", err);
    return jsonResponse(
      { error: err instanceof Error ? err.message : "Unknown error" },
      500
    );
  }
});
