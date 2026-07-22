import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Editor Metrics — reviews/day, publish rate, avg review time, AI
// acceptance rate, completeness distribution, queue sizes, and a simple
// bottleneck signal (which queue has both a large backlog AND an old
// oldest-item, i.e. genuinely stuck rather than just momentarily busy).
// Every number is a real query; "average review time" only reflects rows
// where duration_ms was actually reported (currently: the Review
// Workspace) — see admin_audit_log.duration_ms (20260713190000).

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

    const url = new URL(req.url);
    const daysBack = Math.min(90, Math.max(1, Number(url.searchParams.get("days")) || 14));
    const periodStartIso = new Date(Date.now() - daysBack * 24 * 60 * 60 * 1000).toISOString();

    const oldestOf = async (table: string, statusColumn: string, statusValue: string, dateColumn: string) => {
      const { data, error, count } = await supabase
        .from(table)
        .select(dateColumn, { count: "exact" })
        .eq(statusColumn, statusValue)
        .order(dateColumn, { ascending: true })
        .limit(1);
      if (error) throw new Error(`Failed to inspect ${table}.${statusColumn}=${statusValue}: ${error.message}`);
      const oldest = data && data.length > 0 ? (data[0] as Record<string, string>)[dateColumn] : null;
      return { count: count || 0, oldest_age_hours: oldest ? Math.round((Date.now() - new Date(oldest).getTime()) / (60 * 60 * 1000)) : 0 };
    };

    const [
      reviewsPerDayRes,
      completenessDistRes,
      approvedSuggestionsRes,
      rejectedSuggestionsRes,
      publishedInPeriodRes,
      crawlQueueBacklog,
      discoveryQueueBacklog,
      aiQueueBacklog,
      needsReviewBacklog,
    ] = await Promise.all([
      supabase.rpc("editorial_reviews_per_day", { days_back: daysBack }),
      supabase.rpc("editorial_completeness_distribution"),
      supabase.from("enrichment_field_suggestions").select("id", { count: "exact", head: true }).in("review_status", ["approved", "edited"]).gte("reviewed_at", periodStartIso),
      supabase.from("enrichment_field_suggestions").select("id", { count: "exact", head: true }).eq("review_status", "rejected").gte("reviewed_at", periodStartIso),
      supabase.from("tools").select("id", { count: "exact", head: true }).gte("published_at", periodStartIso),
      oldestOf("crawl_jobs", "status", "queued", "created_at"),
      oldestOf("discovered_tools", "status", "validated", "updated_at"),
      oldestOf("enrichment_jobs", "status", "queued", "created_at"),
      oldestOf("tools", "status", "needs_review", "updated_at"),
    ]);

    if (reviewsPerDayRes.error) throw new Error(`reviews_per_day: ${reviewsPerDayRes.error.message}`);
    if (completenessDistRes.error) throw new Error(`completeness_distribution: ${completenessDistRes.error.message}`);
    if (approvedSuggestionsRes.error) throw new Error(approvedSuggestionsRes.error.message);
    if (rejectedSuggestionsRes.error) throw new Error(rejectedSuggestionsRes.error.message);
    if (publishedInPeriodRes.error) throw new Error(publishedInPeriodRes.error.message);

    const approvedCount = approvedSuggestionsRes.count || 0;
    const rejectedCount = rejectedSuggestionsRes.count || 0;
    const totalDecided = approvedCount + rejectedCount;
    const aiAcceptanceRate = totalDecided > 0 ? Math.round((approvedCount / totalDecided) * 100) : null;

    const reviewRows = (reviewsPerDayRes.data || []) as { day: string; review_count: number; avg_duration_ms: number | null }[];
    const totalReviews = reviewRows.reduce((sum, r) => sum + Number(r.review_count), 0);
    const durationSamples = reviewRows.filter((r) => r.avg_duration_ms != null);
    const avgReviewTimeMs = durationSamples.length > 0
      ? Math.round(durationSamples.reduce((sum, r) => sum + Number(r.avg_duration_ms), 0) / durationSamples.length)
      : null;

    const backlogs = {
      crawl_queue: crawlQueueBacklog,
      discovery_validated: discoveryQueueBacklog,
      ai_queue: aiQueueBacklog,
      tools_needs_review: needsReviewBacklog,
    };
    // A simple, explainable bottleneck signal: the backlog with the
    // largest (count x age) product — big-and-old outranks either
    // big-and-fresh (just busy) or small-and-old (one stale straggler).
    let bottleneck: { stage: string; count: number; oldest_age_hours: number } | null = null;
    for (const [stage, b] of Object.entries(backlogs)) {
      if (b.count === 0) continue;
      const score = b.count * b.oldest_age_hours;
      if (!bottleneck || score > bottleneck.count * bottleneck.oldest_age_hours) {
        bottleneck = { stage, count: b.count, oldest_age_hours: b.oldest_age_hours };
      }
    }

    return jsonResponse({
      ok: true,
      data: {
        period_days: daysBack,
        reviews_per_day: reviewRows,
        reviews_total_in_period: totalReviews,
        avg_review_time_ms: avgReviewTimeMs,
        published_in_period: publishedInPeriodRes.count || 0,
        publish_rate_per_day: Math.round(((publishedInPeriodRes.count || 0) / daysBack) * 10) / 10,
        ai_acceptance_rate_percent: aiAcceptanceRate,
        ai_suggestions_approved: approvedCount,
        ai_suggestions_rejected: rejectedCount,
        completeness_distribution: completenessDistRes.data || [],
        queue_backlogs: backlogs,
        bottleneck,
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
