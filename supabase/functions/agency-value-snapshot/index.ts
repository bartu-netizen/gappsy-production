import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const body = await req.json();
    const agencyId = (body?.agency_id ?? "").trim();

    if (!agencyId) {
      return json({ ok: false, error: "agency_id required" }, 400);
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const { data: agencyRow } = await supabase
      .from("other_agencies")
      .select("slug, created_at")
      .eq("id", agencyId)
      .maybeSingle();

    const agencySlug = agencyRow?.slug ?? null;
    const agencyCreatedAt = agencyRow?.created_at ?? new Date().toISOString();

    const now = new Date();
    const since7d = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000).toISOString();
    const since30d = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000).toISOString();

    const [count7, count30, uniqueRows] = await Promise.all([
      supabase
        .from("agency_availability_requests")
        .select("id", { count: "exact", head: true })
        .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .gte("created_at", since7d),

      supabase
        .from("agency_availability_requests")
        .select("id", { count: "exact", head: true })
        .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .gte("created_at", since30d),

      supabase
        .from("agency_availability_requests")
        .select("requester_email, client_email")
        .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
        .eq("is_demo", false)
        .is("deleted_at", null)
        .gte("created_at", since30d),
    ]);

    let displayCount30d = count30.count ?? 0;

    if (agencySlug) {
      const { data: canonical } = await supabase
        .from("canonical_replay_state")
        .select("missed_requests_last_30_days")
        .eq("agency_slug", agencySlug)
        .maybeSingle();

      if (canonical?.missed_requests_last_30_days != null && canonical.missed_requests_last_30_days > 0) {
        displayCount30d = canonical.missed_requests_last_30_days;
      }
    }

    const emailSet = new Set<string>();
    for (const r of uniqueRows.data ?? []) {
      const e = ((r.requester_email ?? r.client_email) as string | null)?.toLowerCase().trim();
      if (e) emailSet.add(e);
    }

    const { data: lastRow } = await supabase
      .from("agency_availability_requests")
      .select("created_at")
      .or(`target_agency_id.eq.${agencyId},agency_id.eq.${agencyId}`)
      .eq("is_demo", false)
      .is("deleted_at", null)
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    return json({
      ok: true,
      snapshot: {
        availability_checks_7d: count7.count ?? 0,
        availability_checks_30d_real: count30.count ?? 0,
        availability_checks_30d_display: displayCount30d,
        unique_requesters_30d: emailSet.size,
        last_check_time: lastRow?.created_at ?? null,
        agency_created_at: agencyCreatedAt,
      },
    });
  } catch (err) {
    console.error("[agency-value-snapshot]", err);
    return json({ ok: false, error: "Internal error" }, 500);
  }
});
