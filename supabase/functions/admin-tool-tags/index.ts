import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

const UNIQUE_VIOLATION = "23505";

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);
    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "GET") {
      if (id) {
        const { data, error } = await supabase
          .from("tool_tags")
          .select("*")
          .eq("id", id)
          .maybeSingle();

        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!data) return jsonResponse({ ok: false, error: "Tag not found" }, 404);
        return jsonResponse({ ok: true, data });
      }

      const q = (url.searchParams.get("q") || "").trim();
      let listQuery = supabase.from("tool_tags").select("*").order("name", { ascending: true });
      if (q) listQuery = listQuery.ilike("name", `%${q}%`);

      const { data, error } = await listQuery;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const tagIds = (data || []).map((t: { id: string }) => t.id);
      let toolCounts = new Map<string, number>();
      if (tagIds.length > 0) {
        const { data: links, error: linksError } = await supabase
          .from("tool_tag_links")
          .select("tag_id")
          .in("tag_id", tagIds);
        if (linksError) return jsonResponse({ ok: false, error: linksError.message }, 500);
        toolCounts = (links || []).reduce((map: Map<string, number>, l: { tag_id: string }) => {
          map.set(l.tag_id, (map.get(l.tag_id) || 0) + 1);
          return map;
        }, new Map<string, number>());
      }

      const withCounts = (data || []).map((t: { id: string }) => ({ ...t, tool_count: toolCounts.get(t.id) || 0 }));
      return jsonResponse({ ok: true, data: withCounts });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      // Merges `source_id` into `target_id`: every tool tagged with the
      // source tag gets the target tag instead (deduped — a tool already
      // carrying both isn't double-linked), then the source tag row is
      // deleted. Irreversible, so the caller UI must confirm before calling
      // this.
      if (payload.action === "merge") {
        const sourceId = payload.source_id as string | undefined;
        const targetId = payload.target_id as string | undefined;
        if (!sourceId || !targetId) {
          return jsonResponse({ ok: false, error: "source_id and target_id are required" }, 400);
        }
        if (sourceId === targetId) {
          return jsonResponse({ ok: false, error: "source_id and target_id must be different tags" }, 400);
        }

        const { data: sourceLinks, error: sourceLinksError } = await supabase
          .from("tool_tag_links")
          .select("tool_id")
          .eq("tag_id", sourceId);
        if (sourceLinksError) return jsonResponse({ ok: false, error: sourceLinksError.message }, 500);

        const { data: targetLinks, error: targetLinksError } = await supabase
          .from("tool_tag_links")
          .select("tool_id")
          .eq("tag_id", targetId);
        if (targetLinksError) return jsonResponse({ ok: false, error: targetLinksError.message }, 500);

        const targetToolIds = new Set((targetLinks || []).map((l: { tool_id: string }) => l.tool_id));
        const toRelink = (sourceLinks || [])
          .map((l: { tool_id: string }) => l.tool_id)
          .filter((toolId: string) => !targetToolIds.has(toolId));

        if (toRelink.length > 0) {
          const { error: insertError } = await supabase
            .from("tool_tag_links")
            .insert(toRelink.map((toolId: string) => ({ tool_id: toolId, tag_id: targetId })));
          if (insertError) return jsonResponse({ ok: false, error: insertError.message }, 500);
        }

        const { error: deleteLinksError } = await supabase.from("tool_tag_links").delete().eq("tag_id", sourceId);
        if (deleteLinksError) return jsonResponse({ ok: false, error: deleteLinksError.message }, 500);

        const { error: deleteTagError } = await supabase.from("tool_tags").delete().eq("id", sourceId);
        if (deleteTagError) return jsonResponse({ ok: false, error: deleteTagError.message }, 500);

        return jsonResponse({ ok: true, data: { merged_tool_count: toRelink.length } });
      }

      if (!payload.slug || !payload.name) {
        return jsonResponse({ ok: false, error: "Missing required fields: slug, name" }, 400);
      }

      const { data: existing } = await supabase
        .from("tool_tags")
        .select("id")
        .eq("slug", payload.slug)
        .maybeSingle();

      if (existing) {
        return jsonResponse({ ok: false, error: `A tag with slug "${payload.slug}" already exists` }, 409);
      }

      const row = {
        slug: payload.slug,
        name: payload.name,
        description: payload.description || null,
      };

      const { data, error } = await supabase.from("tool_tags").insert(row).select().single();

      if (error) {
        if (error.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: `A tag with slug "${payload.slug}" already exists` }, 409);
        }
        return jsonResponse({ ok: false, error: error.message }, 500);
      }
      return jsonResponse({ ok: true, data });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Tag ID is required" }, 400);

      const { data: existing } = await supabase
        .from("tool_tags")
        .select("id, slug")
        .eq("id", id)
        .maybeSingle();

      if (!existing) return jsonResponse({ ok: false, error: "Tag not found" }, 404);

      const payload = await req.json();

      if (payload.slug && payload.slug !== existing.slug) {
        const { data: slugExists } = await supabase
          .from("tool_tags")
          .select("id")
          .eq("slug", payload.slug)
          .neq("id", id)
          .maybeSingle();

        if (slugExists) {
          return jsonResponse({ ok: false, error: `A tag with slug "${payload.slug}" already exists` }, 409);
        }
      }

      const fields = ["slug", "name", "description"];
      const updates: Record<string, unknown> = { updated_at: new Date().toISOString() };
      for (const field of fields) {
        if (Object.prototype.hasOwnProperty.call(payload, field)) {
          updates[field] = payload[field];
        }
      }

      const { data, error } = await supabase
        .from("tool_tags")
        .update(updates)
        .eq("id", id)
        .select()
        .single();

      if (error) {
        if (error.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: `A tag with slug "${payload.slug}" already exists` }, 409);
        }
        return jsonResponse({ ok: false, error: error.message }, 500);
      }
      return jsonResponse({ ok: true, data });
    }

    if (req.method === "DELETE") {
      if (!id) return jsonResponse({ ok: false, error: "Tag ID is required" }, 400);

      const { error } = await supabase.from("tool_tags").delete().eq("id", id);

      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
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
