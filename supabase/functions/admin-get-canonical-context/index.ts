import { createClient } from "npm:@supabase/supabase-js@2";
import { extractToken, verifySessionToken } from "../_shared/adminSession.ts";
import { computeRotatedBase, persistRotatedBase, pickCurrentMostRecentMs, seedFor } from "../_shared/canonicalRotation.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

// ── Replicated from src/utils/canonicalReplayData.ts ─────────────────────────
// Must stay in sync with client-side deterministic generation.

function djb2(str: string): number {
  let h = 5381;
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
    h = h >>> 0;
  }
  return h;
}

function pick<T>(arr: T[], seed: number): T {
  return arr[seed % arr.length];
}

const LEDGER_IP_PREFIXES = [
  "72.21", "74.125", "98.124", "104.18", "108.162",
  "162.158", "172.217", "199.27", "204.79", "209.85",
  "216.58", "66.249", "142.250", "35.186", "34.102",
  "23.32", "192.0", "198.41", "185.199", "151.101",
];

const SHAPE_EXPONENTS = [0.52, 0.65, 0.80, 1.10, 1.35];

function fnv(str: string): number {
  let h = 2166136261;
  for (let i = 0; i < str.length; i++) {
    h ^= str.charCodeAt(i);
    h = (Math.imul(h, 16777619)) >>> 0;
  }
  return h;
}

/**
 * Compute the masked IPs for all deterministic ledger entries for this agency/state.
 * Returns a Set of masked IP strings exactly as they appear in the public ledger.
 */
function computeDeterministicLedgerIps(
  agencyId: string,
  agencySlug: string | null,
  stateSlug: string,
  deterministicCount: number,
  baseAnchorMs: number,
): Set<string> {
  const ips = new Set<string>();
  if (deterministicCount <= 0 || !stateSlug) return ips;

  const seedBase = `${agencyId}|${agencySlug ?? ""}|${stateSlug}`;
  const shapeSeed = fnv(seedBase + ":shape");
  const shapeExp = SHAPE_EXPONENTS[shapeSeed % SHAPE_EXPONENTS.length];
  const totalMs = 30 * 24 * 60 * 60_000;

  for (let i = 0; i < deterministicCount; i++) {
    const s1 = djb2(seedBase + "lrow" + i);
    const s5 = djb2(seedBase + "lipr" + i);
    const s6 = djb2(seedBase + "lip3" + i);

    // Compute absoluteMs so we know this entry falls within last 30 days
    let absoluteMs: number;
    if (i === 0) {
      absoluteMs = baseAnchorMs;
    } else {
      const t = deterministicCount > 1 ? i / (deterministicCount - 1) : 1;
      const fraction = Math.pow(t, shapeExp);
      const jitterMs = (s1 % 7200) * 60_000;
      absoluteMs = baseAnchorMs - Math.round(fraction * totalMs * 0.95) - jitterMs;
    }

    // Only include entries within last 30 days window
    const cutoffMs = Date.now() - 30 * 24 * 3600_000;
    if (absoluteMs < cutoffMs) continue;

    const ipPrefix = pick(LEDGER_IP_PREFIXES, s5);
    const oct3 = ((s6 % 220) + 10).toString();
    ips.add(`${ipPrefix}.${oct3.slice(0, 2)}x.xxx`);
  }

  return ips;
}
// ─────────────────────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const json = (body: unknown, status = 200) =>
    new Response(JSON.stringify(body), {
      status,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });

  try {
    const token = extractToken(req);
    if (!token) return json({ ok: false, error: "Unauthorized" }, 401);
    const auth = await verifySessionToken(token);
    if (!auth.ok) {
      const msg = auth.error === "expired"
        ? "Admin session expired. Please log in again."
        : "Unauthorized";
      return json({ ok: false, error: msg }, 401);
    }

    const url = new URL(req.url);
    const agencyId = url.searchParams.get("agency_id") ?? "";
    const stateSlug = url.searchParams.get("state_slug") ?? "";

    if (!agencyId) {
      return json({ ok: false, error: "Missing agency_id" }, 400);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const thirtyDaysAgoIso = new Date(Date.now() - 30 * 24 * 3600_000).toISOString();

    // ── 1. Canonical replay state ─────────────────────────────────────────────
    const { data: replayState } = await supabase
      .from("canonical_replay_state")
      .select("base_generated_anchor_ms, missed_requests_last_30_days, updated_at, agency_slug")
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .maybeSingle();

    // Count of real (non-demo) requests in last 30d
    const { count: realCountRaw } = await supabase
      .from("agency_availability_requests")
      .select("id", { count: "exact", head: true })
      .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
      .eq("is_demo", false)
      .is("deleted_at", null)
      .gte("created_at", thirtyDaysAgoIso);
    const realCount = realCountRaw ?? 0;

    let realMostRecentMs: number | null = null;
    if (realCount > 0) {
      const { data: latestReal } = await supabase
        .from("agency_availability_requests")
        .select("created_at")
        .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle();
      if (latestReal?.created_at) {
        realMostRecentMs = new Date(latestReal.created_at).getTime();
      }
    }

    // ── 2. Latest override within last 30 days ────────────────────────────────
    const { data: latestOverride } = await supabase
      .from("canonical_request_overrides")
      .select("id, service, budget, timeline, location, masked_ip, device, request_at, created_at, created_by")
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .gte("request_at", thirtyDaysAgoIso)
      .order("request_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    // ── 3. All override entries within last 30 days (for IP uniqueness) ───────
    const { data: overridesLast30d } = await supabase
      .from("canonical_request_overrides")
      .select("id, service, budget, timeline, location, masked_ip, device, request_at, created_at")
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .gte("request_at", thirtyDaysAgoIso)
      .order("request_at", { ascending: false })
      .limit(50);

    // ── 4. All admin override entries (full history, for display only) ─────────
    const { data: allOverrides } = await supabase
      .from("canonical_request_overrides")
      .select("id, service, budget, timeline, location, masked_ip, device, request_at, created_at")
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .order("request_at", { ascending: false })
      .limit(50);

    // ── 5. Agency slug (needed for deterministic seed) ────────────────────────
    let agencySlug: string | null = null;
    if (stateSlug) {
      const { data: agencyRow } = await supabase
        .from("other_agencies")
        .select("slug")
        .eq("id", agencyId)
        .maybeSingle();
      agencySlug = (agencyRow as { slug: string | null } | null)?.slug ?? null;
    }

    // ── 6. Last seen / safety guard ───────────────────────────────────────────
    const { data: lastSeen } = await supabase
      .from("agency_last_seen_replay_state")
      .select("viewed_at, most_recent_request_at_seen")
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .maybeSingle();

    // ── 7. Compute safe max hours ─────────────────────────────────────────────
    let safeHoursAgoMax: number | null = null;
    if (lastSeen?.most_recent_request_at_seen) {
      const seenMs = new Date(lastSeen.most_recent_request_at_seen).getTime();
      safeHoursAgoMax = Math.floor(((Date.now() - seenMs) / 3600000) * 10) / 10;
    }

    // ── 8. Compute rotated base + effective anchor ────────────────────────────
    const rotated = computeRotatedBase(
      agencyId,
      agencySlug ?? replayState?.agency_slug ?? "",
      stateSlug,
      realCount,
      realMostRecentMs,
      replayState?.base_generated_anchor_ms ?? null,
      replayState?.missed_requests_last_30_days ?? null,
    );

    // Persist rotated base (fire-and-forget; read path already has correct values)
    if (rotated.baseWasRotated || rotated.baseWasSeeded) {
      persistRotatedBase(
        supabase,
        agencyId,
        agencySlug ?? replayState?.agency_slug ?? "",
        stateSlug,
        rotated,
      ).catch(() => {});
    }

    const generatedMostRecentMs = rotated.baseGeneratedMs;
    const latestOverrideMs = latestOverride?.request_at
      ? new Date(latestOverride.request_at).getTime()
      : null;

    const overrideCountLast30 = (overridesLast30d ?? []).length;
    const totalMissedCount = rotated.baseCount + overrideCountLast30;

    const priority = pickCurrentMostRecentMs(
      generatedMostRecentMs,
      latestOverrideMs,
      seedFor(agencyId, agencySlug ?? replayState?.agency_slug ?? "", stateSlug),
    );
    const currentMostRecentMs = priority.currentMs;

    // ── 9. Compute full set of existing ledger IPs ────────────────────────────
    // Includes both deterministic generated entries AND all 30-day override IPs.
    const ledgerIpSet = new Set<string>();

    // 9a. Deterministic IPs — replicate client-side buildInitialEntries IP logic
    if (stateSlug && rotated.baseCount > 0) {
      const deterministicIps = computeDeterministicLedgerIps(
        agencyId,
        agencySlug,
        stateSlug,
        rotated.baseCount,
        rotated.baseGeneratedMs,
      );
      deterministicIps.forEach((ip) => ledgerIpSet.add(ip));
    }

    // 9b. Override IPs (last 30 days)
    (overridesLast30d ?? []).forEach((o: { masked_ip: string | null }) => {
      if (o.masked_ip) ledgerIpSet.add(o.masked_ip);
    });

    return json({
      ok: true,
      canonical_anchor_ms: currentMostRecentMs,
      base_generated_anchor_ms: rotated.baseGeneratedMs,
      generated_most_recent_ms: generatedMostRecentMs,
      latest_override_ms: latestOverrideMs,
      priority_override_active: priority.priorityActive,
      priority_override_until_ms: priority.priorityUntilMs,
      missed_requests_last_30_days: totalMissedCount,
      base_generated_count: rotated.baseCount,
      override_count_last_30_days: overrideCountLast30,
      latest_override: latestOverride ?? null,
      all_overrides: allOverrides ?? [],
      // Full set of masked IPs from the visible last-30-days ledger (deterministic + overrides)
      existing_ledger_masked_ips: Array.from(ledgerIpSet),
      last_seen: lastSeen
        ? {
            viewed_at: lastSeen.viewed_at,
            most_recent_request_at_seen: lastSeen.most_recent_request_at_seen,
          }
        : null,
      safe_hours_ago_max: safeHoursAgoMax,
    });
  } catch (err) {
    console.error("[admin-get-canonical-context] error:", err);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});
