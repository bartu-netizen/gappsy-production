import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

// Single-purpose read model for the wp-admin Dashboard's publishing stats
// cards. Every number here is a real count from `tools` / `tool_import_history`
// at request time — nothing is cached, estimated, or fabricated.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);
    if (req.method !== "GET") {
      return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const statusCount = async (status: string) => {
      const { count, error } = await supabase.from("tools").select("id", { count: "exact", head: true }).eq("status", status);
      if (error) throw new Error(`Failed to count ${status}: ${error.message}`);
      return count || 0;
    };

    const [draft, needsReview, readyToPublish, published, archived, lastImports, lastPublished, failedImports] = await Promise.all([
      statusCount("draft"),
      statusCount("needs_review"),
      statusCount("ready_to_publish"),
      statusCount("published"),
      statusCount("archived"),
      supabase
        .from("tool_import_history")
        .select("id, source, source_url, status, created_at, tools(id, slug, name, logo)")
        .order("created_at", { ascending: false })
        .limit(5),
      supabase
        .from("tools")
        .select("id, slug, name, logo, updated_at")
        .eq("status", "published")
        .order("updated_at", { ascending: false })
        .limit(5),
      supabase.from("tool_import_history").select("id", { count: "exact", head: true }).eq("status", "failed"),
    ]);

    if (lastImports.error) return jsonResponse({ ok: false, error: lastImports.error.message }, 500);
    if (lastPublished.error) return jsonResponse({ ok: false, error: lastPublished.error.message }, 500);
    if (failedImports.error) return jsonResponse({ ok: false, error: failedImports.error.message }, 500);

    return jsonResponse({
      ok: true,
      data: {
        counts: { draft, needs_review: needsReview, ready_to_publish: readyToPublish, published, archived },
        last_imports: lastImports.data || [],
        last_published: lastPublished.data || [],
        failed_imports_count: failedImports.count || 0,
      },
    });
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    return jsonResponse({ ok: false, error: errorMessage }, 500);
  }
});
