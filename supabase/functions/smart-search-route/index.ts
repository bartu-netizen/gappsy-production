import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

// Smart search router behind every "what are you looking for" chat box on
// the site (homepage, /tool-categories, /tool-categories/:slug). Takes one
// free-text query and decides where to send the visitor — behavior depends
// on `mode`:
//   - "general" (homepage): tool, category, comparison, or a state's
//     agency list.
//   - "category" (/tool-categories index): always resolves to a category —
//     even a specific-tool query resolves to that tool's own category,
//     since routing straight to a tool page would skip past the
//     category-browsing context this box lives in.
//   - "category-tools" (/tool-categories/:slug): scoped to the tools
//     inside ONE given category (`category_slug` required) — helps pick
//     the right tool within that category, never a different category or
//     a sitewide match.
//
// Grounding strategy: the model NEVER invents a destination slug on its
// own. It only picks from real candidates fetched from the DB first
// (published categories, search_software RPC matches or a category's own
// tool list, the fixed US state list) via forced function-calling, and
// every pick is re-validated server-side against those same candidate
// lists before building the final path — a hallucinated slug can only
// ever fall back to the /tools search-results page, never a 404.
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
const CATEGORY_TOOLS_LIMIT = 80;

type Mode = "general" | "category" | "category-tools";

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

function routeToolSchema(mode: Mode) {
  const typeEnum = mode === "category" ? ["category", "state", "fallback"] : mode === "category-tools" ? ["tool", "fallback"] : ["state", "tool", "category", "compare", "fallback"];
  return {
    type: "function",
    function: {
      name: "route_search",
      description: "Decide where to send a Gappsy visitor based on their free-text search query.",
      parameters: {
        type: "object",
        properties: {
          type: {
            type: "string",
            enum: typeEnum,
            description:
              mode === "category"
                ? "category = the single best-matching category slug for what they described — if they named a specific tool, use that tool's own category instead of routing to the tool directly. state = they want marketing agencies/services in a specific US state. fallback = nothing confidently matches."
                : mode === "category-tools"
                  ? "tool = the single best-matching tool slug from the candidate list (tools inside this one category). fallback = nothing in this category confidently matches."
                  : "state = they want marketing agencies/services in a specific US state. tool = they named one specific software tool that appears in the candidate list. category = they described a need/problem/type of software. compare = they named 2 or 3 specific tools to compare against each other. fallback = nothing confidently matches.",
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
}

function joinNames(names: string[]): string {
  if (names.length <= 1) return names[0] || "";
  if (names.length === 2) return `${names[0]} and ${names[1]}`;
  return `${names.slice(0, -1).join(", ")}, and ${names[names.length - 1]}`;
}

// Words that signal a needs/description-style query ("a free tool to design
// social posts") rather than someone typing a specific product/brand name
// ("Notion", "Adobe Express"). Used only to decide whether a fallback (no
// confident match) is worth adding the "own this product?" nudge to — a
// vague description that matched nothing shouldn't get a weird "own a
// product called '...'?" line. Deliberately conservative (word-count cap +
// blocklist, not an LLM call): a missed nudge is harmless, a wrongly-shown
// one looks broken, so this only fires when fairly confident.
const DESCRIPTIVE_QUERY_WORDS = new Set([
  "free", "with", "for", "in", "trial", "tool", "tools", "software", "app", "apps",
  "agency", "agencies", "best", "cheap", "alternative", "alternatives", "vs", "versus",
  "compare", "comparison", "need", "looking", "want", "like", "similar", "and", "or",
  "a", "an", "the", "to", "of", "that", "this", "team", "teams", "small", "large",
  "business", "companies", "company", "marketing", "manage", "management", "platform",
]);

function looksLikeProductName(query: string): boolean {
  const words = query.trim().split(/\s+/).filter(Boolean);
  if (words.length === 0 || words.length > 3) return false;
  return !words.some((w) => DESCRIPTIVE_QUERY_WORDS.has(w.toLowerCase()));
}

// Builds the chat-style reply shown before the visitor clicks through —
// written from the resolved, real names above, never from anything the
// model said directly, so it can't contradict what the button actually
// links to.
function buildReply(
  resultType: string,
  names: string[],
  query: string,
): { message: string; buttonLabel: string; secondaryMessage?: string; secondaryButtonLabel?: string; secondaryPath?: string } {
  switch (resultType) {
    case "tool":
      return { message: `${names[0]} looks like a great match for what you're looking for.`, buttonLabel: `Visit ${names[0]}` };
    case "category":
      return { message: `"${names[0]}" is the category that fits best — take a look at what's inside.`, buttonLabel: `Browse ${names[0]}` };
    case "compare":
      return { message: `Here's a side-by-side comparison of ${joinNames(names)}.`, buttonLabel: "See the comparison" };
    case "state":
      return { message: `Here are the top marketing agencies in ${names[0]}.`, buttonLabel: `See agencies in ${names[0]}` };
    default: {
      const base = { message: `We couldn't find an exact match, but here are search results for "${query}".`, buttonLabel: "See search results" };
      if (!looksLikeProductName(query)) return base;
      return {
        ...base,
        secondaryMessage: `Own a product called "${query}"? You can list it on Gappsy.`,
        secondaryButtonLabel: "List your product",
        secondaryPath: "/list-your-product/onboarding",
      };
    }
  }
}

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
    const visitorId = typeof payload.visitor_id === "string" ? payload.visitor_id : null;
    const rawQuery = typeof payload.query === "string" ? payload.query.trim() : "";
    if (!sessionId || !rawQuery) return jsonResponse({ ok: false, error: "Invalid payload" }, 400);
    const query = rawQuery.slice(0, MAX_QUERY_LENGTH);
    // Real geo (city/country) comes from the Netlify relay's context.geo
    // (netlify/edge-functions/smart-search-relay.js) when the request goes
    // through it — direct calls (e.g. local dev) just get the raw IP with
    // no geo, same graceful fallback as tool_page_views/track-event.
    const ip = typeof payload.ip === "string" ? payload.ip : req.headers.get("x-forwarded-for")?.split(",")[0]?.trim() || null;
    const city = typeof payload.city === "string" ? payload.city : null;
    const countryCode = typeof payload.country_code === "string" ? payload.country_code : null;
    const countryName = typeof payload.country_name === "string" ? payload.country_name : null;
    const requestedMode = payload.mode === "category" || payload.mode === "category-tools" ? payload.mode : "general";
    const categorySlugParam = typeof payload.category_slug === "string" ? payload.category_slug : null;
    // category-tools with no category_slug can't do anything scoped — fall
    // back to plain category mode rather than erroring.
    const mode: Mode = requestedMode === "category-tools" && !categorySlugParam ? "category" : requestedMode;

    const withinLimit = await checkRateLimit(supabase, sessionId);
    if (!withinLimit) {
      return jsonResponse({ ok: false, error: "Too many searches — please wait a few minutes and try again." }, 429);
    }

    const fallbackPath = `/tools?q=${encodeURIComponent(query)}`;

    // ── category-tools: scoped entirely to one category's own tool list ──
    if (mode === "category-tools" && categorySlugParam) {
      const { data: categoryRow } = await supabase
        .from("tool_categories")
        .select("id, slug, name")
        .eq("slug", categorySlugParam)
        .eq("status", "published")
        .maybeSingle();

      if (!categoryRow) {
        return jsonResponse({ ok: true, path: fallbackPath, type: "fallback", ...buildReply("fallback", [], query) });
      }

      const { data: links } = await supabase
        .from("tool_category_links")
        .select("tools!inner(slug, name, short_description, status)")
        .eq("category_id", categoryRow.id)
        .eq("tools.status", "published")
        .limit(CATEGORY_TOOLS_LIMIT);

      // deno-lint-ignore no-explicit-any
      const categoryTools: { slug: string; name: string; short_description: string | null }[] = (links || []).map((r: any) => r.tools).filter(Boolean);

      if (categoryTools.length === 0) {
        return jsonResponse({ ok: true, path: fallbackPath, type: "fallback", ...buildReply("fallback", [], query) });
      }

      const toolsText = categoryTools.map((t) => `${t.slug}: ${t.name}${t.short_description ? ` — ${t.short_description}` : ""}`).join("\n");
      const systemPrompt = `You are Gappsy's assistant on the "${categoryRow.name}" category page. A visitor described what they need and wants the single best-matching tool from THIS category. Call route_search exactly once.

Tools in this category:
${toolsText}

Rules:
- Use type=tool with the single best-matching slug from the list above.
- If nothing in this category confidently matches what they described, use type=fallback.
- Never invent a slug that isn't in the list above, and never suggest a tool outside this category.`;

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
          tools: [routeToolSchema(mode)],
          tool_choice: { type: "function", function: { name: "route_search" } },
        }),
      });

      let path = fallbackPath;
      let resultType = "fallback";
      let resultNames: string[] = [];

      if (openaiResponse.ok) {
        const data = await openaiResponse.json();
        const toolCall = data.choices?.[0]?.message?.tool_calls?.[0];
        // deno-lint-ignore no-explicit-any
        let decision: any = null;
        try {
          decision = toolCall?.function?.arguments ? JSON.parse(toolCall.function.arguments) : null;
        } catch {
          decision = null;
        }
        if (decision?.type === "tool") {
          const match = categoryTools.find((t) => t.slug === decision.tool_slug);
          if (match) {
            path = `/tools/${match.slug}`;
            resultType = "tool";
            resultNames = [match.name];
          }
        }
      } else {
        console.error("[smart-search-route] OpenAI error (category-tools):", openaiResponse.status);
      }

      supabase.from("smart_search_logs").insert({ session_id: sessionId, query, result_type: resultType, result_path: path, ip_address: ip, city, country_code: countryCode, country_name: countryName, visitor_id: visitorId }).then(() => {});
      return jsonResponse({ ok: true, path, type: resultType, ...buildReply(resultType, resultNames, query) });
    }

    // ── general + category modes: share the sitewide candidate fetch ──

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
        ? toolCandidates.map((t) => `${t.slug}: ${t.name}${t.subtitle ? ` — ${t.subtitle}` : ""}${t.primary_category_name ? ` (category: ${t.primary_category_name})` : ""}`).join("\n")
        : "(no tool name matches found for this query)";

    const systemPrompt =
      mode === "category"
        ? `You are Gappsy's assistant on the /tool-categories browsing page. A visitor typed a free-text query. Decide where to send them by calling route_search exactly once.

Rules:
- If they're asking about marketing agencies, services, or businesses in a specific US state (e.g. "agency in New Jersey"), use type=state with the matching slug from this list:
${statesText}
- Otherwise, ALWAYS resolve to a category — this box's job is to point at the right category, not a specific tool page. If they described a need or problem (e.g. "something to design social posts", "free CRM"), pick the best-matching category. If they named a specific tool instead, use that tool's own category shown in parentheses next to it below, and map it to the matching slug in the category list. Category list:
${categoriesText}

Tool name candidates already matched for this query, each with its own category noted (may be empty):
${toolCandidatesText}
- If genuinely nothing matches any category, use type=fallback.

Never invent a slug that isn't in one of the lists above.`
        : `You are Gappsy's homepage search router. A visitor typed a free-text query into the search bar. Decide where to send them by calling route_search exactly once.

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
        tools: [routeToolSchema(mode)],
        tool_choice: { type: "function", function: { name: "route_search" } },
      }),
    });

    if (!openaiResponse.ok) {
      const errText = await openaiResponse.text().catch(() => "");
      console.error("[smart-search-route] OpenAI error:", openaiResponse.status, errText);
      supabase.from("smart_search_logs").insert({ session_id: sessionId, query, result_type: "fallback", result_path: fallbackPath, ip_address: ip, city, country_code: countryCode, country_name: countryName, visitor_id: visitorId }).then(() => {});
      const fallbackReply = buildReply("fallback", [], query);
      return jsonResponse({ ok: true, path: fallbackPath, type: "fallback", ...fallbackReply });
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
    // Human-readable name(s) of whatever we resolved to, used only to write
    // the assistant's reply text below — never fed back into a query.
    let resultNames: string[] = [];

    if (decision?.type === "state") {
      const state = US_STATES.find((s) => s.slug === decision.state_slug);
      if (state) {
        path = `/marketing-agencies-in-${state.slug}-united-states/`;
        resultType = "state";
        resultNames = [state.name];
      }
    } else if (decision?.type === "tool" && mode === "general") {
      const match = toolCandidates.find((t) => t.slug === decision.tool_slug);
      if (match) {
        path = `/tools/${match.slug}`;
        resultType = "tool";
        resultNames = [match.name];
      }
    } else if (decision?.type === "category") {
      const match = categories.find((c) => c.slug === decision.category_slug);
      if (match) {
        path = `/tool-categories/${match.slug}`;
        resultType = "category";
        resultNames = [match.name];
      }
    } else if (decision?.type === "compare" && mode === "general" && Array.isArray(decision.tool_slugs) && decision.tool_slugs.length >= 2) {
      const slugs: string[] = decision.tool_slugs.filter((s: unknown): s is string => typeof s === "string" && toolCandidates.some((t) => t.slug === s));
      if (slugs.length === 2) {
        const { data: toolRows } = await supabase.from("tools").select("id, slug, name").in("slug", slugs);
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
            resultNames = [a.name, b.name];
          } else {
            path = `/tools/${a.slug}`;
            resultType = "tool";
            resultNames = [a.name];
          }
        }
      } else if (slugs.length === 3) {
        const { data: toolRows } = await supabase.from("tools").select("id, slug, name").in("slug", slugs);
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
            resultNames = toolRows.map((t: { name: string }) => t.name);
          } else {
            path = `/tools/${toolRows[0].slug}`;
            resultType = "tool";
            resultNames = [toolRows[0].name];
          }
        }
      }
    }

    supabase.from("smart_search_logs").insert({ session_id: sessionId, query, result_type: resultType, result_path: path, ip_address: ip, city, country_code: countryCode, country_name: countryName, visitor_id: visitorId }).then(() => {});

    return jsonResponse({ ok: true, path, type: resultType, ...buildReply(resultType, resultNames, query) });
  } catch (error) {
    console.error("[smart-search-route] error:", error);
    return jsonResponse({ ok: false, error: "Something went wrong. Please try again." }, 500);
  }
});
