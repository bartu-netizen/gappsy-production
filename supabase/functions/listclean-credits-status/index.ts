import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { adminAuth } from "../_shared/adminAuth.ts";
import { listcleanGetCredits } from "../_shared/listcleanClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    // Authenticate admin
    const authResult = await adminAuth(req);
    if (!authResult.authenticated) {
      return new Response(JSON.stringify({ ok: false, error: "Unauthorized" }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);

    // Get thresholds from env or use defaults
    const warningThreshold = parseInt(Deno.env.get("LISTCLEAN_CREDITS_WARNING_THRESHOLD") || "5000");
    const criticalThreshold = parseInt(Deno.env.get("LISTCLEAN_CREDITS_CRITICAL_THRESHOLD") || "1000");

    // Fetch current credits from ListClean
    let credits = 0;
    let error = null;
    try {
      const creditsData = await listcleanGetCredits();
      credits = creditsData.credits;
    } catch (err) {
      error = err instanceof Error ? err.message : "Failed to fetch credits";
      if (import.meta.env.DEV) {
        console.error("[listclean-credits-status] Error fetching credits:", err);
      }
    }

    // Determine status
    let status = "error";
    if (!error) {
      if (credits <= criticalThreshold) {
        status = "critical";
      } else if (credits <= warningThreshold) {
        status = "warning";
      } else {
        status = "ok";
      }
    }

    // Get monitor state
    const { data: monitorState } = await supabase
      .from("listclean_monitor_state")
      .select("*")
      .eq("id", "default")
      .maybeSingle();

    return new Response(
      JSON.stringify({
        ok: true,
        credits,
        status,
        threshold_warning: warningThreshold,
        threshold_critical: criticalThreshold,
        queue_auto_paused: monitorState?.queue_auto_paused || false,
        queue_pause_reason: monitorState?.queue_pause_reason || null,
        manual_pause: monitorState?.manual_pause || false,
        last_checked_at: monitorState?.last_checked_at || null,
        last_alert_sent_at: monitorState?.last_alert_sent_at || null,
        last_alert_type_sent: monitorState?.last_alert_type_sent || null,
        error,
      }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (err) {
    const message = err instanceof Error ? err.message : "Unknown error";
    if (import.meta.env.DEV) {
      console.error("[listclean-credits-status] Error:", err);
    }

    return new Response(
      JSON.stringify({
        ok: false,
        error: message,
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
