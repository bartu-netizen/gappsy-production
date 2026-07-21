import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { fetchInChunks } from "../_shared/dbChunking.ts";

// Fleet-wide SEO rollup across every PUBLISHED tool — the fields that
// actually reach a search engine or an LLM crawler. Every count here is a
// live query at request time, nothing cached or estimated.
//
// Important caveat surfaced to the UI: these checks look at DB rows only.
// Canva/Figma (and any tool published before this CMS existed) render FAQ/
// alternatives/long-form content from hand-authored files, not the
// tool_faqs/tool_alternatives tables — so they can show here as "missing
// FAQ" in DB terms while their live public page actually has one. This is
// the same underlying signal the per-tool Validation tab already shows;
// this page just rolls it up across the whole fleet. It is not a claim
// that the public page is broken.

const JSON_HEADERS = { ...CORS_HEADERS, "Content-Type": "application/json" };

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

function hasText(value: string | null | undefined): boolean {
  return Boolean(value && value.trim().length > 0);
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

    const { data: tools, error: toolsError } = await supabase
      .from("tools")
      .select("id, slug, name, seo_title, seo_meta_description, short_description, long_description, canonical_url, sitemap_eligible, updated_at")
      .eq("status", "published");
    if (toolsError) return jsonResponse({ ok: false, error: toolsError.message }, 500);

    const toolIds = (tools || []).map((t: { id: string }) => t.id);
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const countBy = (rows: any[]) => {
      const map = new Map<string, number>();
      for (const row of rows || []) map.set(row.tool_id, (map.get(row.tool_id) || 0) + 1);
      return map;
    };

    const [screenshots, faqs, alternatives] = toolIds.length === 0
      ? [{ data: [] }, { data: [] }, { data: [] }]
      : await Promise.all([
          fetchInChunks(toolIds, (chunk) => supabase.from("tool_screenshots").select("tool_id").in("tool_id", chunk)),
          fetchInChunks(toolIds, (chunk) => supabase.from("tool_faqs").select("tool_id").in("tool_id", chunk)),
          fetchInChunks(toolIds, (chunk) => supabase.from("tool_alternatives").select("tool_id").in("tool_id", chunk)),
        ]);

    const screenshotCounts = countBy(screenshots.data || []);
    const faqCounts = countBy(faqs.data || []);
    const alternativeCounts = countBy(alternatives.data || []);

    const totals = {
      missing_meta_title: 0,
      missing_meta_description: 0,
      missing_canonical: 0,
      missing_schema: 0,
      missing_screenshots: 0,
      missing_faqs: 0,
      missing_alternatives: 0,
      not_sitemap_eligible: 0,
    };

    interface ToolIssue { id: string; slug: string; name: string; missing: string[]; updated_at: string }
    const toolIssues: ToolIssue[] = [];

    for (const tool of tools || []) {
      const missing: string[] = [];
      const hasDescription = hasText(tool.short_description) || hasText(tool.long_description);

      if (!hasText(tool.seo_title)) { totals.missing_meta_title++; missing.push("meta title"); }
      if (!hasText(tool.seo_meta_description) && !hasDescription) { totals.missing_meta_description++; missing.push("meta description"); }
      // Canonical always derives from slug when no override is set — every
      // published tool has a slug, so this can only fire if that invariant
      // is ever violated. Included for an honest, complete checklist.
      if (!hasText(tool.slug)) { totals.missing_canonical++; missing.push("canonical URL"); }
      // "Schema" = the SoftwareApplication JSON-LD, which needs name +
      // description + url — name/website are required-for-publish already,
      // so this mirrors the description check.
      if (!hasDescription) { totals.missing_schema++; missing.push("schema (JSON-LD)"); }
      if ((screenshotCounts.get(tool.id) || 0) === 0) { totals.missing_screenshots++; missing.push("screenshots"); }
      if ((faqCounts.get(tool.id) || 0) === 0) { totals.missing_faqs++; missing.push("FAQ (DB)"); }
      if ((alternativeCounts.get(tool.id) || 0) === 0) { totals.missing_alternatives++; missing.push("alternatives (DB)"); }
      if (tool.sitemap_eligible === false) { totals.not_sitemap_eligible++; missing.push("sitemap eligibility"); }

      if (missing.length > 0) {
        toolIssues.push({ id: tool.id, slug: tool.slug, name: tool.name, missing, updated_at: tool.updated_at });
      }
    }

    toolIssues.sort((a, b) => b.missing.length - a.missing.length);

    return jsonResponse({
      ok: true,
      data: {
        published_count: (tools || []).length,
        totals,
        worst_offenders: toolIssues.slice(0, 20),
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
