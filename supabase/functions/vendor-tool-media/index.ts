import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { requireVendorSession, createServiceClient } from "../_shared/vendorAuth.ts";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};
const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

// Lets a vendor upload/replace their own tool's logo — the same tool-media
// Storage bucket and logos/<toolId>/... path convention admin-tool-media
// already uses, but scoped to exactly the caller's own toolId (resolved
// from requireVendorSession, never trusted from the request) and to
// kind="logo" only (no screenshot upload here). Updates tools.logo directly
// in the same request, unlike the admin flow's separate upload -> set-field
// steps, since a vendor only ever has this one thing to do here.
const MAX_FILE_SIZE = 5 * 1024 * 1024;
const ALLOWED_TYPES = ["image/png", "image/jpeg", "image/jpg", "image/webp", "image/svg+xml"];

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const supabase = createServiceClient();
    const session = await requireVendorSession(req, supabase);

    const contentType = req.headers.get("content-type") || "";
    if (!contentType.includes("multipart/form-data")) {
      return jsonResponse({ ok: false, error: "Content-Type must be multipart/form-data" }, 400);
    }

    const formData = await req.formData();
    const file = formData.get("file") as File | null;
    if (!file) return jsonResponse({ ok: false, error: "No file provided" }, 400);
    if (!ALLOWED_TYPES.includes(file.type)) {
      return jsonResponse({ ok: false, error: "Invalid file type. Allowed: PNG, JPG, WebP, SVG" }, 400);
    }
    if (file.size > MAX_FILE_SIZE) {
      return jsonResponse({ ok: false, error: "File too large. Maximum size is 5MB" }, 400);
    }

    const extFromName = file.name.split(".").pop();
    const ext = extFromName && /^[a-z0-9]+$/i.test(extFromName) ? extFromName : "png";
    const filePath = `logos/${session.toolId}/${Date.now()}-${crypto.randomUUID().slice(0, 8)}.${ext}`;

    const arrayBuffer = await file.arrayBuffer();
    const { error: uploadError } = await supabase.storage
      .from("tool-media")
      .upload(filePath, new Uint8Array(arrayBuffer), { contentType: file.type, upsert: false });
    if (uploadError) return jsonResponse({ ok: false, error: `Upload failed: ${uploadError.message}` }, 500);

    const { data: urlData } = supabase.storage.from("tool-media").getPublicUrl(filePath);

    const { error: updateError } = await supabase.from("tools").update({ logo: urlData.publicUrl, updated_at: new Date().toISOString() }).eq("id", session.toolId);
    if (updateError) return jsonResponse({ ok: false, error: `Uploaded, but failed to save: ${updateError.message}` }, 500);

    const { error: trackError } = await supabase.from("tool_media").insert({
      tool_id: session.toolId,
      file_url: urlData.publicUrl,
      file_path: filePath,
      kind: "logo",
      original_filename: file.name,
      size_bytes: file.size,
      uploaded_by: session.email,
    });
    if (trackError) {
      // The logo is already live — a Media Library tracking-row failure is
      // not worth failing the whole request over.
      console.error("[vendor-tool-media] tool_media insert failed (upload still succeeded):", trackError.message);
    }

    return jsonResponse({ ok: true, url: urlData.publicUrl });
  } catch (error) {
    const status = (error as { status?: number }).status ?? 500;
    const message = error instanceof Error ? error.message : "Unknown error";
    return jsonResponse({ ok: false, error: message }, status);
  }
});
