import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";
import { addLeadsToCampaign, type SmartleadLead } from "../_shared/smartleadClient.ts";

// Visibility + CSV export for the emails the email_discovery_scan scheduled
// job (see _shared/schedulerRegistry.ts) finds by crawling each paid tool's
// own website, PLUS the ListClean verification status
// (tool_email_listclean_scan) each one has been assigned. GET returns
// progress + the full list; GET ?format=csv / ?format=listclean return
// export variants of the same rows. POST action=sync_to_smartlead pushes
// every still-unsynced listclean_status='valid' email into a given
// Smartlead campaign — never anything ListClean marked invalid, and never
// a duplicate push for an already-synced row.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

function csvResponse(csv: string, filename: string): Response {
  return new Response(csv, {
    status: 200,
    headers: { ...CORS_HEADERS, "Content-Type": "text/csv; charset=utf-8", "Content-Disposition": `attachment; filename="${filename}"` },
  });
}

function escCsv(v: string): string {
  return `"${(v || "").replace(/"/g, '""')}"`;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    if (req.method === "POST") {
      const payload = await req.json();
      if (payload.action !== "sync_to_smartlead") return jsonResponse({ ok: false, error: "Unknown action" }, 400);

      const campaignId = typeof payload.campaign_id === "string" ? payload.campaign_id.trim() : "";
      if (!campaignId) return jsonResponse({ ok: false, error: "campaign_id is required" }, 400);

      // Only ListClean-verified-deliverable emails, never already synced —
      // this is the one gate between "scraped" and "a real cold email goes
      // out", so it deliberately never widens beyond listclean_status='valid'.
      const { data: eligible, error: eligibleError } = await supabase
        .from("tool_contact_emails")
        .select("id, tool_id, email")
        .eq("listclean_status", "valid")
        .is("smartlead_synced_at", null)
        .limit(2000);
      if (eligibleError) return jsonResponse({ ok: false, error: eligibleError.message }, 500);
      if (!eligible || eligible.length === 0) return jsonResponse({ ok: true, synced: 0, note: "No clean, unsynced emails to send." });

      const toolIds = [...new Set(eligible.map((r) => r.tool_id))];
      const { data: tools, error: toolsError } = await fetchInChunks(toolIds, (chunk) =>
        supabase.from("tools").select("id, slug, name, website").in("id", chunk)
      );
      if (toolsError) return jsonResponse({ ok: false, error: toolsError.message }, 500);
      const toolById = new Map((tools || []).map((t) => [t.id, t]));

      const leads: SmartleadLead[] = eligible.map((r) => {
        const tool = toolById.get(r.tool_id);
        return {
          email: r.email,
          company_name: tool?.name || undefined,
          website: tool?.website || undefined,
          custom_fields: {
            tool_id: r.tool_id,
            tool_slug: tool?.slug || null,
            profile_url: tool?.slug ? `https://gappsy.com/tools/${tool.slug}/` : null,
            source: "tool_contact_emails",
          },
        };
      });

      const result = await addLeadsToCampaign(campaignId, leads);
      if (!result.ok) return jsonResponse({ ok: false, error: "Smartlead rejected the request", raw: result.raw }, 502);

      const nowIso = new Date().toISOString();
      const { error: updateError } = await supabase
        .from("tool_contact_emails")
        .update({ smartlead_campaign_id: campaignId, smartlead_synced_at: nowIso })
        .in("id", eligible.map((r) => r.id));
      if (updateError) return jsonResponse({ ok: false, error: `Sent to Smartlead but failed to record sync state: ${updateError.message}` }, 500);

      await writeAuditLog({
        actor_session_type: "session_token", actor_email: session.email || undefined,
        action: "tool_emails_synced_to_smartlead", target_table: "tool_contact_emails", status: "success",
      });

      return jsonResponse({ ok: true, synced: eligible.length, campaign_id: campaignId, smartlead_response: result });
    }

    if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

    const url = new URL(req.url);
    const format = url.searchParams.get("format");

    const [progressRes, emailsRes] = await Promise.all([
      supabase
        .from("tools")
        .select("email_discovery_status", { count: "exact", head: false })
        .eq("status", "published")
        .eq("is_open_source", false),
      supabase
        .from("tool_contact_emails")
        .select("tool_id, email, source_url, discovered_at, listclean_status, listclean_external_status, smartlead_campaign_id, smartlead_synced_at")
        .order("discovered_at", { ascending: false }),
    ]);
    if (progressRes.error) return jsonResponse({ ok: false, error: progressRes.error.message }, 500);
    if (emailsRes.error) return jsonResponse({ ok: false, error: emailsRes.error.message }, 500);

    const eligibleRows = (progressRes.data || []) as { email_discovery_status: string | null }[];
    const progress = {
      eligible_total: eligibleRows.length,
      done: eligibleRows.filter((r) => r.email_discovery_status === "done").length,
      failed: eligibleRows.filter((r) => r.email_discovery_status === "failed").length,
      pending: eligibleRows.filter((r) => r.email_discovery_status === null).length,
    };

    const emailRows = (emailsRes.data || []) as {
      tool_id: string; email: string; source_url: string | null; discovered_at: string;
      listclean_status: string | null; listclean_external_status: string | null;
      smartlead_campaign_id: string | null; smartlead_synced_at: string | null;
    }[];
    const toolIds = [...new Set(emailRows.map((r) => r.tool_id))];
    const { data: tools, error: toolsError } = await fetchInChunks(toolIds, (chunk) =>
      supabase.from("tools").select("id, slug, name, website").in("id", chunk)
    );
    if (toolsError) return jsonResponse({ ok: false, error: toolsError.message }, 500);
    const toolById = new Map((tools || []).map((t) => [t.id, t]));

    const enriched = emailRows
      .map((r) => ({ ...r, tool: toolById.get(r.tool_id) || null }))
      .filter((r) => r.tool)
      .map((r) => ({ ...r, profile_url: `https://gappsy.com/tools/${r.tool!.slug}/` }));

    const listcleanSummary = {
      valid: emailRows.filter((r) => r.listclean_status === "valid").length,
      invalid: emailRows.filter((r) => r.listclean_status === "invalid").length,
      pending: emailRows.filter((r) => !r.listclean_status || r.listclean_status === "submitted").length,
      failed: emailRows.filter((r) => r.listclean_status === "failed").length,
      synced_to_smartlead: emailRows.filter((r) => r.smartlead_synced_at).length,
    };

    if (format === "csv") {
      const header = ["tool_name", "tool_slug", "profile_url", "tool_website", "email", "listclean_status", "source_url", "discovered_at"].map(escCsv).join(",");
      const lines = enriched.map((r) =>
        [r.tool!.name, r.tool!.slug, r.profile_url, r.tool!.website || "", r.email, r.listclean_status || "", r.source_url || "", r.discovered_at].map((v) => escCsv(String(v))).join(",")
      );
      const today = new Date().toISOString().slice(0, 10);
      return csvResponse([header, ...lines].join("\n"), `tool-contact-emails-${today}.csv`);
    }

    // Same shape/convention as other-agencies-export-listclean-csv (email +
    // email_normalized first, then reference columns for manual re-matching
    // after cleaning) — one row per email, profile_url on every row so a
    // cleaned result can be traced straight back to the tool's page.
    if (format === "listclean") {
      const header = ["email", "email_normalized", "tool_id", "tool_slug", "profile_url"].map(escCsv).join(",");
      const lines = enriched.map((r) =>
        [r.email, r.email, r.tool_id, r.tool!.slug, r.profile_url].map((v) => escCsv(String(v))).join(",")
      );
      const today = new Date().toISOString().slice(0, 10);
      return csvResponse([header, ...lines].join("\n"), `tool-emails-listclean-${today}.csv`);
    }

    return jsonResponse({ ok: true, progress, listclean: listcleanSummary, emails: enriched, total_emails: enriched.length });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    console.error("[admin-tool-contact-emails] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
