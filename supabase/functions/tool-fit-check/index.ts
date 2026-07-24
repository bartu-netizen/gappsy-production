import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { findFeaturedAlternatives } from "../_shared/toolFitCheck.ts";

// Deterministic sibling of ask-gappsy's tool_fit_check chat mode — the
// widget's "similar tools" rail (name, logo, rating, "Featured" badge) is
// rendered from THIS structured response, never parsed out of the AI's
// prose reply. Keeps the actual "which alternatives, if any" decision fully
// deterministic and testable, independent of anything the model says.

const MAX_ALTERNATIVES = 4;

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, apikey",
};

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const payload = await req.json();
    const toolSlug = typeof payload.tool_slug === "string" ? payload.tool_slug : null;
    if (!toolSlug) return jsonResponse({ ok: false, error: "tool_slug is required" }, 400);

    const { data: tool } = await supabase
      .from("tools")
      .select("id, slug, is_open_source, claim_paid_at, featured, status")
      .eq("slug", toolSlug)
      .eq("status", "published")
      .maybeSingle();
    if (!tool) return jsonResponse({ ok: false, error: "Tool not found" }, 404);

    // Only unclaimed, non-Featured listings ever get an alternative
    // suggested — a claimed or Featured tool's own visitors are never
    // diverted elsewhere. Mirrors ToolCard.tsx's showClaimCta convention
    // (!tool.featured && !tool.claim_paid_at) — Featured listings are
    // treated as effectively claimed even before claim_paid_at is actually
    // set (e.g. the site's own flagship showcase listings).
    if (tool.claim_paid_at || tool.featured) return jsonResponse({ ok: true, alternatives: [] });

    const alternatives = await findFeaturedAlternatives(supabase, tool, MAX_ALTERNATIVES);
    return jsonResponse({ ok: true, alternatives });
  } catch (error) {
    console.error("[tool-fit-check] error:", error);
    return jsonResponse({ ok: false, error: "Something went wrong." }, 500);
  }
});
