import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import * as nodemailer from "npm:nodemailer@7.0.12";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface QuickSendPayload {
  messageId: string;
  toEmail: string;
  toName?: string;
  subject: string;
  fromName?: string;
  fromEmail?: string;
  replyTo?: string;
  htmlBody: string;
  textBody?: string;
}

function getSmtpConfig() {
  const host = Deno.env.get("SMTP_HOST")?.trim() ?? "";
  const portStr = Deno.env.get("SMTP_PORT")?.trim() ?? "";
  const username = Deno.env.get("SMTP_USERNAME")?.trim() ?? "";
  const password = Deno.env.get("SMTP_PASSWORD")?.trim() ?? "";

  if (!host || !portStr || !username || !password) {
    return null;
  }

  const port = parseInt(portStr, 10);
  if (isNaN(port)) return null;

  return { host, port, username, password };
}

async function getSenderIdentity(
  supabaseUrl: string,
  supabaseServiceRole: string,
  overrides?: { fromName?: string; fromEmail?: string; replyTo?: string }
) {
  let fromName = "Gappsy";
  let fromEmail = "noreply@gappsy.com";
  let replyTo: string | undefined;

  try {
    const supabase = createClient(supabaseUrl, supabaseServiceRole);
    const { data: settings } = await supabase
      .from("email_sender_settings")
      .select("default_from_name, default_from_email, default_reply_to")
      .maybeSingle();

    if (settings) {
      fromName = settings.default_from_name || "Gappsy";
      fromEmail = settings.default_from_email || "noreply@gappsy.com";
      replyTo = settings.default_reply_to;
    }
  } catch (err) {
    console.error("Error fetching sender settings:", err);
  }

  if (overrides?.fromName) fromName = overrides.fromName;
  if (overrides?.fromEmail) fromEmail = overrides.fromEmail;
  if (overrides?.replyTo) replyTo = overrides.replyTo;

  return { fromName, fromEmail, replyTo };
}

function wrapPlainTextInHtml(text: string, subject: string): string {
  const escaped = text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .split("\n")
    .map((line) => `<p style="margin:0 0 1em 0;">${line || "&nbsp;"}</p>`)
    .join("\n");

  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${subject.replace(/</g, "&lt;")}</title>
</head>
<body style="margin:0;padding:0;background:#f9fafb;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;">
  <div style="max-width:600px;margin:40px auto;background:#ffffff;border-radius:8px;padding:32px 40px;border:1px solid #e5e7eb;">
    ${escaped}
  </div>
</body>
</html>`;
}

function ensureHtmlBody(raw: string, subject: string): string {
  const trimmed = raw.trim();
  if (/^<!doctype\s+html/i.test(trimmed) || /^<html/i.test(trimmed)) {
    return trimmed;
  }
  if (/<\/?(div|p|span|br|table|h[1-6]|ul|ol|li|a)\b/i.test(trimmed)) {
    return `<!DOCTYPE html><html><head><meta charset="UTF-8"></head><body style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;max-width:600px;margin:40px auto;padding:0 20px;">${trimmed}</body></html>`;
  }
  return wrapPlainTextInHtml(trimmed, subject);
}

function getTrackingBaseUrl(): string {
  const supabaseUrl = Deno.env.get("SUPABASE_URL") ?? "";
  if (supabaseUrl) return supabaseUrl;
  return "https://jczdgzhnsyzvbpfqueyy.supabase.co";
}

function rewriteLinksForTracking(htmlBody: string, messageId: string): string {
  const trackingBaseUrl = `${getTrackingBaseUrl()}/functions/v1/email-track-click`;

  return htmlBody.replace(
    /href="([^"]+)"/g,
    (match, url) => {
      if (url.startsWith("#") || url.startsWith("mailto:") || url.includes("/functions/v1/email-track")) {
        return match;
      }
      const encodedUrl = encodeURIComponent(url);
      return `href="${trackingBaseUrl}?mid=${messageId}&u=${encodedUrl}"`;
    }
  );
}

function addOpenPixel(htmlBody: string, messageId: string): { html: string; pixelUrl: string } {
  const pixelUrl = `${getTrackingBaseUrl()}/functions/v1/email-track-open?mid=${messageId}`;
  const pixel = `\n<img src="${pixelUrl}" width="1" height="1" style="display:none;border:0;outline:none;" alt="" />`;

  let html: string;
  const bodyCloseIdx = htmlBody.lastIndexOf("</body>");
  if (bodyCloseIdx !== -1) {
    html = htmlBody.slice(0, bodyCloseIdx) + pixel + "\n" + htmlBody.slice(bodyCloseIdx);
  } else {
    html = htmlBody + pixel;
  }

  return { html, pixelUrl };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return new Response(
      JSON.stringify({ error: "Method not allowed" }),
      { status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }

  let payload: QuickSendPayload | null = null;

  try {
    payload = await req.json() as QuickSendPayload;

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceRole = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseServiceRole) {
      return new Response(
        JSON.stringify({ error: "Server configuration error" }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRole);

    const smtpConfig = getSmtpConfig();
    if (!smtpConfig) {
      await supabase
        .from("email_messages")
        .update({ status: "failed" })
        .eq("id", payload.messageId);

      return new Response(
        JSON.stringify({ error: "SMTP not configured" }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const identity = await getSenderIdentity(supabaseUrl, supabaseServiceRole, {
      fromName: payload.fromName,
      fromEmail: payload.fromEmail,
      replyTo: payload.replyTo,
    });

    let htmlBody = ensureHtmlBody(payload.htmlBody, payload.subject);
    htmlBody = rewriteLinksForTracking(htmlBody, payload.messageId);
    const { html: finalHtml, pixelUrl } = addOpenPixel(htmlBody, payload.messageId);

    console.log(`[quick-send-send] messageId=${payload.messageId} pixelUrl=${pixelUrl}`);

    const transporter = nodemailer.createTransport({
      host: smtpConfig.host,
      port: smtpConfig.port,
      secure: smtpConfig.port === 465,
      auth: {
        user: smtpConfig.username,
        pass: smtpConfig.password,
      },
    });

    const mailOptions: Record<string, any> = {
      from: `${identity.fromName} <${identity.fromEmail}>`,
      to: payload.toEmail,
      subject: payload.subject,
      html: finalHtml,
      text: payload.textBody || payload.htmlBody.replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim(),
    };

    if (identity.replyTo) {
      mailOptions.replyTo = identity.replyTo;
    }

    const info = await transporter.sendMail(mailOptions);

    await supabase
      .from("email_messages")
      .update({
        status: "sent",
        sent_at: new Date().toISOString(),
        provider_message_id: info.messageId || undefined,
        final_body_html: finalHtml,
        tracking_pixel_url: pixelUrl,
        tracking_enabled: true,
      })
      .eq("id", payload.messageId);

    console.log(`[quick-send-send] sent ok providerId=${info.messageId}`);

    return new Response(
      JSON.stringify({
        success: true,
        messageId: payload.messageId,
        providerId: info.messageId,
        trackingPixelUrl: pixelUrl,
      }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("[quick-send-send] error:", error);

    if (payload?.messageId) {
      try {
        const supabaseUrl = Deno.env.get("SUPABASE_URL");
        const supabaseServiceRole = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
        if (supabaseUrl && supabaseServiceRole) {
          const supabase = createClient(supabaseUrl, supabaseServiceRole);
          await supabase
            .from("email_messages")
            .update({ status: "failed" })
            .eq("id", payload.messageId);
        }
      } catch (_) {}
    }

    return new Response(
      JSON.stringify({ error: error instanceof Error ? error.message : "Failed to send email" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
