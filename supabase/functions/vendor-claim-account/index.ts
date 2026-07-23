import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { CORS_HEADERS } from "../_shared/adminSession.ts";
import { createServiceClient } from "../_shared/vendorAuth.ts";

// Links a real Supabase Auth account to the tool the caller paid to feature,
// gated strictly behind an already-verified vendor_ownership_tokens row —
// the same token/flow used by /list-your-product/verify. This is the ONLY
// place tools.owner_user_id is ever set: no open self-signup, no way to
// claim a listing without having already paid (vendor_feature_subscriptions)
// and proved domain ownership (verified=true).
//
// Flow: client does supabase.auth.signUp() itself (real Supabase Auth,
// handles password/email confirmation), then calls this function with the
// resulting access_token + the ownership token from the verify-link URL.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };
function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const supabase = createServiceClient();
    const payload = await req.json();
    const action = payload.action;

    if (action === "lookup_token") {
      const ownershipToken = typeof payload.token === "string" ? payload.token : null;
      if (!ownershipToken) return jsonResponse({ ok: false, error: "token is required" }, 400);

      const { data: tokenRow, error: tokenError } = await supabase
        .from("vendor_ownership_tokens")
        .select("id, contact_email, verified, expires_at, tool_id, tools(name, slug, owner_user_id)")
        .eq("token", ownershipToken)
        .maybeSingle();
      if (tokenError) return jsonResponse({ ok: false, error: "Failed to look up token" }, 500);
      if (!tokenRow) return jsonResponse({ ok: false, error_code: "not_found" }, 404);
      if (new Date(tokenRow.expires_at).getTime() < Date.now()) {
        return jsonResponse({ ok: false, error_code: "expired" }, 410);
      }
      if (!tokenRow.verified) return jsonResponse({ ok: false, error_code: "not_verified" }, 403);
      // deno-lint-ignore no-explicit-any
      const tool = tokenRow.tools as any;
      if (!tool) return jsonResponse({ ok: false, error_code: "no_tool" }, 404);
      if (tool.owner_user_id) return jsonResponse({ ok: false, error_code: "already_claimed" }, 409);

      return jsonResponse({
        ok: true,
        contact_email: tokenRow.contact_email,
        tool_name: tool.name,
        tool_slug: tool.slug,
      });
    }

    if (action === "claim") {
      const ownershipToken = typeof payload.token === "string" ? payload.token : null;
      const accessToken = typeof payload.access_token === "string" ? payload.access_token : null;
      if (!ownershipToken || !accessToken) {
        return jsonResponse({ ok: false, error: "token and access_token are required" }, 400);
      }

      const { data: userData, error: userError } = await supabase.auth.getUser(accessToken);
      if (userError || !userData?.user) return jsonResponse({ ok: false, error: "Invalid session" }, 401);

      const { data: tokenRow, error: tokenError } = await supabase
        .from("vendor_ownership_tokens")
        .select("id, contact_email, verified, expires_at, tool_id")
        .eq("token", ownershipToken)
        .maybeSingle();
      if (tokenError) return jsonResponse({ ok: false, error: "Failed to look up token" }, 500);
      if (!tokenRow) return jsonResponse({ ok: false, error_code: "not_found" }, 404);
      if (new Date(tokenRow.expires_at).getTime() < Date.now()) {
        return jsonResponse({ ok: false, error_code: "expired" }, 410);
      }
      if (!tokenRow.verified || !tokenRow.tool_id) return jsonResponse({ ok: false, error_code: "not_verified" }, 403);

      // Extra safety: the account being used to claim must be the same
      // email the ownership verification was performed for.
      const authEmail = (userData.user.email || "").toLowerCase().trim();
      const tokenEmail = (tokenRow.contact_email || "").toLowerCase().trim();
      if (authEmail !== tokenEmail) {
        return jsonResponse({ ok: false, error_code: "email_mismatch" }, 403);
      }

      const { data: tool, error: toolFetchError } = await supabase
        .from("tools")
        .select("id, slug, owner_user_id")
        .eq("id", tokenRow.tool_id)
        .maybeSingle();
      if (toolFetchError || !tool) return jsonResponse({ ok: false, error_code: "no_tool" }, 404);
      if (tool.owner_user_id) {
        return jsonResponse({
          ok: tool.owner_user_id === userData.user.id,
          error_code: tool.owner_user_id === userData.user.id ? undefined : "already_claimed",
          tool_slug: tool.slug,
        }, tool.owner_user_id === userData.user.id ? 200 : 409);
      }

      const { error: updateError } = await supabase
        .from("tools")
        .update({ owner_user_id: userData.user.id })
        .eq("id", tool.id)
        .is("owner_user_id", null);
      if (updateError) return jsonResponse({ ok: false, error: "Failed to link account" }, 500);

      return jsonResponse({ ok: true, tool_slug: tool.slug });
    }

    return jsonResponse({ ok: false, error: "Unknown action" }, 400);
  } catch (error) {
    console.error("[vendor-claim-account] error:", error);
    return jsonResponse({ ok: false, error: "An unexpected error occurred." }, 500);
  }
});
