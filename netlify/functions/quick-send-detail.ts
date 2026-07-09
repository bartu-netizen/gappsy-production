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

function extractPath(event: HandlerEvent): string {
  return (
    event.path ||
    (event as any).rawUrl?.replace(/^https?:\/\/[^/]+/, "") ||
    ""
  );
}

function parseMessagePath(rawPath: string): { messageId: string; sub: string } {
  const cleaned = rawPath.replace(/\/+$/, "");
  const parts = cleaned.split("/").filter(Boolean);
  const messagesIdx = parts.indexOf("messages");
  if (messagesIdx === -1) return { messageId: "", sub: "" };
  return {
    messageId: parts[messagesIdx + 1] || "",
    sub: parts[messagesIdx + 2] || "",
  };
}

const uuidRe = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

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

  const rawPath = extractPath(event);
  const { messageId, sub } = parseMessagePath(rawPath);

  if (!messageId) {
    return jsonResp(400, {
      error: "Missing message ID",
      debug_path: rawPath,
      debug_parts: rawPath.split("/"),
    });
  }

  if (!uuidRe.test(messageId)) {
    return jsonResp(400, {
      error: "Invalid message ID format",
      received: messageId,
      debug_path: rawPath,
    });
  }

  const action = sub || "message";

  const edgePath = sub
    ? `/functions/v1/quick-send-admin-read/messages/${messageId}/${sub}`
    : `/functions/v1/quick-send-admin-read/messages/${messageId}`;

  const edgeUrl = `${SUPABASE_URL}${edgePath}`;

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
    console.error("[quick-send-detail] proxy error:", err);
    return jsonResp(502, {
      error: "Proxy error: " + (err instanceof Error ? err.message : String(err)),
      action,
      messageId,
    });
  }
};

export { handler };
