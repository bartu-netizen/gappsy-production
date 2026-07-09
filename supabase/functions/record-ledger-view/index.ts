import { createClient } from "npm:@supabase/supabase-js@2";
import { computeRotatedBase, persistRotatedBase, pickCurrentMostRecentMs, seedFor } from "../_shared/canonicalRotation.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

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
    const body = await req.json();
    const { agency_id, state_slug, client_anchor_ms } = body as {
      agency_id: string;
      state_slug?: string;
      client_anchor_ms?: number;
    };

    if (!agency_id) {
      return json({ ok: false, error: "Missing agency_id" }, 400);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const normalizedStateSlug = state_slug ?? "";

    // ── Server-compute the authoritative most_recent_request_at_seen ─────────
    // Uses base_generated_anchor_ms (clean real-request anchor, never contaminated
    // by overrides) and the newest 30-day override — matching public ledger logic.
    // most_recent_request_ms is intentionally NOT used: it can be a stale display
    // anchor set from an override timestamp.

    const thirtyDaysAgoIso = new Date(Date.now() - 30 * 24 * 3600_000).toISOString();
    let serverAnchorMs: number | null = null;

    // A) rotated base_generated_anchor_ms — never contaminated by overrides
    const { data: replayState } = await supabase
      .from("canonical_replay_state")
      .select("base_generated_anchor_ms, missed_requests_last_30_days, agency_slug")
      .eq("agency_id", agency_id)
      .eq("state_slug", normalizedStateSlug)
      .maybeSingle();

    const storedBaseMs = replayState?.base_generated_anchor_ms ?? null;
    const storedBaseCount = replayState?.missed_requests_last_30_days ?? null;
    const agencySlugForSeed = replayState?.agency_slug ?? "";

    // Pull real-request context for rotation input
    const { count: realCountRaw } = await supabase
      .from("agency_availability_requests")
      .select("id", { count: "exact", head: true })
      .or(`target_agency_id.eq.${agency_id},agency_id.eq.${agency_id}`)
      .eq("is_demo", false)
      .is("deleted_at", null)
      .gte("created_at", thirtyDaysAgoIso);
    const realCount = realCountRaw ?? 0;

    let realMostRecentMs: number | null = null;
    if (realCount > 0) {
      const { data: latestReal } = await supabase
        .from("agency_availability_requests")
        .select("created_at")
        .or(`target_agency_id.eq.${agency_id},agency_id.eq.${agency_id}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle();
      if (latestReal?.created_at) {
        realMostRecentMs = new Date(latestReal.created_at).getTime();
      }
    }

    const rotated = computeRotatedBase(
      agency_id,
      agencySlugForSeed,
      normalizedStateSlug,
      realCount,
      realMostRecentMs,
      storedBaseMs,
      storedBaseCount,
    );

    if (rotated.baseWasSeeded || rotated.baseWasRotated) {
      persistRotatedBase(supabase, agency_id, agencySlugForSeed, normalizedStateSlug, rotated).catch(() => {});
    }

    serverAnchorMs = rotated.baseGeneratedMs;

    // B) newest override within last 30 days (matches public ledger window)
    const { data: latestOverride } = await supabase
      .from("canonical_request_overrides")
      .select("request_at")
      .eq("agency_id", agency_id)
      .eq("state_slug", normalizedStateSlug)
      .gte("request_at", thirtyDaysAgoIso)
      .order("request_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    const latestOverrideMs = latestOverride?.request_at
      ? new Date(latestOverride.request_at).getTime()
      : null;

    if (serverAnchorMs !== null) {
      const priority = pickCurrentMostRecentMs(
        serverAnchorMs,
        latestOverrideMs,
        seedFor(agency_id, agencySlugForSeed, normalizedStateSlug),
      );
      serverAnchorMs = priority.currentMs;
    } else if (latestOverrideMs !== null) {
      serverAnchorMs = latestOverrideMs;
    }

    // If neither source found, fall back to validating client value
    if (serverAnchorMs === null && typeof client_anchor_ms === "number" && client_anchor_ms > 0) {
      // Accept client value only if it's not in the future and not more than 31 days old
      const now = Date.now();
      const thirtyOneDays = 31 * 24 * 3600_000;
      if (client_anchor_ms <= now && client_anchor_ms >= now - thirtyOneDays) {
        serverAnchorMs = client_anchor_ms;
      }
    }

    if (serverAnchorMs === null) {
      // Nothing to record — no canonical ledger exists yet for this agency
      return json({ ok: true, recorded: false, reason: "no_canonical_anchor" });
    }

    const mostRecentRequestAtSeen = new Date(serverAnchorMs).toISOString();
    const nowIso = new Date().toISOString();

    // UPSERT — update viewed_at and most_recent_request_at_seen
    const { error: upsertErr } = await supabase
      .from("agency_last_seen_replay_state")
      .upsert(
        {
          agency_id,
          state_slug: normalizedStateSlug,
          viewed_at: nowIso,
          most_recent_request_at_seen: mostRecentRequestAtSeen,
          updated_at: nowIso,
        },
        { onConflict: "agency_id,state_slug" },
      );

    if (upsertErr) {
      console.error("[record-ledger-view] upsert error:", upsertErr);
      return json({ ok: false, error: "Failed to record view" }, 500);
    }

    return json({
      ok: true,
      recorded: true,
      most_recent_request_at_seen: mostRecentRequestAtSeen,
    });
  } catch (err) {
    console.error("[record-ledger-view] error:", err);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});
