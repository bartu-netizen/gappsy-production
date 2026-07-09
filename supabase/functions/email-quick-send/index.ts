import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import * as nodemailer from "npm:nodemailer@7.0.12";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface QuickSendRequest {
  recipientEmail: string;
  recipientName?: string;
  subject: string;
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
  supabaseServiceRole: string
) {
  let fromName = "Gappsy";
  let fromEmail = "noreply@gappsy.com";
  let replyTo: string | undefined;

  try {
    const supabase = createClient(supabaseUrl, supabaseServiceRole);
    const { data: settings } = await supabase
      .from("em_settings")
      .select("key,value")
      .in("key", ["from_name", "from_email", "reply_to"]);

    if (settings) {
      const settingsMap: Record<string, string> = {};
      settings.forEach((row: any) => {
        settingsMap[row.key] = row.value;
      });
      fromName = settingsMap.from_name || "Gappsy";
      fromEmail = settingsMap.from_email || "noreply@gappsy.com";
      replyTo = settingsMap.reply_to || undefined;
    }
  } catch (err) {
    console.error("Error fetching sender settings:", err);
  }

  return { fromName, fromEmail, replyTo };
}

function rewriteLinksForTracking(htmlBody: string, sendId: string): string {
  const baseUrl = Deno.env.get("VITE_SUPABASE_URL") || "https://www.gappsy.com";
  const trackingBaseUrl = `${baseUrl}/functions/v1/email-track-click`;

  return htmlBody.replace(
    /href="([^"]+)"/g,
    (match, url) => {
      if (url.startsWith("#") || url.startsWith("mailto:")) {
        return match;
      }
      const encodedUrl = encodeURIComponent(url);
      return `href="${trackingBaseUrl}?sid=${sendId}&u=${encodedUrl}"`;
    }
  );
}

function addOpenPixel(htmlBody: string, sendId: string): string {
  const baseUrl = Deno.env.get("VITE_SUPABASE_URL") || "https://www.gappsy.com";
  const trackingUrl = `${baseUrl}/functions/v1/email-track-open?sid=${sendId}`;

  return (
    htmlBody +
    `\n<img src="${trackingUrl}" width="1" height="1" style="display:none" alt="" />`
  );
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  if (req.method !== "POST") {
    return new Response(
      JSON.stringify({ error: "Method not allowed" }),
      {
        status: 405,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }

  try {
    const payload: QuickSendRequest = await req.json();

    // Validation
    if (!payload.recipientEmail || !payload.subject || !payload.htmlBody) {
      return new Response(
        JSON.stringify({ error: "Missing required fields" }),
        {
          status: 400,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceRole = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseServiceRole) {
      return new Response(
        JSON.stringify({ error: "Server configuration error" }),
        {
          status: 500,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRole);

    // Get sender identity from settings
    const identity = await getSenderIdentity(supabaseUrl, supabaseServiceRole);

    const smtpConfig = getSmtpConfig();
    if (!smtpConfig) {
      return new Response(
        JSON.stringify({ error: "SMTP not configured" }),
        {
          status: 500,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    // Create em_sends record
    const { data: sendRecord, error: insertError } = await supabase
      .from("em_sends")
      .insert({
        recipient_email: payload.recipientEmail,
        recipient_name: payload.recipientName || null,
        subject: payload.subject,
        html_body: payload.htmlBody,
        text_body: payload.textBody || null,
        from_name: identity.fromName,
        from_email: identity.fromEmail,
        reply_to: identity.replyTo || null,
        status: "queued",
      })
      .select("id")
      .single();

    if (insertError || !sendRecord) {
      return new Response(
        JSON.stringify({ error: "Failed to create send record" }),
        {
          status: 500,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const sendId = sendRecord.id;

    // Prepare HTML with tracking
    let htmlBody = payload.htmlBody;
    htmlBody = rewriteLinksForTracking(htmlBody, sendId);
    htmlBody = addOpenPixel(htmlBody, sendId);

    // Send email via SMTP
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
      to: payload.recipientEmail,
      subject: payload.subject,
      html: htmlBody,
      text: payload.textBody || "",
    };

    if (identity.replyTo) {
      mailOptions.replyTo = identity.replyTo;
    }

    const info = await transporter.sendMail(mailOptions);

    // Update em_sends with sent status
    await supabase
      .from("em_sends")
      .update({
        status: "sent",
        updated_at: new Date().toISOString(),
        provider_message_id: info.messageId || undefined,
      })
      .eq("id", sendId);

    return new Response(
      JSON.stringify({
        ok: true,
        sendId: sendId,
        providerId: info.messageId,
      }),
      {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (error) {
    console.error("Quick send error:", error);

    return new Response(
      JSON.stringify({
        ok: false,
        error: error instanceof Error ? error.message : "Failed to send email",
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
