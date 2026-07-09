import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { CORS_HEADERS, verifySessionToken } from "../_shared/adminSession.ts";

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const formData = await req.formData();

    // Auth: token in FormData body — avoids CORS preflight issues with custom headers on multipart
    const adminToken = formData.get("admin_token") as string | null;
    if (!adminToken) return json({ error: "MISSING_TOKEN", message: "admin_token required in form body" }, 401);

    const tokenCheck = await verifySessionToken(adminToken.trim());
    if (!tokenCheck.ok) {
      return json({
        error: "UNAUTHORIZED",
        message: tokenCheck.error === "expired" ? "Admin session expired — log in again" : "Invalid admin token",
      }, 401);
    }

    const file = formData.get("file") as File | null;
    const stateSlug = (formData.get("state_slug") as string | null)?.trim();
    const isDryRun = formData.get("dry_run") === "true";

    if (!file) return json({ error: "NO_FILE", message: "file field required" }, 400);
    if (!stateSlug) return json({ error: "NO_STATE", message: "state_slug field required" }, 400);

    const fileName = file.name;
    const fileSizeBytes = file.size;
    const ext = fileName.split(".").pop()?.toLowerCase() ?? "unknown";
    const fileFormat = ["csv", "xlsx", "xls", "json"].includes(ext) ? ext : "unknown";

    if (fileFormat === "unknown") {
      return json({ error: "UNSUPPORTED_FORMAT", message: `File format '${ext}' not supported. Use CSV, XLSX, XLS, or JSON.` }, 400);
    }

    const maxBytes = 50 * 1024 * 1024;
    if (fileSizeBytes > maxBytes) {
      return json({ error: "FILE_TOO_LARGE", message: `File exceeds 50 MB limit (${(fileSizeBytes / 1024 / 1024).toFixed(1)} MB)` }, 400);
    }

    const storagePath = `v2/${stateSlug}/${Date.now()}_${fileName.replace(/[^a-zA-Z0-9._-]/g, "_")}`;
    const fileBuffer = await file.arrayBuffer();

    let uploadError = null;
    const { error: firstUploadError } = await supabase.storage
      .from("import-staging")
      .upload(storagePath, fileBuffer, {
        contentType: file.type || "application/octet-stream",
        upsert: false,
      });
    uploadError = firstUploadError;

    if (uploadError) {
      if (uploadError.message?.includes("Bucket not found") || uploadError.message?.includes("bucket")) {
        await supabase.storage.createBucket("import-staging", { public: false });
        const { error: retryError } = await supabase.storage
          .from("import-staging")
          .upload(storagePath, fileBuffer, {
            contentType: file.type || "application/octet-stream",
            upsert: false,
          });
        if (retryError) return json({ error: "STORAGE_ERROR", message: retryError.message }, 500);
        uploadError = null;
      } else {
        return json({ error: "STORAGE_ERROR", message: uploadError.message }, 500);
      }
    }

    const { data: job, error: jobError } = await supabase
      .from("other_agencies_import_jobs_v2")
      .insert({
        state_slug: stateSlug,
        file_name: fileName,
        file_size_bytes: fileSizeBytes,
        file_format: fileFormat,
        storage_path: storagePath,
        status: "staged",
        is_dry_run: isDryRun,
        last_checkpoint: isDryRun ? "Dry-run file staged — waiting for parse (no mutations)" : "File uploaded — waiting for parse",
      })
      .select("id")
      .single();

    if (jobError || !job) {
      return json({ error: "JOB_CREATE_FAILED", message: jobError?.message ?? "Failed to create job record" }, 500);
    }

    const parseUrl = `${supabaseUrl}/functions/v1/other-agencies-import-v2-parse`;
    EdgeRuntime.waitUntil(
      fetch(parseUrl, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${serviceKey}`,
          "x-internal-secret": Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024",
        },
        body: JSON.stringify({ job_id: job.id }),
      }).catch((e) => {
        console.error("[v2-upload] Failed to kick parse:", e.message);
      })
    );

    return json({
      ok: true,
      job_id: job.id,
      status: "staged",
      is_dry_run: isDryRun,
      file_name: fileName,
      file_size_bytes: fileSizeBytes,
      file_format: fileFormat,
      state_slug: stateSlug,
      storage_path: storagePath,
      message: isDryRun ? "Dry-run staged. Parse started — no rows will be mutated." : "File staged. Parse started in background.",
    });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[v2-upload] Unexpected error:", msg);
    return json({ error: "INTERNAL_ERROR", message: msg }, 500);
  }
});
