import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";
import { resolveCanonicalPair, createToolComparison, ComparisonValidationError as ValidationError } from "../_shared/toolComparisonCreation.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const UNIQUE_VIOLATION = "23505";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function attachTools(supabase: any, comparisons: { tool_a_id: string; tool_b_id: string }[]) {
  const toolIds = [...new Set(comparisons.flatMap((c) => [c.tool_a_id, c.tool_b_id]))];
  if (toolIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(toolIds, (chunk) =>
    supabase.from("tools").select("id, slug, name, logo, status").in("id", chunk)
  );
  if (error) throw new Error(`Failed to load tools: ${error.message}`);
  const map = new Map<string, unknown>();
  for (const t of data || []) map.set(t.id, t);
  return map;
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
        const { data: comparison, error } = await supabase.from("tool_comparisons").select("*").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!comparison) return jsonResponse({ ok: false, error: "Comparison not found" }, 404);

        const toolsMap = await attachTools(supabase, [comparison]);
        return jsonResponse({
          ok: true,
          data: { ...comparison, tool_a: toolsMap.get(comparison.tool_a_id) || null, tool_b: toolsMap.get(comparison.tool_b_id) || null },
        });
      }

      const { data: comparisons, error } = await supabase.from("tool_comparisons").select("*").order("created_at", { ascending: false });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const toolsMap = await attachTools(supabase, comparisons || []);
      const data = (comparisons || []).map((c: { tool_a_id: string; tool_b_id: string }) => ({
        ...c,
        tool_a: toolsMap.get(c.tool_a_id) || null,
        tool_b: toolsMap.get(c.tool_b_id) || null,
      }));

      return jsonResponse({ ok: true, data });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      if (!payload.tool_a_id || !payload.tool_b_id) {
        return jsonResponse({ ok: false, error: "Missing required fields: tool_a_id, tool_b_id" }, 400);
      }
      if (payload.tool_a_id === payload.tool_b_id) {
        return jsonResponse({ ok: false, error: "tool_a_id and tool_b_id must be different tools" }, 400);
      }

      const status = payload.status === "published" ? "published" : "draft";
      const result = await createToolComparison(supabase, payload.tool_a_id, payload.tool_b_id, status);
      if (!result.ok) return jsonResponse({ ok: false, error: result.error }, result.status_code ?? 500);

      return jsonResponse({ ok: true, data: result.comparison });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Comparison ID is required" }, 400);

      const { data: existing } = await supabase.from("tool_comparisons").select("*").eq("id", id).maybeSingle();
      if (!existing) return jsonResponse({ ok: false, error: "Comparison not found" }, 404);

      const payload = await req.json();
      const updates: Record<string, unknown> = { updated_at: new Date().toISOString() };

      const nextToolAId = payload.tool_a_id || existing.tool_a_id;
      const nextToolBId = payload.tool_b_id || existing.tool_b_id;
      const toolsChanged = nextToolAId !== existing.tool_a_id || nextToolBId !== existing.tool_b_id;

      if (nextToolAId === nextToolBId) {
        return jsonResponse({ ok: false, error: "tool_a_id and tool_b_id must be different tools" }, 400);
      }

      if (toolsChanged) {
        let toolA: { id: string }, toolB: { id: string }, slug: string;
        try {
          ({ toolA, toolB, slug } = await resolveCanonicalPair(supabase, nextToolAId, nextToolBId));
        } catch (validationError) {
          if (validationError instanceof ValidationError) {
            return jsonResponse({ ok: false, error: validationError.message }, 400);
          }
          throw validationError;
        }
        const { data: slugExists } = await supabase.from("tool_comparisons").select("id").eq("slug", slug).neq("id", id).maybeSingle();
        if (slugExists) {
          return jsonResponse({ ok: false, error: `A comparison for this pair already exists ("${slug}")` }, 409);
        }
        updates.tool_a_id = toolA.id;
        updates.tool_b_id = toolB.id;
        updates.slug = slug;
      }

      if (payload.status === "published" || payload.status === "draft" || payload.status === "archived") {
        updates.status = payload.status;
      }

      const { data: updated, error: updateError } = await supabase
        .from("tool_comparisons")
        .update(updates)
        .eq("id", id)
        .select()
        .single();

      if (updateError) {
        if (updateError.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: "A comparison for this pair already exists" }, 409);
        }
        return jsonResponse({ ok: false, error: updateError.message }, 500);
      }

      return jsonResponse({ ok: true, data: updated });
    }

    if (req.method === "DELETE") {
      if (!id) return jsonResponse({ ok: false, error: "Comparison ID is required" }, 400);

      const { error } = await supabase.from("tool_comparisons").delete().eq("id", id);
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true });
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    if (error instanceof ValidationError) {
      return jsonResponse({ ok: false, error: error.message }, 400);
    }
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
