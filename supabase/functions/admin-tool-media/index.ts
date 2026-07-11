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

// Admin-only screenshot/logo upload for the Tools CMS media manager.
// Mirrors upload-logo's multipart -> Uint8Array -> Storage -> getPublicUrl
// flow, but (a) writes to the new `tool-media` bucket rather than
// `agency-logos`, (b) is gated by requireAdminSession (upload-logo has no
// auth check at all — a gap this deliberately does not repeat), and (c)
// has no DB side effects: it only returns a public URL. The caller (the
// tool editor) is responsible for saving that URL via admin-tools'
// screenshots/logo fields, same as it already does for any other field.
Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

    if (req.method !== "POST") {
      return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    }

    const contentType = req.headers.get("content-type") || "";
    if (!contentType.includes("multipart/form-data")) {
      return jsonResponse({ ok: false, error: "Content-Type must be multipart/form-data" }, 400);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }
    const supabase = createClient(supabaseUrl, serviceRoleKey);

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

    return jsonResponse({ ok: true, url: urlData.publicUrl, path: filePath });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
