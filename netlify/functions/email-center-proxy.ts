import { Handler, HandlerEvent, HandlerContext } from "@netlify/functions";

/**
 * Email Center Proxy - Forwards requests to Supabase Edge Function
 *
 * This proxy forwards Email Center API requests to the Supabase Edge Function.
 * The Supabase URL is hardcoded for Bolt-managed deployments.
 *
 * Test connectivity: /wp-admin/api/email-center-upstream-check
 */

const ALLOWED_ORIGIN = "https://www.gappsy.com";
const BASE_URL = "https://jczdgzhnsyzvbpfqueyy.supabase.co/functions/v1";

const handler: Handler = async (event: HandlerEvent, context: HandlerContext) => {
  const SUPABASE_FUNCTION_URL = `${BASE_URL}/email-center`;
  const corsHeaders = {
    "Access-Control-Allow-Origin": ALLOWED_ORIGIN,
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "content-type, x-admin-secret",
    "Content-Type": "application/json",
  };

  // Handle OPTIONS preflight
  if (event.httpMethod === "OPTIONS") {
    return {
      statusCode: 200,
      headers: {
        ...corsHeaders,
        "Access-Control-Max-Age": "86400",
      },
      body: JSON.stringify({ ok: true, stage: "preflight" }),
    };
  }

  // Only allow POST
  if (event.httpMethod !== "POST") {
    return {
      statusCode: 405,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: false,
        stage: "method_validation",
        error: "Method not allowed. Use POST.",
        method: event.httpMethod,
      }),
    };
  }

  // Validate body exists
  if (!event.body) {
    return {
      statusCode: 400,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: false,
        stage: "body_validation",
        error: "Request body is required",
      }),
    };
  }

  // Validate JSON
  let parsedBody;
  try {
    parsedBody = JSON.parse(event.body);
  } catch (e) {
    return {
      statusCode: 400,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: false,
        stage: "json_parsing",
        error: "Invalid JSON in request body",
        details: e instanceof Error ? e.message : String(e),
      }),
    };
  }

  // Get admin secret header (never log the value)
  const adminSecret = event.headers["x-admin-secret"] || "";
  const hasAdminSecretHeader = adminSecret.length > 0;

  // Forward to Supabase Edge Function
  try {
    const upstreamResponse = await fetch(SUPABASE_FUNCTION_URL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-admin-secret": adminSecret,
      },
      body: event.body,
    });

    const upstreamStatus = upstreamResponse.status;
    let upstreamData;

    // Try to parse upstream response as JSON
    const upstreamText = await upstreamResponse.text();
    try {
      upstreamData = JSON.parse(upstreamText);
    } catch (e) {
      // If upstream didn't return JSON, wrap it
      upstreamData = {
        raw: upstreamText,
        parseError: "Upstream response was not JSON",
      };
    }

    // Return upstream response with metadata
    return {
      statusCode: upstreamStatus,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: upstreamStatus >= 200 && upstreamStatus < 300,
        stage: "upstream_response",
        upstreamStatus,
        hasAdminSecretHeader,
        data: upstreamData,
      }),
    };
  } catch (error) {
    // Network error or fetch failure
    return {
      statusCode: 502,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: false,
        stage: "upstream_fetch_failed",
        error: "Failed to connect to upstream service",
        hasAdminSecretHeader,
        details: {
          message: error instanceof Error ? error.message : String(error),
          errorName: error instanceof Error ? error.name : "Unknown",
          errorCode: (error as any)?.code,
          upstream: SUPABASE_FUNCTION_URL,
          hint: "Test upstream connectivity at: /wp-admin/api/email-center-upstream-check",
        },
      }),
    };
  }
};

export { handler };
