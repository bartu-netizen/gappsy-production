import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";
import { addLeadsToCampaign, type SmartleadLead } from "../_shared/smartleadClient.ts";

// Visibility + CSV export + Smartlead sync for scraped tool contact
// emails, covering TWO distinct sources selected via ?source=
// (GET) / payload.source (POST):
//   - "listed" (default): tool_contact_emails / tools — paid tools
//     already published on Gappsy (email_discovery_scan).
//   - "discovered": discovered_tool_contact_emails / discovered_tools —
//     Discovery Engine candidates not yet promoted to a real listing
//     (discovered_tool_email_scan). These are meant for a SEPARATE
//     Smartlead campaign ("not yet listed" outreach) — never the same
//     campaign as the listed-tools one, since the whole point is a
//     different pitch (join Gappsy vs. upgrade your existing listing).
// PLUS the ListClean verification status each row has been assigned.
// POST action=sync_to_smartlead pushes every still-unsynced
// listclean_status='valid' email for the given source into a given
// Smartlead campaign — never anything ListClean marked invalid, and
// never a duplicate push for an already-synced row.

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

type Source = "listed" | "discovered";

function resolveSource(value: unknown): Source {
  return value === "discovered" ? "discovered" : "listed";
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

      const source = resolveSource(payload.source);
      const campaignId = typeof payload.campaign_id === "string" ? payload.campaign_id.trim() : "";
      if (!campaignId) return jsonResponse({ ok: false, error: "campaign_id is required" }, 400);

      const emailTable = source === "discovered" ? "discovered_tool_contact_emails" : "tool_contact_emails";
      const idColumn = source === "discovered" ? "discovered_tool_id" : "tool_id";
      const entityTable = source === "discovered" ? "discovered_tools" : "tools";
      const entitySelect = source === "discovered" ? "id, slug, name, official_website" : "id, slug, name, website";
      const websiteField = source === "discovered" ? "official_website" : "website";
      const profileUrlFor = (slug: string | undefined) => (source === "discovered" ? null : slug ? `https://gappsy.com/tools/${slug}/` : null);

      // Only ListClean-verified-deliverable emails, never already synced —
      // this is the one gate between "scraped" and "a real cold email goes
      // out", so it deliberately never widens beyond listclean_status='valid'.
      const { data: eligible, error: eligibleError } = await supabase
        .from(emailTable)
        .select(`id, ${idColumn}, email`)
        .eq("listclean_status", "valid")
        .is("smartlead_synced_at", null)
        .limit(2000);
      if (eligibleError) return jsonResponse({ ok: false, error: eligibleError.message }, 500);
      if (!eligible || eligible.length === 0) return jsonResponse({ ok: true, synced: 0, note: "No clean, unsynced emails to send." });

      const entityIds = [...new Set((eligible as any[]).map((r) => r[idColumn]))];
      const { data: entities, error: entitiesError } = await fetchInChunks(entityIds, (chunk) =>
        supabase.from(entityTable).select(entitySelect).in("id", chunk)
      );
      if (entitiesError) return jsonResponse({ ok: false, error: entitiesError.message }, 500);
      const entityById = new Map((entities || []).map((t: any) => [t.id, t]));

      const leads: SmartleadLead[] = (eligible as any[]).map((r) => {
        const entity = entityById.get(r[idColumn]) as any;
        return {
          email: r.email,
          company_name: entity?.name || undefined,
          website: entity?.[websiteField] || undefined,
          custom_fields: {
            [idColumn]: r[idColumn],
            tool_slug: entity?.slug || null,
            profile_url: profileUrlFor(entity?.slug),
            source: emailTable,
          },
        };
      });

      const result = await addLeadsToCampaign(campaignId, leads);
      if (!result.ok) return jsonResponse({ ok: false, error: "Smartlead rejected the request", raw: result.raw }, 502);

      const nowIso = new Date().toISOString();
      const { error: updateError } = await supabase
        .from(emailTable)
        .update({ smartlead_campaign_id: campaignId, smartlead_synced_at: nowIso })
        .in("id", (eligible as any[]).map((r) => r.id));
      if (updateError) return jsonResponse({ ok: false, error: `Sent to Smartlead but failed to record sync state: ${updateError.message}` }, 500);

      await writeAuditLog({
        actor_session_type: "session_token", actor_email: session.email || undefined,
        action: source === "discovered" ? "discovered_tool_emails_synced_to_smartlead" : "tool_emails_synced_to_smartlead",
        target_table: emailTable, status: "success",
      });

      return jsonResponse({ ok: true, synced: eligible.length, campaign_id: campaignId, smartlead_response: result });
    }

    if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

    const url = new URL(req.url);
    const format = url.searchParams.get("format");
    const source = resolveSource(url.searchParams.get("source"));

    const emailTable = source === "discovered" ? "discovered_tool_contact_emails" : "tool_contact_emails";
    const idColumn = source === "discovered" ? "discovered_tool_id" : "tool_id";
    const entityTable = source === "discovered" ? "discovered_tools" : "tools";
    const entitySelect = source === "discovered" ? "id, slug, name, official_website" : "id, slug, name, website";
    const websiteField = source === "discovered" ? "official_website" : "website";

    const progressQuery = source === "discovered"
      ? supabase.from("discovered_tools").select("email_discovery_status").eq("status", "validated")
      : supabase.from("tools").select("email_discovery_status").eq("status", "published").eq("is_open_source", false);

    const [progressRes, emailsRes] = await Promise.all([
      progressQuery,
      supabase
        .from(emailTable)
        .select(`${idColumn}, email, source_url, discovered_at, listclean_status, listclean_external_status, smartlead_campaign_id, smartlead_synced_at`)
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

    const emailRows = (emailsRes.data || []) as any[];
    const entityIds = [...new Set(emailRows.map((r) => r[idColumn]))];
    const { data: entities, error: entitiesError } = await fetchInChunks(entityIds, (chunk) =>
      supabase.from(entityTable).select(entitySelect).in("id", chunk)
    );
    if (entitiesError) return jsonResponse({ ok: false, error: entitiesError.message }, 500);
    const entityById = new Map((entities || []).map((t: any) => [t.id, t]));

    const enriched = emailRows
      .map((r) => ({ ...r, tool: entityById.get(r[idColumn]) || null }))
      .filter((r) => r.tool)
      .map((r) => ({ ...r, tool_id: r[idColumn], profile_url: source === "discovered" ? null : `https://gappsy.com/tools/${r.tool!.slug}/` }));

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
        [r.tool!.name, r.tool!.slug, r.profile_url || "", r.tool![websiteField] || "", r.email, r.listclean_status || "", r.source_url || "", r.discovered_at].map((v) => escCsv(String(v))).join(",")
      );
      const today = new Date().toISOString().slice(0, 10);
      return csvResponse([header, ...lines].join("\n"), `${source}-tool-contact-emails-${today}.csv`);
    }

    // Same shape/convention as other-agencies-export-listclean-csv (email +
    // email_normalized first, then reference columns for manual re-matching
    // after cleaning) — one row per email.
    if (format === "listclean") {
      const header = ["email", "email_normalized", "tool_id", "tool_slug", "profile_url"].map(escCsv).join(",");
      const lines = enriched.map((r) =>
        [r.email, r.email, r.tool_id, r.tool!.slug, r.profile_url || ""].map((v) => escCsv(String(v))).join(",")
      );
      const today = new Date().toISOString().slice(0, 10);
      return csvResponse([header, ...lines].join("\n"), `${source}-tool-emails-listclean-${today}.csv`);
    }

    return jsonResponse({ ok: true, source, progress, listclean: listcleanSummary, emails: enriched, total_emails: enriched.length });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    console.error("[admin-tool-contact-emails] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
