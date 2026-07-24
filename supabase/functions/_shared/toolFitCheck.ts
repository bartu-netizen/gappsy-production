import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";

export interface FitCheckAlternative {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  short_description: string | null;
  rating: number;
  review_count: number;
  billing_interval: string | null;
}

const MIN_SHARED_TAGS = 2;

// Finds genuinely relevant, already-Featured (paying) alternatives for an
// unclaimed tool's "is this right for me?" fit-check widget. Same
// tag-overlap relevance gate as the lead-magnet comparison generator
// (schedulerRegistry.ts's findComparisonCandidate) — same-category alone is
// too broad (confirmed live: "Compare JSON" and "Webflow" share a category
// and nothing else), so this requires 2+ real shared tags, and returns an
// empty array rather than a weak same-category guess when a tool has no
// tags of its own to check against. Restricted to featured=true
// specifically, since that's the "paid Gappsy for visibility" concept
// already disclosed throughout ask-gappsy's system prompts — never
// surfaced as an unbiased pick without that label.
export async function findFeaturedAlternatives(
  supabase: SupabaseClient,
  tool: { id: string; slug: string; is_open_source?: boolean },
  limit = 1,
): Promise<FitCheckAlternative[]> {
  const { data: catLink } = await supabase
    .from("tool_category_links")
    .select("category_id")
    .eq("tool_id", tool.id)
    .eq("primary_category", true)
    .maybeSingle();
  if (!catLink) return [];

  const { data: ownTagRows } = await supabase.from("tool_tag_links").select("tag_id").eq("tool_id", tool.id);
  // deno-lint-ignore no-explicit-any
  const ownTagIds = new Set(((ownTagRows || []) as any[]).map((r) => r.tag_id));
  if (ownTagIds.size === 0) return [];

  const { data: links } = await supabase
    .from("tool_category_links")
    .select("tools!inner(id, slug, name, logo, short_description, rating, review_count, billing_interval, is_open_source, status, featured)")
    // deno-lint-ignore no-explicit-any
    .eq("category_id", (catLink as any).category_id)
    // Candidate must have this as its OWN primary category too, not just a
    // secondary cross-listing — confirmed live: without this, Weebly
    // (Website Builders) matched Canva (Design) purely because Canva is
    // also cross-tagged into Website Builders, despite them not being real
    // competitors. Tag overlap alone didn't catch it (5 shared tags, all
    // generic ones like Free Plan/Web App) since loose category
    // cross-listing, not tags, was the actual cause here.
    .eq("primary_category", true)
    .eq("tools.status", "published")
    .eq("tools.featured", true)
    .neq("tool_id", tool.id)
    .limit(50);

  // deno-lint-ignore no-explicit-any
  let pool = ((links || []) as any[]).map((l) => l.tools).filter(Boolean);
  if (tool.is_open_source) pool = pool.filter((t) => !t.is_open_source);
  if (pool.length === 0) return [];

  const { data: candidateTagRows } = await supabase
    .from("tool_tag_links")
    .select("tool_id, tag_id")
    .in("tool_id", pool.map((c) => c.id));
  const overlapByToolId = new Map<string, number>();
  // deno-lint-ignore no-explicit-any
  for (const row of (candidateTagRows || []) as any[]) {
    if (!ownTagIds.has(row.tag_id)) continue;
    overlapByToolId.set(row.tool_id, (overlapByToolId.get(row.tool_id) || 0) + 1);
  }
  pool = pool.filter((c) => (overlapByToolId.get(c.id) || 0) >= MIN_SHARED_TAGS);
  if (pool.length === 0) return [];

  pool.sort((a, b) =>
    ((overlapByToolId.get(b.id) || 0) - (overlapByToolId.get(a.id) || 0)) ||
    (b.rating - a.rating) ||
    (b.review_count - a.review_count)
  );
  return pool.slice(0, limit).map((best) => ({
    id: best.id,
    slug: best.slug,
    name: best.name,
    logo: best.logo,
    short_description: best.short_description,
    rating: best.rating,
    review_count: best.review_count,
    billing_interval: best.billing_interval ?? null,
  }));
}

// Single-result convenience wrapper — used by ask-gappsy's chat-mode reply,
// which only ever surfaces one alternative inline in its prose.
export async function findFeaturedAlternative(
  supabase: SupabaseClient,
  tool: { id: string; slug: string; is_open_source?: boolean },
): Promise<FitCheckAlternative | null> {
  const [best] = await findFeaturedAlternatives(supabase, tool, 1);
  return best || null;
}
