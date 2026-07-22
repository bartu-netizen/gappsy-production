import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

// Moderation queue for tool_user_reviews (real, publicly-submitted tool
// reviews — see migration 20260715040000). The base table has no anon/
// authenticated SELECT policy at all, so listing pending/rejected reviews
// and changing status can only happen here, via the service-role key,
// behind requireAdminSession — same pattern as admin-enrichment-review and
// agency-reviews-admin.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
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
      const url = new URL(req.url);
      const status = url.searchParams.get("status");
      let query = supabase
        .from("tool_user_reviews")
        .select("id, tool_id, reviewer_name, reviewer_email, rating, title, body, status, reviewed_by, reviewed_at, created_at, tools(name, slug)")
        .order("created_at", { ascending: false })
        .limit(200);
      if (status && ["pending", "approved", "rejected"].includes(status)) {
        query = query.eq("status", status);
      }
      const { data, error } = await query;
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, data });
    }

    if (req.method === "POST") {
      const payload = await req.json();
      const id = typeof payload.review_id === "string" ? payload.review_id : null;
      if (!id) return jsonResponse({ ok: false, error: "review_id is required" }, 400);

      if (payload.action === "approve" || payload.action === "reject") {
        const { data: updated, error } = await supabase
          .from("tool_user_reviews")
          .update({
            status: payload.action === "approve" ? "approved" : "rejected",
            reviewed_by: session.email,
            reviewed_at: new Date().toISOString(),
          })
          .eq("id", id)
          .select()
          .single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token",
          actor_email: session.email || undefined,
          action: `tool_review_${payload.action}`,
          target_table: "tool_user_reviews",
          target_id: id,
          status: "success",
        });

        return jsonResponse({ ok: true, data: updated });
      }

      if (payload.action === "delete") {
        const { error } = await supabase.from("tool_user_reviews").delete().eq("id", id);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token",
          actor_email: session.email || undefined,
          action: "tool_review_delete",
          target_table: "tool_user_reviews",
          target_id: id,
          status: "success",
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
