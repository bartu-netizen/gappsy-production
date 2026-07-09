import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { sendEmail } from "../_shared/emailClient.ts";
import { getSmtpConfig } from "../_shared/smtp.ts";
import { CORS_HEADERS as corsHeaders } from "../_shared/adminSession.ts";
import { verifySessionToken } from "../_shared/adminSession.ts";

const REQUIRED_SMTP_VARS = [
  "SMTP_HOST",
  "SMTP_PORT",
  "SMTP_USERNAME",
  "SMTP_PASSWORD",
  "SMTP_FROM_SUPPORT",
  "SMTP_INTERNAL_EMAIL",
] as const;

type SmtpVarName = typeof REQUIRED_SMTP_VARS[number];

function readSmtpVars(): Record<SmtpVarName, string | undefined> {
  const result: Partial<Record<SmtpVarName, string | undefined>> = {};
  for (const key of REQUIRED_SMTP_VARS) {
    const val = Deno.env.get(key);
    result[key] = val;
    console.log(`[smtp-test] env ${key} = ${val ? `"${val.substring(0, 4)}…" (len=${val.length})` : "NOT SET"}`);
  }
  return result as Record<SmtpVarName, string | undefined>;
}

async function authenticateRequest(req: Request): Promise<{ ok: boolean; reason?: string }> {
  const xAdminToken = req.headers.get("x-admin-token")?.trim() || "";
  const xAdminSecret = req.headers.get("x-admin-secret")?.trim() || "";
  const authHeader = req.headers.get("Authorization")?.trim() || "";
  const bearerToken = authHeader.startsWith("Bearer ") ? authHeader.substring(7).trim() : "";

  const token = xAdminToken || bearerToken;

  console.log(`[smtp-test] Auth check: x-admin-token=${!!xAdminToken}, x-admin-secret=${!!xAdminSecret}, bearer=${!!bearerToken}`);

  if (token) {
    const result = await verifySessionToken(token);
    console.log(`[smtp-test] Session token verify: ok=${result.ok}, error=${result.error ?? "none"}`);
    if (result.ok) return { ok: true };
    if (result.error === "expired") return { ok: false, reason: "Session expired — please log in again" };
  }

  if (xAdminSecret) {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (supabaseUrl && supabaseServiceKey) {
      const supabase = createClient(supabaseUrl, supabaseServiceKey, {
        auth: { autoRefreshToken: false, persistSession: false },
      });
      const { data: secretData } = await supabase
        .from("admin_secrets")
        .select("value")
        .eq("key", "ADMIN_IMPORT_SECRET")
        .maybeSingle();
      if (secretData?.value && xAdminSecret === secretData.value.trim()) {
        console.log("[smtp-test] Authenticated via admin secret");
        return { ok: true };
      }
    }
    return { ok: false, reason: "Invalid admin secret" };
  }

  if (!token && !xAdminSecret) {
    return { ok: false, reason: "No credentials provided. Include x-admin-token header." };
  }

  return { ok: false, reason: "Invalid credentials" };
}

async function logSendAttempt(params: {
  to_email: string;
  template_id: string;
  subject: string;
  status: "sent" | "failed";
  error_code?: string;
  error_message?: string;
  provider_message?: string;
  request_id?: string;
}) {
  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
    );
    await supabase.from("email_send_logs").insert(params);
  } catch (e) {
    console.warn("[smtp-test] Failed to write send log:", e);
  }
}

async function tcpCheck(host: string, port: number, timeoutMs = 5000): Promise<{ ok: boolean; stage: string; error_code: string; error_message: string }> {
  console.log(`[smtp-test] TCP check: ${host}:${port} (timeout=${timeoutMs}ms)`);

  const timeoutSignal = AbortSignal.timeout(timeoutMs);

  try {
    const conn = await (Deno as any).connectTls
      ? null
      : null;

    const connectPromise = (async () => {
      try {
        const tcpConn = await (Deno as any).connect({ hostname: host, port, transport: "tcp" });
        tcpConn.close();
        return { ok: true };
      } catch (err: any) {
        throw err;
      }
    })();

    const timeoutPromise = new Promise<never>((_, reject) =>
      setTimeout(() => reject(new Error("TCP_TIMEOUT")), timeoutMs)
    );

    await Promise.race([connectPromise, timeoutPromise]);

    console.log(`[smtp-test] TCP check succeeded: ${host}:${port}`);
    return { ok: true, stage: "tcp_connect", error_code: "", error_message: "" };
  } catch (err: any) {
    const msg: string = err?.message ?? String(err);
    console.warn(`[smtp-test] TCP check failed: ${host}:${port} — ${msg}`);

    if (msg === "TCP_TIMEOUT") {
      return { ok: false, stage: "tcp_connect", error_code: "TCP_TIMEOUT", error_message: `Connection to ${host}:${port} timed out after ${timeoutMs}ms` };
    }
    if (msg.includes("ENOTFOUND") || msg.includes("getaddrinfo") || msg.includes("dns") || msg.includes("Name or service not known")) {
      return { ok: false, stage: "dns_resolve", error_code: "ENOTFOUND", error_message: `Cannot resolve hostname "${host}". Check that SMTP_HOST is set to a valid SMTP server hostname.` };
    }
    if (msg.includes("ECONNREFUSED") || msg.includes("Connection refused")) {
      return { ok: false, stage: "tcp_connect", error_code: "ECONNREFUSED", error_message: `Connection to ${host}:${port} was refused. Verify the host and port are correct.` };
    }
    return { ok: false, stage: "tcp_connect", error_code: "CONNECT_ERROR", error_message: msg };
  }
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  const requestId = crypto.randomUUID();
  console.log(`[smtp-test] Incoming ${req.method} | request_id=${requestId}`);

  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return json({ ok: false, error: "METHOD_NOT_ALLOWED", message: "Only POST is supported" }, 405);
  }

  const authResult = await authenticateRequest(req);
  if (!authResult.ok) {
    console.warn(`[smtp-test] Auth failed: ${authResult.reason} | request_id=${requestId}`);
    return json({
      ok: false,
      error: "UNAUTHORIZED",
      message: authResult.reason ?? "Authentication failed",
      hint: "Make sure you are logged in to /wp-admin and your session has not expired.",
      request_id: requestId,
    }, 401);
  }

  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return json({ ok: false, error: "INVALID_JSON", message: "Request body must be valid JSON", request_id: requestId }, 400);
  }

  const action = String(body.action ?? "status");
  console.log(`[smtp-test] action=${action} | request_id=${requestId}`);

  if (action === "status") {
    const vars = readSmtpVars();

    const varStatus: Record<SmtpVarName, boolean> = {} as Record<SmtpVarName, boolean>;
    for (const key of REQUIRED_SMTP_VARS) {
      varStatus[key] = !!(vars[key] && vars[key]!.trim().length > 0);
    }

    const missing = REQUIRED_SMTP_VARS.filter((k) => !varStatus[k]);
    const present = REQUIRED_SMTP_VARS.filter((k) => varStatus[k]);
    const configured = missing.length === 0;

    const portStr = vars.SMTP_PORT;
    const portNumber = portStr ? parseInt(portStr, 10) : null;
    const host = vars.SMTP_HOST ?? null;

    console.log(`[smtp-test] Status: configured=${configured}, missing=[${missing.join(",")}], present=[${present.join(",")}] | request_id=${requestId}`);

    return json({
      ok: true,
      action: "status",
      configured,
      missing,
      present,
      vars: varStatus,
      details: {
        host: host ? host.substring(0, 6) + (host.length > 6 ? "…" : "") : null,
        hostFull: host,
        portNumber: portNumber && !isNaN(portNumber) ? portNumber : null,
        fromSupport: vars.SMTP_FROM_SUPPORT || null,
        internalEmail: vars.SMTP_INTERNAL_EMAIL || null,
      },
      request_id: requestId,
      hint: missing.length > 0
        ? `Missing vars: ${missing.join(", ")}. Add them in Supabase Dashboard → Project Settings → Edge Functions → Secrets (NOT in Bolt env).`
        : null,
    });
  }

  if (action === "check") {
    const smtpResult = getSmtpConfig();

    if (!smtpResult.ok || !smtpResult.config) {
      return json({
        ok: false,
        action: "check",
        stage: "config",
        error_code: "MISCONFIGURED",
        error_message: smtpResult.error ?? `Missing SMTP secrets: ${smtpResult.missing.join(", ")}`,
        missing: smtpResult.missing,
        host: null,
        port: null,
        request_id: requestId,
        hint: "Add the missing secrets in Supabase Dashboard → Project Settings → Edge Functions → Secrets.",
      }, 400);
    }

    const { host, port } = smtpResult.config;

    const is465 = port === 465;
    const encryption = is465 ? "ssl_tls" : "off";
    const starttls = is465 ? false : false;

    const tcpResult = await tcpCheck(host, port, 5000);

    const smtpComHint = host.includes("smtp.com") && !tcpResult.ok
      ? `For SMTP.com use send.smtp.com and port 2525 with Encryption OFF (ignoreTLS). Ensure SMTP_HOST=send.smtp.com and SMTP_PORT=2525.`
      : null;

    return json({
      ok: tcpResult.ok,
      action: "check",
      stage: tcpResult.ok ? "tcp_connect" : tcpResult.stage,
      error_code: tcpResult.ok ? null : tcpResult.error_code,
      error_message: tcpResult.ok ? null : tcpResult.error_message,
      host,
      port,
      encryption,
      auth: "on",
      starttls,
      request_id: requestId,
      hint: tcpResult.ok
        ? null
        : smtpComHint ?? (tcpResult.error_code === "ENOTFOUND"
          ? `The hostname "${host}" could not be resolved. Verify SMTP_HOST is correct (e.g. send.smtp.com for SMTP.com).`
          : `Connection to ${host}:${port} failed at stage "${tcpResult.stage}". For SMTP.com use send.smtp.com:2525 with Encryption OFF.`),
    }, tcpResult.ok ? 200 : 502);
  }

  if (action === "sendTest") {
    const to = String(body.to ?? "");
    const subject = String(body.subject ?? "Gappsy SMTP Test");
    const text = String(body.text ?? `Test email from Gappsy. Request ID: ${requestId}`);
    const html = String(body.html ?? `<p>Test email from Gappsy.</p><p>Request ID: ${requestId}</p>`);
    const templateId = String(body.templateId ?? "basic");

    if (!to || !to.includes("@")) {
      return json({ ok: false, error: "INVALID_EMAIL", message: "Invalid recipient email", request_id: requestId }, 400);
    }

    const vars = readSmtpVars();
    const missing = REQUIRED_SMTP_VARS.filter((k) => !(vars[k] && vars[k]!.trim().length > 0));
    if (missing.length > 0) {
      await logSendAttempt({
        to_email: to,
        template_id: templateId,
        subject,
        status: "failed",
        error_code: "MISCONFIGURED",
        error_message: `Missing SMTP vars: ${missing.join(", ")}`,
        request_id: requestId,
      });
      return json({
        ok: false,
        error: "MISCONFIGURED",
        message: `SMTP not fully configured. Missing: ${missing.join(", ")}`,
        missing,
        hint: "Add the missing secrets in Supabase Dashboard → Project Settings → Edge Functions → Secrets.",
        request_id: requestId,
      }, 500);
    }

    console.log(`[smtp-test] Sending test email to: ${to} | request_id=${requestId}`);

    const result = await sendEmail({
      to,
      subject,
      text,
      html,
      from: vars.SMTP_FROM_SUPPORT,
    });

    if (result.success) {
      console.log(`[smtp-test] ✓ Sent to: ${to} | request_id=${requestId}`);
      await logSendAttempt({
        to_email: to,
        template_id: templateId,
        subject,
        status: "sent",
        provider_message: "delivered",
        request_id: requestId,
      });
      return json({
        ok: true,
        action: "sendTest",
        to,
        from: vars.SMTP_FROM_SUPPORT,
        subject,
        message: `Email sent successfully to ${to}`,
        request_id: requestId,
      });
    } else {
      console.error(`[smtp-test] ✗ Send failed: ${result.error} | request_id=${requestId}`);
      await logSendAttempt({
        to_email: to,
        template_id: templateId,
        subject,
        status: "failed",
        error_code: "SEND_FAILED",
        error_message: result.error ?? "Unknown send error",
        request_id: requestId,
      });
      return json({
        ok: false,
        error: "SEND_FAILED",
        message: result.error ?? "Failed to send email. Check SMTP credentials.",
        request_id: requestId,
      }, 500);
    }
  }

  return json({
    ok: false,
    error: "UNKNOWN_ACTION",
    message: `Unknown action "${action}". Valid: "status", "check", "sendTest"`,
    request_id: requestId,
  }, 400);
});
