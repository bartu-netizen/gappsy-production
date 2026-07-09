import { createClient, SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { CORS_HEADERS, requireAdminSession, extractToken } from "../_shared/adminSession.ts";

const SMARTLEAD_BASE = "https://server.smartlead.ai/api/v1";
const BATCH_SIZE = 25;
const BATCH_DELAY_MS = 1000;
const MAX_RETRIES = 4;

interface RunnerInput {
  dryRun?: boolean;
  enableCampaignDelete?: boolean;
  retryFailedOnly?: boolean;
  stateSlug?: string | null;
  listingType?: string | null;
  emailAllowlist?: string[];
}

interface SuppressionLead {
  email: string;
  email_normalized: string;
  company_name: string | null;
  state_slug: string | null;
  agency_id: string;
  paid_agency_id: string;
  paid_agency_name: string | null;
  suppression_reason?: string | null;
}

interface ResolverResponse {
  leads?: SuppressionLead[];
  matched_suppression_emails?: SuppressionLead[];
  suppressed_paid_agencies?: unknown[];
  summary?: { total_leads_suppressed?: number; identity_layer_present?: boolean };
}

interface ResolverPayload {
  leads: SuppressionLead[];
  hasIdentityLayer: boolean;
  hasMatchedEmails: boolean;
  invalidLeadCount: number;
}

interface ActionRow {
  email: string;
  agency_id: string | null;
  agency_name: string | null;
  state_slug: string | null;
  smartlead_lead_id?: string | null;
  campaign_id?: string | null;
  action_type: "fetch_lead" | "global_unsubscribe" | "fetch_campaigns" | "campaign_delete";
  status: "pending" | "success" | "failed" | "skipped" | "not_found" | "already_unsubscribed";
  error_message?: string | null;
  response_json?: unknown;
}

interface PerEmailResult {
  email: string;
  agency_name: string | null;
  state_slug: string | null;
  smartlead_lead_id: string | null;
  status: "found" | "not_found" | "already_unsubscribed" | "unsubscribed" | "would_unsubscribe" | "failed";
  campaigns_deleted: number;
  campaigns_would_delete: number;
  error: string | null;
}

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
}

function buildSmartleadUrl(path: string, params: Record<string, string> = {}): string {
  const apiKey = Deno.env.get("SMARTLEAD_API_KEY");
  if (!apiKey) throw new Error("SMARTLEAD_API_KEY not configured");
  const url = new URL(`${SMARTLEAD_BASE}${path}`);
  url.searchParams.set("api_key", apiKey);
  for (const [k, v] of Object.entries(params)) url.searchParams.set(k, v);
  return url.toString();
}

async function smartleadFetch(
  method: "GET" | "POST" | "DELETE",
  path: string,
  params: Record<string, string> = {},
  body?: unknown,
): Promise<{ ok: boolean; status: number; data: unknown; rawText: string }> {
  let lastErr: { ok: false; status: number; data: unknown; rawText: string } | null = null;
  for (let attempt = 0; attempt < MAX_RETRIES; attempt++) {
    try {
      const url = buildSmartleadUrl(path, params);
      const init: RequestInit = {
        method,
        headers: { "Content-Type": "application/json" },
      };
      if (body !== undefined) init.body = JSON.stringify(body);
      const res = await fetch(url, init);
      const text = await res.text();
      let parsed: unknown = null;
      try { parsed = text ? JSON.parse(text) : null; } catch { parsed = text; }
      if (res.status === 429) {
        const backoff = Math.min(15000, 500 * Math.pow(2, attempt));
        console.log(`[smartlead-suppression-runner] 429 on ${method} ${path} attempt=${attempt + 1} backoff=${backoff}ms`);
        await new Promise((r) => setTimeout(r, backoff));
        lastErr = { ok: false, status: 429, data: parsed, rawText: text };
        continue;
      }
      if (!res.ok) {
        return { ok: false, status: res.status, data: parsed, rawText: text };
      }
      return { ok: true, status: res.status, data: parsed, rawText: text };
    } catch (e) {
      const backoff = Math.min(15000, 500 * Math.pow(2, attempt));
      console.log(`[smartlead-suppression-runner] network error attempt=${attempt + 1}: ${(e as Error).message}`);
      await new Promise((r) => setTimeout(r, backoff));
      lastErr = { ok: false, status: 0, data: null, rawText: (e as Error).message };
    }
  }
  return lastErr ?? { ok: false, status: 0, data: null, rawText: "max retries exceeded" };
}

function extractLeadId(raw: unknown, targetEmail: string): string | null {
  if (!raw) return null;
  const norm = targetEmail.trim().toLowerCase();

  const tryItem = (item: unknown): string | null => {
    if (!item || typeof item !== "object") return null;
    const obj = item as Record<string, unknown>;
    const itemEmail = typeof obj.email === "string" ? obj.email.trim().toLowerCase() : null;
    if (itemEmail && itemEmail !== norm) return null;
    const id = obj.id ?? obj.lead_id ?? obj.leadId;
    if (id != null) return String(id);
    return null;
  };

  if (Array.isArray(raw)) {
    for (const item of raw) {
      const id = tryItem(item);
      if (id) return id;
    }
    return null;
  }

  if (typeof raw === "object") {
    const obj = raw as Record<string, unknown>;
    const direct = tryItem(obj);
    if (direct) return direct;
    const data = obj.data;
    if (Array.isArray(data)) {
      for (const item of data) {
        const id = tryItem(item);
        if (id) return id;
      }
    } else if (data && typeof data === "object") {
      const id = tryItem(data);
      if (id) return id;
    }
  }
  return null;
}

function alreadyUnsubscribed(raw: unknown): boolean {
  if (!raw || typeof raw !== "object") return false;
  const obj = raw as Record<string, unknown>;
  const flat = JSON.stringify(obj).toLowerCase();
  if (flat.includes("already") && flat.includes("unsubscrib")) return true;
  if (obj.is_unsubscribed === true) return true;
  if (obj.unsubscribed === true) return true;
  return false;
}

function extractCampaignIds(raw: unknown): string[] {
  if (!raw) return [];
  const ids = new Set<string>();
  const visit = (v: unknown) => {
    if (!v) return;
    if (Array.isArray(v)) {
      for (const item of v) visit(item);
      return;
    }
    if (typeof v === "object") {
      const obj = v as Record<string, unknown>;
      const cid = obj.campaign_id ?? obj.campaignId ?? (obj.campaign && typeof obj.campaign === "object" ? (obj.campaign as Record<string, unknown>).id : undefined) ?? obj.id;
      if (cid != null && (typeof cid === "number" || typeof cid === "string")) {
        ids.add(String(cid));
      }
      const data = obj.data;
      if (data) visit(data);
      const campaigns = obj.campaigns;
      if (campaigns) visit(campaigns);
    }
  };
  visit(raw);
  return Array.from(ids);
}

async function fetchSuppressionPayload(req: Request, input: RunnerInput): Promise<ResolverPayload> {
  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const params = new URLSearchParams();
  params.set("include_fuzzy", "false");
  if (input.stateSlug) params.set("state_slug", input.stateSlug);
  if (input.listingType) params.set("listing_type", input.listingType);

  const adminToken = extractToken(req);
  const url = `${supabaseUrl}/functions/v1/customer-suppression-resolver?${params.toString()}`;
  const res = await fetch(url, {
    headers: {
      "Content-Type": "application/json",
      "x-admin-token": adminToken ?? "",
      "Authorization": `Bearer ${Deno.env.get("SUPABASE_ANON_KEY") ?? ""}`,
      "apikey": Deno.env.get("SUPABASE_ANON_KEY") ?? "",
    },
  });
  if (!res.ok) {
    const txt = await res.text().catch(() => "");
    throw new Error(`customer-suppression-resolver returned ${res.status}: ${txt.slice(0, 200)}`);
  }
  const json = (await res.json()) as ResolverResponse;
  const matched = Array.isArray(json.matched_suppression_emails) ? json.matched_suppression_emails : null;
  const legacy = Array.isArray(json.leads) ? json.leads : null;
  const leads = (matched ?? legacy ?? []) as SuppressionLead[];
  const hasIdentityLayer =
    Array.isArray(json.suppressed_paid_agencies) && json.summary?.identity_layer_present === true;
  const hasMatchedEmails = matched !== null;
  let invalidLeadCount = 0;
  for (const l of leads) {
    if (!l.paid_agency_id || !l.suppression_reason) invalidLeadCount++;
  }
  return { leads, hasIdentityLayer, hasMatchedEmails, invalidLeadCount };
}

async function fetchFailedEmails(supabase: SupabaseClient, dryRun: boolean): Promise<Set<string>> {
  const set = new Set<string>();
  const { data, error } = await supabase
    .from("smartlead_suppression_actions")
    .select("email")
    .eq("status", "failed")
    .eq("dry_run", dryRun)
    .order("created_at", { ascending: false })
    .limit(5000);
  if (error) {
    console.error("[smartlead-suppression-runner] retry-failed lookup error:", error.message);
    return set;
  }
  for (const r of data ?? []) {
    if (r.email) set.add(String(r.email).toLowerCase());
  }
  return set;
}

async function logActions(
  supabase: SupabaseClient,
  runId: string,
  rows: ActionRow[],
  dryRun: boolean,
): Promise<void> {
  if (rows.length === 0) return;
  const inserts = rows.map((r) => ({
    run_id: runId,
    agency_id: r.agency_id,
    agency_name: r.agency_name,
    state_slug: r.state_slug,
    email: r.email,
    smartlead_lead_id: r.smartlead_lead_id ?? null,
    campaign_id: r.campaign_id ?? null,
    action_type: r.action_type,
    status: r.status,
    error_message: r.error_message ?? null,
    response_json: r.response_json ?? null,
    dry_run: dryRun,
  }));
  const { error } = await supabase.from("smartlead_suppression_actions").insert(inserts);
  if (error) console.error("[smartlead-suppression-runner] log insert error:", error.message);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }
  if (req.method !== "POST") {
    return jsonResponse({ error: "Method not allowed" }, 405);
  }

  try {
    await requireAdminSession(req);
  } catch (e) {
    return jsonResponse({ error: (e as Error).message }, 401);
  }

  const apiKey = Deno.env.get("SMARTLEAD_API_KEY");
  if (!apiKey) return jsonResponse({ error: "SMARTLEAD_API_KEY not configured" }, 500);

  let body: RunnerInput;
  try {
    body = (await req.json()) as RunnerInput;
  } catch {
    body = {};
  }

  const dryRun = body.dryRun !== false;
  const enableCampaignDelete = body.enableCampaignDelete === true;
  const retryFailedOnly = body.retryFailedOnly === true;
  const stateSlug = body.stateSlug ?? null;
  const listingType = body.listingType ?? null;
  const emailAllowlist = new Set<string>(
    Array.isArray(body.emailAllowlist)
      ? body.emailAllowlist
          .map((e) => (typeof e === "string" ? e.trim().toLowerCase() : ""))
          .filter((e) => e.length > 0)
      : [],
  );

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const supabaseKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, supabaseKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const runId = crypto.randomUUID();
  console.log(`[smartlead-suppression-runner] runId=${runId} dryRun=${dryRun} enableCampaignDelete=${enableCampaignDelete} retryFailedOnly=${retryFailedOnly} stateSlug=${stateSlug ?? ""} listingType=${listingType ?? ""}`);

  let payload: ResolverPayload;
  try {
    payload = await fetchSuppressionPayload(req, { stateSlug, listingType });
  } catch (e) {
    return jsonResponse({ error: `Failed to load suppression leads: ${(e as Error).message}` }, 500);
  }

  if (!dryRun) {
    if (!payload.hasIdentityLayer || !payload.hasMatchedEmails) {
      return jsonResponse(
        {
          error: "Customer suppression identity layer missing. Refusing live Smartlead run.",
          identity_layer_present: payload.hasIdentityLayer,
          matched_suppression_emails_present: payload.hasMatchedEmails,
        },
        409,
      );
    }
    if (payload.invalidLeadCount > 0) {
      return jsonResponse(
        {
          error: "Customer suppression identity layer missing. Refusing live Smartlead run.",
          reason: `${payload.invalidLeadCount} matched email(s) missing paid_agency_id or suppression_reason`,
        },
        409,
      );
    }
  }

  const allLeads = payload.leads;
  let leads = allLeads;
  if (retryFailedOnly) {
    const failedSet = await fetchFailedEmails(supabase, dryRun);
    leads = leads.filter((l) => failedSet.has(l.email_normalized) || failedSet.has(l.email.toLowerCase()));
  }

  let total_skipped_by_email_allowlist = 0;
  if (emailAllowlist.size > 0) {
    const before = leads.length;
    leads = leads.filter((l) =>
      emailAllowlist.has(l.email_normalized) || emailAllowlist.has(l.email.toLowerCase())
    );
    total_skipped_by_email_allowlist = before - leads.length;
  }

  const totals = {
    total: leads.length,
    found: 0,
    not_found: 0,
    already_unsubscribed: 0,
    unsubscribed: 0,
    would_unsubscribe: 0,
    would_delete_from_campaigns: 0,
    campaigns_deleted: 0,
    failed: 0,
    total_skipped_by_email_allowlist,
  };

  const perEmail: PerEmailResult[] = [];

  for (let i = 0; i < leads.length; i += BATCH_SIZE) {
    const batch = leads.slice(i, i + BATCH_SIZE);
    const actionLogs: ActionRow[] = [];

    for (const lead of batch) {
      const result: PerEmailResult = {
        email: lead.email,
        agency_name: lead.paid_agency_name ?? lead.company_name,
        state_slug: lead.state_slug,
        smartlead_lead_id: null,
        status: "not_found",
        campaigns_deleted: 0,
        campaigns_would_delete: 0,
        error: null,
      };

      const baseRow = {
        email: lead.email,
        agency_id: lead.paid_agency_id ?? lead.agency_id,
        agency_name: lead.paid_agency_name ?? lead.company_name,
        state_slug: lead.state_slug,
      };

      const lookup = await smartleadFetch("GET", "/leads/", { email: lead.email });
      if (!lookup.ok && lookup.status !== 404) {
        actionLogs.push({
          ...baseRow,
          action_type: "fetch_lead",
          status: "failed",
          error_message: `HTTP ${lookup.status}: ${lookup.rawText.slice(0, 300)}`,
          response_json: lookup.data,
        });
        result.status = "failed";
        result.error = `lookup_failed:${lookup.status}`;
        totals.failed++;
        perEmail.push(result);
        continue;
      }

      const leadId = extractLeadId(lookup.data, lead.email);
      if (!leadId) {
        actionLogs.push({
          ...baseRow,
          action_type: "fetch_lead",
          status: "not_found",
          response_json: lookup.data,
        });
        result.status = "not_found";
        totals.not_found++;
        perEmail.push(result);
        continue;
      }

      result.smartlead_lead_id = leadId;
      totals.found++;

      const fetchLeadStatus: ActionRow["status"] = alreadyUnsubscribed(lookup.data)
        ? "already_unsubscribed"
        : "success";

      actionLogs.push({
        ...baseRow,
        smartlead_lead_id: leadId,
        action_type: "fetch_lead",
        status: fetchLeadStatus,
        response_json: lookup.data,
      });

      if (fetchLeadStatus === "already_unsubscribed") {
        result.status = "already_unsubscribed";
        totals.already_unsubscribed++;
        perEmail.push(result);
        continue;
      }

      if (dryRun) {
        actionLogs.push({
          ...baseRow,
          smartlead_lead_id: leadId,
          action_type: "global_unsubscribe",
          status: "skipped",
          error_message: "dry_run",
        });
        result.status = "would_unsubscribe";
        totals.would_unsubscribe++;

        if (enableCampaignDelete) {
          const campaigns = await smartleadFetch("GET", `/leads/${leadId}/campaigns`);
          const cids = campaigns.ok ? extractCampaignIds(campaigns.data) : [];
          actionLogs.push({
            ...baseRow,
            smartlead_lead_id: leadId,
            action_type: "fetch_campaigns",
            status: campaigns.ok ? "success" : "failed",
            error_message: campaigns.ok ? null : `HTTP ${campaigns.status}`,
            response_json: campaigns.data,
          });
          result.campaigns_would_delete = cids.length;
          totals.would_delete_from_campaigns += cids.length;
          for (const cid of cids) {
            actionLogs.push({
              ...baseRow,
              smartlead_lead_id: leadId,
              campaign_id: cid,
              action_type: "campaign_delete",
              status: "skipped",
              error_message: "dry_run",
            });
          }
        }
        perEmail.push(result);
        continue;
      }

      const unsub = await smartleadFetch("POST", `/leads/${leadId}/unsubscribe`, {}, {});
      if (!unsub.ok) {
        actionLogs.push({
          ...baseRow,
          smartlead_lead_id: leadId,
          action_type: "global_unsubscribe",
          status: "failed",
          error_message: `HTTP ${unsub.status}: ${unsub.rawText.slice(0, 300)}`,
          response_json: unsub.data,
        });
        result.status = "failed";
        result.error = `unsubscribe_failed:${unsub.status}`;
        totals.failed++;
        perEmail.push(result);
        continue;
      }

      actionLogs.push({
        ...baseRow,
        smartlead_lead_id: leadId,
        action_type: "global_unsubscribe",
        status: "success",
        response_json: unsub.data,
      });
      result.status = "unsubscribed";
      totals.unsubscribed++;

      if (enableCampaignDelete) {
        const campaigns = await smartleadFetch("GET", `/leads/${leadId}/campaigns`);
        actionLogs.push({
          ...baseRow,
          smartlead_lead_id: leadId,
          action_type: "fetch_campaigns",
          status: campaigns.ok ? "success" : "failed",
          error_message: campaigns.ok ? null : `HTTP ${campaigns.status}`,
          response_json: campaigns.data,
        });
        if (campaigns.ok) {
          const cids = extractCampaignIds(campaigns.data);
          for (const cid of cids) {
            const del = await smartleadFetch("DELETE", `/campaigns/${cid}/leads/${leadId}`);
            actionLogs.push({
              ...baseRow,
              smartlead_lead_id: leadId,
              campaign_id: cid,
              action_type: "campaign_delete",
              status: del.ok ? "success" : "failed",
              error_message: del.ok ? null : `HTTP ${del.status}: ${del.rawText.slice(0, 200)}`,
              response_json: del.data,
            });
            if (del.ok) {
              result.campaigns_deleted++;
              totals.campaigns_deleted++;
            }
          }
        }
      }

      perEmail.push(result);
    }

    await logActions(supabase, runId, actionLogs, dryRun);

    if (i + BATCH_SIZE < leads.length) {
      await new Promise((r) => setTimeout(r, BATCH_DELAY_MS));
    }
  }

  return jsonResponse({
    ok: true,
    run_id: runId,
    dry_run: dryRun,
    enable_campaign_delete: enableCampaignDelete,
    retry_failed_only: retryFailedOnly,
    filters: { state_slug: stateSlug, listing_type: listingType },
    totals,
    per_email: perEmail,
  });
});
