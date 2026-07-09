/**
 * Shared logic for resolving the base (generated) anchor + count with
 * deterministic fallback and auto-rotation.
 *
 * Rules (must match across request-replay-stats, resolve-agency-context,
 * admin-get-canonical-context, record-ledger-view):
 *
 *  - If a stored base_generated_anchor_ms exists, it is the base (never replaced).
 *  - Otherwise, if real requests exist, base = newest real request timestamp.
 *  - Otherwise, base = deterministic fallback anchor (2–72h ago, per seed).
 *  - baseCount = max(storedBaseCount, realCount, deterministicFallbackCount)
 *                where deterministicFallbackCount is 7–18 (per seed).
 *  - Auto-rotate: while (now - baseMs) > intervalMs, baseMs += intervalMs, count++.
 *    interval is 6–18h per seed (stable per agencyId+stateSlug).
 *  - Manual overrides NEVER affect base rotation, base anchor, or base count.
 */

function djb2(str: string): number {
  let h = 5381;
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
    h = h >>> 0;
  }
  return h;
}

const MIN_MISSED = 7;
const MAX_MISSED = 18;
const MIN_ANCHOR_H = 2;
const MAX_ANCHOR_H = 72;
const MIN_INTERVAL_H = 6;
const MAX_INTERVAL_H = 18;
const MAX_ROTATION_STEPS = 500;

export function seedFor(agencyId: string, agencySlug: string, stateSlug: string): string {
  return `${agencyId || ""}|${agencySlug || ""}|${stateSlug || ""}`;
}

export function deterministicFallbackCount(seedBase: string): number {
  const h = djb2(seedBase + ":missed");
  return MIN_MISSED + (h % (MAX_MISSED - MIN_MISSED + 1));
}

export function rotationIntervalHours(seedBase: string): number {
  const h = djb2(seedBase + ":interval");
  return MIN_INTERVAL_H + (h % (MAX_INTERVAL_H - MIN_INTERVAL_H + 1));
}

/**
 * Deterministic fallback anchor.
 *
 * Fully deterministic from (seed, fixed epoch bucket). The bucket is aligned
 * to the Unix epoch at a multiple of the seed's rotation interval, so:
 *   - Within one rotation interval, the returned anchor is stable across
 *     fetches (does not shift if persist fails or cache misses occur).
 *   - At each rotation-interval boundary, the anchor advances by exactly one
 *     intervalMs — which matches the rotation step in computeRotatedBase,
 *     keeping baseCount stable and aging smooth.
 *
 * No floating Date.now() offsets are applied to the anchor itself; Date.now()
 * is only used to select the current fixed-epoch bucket index.
 */
export function deterministicFallbackAnchorMs(seedBase: string): number {
  const h = djb2(seedBase + ":anchor");
  const offH = MIN_ANCHOR_H + (h % (MAX_ANCHOR_H - MIN_ANCHOR_H + 1));
  const intervalMs = rotationIntervalHours(seedBase) * 3_600_000;
  const bucketStart = Math.floor(Date.now() / intervalMs) * intervalMs;
  return bucketStart - offH * 3_600_000;
}

export interface RotatedBase {
  baseGeneratedMs: number;
  baseCount: number;
  baseWasSeeded: boolean;
  baseWasRotated: boolean;
  rotationSteps: number;
  intervalHours: number;
}

export function computeRotatedBase(
  agencyId: string,
  agencySlug: string,
  stateSlug: string,
  realRequestCountLast30: number,
  realMostRecentMs: number | null,
  storedBaseMs: number | null,
  storedBaseCount: number | null,
): RotatedBase {
  const seedBase = seedFor(agencyId, agencySlug, stateSlug);
  const intervalHours = rotationIntervalHours(seedBase);
  const intervalMs = intervalHours * 3_600_000;

  let baseMs: number;
  let baseCount: number;
  let baseWasSeeded = false;

  if (storedBaseMs && storedBaseMs > 0) {
    baseMs = storedBaseMs;
    baseCount = Math.max(storedBaseCount ?? 0, realRequestCountLast30);
  } else if (realMostRecentMs && realRequestCountLast30 > 0) {
    baseMs = realMostRecentMs;
    baseCount = realRequestCountLast30;
  } else {
    baseMs = deterministicFallbackAnchorMs(seedBase);
    baseCount = Math.max(deterministicFallbackCount(seedBase), realRequestCountLast30);
    baseWasSeeded = true;
  }

  const now = Date.now();
  let steps = 0;
  while (now - baseMs > intervalMs && steps < MAX_ROTATION_STEPS) {
    baseMs += intervalMs;
    steps++;
  }
  const baseWasRotated = steps > 0;
  baseCount += steps;

  return {
    baseGeneratedMs: baseMs,
    baseCount,
    baseWasSeeded,
    baseWasRotated,
    rotationSteps: steps,
    intervalHours,
  };
}

/**
 * Priority window for a manual admin override.
 *
 * Returns the timestamp (ms) until which a manual admin-added request should be
 * treated as the "current most recent request" — even if the deterministic
 * generated anchor is slightly newer.
 *
 * The window duration reuses rotationIntervalHours(seedBase), which is
 * deterministic 6–18h per agency/state seed. No schema change required.
 */
export function priorityOverrideUntilMs(
  seedBase: string,
  overrideRequestAtMs: number,
): number {
  const intervalMs = rotationIntervalHours(seedBase) * 3_600_000;
  return overrideRequestAtMs + intervalMs;
}

/**
 * Unified selection of the "current most recent request" timestamp.
 *
 * IF a manual override exists AND now < priority_override_until_ms, the manual
 * override wins unconditionally (even if generated anchor is newer).
 * Otherwise, fall back to max(baseGeneratedMs, latestOverrideMs).
 *
 * NEVER mutates base_generated_anchor_ms or the base KPI count.
 */
export interface CurrentMostRecentResult {
  currentMs: number;
  priorityActive: boolean;
  priorityUntilMs: number | null;
}

export function pickCurrentMostRecentMs(
  baseGeneratedMs: number,
  latestOverrideMs: number | null,
  seedBase: string,
  nowMs: number = Date.now(),
): CurrentMostRecentResult {
  if (latestOverrideMs && latestOverrideMs > 0) {
    const untilMs = priorityOverrideUntilMs(seedBase, latestOverrideMs);
    if (nowMs < untilMs) {
      return {
        currentMs: latestOverrideMs,
        priorityActive: true,
        priorityUntilMs: untilMs,
      };
    }
    const fallback = Math.max(baseGeneratedMs, latestOverrideMs);
    return {
      currentMs: fallback,
      priorityActive: false,
      priorityUntilMs: untilMs,
    };
  }
  return {
    currentMs: baseGeneratedMs,
    priorityActive: false,
    priorityUntilMs: null,
  };
}

/**
 * Upsert rotated base into canonical_replay_state.
 * Manual overrides NEVER call this.
 */
export async function persistRotatedBase(
  supabase: any,
  agencyId: string,
  agencySlug: string,
  stateSlug: string,
  rotated: RotatedBase,
): Promise<void> {
  if (!agencyId) return;
  const nowIso = new Date().toISOString();
  try {
    await supabase
      .from("canonical_replay_state")
      .upsert(
        {
          agency_id: agencyId,
          agency_slug: agencySlug,
          state_slug: stateSlug,
          base_generated_anchor_ms: rotated.baseGeneratedMs,
          most_recent_request_ms: rotated.baseGeneratedMs,
          missed_requests_last_30_days: rotated.baseCount,
          last_real_kpi_at: nowIso,
          updated_at: nowIso,
        },
        { onConflict: "agency_id,state_slug" },
      );
  } catch {
    // non-fatal — read path still returns correct values
  }
}
