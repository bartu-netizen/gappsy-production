import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";
import {
  listCampaigns,
  getCampaign,
  normalizeCampaignWithStats,
  extractCampaignStats,
  getCampaignStatistics,
  getCampaignLeadStats,
  type NormalizedCampaignWithStats,
} from "../_shared/smartleadClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-supabase-auth, Accept, Origin",
};

function rowToNormalized(row: Record<string, any>): NormalizedCampaignWithStats {
  return {
    campaign_id: row.campaign_id,
    name: row.name,
    status: row.status,
    created_at: row.created_at_provider,
    updated_at: null,
    lead_count: row.lead_count,
    mailbox_count: row.mailbox_count,
    provider_sent: row.provider_sent,
    provider_opened: row.provider_opened,
    provider_clicked: row.provider_clicked,
    provider_replied: row.provider_replied,
    provider_bounced: row.provider_bounced,
    provider_sender_bounced: null,
    provider_leads_total: row.provider_leads_total,
    provider_positive_reply: null,
    provider_stats_source: row.provider_stats_source ?? "local_cache",
  } as NormalizedCampaignWithStats;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, serviceRoleKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const url = new URL(req.url);
    const campaignId = url.searchParams.get("campaign_id");
    const forceRefresh = url.searchParams.get("force_refresh") === "true";

    // ── Single campaign detail ────────────────────────────────────────────────
    if (campaignId) {
      // Try local cache first (unless force_refresh)
      if (!forceRefresh) {
        const { data: cached } = await supabase
          .from("smartlead_campaigns")
          .select("*")
          .eq("campaign_id", campaignId)
          .maybeSingle();

        if (cached) {
          return new Response(
            JSON.stringify({ ok: true, campaign: rowToNormalized(cached), source: "local_cache" }),
            { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } },
          );
        }
      }

      // Fall back to live API
      const campaign = await getCampaign(campaignId);
      if (!campaign) {
        return new Response(
          JSON.stringify({ ok: false, error: "Campaign not found" }),
          { status: 404, headers: { ...corsHeaders, "Content-Type": "application/json" } },
        );
      }

      let normalized = normalizeCampaignWithStats(campaign, "campaign_detail");

      const hasStats =
        normalized.provider_sent !== undefined ||
        normalized.provider_opened !== undefined ||
        normalized.provider_replied !== undefined;

      if (!hasStats) {
        try {
          const statsData = await getCampaignStatistics(campaignId);
          normalized = {
            ...normalized,
            provider_sent: statsData.sent ?? normalized.provider_sent,
            provider_opened: statsData.opens ?? normalized.provider_opened,
            provider_replied: statsData.replies ?? normalized.provider_replied,
            provider_bounced: statsData.bounces ?? normalized.provider_bounced,
            provider_positive_reply: statsData.positive_reply ?? normalized.provider_positive_reply,
            provider_sender_bounced: statsData.sender_bounced ?? normalized.provider_sender_bounced,
            provider_leads_total: statsData.leads_total ?? normalized.provider_leads_total,
            provider_stats_source: "statistics_endpoint",
          };
        } catch {
          try {
            const leadStats = await getCampaignLeadStats(campaignId);
            normalized = {
              ...normalized,
              provider_sent: leadStats.sent ?? normalized.provider_sent,
              provider_opened: leadStats.opens ?? normalized.provider_opened,
              provider_replied: leadStats.replies ?? normalized.provider_replied,
              provider_bounced: leadStats.bounces ?? normalized.provider_bounced,
              provider_leads_total: leadStats.leads_total ?? normalized.provider_leads_total,
              provider_stats_source: "lead_stats_endpoint",
            };
          } catch {
            // proceed with what we have
          }
        }
      }

      // Cache the result locally
      EdgeRuntime.waitUntil(
        supabase.from("smartlead_campaigns").upsert({
          campaign_id: String(campaign.id),
          name: campaign.name,
          status: campaign.status,
          created_at_provider: campaign.created_at,
          provider_sent: normalized.provider_sent ?? 0,
          provider_opened: normalized.provider_opened ?? 0,
          provider_clicked: normalized.provider_clicked ?? 0,
          provider_replied: normalized.provider_replied ?? 0,
          provider_bounced: normalized.provider_bounced ?? 0,
          provider_leads_total: normalized.provider_leads_total ?? null,
          provider_stats_source: normalized.provider_stats_source ?? null,
          raw_campaign: campaign,
          last_synced_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        }, { onConflict: "campaign_id" }),
      );

      return new Response(
        JSON.stringify({ ok: true, campaign: normalized, source: "live_api" }),
        { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    // ── Campaign list ─────────────────────────────────────────────────────────
    // Read from local cache unless empty or force_refresh requested
    if (!forceRefresh) {
      const { data: cached, error: cacheErr } = await supabase
        .from("smartlead_campaigns")
        .select("*")
        .order("last_synced_at", { ascending: false });

      if (!cacheErr && cached && cached.length > 0) {
        const campaigns = cached.map(rowToNormalized);
        return new Response(
          JSON.stringify({ ok: true, campaigns, source: "local_cache", cached_count: cached.length }),
          { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } },
        );
      }
    }

    // Fall back to live Smartlead API
    const rawCampaigns = await listCampaigns();

    const campaigns: NormalizedCampaignWithStats[] = rawCampaigns.map((c: any) => {
      const normalized = normalizeCampaignWithStats(c, "campaign_list");
      return {
        campaign_id: String(c.id),
        name: c.name,
        status: c.status,
        created_at: c.created_at,
        updated_at: c.updated_at,
        lead_count: typeof c.lead_count === "number" ? c.lead_count : undefined,
        mailbox_count: typeof c.mailbox_count === "number" ? c.mailbox_count : undefined,
        provider_sent: normalized.provider_sent,
        provider_opened: normalized.provider_opened,
        provider_replied: normalized.provider_replied,
        provider_positive_reply: normalized.provider_positive_reply,
        provider_bounced: normalized.provider_bounced,
        provider_sender_bounced: normalized.provider_sender_bounced,
        provider_leads_total: normalized.provider_leads_total,
        provider_stats_source: normalized.provider_stats_source,
      } as NormalizedCampaignWithStats;
    });

    // Cache all campaigns in the background
    if (campaigns.length > 0) {
      const cacheRows = campaigns.map((c) => ({
        campaign_id: c.campaign_id,
        name: c.name,
        status: c.status,
        provider_sent: c.provider_sent ?? 0,
        provider_opened: c.provider_opened ?? 0,
        provider_clicked: 0,
        provider_replied: c.provider_replied ?? 0,
        provider_bounced: c.provider_bounced ?? 0,
        provider_leads_total: c.provider_leads_total ?? null,
        provider_stats_source: c.provider_stats_source ?? null,
        last_synced_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      }));
      EdgeRuntime.waitUntil(
        supabase.from("smartlead_campaigns").upsert(cacheRows, { onConflict: "campaign_id" }),
      );
    }

    return new Response(
      JSON.stringify({ ok: true, campaigns, source: "live_api" }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } },
    );
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-campaigns-admin] error:", message);
    return new Response(
      JSON.stringify({ ok: false, error: message }),
      {
        status: message.includes("Unauthorized") ? 401 : 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      },
    );
  }
});
