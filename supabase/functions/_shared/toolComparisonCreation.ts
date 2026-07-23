// Shared "create a tool_comparisons row" logic — extracted from
// admin-tool-comparisons/index.ts so the exact same validation (block
// open-source-vs-open-source, canonical alphabetical slug, duplicate-pair
// check) is used by BOTH the manual admin action and the automated
// lead-magnet comparison generator (schedulerRegistry.ts), rather than
// reimplementing these rules a second time.
// deno-lint-ignore-file no-explicit-any
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";

export class ComparisonValidationError extends Error {}

const UNIQUE_VIOLATION = "23505";

interface CanonicalTool {
  id: string;
  slug: string;
  name: string;
  is_open_source: boolean;
}

// Fetches both tools and returns them reordered so `toolA` is always the
// alphabetically-first slug — independent of which one the caller picked as
// "Tool A". This is what lets the frontend and the src/data/comparisonContent
// registry safely assume tool_a always matches the first half of the
// canonical slug. The unique (LEAST, GREATEST) pair index on tool_comparisons
// is the DB-level backstop against ever storing both orderings.
export async function resolveCanonicalPair(supabase: SupabaseClient, idX: string, idY: string): Promise<{ toolA: CanonicalTool; toolB: CanonicalTool; slug: string }> {
  const { data, error } = await supabase.from("tools").select("id, slug, name, is_open_source").in("id", [idX, idY]);
  if (error) throw new Error(`Failed to load tools: ${error.message}`);
  const toolX = (data || []).find((t: any) => t.id === idX);
  const toolY = (data || []).find((t: any) => t.id === idY);
  if (!toolX || !toolY) throw new ComparisonValidationError("Both tool_a_id and tool_b_id must reference existing tools");
  // Paid tools drive more real business value than open-source ones — an
  // open-source-vs-open-source pairing is deliberately blocked rather than
  // just deprioritized in listings, per an explicit content-strategy call.
  if (toolX.is_open_source && toolY.is_open_source) {
    throw new ComparisonValidationError("Cannot create a comparison between two open-source tools — pair at least one non-open-source tool");
  }
  const [toolA, toolB] = toolX.slug.localeCompare(toolY.slug) <= 0 ? [toolX, toolY] : [toolY, toolX];
  return { toolA, toolB, slug: `${toolA.slug}-vs-${toolB.slug}` };
}

export interface CreateComparisonResult {
  ok: boolean;
  comparison?: { id: string; slug: string; tool_a_id: string; tool_b_id: string; status: string };
  error?: string;
  status_code?: number;
}

export async function createToolComparison(
  supabase: SupabaseClient,
  toolAId: string,
  toolBId: string,
  status: "draft" | "published" = "draft",
): Promise<CreateComparisonResult> {
  if (toolAId === toolBId) return { ok: false, error: "tool_a_id and tool_b_id must be different tools", status_code: 400 };

  let toolA: CanonicalTool, toolB: CanonicalTool, slug: string;
  try {
    ({ toolA, toolB, slug } = await resolveCanonicalPair(supabase, toolAId, toolBId));
  } catch (err) {
    if (err instanceof ComparisonValidationError) return { ok: false, error: err.message, status_code: 400 };
    throw err;
  }

  // Pre-check for a fast, friendly result — the DB's unique slug + unique
  // (LEAST, GREATEST) pair index are the actual source of truth, this alone
  // cannot be trusted under concurrent writes.
  const { data: existing } = await supabase.from("tool_comparisons").select("id, slug, tool_a_id, tool_b_id, status").eq("slug", slug).maybeSingle();
  if (existing) return { ok: false, error: `A comparison for this pair already exists ("${slug}")`, status_code: 409, comparison: existing as any };

  const { data: newComparison, error: insertError } = await supabase
    .from("tool_comparisons")
    .insert({ tool_a_id: toolA.id, tool_b_id: toolB.id, slug, status })
    .select()
    .single();

  if (insertError) {
    if ((insertError as any).code === UNIQUE_VIOLATION) {
      return { ok: false, error: `A comparison for this pair already exists ("${slug}")`, status_code: 409 };
    }
    return { ok: false, error: insertError.message, status_code: 500 };
  }

  return { ok: true, comparison: newComparison };
}
