import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { requireAdminSession } from "../_shared/adminSession.ts";
import { getSmartleadRuntimeHealth } from "../_shared/smartleadHealth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) return authResult;

    const url = new URL(req.url);
    const testConnectivity = url.searchParams.get("test_connectivity") === "true";

    const health = await getSmartleadRuntimeHealth({ testConnectivity });

    const warnings: string[] = [];

    if (!health.api_key_configured) {
      warnings.push(
        "SMARTLEAD_API_KEY not visible in Edge Function runtime. " +
        "If you added it in Bolt Secrets, the secret may still be syncing. " +
        "Try redeploying this function or triggering a rebuild in Bolt."
      );
    }

    if (!health.webhook_secret_configured) {
      warnings.push(
        "SMARTLEAD_WEBHOOK_SECRET not configured. " +
        "Webhook events may not validate correctly."
      );
    }

    if (health.tested_connectivity && !health.smartlead_api_reachable) {
      warnings.push(
        `Smartlead API connectivity test failed: ${health.smartlead_api_test_error}`
      );
    }

    return new Response(
      JSON.stringify({
        ok: true,
        health,
        warnings,
        diagnostic_info: {
          check_type: "edge_function_runtime",
          bolt_managed: true,
          note: "This health check validates the Supabase Edge Function runtime (server-side), " +
                "not frontend or Bolt UI secret storage.",
        },
      }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error("smartlead-health-check error:", message);

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
