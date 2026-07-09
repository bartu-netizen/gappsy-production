import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface StateEntry {
  state_slug: string;
  section: string;
  rank: number | null;
  page_path: string;
}

interface SearchResult {
  agency_id: string | null;
  agency_slug: string;
  agency_name: string;
  agency_domain: string | null;
  logo_url: string | null;
  states: StateEntry[];
  match_type: string;
  score: number;
}

function statePagePath(stateSlug: string): string {
  return `/marketing-agencies-in-${stateSlug}-united-states/`;
}

function mapRpcRow(r: Record<string, unknown>): SearchResult {
  return {
    agency_id: (r.out_agency_id as string | null) ?? null,
    agency_slug: r.out_agency_slug as string,
    agency_name: r.out_agency_name as string,
    agency_domain: (r.out_agency_domain as string | null) ?? null,
    logo_url: (r.out_logo_url as string | null) ?? null,
    states: (r.out_states as StateEntry[]) || [],
    match_type: r.out_match_type as string,
    score: parseFloat(r.out_score as string) || 0,
  };
}

async function runMVFallback(
  supabase: ReturnType<typeof createClient>,
  q: string,
  limit: number
): Promise<SearchResult[]> {
  const pattern = `%${q}%`;

  const { data, error } = await supabase
    .from("public_agency_search_mv")
    .select("agency_slug, agency_name, agency_domain, logo_url, source_agency_id, state_slug, section, rank, page_path")
    .or(`agency_name_lower.ilike.${pattern},agency_slug.ilike.${pattern}`)
    .limit(limit * 4);

  if (error || !data || data.length === 0) {
    if (error) console.error("[search-agencies] MV fallback error:", error.message);
    return [];
  }

  const agencyMap = new Map<string, SearchResult>();
  const stateSetMap = new Map<string, Set<string>>();

  for (const row of data) {
    const slug = (row.agency_slug as string) ?? "";
    if (!slug) continue;

    if (!agencyMap.has(slug)) {
      agencyMap.set(slug, {
        agency_id: (row.source_agency_id as string | null) ?? null,
        agency_slug: slug,
        agency_name: (row.agency_name as string) ?? slug,
        agency_domain: (row.agency_domain as string | null) ?? null,
        logo_url: (row.logo_url as string | null) ?? null,
        states: [],
        match_type: "fallback_mv",
        score: 55,
      });
      stateSetMap.set(slug, new Set());
    }

    const entry = agencyMap.get(slug)!;
    const stateSet = stateSetMap.get(slug)!;
    if (!entry.agency_id && row.source_agency_id && !(row.source_agency_id as string).startsWith("top25-")) {
      entry.agency_id = row.source_agency_id as string;
    }

    const stateSlug = row.state_slug as string | null;
    const section = (row.section as string) ?? "other";
    const stateKey = `${stateSlug}:${section}`;
    if (stateSlug && !stateSet.has(stateKey)) {
      stateSet.add(stateKey);
      entry.states.push({
        state_slug: stateSlug,
        section,
        rank: (row.rank as number | null) ?? null,
        page_path: (row.page_path as string) ?? statePagePath(stateSlug),
      });
    }
  }

  return Array.from(agencyMap.values())
    .sort((a, b) => {
      const aTop = a.states.some(s => s.section === "top25") ? 1 : 0;
      const bTop = b.states.some(s => s.section === "top25") ? 1 : 0;
      return bTop - aTop || b.score - a.score;
    })
    .slice(0, limit);
}

async function runBaseTableFallback(
  supabase: ReturnType<typeof createClient>,
  q: string,
  limit: number
): Promise<SearchResult[]> {
  const pattern = `%${q}%`;

  const [oaResp, t25Resp] = await Promise.allSettled([
    supabase
      .from("other_agencies")
      .select("id, name, agency_slug, domain_normalized, state_slug")
      .or(`name.ilike.${pattern},agency_slug.ilike.${pattern}`)
      .eq("is_active", true)
      .or("listing_management_status.is.null,listing_management_status.eq.visible_free,listing_management_status.eq.active_paid")
      .limit(60),
    supabase
      .from("top25_slots")
      .select("agency_id, agency_name, agency_slug, state_slug, rank")
      .or(`agency_name.ilike.${pattern},agency_slug.ilike.${pattern}`)
      .not("agency_name", "is", null)
      .limit(30),
  ]);

  const oaRows = oaResp.status === "fulfilled" ? ((oaResp.value.data ?? []) as Array<{
    id: string;
    name: string;
    agency_slug: string;
    domain_normalized: string | null;
    state_slug: string;
  }>) : [];

  const t25Rows = t25Resp.status === "fulfilled" ? ((t25Resp.value.data ?? []) as Array<{
    agency_id: string | null;
    agency_name: string;
    agency_slug: string | null;
    state_slug: string;
    rank: number | null;
  }>) : [];

  if (oaResp.status === "rejected") console.error("[search-agencies] base-table oa error:", oaResp.reason);
  if (t25Resp.status === "rejected") console.error("[search-agencies] base-table t25 error:", t25Resp.reason);

  const agencyMap = new Map<string, SearchResult>();
  const stateSetMap = new Map<string, Set<string>>();

  for (const row of oaRows) {
    const slug = row.agency_slug ?? "";
    if (!slug) continue;

    if (!agencyMap.has(slug)) {
      agencyMap.set(slug, {
        agency_id: row.id ?? null,
        agency_slug: slug,
        agency_name: row.name ?? slug,
        agency_domain: row.domain_normalized ?? null,
        logo_url: null,
        states: [],
        match_type: "fallback_table",
        score: 50,
      });
      stateSetMap.set(slug, new Set());
    }

    const entry = agencyMap.get(slug)!;
    const stateSet = stateSetMap.get(slug)!;
    const stateKey = `${row.state_slug}:other`;
    if (row.state_slug && !stateSet.has(stateKey)) {
      stateSet.add(stateKey);
      entry.states.push({
        state_slug: row.state_slug,
        section: "other",
        rank: null,
        page_path: statePagePath(row.state_slug),
      });
    }
  }

  for (const row of t25Rows) {
    const slug = row.agency_slug ?? "";
    if (!slug || !row.agency_name) continue;

    if (!agencyMap.has(slug)) {
      agencyMap.set(slug, {
        agency_id: row.agency_id ?? null,
        agency_slug: slug,
        agency_name: row.agency_name,
        agency_domain: null,
        logo_url: null,
        states: [],
        match_type: "fallback_table",
        score: 60,
      });
      stateSetMap.set(slug, new Set());
    } else {
      const entry = agencyMap.get(slug)!;
      if (!entry.agency_id && row.agency_id) entry.agency_id = row.agency_id;
      entry.score = Math.max(entry.score, 60);
    }

    const entry = agencyMap.get(slug)!;
    const stateSet = stateSetMap.get(slug)!;
    const stateKey = `${row.state_slug}:top25`;
    if (row.state_slug && !stateSet.has(stateKey)) {
      stateSet.add(stateKey);
      entry.states.push({
        state_slug: row.state_slug,
        section: "top25",
        rank: row.rank ?? null,
        page_path: statePagePath(row.state_slug),
      });
    }
  }

  return Array.from(agencyMap.values())
    .sort((a, b) => b.score - a.score)
    .slice(0, limit);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url = new URL(req.url);
    let q = "";
    let limit = 10;

    if (req.method === "POST") {
      const body = await req.json().catch(() => ({}));
      q = (body.q ?? "").toString().trim();
      limit = Math.min(Number(body.limit ?? 10), 20);
    } else {
      q = (url.searchParams.get("q") ?? "").trim();
      limit = Math.min(Number(url.searchParams.get("limit") ?? "10"), 20);
    }

    if (!q || q.length < 2) {
      return new Response(
        JSON.stringify({ ok: true, results: [], query: q, reason: "query_too_short" }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
    );

    const queryStart = performance.now();

    const { data: rawResults, error: rpcError } = await supabase.rpc("search_agencies_robust", {
      query_text: q,
      max_results: limit,
    });

    const rpcCount = rpcError ? 0 : ((rawResults as unknown[]) ?? []).length;
    let results: SearchResult[] = [];
    let fallbackUsed: string | null = null;

    if (!rpcError && rpcCount > 0) {
      results = (rawResults as Record<string, unknown>[]).map(mapRpcRow);
    } else {
      if (rpcError) {
        console.error(`[search-agencies] RPC error q="${q}": ${rpcError.message}`);
      } else {
        console.log(`[search-agencies] RPC 0 results q="${q}" — trying MV fallback`);
      }

      const mvResults = await runMVFallback(supabase, q.toLowerCase(), limit);
      if (mvResults.length > 0) {
        results = mvResults;
        fallbackUsed = "mv";
      } else {
        console.log(`[search-agencies] MV fallback 0 results q="${q}" — trying base-table fallback`);
        const tableResults = await runBaseTableFallback(supabase, q.toLowerCase(), limit);
        results = tableResults;
        fallbackUsed = "table";
      }
    }

    const queryDuration = performance.now() - queryStart;
    const withIdCount = results.filter(r => !!r.agency_id).length;
    const matchTypeCounts = results.reduce((acc: Record<string, number>, r) => {
      acc[r.match_type] = (acc[r.match_type] || 0) + 1;
      return acc;
    }, {});

    console.log(
      `[search-agencies] q="${q}" rpc=${rpcCount} fallback=${fallbackUsed ?? "none"} final=${results.length} with_id=${withIdCount} types=${JSON.stringify(matchTypeCounts)} duration=${queryDuration.toFixed(2)}ms`
    );

    return new Response(
      JSON.stringify({
        ok: true,
        results,
        query: q,
        total: results.length,
        match_types: matchTypeCounts,
        fallback_used: fallbackUsed,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("[search-agencies] unhandled error:", err);
    return new Response(
      JSON.stringify({ ok: false, error: "Search unavailable", details: String(err) }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
