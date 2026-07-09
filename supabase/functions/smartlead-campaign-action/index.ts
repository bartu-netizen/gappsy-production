import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";
import { startCampaign, pauseCampaign, resumeCampaign } from "../_shared/smartleadClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-supabase-auth, Accept, Origin",
};

interface ActionRequest {
  campaign_id: string;
  action: "start" | "pause" | "resume";
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const adminUser = await requireAdminSession(req);
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") || "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || ""
    );

    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ ok: false, error: "Method not allowed" }),
        { status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const body: ActionRequest = await req.json();
    const { campaign_id, action } = body;

    if (!campaign_id || typeof campaign_id !== "string" || campaign_id.trim() === "") {
      return new Response(
        JSON.stringify({ ok: false, error: "campaign_id is required and must be non-empty" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (!["start", "pause", "resume"].includes(action)) {
      return new Response(
        JSON.stringify({ ok: false, error: "action must be one of: start, pause, resume" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    let success = false;
    let smartleadResult: Record<string, unknown> = {};
    let errorMessage: string | null = null;

    try {
      switch (action) {
        case "start":   success = await startCampaign(campaign_id); break;
        case "pause":   success = await pauseCampaign(campaign_id); break;
        case "resume":  success = await resumeCampaign(campaign_id); break;
      }
      smartleadResult = { status: success ? "success" : "error" };
    } catch (error) {
      success = false;
      errorMessage = error instanceof Error ? error.message : String(error);
      smartleadResult = { status: "error", message: errorMessage };
    }

    try {
      await supabase.from("smartlead_campaign_actions_log").insert({
        campaign_id,
        action,
        requested_by: adminUser.id || "unknown",
        request_payload: { campaign_id, action },
        response_payload: smartleadResult,
        success,
        error_message: errorMessage,
      });
    } catch (logError) {
      console.error("Failed to log campaign action:", logError);
    }

    return new Response(
      JSON.stringify({ ok: success, campaign_id, action, smartlead_result: smartleadResult, error: errorMessage }),
      { status: success ? 200 : 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-campaign-action] error:", message);
    return new Response(
      JSON.stringify({ ok: false, error: message }),
      { status: message.includes("Unauthorized") ? 401 : 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
