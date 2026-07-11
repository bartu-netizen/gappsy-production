import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const MAX_FILE_SIZE = 5 * 1024 * 1024;
const ALLOWED_TYPES = ["image/png", "image/jpeg", "image/jpg", "image/webp", "image/svg+xml"];
const ALLOWED_KINDS = new Set(["logo", "screenshot"]);
const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
const DEFAULT_PER_PAGE = 30;
const MAX_PER_PAGE = 100;

// Admin-only media manager for the tool-media Storage bucket. Upload
// (POST) is unchanged in behavior from before — same multipart -> Storage
// flow — except it now also records a tool_media row so the file shows up
// in the Media Library (GET) and can be deleted (DELETE) or reused across
// tools instead of being an orphaned, unlisted upload the moment it's
// attached to a tool's field.
Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const session = await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }
    const supabase = createClient(supabaseUrl, serviceRoleKey);
    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      const q = (url.searchParams.get("q") || "").trim();
      const kindFilter = url.searchParams.get("kind");
      const toolIdFilter = url.searchParams.get("tool_id");
      const page = Math.max(1, Number(url.searchParams.get("page")) || 1);
      const perPage = Math.min(MAX_PER_PAGE, Math.max(1, Number(url.searchParams.get("per_page")) || DEFAULT_PER_PAGE));
      const rangeFrom = (page - 1) * perPage;
      const rangeTo = rangeFrom + perPage - 1;

      let query = supabase
        .from("tool_media")
        .select("*, tools(id, slug, name, logo)", { count: "exact" });
      if (kindFilter && kindFilter !== "all") query = query.eq("kind", kindFilter);
      if (toolIdFilter) query = query.eq("tool_id", toolIdFilter);
      if (q) query = query.ilike("original_filename", `%${q}%`);
      query = query.order("created_at", { ascending: false }).range(rangeFrom, rangeTo);

      const { data, error, count } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data: data || [], total: count || 0, page, per_page: perPage });
    }

    if (req.method === "POST") {
      const contentType = req.headers.get("content-type") || "";
      if (!contentType.includes("multipart/form-data")) {
        return jsonResponse({ ok: false, error: "Content-Type must be multipart/form-data" }, 400);
      }

      const formData = await req.formData();
      const file = formData.get("file") as File | null;
      const toolId = formData.get("toolId") as string | null;
      const kind = (formData.get("kind") as string | null) || "screenshot";

      if (!file) return jsonResponse({ ok: false, error: "No file provided" }, 400);
      if (!toolId || !UUID_PATTERN.test(toolId)) {
        return jsonResponse({ ok: false, error: "A valid toolId is required" }, 400);
      }
      if (!ALLOWED_KINDS.has(kind)) {
        return jsonResponse({ ok: false, error: `kind must be one of: ${[...ALLOWED_KINDS].join(", ")}` }, 400);
      }
      if (!ALLOWED_TYPES.includes(file.type)) {
        return jsonResponse({ ok: false, error: "Invalid file type. Allowed: PNG, JPG, WebP, SVG" }, 400);
      }
      if (file.size > MAX_FILE_SIZE) {
        return jsonResponse({ ok: false, error: "File too large. Maximum size is 5MB" }, 400);
      }

      const extFromName = file.name.split(".").pop();
      const ext = extFromName && /^[a-z0-9]+$/i.test(extFromName) ? extFromName : "png";
      const filePath = `${kind}s/${toolId}/${Date.now()}-${crypto.randomUUID().slice(0, 8)}.${ext}`;

      const arrayBuffer = await file.arrayBuffer();
      const { error: uploadError } = await supabase.storage
        .from("tool-media")
        .upload(filePath, new Uint8Array(arrayBuffer), { contentType: file.type, upsert: false });

      if (uploadError) {
        return jsonResponse({ ok: false, error: `Upload failed: ${uploadError.message}` }, 500);
      }

      const { data: urlData } = supabase.storage.from("tool-media").getPublicUrl(filePath);

      const { error: trackError } = await supabase.from("tool_media").insert({
        tool_id: toolId,
        file_url: urlData.publicUrl,
        file_path: filePath,
        kind,
        original_filename: file.name,
        size_bytes: file.size,
        uploaded_by: session.email,
      });
      if (trackError) {
        // The upload itself succeeded — the caller already has a usable URL.
        // A tracking-row failure shouldn't fail the whole upload, just means
        // this one file won't show up in the Media Library until re-synced.
        console.error("[admin-tool-media] tool_media insert failed (upload still succeeded):", trackError.message);
      }

      return jsonResponse({ ok: true, url: urlData.publicUrl, path: filePath });
    }

    if (req.method === "DELETE") {
      if (!id) return jsonResponse({ ok: false, error: "Media ID is required" }, 400);

      const { data: record, error: fetchError } = await supabase
        .from("tool_media")
        .select("file_path")
        .eq("id", id)
        .maybeSingle();
      if (fetchError) return jsonResponse({ ok: false, error: fetchError.message }, 500);
      if (!record) return jsonResponse({ ok: false, error: "Media record not found" }, 404);

      const { error: storageError } = await supabase.storage.from("tool-media").remove([record.file_path]);
      if (storageError) {
        return jsonResponse({ ok: false, error: `Failed to delete file: ${storageError.message}` }, 500);
      }

      const { error: deleteError } = await supabase.from("tool_media").delete().eq("id", id);
      if (deleteError) return jsonResponse({ ok: false, error: deleteError.message }, 500);

      return jsonResponse({ ok: true });
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
