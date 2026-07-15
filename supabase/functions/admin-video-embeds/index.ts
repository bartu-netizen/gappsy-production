import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

// CRUD for page_video_embeds (YouTube/Shorts embeds placed on specific
// pages by path — see migration 20260715050000). YouTube URL parsing
// (extracting video_id / detecting Shorts) happens client-side in the
// admin page before it ever reaches here, so this function only validates
// shape and persists — no business logic duplicated across the Deno and
// browser runtimes.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

// page_video_embeds predates this feature and already has a
// trg_normalize_page_video_embed_path BEFORE INSERT/UPDATE trigger that
// lowercases the path and enforces exactly one trailing slash — mirrored
// here (not fought) so the duplicate-path check below compares against the
// same format the trigger will actually persist, regardless of how the
// admin typed it in.
function normalizePagePath(path: string): string {
  const trimmed = path.trim().toLowerCase();
  const withLeadingSlash = trimmed.startsWith("/") ? trimmed : `/${trimmed}`;
  return `${withLeadingSlash.replace(/\/+$/, "")}/`;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });

  try {
    const session = await requireAdminSession(req);
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    if (req.method === "GET") {
      const { data, error } = await supabase
        .from("page_video_embeds")
        .select("id, page_path, youtube_url, youtube_video_id, is_short, title, is_active, view_count, created_at, updated_at")
        .order("created_at", { ascending: false });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      if (payload.action === "create") {
        const pagePath = typeof payload.page_path === "string" ? normalizePagePath(payload.page_path) : null;
        const youtubeUrl = typeof payload.youtube_url === "string" ? payload.youtube_url.trim() : null;
        const videoId = typeof payload.youtube_video_id === "string" ? payload.youtube_video_id.trim() : null;
        const title = typeof payload.title === "string" ? payload.title.trim() : null;
        if (!pagePath || !youtubeUrl || !videoId || !title) {
          return jsonResponse({ ok: false, error: "page_path, youtube_url, youtube_video_id, and title are required" }, 400);
        }

        const { data: existing } = await supabase.from("page_video_embeds").select("id").eq("page_path", pagePath).maybeSingle();
        if (existing) return jsonResponse({ ok: false, error: `An embed already exists for ${pagePath} — edit it instead.` }, 409);

        const { data: created, error } = await supabase
          .from("page_video_embeds")
          .insert({
            page_path: pagePath,
            youtube_url: youtubeUrl,
            youtube_video_id: videoId,
            is_short: Boolean(payload.is_short),
            title,
          })
          .select()
          .single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "video_embed_create", target_table: "page_video_embeds", target_id: created.id, status: "success",
        });
        return jsonResponse({ ok: true, data: created });
      }

      if (payload.action === "update") {
        const id = typeof payload.id === "string" ? payload.id : null;
        if (!id) return jsonResponse({ ok: false, error: "id is required" }, 400);

        const update: Record<string, unknown> = { updated_at: new Date().toISOString() };
        if (typeof payload.page_path === "string") update.page_path = normalizePagePath(payload.page_path);
        if (typeof payload.youtube_url === "string") update.youtube_url = payload.youtube_url.trim();
        if (typeof payload.youtube_video_id === "string") update.youtube_video_id = payload.youtube_video_id.trim();
        if (typeof payload.is_short === "boolean") update.is_short = payload.is_short;
        if (typeof payload.title === "string") update.title = payload.title.trim();
        if (typeof payload.is_active === "boolean") update.is_active = payload.is_active;

        if (update.page_path) {
          const { data: existing } = await supabase
            .from("page_video_embeds").select("id").eq("page_path", update.page_path as string).neq("id", id).maybeSingle();
          if (existing) return jsonResponse({ ok: false, error: `An embed already exists for ${update.page_path} — edit that one instead.` }, 409);
        }

        const { data: updated, error } = await supabase.from("page_video_embeds").update(update).eq("id", id).select().single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "video_embed_update", target_table: "page_video_embeds", target_id: id, status: "success",
        });
        return jsonResponse({ ok: true, data: updated });
      }

      if (payload.action === "delete") {
        const id = typeof payload.id === "string" ? payload.id : null;
        if (!id) return jsonResponse({ ok: false, error: "id is required" }, 400);

        const { error } = await supabase.from("page_video_embeds").delete().eq("id", id);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "video_embed_delete", target_table: "page_video_embeds", target_id: id, status: "success",
        });
        return jsonResponse({ ok: true });
      }

      return jsonResponse({ ok: false, error: "Unknown action" }, 400);
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
