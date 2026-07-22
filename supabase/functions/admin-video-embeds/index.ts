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
        .select(
          "id, page_path, youtube_url, youtube_video_id, is_short, title, is_active, impression_count, click_count, view_count, seconds_watched_total, created_at, updated_at, page_video_embed_targets(id, page_path)"
        )
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

        // One video can be shown on several pages at once (e.g. a 3-tool
        // comparison video also embedded on each of the 3 tool pages) —
        // page_path is the primary/first target; extra_page_paths lets the
        // admin set every other target in the same request.
        const extraPagePaths = Array.isArray(payload.extra_page_paths)
          ? (payload.extra_page_paths as unknown[]).filter((p): p is string => typeof p === "string" && p.trim().length > 0).map(normalizePagePath)
          : [];
        const allTargetPaths = [...new Set([pagePath, ...extraPagePaths])];

        const { data: clashingTargets } = await supabase.from("page_video_embed_targets").select("page_path").in("page_path", allTargetPaths);
        if (clashingTargets && clashingTargets.length > 0) {
          return jsonResponse({ ok: false, error: `Already in use by another video: ${clashingTargets.map((t) => t.page_path).join(", ")}` }, 409);
        }

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

        const { error: targetsError } = await supabase
          .from("page_video_embed_targets")
          .insert(allTargetPaths.map((p) => ({ video_embed_id: created.id, page_path: p })));
        if (targetsError) {
          await supabase.from("page_video_embeds").delete().eq("id", created.id); // roll back the orphaned parent row
          return jsonResponse({ ok: false, error: `Failed to save target pages: ${targetsError.message}` }, 500);
        }

        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "video_embed_create", target_table: "page_video_embeds", target_id: created.id, status: "success",
        });
        return jsonResponse({ ok: true, data: { ...created, page_video_embed_targets: allTargetPaths.map((p) => ({ page_path: p })) } });
      }

      if (payload.action === "add_target") {
        const videoEmbedId = typeof payload.video_embed_id === "string" ? payload.video_embed_id : null;
        const pagePath = typeof payload.page_path === "string" ? normalizePagePath(payload.page_path) : null;
        if (!videoEmbedId || !pagePath) return jsonResponse({ ok: false, error: "video_embed_id and page_path are required" }, 400);

        const { data: created, error } = await supabase
          .from("page_video_embed_targets")
          .insert({ video_embed_id: videoEmbedId, page_path: pagePath })
          .select()
          .single();
        if (error) {
          if ((error as { code?: string }).code === "23505") return jsonResponse({ ok: false, error: `${pagePath} is already in use by a video.` }, 409);
          return jsonResponse({ ok: false, error: error.message }, 500);
        }

        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "video_embed_target_add", target_table: "page_video_embed_targets", target_id: created.id, status: "success",
        });
        return jsonResponse({ ok: true, data: created });
      }

      if (payload.action === "remove_target") {
        const id = typeof payload.id === "string" ? payload.id : null;
        if (!id) return jsonResponse({ ok: false, error: "id is required" }, 400);

        const { data: target } = await supabase.from("page_video_embed_targets").select("video_embed_id").eq("id", id).maybeSingle();
        if (!target) return jsonResponse({ ok: false, error: "Target not found" }, 404);

        const { count } = await supabase
          .from("page_video_embed_targets")
          .select("id", { count: "exact", head: true })
          .eq("video_embed_id", target.video_embed_id);
        if ((count ?? 0) <= 1) return jsonResponse({ ok: false, error: "A video needs at least one page — remove the video itself instead." }, 400);

        const { error } = await supabase.from("page_video_embed_targets").delete().eq("id", id);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token", actor_email: session.email || undefined,
          action: "video_embed_target_remove", target_table: "page_video_embed_targets", target_id: id, status: "success",
        });
        return jsonResponse({ ok: true });
      }

      if (payload.action === "update") {
        const id = typeof payload.id === "string" ? payload.id : null;
        if (!id) return jsonResponse({ ok: false, error: "id is required" }, 400);

        const { data: before } = await supabase.from("page_video_embeds").select("page_path").eq("id", id).maybeSingle();

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

        // Keep the primary target row (page_video_embed_targets) pointed at
        // the same path as page_path itself, so renaming the primary path
        // here doesn't leave a stale/duplicate target behind.
        if (update.page_path && before?.page_path && before.page_path !== update.page_path) {
          await supabase
            .from("page_video_embed_targets")
            .update({ page_path: update.page_path as string })
            .eq("video_embed_id", id)
            .eq("page_path", before.page_path);
        }

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
