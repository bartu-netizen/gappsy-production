import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";

// Read-only visibility + CSV export for the emails the email_discovery_scan
// scheduled job (see _shared/schedulerRegistry.ts) finds by crawling each
// paid tool's own website. GET returns progress + the full list; GET
// ?format=csv returns a Smartlead-import-ready CSV of the same rows.

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
  if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

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
        .select("tool_id, email, source_url, discovered_at")
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

    const emailRows = (emailsRes.data || []) as { tool_id: string; email: string; source_url: string | null; discovered_at: string }[];
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

    if (format === "csv") {
      const header = ["tool_name", "tool_slug", "profile_url", "tool_website", "email", "source_url", "discovered_at"].map(escCsv).join(",");
      const lines = enriched.map((r) =>
        [r.tool!.name, r.tool!.slug, r.profile_url, r.tool!.website || "", r.email, r.source_url || "", r.discovered_at].map((v) => escCsv(String(v))).join(",")
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

    return jsonResponse({ ok: true, progress, emails: enriched, total_emails: enriched.length });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    console.error("[admin-tool-contact-emails] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
