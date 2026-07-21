import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

const UNIQUE_VIOLATION = "23505";
const MIN_MEMBERS = 3;

class ValidationError extends Error {}

interface MemberInput {
  tool_id: string;
  sort_order?: number;
  best_for?: string | null;
}

// Resolves and de-dupes the submitted member tool ids against the `tools`
// table, then derives the canonical slug the same way the pairwise
// comparisons function does (alphabetical by slug), generalized to N tools
// instead of 2 — one indexable URL per unique tool set regardless of the
// order the admin picked them in.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function resolveCanonicalMembers(supabase: any, members: MemberInput[]) {
  const ids = [...new Set(members.map((m) => m.tool_id))];
  if (ids.length < MIN_MEMBERS) {
    throw new ValidationError(`A group comparison needs at least ${MIN_MEMBERS} distinct tools`);
  }
  const { data, error } = await supabase.from("tools").select("id, slug, name, is_open_source").in("id", ids);
  if (error) throw new Error(`Failed to load tools: ${error.message}`);
  const toolsById = new Map((data || []).map((t: { id: string }) => [t.id, t]));
  if (toolsById.size !== ids.length) {
    throw new ValidationError("One or more selected tools could not be found");
  }
  // Paid tools drive more real business value than open-source ones — a
  // group made up entirely of open-source tools is blocked rather than
  // just deprioritized in listings, mirroring the pairwise comparisons rule.
  if (ids.every((id) => (toolsById.get(id) as { is_open_source?: boolean }).is_open_source)) {
    throw new ValidationError("Cannot create a group comparison made up entirely of open-source tools — include at least one non-open-source tool");
  }
  const sorted = ids
    .map((id) => toolsById.get(id) as { id: string; slug: string; name: string })
    .sort((a, b) => a.slug.localeCompare(b.slug));
  const slug = sorted.map((t) => t.slug).join("-vs-");
  return { sorted, slug };
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function attachMembers(supabase: any, groupComparisonIds: string[]) {
  if (groupComparisonIds.length === 0) return new Map();
  const { data, error } = await fetchInChunks(groupComparisonIds, (chunk) =>
    supabase
      .from("tool_group_comparison_members")
      .select("group_comparison_id, sort_order, best_for, tools(id, slug, name, logo, status)")
      .in("group_comparison_id", chunk)
      .order("sort_order", { ascending: true })
  );
  if (error) throw new Error(`Failed to load group comparison members: ${error.message}`);
  const map = new Map<string, unknown[]>();
  for (const row of data || []) {
    const list = map.get(row.group_comparison_id) || [];
    list.push({ sort_order: row.sort_order, best_for: row.best_for, tool: row.tools });
    map.set(row.group_comparison_id, list);
  }
  return map;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function replaceMembers(supabase: any, groupComparisonId: string, members: MemberInput[]) {
  const { sorted } = await resolveCanonicalMembers(supabase, members);
  const bestForByToolId = new Map(members.map((m) => [m.tool_id, m.best_for ?? null]));

  const { error: deleteError } = await supabase.from("tool_group_comparison_members").delete().eq("group_comparison_id", groupComparisonId);
  if (deleteError) throw new Error(`Failed to clear existing members: ${deleteError.message}`);

  const rows = sorted.map((t, i) => ({
    group_comparison_id: groupComparisonId,
    tool_id: t.id,
    sort_order: i,
    best_for: bestForByToolId.get(t.id) || null,
  }));
  const { error: insertError } = await supabase.from("tool_group_comparison_members").insert(rows);
  if (insertError) throw new Error(`Failed to insert members: ${insertError.message}`);
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
        const { data: groupComparison, error } = await supabase.from("tool_group_comparisons").select("*").eq("id", id).maybeSingle();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);
        if (!groupComparison) return jsonResponse({ ok: false, error: "Group comparison not found" }, 404);

        const membersMap = await attachMembers(supabase, [id]);
        return jsonResponse({ ok: true, data: { ...groupComparison, members: membersMap.get(id) || [] } });
      }

      const { data: groupComparisons, error } = await supabase.from("tool_group_comparisons").select("*").order("created_at", { ascending: false });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);

      const membersMap = await attachMembers(supabase, (groupComparisons || []).map((r: { id: string }) => r.id));
      const data = (groupComparisons || []).map((r: { id: string }) => ({ ...r, members: membersMap.get(r.id) || [] }));

      return jsonResponse({ ok: true, data });
    }

    if (req.method === "POST") {
      const payload = await req.json();

      if (!payload.title || typeof payload.title !== "string" || !payload.title.trim()) {
        return jsonResponse({ ok: false, error: "Missing required field: title" }, 400);
      }
      if (!Array.isArray(payload.members) || payload.members.length < MIN_MEMBERS) {
        return jsonResponse({ ok: false, error: `At least ${MIN_MEMBERS} member tools are required` }, 400);
      }

      let slug: string;
      try {
        ({ slug } = await resolveCanonicalMembers(supabase, payload.members));
      } catch (validationError) {
        if (validationError instanceof ValidationError) {
          return jsonResponse({ ok: false, error: validationError.message }, 400);
        }
        throw validationError;
      }

      const status = payload.status === "published" ? "published" : "draft";

      const { data: existing } = await supabase.from("tool_group_comparisons").select("id").eq("slug", slug).maybeSingle();
      if (existing) {
        return jsonResponse({ ok: false, error: `A group comparison for this tool set already exists ("${slug}")` }, 409);
      }

      const { data: newGroupComparison, error: insertError } = await supabase
        .from("tool_group_comparisons")
        .insert({
          slug,
          title: payload.title.trim(),
          verdict: payload.verdict || null,
          video_url: payload.video_url || null,
          status,
        })
        .select()
        .single();

      if (insertError) {
        if (insertError.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: `A group comparison for this tool set already exists ("${slug}")` }, 409);
        }
        return jsonResponse({ ok: false, error: insertError.message }, 500);
      }

      try {
        await replaceMembers(supabase, newGroupComparison.id, payload.members);
      } catch (memberError) {
        // Roll back the orphaned parent row so a failed member write never
        // leaves a slug-only group comparison with no tools behind.
        await supabase.from("tool_group_comparisons").delete().eq("id", newGroupComparison.id);
        const msg = memberError instanceof Error ? memberError.message : "Failed to save group comparison members";
        return jsonResponse({ ok: false, error: msg }, 500);
      }

      return jsonResponse({ ok: true, data: newGroupComparison });
    }

    if (req.method === "PUT") {
      if (!id) return jsonResponse({ ok: false, error: "Group comparison ID is required" }, 400);

      const { data: existing } = await supabase.from("tool_group_comparisons").select("*").eq("id", id).maybeSingle();
      if (!existing) return jsonResponse({ ok: false, error: "Group comparison not found" }, 404);

      const payload = await req.json();
      const updates: Record<string, unknown> = { updated_at: new Date().toISOString() };

      if (payload.title && typeof payload.title === "string" && payload.title.trim()) {
        updates.title = payload.title.trim();
      }
      if ("verdict" in payload) updates.verdict = payload.verdict || null;
      if ("video_url" in payload) updates.video_url = payload.video_url || null;
      if (payload.status === "published" || payload.status === "draft") {
        updates.status = payload.status;
      }

      if (Array.isArray(payload.members) && payload.members.length > 0) {
        if (payload.members.length < MIN_MEMBERS) {
          return jsonResponse({ ok: false, error: `At least ${MIN_MEMBERS} member tools are required` }, 400);
        }
        let slug: string;
        try {
          ({ slug } = await resolveCanonicalMembers(supabase, payload.members));
        } catch (validationError) {
          if (validationError instanceof ValidationError) {
            return jsonResponse({ ok: false, error: validationError.message }, 400);
          }
          throw validationError;
        }
        const { data: slugExists } = await supabase.from("tool_group_comparisons").select("id").eq("slug", slug).neq("id", id).maybeSingle();
        if (slugExists) {
          return jsonResponse({ ok: false, error: `A group comparison for this tool set already exists ("${slug}")` }, 409);
        }
        updates.slug = slug;
      }

      const { data: updated, error: updateError } = await supabase
        .from("tool_group_comparisons")
        .update(updates)
        .eq("id", id)
        .select()
        .single();

      if (updateError) {
        if (updateError.code === UNIQUE_VIOLATION) {
          return jsonResponse({ ok: false, error: "A group comparison for this tool set already exists" }, 409);
        }
        return jsonResponse({ ok: false, error: updateError.message }, 500);
      }

      if (Array.isArray(payload.members) && payload.members.length > 0) {
        try {
          await replaceMembers(supabase, id, payload.members);
        } catch (memberError) {
          const msg = memberError instanceof Error ? memberError.message : "Failed to save group comparison members";
          return jsonResponse({ ok: false, error: msg }, 500);
        }
      }

      return jsonResponse({ ok: true, data: updated });
    }

    if (req.method === "DELETE") {
      if (!id) return jsonResponse({ ok: false, error: "Group comparison ID is required" }, 400);

      const { error } = await supabase.from("tool_group_comparisons").delete().eq("id", id);
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
