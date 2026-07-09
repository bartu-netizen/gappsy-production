import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";
import { sendEmail } from "../_shared/emailClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

// ── Safe template rendering ───────────────────────────────────────────────────

const KNOWN_VARS = [
  "company", "contact_name", "agency", "state", "email", "phone",
  "budget", "timeline", "service_needed", "submission_url", "page_url",
  "form_type", "notification_type",
  "agency_slug", "profile_url", "search_query", "imported_agency_email_count",
  "product", "listing_type", "amount", "currency", "customer_email",
  "customer_name", "session_id", "payment_intent_id", "subscription_id",
  "rank", "checkout_mode", "stripe_event_id",
  // stripe_checkout_opened vars
  "agency_name", "state_name", "state_slug", "agency_id", "entry_path",
  "checkout_session_id", "position", "listing_tier", "upsell_summary",
  "upsell_count", "offer_applied", "discount_type", "discount_value",
  "offer_token", "funnel_session_id",
  // stripe_checkout_opened enriched vars
  "basket_summary", "subtotal", "discount_amount", "total", "recurring_total",
  "likelihood", "agency_email",
  // activation_option_selected vars
  "selected_option", "selected_option_type", "selected_rank", "selected_price",
  "discount_percent", "next_destination", "your_agency_url", "request_replay_url",
  "activation_url", "requests_30d", "most_recent_request",
];

function renderTemplate(template: string, vars: Record<string, string>): string {
  return template.replace(/\{\{(\w+)\}\}/g, (_, key) => {
    if (KNOWN_VARS.includes(key) && vars[key] !== undefined) {
      return escHtml(vars[key]);
    }
    return "";
  });
}

function renderHtmlTemplate(template: string, vars: Record<string, string>): string {
  return template.replace(/\{\{(\w+)\}\}/g, (_, key) => {
    if (KNOWN_VARS.includes(key) && vars[key] !== undefined) {
      return escHtml(vars[key]);
    }
    return "";
  });
}

function escHtml(s: string): string {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

// ── Default body HTML builder (used when body_html is empty) ─────────────────

function buildDefaultBodyHtml(notifType: string, vars: Record<string, string>): string {
  const label = notifType.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
  const rows = Object.entries(vars)
    .filter(([k]) => !["submission_url", "page_url", "form_type", "notification_type"].includes(k))
    .filter(([, v]) => v)
    .map(([k, v]) => {
      const lbl = k.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
      return `<tr><td style="padding:8px 12px;font-size:13px;color:#6b7280;width:140px;vertical-align:top">${escHtml(lbl)}</td><td style="padding:8px 12px;font-size:14px;color:#111827">${escHtml(v)}</td></tr>`;
    })
    .join("");

  const adminUrl = vars.submission_url || "https://www.gappsy.com/wp-admin/submissions";

  return `<!DOCTYPE html><html><body style="font-family:sans-serif;background:#f8fafc;padding:32px;margin:0">
<div style="max-width:560px;margin:0 auto;background:#fff;border-radius:12px;border:1px solid #e2e8f0;overflow:hidden">
  <div style="background:#0f172a;padding:24px 28px">
    <h1 style="margin:0;font-size:20px;font-weight:700;color:#fff">New ${escHtml(label)}</h1>
  </div>
  <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse">${rows}</table>
  <div style="padding:20px 28px;border-top:1px solid #f3f4f6">
    <a href="${escHtml(adminUrl)}" style="background:#1d4ed8;color:#fff;padding:10px 20px;border-radius:8px;text-decoration:none;font-size:14px;font-weight:600;display:inline-block">View in Admin</a>
  </div>
</div>
</body></html>`;
}

// ── Sample payloads per notification type ─────────────────────────────────────

const SAMPLE_PAYLOADS: Record<string, Record<string, string>> = {
  get_matched: {
    company: "Acme Corp",
    contact_name: "Jane Smith",
    email: "jane@acme.com",
    phone: "555-123-4567",
    budget: "$5,000/mo",
    timeline: "ASAP",
    service_needed: "SEO, PPC",
    state: "New Jersey",
    page_url: "https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/",
    submission_url: "https://www.gappsy.com/wp-admin/submissions",
  },
  sponsored_spotlight: {
    company: "BrightEdge Agency",
    agency: "BrightEdge Agency",
    contact_name: "Mark Johnson",
    email: "mark@brightedge.com",
    phone: "555-987-6543",
    state: "California",
    submission_url: "https://www.gappsy.com/wp-admin/submissions",
  },
  top25_submission: {
    company: "Digital Surge",
    agency: "Digital Surge",
    contact_name: "Sarah Lee",
    email: "sarah@digitalsurge.com",
    phone: "555-456-7890",
    state: "Texas",
    submission_url: "https://www.gappsy.com/wp-admin/submissions",
  },
  availability_check: {
    agency: "ProMarketing Co",
    contact_name: "Tom Brown",
    email: "tom@promarketing.com",
    phone: "555-321-0987",
    state: "Florida",
    service_needed: "Email Marketing",
    submission_url: "https://www.gappsy.com/wp-admin/submissions",
  },
  confirm_connection: {
    agency: "NexGen Marketing",
    contact_name: "Lisa Chen",
    email: "lisa@nexgen.com",
    phone: "555-654-3210",
    state: "New York",
    submission_url: "https://www.gappsy.com/wp-admin/submissions",
  },
  your_agency_profile_click: {
    agency: "VazAgency",
    agency_slug: "vazagency",
    email: "contact@vazagency.com",
    profile_url: "https://www.gappsy.com/your-agency/vazagency",
    search_query: "digital marketing new jersey",
    imported_agency_email_count: "2",
    submission_url: "https://www.gappsy.com/wp-admin/submissions?type=your_agency_profile_clicks",
    page_url: "https://www.gappsy.com/your-agency/vazagency",
  },
  stripe_sale: {
    agency: "BrightEdge Agency",
    state: "California",
    product: "Top 25 Featured Listing",
    listing_type: "top25_featured",
    amount: "$297.00",
    currency: "usd",
    customer_email: "mark@brightedge.com",
    customer_name: "Mark Johnson",
    session_id: "cs_test_a1b2c3d4",
    payment_intent_id: "pi_test_x7y8z9",
    subscription_id: "",
    rank: "3",
    checkout_mode: "payment",
    stripe_event_id: "evt_test_abc123",
    submission_url: "https://www.gappsy.com/wp-admin/stripe",
  },
  activation_option_selected: {
    agency_name: "Digital Creations USA",
    agency: "Digital Creations USA",
    agency_slug: "digital-creations-usa",
    agency_id: "abc123-def456",
    state: "North Carolina",
    state_name: "North Carolina",
    state_slug: "north-carolina",
    selected_option: "Top 25 #2 ($297)",
    selected_option_type: "top25",
    selected_rank: "2",
    selected_price: "$297",
    discount_percent: "",
    next_destination: "Top 25 Confirm Page",
    your_agency_url: "https://www.gappsy.com/your-agency/digital-creations-usa",
    request_replay_url: "https://www.gappsy.com/request-replay/digital-creations-usa?aid=abc123-def456&stateSlug=north-carolina",
    activation_url: "https://www.gappsy.com/activation/upgrade?slug=digital-creations-usa&state=north-carolina",
    requests_30d: "12",
    most_recent_request: "2 hours ago",
    submission_url: "https://www.gappsy.com/wp-admin/analytics/agency-funnel",
  },
  stripe_checkout_opened: {
    agency_name: "Digital Creations USA",
    agency: "Digital Creations USA",
    agency_slug: "digital-creations-usa",
    agency_id: "abc123-def456",
    agency_email: "hello@digitalcreationsusa.com",
    state_name: "North Carolina",
    state: "North Carolina",
    state_slug: "north-carolina",
    checkout_session_id: "cs_test_a1b2c3d4e5f6",
    position: "Top 25 #2",
    listing_type: "top25",
    listing_tier: "premium",
    entry_path: "/your-agency/digital-creations-usa",
    basket_summary: "Premium Listing (Ranks 1–8) $297 + Card Visual Upgrade $37 + Get Matched Add-on $97",
    subtotal: "$431",
    discount_amount: "$86.20",
    total: "$344.80",
    recurring_total: "$344.80 / 6 months",
    likelihood: "HIGH",
    upsell_summary: "Yes — Card Visual Upgrade, Get Matched Add-on",
    upsell_count: "2",
    offer_applied: "true",
    discount_type: "percentage",
    discount_value: "20",
    offer_token: "SAVE20-DEMO",
    funnel_session_id: "fs_demo_xyz789",
    submission_url: "https://www.gappsy.com/wp-admin/funnel",
  },
};

// ── Log helper ────────────────────────────────────────────────────────────────

async function logNotification(
  supabase: ReturnType<typeof createClient>,
  opts: {
    notification_type: string;
    is_test: boolean;
    to_emails: string;
    subject: string;
    status: "sent" | "failed";
    error_message?: string;
    payload?: Record<string, unknown>;
    request_id?: string;
  }
) {
  try {
    await supabase.from("email_notification_logs").insert({
      notification_type: opts.notification_type,
      is_test: opts.is_test,
      to_emails: opts.to_emails,
      subject: opts.subject,
      status: opts.status,
      provider: "smtp",
      error_message: opts.error_message ?? null,
      payload: opts.payload ?? null,
      request_id: opts.request_id ?? null,
    });
  } catch (e) {
    console.error("[notification-settings-api] Log insert failed:", e);
  }
}

// ── Main handler ──────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const authResult = await authenticateAdmin(req);
  if (!authResult.success) return createAuthErrorResponse(authResult, corsHeaders);

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const url = new URL(req.url);
  const path = url.pathname.split("/notification-settings-api/")[1] ?? "";

  try {
    // ── GET /settings ──────────────────────────────────────────────────────
    if (path === "settings" && req.method === "GET") {
      const { data, error } = await supabase
        .from("email_notification_settings")
        .select("*")
        .order("notification_type");
      if (error) return json({ ok: false, error: error.message }, 500);
      return json({ ok: true, settings: data ?? [] });
    }

    // ── POST /settings — upsert one notification setting ──────────────────
    if (path === "settings" && req.method === "POST") {
      const body = await req.json();
      const { notification_type, is_enabled, recipient_emails, subject_template, body_html, body_text } = body;
      if (!notification_type) return json({ ok: false, error: "notification_type required" }, 400);

      const { error } = await supabase
        .from("email_notification_settings")
        .upsert(
          {
            notification_type,
            is_enabled: is_enabled ?? true,
            recipient_emails: recipient_emails ?? "",
            subject_template: subject_template ?? "",
            body_html: body_html ?? "",
            body_text: body_text ?? null,
            updated_at: new Date().toISOString(),
          },
          { onConflict: "notification_type" }
        );

      if (error) return json({ ok: false, error: error.message }, 500);
      return json({ ok: true });
    }

    // ── GET /logs ──────────────────────────────────────────────────────────
    if (path === "logs" && req.method === "GET") {
      const limit = Math.min(Number(url.searchParams.get("limit") ?? "50"), 200);
      const offset = Number(url.searchParams.get("offset") ?? "0");
      const notifType = url.searchParams.get("notification_type") ?? null;
      const statusFilter = url.searchParams.get("status") ?? null;
      const isTestParam = url.searchParams.get("is_test");

      let q = supabase
        .from("email_notification_logs")
        .select("id, created_at, notification_type, is_test, to_emails, subject, status, provider_message_id, error_message, payload, request_id")
        .order("created_at", { ascending: false })
        .range(offset, offset + limit - 1);

      if (notifType) q = q.eq("notification_type", notifType);
      if (statusFilter) q = q.eq("status", statusFilter);
      if (isTestParam !== null) q = q.eq("is_test", isTestParam === "true");

      const { data, error } = await q;
      if (error) return json({ ok: false, error: error.message }, 500);
      return json({ ok: true, logs: data ?? [] });
    }

    // ── POST /test — send test email for a specific notification type ──────
    if (path === "test" && req.method === "POST") {
      const body = await req.json();
      const { notification_type, to: toEmail, sample_payload_override } = body;

      if (!toEmail) return json({ ok: false, error: "to is required" }, 400);
      if (!toEmail.includes("@")) return json({ ok: false, error: "Invalid email address" }, 400);

      // Load settings for this type (or use basic defaults for generic test)
      let subject = "Test: Gappsy Internal Notification System";
      let htmlBody = `<!DOCTYPE html><html><body style="font-family:sans-serif;padding:32px;color:#111827"><h2 style="margin:0 0 12px">Test Notification</h2><p style="color:#6b7280">This is a test email from the Gappsy internal notification system.</p><p style="color:#6b7280;margin-top:24px;font-size:12px">Sent at ${new Date().toISOString()}</p></body></html>`;
      let vars: Record<string, string> = {};
      let settingType = notification_type ?? "test";

      if (notification_type) {
        const { data: setting } = await supabase
          .from("email_notification_settings")
          .select("subject_template, body_html, body_text")
          .eq("notification_type", notification_type)
          .maybeSingle();

        const sampleVars = SAMPLE_PAYLOADS[notification_type] ?? {};
        vars = { ...sampleVars, ...(sample_payload_override ?? {}), notification_type, form_type: notification_type };

        if (setting?.subject_template) {
          subject = `[TEST] ${renderTemplate(setting.subject_template, vars)}`;
        } else {
          subject = `[TEST] ${notification_type.replace(/_/g, " ")} notification`;
        }

        if (setting?.body_html && setting.body_html.trim()) {
          htmlBody = renderHtmlTemplate(setting.body_html, vars);
        } else {
          htmlBody = buildDefaultBodyHtml(notification_type, vars);
        }
      }

      const result = await sendEmail({ to: toEmail, subject, html: htmlBody });

      await logNotification(supabase, {
        notification_type: settingType,
        is_test: true,
        to_emails: toEmail,
        subject,
        status: result.success ? "sent" : "failed",
        error_message: result.error,
        payload: vars as Record<string, unknown>,
      });

      return json({ ok: result.success, error: result.error ?? null });
    }

    // ── POST /preview — render template with sample data (no send) ────────
    if (path === "preview" && req.method === "POST") {
      const body = await req.json();
      const { notification_type, subject_template, body_html, sample_payload_override } = body;

      const sampleVars = SAMPLE_PAYLOADS[notification_type ?? "get_matched"] ?? SAMPLE_PAYLOADS.get_matched;
      const vars: Record<string, string> = {
        ...sampleVars,
        ...(sample_payload_override ?? {}),
        notification_type: notification_type ?? "",
        form_type: notification_type ?? "",
      };

      const renderedSubject = renderTemplate(subject_template ?? "", vars);
      const renderedHtml = body_html?.trim()
        ? renderHtmlTemplate(body_html, vars)
        : buildDefaultBodyHtml(notification_type ?? "preview", vars);

      return json({ ok: true, subject: renderedSubject, html: renderedHtml });
    }

    // ── GET /sample-vars — return sample vars for a notification type ──────
    if (path === "sample-vars" && req.method === "GET") {
      const notifType = url.searchParams.get("notification_type") ?? "get_matched";
      return json({ ok: true, vars: SAMPLE_PAYLOADS[notifType] ?? SAMPLE_PAYLOADS.get_matched });
    }

    // ── Legacy compat: POST /resend ────────────────────────────────────────
    if (path === "resend" && req.method === "POST") {
      const body = await req.json();
      const { log_id, notification_type, form_type } = body;
      const nType = notification_type ?? form_type;
      if (!log_id || !nType) return json({ ok: false, error: "log_id and notification_type required" }, 400);

      const { data: logRow } = await supabase
        .from("email_notification_logs")
        .select("payload, to_emails, subject")
        .eq("id", log_id)
        .maybeSingle();

      if (!logRow) {
        const { data: oldLog } = await supabase
          .from("email_notifications_log")
          .select("payload_snapshot, recipients_json")
          .eq("id", log_id)
          .maybeSingle();
        if (!oldLog) return json({ ok: false, error: "Log entry not found" }, 404);
      }

      const { data: setting } = await supabase
        .from("email_notification_settings")
        .select("is_enabled, recipient_emails, subject_template, body_html")
        .eq("notification_type", nType)
        .maybeSingle();

      if (!setting?.is_enabled) return json({ ok: false, error: "Notification type is disabled" });

      const recipientsList = (setting.recipient_emails ?? "")
        .split(",").map((r: string) => r.trim()).filter(Boolean);
      if (recipientsList.length === 0) return json({ ok: false, error: "No recipients configured" });

      const payload = (logRow?.payload ?? {}) as Record<string, string>;
      const vars: Record<string, string> = { ...payload, notification_type: nType, form_type: nType };

      const subject = renderTemplate(setting.subject_template ?? "", vars) || `${nType} notification`;
      const htmlBody = setting.body_html?.trim()
        ? renderHtmlTemplate(setting.body_html, vars)
        : buildDefaultBodyHtml(nType, vars);

      const result = await sendEmail({ to: recipientsList, subject, html: htmlBody });

      await logNotification(supabase, {
        notification_type: nType,
        is_test: false,
        to_emails: recipientsList.join(", "),
        subject,
        status: result.success ? "sent" : "failed",
        error_message: result.error,
        payload: vars as Record<string, unknown>,
      });

      return json({ ok: result.success, error: result.error ?? null });
    }

    return json({ ok: false, error: "Not found" }, 404);
  } catch (e: unknown) {
    console.error("[notification-settings-api] Error:", e instanceof Error ? e.message : e);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});
