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

  const { mode, agency_id, state_slug } = body;

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    // Load global settings
    const { data: globalSettings } = await supabase
      .from("notification_settings")
      .select("enabled")
      .eq("form_type", "agency_emails_global")
      .maybeSingle();

    const globalEnabled = globalSettings?.enabled ?? false;
    if (!globalEnabled && mode !== "preview") {
      return json({ ok: true, status: "skipped", reason: "global_disabled" });
    }

    // If specific agency/state requested, send digest for that only
    if (agency_id && state_slug) {
      return await sendSingleDigest(supabase, agency_id, state_slug, mode);
    }

    // Otherwise: send digests to all unpaid agencies with marketing emails enabled
    // This would be triggered by a scheduled job
    const { data: agencies } = await supabase
      .from("agency_email_preferences")
      .select("agency_id, email")
      .eq("allow_marketing_emails", true)
      .not("email", "is", null);

    let sentCount = 0;
    let failedCount = 0;

    for (const agency of agencies ?? []) {
      // For each agency, get all their states with availability checks this week
      const { data: states } = await supabase
        .rpc("get_availability_states_for_digest", { p_agency_id: agency.agency_id });

      for (const stateRow of states ?? []) {
        const result = await sendSingleDigest(
          supabase,
          agency.agency_id,
          stateRow.state_slug,
          "scheduled",
          agency.email
        );
        if (result.ok) sentCount++;
        else failedCount++;
      }
    }

    return json({ ok: true, sent: sentCount, failed: failedCount });
  } catch (e: unknown) {
    console.error("[send-weekly-availability-digest]", e);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});

async function sendSingleDigest(
  supabase: ReturnType<typeof createClient>,
  agencyId: string,
  stateSlug: string,
  mode: string,
  overrideEmail?: string
): Promise<{ ok: boolean }> {
  try {
    // Get request count for this week
    const sevenDaysAgo = new Date();
    sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);

    const { data: requests } = await supabase
      .from("agency_availability_requests")
      .select("id")
      .eq("target_agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .gte("created_at", sevenDaysAgo.toISOString());

    const count = requests?.length ?? 0;

    if (count === 0 && mode !== "preview") {
      return { ok: true };
    }

    // Get agency email
    const { data: prefs } = await supabase
      .from("agency_email_preferences")
      .select("email, unsub_token")
      .eq("agency_id", agencyId)
      .maybeSingle();

    const toEmail = overrideEmail || prefs?.email;
    if (!toEmail) {
      return { ok: true };
    }

    // Get state name
    const { data: stateData } = await supabase
      .from("agency_availability_requests")
      .select("state_name")
      .eq("state_slug", stateSlug)
      .limit(1)
      .maybeSingle();

    const stateName = stateData?.state_name || stateSlug;
    const unsubToken = prefs?.unsub_token || "";

    const subject = `[Gappsy] ${count} availability check${count !== 1 ? "s" : ""} this week — Top-25 ${escHtml(stateName)}`;
    const html = buildDigestEmail(agencyId, stateName, count, unsubToken);

    const result = await sendEmail({
      to: toEmail,
      subject,
      html,
    });

    // Log event
    await supabase.from("agency_email_events").insert({
      agency_id: agencyId,
      event_type: "digest_weekly",
      to_email: toEmail,
      subject,
      status: result.success ? "sent" : "failed",
      error: result.error ?? null,
      metadata: { mode, state_slug: stateSlug, count },
    });

    return { ok: result.success };
  } catch (e: unknown) {
    console.error("[sendSingleDigest]", e);
    return { ok: false };
  }
}

function buildDigestEmail(agencyId: string, stateName: string, count: number, unsubToken: string): string {
  const prefsUrl = `https://www.gappsy.com/email-preferences?token=${escHtml(unsubToken)}`;
  const upgradeUrl = `https://www.gappsy.com/upgrade?state=${escHtml(stateName.toLowerCase().replace(/ /g, "-"))}&agency=${escHtml(agencyId)}`;

  return `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f8fafc;font-family:sans-serif">
<table width="100%" cellpadding="0" cellspacing="0" style="background:#f8fafc;padding:32px 20px">
<tr><td align="center">
<table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%">
<tr><td style="background:#7c3aed;border-radius:12px 12px 0 0;padding:28px 32px;color:#fff">
<p style="margin:0;font-size:11px;font-weight:600;letter-spacing:0.08em;text-transform:uppercase">Weekly Summary</p>
<h1 style="margin:6px 0 0;font-size:24px;font-weight:700">${count}</h1>
<p style="margin:6px 0 0;font-size:13px;color:#e9d5ff">
Availability check${count !== 1 ? "s" : ""} this week on Top-25 ${escHtml(stateName)}
</p>
</td></tr>
<tr><td style="background:#fff;padding:32px;border-left:1px solid #e2e8f0;border-right:1px solid #e2e8f0">
<p style="margin:0 0 24px;font-size:14px;color:#1f2937">
This week, <strong>${count}</strong> potential client${count !== 1 ? "s checked" : " checked"} if you were available on Gappsy's Top-25 directory for ${escHtml(stateName)}.
</p>
<div style="background:#f3e8ff;border-left:4px solid #7c3aed;padding:16px;margin:24px 0;border-radius:4px">
<p style="margin:0;font-size:14px;color:#5b21b6">
To receive leads directly, upgrade your listing to Standard, Spotlight, or Top-25 tier.
</p>
</div>
<a href="${escHtml(upgradeUrl)}" style="display:inline-block;background:#7c3aed;color:#fff;font-size:14px;font-weight:600;padding:12px 24px;border-radius:8px;text-decoration:none;margin:16px 0">Upgrade to get leads</a>
<p style="margin:24px 0 0;font-size:12px;color:#6b7280">
Paid listings get all lead details forwarded directly to you, so you can follow up immediately.
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
