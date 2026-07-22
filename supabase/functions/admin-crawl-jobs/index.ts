import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { validateCrawlUrl, resolvesToPublicAddress } from "../_shared/crawlUrlSafety.ts";
import { executeCrawlJob, drainCrawlQueue } from "../_shared/crawlRunner.ts";

// Owns crawl_jobs' lifecycle: start (validate candidate + URL + free
// worker-lease capacity -> call the gateway synchronously, since the
// 10-page/10-minute ceiling is small enough for a single request/response
// -> normalize -> persist), list/get, cancel (only for a stuck
// queued/starting row), retry (fresh job row, retry_count incremented),
// process_queue (synchronously drain queued/due-retry jobs up to
// configured concurrency — see _shared/crawlRunner.ts's claim_crawl_jobs-
// backed drainCrawlQueue). Concurrency is now a configurable, DB-backed
// setting (crawl_settings.max_concurrent_crawls) instead of a hardcoded
// single-active-job limit — see the 20260713140000 migration.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const TERMINAL_STATUSES = ["completed", "failed", "cancelled", "needs_review"];

// Manual "Start"/"Retry" single-candidate actions still take one lease slot
// each, same as the automatic worker pool, so the two paths can never
// together exceed crawl_settings.max_concurrent_crawls. Only counts
// in-flight jobs whose lease hasn't expired — a crashed job doesn't
// permanently eat a manual slot either.
async function hasFreeCapacity(supabase: ReturnType<typeof createClient>): Promise<boolean> {
  const { data: settings } = await supabase.from("crawl_settings").select("max_concurrent_crawls").eq("id", true).maybeSingle();
  const maxConcurrency = settings?.max_concurrent_crawls ?? 2;
  const { count: activeCount } = await supabase
    .from("crawl_jobs")
    .select("id", { count: "exact", head: true })
    .in("status", ["starting", "crawling", "extracting"])
    .gt("lease_expires_at", new Date().toISOString());
  return (activeCount || 0) < maxConcurrency;
}

// dns_resolution_failed (domain doesn't exist / no DNS records) and
// dns_rebinding_private_ip (domain resolves, but to a private/loopback
// address) are distinct failure modes — surfacing the same "non-public
// address" message for both misleads whoever is debugging a failed crawl.
function dnsFailureMessage(reason: string | undefined): string {
  if (reason === "dns_resolution_failed") return "The candidate domain could not be resolved (no DNS records found).";
  return "The candidate URL resolves to a private or non-public address and cannot be crawled.";
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data, error } = await supabase.from("crawl_jobs").select("*, discovered_tools(id, name, official_website, status)").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!data) return jsonResponse({ ok: false, error: "Crawl job not found" }, 404);
        return jsonResponse({ ok: true, data });
      }
      const candidateId = url.searchParams.get("discovery_candidate_id");
      const statusFilter = url.searchParams.get("status");
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const pageSize = Math.min(100, Math.max(1, Number(url.searchParams.get("page_size")) || 50));
      let query = supabase.from("crawl_jobs").select("*, discovered_tools(id, name, official_website, status)", { count: "exact" }).order("created_at", { ascending: false });
      if (candidateId) query = query.eq("discovery_candidate_id", candidateId);
      if (statusFilter) {
        const statuses = statusFilter.split(",").map((s) => s.trim()).filter(Boolean);
        query = statuses.length > 1 ? query.in("status", statuses) : query.eq("status", statuses[0]);
      }
      const { data, error, count } = await query.range((page - 1) * pageSize, page * pageSize - 1);
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [], total: count || 0, page, page_size: pageSize });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();

    if (payload.action === "start") {
      const candidateId = typeof payload.discovery_candidate_id === "string" ? payload.discovery_candidate_id : null;
      if (!candidateId) return jsonResponse({ ok: false, error: "discovery_candidate_id is required" }, 400);

      const { data: candidate, error: candidateError } = await supabase.from("discovered_tools").select("*").eq("id", candidateId).maybeSingle();
      if (candidateError) return jsonResponse({ ok: false, error: candidateError.message }, 500);
      if (!candidate) return jsonResponse({ ok: false, error: "Discovery candidate not found" }, 404);
      if (candidate.status !== "approved_for_crawl") {
        return jsonResponse({ ok: false, error_code: "candidate_not_approved", error: `Candidate status is '${candidate.status}', not 'approved_for_crawl'.` }, 409);
      }

      const { data: existingDraftJob } = await supabase.from("crawl_jobs").select("id, created_draft_tool_id").eq("discovery_candidate_id", candidateId).not("created_draft_tool_id", "is", null).maybeSingle();
      if (existingDraftJob) {
        return jsonResponse({ ok: false, error_code: "already_converted", error: "This candidate has already been converted to a tool draft." }, 409);
      }

      if (!(await hasFreeCapacity(supabase))) {
        return jsonResponse({ ok: false, error_code: "at_capacity", error: "All configured concurrent crawl slots are currently in use. Try again shortly." }, 409);
      }

      const urlCheck = validateCrawlUrl(candidate.official_website);
      if (!urlCheck.ok) {
        return jsonResponse({ ok: false, error_code: urlCheck.reason, error: `The candidate URL failed validation: ${urlCheck.reason}` }, 400);
      }
      const dnsCheck = await resolvesToPublicAddress(urlCheck.hostname!);
      if (!dnsCheck.ok) {
        return jsonResponse({ ok: false, error_code: dnsCheck.reason, error: dnsFailureMessage(dnsCheck.reason) }, 400);
      }

      const nowIso = new Date().toISOString();
      const { data: settings } = await supabase.from("crawl_settings").select("lease_seconds").eq("id", true).maybeSingle();
      const leaseSeconds = settings?.lease_seconds ?? 240;
      const { data: job, error: insertError } = await supabase
        .from("crawl_jobs")
        .insert({
          discovery_candidate_id: candidateId,
          requested_url: candidate.official_website,
          normalized_url: urlCheck.normalizedUrl,
          status: "starting",
          started_at: nowIso,
          worker_id: `manual-${session.email || "admin"}`,
          lease_expires_at: new Date(Date.now() + leaseSeconds * 1000).toISOString(),
          heartbeat_at: nowIso,
          created_by: session.email,
        })
        .select()
        .single();
      if (insertError) return jsonResponse({ ok: false, error: insertError.message }, 500);

      // Synchronous gateway call — bounded by CRAWL_LIMITS + the client's
      // own GATEWAY_TIMEOUT_MS. Safe for one small-site crawl at a time;
      // NOT the model for bulk crawling (explicitly out of scope).
      const result = await executeCrawlJob(supabase, job, candidate.official_website, candidateId);
      if (!result.ok) return jsonResponse({ ok: false, error_code: result.error_code, error: result.error }, 502);
      return jsonResponse({ ok: true, data: result.job });
    }

    if (payload.action === "cancel") {
      const jobId = typeof payload.id === "string" ? payload.id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "id is required" }, 400);
      const { data: job } = await supabase.from("crawl_jobs").select("status").eq("id", jobId).maybeSingle();
      if (!job) return jsonResponse({ ok: false, error: "Crawl job not found" }, 404);
      if (TERMINAL_STATUSES.includes(job.status)) {
        return jsonResponse({ ok: false, error: `Cannot cancel a job in status '${job.status}'.` }, 409);
      }
      const { data: updated, error } = await supabase.from("crawl_jobs").update({ status: "cancelled", completed_at: new Date().toISOString(), updated_at: new Date().toISOString() }).eq("id", jobId).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: updated });
    }

    if (payload.action === "retry") {
      const jobId = typeof payload.id === "string" ? payload.id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "id is required" }, 400);
      const { data: source, error: sourceError } = await supabase.from("crawl_jobs").select("*").eq("id", jobId).maybeSingle();
      if (sourceError) return jsonResponse({ ok: false, error: sourceError.message }, 500);
      if (!source) return jsonResponse({ ok: false, error: "Crawl job not found" }, 404);
      if (!TERMINAL_STATUSES.includes(source.status) || source.status === "needs_review") {
        return jsonResponse({ ok: false, error: "Only failed or cancelled jobs can be retried." }, 409);
      }

      if (!(await hasFreeCapacity(supabase))) {
        return jsonResponse({ ok: false, error_code: "at_capacity", error: "All configured concurrent crawl slots are currently in use. Try again shortly." }, 409);
      }

      // Insert a fresh row with retry_count incremented, then run the same
      // validate -> gateway -> normalize -> persist sequence as action:'start'
      // via the shared executeCrawlJob. (This is the human-initiated Retry
      // button — distinct from the automatic pipeline's in-place
      // attempt/backoff retry on the SAME row; a manual retry always gets
      // its own fresh row and a fresh single attempt.)
      const urlCheck = validateCrawlUrl(source.requested_url);
      if (!urlCheck.ok) return jsonResponse({ ok: false, error_code: urlCheck.reason, error: "The candidate URL failed validation." }, 400);
      const dnsCheck = await resolvesToPublicAddress(urlCheck.hostname!);
      if (!dnsCheck.ok) return jsonResponse({ ok: false, error_code: dnsCheck.reason, error: dnsFailureMessage(dnsCheck.reason) }, 400);

      const nowIso = new Date().toISOString();
      const { data: settings } = await supabase.from("crawl_settings").select("lease_seconds").eq("id", true).maybeSingle();
      const leaseSeconds = settings?.lease_seconds ?? 240;
      const { data: job, error: insertError } = await supabase
        .from("crawl_jobs")
        .insert({
          discovery_candidate_id: source.discovery_candidate_id,
          requested_url: source.requested_url,
          normalized_url: urlCheck.normalizedUrl,
          status: "starting",
          retry_count: (source.retry_count || 0) + 1,
          started_at: nowIso,
          worker_id: `manual-${session.email || "admin"}`,
          lease_expires_at: new Date(Date.now() + leaseSeconds * 1000).toISOString(),
          heartbeat_at: nowIso,
          created_by: session.email,
        })
        .select()
        .single();
      if (insertError) return jsonResponse({ ok: false, error: insertError.message }, 500);

      const result = await executeCrawlJob(supabase, job, source.requested_url, source.discovery_candidate_id);
      if (!result.ok) return jsonResponse({ ok: false, error_code: result.error_code, error: result.error }, 502);
      return jsonResponse({ ok: true, data: result.job });
    }

    // Synchronously drains every queued/due-retry job up to the configured
    // concurrency (claiming + running them via the same claim_crawl_jobs-
    // backed worker pool the automatic Discovery -> Crawl pipeline uses),
    // then returns the outcome directly instead of firing-and-forgetting
    // via EdgeRuntime.waitUntil. For admins who want to kick a backlog
    // without waiting for the next discovery approve/bulk-approve call —
    // and for verifying concurrency behavior end-to-end.
    if (payload.action === "process_queue") {
      const anonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";
      const summary = await drainCrawlQueue(supabase, supabaseUrl, anonKey);
      return jsonResponse({ ok: true, data: summary });
    }

    return jsonResponse({ ok: false, error: "Unknown action" }, 400);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
