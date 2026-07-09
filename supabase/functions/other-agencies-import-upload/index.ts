import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

// Only standard CORS headers — no custom browser headers.
// x-admin-token is passed in the FormData body, not as a header,
// so the browser preflight only sees standard headers that Supabase allows.
const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function getInternalFunctionHeaders(): HeadersInit {
  const INTERNAL_SECRET = Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024";
  return {
    "Content-Type": "application/json",
    "Authorization": `Bearer ${Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")}`,
    "x-internal-secret": INTERNAL_SECRET,
  };
}

async function verifyAdminToken(token: string, supabaseUrl: string, serviceKey: string): Promise<{ ok: boolean; reason?: string }> {
  try {
    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });
    const { data, error } = await supabase
      .from("admin_sessions")
      .select("token, expires_at")
      .eq("token", token)
      .maybeSingle();

    if (error || !data) return { ok: false, reason: "Token not found" };
    if (new Date(data.expires_at) < new Date()) return { ok: false, reason: "Token expired" };
    return { ok: true };
  } catch (err) {
    return { ok: false, reason: String(err) };
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const INTERNAL_SECRET = Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024";

  let supabase: ReturnType<typeof createClient> | null = null;
  let jobId: string | null = null;

  try {
    // Check if this is an internal server-to-server call (no CORS restrictions apply)
    const internalSecret = req.headers.get("x-internal-secret");
    const isInternal = internalSecret === INTERNAL_SECRET;

    const formData = await req.formData();
    const file = formData.get("file") as File | null;
    const stateSlug = formData.get("state_slug") as string | null;

    // Admin token comes from FormData body (not header) to avoid CORS preflight rejection
    const adminToken = formData.get("admin_token") as string | null;

    if (!file || !stateSlug) {
      return new Response(
        JSON.stringify({ ok: false, error: "Missing file or state_slug" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Authenticate: internal calls bypass token check; browser calls must supply admin_token in body
    if (!isInternal) {
      if (!adminToken) {
        return new Response(
          JSON.stringify({ ok: false, error: "Missing admin_token in request body" }),
          { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
      const authResult = await verifyAdminToken(adminToken, supabaseUrl, serviceKey);
      if (!authResult.ok) {
        return new Response(
          JSON.stringify({ ok: false, error: authResult.reason || "Invalid or expired admin token" }),
          { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
    }

    supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const ext = file.name.split(".").pop()?.toLowerCase() || "csv";
    const fileType = ext === "xlsx" ? "xlsx" : ext === "json" ? "json" : "csv";
    const timestamp = Date.now();
    const safeName = file.name.replace(/[^a-zA-Z0-9._-]/g, "_");
    const storagePath = `${stateSlug}/${timestamp}_${safeName}`;

    const fileBytes = await file.arrayBuffer();

    const { error: uploadErr } = await supabase.storage
      .from("import-staging")
      .upload(storagePath, fileBytes, {
        contentType: file.type || "application/octet-stream",
        upsert: true,
      });

    if (uploadErr) {
      return new Response(
        JSON.stringify({ ok: false, error: `Storage upload failed: ${uploadErr.message}` }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
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
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    jobId = job.id;

    await supabase.from("other_agencies_import_events").insert({
      job_id: jobId,
      event_type: "file_staged",
      event_data: { storage_path: storagePath, file_size: file.size },
    }).catch(() => {});

    const internalHeaders = getInternalFunctionHeaders();

    EdgeRuntime.waitUntil(
      (async () => {
        try {
          await supabase!.from("other_agencies_import_jobs")
            .update({ status: "parsing", last_checkpoint: "parse_triggered", updated_at: new Date().toISOString() })
            .eq("id", jobId!);

          const parseResp = await fetch(
            `${supabaseUrl}/functions/v1/other-agencies-import-parse`,
            {
              method: "POST",
              headers: internalHeaders,
              body: JSON.stringify({ job_id: jobId }),
            }
          );

          if (!parseResp.ok) {
            const errText = await parseResp.text().catch(() => parseResp.statusText);
            await supabase!.from("other_agencies_import_jobs")
              .update({
                status: "failed",
                error_message: `Parse trigger failed: ${parseResp.status} - ${errText}`,
                last_checkpoint: "parse_trigger_failed",
                updated_at: new Date().toISOString(),
              })
              .eq("id", jobId!);
            await supabase!.from("other_agencies_import_events").insert({
              job_id: jobId,
              event_type: "parse_trigger_failed",
              event_data: { error: errText, status: parseResp.status },
            }).catch(() => {});
          }
        } catch (err) {
          await supabase!.from("other_agencies_import_jobs")
            .update({
              status: "failed",
              error_message: `Parse trigger exception: ${String(err)}`,
              last_checkpoint: "parse_trigger_exception",
              updated_at: new Date().toISOString(),
            })
            .eq("id", jobId!).catch(() => {});
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
        message: "File staged. Incremental parse started in background.",
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[upload] Error:", err);
    if (supabase && jobId) {
      await supabase.from("other_agencies_import_jobs")
        .update({
          status: "failed",
          error_message: String(err),
          last_checkpoint: "upload_error",
          updated_at: new Date().toISOString(),
        })
        .eq("id", jobId).catch(() => {});
    }
    return new Response(
      JSON.stringify({ ok: false, error: String(err), job_id: jobId }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
