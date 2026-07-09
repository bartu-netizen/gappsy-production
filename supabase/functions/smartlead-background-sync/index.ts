import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";
import {
  listCampaigns,
  normalizeCampaignWithStats,
} from "../_shared/smartleadClient.ts";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token",
};

interface SyncRequest {
  sync_campaigns?: boolean;
  compute_rollups?: boolean;
  compute_campaign_stats?: boolean;
}

interface SyncReport {
  ok: boolean;
  sync_campaigns?: { ok: boolean; upserted: number; duration_ms: number; error?: string };
  compute_rollups?: { ok: boolean; agencies_updated: number; duration_ms: number; error?: string };
  compute_campaign_stats?: { ok: boolean; campaigns_updated: number; duration_ms: number; error?: string };
  total_duration_ms: number;
}

async function syncCampaigns(supabase: any): Promise<{ ok: boolean; upserted: number; duration_ms: number; error?: string }> {
  const t0 = Date.now();
  try {
    const rawCampaigns = await listCampaigns();
    if (!Array.isArray(rawCampaigns) || rawCampaigns.length === 0) {
      await upsertSyncHealth(supabase, "campaigns", "ok", 0, Date.now() - t0, null, { note: "no campaigns returned from API" });
      return { ok: true, upserted: 0, duration_ms: Date.now() - t0 };
    }

    const rows = rawCampaigns.map((c: any) => {
      const norm = normalizeCampaignWithStats(c, "campaign_list");
      return {
        campaign_id: String(c.id),
        name: c.name || null,
        status: c.status || null,
        created_at_provider: c.created_at || null,
        lead_count: typeof c.lead_count === "number" ? c.lead_count : null,
        mailbox_count: typeof c.mailbox_count === "number" ? c.mailbox_count : null,
        provider_sent: norm.provider_sent ?? 0,
        provider_opened: norm.provider_opened ?? 0,
        provider_clicked: norm.provider_clicked ?? 0,
        provider_replied: norm.provider_replied ?? 0,
        provider_bounced: norm.provider_bounced ?? 0,
        provider_unsubscribed: 0,
        provider_leads_total: norm.provider_leads_total ?? null,
        provider_stats_source: norm.provider_stats_source ?? null,
        raw_campaign: c,
        last_synced_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      };
    });

    const CHUNK = 100;
    let totalUpserted = 0;
    for (let i = 0; i < rows.length; i += CHUNK) {
      const chunk = rows.slice(i, i + CHUNK);
      const { error } = await supabase
        .from("smartlead_campaigns")
        .upsert(chunk, { onConflict: "campaign_id" });
      if (error) throw error;
      totalUpserted += chunk.length;
    }

    const duration = Date.now() - t0;
    await upsertSyncHealth(supabase, "campaigns", "ok", totalUpserted, duration, null, {
      campaign_count: rawCampaigns.length,
    });
    return { ok: true, upserted: totalUpserted, duration_ms: duration };
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    const duration = Date.now() - t0;
    await upsertSyncHealth(supabase, "campaigns", "error", 0, duration, message, null);
    return { ok: false, upserted: 0, duration_ms: duration, error: message };
  }
}

async function computeRollups(supabase: any): Promise<{ ok: boolean; agencies_updated: number; duration_ms: number; error?: string }> {
  const t0 = Date.now();
  try {
    const { data: syncedRows, error: syncErr } = await supabase
      .from("smartlead_campaign_email_sync")
      .select("agency_id, campaign_id")
      .not("agency_id", "is", null);

    if (syncErr) throw syncErr;

    const EVENT_PAGE = 1000;
    let offset = 0;
    const agencyEvents: Map<string, {
      sent: number; opened: number; clicked: number; replied: number;
      bounced: number; unsubscribed: number;
      last_event_type: string | null; last_event_at: string | null;
      first_at: string | null;
    }> = new Map();

    while (true) {
      const { data: events, error: evErr } = await supabase
        .from("smartlead_lead_events")
        .select("agency_id, event_type, event_at")
        .not("agency_id", "is", null)
        .order("event_at", { ascending: false })
        .range(offset, offset + EVENT_PAGE - 1);

      if (evErr) throw evErr;
      if (!events || events.length === 0) break;

      for (const ev of events) {
        if (!ev.agency_id) continue;
        if (!agencyEvents.has(ev.agency_id)) {
          agencyEvents.set(ev.agency_id, {
            sent: 0, opened: 0, clicked: 0, replied: 0,
            bounced: 0, unsubscribed: 0,
            last_event_type: null, last_event_at: null, first_at: null,
          });
        }
        const agg = agencyEvents.get(ev.agency_id)!;
        const t = (ev.event_type || "").toLowerCase();
        if (t.includes("sent")) agg.sent++;
        if (t.includes("opened") || t === "opened") agg.opened++;
        if (t.includes("clicked") || t === "clicked") agg.clicked++;
        if (t === "replied" || t.includes("replied")) agg.replied++;
        if (t === "bounced" || t.includes("bounced")) agg.bounced++;
        if (t === "unsubscribed" || t.includes("unsub")) agg.unsubscribed++;
        if (!agg.last_event_at || ev.event_at > agg.last_event_at) {
          agg.last_event_at = ev.event_at;
          agg.last_event_type = ev.event_type;
        }
        if (!agg.first_at || ev.event_at < agg.first_at) {
          agg.first_at = ev.event_at;
        }
      }

      if (events.length < EVENT_PAGE) break;
      offset += EVENT_PAGE;
    }

    const agencySynced: Map<string, { count: number; campaigns: Set<string> }> = new Map();
    for (const row of syncedRows || []) {
      if (!row.agency_id) continue;
      if (!agencySynced.has(row.agency_id)) {
        agencySynced.set(row.agency_id, { count: 0, campaigns: new Set() });
      }
      const agg = agencySynced.get(row.agency_id)!;
      agg.count++;
      if (row.campaign_id) agg.campaigns.add(row.campaign_id);
    }

    const allAgencyIds = new Set([
      ...agencySynced.keys(),
      ...agencyEvents.keys(),
    ]);

    const now = new Date().toISOString();
    const rollupRows = Array.from(allAgencyIds).map((agencyId) => {
      const sync = agencySynced.get(agencyId);
      const evts = agencyEvents.get(agencyId);
      return {
        agency_id: agencyId,
        campaigns_contacted: sync?.campaigns.size ?? 0,
        emails_synced: sync?.count ?? 0,
        emails_sent: evts?.sent ?? 0,
        emails_opened: evts?.opened ?? 0,
        emails_clicked: evts?.clicked ?? 0,
        emails_replied: evts?.replied ?? 0,
        emails_bounced: evts?.bounced ?? 0,
        emails_unsubscribed: evts?.unsubscribed ?? 0,
        last_event_type: evts?.last_event_type ?? null,
        last_event_at: evts?.last_event_at ?? null,
        first_contacted_at: evts?.first_at ?? null,
        computed_at: now,
        updated_at: now,
      };
    });

    const CHUNK = 200;
    let totalUpdated = 0;
    for (let i = 0; i < rollupRows.length; i += CHUNK) {
      const chunk = rollupRows.slice(i, i + CHUNK);
      const { error: upsErr } = await supabase
        .from("smartlead_agency_rollups")
        .upsert(chunk, { onConflict: "agency_id" });
      if (upsErr) throw upsErr;
      totalUpdated += chunk.length;
    }

    const duration = Date.now() - t0;
    await upsertSyncHealth(supabase, "rollups", "ok", totalUpdated, duration, null, {
      agencies_with_sync: agencySynced.size,
      agencies_with_events: agencyEvents.size,
    });
    return { ok: true, agencies_updated: totalUpdated, duration_ms: duration };
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    const duration = Date.now() - t0;
    await upsertSyncHealth(supabase, "rollups", "error", 0, duration, message, null);
    return { ok: false, agencies_updated: 0, duration_ms: duration, error: message };
  }
}

async function computeCampaignStats(supabase: any): Promise<{ ok: boolean; campaigns_updated: number; duration_ms: number; error?: string }> {
  const t0 = Date.now();
  try {
    // Step 1: Provider email totals from cached campaign rows
    const { data: campaigns, error: campErr } = await supabase
      .from("smartlead_campaigns")
      .select("campaign_id, provider_sent, provider_opened, provider_replied");
    if (campErr) throw campErr;
    if (!campaigns || campaigns.length === 0) {
      return { ok: true, campaigns_updated: 0, duration_ms: Date.now() - t0 };
    }

    // Step 2: Unique agencies contacted per campaign (via direct agency_id link)
    const { data: contactedRows, error: contactErr } = await supabase
      .from("smartlead_campaign_email_sync")
      .select("campaign_id, agency_id")
      .not("agency_id", "is", null);
    if (contactErr) throw contactErr;

    // Step 3: Domain fallback — emails without agency_id, resolved via other_agency_emails
    const { data: unlinkedRows, error: unlinkedErr } = await supabase
      .from("smartlead_campaign_email_sync")
      .select("campaign_id, email_normalized")
      .is("agency_id", null)
      .not("email_normalized", "is", null);
    if (unlinkedErr) throw unlinkedErr;

    const unlinkedEmails = [...new Set(
      (unlinkedRows || []).map((r: any) => r.email_normalized).filter(Boolean)
    )] as string[];

    const emailToAgency = new Map<string, string>();
    const BATCH = 500;
    for (let i = 0; i < unlinkedEmails.length; i += BATCH) {
      const slice = unlinkedEmails.slice(i, i + BATCH);
      const { data: matched } = await supabase
        .from("other_agency_emails")
        .select("email_normalized, agency_id")
        .in("email_normalized", slice)
        .not("agency_id", "is", null);
      for (const row of (matched || [])) {
        if (row.email_normalized && row.agency_id) {
          emailToAgency.set(row.email_normalized, row.agency_id);
        }
      }
    }

    // Step 4: Build campaign → Set<agency_id> for "contacted"
    const contactedMap = new Map<string, Set<string>>();
    for (const row of (contactedRows || [])) {
      if (!row.campaign_id || !row.agency_id) continue;
      if (!contactedMap.has(row.campaign_id)) contactedMap.set(row.campaign_id, new Set());
      contactedMap.get(row.campaign_id)!.add(row.agency_id);
    }
    // Merge domain-fallback contacts
    for (const row of (unlinkedRows || [])) {
      const agencyId = emailToAgency.get(row.email_normalized);
      if (!agencyId || !row.campaign_id) continue;
      if (!contactedMap.has(row.campaign_id)) contactedMap.set(row.campaign_id, new Set());
      contactedMap.get(row.campaign_id)!.add(agencyId);
    }

    // Step 5: Unique agencies opened per campaign (from lead events)
    const { data: openRows, error: openErr } = await supabase
      .from("smartlead_lead_events")
      .select("campaign_id, agency_id")
      .in("event_type", ["opened", "email_opened"])
      .not("agency_id", "is", null);
    if (openErr) throw openErr;

    const openedMap = new Map<string, Set<string>>();
    for (const row of (openRows || [])) {
      if (!row.campaign_id || !row.agency_id) continue;
      if (!openedMap.has(row.campaign_id)) openedMap.set(row.campaign_id, new Set());
      openedMap.get(row.campaign_id)!.add(row.agency_id);
    }

    // Step 6: Unique agencies replied per campaign
    const { data: replyRows, error: replyErr } = await supabase
      .from("smartlead_lead_events")
      .select("campaign_id, agency_id")
      .eq("event_type", "replied")
      .not("agency_id", "is", null);
    if (replyErr) throw replyErr;

    const repliedMap = new Map<string, Set<string>>();
    for (const row of (replyRows || [])) {
      if (!row.campaign_id || !row.agency_id) continue;
      if (!repliedMap.has(row.campaign_id)) repliedMap.set(row.campaign_id, new Set());
      repliedMap.get(row.campaign_id)!.add(row.agency_id);
    }

    // Step 7: Build upsert rows
    const now = new Date().toISOString();
    const statsRows = campaigns.map((c: any) => {
      const cid = String(c.campaign_id);
      return {
        campaign_id: cid,
        total_sent:    c.provider_sent    ?? 0,
        total_opened:  c.provider_opened  ?? 0,
        total_replied: c.provider_replied ?? 0,
        unique_agencies_contacted: contactedMap.get(cid)?.size ?? 0,
        unique_agencies_opened:    openedMap.get(cid)?.size    ?? 0,
        unique_agencies_replied:   repliedMap.get(cid)?.size   ?? 0,
        computed_at: now,
        updated_at:  now,
      };
    });

    const CHUNK = 100;
    let totalUpdated = 0;
    for (let i = 0; i < statsRows.length; i += CHUNK) {
      const chunk = statsRows.slice(i, i + CHUNK);
      const { error: upsErr } = await supabase
        .from("campaign_stats")
        .upsert(chunk, { onConflict: "campaign_id" });
      if (upsErr) throw upsErr;
      totalUpdated += chunk.length;
    }

    const duration = Date.now() - t0;
    await upsertSyncHealth(supabase, "campaign_stats", "ok", totalUpdated, duration, null, {
      campaigns_count: campaigns.length,
      unlinked_resolved: emailToAgency.size,
    });
    return { ok: true, campaigns_updated: totalUpdated, duration_ms: duration };
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    const duration = Date.now() - t0;
    await upsertSyncHealth(supabase, "campaign_stats", "error", 0, duration, message, null);
    return { ok: false, campaigns_updated: 0, duration_ms: duration, error: message };
  }
}

async function upsertSyncHealth(
  supabase: any,
  syncType: string,
  status: string,
  recordsProcessed: number,
  durationMs: number,
  lastError: string | null,
  extraInfo: Record<string, any> | null,
) {
  const now = new Date().toISOString();
  const row: Record<string, any> = {
    sync_type: syncType,
    last_run_at: now,
    records_processed: recordsProcessed,
    duration_ms: durationMs,
    status,
    last_error: lastError,
    extra_info: extraInfo,
    updated_at: now,
  };
  if (status === "ok") row.last_success_at = now;

  await supabase
    .from("smartlead_sync_health")
    .upsert(row, { onConflict: "sync_type" });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ ok: false, error: "POST required" }),
        { status: 405, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } },
      );
    }

    await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, serviceRoleKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const body: SyncRequest = await req.json().catch(() => ({}));
    const syncCampaignsFlag     = body.sync_campaigns        !== false;
    const computeRollupsFlag    = body.compute_rollups       !== false;
    const computeStatsFlag      = body.compute_campaign_stats !== false;

    const t0 = Date.now();
    const report: SyncReport = { ok: true, total_duration_ms: 0 };

    if (syncCampaignsFlag) {
      console.log("[smartlead-background-sync] syncing campaigns...");
      report.sync_campaigns = await syncCampaigns(supabase);
      if (!report.sync_campaigns.ok) report.ok = false;
    }

    if (computeRollupsFlag) {
      console.log("[smartlead-background-sync] computing rollups...");
      report.compute_rollups = await computeRollups(supabase);
      if (!report.compute_rollups.ok) report.ok = false;
    }

    if (computeStatsFlag) {
      console.log("[smartlead-background-sync] computing campaign stats...");
      report.compute_campaign_stats = await computeCampaignStats(supabase);
      if (!report.compute_campaign_stats.ok) report.ok = false;
    }

    report.total_duration_ms = Date.now() - t0;
    console.log("[smartlead-background-sync] complete", report);

    return new Response(
      JSON.stringify(report),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } },
    );
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-background-sync] error:", message);
    return new Response(
      JSON.stringify({ ok: false, error: message }),
      {
        status: message.includes("Unauthorized") ? 401 : 500,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      },
    );
  }
});
