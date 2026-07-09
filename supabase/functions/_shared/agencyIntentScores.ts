/**
 * Agency Intent Score Loader
 *
 * Calls compute_agency_intent_scores(p_state_slug) and returns a Map
 * keyed by agency_id for O(1) lookup inside edge function resolvers.
 *
 * INTEGRATION:
 *   import { loadIntentScores, IntentScore } from '../_shared/agencyIntentScores.ts';
 *
 *   const scores = await loadIntentScores(supabase, stateSlug);
 *   const agencyScore = scores.get(agency.id); // IntentScore | undefined
 *
 * SAFETY:
 *   - Returns empty Map on any error (non-breaking)
 *   - Does NOT interfere with manual showcase pinning or paid listing priority
 */

export interface IntentScore {
  agency_id:                    string;
  state_slug:                   string;
  activity_score:               number;
  deepest_step:                 number;
  last_activity_at:             string | null;
  checkout_opened_count:        number;
  availability_submitted_count: number;
  upsell_viewed_count:          number;
  profile_views:                number;
  profile_clicks:               number;
  repeat_visits:                number;
  score_breakdown:              Record<string, number>;
  // Multi-dimensional scoring (v2)
  positive_intent_score?:       number;
  churn_intent_score?:          number;
  recovery_opportunity_score?:  number;
  final_priority_score?:        number;
  recovery_priority?:           string;
  // Manage funnel metrics
  manage_opened_count?:         number;
  manage_remove_intent_count?:  number;
  manage_recovered_count?:      number;
  manage_removed_count?:        number;
  last_manage_event_at?:        string | null;
  last_manage_event_type?:      string | null;
}

/**
 * Minimal Supabase RPC surface required by loadIntentScores.
 * Matches the PromiseLike return of supabase-js v2 .rpc() calls.
 */
export type SupabaseRpcClient = {
  rpc(
    fn: string,
    args: Record<string, unknown>
  ): PromiseLike<{ data: unknown; error: { message: string } | null }>;
};

/**
 * Load intent scores for a single state slug.
 * Returns a Map<agency_id, IntentScore>.
 * Always resolves — never throws.
 */
export async function loadIntentScores(
  supabase: SupabaseRpcClient,
  stateSlug: string
): Promise<Map<string, IntentScore>> {
  const map = new Map<string, IntentScore>();
  try {
    const { data, error } = await supabase.rpc(
      "compute_agency_intent_scores",
      { p_state_slug: stateSlug || null }
    );
    if (error) {
      console.warn("[intentScores] RPC error:", error.message);
      return map;
    }
    if (!Array.isArray(data)) return map;

    let skipped = 0;
    for (const row of data as IntentScore[]) {
      if (!row?.agency_id) continue;
      // State guard: when a state was requested, drop rows whose state_slug
      // does not exactly match. This catches eng_agg null-state leakage that
      // returns rows with state_slug = '' for non-null p_state_slug calls.
      if (stateSlug && row.state_slug !== stateSlug) {
        skipped++;
        continue;
      }
      map.set(row.agency_id, row);
    }

    if (skipped > 0) {
      console.warn(`[intentScores:${stateSlug}] dropped ${skipped} wrong-state row(s) from RPC result`);
    }
  } catch (err) {
    console.warn("[intentScores] load failed:", err instanceof Error ? err.message : err);
  }
  return map;
}

/**
 * Load extended intent scores (v2) with manage funnel signals.
 * Returns a Map<agency_id, IntentScore> with multi-dimensional scoring.
 * Always resolves — never throws.
 */
export async function loadIntentScoresV2(
  supabase: SupabaseRpcClient,
  stateSlug: string
): Promise<Map<string, IntentScore>> {
  const map = new Map<string, IntentScore>();
  try {
    const { data, error } = await supabase.rpc(
      "compute_agency_intent_scores_v2",
      { p_state_slug: stateSlug || null }
    );
    if (error) {
      console.warn("[intentScoresV2] RPC error:", error.message);
      return map;
    }
    if (!Array.isArray(data)) return map;

    let skipped = 0;
    for (const row of data as IntentScore[]) {
      if (!row?.agency_id) continue;
      if (stateSlug && row.state_slug !== stateSlug) {
        skipped++;
        continue;
      }
      map.set(row.agency_id, row);
    }

    if (skipped > 0) {
      console.warn(`[intentScoresV2:${stateSlug}] dropped ${skipped} wrong-state row(s) from RPC result`);
    }
  } catch (err) {
    console.warn("[intentScoresV2] load failed:", err instanceof Error ? err.message : err);
  }
  return map;
}

/**
 * Returns the activity_score for an agency, or 0 if not present.
 */
export function getActivityScore(
  scores: Map<string, IntentScore>,
  agencyId: string
): number {
  return scores.get(agencyId)?.activity_score ?? 0;
}

/**
 * Comparator for Array.sort() — sorts by intent score descending.
 */
export function intentScoreComparator(
  scores: Map<string, IntentScore>,
  idA: string,
  idB: string
): number {
  return getActivityScore(scores, idB) - getActivityScore(scores, idA);
}
