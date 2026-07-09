import { Handler, HandlerEvent } from "@netlify/functions";

const SUPABASE_URL = "https://jczdgzhnsyzvbpfqueyy.supabase.co";
const SUPABASE_ANON_KEY =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjemRnemhuc3l6dmJwZnF1ZXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxOTMzMjAsImV4cCI6MjA3OTc2OTMyMH0.YBz187aDqkiNHaURnGHcOfK5moytq7mcmVZYVGjHP3M";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "content-type, authorization, x-admin-token",
  "Content-Type": "application/json",
};

function jsonResp(statusCode: number, body: object) {
  return { statusCode, headers: corsHeaders, body: JSON.stringify(body) };
}

const handler: Handler = async (event: HandlerEvent) => {
  if (event.httpMethod === "OPTIONS") {
    return { statusCode: 200, headers: corsHeaders, body: "" };
  }

  if (event.httpMethod !== "GET") {
    return jsonResp(405, { error: "Method not allowed" });
  }

  const adminToken =
    event.headers["x-admin-token"] ||
    event.headers["authorization"]?.replace(/^Bearer\s+/i, "") ||
    "";

  if (!adminToken || adminToken.length < 8) {
    return jsonResp(401, { error: "Unauthorized" });
  }

  const edgeUrl = `${SUPABASE_URL}/functions/v1/quick-send-admin-read?action=list`;

  try {
    const res = await fetch(edgeUrl, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
        "x-admin-token": adminToken,
      },
    });

    const text = await res.text();
    let data: object;
    try {
      data = JSON.parse(text);
    } catch {
      data = { error: `Non-JSON from edge (${res.status})`, raw: text.substring(0, 300) };
    }

    return {
      statusCode: res.status,
      headers: corsHeaders,
      body: JSON.stringify(data),
    };
  } catch (err) {
    console.error("[quick-send-list] proxy error:", err);
    return jsonResp(502, {
      error: "Proxy error: " + (err instanceof Error ? err.message : String(err)),
    });
  }
};

export { handler };
