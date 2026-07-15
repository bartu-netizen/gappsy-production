import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { writeAuditLog } from "../_shared/adminAuth.ts";

// Admin visibility + manual test tooling for the vendor account system
// (tools.owner_user_id, see 20260716010000_20260716_vendor_dashboard.sql).
// In production, accounts are only ever created via vendor-claim-account,
// gated behind a paid + ownership-verified vendor_ownership_tokens row. This
// function exists purely so an admin can (a) see which tools already have a
// linked account, and (b) manually create/unlink/delete one for testing the
// /login -> /vendor/dashboard flow without running a real Stripe checkout.

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
      const { data: owned, error: ownedError } = await supabase
        .from("tools")
        .select("id, slug, name, logo, owner_user_id")
        .not("owner_user_id", "is", null)
        .order("name");
      if (ownedError) return jsonResponse({ ok: false, error: ownedError.message }, 500);

      const accounts = await Promise.all(
        (owned || []).map(async (tool) => {
          const { data: userData } = await supabase.auth.admin.getUserById(tool.owner_user_id as string);
          return {
            tool_id: tool.id,
            tool_slug: tool.slug,
            tool_name: tool.name,
            tool_logo: tool.logo,
            user_id: tool.owner_user_id,
            email: userData?.user?.email || null,
            created_at: userData?.user?.created_at || null,
            last_sign_in_at: userData?.user?.last_sign_in_at || null,
          };
        })
      );

      return jsonResponse({ ok: true, accounts });
    }

    if (req.method === "POST") {
      const payload = await req.json();
      const action = payload.action;

      if (action === "create") {
        const toolSlug = typeof payload.tool_slug === "string" ? payload.tool_slug : null;
        const email = typeof payload.email === "string" ? payload.email.trim().toLowerCase() : "";
        const password = typeof payload.password === "string" ? payload.password : "";
        if (!toolSlug || !email || password.length < 8) {
          return jsonResponse({ ok: false, error: "tool_slug, email, and a password of at least 8 characters are required" }, 400);
        }

        const { data: tool, error: toolError } = await supabase.from("tools").select("id, slug, name, owner_user_id").eq("slug", toolSlug).maybeSingle();
        if (toolError || !tool) return jsonResponse({ ok: false, error: "Tool not found" }, 404);
        if (tool.owner_user_id) return jsonResponse({ ok: false, error: "This tool already has a linked account — unlink it first." }, 409);
        const toolId = tool.id;

        const { data: created, error: createError } = await supabase.auth.admin.createUser({
          email,
          password,
          email_confirm: true,
        });
        if (createError || !created?.user) {
          return jsonResponse({ ok: false, error: createError?.message || "Failed to create account" }, 500);
        }

        const { error: linkError } = await supabase.from("tools").update({ owner_user_id: created.user.id }).eq("id", toolId).is("owner_user_id", null);
        if (linkError) {
          await supabase.auth.admin.deleteUser(created.user.id);
          return jsonResponse({ ok: false, error: "Account created but failed to link — rolled back." }, 500);
        }

        await writeAuditLog({
          actor_session_type: "session_token",
          actor_email: session.email || undefined,
          action: "vendor_account_manual_create",
          target_table: "tools",
          target_id: toolId,
          status: "success",
        });

        return jsonResponse({ ok: true, tool_slug: tool.slug, email, user_id: created.user.id });
      }

      if (action === "unlink") {
        const toolId = typeof payload.tool_id === "string" ? payload.tool_id : null;
        if (!toolId) return jsonResponse({ ok: false, error: "tool_id is required" }, 400);
        const { error } = await supabase.from("tools").update({ owner_user_id: null }).eq("id", toolId);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token",
          actor_email: session.email || undefined,
          action: "vendor_account_unlink",
          target_table: "tools",
          target_id: toolId,
          status: "success",
        });

        return jsonResponse({ ok: true });
      }

      if (action === "delete_account") {
        const userId = typeof payload.user_id === "string" ? payload.user_id : null;
        if (!userId) return jsonResponse({ ok: false, error: "user_id is required" }, 400);
        const { error } = await supabase.auth.admin.deleteUser(userId);
        if (error) return jsonResponse({ ok: false, error: error.message }, 500);

        await writeAuditLog({
          actor_session_type: "session_token",
          actor_email: session.email || undefined,
          action: "vendor_account_delete",
          target_table: "auth.users",
          target_id: userId,
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
    console.error("[admin-vendor-accounts] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
