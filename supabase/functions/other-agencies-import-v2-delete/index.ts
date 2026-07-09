import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { CORS_HEADERS, extractToken, verifySessionToken } from "../_shared/adminSession.ts";

interface DeleteRequest {
  job_ids: string[];
}

interface DeleteResponse {
  ok: boolean;
  deleted_count: number;
  failed_count: number;
  errors: string[];
  message?: string;
}

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    if (req.method !== "POST") {
      return json({ error: "METHOD_NOT_ALLOWED", message: "Only POST is allowed" }, 405);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    // Verify admin session
    const token = extractToken(req);
    if (!token) return json({ error: "MISSING_TOKEN", message: "Admin token required" }, 401);

    const tokenCheck = await verifySessionToken(token);
    if (!tokenCheck.ok) {
      return json({
        error: "UNAUTHORIZED",
        message: tokenCheck.error === "expired" ? "Admin session expired" : "Invalid admin token",
      }, 401);
    }

    const body: DeleteRequest = await req.json();

    if (!body.job_ids || !Array.isArray(body.job_ids) || body.job_ids.length === 0) {
      return json({ error: "INVALID_REQUEST", message: "job_ids array is required and must not be empty" }, 400);
    }

    // Limit to 100 jobs at once for safety
    if (body.job_ids.length > 100) {
      return json({ error: "TOO_MANY_JOBS", message: "Cannot delete more than 100 jobs at once" }, 400);
    }

    console.log(`[import-v2-delete] Deleting ${body.job_ids.length} import jobs`);

    let deletedCount = 0;
    let failedCount = 0;
    const errors: string[] = [];

    // Delete each job (CASCADE will handle chunks and events)
    for (const jobId of body.job_ids) {
      try {
        // First, verify the job exists and get its status
        const { data: job, error: fetchErr } = await supabase
          .from("other_agencies_import_jobs_v2")
          .select("id, status, state_slug, file_name")
          .eq("id", jobId)
          .maybeSingle();

        if (fetchErr) {
          console.error(`[import-v2-delete] Error fetching job ${jobId}:`, fetchErr);
          errors.push(`${jobId}: fetch error - ${fetchErr.message}`);
          failedCount++;
          continue;
        }

        if (!job) {
          console.warn(`[import-v2-delete] Job ${jobId} not found, skipping`);
          errors.push(`${jobId}: not found`);
          failedCount++;
          continue;
        }

        // Safety check: only allow deletion of non-completed jobs or explicitly failed/stuck jobs
        // This is configurable - you can adjust this logic
        const allowedStatuses = ["failed", "cancelled", "parsing", "staged", "queued"];

        // For now, allow deleting any job for cleanup purposes
        // If you want stricter rules, uncomment this:
        // if (!allowedStatuses.includes(job.status)) {
        //   errors.push(`${jobId}: cannot delete ${job.status} jobs (only ${allowedStatuses.join(", ")} allowed)`);
        //   failedCount++;
        //   continue;
        // }

        // Delete the job (CASCADE will automatically delete associated chunks and events)
        const { error: deleteErr } = await supabase
          .from("other_agencies_import_jobs_v2")
          .delete()
          .eq("id", jobId);

        if (deleteErr) {
          console.error(`[import-v2-delete] Error deleting job ${jobId}:`, deleteErr);
          errors.push(`${jobId}: delete error - ${deleteErr.message}`);
          failedCount++;
          continue;
        }

        console.log(`[import-v2-delete] Successfully deleted job ${jobId} (${job.state_slug} - ${job.file_name})`);
        deletedCount++;
      } catch (err) {
        const msg = err instanceof Error ? err.message : String(err);
        console.error(`[import-v2-delete] Exception deleting job ${jobId}:`, msg);
        errors.push(`${jobId}: exception - ${msg}`);
        failedCount++;
      }
    }

    const response: DeleteResponse = {
      ok: deletedCount > 0,
      deleted_count: deletedCount,
      failed_count: failedCount,
      errors,
    };

    if (deletedCount > 0 && failedCount === 0) {
      response.message = `Successfully deleted ${deletedCount} import job${deletedCount > 1 ? "s" : ""}`;
    } else if (deletedCount > 0 && failedCount > 0) {
      response.message = `Deleted ${deletedCount} jobs, ${failedCount} failed`;
    } else {
      response.message = `All ${failedCount} deletion attempts failed`;
    }

    console.log(`[import-v2-delete] Result: ${deletedCount} deleted, ${failedCount} failed`);

    return json(response, deletedCount > 0 ? 200 : 400);
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[import-v2-delete] Unexpected error:", msg);
    return json({ error: "INTERNAL_ERROR", message: msg }, 500);
  }
});
