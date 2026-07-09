import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import nodemailer from "npm:nodemailer@6.9.13";
import { requireAdminSession } from "../_shared/adminSession.ts";

// This function sends an outbound reply email via SMTP from the configured
// support mailbox (SMTP_FROM_SUPPORT or SMTP_USERNAME).
//
// Recipient replies will go back to that same fromEmail address (used as replyTo).
// To route replies to a different mailbox, set SMTP_REPLY_TO in edge function secrets.

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

function buildHtml(bodyText: string): string {
  const escaped = bodyText
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\n/g, "<br>");
  return `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><style>
  body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; font-size: 15px; color: #1a1a1a; line-height: 1.6; margin: 0; padding: 0; background: #f5f5f5; }
  .wrapper { max-width: 600px; margin: 32px auto; background: #fff; border-radius: 8px; border: 1px solid #e5e7eb; overflow: hidden; }
  .body { padding: 32px; }
  .footer { padding: 16px 32px; background: #f9fafb; border-top: 1px solid #e5e7eb; font-size: 12px; color: #6b7280; }
</style></head>
<body>
  <div class="wrapper">
    <div class="body">${escaped}</div>
    <div class="footer">This message was sent via Gappsy. Please reply directly to this email to continue the conversation.</div>
  </div>
</body>
</html>`;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });
  if (req.method !== "POST") return json({ ok: false, error: "POST required" }, 405);

  try {
    const session = await requireAdminSession(req);

    const body = await req.json().catch(() => null);
    if (!body) return json({ ok: false, error: "Invalid JSON body" }, 400);

    const { contact_message_id, subject, body_text, to_email, to_name } = body;

    if (!to_email || !body_text || !subject) {
      return json({ ok: false, error: "to_email, subject, and body_text are required" }, 400);
    }

    console.log("[contact-inbox-reply] reply send started", {
      contact_message_id: contact_message_id ?? null,
      to_email,
      subject,
      sent_by: session.admin_email,
    });

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    // Fetch the original inbound message for thread_key resolution.
    // NOTE: True email thread linking (RFC 2822 In-Reply-To / References headers)
    // requires storing the inbound email's Message-ID header at submission time.
    // The contact_messages table does not currently store that header, so we
    // cannot set proper In-Reply-To / References headers here.
    // To enable true threading, add an `inbound_message_id` text column to
    // contact_messages and populate it when inbound messages are received.
    let originalMsg: { thread_key: string | null; email_normalized: string | null } | null = null;
    if (contact_message_id) {
      const { data } = await supabase
        .from("contact_messages")
        .select("id, email, email_normalized, full_name, subject, thread_key")
        .eq("id", contact_message_id)
        .maybeSingle();
      originalMsg = data;
    }

    const thread_key = originalMsg?.thread_key
      ?? originalMsg?.email_normalized
      ?? to_email.toLowerCase().trim();

    const smtpHost  = Deno.env.get("SMTP_HOST");
    const smtpPort  = parseInt(Deno.env.get("SMTP_PORT") ?? "587");
    const smtpUser  = Deno.env.get("SMTP_USERNAME");
    const smtpPass  = Deno.env.get("SMTP_PASSWORD");
    const fromEmail = Deno.env.get("SMTP_FROM_SUPPORT") ?? smtpUser ?? "hello@gappsy.com";
    const replyTo   = Deno.env.get("SMTP_REPLY_TO") ?? fromEmail;
    const fromName  = "Gappsy Support";

    if (!smtpHost || !smtpUser || !smtpPass) {
      return json({ ok: false, error: "SMTP not configured" }, 500);
    }

    const transporter = nodemailer.createTransport({
      host: smtpHost,
      port: smtpPort,
      secure: smtpPort === 465,
      auth: { user: smtpUser, pass: smtpPass },
    });

    const bodyHtml = buildHtml(body_text);

    // Step 1: Send via SMTP. If this fails, return an error immediately — no DB
    // writes should occur if the message was never delivered.
    let providerMsgId: string | null = null;
    try {
      const info = await transporter.sendMail({
        from: `"${fromName}" <${fromEmail}>`,
        to: to_name ? `"${to_name}" <${to_email}>` : to_email,
        replyTo,
        subject,
        text: body_text,
        html: bodyHtml,
      });
      providerMsgId = info.messageId ?? null;
      console.log("[contact-inbox-reply] SMTP send success", { messageId: providerMsgId, to: to_email });
    } catch (smtpErr) {
      const msg = smtpErr instanceof Error ? smtpErr.message : String(smtpErr);
      console.error("[contact-inbox-reply] SMTP send failed:", msg);
      return json({ ok: false, error: `Email delivery failed: ${msg}` }, 500);
    }

    // Step 2: Save outbound reply row.
    const { data: savedReply, error: saveErr } = await supabase
      .from("contact_message_replies")
      .insert({
        contact_message_id: contact_message_id ?? null,
        thread_key,
        direction: "outbound",
        subject,
        body_text,
        body_html: bodyHtml,
        to_email,
        to_name: to_name ?? null,
        from_email: fromEmail,
        from_name: fromName,
        sent_at: new Date().toISOString(),
        sent_by: session.admin_email,
        delivery_status: "sent",
        email_provider_message_id: providerMsgId,
      })
      .select("id")
      .single();

    if (saveErr) {
      console.error("[contact-inbox-reply] reply row save failed:", saveErr.message);
    } else {
      console.log("[contact-inbox-reply] reply row saved", { reply_id: savedReply?.id });
    }

    // Step 3: Mark original contact message as replied.
    if (contact_message_id) {
      const now = new Date().toISOString();

      const { error: updateErr } = await supabase
        .from("contact_messages")
        .update({
          status: "replied",
          replied_at: now,
          replied_by: session.admin_email,
        })
        .eq("id", contact_message_id);

      if (updateErr) {
        console.error("[contact-inbox-reply] original message status update failed:", updateErr.message);
      } else {
        console.log("[contact-inbox-reply] original message marked replied", { contact_message_id });
      }

      // Step 4: Atomically increment the outbound reply counter via RPC.
      // Best-effort: a warning is logged on failure but does not fail the request.
      const { error: incrementErr } = await supabase.rpc(
        "increment_contact_reply_count",
        { p_id: contact_message_id },
      );

      if (incrementErr) {
        console.warn("[contact-inbox-reply] increment_contact_reply_count failed:", incrementErr.message);
      } else {
        console.log("[contact-inbox-reply] reply count incremented", { contact_message_id });
      }
    }

    return json({
      ok: true,
      reply_id: savedReply?.id ?? null,
      provider_message_id: providerMsgId,
    });
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[contact-inbox-reply] unhandled error:", message);
    return json({ ok: false, error: message }, message.includes("Unauthorized") ? 401 : 500);
  }
});
