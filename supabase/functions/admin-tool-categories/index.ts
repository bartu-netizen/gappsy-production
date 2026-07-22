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
          .from("tool_categories")
          .select("*")
          .eq("id", id)
          .maybeSingle();

        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!data) return jsonResponse({ ok: false, error: "Category not found" }, 404);
        return jsonResponse({ ok: true, data });
      }

      const q = (url.searchParams.get("q") || "").trim();
      let listQuery = supabase.from("tool_categories").select("*").order("name", { ascending: true });
      if (q) listQuery = listQuery.ilike("name", `%${q}%`);

      const { data, error } = await listQuery;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const categoryIds = (data || []).map((c: { id: string }) => c.id);
      let toolCounts = new Map<string, number>();
      if (categoryIds.length > 0) {
        const { data: links, error: linksError } = await supabase
          .from("tool_category_links")
          .select("category_id")
          .in("category_id", categoryIds);
        if (linksError) return jsonResponse({ ok: false, error: linksError.message }, 500);
        toolCounts = (links || []).reduce((map: Map<string, number>, l: { category_id: string }) => {
          map.set(l.category_id, (map.get(l.category_id) || 0) + 1);
          return map;
        }, new Map<string, number>());
      }

      const withCounts = (data || []).map((c: { id: string }) => ({ ...c, tool_count: toolCounts.get(c.id) || 0 }));
      return jsonResponse({ ok: true, data: withCounts });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      if (!payload.slug || !payload.name) {
        return jsonResponse({ ok: false, error: "Missing required fields: slug, name" }, 400);
      }

      const { data: existing } = await supabase
        .from("tool_categories")
        .select("id")
        .eq("slug", payload.slug)
        .maybeSingle();

      if (existing) {
        return jsonResponse({ ok: false, error: `A category with slug "${payload.slug}" already exists` }, 409);
      }

      const row = {
        slug: payload.slug,
        name: payload.name,
        description: payload.description || null,
        seo_title: payload.seo_title || null,
        seo_description: payload.seo_description || null,
        icon: payload.icon || null,
        status: payload.status || "published",
        is_featured: payload.is_featured === true,
      };

      const { data, error } = await supabase.from("tool_categories").insert(row).select().single();

      if (error) {
        if (error.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: `A category with slug "${payload.slug}" already exists` }, 409);
        }
        return jsonResponse({ ok: false, error: error.message }, 500);
      }
      return jsonResponse({ ok: true, data });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Category ID is required" }, 400);

      const { data: existing } = await supabase
        .from("tool_categories")
        .select("id, slug")
        .eq("id", id)
        .maybeSingle();

      if (!existing) return jsonResponse({ ok: false, error: "Category not found" }, 404);

      const payload = await req.json();

      if (payload.slug && payload.slug !== existing.slug) {
        const { data: slugExists } = await supabase
          .from("tool_categories")
          .select("id")
          .eq("slug", payload.slug)
          .neq("id", id)
          .maybeSingle();

        if (slugExists) {
          return jsonResponse({ ok: false, error: `A category with slug "${payload.slug}" already exists` }, 409);
        }
      }

      const fields = ["slug", "name", "description", "seo_title", "seo_description", "icon", "status", "is_featured"];
      const updates: Record<string, unknown> = { updated_at: new Date().toISOString() };
      for (const field of fields) {
        if (Object.prototype.hasOwnProperty.call(payload, field)) {
          updates[field] = payload[field];
        }
      }

      const { data, error } = await supabase
        .from("tool_categories")
        .update(updates)
        .eq("id", id)
        .select()
        .single();

      if (error) {
        if (error.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: `A category with slug "${payload.slug}" already exists` }, 409);
        }
        return jsonResponse({ ok: false, error: error.message }, 500);
      }
      return jsonResponse({ ok: true, data });
    }

    if (req.method === "DELETE") {
      if (!id) return jsonResponse({ ok: false, error: "Category ID is required" }, 400);

      const { error } = await supabase.from("tool_categories").delete().eq("id", id);

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
