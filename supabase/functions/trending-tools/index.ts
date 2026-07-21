import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

// Public, read-only "what's trending" widget for /tool-categories. Real
// tool_page_views rows are service-role-only (same RLS convention as every
// other event table in this repo — see tool_chat_messages/smart_search_logs
// migrations), so this aggregates and re-exposes just tool_id + count,
// never raw IP/session-level rows.
//
// Tiered fallback because real traffic is currently thin (single digits in
// a 24h window on a fresh directory): try the last 24h first, fall back to
// 7 days, and fall back again to rating-sorted tools if even that's too
// thin. The response's `tier`/`label` always reflect which tier actually
// produced the result — never claim "today" when the data behind it is a
// week old or purely rating-based.

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, apikey",
};

const MIN_RESULTS = 6;
const LIMIT = 8;
// Wider than LIMIT so there's a real pool to prefer non-open-source tools
// from below — capping the candidate list at LIMIT before that reordering
// would lock in whichever tools happened to rank in the top 8 by views/
// rating alone, open-source or not.
const POOL_SIZE = LIMIT * 3;

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

const TOOL_COLUMNS = "slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, is_open_source";

// deno-lint-ignore no-explicit-any
async function topViewedSince(supabase: any, sinceIso: string, limit: number) {
  const { data } = await supabase.from("tool_page_views").select("tool_id").gte("created_at", sinceIso);
  const counts = new Map<string, number>();
  for (const row of data || []) {
    counts.set(row.tool_id, (counts.get(row.tool_id) || 0) + 1);
  }
  return [...counts.entries()].sort((a, b) => b[1] - a[1]).slice(0, limit);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "GET") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const dayAgo = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
    const weekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();

    let ranked = await topViewedSince(supabase, dayAgo, POOL_SIZE);
    let tier: "today" | "week" | "popular" = "today";

    if (ranked.length < MIN_RESULTS) {
      const weekRanked = await topViewedSince(supabase, weekAgo, POOL_SIZE);
      if (weekRanked.length > ranked.length) {
        ranked = weekRanked;
        tier = "week";
      }
    }

    let toolIds = ranked.map(([id]) => id);
    let viewCountById = new Map(ranked);

    if (toolIds.length < MIN_RESULTS) {
      // Real view data is too thin either way — fall back to genuinely
      // popular tools (rating + review volume) rather than showing an
      // almost-empty "trending" section.
      const { data: popular } = await supabase
        .from("tools")
        .select("id")
        .eq("status", "published")
        .gt("rating", 0)
        .order("rating", { ascending: false })
        .order("review_count", { ascending: false })
        .limit(POOL_SIZE);
      toolIds = (popular || []).map((t: { id: string }) => t.id);
      viewCountById = new Map();
      tier = "popular";
    }

    if (toolIds.length === 0) return jsonResponse({ ok: true, tier: "popular", label: "Popular tools", tools: [] });

    const { data: toolRows } = await supabase.from("tools").select(`id, ${TOOL_COLUMNS}`).in("id", toolIds).eq("status", "published");
    const bySlugOrder = new Map(toolIds.map((id, i) => [id, i]));
    // Paid/non-open-source tools first (open-source only fills remaining
    // slots when the pool doesn't have enough alternatives), preserving
    // each group's original trending/rating rank as the secondary key.
    const tools = (toolRows || [])
      .sort((a: { id: string; is_open_source: boolean }, b: { id: string; is_open_source: boolean }) => {
        if (a.is_open_source !== b.is_open_source) return a.is_open_source ? 1 : -1;
        return (bySlugOrder.get(a.id) ?? 0) - (bySlugOrder.get(b.id) ?? 0);
      })
      .slice(0, LIMIT)
      .map((t: { id: string; [key: string]: unknown }) => {
        const { id, is_open_source, ...rest } = t;
        return { ...rest, views: viewCountById.get(id) ?? null };
      });

    const label = tier === "today" ? "Trending today" : tier === "week" ? "Trending this week" : "Popular tools";

    return jsonResponse({ ok: true, tier, label, tools });
  } catch (error) {
    console.error("[trending-tools] error:", error);
    return jsonResponse({ ok: false, error: "Something went wrong." }, 500);
  }
});
