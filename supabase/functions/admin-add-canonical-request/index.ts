import { createClient } from "npm:@supabase/supabase-js@2";
import { extractToken, verifySessionToken } from "../_shared/adminSession.ts";
import { priorityOverrideUntilMs, seedFor } from "../_shared/canonicalRotation.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
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
    // Verify admin authorization via session token
    const token = extractToken(req);
    if (!token) return json({ ok: false, error: "Unauthorized" }, 401);
    const auth = await verifySessionToken(token);
    if (!auth.ok) {
      const msg = auth.error === "expired"
        ? "Admin session expired. Please log in again."
        : "Unauthorized";
      return json({ ok: false, error: msg }, 401);
    }

    const body = await req.json();
    const {
      agency_id,
      state_slug,
      service,
      budget,
      timeline,
      location,
      masked_ip,
      device,
      hours_ago,
      created_by,
    } = body as {
      agency_id: string;
      state_slug: string;
      service?: string;
      budget?: string;
      timeline?: string;
      location?: string;
      masked_ip?: string;
      device?: string;
      hours_ago: number;
      created_by?: string;
    };

    if (!agency_id || typeof hours_ago !== "number") {
      return json({ ok: false, error: "Missing required fields: agency_id, hours_ago" }, 400);
    }
    if (hours_ago < 0) {
      return json({ ok: false, error: "hours_ago must be >= 0" }, 400);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    // Compute request_at server-side — never trust client timestamp
    const requestAt = new Date(Date.now() - hours_ago * 3600 * 1000);
    const normalizedStateSlug = state_slug || "";

    // ── Safety guard ─────────────────────────────────────────────────────────
    // Check agency_last_seen_replay_state for this agency/state.
    // If they already saw the ledger, block injecting anything older than
    // what they saw (most_recent_request_at_seen).
    const { data: lastSeen } = await supabase
      .from("agency_last_seen_replay_state")
      .select("most_recent_request_at_seen, viewed_at")
      .eq("agency_id", agency_id)
      .eq("state_slug", normalizedStateSlug)
      .maybeSingle();

    if (lastSeen?.most_recent_request_at_seen) {
      const seenAt = new Date(lastSeen.most_recent_request_at_seen).getTime();
      if (requestAt.getTime() < seenAt) {
        const safeMaxHours = (Date.now() - seenAt) / 3600000;
        return json({
          ok: false,
          error:
            "This request is older than the most recent request the agency already saw. Adding it could break timeline consistency.",
          most_recent_request_at_seen: lastSeen.most_recent_request_at_seen,
          safe_hours_ago_max: Math.floor(safeMaxHours * 10) / 10,
        }, 409);
      }
    }

    // Only insert into canonical_request_overrides.
    // Manual requests MUST NOT touch canonical_replay_state — no updates to
    // base_generated_anchor_ms, most_recent_request_ms, or missed_requests_last_30_days.
    const { data: inserted, error: insertErr } = await supabase
      .from("canonical_request_overrides")
      .insert({
        agency_id,
        state_slug: normalizedStateSlug,
        service: service ?? null,
        budget: budget ?? null,
        timeline: timeline ?? null,
        location: location ?? null,
        masked_ip: masked_ip ?? null,
        device: device ?? null,
        request_at: requestAt.toISOString(),
        created_by: created_by ?? "admin",
      })
      .select("id, request_at")
      .single();

    if (insertErr) {
      console.error("[admin-add-canonical-request] insert error:", insertErr);
      return json({ ok: false, error: "Failed to insert request" }, 500);
    }

    // Lookup agency slug to form the seed deterministically
    const { data: agencyRow } = await supabase
      .from("other_agencies")
      .select("slug")
      .eq("id", agency_id)
      .maybeSingle();
    const agencySlug = (agencyRow as { slug: string | null } | null)?.slug ?? "";

    const insertedMs = new Date(inserted.request_at).getTime();
    const priorityUntilMs = priorityOverrideUntilMs(
      seedFor(agency_id, agencySlug, normalizedStateSlug),
      insertedMs,
    );

    return json({
      ok: true,
      id: inserted.id,
      request_at: inserted.request_at,
      request_at_ms: insertedMs,
      priority_override_until_ms: priorityUntilMs,
      priority_override_active: Date.now() < priorityUntilMs,
      most_recent_request_ms_updated: true,
    });
  } catch (err) {
    console.error("[admin-add-canonical-request] error:", err);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});
