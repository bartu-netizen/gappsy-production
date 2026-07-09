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

type FormType =
  | "get_matched"
  | "sponsored_spotlight"
  | "top25_submission"
  | "availability_check"
  | "confirm_connection";

interface SubmitPayload {
  form_type: FormType;
  state_slug?: string;
  page_path?: string;
  submitted_at?: string;
  contact?: {
    name?: string;
    first_name?: string;
    last_name?: string;
    email?: string;
    phone?: string;
    company?: string;
  };
  payload: Record<string, unknown>;
  utm?: Record<string, string>;
  meta?: Record<string, unknown>;
  client_submission_id?: string;
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

// Normalize select values: accept string OR { value, label } object
function normalize(v: unknown): string {
  if (typeof v === "string") return v.trim();
  if (v && typeof v === "object") {
    const o = v as Record<string, unknown>;
    return str(o.label ?? o.value ?? "");
  }
  return "";
}

function renderTemplate(template: string, vars: Record<string, string>): string {
  return template.replace(/\{\{(\w+)\}\}/g, (_, key) => vars[key] ?? "");
}

function renderSubject(template: string, context: Record<string, string>): string {
  return renderTemplate(template, context);
}

function buildEmailHtml(formType: FormType, payload: Record<string, unknown>, rowId: string, adminUrl: string): string {
  const formLabels: Record<FormType, string> = {
    get_matched: "Get Matched",
    sponsored_spotlight: "Sponsored Spotlight",
    top25_submission: "Top 25 Submission",
    availability_check: "Availability Check",
    confirm_connection: "Confirm Connection",
  };

  const label = formLabels[formType] ?? formType;
  const now = new Date().toLocaleString("en-US", { timeZone: "America/New_York", dateStyle: "medium", timeStyle: "short" });

  const rows = Object.entries(payload)
    .filter(([k]) => !["meta", "utm", "client_submission_id"].includes(k))
    .map(([k, v]) => {
      const label = k.replace(/_/g, " ").replace(/\b\w/g, c => c.toUpperCase());
      const val = v !== null && v !== undefined && v !== "" ? escHtml(String(v)) : '<span style="color:#9ca3af">—</span>';
      return `<tr>
        <td style="padding:8px 12px;font-size:13px;color:#6b7280;white-space:nowrap;border-bottom:1px solid #f3f4f6;vertical-align:top;width:160px">${escHtml(label)}</td>
        <td style="padding:8px 12px;font-size:14px;color:#111827;border-bottom:1px solid #f3f4f6;word-break:break-word">${val}</td>
      </tr>`;
    }).join("");

  return `<!DOCTYPE html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>${escHtml(label)} Notification</title></head>
<body style="margin:0;padding:0;background:#f8fafc;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f8fafc;padding:40px 20px">
    <tr><td align="center">
      <table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%">
        <!-- Header -->
        <tr>
          <td style="background:#0f172a;border-radius:12px 12px 0 0;padding:28px 32px">
            <p style="margin:0;font-size:11px;font-weight:600;letter-spacing:0.08em;color:#94a3b8;text-transform:uppercase">Gappsy Admin</p>
            <h1 style="margin:6px 0 0;font-size:22px;font-weight:700;color:#ffffff">New ${escHtml(label)} Submission</h1>
            <p style="margin:6px 0 0;font-size:13px;color:#64748b">${now} ET</p>
          </td>
        </tr>
        <!-- Body -->
        <tr>
          <td style="background:#ffffff;padding:0;border-left:1px solid #e2e8f0;border-right:1px solid #e2e8f0">
            <table width="100%" cellpadding="0" cellspacing="0">
              ${rows}
            </table>
          </td>
        </tr>
        <!-- CTA -->
        <tr>
          <td style="background:#ffffff;padding:24px 32px 32px;border-left:1px solid #e2e8f0;border-right:1px solid #e2e8f0;border-bottom:1px solid #e2e8f0;border-radius:0 0 12px 12px">
            <a href="${escHtml(adminUrl)}" style="display:inline-block;background:#1d4ed8;color:#ffffff;font-size:14px;font-weight:600;padding:12px 24px;border-radius:8px;text-decoration:none">View in Admin Dashboard</a>
            <p style="margin:20px 0 0;font-size:12px;color:#9ca3af">Submission ID: ${escHtml(rowId)}</p>
          </td>
        </tr>
        <!-- Footer -->
        <tr>
          <td style="padding:20px 0;text-align:center">
            <p style="margin:0;font-size:12px;color:#9ca3af">This is an internal admin notification from Gappsy. Do not forward.</p>
          </td>
        </tr>
      </table>
    </td></tr>
  </table>
</body>
</html>`;
}

async function insertFormRow(
  supabase: ReturnType<typeof createClient>,
  formType: FormType,
  body: SubmitPayload
): Promise<{ id: string; error?: string }> {
  const p = body.payload ?? {};
  const utm = body.utm ?? {};
  const meta = body.meta ?? {};

  const sharedFields = {
    state_slug: body.state_slug ?? str(p.state_slug),
    utm_source: utm.utm_source ?? null,
    utm_medium: utm.utm_medium ?? null,
    utm_campaign: utm.utm_campaign ?? null,
    created_at: body.submitted_at ?? new Date().toISOString(),
  };

  let table = "";
  let row: Record<string, unknown> = {};

  if (formType === "get_matched") {
    table = "matched_leads";
    const svc = normalize(p.service);
    const bdg = normalize(p.budget);
    const tml = normalize(p.timeline);
    const emailVal = str(p.email ?? body.contact?.email);
    const firstNameVal = str(p.first_name ?? body.contact?.name ?? body.contact?.first_name);
    const lastNameVal = str(p.last_name ?? body.contact?.last_name);
    const contactName = firstNameVal && lastNameVal
      ? `${firstNameVal} ${lastNameVal}`
      : firstNameVal || lastNameVal;
    row = {
      ...sharedFields,
      // New canonical columns (used by wpadmin-submissions for display)
      first_name: firstNameVal,
      last_name: lastNameVal,
      email: emailVal,
      phone: str(p.phone ?? body.contact?.phone),
      company_name: str(p.company_name ?? p.company ?? body.contact?.company),
      service: svc,
      budget: bdg,
      timeline: tml,
      message: str(p.message),
      status: str(p.status) || "new",
      // Legacy columns kept in sync so get-matched-lead rows and submit-and-notify rows both have data
      client_email: emailVal,
      client_name: contactName || firstNameVal || "Not provided",
      service_needed: svc,
      budget_range: bdg,
      // Raw snapshot for debugging
      payload: { ...p, contact: body.contact },
      meta: { ...meta, utm: body.utm },
    };
  } else if (formType === "sponsored_spotlight") {
    table = "spotlight_applications";
    row = {
      ...sharedFields,
      agency_name: str(p.agency_name ?? p.company_name ?? body.contact?.company),
      contact_name: str(p.contact_name ?? body.contact?.name),
      email: str(p.email ?? body.contact?.email),
      phone: str(p.phone ?? body.contact?.phone),
      website: str(p.website),
      state_name: str(p.state_name),
      message: str(p.message),
      status: str(p.status) || "pending",
    };
  } else if (formType === "top25_submission") {
    table = "top25_applications";
    row = {
      ...sharedFields,
      agency_name: str(p.agency_name ?? p.company_name ?? body.contact?.company),
      contact_name: str(p.contact_name ?? body.contact?.name),
      email: str(p.email ?? body.contact?.email),
      phone: str(p.phone ?? body.contact?.phone),
      website: str(p.website),
      state_name: str(p.state_name),
      message: str(p.message),
      status: str(p.status) || "pending",
    };
  } else if (formType === "availability_check") {
    table = "agency_availability_requests";
    const targetAgencyId = str(p.agency_id) || null;
    const targetAgencyName = str(p.agency_name);
    const stateSlug = body.state_slug ?? str(p.state_slug);

    // Determine if this is a demo submission
    const isDemo = meta?.is_demo === true || meta?.source_flow === "demo";
    const sourceFlow = isDemo ? "demo" : (str(meta?.source_flow) || "live");

    // Determine if agency is paid (basis for routing decision)
    let isPaid = false;
    if (targetAgencyId && stateSlug) {
      const { data: listing } = await supabase
        .from("agency_listings")
        .select("paid_active, listing_tier")
        .eq("agency_id", targetAgencyId)
        .eq("state_slug", stateSlug)
        .maybeSingle();
      isPaid = listing?.paid_active === true &&
               ["standard", "spotlight", "top25"].includes(listing?.listing_tier);
    }

    const routingDecision = isPaid ? "forward_paid" : "no_forward_unpaid";
    const leadVisibility = isPaid ? "full" : "withheld";

    // Build requester fields
    const requesterName = str(p.contact_name ?? body.contact?.name ?? p.first_name);
    const requesterEmail = str(p.contact_email ?? p.email ?? body.contact?.email);
    const serviceInterest = str(p.service_interest ?? p.service);
    const budgetVal = str(p.budget);
    const timelineVal = str(p.timeline);

    row = {
      // New canonical columns
      target_agency_id: targetAgencyId,
      target_agency_email: str(p.target_agency_email) || null,
      requester_name: requesterName,
      requester_email: requesterEmail,
      requester_phone: str(p.contact_phone ?? p.phone ?? body.contact?.phone) || null,
      requester_company: str(p.company ?? p.requester_company) || null,
      requester_website: str(p.website ?? p.requester_website) || null,
      requester_message: str(p.message),
      service_interest: serviceInterest,
      state_slug: stateSlug,
      state_name: str(p.state_name),
      source_page: body.page_path ?? null,
      routing_decision: routingDecision,
      paid_status_at_time: isPaid ? "paid" : "unpaid",
      lead_visibility: leadVisibility,
      agency_email_status: "disabled",
      status: "pending",
      is_demo: isDemo,
      source_flow: sourceFlow,
      source_context: {
        page_path: body.page_path ?? null,
        utm_source: body.utm?.utm_source ?? null,
        utm_medium: body.utm?.utm_medium ?? null,
        utm_campaign: body.utm?.utm_campaign ?? null,
      },
      // Legacy columns for wpadmin-submissions UI compatibility
      agency_name: targetAgencyName,
      client_name: requesterName,
      client_email: requesterEmail,
      service: serviceInterest,
      budget: budgetVal,
      timeline: timelineVal,
      created_at: body.submitted_at ?? new Date().toISOString(),
    };
  } else if (formType === "confirm_connection") {
    table = "agency_connection_confirms";
    row = {
      agency_id: str(p.agency_id) || null,
      agency_name: str(p.agency_name),
      contact_name: str(p.contact_name ?? body.contact?.name),
      contact_email: str(p.contact_email ?? p.email ?? body.contact?.email),
      contact_phone: str(p.contact_phone ?? p.phone ?? body.contact?.phone),
      message: str(p.message),
      state_slug: body.state_slug ?? str(p.state_slug),
      state_name: str(p.state_name),
      page_path: body.page_path ?? null,
      utm_source: utm.utm_source ?? null,
      utm_medium: utm.utm_medium ?? null,
      utm_campaign: utm.utm_campaign ?? null,
      meta: meta,
    };
  } else {
    return { id: "", error: `Unknown form_type: ${formType}` };
  }

  const { data, error } = await supabase
    .from(table)
    .insert(row)
    .select("id")
    .single();

  if (error) return { id: "", error: error.message };
  return { id: str(data?.id) };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return json({ ok: false, error: "Method not allowed" }, 405);
  }

  let body: SubmitPayload;
  try {
    body = await req.json();
  } catch {
    return json({ ok: false, error: "Invalid JSON" }, 400);
  }

  if (!body.form_type || !body.payload) {
    return json({ ok: false, error: "form_type and payload are required" }, 400);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    const { id: rowId, error: insertError } = await insertFormRow(supabase, body.form_type, body);
    if (insertError || !rowId) {
      return json({ ok: false, error: insertError ?? "Insert failed" }, 500);
    }

    // ── SETTINGS LOOKUP: new table first, fallback to legacy ────────────────
    const { data: newSetting } = await supabase
      .from("email_notification_settings")
      .select("is_enabled, recipient_emails, subject_template, body_html, body_text")
      .eq("notification_type", body.form_type)
      .maybeSingle();

    let enabled: boolean;
    let recipientsRaw: string;
    let subjectTemplate: string;
    let bodyHtmlTemplate: string;
    let bodyTextTemplate: string | null;

    if (newSetting) {
      enabled = newSetting.is_enabled ?? true;
      recipientsRaw = newSetting.recipient_emails ?? "";
      subjectTemplate = newSetting.subject_template ?? "";
      bodyHtmlTemplate = newSetting.body_html ?? "";
      bodyTextTemplate = newSetting.body_text ?? null;
    } else {
      const { data: legacySetting } = await supabase
        .from("notification_settings")
        .select("enabled, recipients, subject_template")
        .eq("form_type", body.form_type)
        .maybeSingle();
      enabled = legacySetting?.enabled ?? true;
      recipientsRaw = legacySetting?.recipients ?? "";
      subjectTemplate = legacySetting?.subject_template ?? "";
      bodyHtmlTemplate = "";
      bodyTextTemplate = null;
    }

    const EMERGENCY_FALLBACK_RECIPIENT = "bartu@gappsy.com";
    const SMTP_INTERNAL_EMAIL = Deno.env.get("SMTP_INTERNAL_EMAIL") ?? "";

    let recipients = recipientsRaw.split(",").map((r: string) => r.trim()).filter(Boolean);
    let recipientSource = "none";

    // 3-TIER FALLBACK SYSTEM: Never silently skip admin notifications
    // Tier 1: Use configured recipients from DB settings
    if (recipients.length > 0) {
      recipientSource = "settings";
      console.log(`[submit-and-notify] ${body.form_type}: Using recipients from settings:`, recipients.join(", "));
    }

    // Tier 2: Fallback to SMTP_INTERNAL_EMAIL env var
    if (recipients.length === 0 && SMTP_INTERNAL_EMAIL) {
      recipients = [SMTP_INTERNAL_EMAIL];
      recipientSource = "smtp_internal_email";
      console.log(`[submit-and-notify] ${body.form_type}: Using SMTP_INTERNAL_EMAIL fallback:`, SMTP_INTERNAL_EMAIL);
    }

    // Tier 3: EMERGENCY fallback to hardcoded bartu@gappsy.com
    if (recipients.length === 0) {
      recipients = [EMERGENCY_FALLBACK_RECIPIENT];
      recipientSource = "emergency_hardcoded_fallback";
      console.warn(`[submit-and-notify] ${body.form_type}: EMERGENCY FALLBACK - Using hardcoded recipient:`, EMERGENCY_FALLBACK_RECIPIENT);
    }

    let notifyStatus: "sent" | "failed" | "skipped" = "skipped";
    let notifyError: string | null = null;
    let providerMsgId: string | null = null;
    const recipientsList: string[] = [];

    if (enabled) {
      const p = body.payload ?? {};

      // ── BUILD TEMPLATE VARS ──────────────────────────────────────────────
      const company = str(
        p.company_name ?? p.agency_name ?? p.company ??
        body.contact?.company ?? body.contact?.name ?? ""
      );
      const agency = str(p.agency_name ?? p.agency ?? company);
      const contactName = str(
        p.contact_name ?? p.first_name ??
        body.contact?.name ?? body.contact?.first_name ?? ""
      );
      const pagePath = body.page_path ?? "";
      const pageUrl = pagePath.startsWith("/")
        ? `https://www.gappsy.com${pagePath}`
        : "https://www.gappsy.com";

      const vars: Record<string, string> = {
        company,
        contact_name: contactName,
        agency,
        state: str(body.state_slug ?? p.state_slug ?? p.state_name ?? ""),
        email: str(p.email ?? p.contact_email ?? body.contact?.email ?? ""),
        phone: str(p.phone ?? p.contact_phone ?? body.contact?.phone ?? ""),
        budget: str(p.budget ?? p.budget_range ?? ""),
        timeline: str(p.timeline ?? ""),
        service_needed: str(p.service ?? p.service_interest ?? p.service_needed ?? ""),
        submission_url: "https://www.gappsy.com/wp-admin/submissions",
        page_url: pageUrl,
        form_type: body.form_type,
      };

      // ── SUBJECT ──────────────────────────────────────────────────────────
      const subject = subjectTemplate
        ? renderTemplate(subjectTemplate, vars)
        : `New ${body.form_type} submission`;

      // ── BODY ─────────────────────────────────────────────────────────────
      const adminUrl = "https://www.gappsy.com/wp-admin/submissions";
      const emailHtml = bodyHtmlTemplate
        ? renderTemplate(bodyHtmlTemplate, vars)
        : buildEmailHtml(body.form_type, { ...body.payload, ...body.contact }, rowId, adminUrl);

      const emailText = bodyTextTemplate ? renderTemplate(bodyTextTemplate, vars) : undefined;

      const result = await sendEmail({
        to: recipients,
        subject,
        html: emailHtml,
        ...(emailText ? { text: emailText } : {}),
      });

      recipientsList.push(...recipients);
      if (result.success) {
        notifyStatus = "sent";
        providerMsgId = (result as any).messageId ?? null;
      } else {
        notifyStatus = "failed";
        notifyError = result.error ?? "Unknown SMTP error";
      }

      // ── LOG TO email_notification_logs (wp-admin visible) ────────────────
      await supabase
        .from("email_notification_logs")
        .insert({
          notification_type: body.form_type,
          is_test: false,
          to_emails: recipients.join(", "),
          subject,
          status: notifyStatus,
          provider: "smtp",
          provider_message_id: providerMsgId,
          error_message: notifyError,
          payload: {
            ...vars,
            recipient_source: recipientSource,
            funnel_session_id: String(body.meta?.funnel_session_id ?? ""),
          },
          request_id: rowId,
        })
        .then(() => {});
    }

    // ── LEGACY LOG (backward compat) ─────────────────────────────────────
    const logRow: Record<string, unknown> = {
      form_type: body.form_type,
      row_id: rowId,
      status: notifyStatus,
      recipients_json: recipientsList,
      provider_message_id: providerMsgId,
      error: notifyError,
      payload_snapshot: body.payload,
    };
    if (body.client_submission_id) {
      logRow.client_submission_id = body.client_submission_id;
    }

    await supabase
      .from("email_notifications_log")
      .insert(logRow)
      .then(() => {});

    return json({
      ok: true,
      row_id: rowId,
      notify_status: notifyStatus,
      notify_error: notifyError,
    });
  } catch (e: unknown) {
    console.error("[submit-and-notify] Unexpected error:", e instanceof Error ? e.message : e);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});
