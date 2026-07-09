import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminOrInternal, CORS_HEADERS, getInternalFunctionHeaders } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  let supabase: ReturnType<typeof createClient> | null = null;
  let jobId: string | null = null;

  try {
    const authResult = await requireAdminOrInternal(req);
    if (authResult instanceof Response) return authResult;

    supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const formData = await req.formData();
    const file = formData.get("file") as File | null;
    const stateSlug = formData.get("state_slug") as string | null;

    if (!file || !stateSlug) {
      return new Response(
        JSON.stringify({ ok: false, error: "Missing file or state_slug" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const ext = file.name.split(".").pop()?.toLowerCase() || "csv";
    const fileType = ext === "xlsx" ? "xlsx" : ext === "json" ? "json" : "csv";
    const timestamp = Date.now();
    const safeName = file.name.replace(/[^a-zA-Z0-9._-]/g, "_");
    const storagePath = `${stateSlug}/${timestamp}_${safeName}`;

    const fileBytes = await file.arrayBuffer();

    const { error: uploadErr } = await supabase.storage
      .from("import-staging")
      .upload(storagePath, fileBytes, {
        contentType: file.type || "text/csv",
        upsert: true,
      });

    if (uploadErr) {
      return new Response(
        JSON.stringify({ ok: false, error: `Upload failed: ${uploadErr.message}` }),
        { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const { data: job, error: jobErr } = await supabase
      .from("other_agencies_import_jobs")
      .insert({
        state_slug: stateSlug,
        source_filename: file.name,
        source_file_type: fileType,
        storage_path: storagePath,
        status: "staged",
        last_checkpoint: "file_staged",
        file_size_bytes: file.size,
        updated_at: new Date().toISOString(),
      })
      .select("id")
      .single();

    if (jobErr || !job) {
      return new Response(
        JSON.stringify({ ok: false, error: `Job creation failed: ${jobErr?.message}` }),
        { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    jobId = job.id;

    await supabase.from("other_agencies_import_events").insert({
      job_id: jobId,
      event_type: "file_staged",
      event_data: { storage_path: storagePath, file_size: file.size, file_type: fileType },
    }).catch(() => {});

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
    const internalHeaders = getInternalFunctionHeaders();

    EdgeRuntime.waitUntil(
      (async () => {
        try {
          await supabase!.from("other_agencies_import_jobs")
            .update({ status: "parsing", last_checkpoint: "parse_triggered", updated_at: new Date().toISOString() })
            .eq("id", jobId!);

          const parseResp = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-parse`, {
            method: "POST",
            headers: internalHeaders,
            body: JSON.stringify({ job_id: jobId }),
          });

          if (!parseResp.ok) {
            const errText = await parseResp.text().catch(() => parseResp.statusText);
            const errorMsg = `Parse trigger failed: ${parseResp.status} - ${errText}`;
            await supabase!.from("other_agencies_import_jobs")
              .update({
                status: "failed",
                error_message: errorMsg,
                last_checkpoint: "parse_trigger_failed",
                updated_at: new Date().toISOString(),
              })
              .eq("id", jobId!);
          }
        } catch (err) {
          const errorMsg = `Parse trigger exception: ${String(err)}`;
          await supabase!.from("other_agencies_import_jobs")
            .update({
              status: "failed",
              error_message: errorMsg,
              last_checkpoint: "parse_trigger_exception",
              updated_at: new Date().toISOString(),
            })
            .eq("id", jobId!);
        }
      })()
    );

    return new Response(
      JSON.stringify({
        ok: true,
        job_id: jobId,
        storage_path: storagePath,
        file_size: file.size,
        file_type: fileType,
        message: "File staged. Parsing started in background.",
      }),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[stage] Error:", err);
    return new Response(
      JSON.stringify({ ok: false, error: String(err), job_id: jobId }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
