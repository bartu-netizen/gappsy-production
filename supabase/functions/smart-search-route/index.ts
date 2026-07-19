import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

// Homepage "smart search" — takes one free-text query ("a free tool to
// design social posts", "marketing agency in New Jersey", "notion vs
// asana") and decides where to send the visitor: a specific tool page, a
// category page, a comparison page, or a state's agency list. Replaces the
// old state-only search bar.
//
// Grounding strategy: the model NEVER invents a destination slug on its
// own. It only picks from real candidates fetched from the DB first
// (published categories, search_software RPC matches, the fixed US state
// list) via forced function-calling, and every pick is re-validated
// server-side against those same candidate lists before building the
// final path — a hallucinated slug can only ever fall back to the /tools
// search-results page, never a 404.
//
// Same public/no-admin-auth/CORS/rate-limit pattern as ask-gappsy.

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, apikey",
};

const MODEL = "gpt-4o-mini";
const RATE_LIMIT_WINDOW_MINUTES = 5;
const RATE_LIMIT_MAX_QUERIES = 20;
const MAX_QUERY_LENGTH = 300;

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

// Mirrors src/lib/usStates.ts — duplicated here because edge functions run
// on Deno and can't import a Vite/TS source file directly. US states are
// effectively static, so this is safe to keep as a plain copy.
const US_STATES = [
  { name: "Alabama", slug: "alabama", abbr: "AL" }, { name: "Alaska", slug: "alaska", abbr: "AK" },
  { name: "Arizona", slug: "arizona", abbr: "AZ" }, { name: "Arkansas", slug: "arkansas", abbr: "AR" },
  { name: "California", slug: "california", abbr: "CA" }, { name: "Colorado", slug: "colorado", abbr: "CO" },
  { name: "Connecticut", slug: "connecticut", abbr: "CT" }, { name: "Delaware", slug: "delaware", abbr: "DE" },
  { name: "District of Columbia", slug: "district-of-columbia", abbr: "DC" }, { name: "Florida", slug: "florida", abbr: "FL" },
  { name: "Georgia", slug: "georgia", abbr: "GA" }, { name: "Hawaii", slug: "hawaii", abbr: "HI" },
  { name: "Idaho", slug: "idaho", abbr: "ID" }, { name: "Illinois", slug: "illinois", abbr: "IL" },
  { name: "Indiana", slug: "indiana", abbr: "IN" }, { name: "Iowa", slug: "iowa", abbr: "IA" },
  { name: "Kansas", slug: "kansas", abbr: "KS" }, { name: "Kentucky", slug: "kentucky", abbr: "KY" },
  { name: "Louisiana", slug: "louisiana", abbr: "LA" }, { name: "Maine", slug: "maine", abbr: "ME" },
  { name: "Maryland", slug: "maryland", abbr: "MD" }, { name: "Massachusetts", slug: "massachusetts", abbr: "MA" },
  { name: "Michigan", slug: "michigan", abbr: "MI" }, { name: "Minnesota", slug: "minnesota", abbr: "MN" },
  { name: "Mississippi", slug: "mississippi", abbr: "MS" }, { name: "Missouri", slug: "missouri", abbr: "MO" },
  { name: "Montana", slug: "montana", abbr: "MT" }, { name: "Nebraska", slug: "nebraska", abbr: "NE" },
  { name: "Nevada", slug: "nevada", abbr: "NV" }, { name: "New Hampshire", slug: "new-hampshire", abbr: "NH" },
  { name: "New Jersey", slug: "new-jersey", abbr: "NJ" }, { name: "New Mexico", slug: "new-mexico", abbr: "NM" },
  { name: "New York", slug: "new-york", abbr: "NY" }, { name: "North Carolina", slug: "north-carolina", abbr: "NC" },
  { name: "North Dakota", slug: "north-dakota", abbr: "ND" }, { name: "Ohio", slug: "ohio", abbr: "OH" },
  { name: "Oklahoma", slug: "oklahoma", abbr: "OK" }, { name: "Oregon", slug: "oregon", abbr: "OR" },
  { name: "Pennsylvania", slug: "pennsylvania", abbr: "PA" }, { name: "Puerto Rico", slug: "puerto-rico", abbr: "PR" },
  { name: "Rhode Island", slug: "rhode-island", abbr: "RI" }, { name: "South Carolina", slug: "south-carolina", abbr: "SC" },
  { name: "South Dakota", slug: "south-dakota", abbr: "SD" }, { name: "Tennessee", slug: "tennessee", abbr: "TN" },
  { name: "Texas", slug: "texas", abbr: "TX" }, { name: "Utah", slug: "utah", abbr: "UT" },
  { name: "Vermont", slug: "vermont", abbr: "VT" }, { name: "Virginia", slug: "virginia", abbr: "VA" },
  { name: "Washington", slug: "washington", abbr: "WA" }, { name: "West Virginia", slug: "west-virginia", abbr: "WV" },
  { name: "Wisconsin", slug: "wisconsin", abbr: "WI" }, { name: "Wyoming", slug: "wyoming", abbr: "WY" },
];

const ROUTE_TOOL = {
  type: "function",
  function: {
    name: "route_search",
    description: "Decide where to send a Gappsy visitor based on their free-text search query.",
    parameters: {
      type: "object",
      properties: {
        type: {
          type: "string",
          enum: ["state", "tool", "category", "compare", "fallback"],
          description:
            "state = they want marketing agencies/services in a specific US state. tool = they named one specific software tool that appears in the candidate list. category = they described a need/problem/type of software (use the best-matching category from the provided list). compare = they named 2 or 3 specific tools to compare against each other. fallback = nothing confidently matches.",
        },
        state_slug: { type: "string", description: "Required if type=state. Must be exactly one of the provided state slugs." },
        tool_slug: { type: "string", description: "Required if type=tool. Must be exactly one of the provided candidate tool slugs." },
        tool_slugs: {
          type: "array",
          items: { type: "string" },
          description: "Required if type=compare. 2 or 3 tool slugs from the provided candidates, in no particular order.",
        },
        category_slug: { type: "string", description: "Required if type=category. Must be exactly one of the provided category slugs." },
      },
      required: ["type"],
    },
  },
};

async function checkRateLimit(
  // deno-lint-ignore no-explicit-any
  supabase: any,
  sessionId: string
): Promise<boolean> {
  const since = new Date(Date.now() - RATE_LIMIT_WINDOW_MINUTES * 60 * 1000).toISOString();
  const { count } = await supabase
    .from("smart_search_logs")
    .select("id", { count: "exact", head: true })
    .eq("session_id", sessionId)
    .gte("created_at", since);
  return (count ?? 0) < RATE_LIMIT_MAX_QUERIES;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const openaiKey = Deno.env.get("OPENAI_API_KEY");
    if (!openaiKey) return jsonResponse({ ok: false, error: "Search isn't configured yet." }, 503);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const payload = await req.json();
    const sessionId = typeof payload.session_id === "string" ? payload.session_id : null;
    const rawQuery = typeof payload.query === "string" ? payload.query.trim() : "";
    if (!sessionId || !rawQuery) return jsonResponse({ ok: false, error: "Invalid payload" }, 400);
    const query = rawQuery.slice(0, MAX_QUERY_LENGTH);
    const ip = req.headers.get("x-forwarded-for")?.split(",")[0]?.trim() || null;

    const withinLimit = await checkRateLimit(supabase, sessionId);
    if (!withinLimit) {
      return jsonResponse({ ok: false, error: "Too many searches — please wait a few minutes and try again." }, 429);
    }

    const fallbackPath = `/tools?q=${encodeURIComponent(query)}`;

    // A query like "notion vs asana" rarely matches well as one trigram
    // search of the whole phrase — split on common comparison separators
    // and search each segment too, so both tool names actually show up as
    // candidates for the model to pick from.
    const segments = query
      .split(/\s+(?:vs\.?|versus|or)\s+|,/i)
      .map((s) => s.trim())
      .filter((s) => s.length > 1);
    const searchQueries = [query, ...(segments.length > 1 ? segments : [])].slice(0, 4);

    const [categoriesResult, ...searchResults] = await Promise.all([
      supabase.from("tool_categories").select("slug, name").eq("status", "published").order("name"),
      ...searchQueries.map((q) => supabase.rpc("search_software", { query_text: q, max_results: 6 })),
    ]);

    const categories: { slug: string; name: string }[] = categoriesResult.data || [];
    // deno-lint-ignore no-explicit-any
    const searchRows: any[] = searchResults.flatMap((r) => r.data || []);
    const seenToolSlugs = new Set<string>();
    const toolCandidates = searchRows.filter((r) => {
      if (r.result_type !== "tool" || seenToolSlugs.has(r.slug)) return false;
      seenToolSlugs.add(r.slug);
      return true;
    });

    const categoriesText = categories.map((c) => `${c.slug}: ${c.name}`).join("\n");
    const statesText = US_STATES.map((s) => `${s.slug}: ${s.name} (${s.abbr})`).join("\n");
    const toolCandidatesText =
      toolCandidates.length > 0
        ? toolCandidates.map((t) => `${t.slug}: ${t.name}${t.subtitle ? ` — ${t.subtitle}` : ""}`).join("\n")
        : "(no tool name matches found for this query)";

    const systemPrompt = `You are Gappsy's homepage search router. A visitor typed a free-text query into the search bar. Decide where to send them by calling route_search exactly once.

Rules:
- If they're asking about marketing agencies, services, or businesses in a specific US state (e.g. "agency in New Jersey", "who works with NJ businesses"), use type=state with the matching slug from this list:
${statesText}
- If they named ONE specific software tool that appears in the candidate list below, use type=tool with that exact slug.
- If they named 2 or 3 specific tools to compare (e.g. "notion vs asana", "figma or canva"), use type=compare with those tools' slugs from the candidate list.
- If they described a need, problem, or category of software rather than a specific product (e.g. "something to design social posts", "free CRM", "help me track invoices"), use type=category with the single best-matching slug from this list:
${categoriesText}
- If nothing above confidently matches, use type=fallback.

Tool name candidates already matched for this query (may be empty):
${toolCandidatesText}

Never invent a slug that isn't in one of the lists above.`;

    const openaiResponse = await fetch("https://api.openai.com/v1/chat/completions", {
      method: "POST",
      headers: { "Content-Type": "application/json", Authorization: `Bearer ${openaiKey}` },
      body: JSON.stringify({
        model: MODEL,
        temperature: 0,
        messages: [
          { role: "system", content: systemPrompt },
          { role: "user", content: query },
        ],
        tools: [ROUTE_TOOL],
        tool_choice: { type: "function", function: { name: "route_search" } },
      }),
    });

    if (!openaiResponse.ok) {
      const errText = await openaiResponse.text().catch(() => "");
      console.error("[smart-search-route] OpenAI error:", openaiResponse.status, errText);
      supabase.from("smart_search_logs").insert({ session_id: sessionId, query, result_type: "fallback", result_path: fallbackPath, ip_address: ip }).then(() => {});
      return jsonResponse({ ok: true, path: fallbackPath, type: "fallback" });
    }

    const data = await openaiResponse.json();
    const toolCall = data.choices?.[0]?.message?.tool_calls?.[0];
    // deno-lint-ignore no-explicit-any
    let decision: any = null;
    try {
      decision = toolCall?.function?.arguments ? JSON.parse(toolCall.function.arguments) : null;
    } catch {
      decision = null;
    }

    let path = fallbackPath;
    let resultType = "fallback";

    if (decision?.type === "state") {
      const state = US_STATES.find((s) => s.slug === decision.state_slug);
      if (state) {
        path = `/marketing-agencies-in-${state.slug}-united-states/`;
        resultType = "state";
      }
    } else if (decision?.type === "tool") {
      const match = toolCandidates.find((t) => t.slug === decision.tool_slug);
      if (match) {
        path = `/tools/${match.slug}`;
        resultType = "tool";
      }
    } else if (decision?.type === "category") {
      const match = categories.find((c) => c.slug === decision.category_slug);
      if (match) {
        path = `/tool-categories/${match.slug}`;
        resultType = "category";
      }
    } else if (decision?.type === "compare" && Array.isArray(decision.tool_slugs) && decision.tool_slugs.length >= 2) {
      const slugs: string[] = decision.tool_slugs.filter((s: unknown): s is string => typeof s === "string" && toolCandidates.some((t) => t.slug === s));
      if (slugs.length === 2) {
        const { data: toolRows } = await supabase.from("tools").select("id, slug").in("slug", slugs);
        if (toolRows && toolRows.length === 2) {
          const [a, b] = toolRows;
          const { data: comparison } = await supabase
            .from("tool_comparisons")
            .select("slug")
            .eq("status", "published")
            .or(`and(tool_a_id.eq.${a.id},tool_b_id.eq.${b.id}),and(tool_a_id.eq.${b.id},tool_b_id.eq.${a.id})`)
            .maybeSingle();
          if (comparison) {
            path = `/compare/${comparison.slug}`;
            resultType = "compare";
          } else {
            path = `/tools/${a.slug}`;
            resultType = "tool";
          }
        }
      } else if (slugs.length === 3) {
        const { data: toolRows } = await supabase.from("tools").select("id, slug").in("slug", slugs);
        if (toolRows && toolRows.length === 3) {
          const ids: string[] = toolRows.map((t: { id: string }) => t.id);
          const { data: memberRows } = await supabase
            .from("tool_group_comparison_members")
            .select("tool_id, tool_group_comparisons!inner(slug, status)")
            .in("tool_id", ids)
            .eq("tool_group_comparisons.status", "published");
          // deno-lint-ignore no-explicit-any
          const bySlug = new Map<string, number>();
          for (const row of memberRows || []) {
            // deno-lint-ignore no-explicit-any
            const slug = (row as any).tool_group_comparisons?.slug;
            if (slug) bySlug.set(slug, (bySlug.get(slug) || 0) + 1);
          }
          const groupSlug = [...bySlug.entries()].find(([, count]) => count === 3)?.[0];
          if (groupSlug) {
            path = `/compare/${groupSlug}`;
            resultType = "compare";
          } else {
            path = `/tools/${toolRows[0].slug}`;
            resultType = "tool";
          }
        }
      }
    }

    supabase.from("smart_search_logs").insert({ session_id: sessionId, query, result_type: resultType, result_path: path, ip_address: ip }).then(() => {});

    return jsonResponse({ ok: true, path, type: resultType });
  } catch (error) {
    console.error("[smart-search-route] error:", error);
    return jsonResponse({ ok: false, error: "Something went wrong. Please try again." }, 500);
  }
});
