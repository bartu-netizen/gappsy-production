import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

// Admin queue for vendor_comparison_requests (a Featured-exclusive perk — see
// vendor-dashboard/index.ts's request_comparison action). Approving/rejecting
// here only updates the request's own status; it never creates the actual
// tool_comparisons row — that stays a deliberate manual step via the
// existing admin-tool-comparisons editor (including its open-source-pair
// guard), so this queue is a to-do list, not a second comparison-creation path.

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
      const { data, error } = await supabase
        .from("vendor_comparison_requests")
        .select(
          `id, status, admin_notes, created_at,
           tool:tools!vendor_comparison_requests_tool_id_fkey(slug, name, logo),
           requested_tool:tools!vendor_comparison_requests_requested_tool_id_fkey(slug, name, logo)`
        )
        .order("created_at", { ascending: false });
      if (error) return jsonResponse({ ok: false, error: error.message }, 500);
      return jsonResponse({ ok: true, requests: data || [] });
    }

    if (req.method === "POST") {
      const payload = await req.json();
      const action = payload.action;
      const requestId = typeof payload.id === "string" ? payload.id : null;
      if (!requestId) return jsonResponse({ ok: false, error: "id is required" }, 400);

      if (action === "approve" || action === "reject") {
        const { data, error } = await supabase
          .from("vendor_comparison_requests")
          .update({
            status: action === "approve" ? "approved" : "rejected",
            admin_notes: typeof payload.admin_notes === "string" ? payload.admin_notes : null,
            updated_at: new Date().toISOString(),
          })
          .eq("id", requestId)
          .select()
          .single();
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token",
          actor_email: session.email || undefined,
          action: `vendor_comparison_request_${action}`,
          target_table: "vendor_comparison_requests",
          target_id: requestId,
          status: "success",
        });

        return jsonResponse({ ok: true, request: data });
      }

      return jsonResponse({ ok: false, error: "Unknown action" }, 400);
    }

    return jsonResponse({ ok: false, error: "Method not allowed" }, 405);
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return jsonResponse({ ok: false, error: "Invalid or expired admin session" }, 401);
    }
    console.error("[admin-vendor-comparison-requests] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
