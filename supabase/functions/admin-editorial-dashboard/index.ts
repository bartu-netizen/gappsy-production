import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Single-call aggregator for the Editorial Dashboard — every pipeline
// stage's queue depth in one response instead of an editor visiting
// Discovery/Crawl/Publishing/AI Enrichment dashboards separately. Every
// number is a real count against discovered_tools / crawl_jobs / tools /
// enrichment_batches / enrichment_jobs at request time — nothing cached or
// estimated (completeness/quality ARE cached, on the tools row itself, by
// the completeness_rescan scheduler job — this endpoint just reads
// whatever's already there).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
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

    const todayStartIso = new Date(new Date().setUTCHours(0, 0, 0, 0)).toISOString();

    const countWhere = async (table: string, column: string, value: string) => {
      const { count, error } = await supabase.from(table).select("id", { count: "exact", head: true }).eq(column, value);
      if (error) throw new Error(`Failed to count ${table}.${column}=${value}: ${error.message}`);
      return count || 0;
    };

    const [
      // Discovery
      discoveryNew, discoveryValidated, discoveryNeedsReview, discoveryDuplicate, discoveryApprovedForCrawl,
      // Crawl
      crawlQueued, crawlActive, crawlNeedsReview, crawlFailed,
      // Tools (publishing pipeline)
      draft, needsReview, readyToPublish, published, archived,
      // AI
      enrichmentQueued, enrichmentNeedsReview, enrichmentFailed,
      // Published today (real event, not just "touched today" — see published_at)
      publishedTodayRes,
      // Recently updated tools
      recentlyUpdatedRes,
    ] = await Promise.all([
      countWhere("discovered_tools", "status", "new"),
      countWhere("discovered_tools", "status", "validated"),
      countWhere("discovered_tools", "status", "needs_review"),
      countWhere("discovered_tools", "status", "duplicate"),
      countWhere("discovered_tools", "status", "approved_for_crawl"),
      countWhere("crawl_jobs", "status", "queued"),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", ["starting", "crawling", "extracting"]).then((r) => { if (r.error) throw new Error(r.error.message); return r.count || 0; }),
      countWhere("crawl_jobs", "status", "needs_review"),
      countWhere("crawl_jobs", "status", "failed"),
      countWhere("tools", "status", "draft"),
      countWhere("tools", "status", "needs_review"),
      countWhere("tools", "status", "ready_to_publish"),
      countWhere("tools", "status", "published"),
      countWhere("tools", "status", "archived"),
      countWhere("enrichment_jobs", "status", "queued"),
      countWhere("enrichment_jobs", "status", "needs_review"),
      countWhere("enrichment_jobs", "status", "failed"),
      supabase.from("tools").select("id", { count: "exact", head: true }).gte("published_at", todayStartIso),
      supabase.from("tools").select("id, slug, name, status, completeness_percent, quality_score, updated_at, assigned_editor").order("updated_at", { ascending: false }).limit(10),
    ]);

    if (publishedTodayRes.error) throw new Error(`Failed to count published today: ${publishedTodayRes.error.message}`);
    if (recentlyUpdatedRes.error) throw new Error(`Failed to load recently updated tools: ${recentlyUpdatedRes.error.message}`);

    return jsonResponse({
      ok: true,
      data: {
        discovery: { new: discoveryNew, validated: discoveryValidated, needs_review: discoveryNeedsReview, duplicate: discoveryDuplicate, approved_for_crawl: discoveryApprovedForCrawl },
        crawl: { queued: crawlQueued, active: crawlActive, needs_review: crawlNeedsReview, failed: crawlFailed },
        drafts: draft,
        ai: { queued: enrichmentQueued, needs_review: enrichmentNeedsReview, failed: enrichmentFailed },
        needs_review: needsReview,
        ready_to_publish: readyToPublish,
        published: published,
        published_today: publishedTodayRes.count || 0,
        archived: archived,
        failed_items: crawlFailed + enrichmentFailed,
        recently_updated: recentlyUpdatedRes.data || [],
      },
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
