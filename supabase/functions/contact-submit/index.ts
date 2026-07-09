import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import nodemailer from "npm:nodemailer@6.9.13";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function extractDeviceType(ua: string): string {
  const u = ua.toLowerCase();
  if (/mobile|android|iphone|ipod|blackberry|windows phone/.test(u)) return "mobile";
  if (/tablet|ipad/.test(u)) return "tablet";
  return "desktop";
}

async function geoLookup(ip: string): Promise<{ country_code: string | null; country_name: string | null; city: string | null }> {
  if (!ip || ip === "127.0.0.1" || ip.startsWith("::")) {
    return { country_code: null, country_name: null, city: null };
  }
  try {
    const res = await fetch(`https://ipapi.co/${ip}/json/`, {
      signal: AbortSignal.timeout(2000),
    });
    if (!res.ok) return { country_code: null, country_name: null, city: null };
    const data = await res.json();
    return {
      country_code: data.country_code ?? null,
      country_name: data.country_name ?? null,
      city: data.city ?? null,
    };
  } catch {
    return { country_code: null, country_name: null, city: null };
  }
}

async function sendInternalNotification(params: {
  full_name: string;
  email: string;
  subject: string;
  message: string;
  page_url?: string;
}) {
  const host = Deno.env.get("SMTP_HOST");
  const port = parseInt(Deno.env.get("SMTP_PORT") ?? "587");
  const user = Deno.env.get("SMTP_USERNAME");
  const pass = Deno.env.get("SMTP_PASSWORD");
  const from = Deno.env.get("SMTP_FROM_SUPPORT") ?? user;
  const to   = Deno.env.get("SMTP_INTERNAL_EMAIL") ?? user;

  if (!host || !user || !pass || !to) return;

  const transporter = nodemailer.createTransport({
    host, port, secure: port === 465,
    auth: { user, pass },
  });

  const pageContext = params.page_url ? `\n\nSubmitted from: ${params.page_url}` : "";

  await transporter.sendMail({
    from: `"Gappsy Contact" <${from}>`,
    to,
    subject: `New Contact: ${params.subject}`,
    text: `From: ${params.full_name} <${params.email}>\nSubject: ${params.subject}\n\n${params.message}${pageContext}`,
    html: `<p><strong>From:</strong> ${params.full_name} &lt;${params.email}&gt;</p><p><strong>Subject:</strong> ${params.subject}</p><hr/><p>${params.message.replace(/\n/g, "<br>")}</p>${params.page_url ? `<p><small>Submitted from: ${params.page_url}</small></p>` : ""}`,
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ ok: false, error: "POST required" }), {
      status: 405, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }

  try {
    const body = await req.json();

    const full_name = String(body.full_name ?? body.fullName ?? "").trim();
    const email     = String(body.email ?? "").trim().toLowerCase();
    const subject   = String(body.subject ?? "").trim();
    const message   = String(body.message ?? "").trim();

    if (!full_name || !email || !subject || !message) {
      return new Response(JSON.stringify({ ok: false, error: "Missing required fields" }), {
        status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    const ip = req.headers.get("x-forwarded-for")?.split(",")[0]?.trim()
      ?? req.headers.get("x-real-ip")
      ?? null;
    const user_agent = req.headers.get("user-agent") ?? null;

    const page_url      = body.page_url      ? String(body.page_url).substring(0, 2048)      : null;
    const page_path     = body.page_path     ? String(body.page_path).substring(0, 512)      : null;
    const referrer_url  = body.referrer_url  ? String(body.referrer_url).substring(0, 2048)  : null;
    const utm_source    = body.utm_source    ? String(body.utm_source).substring(0, 256)    : null;
    const utm_medium    = body.utm_medium    ? String(body.utm_medium).substring(0, 256)    : null;
    const utm_campaign  = body.utm_campaign  ? String(body.utm_campaign).substring(0, 256)  : null;
    const utm_term      = body.utm_term      ? String(body.utm_term).substring(0, 256)      : null;
    const utm_content   = body.utm_content   ? String(body.utm_content).substring(0, 256)   : null;

    const email_normalized = email.toLowerCase().trim();
    const thread_key       = email_normalized;
    const device_type      = user_agent ? extractDeviceType(user_agent) : null;

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } },
    );

    const geo = await geoLookup(ip ?? "");

    const { data: inserted, error: insertErr } = await supabase
      .from("contact_messages")
      .insert({
        full_name,
        email,
        subject,
        message,
        ip_address: ip,
        user_agent,
        handled: false,
        status: "new",
        message_direction: "inbound",
        thread_key,
        email_normalized,
        page_url,
        page_path,
        referrer_url,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_term,
        utm_content,
        device_type,
        country_code: geo.country_code,
        country_name: geo.country_name,
        city: geo.city,
      })
      .select("id")
      .single();

    if (insertErr) {
      console.error("[contact-submit] insert error:", insertErr.message);
      return new Response(JSON.stringify({ ok: false, error: "Failed to save message" }), {
        status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    EdgeRuntime.waitUntil(
      sendInternalNotification({ full_name, email, subject, message, page_url: page_url ?? undefined })
        .catch(err => console.error("[contact-submit] notification failed:", err?.message))
    );

    return new Response(JSON.stringify({ ok: true, id: inserted?.id }), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[contact-submit] error:", message);
    return new Response(JSON.stringify({ ok: false, error: "Internal error" }), {
      status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }
});
