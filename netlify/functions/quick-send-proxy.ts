import { Handler, HandlerEvent } from "@netlify/functions";

const SUPABASE_URL = "https://jczdgzhnsyzvbpfqueyy.supabase.co";
const SUPABASE_ANON_KEY =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjemRnemhuc3l6dmJwZnF1ZXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxOTMzMjAsImV4cCI6MjA3OTc2OTMyMH0.YBz187aDqkiNHaURnGHcOfK5moytq7mcmVZYVGjHP3M";

const corsHeaders = {
  "Access-Control-Allow-Origin": "https://gappsy.com",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "content-type, authorization, x-admin-token",
  "Content-Type": "application/json",
};

function jsonResp(statusCode: number, body: object) {
  return { statusCode, headers: corsHeaders, body: JSON.stringify(body) };
}

async function callEdgeFn(
  fn: string,
  adminToken: string,
  payload: unknown
): Promise<{ status: number; data: unknown; text: string }> {
  const url = `${SUPABASE_URL}/functions/v1/${fn}`;
  const res = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
      "x-admin-token": adminToken,
    },
    body: JSON.stringify(payload),
  });
  const text = await res.text();
  let data: unknown;
  try {
    data = JSON.parse(text);
  } catch {
    data = { raw: text };
  }
  return { status: res.status, data, text };
}

const handler: Handler = async (event: HandlerEvent) => {
  if (event.httpMethod === "OPTIONS") {
    return { statusCode: 200, headers: corsHeaders, body: "" };
  }

  if (event.httpMethod !== "POST") {
    return jsonResp(405, { error: "Method not allowed" });
  }

  const adminToken =
    event.headers["x-admin-token"] ||
    event.headers["authorization"]?.replace(/^Bearer\s+/i, "") ||
    "";

  if (!adminToken) {
    return jsonResp(401, { error: "Unauthorized: missing admin token" });
  }

  if (!event.body) {
    return jsonResp(400, { error: "Request body is required" });
  }

  let payload: {
    toEmail?: string;
    toName?: string;
    subject?: string;
    htmlBody?: string;
    textBody?: string;
  };

  try {
    payload = JSON.parse(event.body);
  } catch {
    return jsonResp(400, { error: "Invalid JSON in request body" });
  }

  const { toEmail, subject, htmlBody } = payload;

  if (!toEmail || !subject || !htmlBody) {
    return jsonResp(400, {
      error: "Missing required fields",
      fields: { toEmail: !toEmail, subject: !subject, htmlBody: !htmlBody },
    });
  }

  const emailRe = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRe.test(toEmail)) {
    return jsonResp(400, { error: "Invalid email address" });
  }

  try {
    const createResult = await callEdgeFn("quick-send-create", adminToken, {
      toEmail: toEmail.trim(),
      toName: payload.toName?.trim() || undefined,
      subject: subject.trim(),
      htmlBody,
      textBody: payload.textBody || undefined,
    });

    if (createResult.status !== 200) {
      const errData = createResult.data as Record<string, unknown>;
      return jsonResp(createResult.status, {
        error: errData?.error || "Failed to create message",
        phase: "create",
        upstream_status: createResult.status,
        upstream_body: createResult.text.substring(0, 400),
      });
    }

    const created = createResult.data as { id: string };
    const messageId = created.id;

    if (!messageId) {
      return jsonResp(500, {
        error: "Create returned no message ID",
        phase: "create",
        upstream_body: createResult.text.substring(0, 400),
      });
    }

    const sendResult = await callEdgeFn("quick-send-send", adminToken, {
      messageId,
      toEmail: toEmail.trim(),
      toName: payload.toName?.trim() || undefined,
      subject: subject.trim(),
      htmlBody,
      textBody: payload.textBody || undefined,
    });

    if (sendResult.status !== 200) {
      const errData = sendResult.data as Record<string, unknown>;
      return jsonResp(sendResult.status, {
        error: errData?.error || "Failed to send email",
        phase: "send",
        messageId,
        upstream_status: sendResult.status,
        upstream_body: sendResult.text.substring(0, 400),
      });
    }

    return jsonResp(200, {
      ok: true,
      id: messageId,
      status: "sent",
    });
  } catch (err) {
    return jsonResp(502, {
      error: "Proxy error: " + (err instanceof Error ? err.message : String(err)),
      phase: "proxy",
    });
  }
};

export { handler };
