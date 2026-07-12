import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { validateCrawlUrl, resolvesToPublicAddress, CRAWL_LIMITS } from "../_shared/crawlUrlSafety.ts";
import { callCrawlerGateway, GatewayError } from "../_shared/crawlGatewayClient.ts";
import { normalizeCrawlResult, buildBoundedRawSnapshot, type Crawl4aiRawResponse } from "../_shared/crawlExtractionAdapter.ts";

// Owns crawl_jobs' lifecycle: start (validate candidate + URL + no
// duplicate active job -> call the gateway synchronously, since the
// 10-page/10-minute ceiling is small enough for a single request/response
// for this one-candidate-at-a-time MVP -> normalize -> persist), list/get,
// cancel (only for a stuck queued/starting row), retry (fresh job row,
// retry_count incremented). Bulk/async orchestration is explicitly out of
// scope — see the crawl integration plan.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const ACTIVE_STATUSES = ["queued", "starting", "crawling", "extracting"];
const TERMINAL_STATUSES = ["completed", "failed", "cancelled", "needs_review"];

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
      let query = supabase.from("crawl_jobs").select("*, discovered_tools(id, name, official_website, status)", { count: "exact" }).order("created_at", { ascending: false }).limit(50);
      if (candidateId) query = query.eq("discovery_candidate_id", candidateId);
      if (statusFilter) query = query.eq("status", statusFilter);
      const { data, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [], total: count || 0 });
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

      const { count: activeCount } = await supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", ACTIVE_STATUSES);
      if ((activeCount || 0) >= CRAWL_LIMITS.MAX_ACTIVE_JOBS) {
        return jsonResponse({ ok: false, error_code: "duplicate_active_job", error: "A crawl is already in progress. Only one active crawl is allowed at a time." }, 409);
      }

      const urlCheck = validateCrawlUrl(candidate.official_website);
      if (!urlCheck.ok) {
        return jsonResponse({ ok: false, error_code: urlCheck.reason, error: `The candidate URL failed validation: ${urlCheck.reason}` }, 400);
      }
      const dnsCheck = await resolvesToPublicAddress(urlCheck.hostname!);
      if (!dnsCheck.ok) {
        return jsonResponse({ ok: false, error_code: dnsCheck.reason, error: dnsFailureMessage(dnsCheck.reason) }, 400);
      }

      const { data: job, error: insertError } = await supabase
        .from("crawl_jobs")
        .insert({
          discovery_candidate_id: candidateId,
          requested_url: candidate.official_website,
          normalized_url: urlCheck.normalizedUrl,
          status: "starting",
          started_at: new Date().toISOString(),
          created_by: session.email,
        })
        .select()
        .single();
      if (insertError) return jsonResponse({ ok: false, error: insertError.message }, 500);

      // Synchronous gateway call — bounded by CRAWL_LIMITS + the client's
      // own GATEWAY_TIMEOUT_MS. Safe for one small-site crawl at a time;
      // NOT the model for bulk crawling (explicitly out of scope).
      try {
        const gatewayResult = await callCrawlerGateway({
          request_id: job.id,
          url: urlCheck.normalizedUrl!,
          max_pages: CRAWL_LIMITS.MAX_PAGES,
          max_depth: CRAWL_LIMITS.MAX_DEPTH,
          max_duration_ms: CRAWL_LIMITS.MAX_DURATION_MS,
        });

        if (!gatewayResult.ok || !gatewayResult.data) {
          throw new GatewayError(gatewayResult.error_code || "gateway_error", gatewayResult.error || "Gateway returned an unsuccessful result.");
        }

        const raw = gatewayResult.data.raw as Crawl4aiRawResponse;
        const normalized = normalizeCrawlResult(raw, { discoveryCandidateWebsite: candidate.official_website });
        const boundedRaw = buildBoundedRawSnapshot(raw);
        const completedAt = new Date();
        const startedAt = new Date(job.started_at);

        const { data: updatedJob, error: updateError } = await supabase
          .from("crawl_jobs")
          .update({
            status: "needs_review",
            progress: 100,
            completed_at: completedAt.toISOString(),
            duration_ms: completedAt.getTime() - startedAt.getTime(),
            crawl4ai_version: gatewayResult.data.crawl4ai_version,
            discovered_pages: gatewayResult.data.discovered_pages,
            crawled_pages: gatewayResult.data.crawled_pages,
            source_urls: gatewayResult.data.source_urls,
            raw_extraction_ref: boundedRaw,
            normalized_extraction: normalized,
            updated_at: completedAt.toISOString(),
          })
          .eq("id", job.id)
          .select()
          .single();
        if (updateError) return jsonResponse({ ok: false, error: updateError.message }, 500);

        await supabase.from("discovered_tools").update({ status: "crawled", updated_at: new Date().toISOString() }).eq("id", candidateId);

        return jsonResponse({ ok: true, data: updatedJob });
      } catch (err) {
        const code = err instanceof GatewayError ? err.code : "unknown_error";
        const message = err instanceof GatewayError ? err.message : "An unexpected error occurred while crawling.";
        const completedAt = new Date();
        const startedAt = new Date(job.started_at);
        await supabase
          .from("crawl_jobs")
          .update({
            status: "failed",
            error_code: code,
            error_message: message,
            completed_at: completedAt.toISOString(),
            duration_ms: completedAt.getTime() - startedAt.getTime(),
            updated_at: completedAt.toISOString(),
          })
          .eq("id", job.id);
        return jsonResponse({ ok: false, error_code: code, error: message }, 502);
      }
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

      const { count: activeCount } = await supabase.from("crawl_jobs").select("id", { count: "exact", head: true }).in("status", ACTIVE_STATUSES);
      if ((activeCount || 0) >= CRAWL_LIMITS.MAX_ACTIVE_JOBS) {
        return jsonResponse({ ok: false, error_code: "duplicate_active_job", error: "A crawl is already in progress." }, 409);
      }

      // Insert a fresh row with retry_count incremented, then run the same
      // validate -> call gateway -> normalize -> persist sequence as
      // action:'start' (duplicated inline rather than recursing through
      // the HTTP handler, since Deno.serve's handler isn't re-invocable
      // as a plain function from within itself).
      const urlCheck = validateCrawlUrl(source.requested_url);
      if (!urlCheck.ok) return jsonResponse({ ok: false, error_code: urlCheck.reason, error: "The candidate URL failed validation." }, 400);
      const dnsCheck = await resolvesToPublicAddress(urlCheck.hostname!);
      if (!dnsCheck.ok) return jsonResponse({ ok: false, error_code: dnsCheck.reason, error: dnsFailureMessage(dnsCheck.reason) }, 400);

      const { data: job, error: insertError } = await supabase
        .from("crawl_jobs")
        .insert({
          discovery_candidate_id: source.discovery_candidate_id,
          requested_url: source.requested_url,
          normalized_url: urlCheck.normalizedUrl,
          status: "starting",
          retry_count: (source.retry_count || 0) + 1,
          started_at: new Date().toISOString(),
          created_by: session.email,
        })
        .select()
        .single();
      if (insertError) return jsonResponse({ ok: false, error: insertError.message }, 500);

      try {
        const gatewayResult = await callCrawlerGateway({
          request_id: job.id,
          url: urlCheck.normalizedUrl!,
          max_pages: CRAWL_LIMITS.MAX_PAGES,
          max_depth: CRAWL_LIMITS.MAX_DEPTH,
          max_duration_ms: CRAWL_LIMITS.MAX_DURATION_MS,
        });
        if (!gatewayResult.ok || !gatewayResult.data) {
          throw new GatewayError(gatewayResult.error_code || "gateway_error", gatewayResult.error || "Gateway returned an unsuccessful result.");
        }
        const { data: candidate } = await supabase.from("discovered_tools").select("official_website").eq("id", source.discovery_candidate_id).single();
        const raw = gatewayResult.data.raw as Crawl4aiRawResponse;
        const normalized = normalizeCrawlResult(raw, { discoveryCandidateWebsite: candidate?.official_website || source.requested_url });
        const boundedRaw = buildBoundedRawSnapshot(raw);
        const completedAt = new Date();
        const { data: updatedJob, error: updateError } = await supabase
          .from("crawl_jobs")
          .update({
            status: "needs_review", progress: 100, completed_at: completedAt.toISOString(),
            duration_ms: completedAt.getTime() - new Date(job.started_at).getTime(),
            crawl4ai_version: gatewayResult.data.crawl4ai_version, discovered_pages: gatewayResult.data.discovered_pages,
            crawled_pages: gatewayResult.data.crawled_pages, source_urls: gatewayResult.data.source_urls,
            raw_extraction_ref: boundedRaw, normalized_extraction: normalized, updated_at: completedAt.toISOString(),
          })
          .eq("id", job.id).select().single();
        if (updateError) return jsonResponse({ ok: false, error: updateError.message }, 500);
        await supabase.from("discovered_tools").update({ status: "crawled", updated_at: new Date().toISOString() }).eq("id", source.discovery_candidate_id);
        return jsonResponse({ ok: true, data: updatedJob });
      } catch (err) {
        const code = err instanceof GatewayError ? err.code : "unknown_error";
        const message = err instanceof GatewayError ? err.message : "An unexpected error occurred while crawling.";
        const completedAt = new Date();
        await supabase.from("crawl_jobs").update({ status: "failed", error_code: code, error_message: message, completed_at: completedAt.toISOString(), duration_ms: completedAt.getTime() - new Date(job.started_at).getTime(), updated_at: completedAt.toISOString() }).eq("id", job.id);
        return jsonResponse({ ok: false, error_code: code, error: message }, 502);
      }
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
