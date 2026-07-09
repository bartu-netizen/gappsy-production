import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const url = new URL(req.url);
    const campaignIdsParam = url.searchParams.get("campaign_ids");
    const campaignIds = campaignIdsParam
      ? campaignIdsParam.split(",").map((s) => s.trim()).filter(Boolean)
      : null;

    let query = supabase
      .from("campaign_stats")
      .select("campaign_id, total_sent, total_opened, total_replied, unique_agencies_contacted, unique_agencies_opened, unique_agencies_replied, computed_at");

    if (campaignIds && campaignIds.length > 0) {
      query = query.in("campaign_id", campaignIds);
    }

    const { data, error } = await query;
    if (error) throw error;

    const stats: Record<string, {
      total_sent: number;
      total_opened: number;
      total_replied: number;
      unique_agencies_contacted: number;
      unique_agencies_opened: number;
      unique_agencies_replied: number;
      computed_at: string;
    }> = {};

    for (const row of data || []) {
      stats[row.campaign_id] = {
        total_sent:               row.total_sent               ?? 0,
        total_opened:             row.total_opened             ?? 0,
        total_replied:            row.total_replied            ?? 0,
        unique_agencies_contacted: row.unique_agencies_contacted ?? 0,
        unique_agencies_opened:    row.unique_agencies_opened    ?? 0,
        unique_agencies_replied:   row.unique_agencies_replied   ?? 0,
        computed_at: row.computed_at,
      };
    }

    return new Response(
      JSON.stringify({ ok: true, stats }),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } },
    );
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-campaign-stats-bulk] error:", message);
    return new Response(
      JSON.stringify({ ok: false, error: message }),
      {
        status: message.includes("Unauthorized") ? 401 : 500,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      },
    );
  }
});
