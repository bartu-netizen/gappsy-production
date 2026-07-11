import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { computeCompleteness, type ToolCompletenessInput } from "../_shared/toolCompleteness.ts";

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

    const tableCount = async (table: string) => {
      const { count, error } = await supabase.from(table).select("id", { count: "exact", head: true });
      if (error) throw new Error(`Failed to count ${table}: ${error.message}`);
      return count || 0;
    };

    const todayStartIso = new Date(new Date().setUTCHours(0, 0, 0, 0)).toISOString();

    const [
      draft, needsReview, readyToPublish, published, archived,
      lastImports, lastPublished, failedImports, totalImports, importsToday,
      totalSoftware, categoriesCount, tagsCount, comparisonsCount,
      recentlyEdited, incompleteCandidates,
    ] = await Promise.all([
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
      supabase.from("tool_import_history").select("id", { count: "exact", head: true }),
      supabase.from("tool_import_history").select("id", { count: "exact", head: true }).gte("created_at", todayStartIso),
      tableCount("tools"),
      tableCount("tool_categories"),
      tableCount("tool_tags"),
      tableCount("tool_comparisons"),
      supabase
        .from("tools")
        .select("id, slug, name, logo, status, updated_at")
        .order("updated_at", { ascending: false })
        .limit(8),
      // Only non-published tools are actionable "still needs work" candidates —
      // an already-published tool's completeness doesn't gate anything further.
      supabase
        .from("tools")
        .select("id, slug, name, logo, status, website, seo_title, seo_meta_description, pricing_model, short_description, long_description, sitemap_eligible, updated_at")
        .neq("status", "published")
        .order("updated_at", { ascending: false })
        .limit(30),
    ]);

    if (lastImports.error) return jsonResponse({ ok: false, error: lastImports.error.message }, 500);
    if (lastPublished.error) return jsonResponse({ ok: false, error: lastPublished.error.message }, 500);
    if (failedImports.error) return jsonResponse({ ok: false, error: failedImports.error.message }, 500);
    if (totalImports.error) return jsonResponse({ ok: false, error: totalImports.error.message }, 500);
    if (importsToday.error) return jsonResponse({ ok: false, error: importsToday.error.message }, 500);
    if (recentlyEdited.error) return jsonResponse({ ok: false, error: recentlyEdited.error.message }, 500);
    if (incompleteCandidates.error) return jsonResponse({ ok: false, error: incompleteCandidates.error.message }, 500);

    // Incomplete Tools widget: cheap category-count + relation-count pass
    // (mirrors admin-tools' own completeness computation) over the 30 most
    // recently touched non-published tools, surfacing the 8 least complete.
    const candidateIds = (incompleteCandidates.data || []).map((t: { id: string }) => t.id);
    let incompleteTools: Array<{ id: string; slug: string; name: string; logo: string | null; status: string; percent: number }> = [];
    if (candidateIds.length > 0) {
      const [catLinks, tagLinks, screenshots, faqs, features, pros, cons, useCases, pricingPlans, integrations] = await Promise.all([
        supabase.from("tool_category_links").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_tag_links").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_screenshots").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_faqs").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_features").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_pros").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_cons").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_use_cases").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_pricing_plans").select("tool_id").in("tool_id", candidateIds),
        supabase.from("tool_integrations").select("tool_id").in("tool_id", candidateIds),
      ]);
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const countBy = (rows: any[]) => {
        const map = new Map<string, number>();
        for (const row of rows || []) map.set(row.tool_id, (map.get(row.tool_id) || 0) + 1);
        return map;
      };
      const categoryCounts = countBy(catLinks.data || []);
      const tagCounts = countBy(tagLinks.data || []);
      const screenshotCounts = countBy(screenshots.data || []);
      const faqCounts = countBy(faqs.data || []);
      const featureCounts = countBy(features.data || []);
      const prosCounts = countBy(pros.data || []);
      const consCounts = countBy(cons.data || []);
      const useCaseCounts = countBy(useCases.data || []);
      const pricingPlanCounts = countBy(pricingPlans.data || []);
      const integrationCounts = countBy(integrations.data || []);

      incompleteTools = (incompleteCandidates.data || [])
        .map((t: Record<string, unknown> & { id: string; logo: string | null; status: string; slug: string; name: string }) => {
          const input: ToolCompletenessInput = {
            name: t.name as string, slug: t.slug, website: t.website as string | null,
            short_description: t.short_description as string | null, long_description: t.long_description as string | null,
            seo_meta_description: t.seo_meta_description as string | null, seo_title: t.seo_title as string | null,
            pricing_model: t.pricing_model as string | null, status: t.status,
            categoryCount: categoryCounts.get(t.id) || 0, tagCount: tagCounts.get(t.id) || 0,
            logoPresent: Boolean(t.logo), sitemapEligible: t.sitemap_eligible !== false,
            screenshotCount: screenshotCounts.get(t.id) || 0, faqCount: faqCounts.get(t.id) || 0,
            prosCount: prosCounts.get(t.id) || 0, consCount: consCounts.get(t.id) || 0,
            useCaseCount: useCaseCounts.get(t.id) || 0, pricingPlanCount: pricingPlanCounts.get(t.id) || 0,
            featureCount: featureCounts.get(t.id) || 0, integrationCount: integrationCounts.get(t.id) || 0,
          };
          return { id: t.id, slug: t.slug, name: t.name, logo: t.logo, status: t.status, percent: computeCompleteness(input).percent };
        })
        .sort((a, b) => a.percent - b.percent)
        .slice(0, 8);
    }

    return jsonResponse({
      ok: true,
      data: {
        counts: { draft, needs_review: needsReview, ready_to_publish: readyToPublish, published, archived },
        last_imports: lastImports.data || [],
        last_published: lastPublished.data || [],
        recently_edited: recentlyEdited.data || [],
        incomplete_tools: incompleteTools,
        failed_imports_count: failedImports.count || 0,
        total_imports_count: totalImports.count || 0,
        imports_today_count: importsToday.count || 0,
        total_software_count: totalSoftware,
        categories_count: categoriesCount,
        tags_count: tagsCount,
        comparisons_count: comparisonsCount,
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
