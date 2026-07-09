import { createClient } from "npm:@supabase/supabase-js@2";
import { computeRotatedBase, persistRotatedBase, pickCurrentMostRecentMs, seedFor } from "../_shared/canonicalRotation.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface OverrideEntry {
  service: string | null;
  budget: string | null;
  timeline: string | null;
  location: string | null;
  maskedIp: string | null;
  device: string | null;
  absoluteMs: number;
}

interface CanonicalKpi {
  anchorMs: number | null;
  baseAnchorMs: number | null;
  missedRequestsLast30Days: number | null;
  baseGeneratedCount: number | null;
  overrideEntries: OverrideEntry[];
  priorityOverrideActive: boolean;
  priorityOverrideUntilMs: number | null;
}

const NULL_KPI: CanonicalKpi = { anchorMs: null, baseAnchorMs: null, missedRequestsLast30Days: null, baseGeneratedCount: null, overrideEntries: [], priorityOverrideActive: false, priorityOverrideUntilMs: null };

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
    const url = new URL(req.url);
    const agencySlug = url.searchParams.get("agencySlug") ?? "";
    const stateSlugParam = url.searchParams.get("stateSlug") ?? "";

    if (!agencySlug) {
      return json({ agencyId: null, real: 0, canonicalAnchorMs: null, missedRequestsLast30Days: null });
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    let agencyRow: { id: string; created_at: string } | null = null;

    const { data: activeRow } = await supabase
      .from("other_agencies")
      .select("id, created_at")
      .eq("slug", agencySlug)
      .eq("is_active", true)
      .maybeSingle();

    if (activeRow?.id) {
      agencyRow = activeRow;
    } else {
      const { data: anyRow } = await supabase
        .from("other_agencies")
        .select("id, created_at")
        .eq("slug", agencySlug)
        .maybeSingle();
      if (anyRow?.id) agencyRow = anyRow;
    }

    if (!agencyRow?.id) {
      const { data: top25Row } = await supabase
        .from("top25_slots")
        .select("agency_id, other_agencies!inner(id, created_at, slug)")
        .eq("other_agencies.slug", agencySlug)
        .not("agency_id", "is", null)
        .maybeSingle();
      if (top25Row?.agency_id) {
        const inner = Array.isArray(top25Row.other_agencies)
          ? top25Row.other_agencies[0]
          : top25Row.other_agencies;
        if (inner?.id) agencyRow = inner as { id: string; created_at: string };
      }
    }

    if (!agencyRow?.id) {
      return json({ agencyId: null, real: 0, canonicalAnchorMs: null, missedRequestsLast30Days: null });
    }

    const agencyId: string = agencyRow.id;
    const thirtyDaysAgo = new Date(Date.now() - 30 * 24 * 3600_000).toISOString();

    const { count: real } = await supabase
      .from("agency_availability_requests")
      .select("id", { count: "exact", head: true })
      .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
      .eq("is_demo", false)
      .is("deleted_at", null)
      .gte("created_at", thirtyDaysAgo);

    const realCount = real ?? 0;

    const kpi = await getOrCreateCanonicalKpi(supabase, agencySlug, agencyId, stateSlugParam, realCount);

    return json({
      agencyId,
      real: realCount,
      canonicalAnchorMs: kpi.anchorMs,
      baseAnchorMs: kpi.baseAnchorMs,
      missedRequestsLast30Days: kpi.missedRequestsLast30Days,
      baseGeneratedCount: kpi.baseGeneratedCount,
      overrideEntries: kpi.overrideEntries,
      priorityOverrideActive: kpi.priorityOverrideActive,
      priorityOverrideUntilMs: kpi.priorityOverrideUntilMs,
    });
  } catch (err) {
    console.error("[request-replay-stats] error:", err);
    return json({ agencyId: null, real: 0, canonicalAnchorMs: null, missedRequestsLast30Days: null });
  }
});

async function getOrCreateCanonicalKpi(
  supabase: ReturnType<typeof createClient>,
  agencySlug: string,
  agencyId: string,
  stateSlug: string,
  realCount: number,
): Promise<CanonicalKpi> {
  try {
    const thirtyDaysAgoIso = new Date(Date.now() - 30 * 24 * 3600_000).toISOString();
    const { data: overrideRows } = await supabase
      .from("canonical_request_overrides")
      .select("service, budget, timeline, location, masked_ip, device, request_at")
      .eq("agency_id", agencyId)
      .eq("state_slug", stateSlug)
      .gte("request_at", thirtyDaysAgoIso)
      .order("request_at", { ascending: false })
      .limit(50);

    const overrideEntries: OverrideEntry[] = (overrideRows ?? []).map((r: any) => ({
      service: r.service ?? null,
      budget: r.budget ?? null,
      timeline: r.timeline ?? null,
      location: r.location ?? null,
      maskedIp: r.masked_ip ?? null,
      device: r.device ?? null,
      absoluteMs: new Date(r.request_at).getTime(),
    }));

    const overrideCountLast30 = overrideEntries.length;
    const newestOverrideMs = overrideEntries.length > 0 ? overrideEntries[0].absoluteMs : 0;

    // Load stored canonical_replay_state (anchor + count)
    let storedBaseMs: number | null = null;
    let storedBaseCount: number | null = null;

    if (agencyId) {
      const { data: compositeRow } = await supabase
        .from("canonical_replay_state")
        .select("most_recent_request_ms, missed_requests_last_30_days, base_generated_anchor_ms")
        .eq("agency_id", agencyId)
        .eq("state_slug", stateSlug)
        .maybeSingle();
      if (compositeRow) {
        storedBaseMs = (compositeRow as any).base_generated_anchor_ms ?? null;
        storedBaseCount = (compositeRow as any).missed_requests_last_30_days ?? null;
      }
    }
    if (storedBaseMs === null) {
      const { data: legacyRow } = await supabase
        .from("canonical_replay_state")
        .select("most_recent_request_ms, missed_requests_last_30_days, base_generated_anchor_ms")
        .eq("agency_slug", agencySlug)
        .maybeSingle();
      if (legacyRow) {
        storedBaseMs = (legacyRow as any).base_generated_anchor_ms ?? null;
        storedBaseCount = (legacyRow as any).missed_requests_last_30_days ?? null;
      }
    }

    // Newest real request timestamp
    let realMostRecentMs: number | null = null;
    if (realCount > 0) {
      const { data: latestRequest } = await supabase
        .from("agency_availability_requests")
        .select("created_at")
        .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle();
      if (latestRequest?.created_at) {
        realMostRecentMs = new Date(latestRequest.created_at).getTime();
      }
    }

    const rotated = computeRotatedBase(
      agencyId,
      agencySlug,
      stateSlug,
      realCount,
      realMostRecentMs,
      storedBaseMs,
      storedBaseCount,
    );

    if (rotated.baseWasSeeded || rotated.baseWasRotated) {
      persistRotatedBase(supabase, agencyId, agencySlug, stateSlug, rotated).catch(() => {});
    }

    const baseGeneratedMs = rotated.baseGeneratedMs;
    const baseCount = rotated.baseCount;
    const priority = pickCurrentMostRecentMs(
      baseGeneratedMs,
      newestOverrideMs > 0 ? newestOverrideMs : null,
      seedFor(agencyId, agencySlug, stateSlug),
    );
    const displayAnchorMs = priority.currentMs;
    const totalCount = baseCount + overrideCountLast30;

    return {
      anchorMs: displayAnchorMs,
      baseAnchorMs: baseGeneratedMs,
      missedRequestsLast30Days: totalCount,
      baseGeneratedCount: baseCount,
      overrideEntries,
      priorityOverrideActive: priority.priorityActive,
      priorityOverrideUntilMs: priority.priorityUntilMs,
    };
  } catch (err) {
    console.error("[request-replay-stats] canonical kpi error:", err);
    return NULL_KPI;
  }
}
