import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { sendEmail } from "../_shared/emailClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function escHtml(s: string): string {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

function str(v: unknown): string {
  const s = String(v ?? "").trim();
  return s === "null" || s === "undefined" ? "" : s;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return json({ ok: false, error: "Method not allowed" }, 405);
  }

  let body: any;
  try {
    body = await req.json();
  } catch {
    return json({ ok: false, error: "Invalid JSON" }, 400);
  }

  const { request_id, mode } = body;
  if (!request_id) {
    return json({ ok: false, error: "request_id required" }, 400);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    // Load availability request
    const { data: request } = await supabase
      .from("agency_availability_requests")
      .select("*")
      .eq("id", request_id)
      .maybeSingle();

    if (!request) {
      return json({ ok: false, error: "Request not found" }, 404);
    }

    const routingDecision = request.routing_decision ?? "unknown";
    const targetAgencyId = request.target_agency_id;
    const toEmail = request.target_agency_email;

    if (!toEmail) {
      await supabase.from("agency_email_events").insert({
        agency_id: targetAgencyId,
        request_id,
        event_type: routingDecision === "forward_paid" ? "lead_forward_paid" : "sales_unpaid_single",
        to_email: "",
        subject: "",
        status: "skipped",
        error: "No email on file",
        metadata: { mode },
      });
      return json({ ok: true, status: "skipped", reason: "no_email" });
    }

    // Load global settings
    const { data: globalSettings } = await supabase
      .from("notification_settings")
      .select("enabled, recipients")
      .eq("form_type", "agency_emails_global")
      .maybeSingle();

    const globalEnabled = globalSettings?.enabled ?? false;
    if (!globalEnabled && mode !== "test") {
      await supabase.from("agency_email_events").insert({
        agency_id: targetAgencyId,
        request_id,
        event_type: routingDecision === "forward_paid" ? "lead_forward_paid" : "sales_unpaid_single",
        to_email: toEmail,
        subject: "",
        status: "skipped",
        error: "Global agency emails disabled",
        metadata: { mode },
      });
      return json({ ok: true, status: "skipped", reason: "global_disabled" });
    }

    // Load agency preferences
    const { data: prefs } = await supabase
      .from("agency_email_preferences")
      .select("allow_lead_emails, allow_marketing_emails, unsub_token")
      .eq("agency_id", targetAgencyId)
      .maybeSingle();

    const allowLeadEmails = prefs?.allow_lead_emails ?? true;
    const allowMarketingEmails = prefs?.allow_marketing_emails ?? true;
    const unsubToken = prefs?.unsub_token ?? "";

    // Check preferences
    if (routingDecision === "forward_paid" && !allowLeadEmails) {
      await supabase.from("agency_email_events").insert({
        agency_id: targetAgencyId,
        request_id,
        event_type: "lead_forward_paid",
        to_email: toEmail,
        subject: "",
        status: "skipped_opted_out",
        error: "Agency opted out of lead emails",
        metadata: { mode },
      });
      return json({ ok: true, status: "skipped_opted_out", reason: "lead_emails" });
    }

    if (routingDecision === "no_forward_unpaid" && !allowMarketingEmails) {
      await supabase.from("agency_email_events").insert({
        agency_id: targetAgencyId,
        request_id,
        event_type: "sales_unpaid_single",
        to_email: toEmail,
        subject: "",
        status: "skipped_opted_out",
        error: "Agency opted out of marketing emails",
        metadata: { mode },
      });
      return json({ ok: true, status: "skipped_opted_out", reason: "marketing_emails" });
    }

    // Build email
    let subject = "";
    let html = "";

    if (routingDecision === "forward_paid") {
      subject = `[Gappsy] New availability request — ${escHtml(request.state_name)} — ${escHtml(request.requester_name)}`;
      html = buildPaidLeadEmail(request, unsubToken);
    } else {
      subject = `[Gappsy] Someone checked your availability on Top-25 ${escHtml(request.state_name)}`;
      html = buildUnpaidSalesEmail(request, unsubToken);
    }

    const result = await sendEmail({
      to: toEmail,
      subject,
      html,
    });

    const eventType = routingDecision === "forward_paid" ? "lead_forward_paid" : "sales_unpaid_single";
    const status = result.success ? "sent" : "failed";

    await supabase.from("agency_email_events").insert({
      agency_id: targetAgencyId,
      request_id,
      event_type: eventType,
      to_email: toEmail,
      subject,
      status,
      error: result.error ?? null,
      metadata: { mode },
    });

    if (result.success) {
      await supabase
        .from("agency_availability_requests")
        .update({ agency_email_status: "sent" })
        .eq("id", request_id);
    }

    return json({ ok: result.success, status, error: result.error ?? null });
  } catch (e: unknown) {
    console.error("[send-agency-availability-email]", e);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});

function buildPaidLeadEmail(request: any, unsubToken: string): string {
  const prefsUrl = `https://www.gappsy.com/email-preferences?token=${escHtml(unsubToken)}`;
  const requesterFirstName = (request.requester_name ?? "").split(" ")[0] || "Contact";

  return `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f8fafc;font-family:sans-serif">
<table width="100%" cellpadding="0" cellspacing="0" style="background:#f8fafc;padding:32px 20px">
<tr><td align="center">
<table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%">
<tr><td style="background:#1d4ed8;border-radius:12px 12px 0 0;padding:28px 32px;color:#fff">
<p style="margin:0;font-size:11px;font-weight:600;letter-spacing:0.08em;text-transform:uppercase">Gappsy Lead</p>
<h1 style="margin:6px 0 0;font-size:20px;font-weight:700">New Availability Request</h1>
<p style="margin:6px 0 0;font-size:13px;color:#dbeafe">${escHtml(request.state_name)}</p>
</td></tr>
<tr><td style="background:#fff;padding:32px;border-left:1px solid #e2e8f0;border-right:1px solid #e2e8f0">
<p style="margin:0 0 24px;font-size:14px;color:#1f2937">You're receiving this because you have an active paid listing on Gappsy Top-25.</p>
<div style="background:#f0fdf4;border-left:4px solid #22c55e;padding:16px;margin:24px 0;border-radius:4px">
<h2 style="margin:0 0 12px;font-size:16px;font-weight:600;color:#15803d">Lead Details</h2>
<table width="100%" cellpadding="0" cellspacing="0" style="font-size:14px">
<tr><td style="color:#6b7280;width:120px">Name</td><td style="color:#111827;font-weight:600">${escHtml(request.requester_name)}</td></tr>
<tr><td style="color:#6b7280">Email</td><td style="color:#111827;word-break:break-all">${escHtml(request.requester_email)}</td></tr>
${request.requester_phone ? `<tr><td style="color:#6b7280">Phone</td><td style="color:#111827">${escHtml(request.requester_phone)}</td></tr>` : ""}
${request.requester_company ? `<tr><td style="color:#6b7280">Company</td><td style="color:#111827">${escHtml(request.requester_company)}</td></tr>` : ""}
${request.requester_website ? `<tr><td style="color:#6b7280">Website</td><td style="color:#111827"><a href="${escHtml(request.requester_website)}" style="color:#1d4ed8;text-decoration:none">${escHtml(request.requester_website)}</a></td></tr>` : ""}
${request.requester_message ? `<tr><td style="color:#6b7280;vertical-align:top">Message</td><td style="color:#111827">${escHtml(request.requester_message).replace(/\n/g, "<br>")}</td></tr>` : ""}
</table>
</div>
<p style="margin:0;font-size:12px;color:#6b7280">You can reply directly to ${escHtml(request.requester_email)} to connect.</p>
</td></tr>
<tr><td style="background:#fff;padding:24px 32px;border-left:1px solid #e2e8f0;border-right:1px solid #e2e8f0;border-bottom:1px solid #e2e8f0;border-radius:0 0 12px 12px">
<p style="margin:0;font-size:12px;color:#6b7280">
<a href="${escHtml(prefsUrl)}" style="color:#1d4ed8;text-decoration:none">Manage email preferences</a> •
<a href="${escHtml(prefsUrl)}" style="color:#1d4ed8;text-decoration:none">Unsubscribe</a>
</p>
<p style="margin:12px 0 0;font-size:11px;color:#9ca3af">Gappsy • The Top-25 Marketing Agency Directory</p>
</td></tr>
</table>
</td></tr>
</table>
</body>
</html>`;
}

function buildUnpaidSalesEmail(request: any, unsubToken: string): string {
  const prefsUrl = `https://www.gappsy.com/email-preferences?token=${escHtml(unsubToken)}`;
  const upgradeUrl = `https://www.gappsy.com/upgrade?state=${escHtml(request.state_slug)}&agency=${escHtml(request.target_agency_id)}`;
  const requesterFirstName = (request.requester_name ?? "").split(" ")[0] || "someone";

  return `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f8fafc;font-family:sans-serif">
<table width="100%" cellpadding="0" cellspacing="0" style="background:#f8fafc;padding:32px 20px">
<tr><td align="center">
<table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%">
<tr><td style="background:#f59e0b;border-radius:12px 12px 0 0;padding:28px 32px;color:#fff">
<p style="margin:0;font-size:11px;font-weight:600;letter-spacing:0.08em;text-transform:uppercase">Gappsy Opportunity</p>
<h1 style="margin:6px 0 0;font-size:20px;font-weight:700">Someone checked your availability</h1>
<p style="margin:6px 0 0;font-size:13px;color:#fed7aa">Top-25 ${escHtml(request.state_name)}</p>
</td></tr>
<tr><td style="background:#fff;padding:32px;border-left:1px solid #e2e8f0;border-right:1px solid #e2e8f0">
<p style="margin:0 0 16px;font-size:14px;color:#1f2937">
A visitor just checked if you're available for a project via Gappsy Top-25 ${escHtml(request.state_name)}.
</p>
<p style="margin:0 0 24px;font-size:14px;color:#1f2937">
<strong>Their name:</strong> ${escHtml(requesterFirstName)}
</p>
<div style="background:#fef3c7;border-left:4px solid #f59e0b;padding:16px;margin:24px 0;border-radius:4px">
<p style="margin:0;font-size:14px;color:#92400e">
Because your listing isn't a paid upgrade, we routed this lead to another agency in ${escHtml(request.state_name)}.
However, you can still upgrade to receive future leads directly.
</p>
</div>
<a href="${escHtml(upgradeUrl)}" style="display:inline-block;background:#f59e0b;color:#fff;font-size:14px;font-weight:600;padding:12px 24px;border-radius:8px;text-decoration:none;margin:16px 0">Activate paid listing</a>
<p style="margin:24px 0 0;font-size:12px;color:#6b7280">
Upgrade to Standard, Spotlight, or Top-25 to get leads forwarded directly to you.
</p>
</td></tr>
<tr><td style="background:#fff;padding:24px 32px;border-left:1px solid #e2e8f0;border-right:1px solid #e2e8f0;border-bottom:1px solid #e2e8f0;border-radius:0 0 12px 12px">
<p style="margin:0;font-size:12px;color:#6b7280">
<a href="${escHtml(prefsUrl)}" style="color:#1d4ed8;text-decoration:none">Manage email preferences</a> •
<a href="${escHtml(prefsUrl)}" style="color:#1d4ed8;text-decoration:none">Unsubscribe</a>
</p>
<p style="margin:12px 0 0;font-size:11px;color:#9ca3af">Gappsy • The Top-25 Marketing Agency Directory</p>
</td></tr>
</table>
</td></tr>
</table>
</body>
</html>`;
}
