import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

type TableKind =
  | "matched_leads"
  | "spotlight_applications"
  | "top25_applications"
  | "agency_availability_requests"
  | "owner_demo_events"
  | "your_agency_profile_clicks"
  | "manage_funnel_events";

const ALL_KINDS: TableKind[] = [
  "matched_leads",
  "spotlight_applications",
  "top25_applications",
  "agency_availability_requests",
  "owner_demo_events",
  "your_agency_profile_clicks",
  "manage_funnel_events",
];

const KIND_TO_FUNNEL_TYPE: Record<TableKind, string> = {
  matched_leads: "matched",
  spotlight_applications: "spotlight",
  top25_applications: "top25",
  agency_availability_requests: "availability",
  owner_demo_events: "demo",
  your_agency_profile_clicks: "your_agency_click",
  manage_funnel_events: "manage",
};

interface FunnelSummary {
  session_id: string | null;
  stage: string | null;
  last_event_at: string | null;
  dropoff_stage: string | null;
  dropoff_path: string | null;
  selected_offer: string | null;
  selected_upsell: string | null;
  payment_status: string | null;
  amount_total: number | null;
  currency: string | null;
  checkout_session_id: string | null;
}

function str(v: unknown): string {
  const s = String(v ?? "").trim();
  return s === "null" || s === "undefined" ? "" : s;
}

function buildSummary(kind: TableKind, row: Record<string, unknown>) {
  let company = "";
  let person = "";
  let email = "";
  let status = "";
  let preview = "";

  if (kind === "matched_leads") {
    company = str(row.company_name ?? row.agency_name);
    const fn = str(row.first_name);
    const ln = str(row.last_name);
    const legacyName = str(row.client_name ?? row.contact_name);
    person = fn && ln ? `${fn} ${ln}` : fn || ln || legacyName;
    // email may be stored in either column depending on which edge function inserted the row
    email = str(row.email ?? row.client_email ?? row.contact_email);
    status = str(row.status);
    // service/budget/timeline may be in either new or legacy columns
    const svc = str(row.service ?? row.service_needed);
    const bdg = str(row.budget ?? row.budget_range);
    const tml = str(row.timeline);
    preview = [svc, bdg, tml].filter(Boolean).join(" • ");
  } else if (kind === "spotlight_applications") {
    company = str(row.agency_name ?? row.company_name);
    const fn = str(row.first_name);
    const ln = str(row.last_name);
    person = fn && ln ? `${fn} ${ln}` : fn || ln || str(row.contact_name);
    email = str(row.email ?? row.contact_email);
    status = str(row.status);
    preview = [row.package_type, row.state_slug].filter(Boolean).join(" • ");
  } else if (kind === "top25_applications") {
    company = str(row.agency_name ?? row.company_name);
    const fn = str(row.first_name);
    const ln = str(row.last_name);
    person = fn && ln ? `${fn} ${ln}` : fn || ln || str(row.contact_name);
    email = str(row.email ?? row.contact_email);
    status = str(row.status);
    preview = [row.state_slug, row.package].filter(Boolean).join(" • ");
  } else if (kind === "agency_availability_requests") {
    company = str(row.agency_name ?? row.agency_slug);
    const fn = str(row.client_first_name ?? row.first_name);
    const ln = str(row.client_last_name ?? row.last_name);
    // Fallback to requester_name if client_name is empty (new column from submit-and-notify)
    person = fn && ln ? `${fn} ${ln}` : fn || ln || str(row.client_name ?? row.requester_name ?? row.contact_name);
    // Fallback to requester_email if client_email is empty
    email = str(row.client_email ?? row.requester_email);
    status = str(row.status);
    const sentimentTag = row.sentiment ? `[${row.sentiment}]` : (row.page_type === "review" ? "[review]" : "");
    // Fallback to service_interest if service is empty
    const svc = str(row.service ?? row.service_interest);
    preview = [sentimentTag, svc, row.budget, row.timeline].filter(Boolean).join(" • ");
  } else if (kind === "owner_demo_events") {
    const meta = row.metadata as Record<string, unknown> | null;
    const metaPerson = meta?.person as Record<string, unknown> | null;
    const metaAgency = meta?.agency as Record<string, unknown> | null;
    const metaCtx = meta?.context as Record<string, unknown> | null;
    company = str(row.agency_name ?? metaAgency?.name);
    const fn = str(metaPerson?.first_name ?? metaPerson?.name);
    const ln = str(metaPerson?.last_name);
    person = fn && ln ? `${fn} ${ln}` : fn || str(metaPerson?.email);
    email = str(metaPerson?.email);
    status = str(row.event_name);
    const flow = metaCtx?.flow ?? "";
    const step = metaCtx?.step ?? "";
    const role = metaPerson?.role ?? "";
    preview = [flow, step, role ? `role=${role}` : ""].filter(Boolean).join(" • ");
  } else if (kind === "your_agency_profile_clicks") {
    company = str(row.agency_name);
    email = str(row.imported_agency_email);
    status = str(row.source) || "profile click";
    const emailCount = Number(row.imported_agency_email_count ?? 0);
    const emailSuffix = emailCount > 0 ? `${emailCount} email${emailCount !== 1 ? "s" : ""} found` : "no emails";
    const queryPart = row.search_query ? `"${str(row.search_query)}"` : "";
    preview = [queryPart, emailSuffix, str(row.profile_url)].filter(Boolean).join(" • ");
  } else if (kind === "manage_funnel_events") {
    company = str(row.agency_name);
    email = "";
    const eventType = str(row.event_type);

    // Map event types to readable status
    if (eventType === "manage_funnel_opened") {
      status = "Funnel Opened";
    } else if (eventType === "manage_remove_started") {
      status = "Removal Intent";
    } else if (eventType === "manage_recovered") {
      status = row.recovery_type === "activate" ? "Activated" : "Kept Visible";
    } else if (eventType === "manage_remove_confirmed") {
      status = "Removed";
    } else {
      status = eventType;
    }

    const engagedLeads = Number(row.engaged_leads_count ?? 0);
    const totalInteractions = Number(row.total_interactions ?? 0);
    const recoveryType = row.recovery_type ? str(row.recovery_type) : "";
    const entryReason = row.entry_reason ? str(row.entry_reason) : "";

    const previewParts = [];
    if (engagedLeads > 0) previewParts.push(`${engagedLeads} lead${engagedLeads !== 1 ? "s" : ""}`);
    if (totalInteractions > 0) previewParts.push(`${totalInteractions} interaction${totalInteractions !== 1 ? "s" : ""}`);
    if (recoveryType) previewParts.push(`recovery: ${recoveryType}`);
    if (entryReason) previewParts.push(`reason: ${entryReason}`);

    preview = previewParts.join(" • ");
  }

  const primary_label = (() => {
    if (company && person) return `${company}||${person}`;
    return company || person || email || "";
  })();

  const rowId = str(row.id);

  const result: Record<string, unknown> = {
    kind,
    id: rowId,
    unified_id: `${kind}:${rowId}`,
    created_at: str(row.created_at),
    state_slug: str(row.state_slug),
    primary_label,
    email,
    status,
    preview,
  };

  // For availability requests, include demo flag, display_type, and agency link
  if (kind === "agency_availability_requests") {
    const isDemoRow = row.is_demo === true;
    result.is_demo = isDemoRow;
    result.display_type = isDemoRow ? "demo_availability" : "availability";
    result.target_agency_id = str(row.target_agency_id) || null;
  }

  return result;
}

function buildReplaySummary(row: Record<string, unknown>) {
  const company = str(row.agency_name ?? row.agency_slug);
  const stage = str(row.stage);

  let status = "Opened";
  if (stage === "replay_completed") status = "Completed";
  else if (stage === "replay_cta_click") status = "CTA Clicked";
  else if (stage === "replay_opened") status = "Opened";
  else if (stage) status = stage;

  const sessionId = str(row.id);
  const agencySlug = str(row.agency_slug);

  const previewParts: string[] = [];
  if (agencySlug) previewParts.push(agencySlug);
  const lastAt = str(row.last_event_at ?? row.updated_at ?? row.created_at);
  if (lastAt) {
    const diff = Date.now() - new Date(lastAt).getTime();
    const mins = Math.floor(diff / 60000);
    if (mins < 60) previewParts.push(`${mins}m ago`);
    else {
      const hrs = Math.floor(mins / 60);
      if (hrs < 24) previewParts.push(`${hrs}h ago`);
      else previewParts.push(`${Math.floor(hrs / 24)}d ago`);
    }
  }

  return {
    kind: "request_replay_events",
    id: sessionId,
    unified_id: `request_replay_events:${sessionId}`,
    created_at: str(row.created_at),
    state_slug: str(row.state_slug),
    primary_label: company || agencySlug,
    email: "",
    status,
    preview: previewParts.join(" • "),
    funnel: null,
  };
}

async function getCounts(supabase: ReturnType<typeof createClient>): Promise<Record<string, number>> {
  const counts: Record<string, number> = {};
  let demoAvailabilityCount = 0;

  await Promise.all([
    ...ALL_KINDS.map(async (kind) => {
      let query = supabase
        .from(kind)
        .select("id", { count: "exact", head: true });

      // your_agency_profile_clicks has no deleted_at column
      if (kind !== "your_agency_profile_clicks") {
        query = (query as any).is("deleted_at", null);
      }

      // For availability requests, count ONLY real (non-demo) submissions
      if (kind === "agency_availability_requests") {
        query = (query as any).eq("is_demo", false);
      }
      // For owner_demo_events, count all (they are always demo)
      // For availability, also add demo_availability count separately below

      const { count, error } = await (query as any);
      counts[kind] = error ? 0 : (count ?? 0);
    }),
    // Separate count: demo availability requests
    (async () => {
      const { count, error } = await supabase
        .from("agency_availability_requests")
        .select("id", { count: "exact", head: true })
        .is("deleted_at", null)
        .eq("is_demo", true);
      demoAvailabilityCount = error ? 0 : (count ?? 0);
      counts["demo_availability"] = demoAvailabilityCount;
    })(),
    (async () => {
      const { count, error } = await supabase
        .from("manage_funnel_events")
        .select("id", { count: "exact", head: true });
      counts["manage_funnel_events"] = error ? 0 : (count ?? 0);
    })(),
    (async () => {
      const { count, error } = await supabase
        .from("funnel_sessions")
        .select("id", { count: "exact", head: true })
        .eq("funnel_name", "request_replay");
      counts["request_replay_events"] = error ? 0 : (count ?? 0);
    })(),
  ]);

  // Unified demo count: owner_demo_events + demo_availability
  // This ensures demo availability checks appear in both "Demo" and "Demo - Availability" tabs
  counts["owner_demo_events"] = (counts["owner_demo_events"] ?? 0) + demoAvailabilityCount;

  return counts;
}

async function enrichWithFunnel(
  supabase: ReturnType<typeof createClient>,
  items: ReturnType<typeof buildSummary>[]
): Promise<(ReturnType<typeof buildSummary> & { funnel: FunnelSummary | null })[]> {
  if (items.length === 0) return items.map(i => ({ ...i, funnel: null }));

  // Build lookup keys for each item
  const emailKeys: string[] = [];
  const submissionKeys: { submission_type: string; submission_id: string }[] = [];

  for (const item of items) {
    if (item.email) {
      const funnelType = KIND_TO_FUNNEL_TYPE[item.kind as TableKind] ?? item.kind;
      emailKeys.push(`${item.email.toLowerCase()}|${funnelType}|${item.state_slug ?? ""}`);
    }
    submissionKeys.push({
      submission_type: item.kind,
      submission_id: item.id,
    });
  }

  // Fetch by lead_key (email-based match)
  const emailMatches: Record<string, Record<string, unknown>> = {};
  if (emailKeys.length > 0) {
    const { data } = await supabase
      .from("funnel_sessions")
      .select("id,lead_key,stage,last_event_at,dropoff_stage,dropoff_path,selected_offer,selected_upsell,payment_status,amount_total,currency,checkout_session_id")
      .in("lead_key", emailKeys);
    for (const row of data ?? []) {
      if (row.lead_key) emailMatches[row.lead_key as string] = row;
    }
  }

  // Fetch by submission_id
  const submissionMatches: Record<string, Record<string, unknown>> = {};
  if (submissionKeys.length > 0) {
    const ids = submissionKeys.map(k => k.submission_id);
    const { data } = await supabase
      .from("funnel_sessions")
      .select("id,submission_id,submission_type,stage,last_event_at,dropoff_stage,dropoff_path,selected_offer,selected_upsell,payment_status,amount_total,currency,checkout_session_id")
      .in("submission_id", ids);
    for (const row of data ?? []) {
      if (row.submission_id) {
        submissionMatches[`${row.submission_type}|${row.submission_id}`] = row;
      }
    }
  }

  return items.map(item => {
    const funnelType = KIND_TO_FUNNEL_TYPE[item.kind as TableKind] ?? item.kind;
    const leadKey = item.email
      ? `${item.email.toLowerCase()}|${funnelType}|${item.state_slug ?? ""}`
      : null;

    const match =
      submissionMatches[`${item.kind}|${item.id}`] ||
      (leadKey ? emailMatches[leadKey] : null) ||
      null;

    const funnel: FunnelSummary | null = match
      ? {
          session_id: String(match.id ?? ""),
          stage: match.stage as string | null,
          last_event_at: match.last_event_at as string | null,
          dropoff_stage: match.dropoff_stage as string | null,
          dropoff_path: match.dropoff_path as string | null,
          selected_offer: match.selected_offer as string | null,
          selected_upsell: match.selected_upsell as string | null,
          payment_status: match.payment_status as string | null,
          amount_total: match.amount_total as number | null,
          currency: match.currency as string | null,
          checkout_session_id: match.checkout_session_id as string | null,
        }
      : null;

    return { ...item, funnel };
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const authResult = await authenticateAdmin(req);
  if (!authResult.success) {
    return createAuthErrorResponse(authResult, corsHeaders);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

  if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    return jsonResponse({ error: "Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY" }, 500);
  }

  const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const url = new URL(req.url);
  const pathname = url.pathname;

  try {
    // ── Detail endpoint ──────────────────────────────────────────────────────
    if (pathname.endsWith("/detail")) {
      const kind = url.searchParams.get("kind");
      const id = url.searchParams.get("id");

      if (!kind) {
        return jsonResponse({ error: "Missing kind parameter" }, 400);
      }
      if (!id) {
        return jsonResponse({ error: "Missing id parameter" }, 400);
      }

      // Virtual kind: request_replay_events — backed by funnel_sessions
      if (kind === "request_replay_events") {
        const { data, error } = await supabase
          .from("funnel_sessions")
          .select("*")
          .eq("id", id)
          .eq("funnel_name", "request_replay")
          .maybeSingle();

        if (error) return jsonResponse({ error: error.message }, 500);
        if (!data) return jsonResponse({ error: "Row not found" }, 404);

        const { data: evData } = await supabase
          .from("funnel_events")
          .select("*")
          .eq("session_id", id)
          .order("created_at", { ascending: true });

        return jsonResponse({
          kind,
          id,
          row: data,
          funnel_session: data,
          timeline: evData ?? [],
        });
      }

      if (!ALL_KINDS.includes(kind as TableKind)) {
        return jsonResponse({ error: "Invalid kind parameter" }, 400);
      }

      const { data, error } = await supabase
        .from(kind)
        .select("*")
        .eq("id", id)
        .maybeSingle();

      if (error) return jsonResponse({ error: error.message }, 500);
      if (!data) return jsonResponse({ error: "Row not found" }, 404);

      // Fetch funnel session
      const funnelType = KIND_TO_FUNNEL_TYPE[kind];
      const emailRaw =
        (data as Record<string, unknown>).email ||
        (data as Record<string, unknown>).client_email ||
        (data as Record<string, unknown>).contact_email ||
        (data as Record<string, unknown>).requester_email || "";
      const stateSlug = (data as Record<string, unknown>).state_slug ?? "";
      const leadKey = emailRaw
        ? `${String(emailRaw).toLowerCase()}|${funnelType}|${stateSlug ?? ""}`
        : null;

      let sessionData: Record<string, unknown> | null = null;
      let timelineData: Record<string, unknown>[] = [];

      // Try to find funnel session
      const sessionQ = leadKey
        ? supabase.from("funnel_sessions").select("*").eq("lead_key", leadKey).maybeSingle()
        : supabase.from("funnel_sessions").select("*").eq("submission_type", kind).eq("submission_id", id).maybeSingle();
      const { data: sData } = await sessionQ;
      sessionData = sData;

      if (!sessionData) {
        const { data: sData2 } = await supabase
          .from("funnel_sessions")
          .select("*")
          .eq("submission_type", kind)
          .eq("submission_id", id)
          .maybeSingle();
        sessionData = sData2;
      }

      // Fetch timeline events
      if (sessionData?.id) {
        const { data: evData } = await supabase
          .from("funnel_events")
          .select("*")
          .eq("session_id", sessionData.id)
          .order("created_at", { ascending: true });
        timelineData = evData ?? [];
      }

      return jsonResponse({ kind, id, row: data, funnel_session: sessionData, timeline: timelineData });
    }

    // ── List endpoint ────────────────────────────────────────────────────────
    const typeParam = url.searchParams.get("type") ?? "all";
    // demo_availability is a virtual type — maps to agency_availability_requests with is_demo=true
    const isDemoAvailabilityTab = typeParam === "demo_availability";
    const isReplayTab = typeParam === "request_replay_events";
    const type = isDemoAvailabilityTab ? "agency_availability_requests" : typeParam as TableKind | "all";
    const q = url.searchParams.get("q") ?? "";
    const state = url.searchParams.get("state") ?? "";
    const from = url.searchParams.get("from") ?? "";
    const to = url.searchParams.get("to") ?? "";
    const limit = Math.min(parseInt(url.searchParams.get("limit") ?? "50"), 200);
    const offset = parseInt(url.searchParams.get("offset") ?? "0");

    const counts = await getCounts(supabase);

    const demo = url.searchParams.get("demo") ?? "0";
    // showDemo: true when explicitly requested OR when on the demo_availability virtual tab
    const showDemo = demo === "1" || isDemoAvailabilityTab;

    const applyFilters = (
      query: ReturnType<ReturnType<typeof createClient>["from"]>,
      kind: TableKind
    ) => {
      // Exclude soft-deleted rows (your_agency_profile_clicks and manage_funnel_events have no deleted_at)
      if (kind !== "your_agency_profile_clicks" && kind !== "manage_funnel_events") {
        query = (query as any).is("deleted_at", null);
      }

      if (state) query = (query as any).eq("state_slug", state);
      if (from) query = (query as any).gte("created_at", from);
      if (to) query = (query as any).lte("created_at", to);

      // For availability requests, filter by demo flag
      if (kind === "agency_availability_requests") {
        query = (query as any).eq("is_demo", showDemo);
      }

      if (q) {
        const emailCols: Record<TableKind, string> = {
          matched_leads: "client_email",
          spotlight_applications: "email",
          top25_applications: "email",
          agency_availability_requests: "client_email",
          owner_demo_events: "agency_name",
          your_agency_profile_clicks: "imported_agency_email",
          manage_funnel_events: "agency_name",
        };
        const nameCols: Record<TableKind, string> = {
          matched_leads: "client_name",
          spotlight_applications: "agency_name",
          top25_applications: "agency_name",
          agency_availability_requests: "agency_name",
          owner_demo_events: "event_name",
          your_agency_profile_clicks: "agency_name",
          manage_funnel_events: "agency_name",
        };
        const emailCol = emailCols[kind];
        const nameCol = nameCols[kind];
        query = (query as any).or(`${emailCol}.ilike.%${q}%,${nameCol}.ilike.%${q}%`);
      }
      return query;
    };

    // ── Virtual kind: request_replay_events ─────────────────────────────────
    if (isReplayTab) {
      let replayQuery: any = supabase
        .from("funnel_sessions")
        .select("*")
        .eq("funnel_name", "request_replay")
        .order("created_at", { ascending: false })
        .range(offset, offset + limit - 1);

      if (from) replayQuery = replayQuery.gte("created_at", from);
      if (to) replayQuery = replayQuery.lte("created_at", to);
      if (q) replayQuery = replayQuery.or(`agency_name.ilike.%${q}%,agency_slug.ilike.%${q}%`);

      const { data: replayData, error: replayError } = await replayQuery;
      if (replayError) return jsonResponse({ error: replayError.message }, 500);

      const items = (replayData ?? []).map((row: Record<string, unknown>) => buildReplaySummary(row));
      const counts = await getCounts(supabase);

      return jsonResponse({
        counts,
        items,
        meta: { type: "request_replay_events", limit, offset, has_more: items.length === limit },
      });
    }

    if (type !== "all") {
      const query = applyFilters(
        supabase.from(type).select("*").order("created_at", { ascending: false }).range(offset, offset + limit - 1),
        type
      );
      const { data, error } = await (query as any);
      if (error) return jsonResponse({ error: error.message }, 500);
      const summaries = (data ?? []).map((row: Record<string, unknown>) => buildSummary(type, row));
      const items = await enrichWithFunnel(supabase, summaries);
      return jsonResponse({
        counts,
        items,
        meta: { type, limit, offset, has_more: items.length === limit },
      });
    }

    const perTable = Math.ceil(limit / ALL_KINDS.length) + 5;
    const results = await Promise.all(
      ALL_KINDS.map(async (kind) => {
        const query = applyFilters(
          supabase.from(kind).select("*").order("created_at", { ascending: false }).limit(perTable),
          kind
        );
        const { data, error } = await (query as any);
        if (error) return [];
        return (data ?? []).map((row: Record<string, unknown>) => buildSummary(kind, row));
      })
    );

    const summaries = results
      .flat()
      .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
      .slice(offset, offset + limit);

    const items = await enrichWithFunnel(supabase, summaries);

    return jsonResponse({
      counts,
      items,
      meta: { type: "all", limit, offset, has_more: items.length === limit },
    });
  } catch (err) {
    console.error("[wpadmin-submissions] Unexpected error:", err);
    return jsonResponse({ error: err instanceof Error ? err.message : "Unknown error" }, 500);
  }
});
