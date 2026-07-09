import { Handler, HandlerEvent, HandlerContext } from "@netlify/functions";

/**
 * Email Center Upstream Check - Tests connectivity to Supabase Edge Function
 *
 * This diagnostic endpoint verifies that the Netlify proxy can reach the Supabase Edge Function.
 * The Supabase URL is hardcoded for Bolt-managed deployments.
 */

const BASE_URL = "https://jczdgzhnsyzvbpfqueyy.supabase.co/functions/v1";

const handler: Handler = async (event: HandlerEvent, context: HandlerContext) => {
  const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET, OPTIONS",
    "Access-Control-Allow-Headers": "content-type",
    "Content-Type": "application/json",
  };

  // Handle OPTIONS preflight
  if (event.httpMethod === "OPTIONS") {
    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({ ok: true }),
    };
  }

  const upstreamUrl = `${BASE_URL}/email-center`;

  // Test upstream connectivity
  try {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 5000);

    const response = await fetch(upstreamUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ action: "status" }),
      signal: controller.signal,
    });

    clearTimeout(timeoutId);

    const status = response.status;
    let responseText = "";
    try {
      responseText = await response.text();
    } catch (e) {
      responseText = "(could not read response body)";
    }

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: true,
        stage: "upstream_reachable",
        upstreamUrl,
        upstreamStatus: status,
        responsePreview: responseText.substring(0, 200),
        message: `Upstream is reachable (returned ${status})`,
      }),
    };
  } catch (error: any) {
    const errorName = error?.name || "Unknown";
    const errorCode = error?.code || error?.errno || "N/A";
    const errorMessage = error?.message || String(error);

    let hint = "Unknown error connecting to upstream.";
    if (errorName === "AbortError") {
      hint = "Upstream request timed out after 5 seconds. Check if URL is correct and service is running.";
    } else if (errorCode === "ENOTFOUND") {
      hint = "DNS lookup failed. The upstream hostname does not exist or is misspelled.";
    } else if (errorCode === "ECONNREFUSED") {
      hint = "Connection refused. The upstream service is not accepting connections.";
    } else if (errorCode === "ETIMEDOUT") {
      hint = "Connection timed out. The upstream service may be unreachable or blocked by firewall.";
    } else if (errorMessage.includes("fetch")) {
      hint = "Fetch failed. This may be a network error or CORS issue.";
    }

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: false,
        stage: "upstream_fetch_failed",
        upstreamUrl,
        error: errorMessage,
        errorName,
        errorCode,
        hint,
        troubleshooting: [
          "Check if Supabase function is deployed and running",
          "Test URL directly: curl -X POST " + upstreamUrl,
          "Verify no firewall blocking Netlify -> Supabase traffic",
          "Check Supabase Dashboard -> Edge Functions -> email-center for logs",
        ],
      }),
    };
  }
};

export { handler };
