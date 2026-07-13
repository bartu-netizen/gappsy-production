import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";
import { computeNextCronRun, computeNextIntervalRun, parseCronExpression } from "../_shared/cronNextRun.ts";
import { executeScheduledJob } from "../_shared/schedulerRunner.ts";
import { listRegisteredJobTypes } from "../_shared/schedulerRegistry.ts";

// Admin CRUD + operability for the scheduler: list schedules (with their
// denormalized last-run summary), fetch one schedule's execution history,
// create/update/enable/disable/delete a schedule, and "run now" (claims
// and executes immediately, bypassing the normal due check but still
// respecting an existing active lease — you cannot run-now something
// that's already running).

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

function computeNextRunFromPayload(scheduleType: string, cronExpression: string | null, intervalSeconds: number | null): string | null {
  if (scheduleType === "manual") return null;
  const from = new Date();
  if (scheduleType === "cron") {
    if (!cronExpression) throw new Error("cron_expression is required for schedule_type='cron'");
    return computeNextCronRun(cronExpression, from).toISOString();
  }
  if (!intervalSeconds) throw new Error("interval_seconds is required for schedule_type='interval'");
  return computeNextIntervalRun(intervalSeconds, from).toISOString();
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    const anonKey = Deno.env.get("SUPABASE_ANON_KEY") || "";
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id && url.searchParams.get("runs") === "true") {
        const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
        const pageSize = Math.min(100, Math.max(1, Number(url.searchParams.get("page_size")) || 25));
        const { data, error, count } = await supabase
          .from("scheduled_job_runs")
          .select("*", { count: "exact" })
          .eq("scheduled_job_id", id)
          .order("started_at", { ascending: false })
          .range((page - 1) * pageSize, page * pageSize - 1);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        return jsonResponse({ ok: true, data: data || [], total: count || 0, page, page_size: pageSize });
      }
      if (id) {
        const { data, error } = await supabase.from("scheduled_jobs").select("*").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!data) return jsonResponse({ ok: false, error: "Schedule not found" }, 404);
        return jsonResponse({ ok: true, data });
      }
      const { data, error } = await supabase.from("scheduled_jobs").select("*").order("priority", { ascending: false }).order("job_key", { ascending: true });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [], registered_job_types: listRegisteredJobTypes() });
    }

    if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    const payload = await req.json();

    if (payload.action === "create") {
      const jobKey = typeof payload.job_key === "string" ? payload.job_key.trim() : "";
      const jobType = typeof payload.job_type === "string" ? payload.job_type.trim() : "";
      const name = typeof payload.name === "string" ? payload.name.trim() : "";
      const scheduleType = typeof payload.schedule_type === "string" ? payload.schedule_type : "interval";
      if (!jobKey || !jobType || !name) return jsonResponse({ ok: false, error: "job_key, job_type, and name are required" }, 400);
      if (!listRegisteredJobTypes().includes(jobType)) {
        return jsonResponse({ ok: false, error: `Unknown job_type "${jobType}". Registered types: ${listRegisteredJobTypes().join(", ")}` }, 400);
      }
      const cronExpression = typeof payload.cron_expression === "string" ? payload.cron_expression : null;
      const intervalSeconds = typeof payload.interval_seconds === "number" ? payload.interval_seconds : null;
      if (scheduleType === "cron" && cronExpression) {
        try {
          parseCronExpression(cronExpression);
        } catch (err) {
          return jsonResponse({ ok: false, error: err instanceof Error ? err.message : "Invalid cron_expression" }, 400);
        }
      }
      if (scheduleType === "interval" && intervalSeconds != null && intervalSeconds < 60) {
        return jsonResponse({ ok: false, error: "interval_seconds must be >= 60" }, 400);
      }

      let nextRunAt: string | null;
      try {
        nextRunAt = computeNextRunFromPayload(scheduleType, cronExpression, intervalSeconds);
      } catch (err) {
        return jsonResponse({ ok: false, error: err instanceof Error ? err.message : "Invalid schedule" }, 400);
      }

      const { data: created, error } = await supabase.from("scheduled_jobs").insert({
        job_key: jobKey, job_type: jobType, name,
        description: typeof payload.description === "string" ? payload.description : null,
        schedule_type: scheduleType,
        cron_expression: scheduleType === "cron" ? cronExpression : null,
        interval_seconds: scheduleType === "interval" ? intervalSeconds : null,
        enabled: payload.enabled !== false,
        config: typeof payload.config === "object" && payload.config !== null ? payload.config : {},
        priority: typeof payload.priority === "number" ? Math.round(payload.priority) : 0,
        max_retries: typeof payload.max_retries === "number" ? Math.max(0, Math.min(10, Math.round(payload.max_retries))) : 3,
        next_run_at: nextRunAt,
        updated_by: session.email,
      }).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "scheduled_job_created", target_table: "scheduled_jobs", target_id: created.id, status: "success" });
      return jsonResponse({ ok: true, data: created });
    }

    if (payload.action === "update") {
      const jobId = typeof payload.id === "string" ? payload.id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "id is required" }, 400);
      const { data: existing, error: fetchError } = await supabase.from("scheduled_jobs").select("*").eq("id", jobId).maybeSingle();
      if (fetchError) return jsonResponse({ ok: false, error: fetchError.message }, 500);
      if (!existing) return jsonResponse({ ok: false, error: "Schedule not found" }, 404);

      const update: Record<string, unknown> = { updated_by: session.email, updated_at: new Date().toISOString() };
      let scheduleChanged = false;
      if (typeof payload.name === "string") update.name = payload.name;
      if (typeof payload.description === "string") update.description = payload.description;
      if (typeof payload.priority === "number") update.priority = Math.round(payload.priority);
      if (typeof payload.max_retries === "number") update.max_retries = Math.max(0, Math.min(10, Math.round(payload.max_retries)));
      if (typeof payload.config === "object" && payload.config !== null) update.config = payload.config;

      const scheduleType = typeof payload.schedule_type === "string" ? payload.schedule_type : existing.schedule_type;
      const cronExpression = payload.cron_expression !== undefined ? payload.cron_expression : existing.cron_expression;
      const intervalSeconds = payload.interval_seconds !== undefined ? payload.interval_seconds : existing.interval_seconds;
      if (payload.schedule_type !== undefined || payload.cron_expression !== undefined || payload.interval_seconds !== undefined) {
        scheduleChanged = true;
        if (scheduleType === "cron" && cronExpression) {
          try {
            parseCronExpression(cronExpression);
          } catch (err) {
            return jsonResponse({ ok: false, error: err instanceof Error ? err.message : "Invalid cron_expression" }, 400);
          }
        }
        if (scheduleType === "interval" && intervalSeconds != null && intervalSeconds < 60) {
          return jsonResponse({ ok: false, error: "interval_seconds must be >= 60" }, 400);
        }
        update.schedule_type = scheduleType;
        update.cron_expression = scheduleType === "cron" ? cronExpression : null;
        update.interval_seconds = scheduleType === "interval" ? intervalSeconds : null;
      }
      if (typeof payload.enabled === "boolean") {
        update.enabled = payload.enabled;
        if (payload.enabled && !existing.next_run_at) scheduleChanged = true; // re-enabling a job with no next_run_at needs one computed
      }

      if (scheduleChanged) {
        try {
          update.next_run_at = computeNextRunFromPayload(scheduleType, update.cron_expression as string ?? cronExpression, update.interval_seconds as number ?? intervalSeconds);
        } catch (err) {
          return jsonResponse({ ok: false, error: err instanceof Error ? err.message : "Invalid schedule" }, 400);
        }
      }

      const { data: updated, error } = await supabase.from("scheduled_jobs").update(update).eq("id", jobId).select().single();
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "scheduled_job_updated", target_table: "scheduled_jobs", target_id: jobId, status: "success" });
      return jsonResponse({ ok: true, data: updated });
    }

    if (payload.action === "delete") {
      const jobId = typeof payload.id === "string" ? payload.id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "id is required" }, 400);
      const { error } = await supabase.from("scheduled_jobs").delete().eq("id", jobId);
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "scheduled_job_deleted", target_table: "scheduled_jobs", target_id: jobId, status: "success" });
      return jsonResponse({ ok: true, data: { id: jobId } });
    }

    if (payload.action === "run_now") {
      const jobId = typeof payload.id === "string" ? payload.id : null;
      if (!jobId) return jsonResponse({ ok: false, error: "id is required" }, 400);

      // Claim this specific job regardless of next_run_at/enabled — but
      // still respect an existing active lease, so "Run Now" cannot
      // double-run something the scheduler-tick (or another Run Now click)
      // is already executing.
      const workerId = `manual-${session.email || "admin"}-${crypto.randomUUID()}`;
      const { data: claimedRows, error: claimError } = await supabase.rpc("claim_scheduled_job_now", { p_job_id: jobId, p_worker_id: workerId });
      if (claimError) return jsonResponse({ ok: false, error: claimError.message }, 500);
      const claimed = claimedRows && claimedRows.length > 0 ? claimedRows[0] : null;
      if (!claimed) return jsonResponse({ ok: false, error_code: "already_running", error: "This schedule is already running." }, 409);

      const outcome = await executeScheduledJob(supabase, supabaseUrl, anonKey, claimed, "manual");
      await writeAuditLog({ actor_session_type: "session_token", actor_email: session.email || undefined, action: "scheduled_job_run_now", target_table: "scheduled_jobs", target_id: jobId, status: outcome.status === "success" ? "success" : "error" });
      return jsonResponse({ ok: true, data: outcome });
    }

    return jsonResponse({ ok: false, error: "Unknown action" }, 400);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
