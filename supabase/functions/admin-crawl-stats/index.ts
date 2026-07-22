import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Real-data-only observability for the concurrent crawl worker pool: no
// fabricated/estimated numbers, every figure is a direct count/avg over
// crawl_jobs (+ the crawl_settings singleton for the configured ceiling).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const IN_FLIGHT = ["starting", "crawling", "extracting"];

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const nowIso = new Date().toISOString();
    const dayAgoIso = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
    const hourAgoIso = new Date(Date.now() - 60 * 60 * 1000).toISOString();
    const weekAgoIso = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();

    const [
      settingsRes,
      activeRes,
      queuedDueRes,
      queuedScheduledRes,
      stuckLeaseRes,
      failures24hRes,
      completedLastHourRes,
      completedLast24hRes,
      completedLastWeekRes,
      pendingRetriesRes,
      recentDurationsRes,
    ] = await Promise.all([
      supabase.from("crawl_settings").select("max_concurrent_crawls, lease_seconds, max_auto_retries").eq("id", true).maybeSingle(),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", IN_FLIGHT).gt("lease_expires_at", nowIso),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).eq("status", "queued").or(`retry_at.is.null,retry_at.lte.${nowIso}`),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).eq("status", "queued").gt("retry_at", nowIso),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", IN_FLIGHT).lte("lease_expires_at", nowIso),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).eq("status", "failed").gte("completed_at", dayAgoIso),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", ["needs_review", "failed", "cancelled"]).gte("completed_at", hourAgoIso),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", ["needs_review", "failed", "cancelled"]).gte("completed_at", dayAgoIso),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", ["needs_review", "failed", "cancelled"]).gte("completed_at", weekAgoIso),
      supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).eq("status", "queued").not("retry_at", "is", null),
      supabase.from("crawl_jobs").select("duration_ms").not("duration_ms", "is", null).order("completed_at", { ascending: false }).limit(200),
    ]);

    const durations = (recentDurationsRes.data || []).map((r: { duration_ms: number }) => r.duration_ms).filter((d: number) => typeof d === "number");
    const avgDurationMs = durations.length > 0 ? Math.round(durations.reduce((a: number, b: number) => a + b, 0) / durations.length) : null;

    return jsonResponse({
      ok: true,
      data: {
        max_concurrent_crawls: settingsRes.data?.max_concurrent_crawls ?? null,
        lease_seconds: settingsRes.data?.lease_seconds ?? null,
        max_auto_retries: settingsRes.data?.max_auto_retries ?? null,
        active_count: activeRes.count || 0,
        queue_depth: queuedDueRes.count || 0,
        scheduled_retry_count: queuedScheduledRes.count || 0,
        stuck_lease_count: stuckLeaseRes.count || 0,
        failures_last_24h: failures24hRes.count || 0,
        pending_auto_retries: pendingRetriesRes.count || 0,
        avg_duration_ms: avgDurationMs,
        avg_duration_sample_size: durations.length,
        throughput_last_hour: completedLastHourRes.count || 0,
        throughput_last_24h: completedLast24hRes.count || 0,
        throughput_last_7d: completedLastWeekRes.count || 0,
      },
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
