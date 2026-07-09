import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession } from "../_shared/adminSession.ts";
import {
  getCampaign,
  getCampaignAnalytics,
  getCampaignStatistics,
  getCampaignLeadStats,
  extractCampaignStats,
  type SmartleadCampaignStats,
} from "../_shared/smartleadClient.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-supabase-auth, Accept, Origin",
};

function hasAnyMetric(stats: SmartleadCampaignStats | null): boolean {
  if (!stats) return false;
  return [
    stats.leads_total,
    stats.sent,
    stats.delivered,
    stats.opens,
    stats.clicks,
    stats.replies,
    stats.bounces,
    stats.unsubscribed,
    stats.positive_reply,
    stats.sender_bounced,
  ].some(v => v !== undefined);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    await requireAdminSession(req);

    const url = new URL(req.url);
    const campaignId = url.searchParams.get("campaign_id");

    if (!campaignId || campaignId.trim() === "") {
      return new Response(
        JSON.stringify({ ok: false, error: "campaign_id is required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") || "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || ""
    );

    const warnings: string[] = [];
    let liveStats: SmartleadCampaignStats | null = null;
    let statsSource = "none";

    // A: PRIMARY — /campaigns/{id}/analytics (current Smartlead documented endpoint)
    try {
      console.log(`[smartlead-campaign-stats] A: fetching /campaigns/${campaignId}/analytics`);
      liveStats = await getCampaignAnalytics(campaignId);
      statsSource = "analytics_endpoint";
      console.log(`[smartlead-campaign-stats] analytics extraction notes: ${JSON.stringify(liveStats.extraction_notes)}`);

      if (hasAnyMetric(liveStats)) {
        console.log(`[smartlead-campaign-stats] source=analytics_endpoint WIN — metrics found`);
      } else {
        warnings.push("Analytics endpoint returned data but no recognized metrics were extracted");
        console.log(`[smartlead-campaign-stats] analytics returned no metrics, raw_keys: ${JSON.stringify(liveStats.raw_keys)}`);
      }
    } catch (analyticsErr) {
      const analyticsMsg = analyticsErr instanceof Error ? analyticsErr.message : String(analyticsErr);
      console.warn(`[smartlead-campaign-stats] /analytics failed: ${analyticsMsg}`);
      warnings.push(`Analytics endpoint failed: ${analyticsMsg}`);
    }

    // B: SECONDARY — /campaigns/{id}/statistics
    if (!hasAnyMetric(liveStats)) {
      try {
        console.log(`[smartlead-campaign-stats] B: fetching /campaigns/${campaignId}/statistics`);
        const statsEndpoint = await getCampaignStatistics(campaignId);
        statsSource = "statistics_endpoint";
        console.log(`[smartlead-campaign-stats] statistics extraction notes: ${JSON.stringify(statsEndpoint.extraction_notes)}`);

        if (hasAnyMetric(statsEndpoint)) {
          liveStats = statsEndpoint;
          statsSource = "statistics_endpoint";
          console.log(`[smartlead-campaign-stats] source=statistics_endpoint WIN — metrics found`);
        } else {
          warnings.push("Statistics endpoint returned data but no recognized metrics were extracted");
          console.log(`[smartlead-campaign-stats] statistics returned no metrics, raw_keys: ${JSON.stringify(statsEndpoint.raw_keys)}`);
          if (!liveStats || liveStats.raw_keys.length < statsEndpoint.raw_keys.length) {
            liveStats = statsEndpoint;
            statsSource = "statistics_endpoint";
          }
        }
      } catch (statsErr) {
        const statsMsg = statsErr instanceof Error ? statsErr.message : String(statsErr);
        console.warn(`[smartlead-campaign-stats] /statistics failed: ${statsMsg}`);
        warnings.push(`Statistics endpoint failed: ${statsMsg}`);
      }
    }

    // C: OPTIONAL — /campaigns/{id}/lead-stats
    if (!hasAnyMetric(liveStats)) {
      try {
        console.log(`[smartlead-campaign-stats] C: fetching /campaigns/${campaignId}/lead-stats`);
        const leadStats = await getCampaignLeadStats(campaignId);
        console.log(`[smartlead-campaign-stats] lead-stats extraction notes: ${JSON.stringify(leadStats.extraction_notes)}`);

        if (hasAnyMetric(leadStats)) {
          liveStats = leadStats;
          statsSource = "lead_stats_endpoint";
          console.log(`[smartlead-campaign-stats] source=lead_stats_endpoint WIN — metrics found`);
        } else {
          warnings.push("Lead-stats endpoint returned data but no recognized metrics were extracted");
          console.log(`[smartlead-campaign-stats] lead-stats returned no metrics, raw_keys: ${JSON.stringify(leadStats.raw_keys)}`);
          if (!liveStats || liveStats.raw_keys.length < leadStats.raw_keys.length) {
            liveStats = leadStats;
            statsSource = "lead_stats_endpoint";
          }
        }
      } catch (leadErr) {
        const leadMsg = leadErr instanceof Error ? leadErr.message : String(leadErr);
        console.warn(`[smartlead-campaign-stats] /lead-stats failed: ${leadMsg}`);
        warnings.push(`Lead-stats endpoint failed: ${leadMsg}`);
      }
    }

    // D: FINAL — campaign detail object
    if (!hasAnyMetric(liveStats)) {
      try {
        console.log(`[smartlead-campaign-stats] D: fetching campaign detail as final fallback`);
        const campaignDetail = await getCampaign(campaignId);
        if (campaignDetail) {
          const detailStats = extractCampaignStats(campaignDetail as unknown);
          console.log(`[smartlead-campaign-stats] campaign detail extraction notes: ${JSON.stringify(detailStats.extraction_notes)}`);

          if (hasAnyMetric(detailStats)) {
            liveStats = detailStats;
            statsSource = "campaign_detail";
            console.log(`[smartlead-campaign-stats] source=campaign_detail WIN — metrics found`);
          } else {
            warnings.push("Campaign detail returned data but no recognized metrics were extracted");
            console.log(`[smartlead-campaign-stats] campaign detail returned no metrics, raw_keys: ${JSON.stringify(detailStats.raw_keys)}`);
            if (!liveStats || liveStats.raw_keys.length < detailStats.raw_keys.length) {
              liveStats = detailStats;
              statsSource = "campaign_detail";
            }
          }
        }
      } catch (detailErr) {
        const detailMsg = detailErr instanceof Error ? detailErr.message : String(detailErr);
        console.warn(`[smartlead-campaign-stats] campaign detail also failed: ${detailMsg}`);
        warnings.push(`Campaign detail fallback also failed: ${detailMsg}`);
      }
    }

    console.log(`[smartlead-campaign-stats] final source=${statsSource} hasMetrics=${hasAnyMetric(liveStats)} metrics=${JSON.stringify(
      liveStats ? Object.entries(liveStats).filter(([k, v]) => k !== "raw_keys" && k !== "extraction_notes" && v !== undefined).map(([k, v]) => `${k}=${v}`) : []
    )}`);

    const { data: localRow } = await supabase
      .from("smartlead_campaign_local_stats")
      .select("*")
      .eq("campaign_id", campaignId)
      .maybeSingle();

    const liveAvailable = hasAnyMetric(liveStats);

    if (!liveAvailable && liveStats && liveStats.raw_keys.length > 0) {
      warnings.push(`Smartlead stats response was received with ${liveStats.raw_keys.length} keys, but none matched known metric field names. Check raw_keys for actual field names returned by Smartlead.`);
    }

    const live = {
      available: liveAvailable,
      status: statsSource,
      provider_last_updated_at: new Date().toISOString(),
      leads_total: liveStats?.leads_total,
      sent: liveStats?.sent,
      delivered: liveStats?.delivered,
      opens: liveStats?.opens,
      clicks: liveStats?.clicks,
      replies: liveStats?.replies,
      bounces: liveStats?.bounces,
      unsubscribed: liveStats?.unsubscribed,
      positive_reply: liveStats?.positive_reply,
      sender_bounced: liveStats?.sender_bounced,
      raw_keys: liveStats?.raw_keys ?? [],
      extraction_notes: liveStats?.extraction_notes ?? [],
      warnings,
    };

    const localOverlay = {
      available: !!localRow,
      state: localRow?.state ?? undefined,
      synced_rows: localRow?.synced_rows ?? undefined,
      unique_emails_contacted: localRow?.unique_emails_contacted ?? undefined,
      unique_agencies_contacted: localRow?.unique_agencies_contacted ?? undefined,
      unique_emails_opened: localRow?.unique_emails_opened ?? undefined,
      unique_agencies_opened: localRow?.unique_agencies_opened ?? undefined,
      unique_emails_replied: localRow?.unique_emails_replied ?? undefined,
      unique_agencies_replied: localRow?.unique_agencies_replied ?? undefined,
      unique_emails_bounced: localRow?.unique_emails_bounced ?? undefined,
      unique_agencies_bounced: localRow?.unique_agencies_bounced ?? undefined,
      unique_emails_unsubscribed: localRow?.unique_emails_unsubscribed ?? undefined,
      unique_agencies_unsubscribed: localRow?.unique_agencies_unsubscribed ?? undefined,
      total_open_events: localRow?.total_open_events ?? undefined,
      total_click_events: localRow?.total_click_events ?? undefined,
      total_reply_events: localRow?.total_reply_events ?? undefined,
      total_bounce_events: localRow?.total_bounce_events ?? undefined,
      total_unsubscribe_events: localRow?.total_unsubscribe_events ?? undefined,
      avg_emails_per_agency: localRow?.avg_emails_per_agency ?? undefined,
      open_rate_email_level: localRow?.open_rate_email_level ?? undefined,
      reply_rate_email_level: localRow?.reply_rate_email_level ?? undefined,
      bounce_rate_email_level: localRow?.bounce_rate_email_level ?? undefined,
      open_rate_agency_level: localRow?.open_rate_agency_level ?? undefined,
      reply_rate_agency_level: localRow?.reply_rate_agency_level ?? undefined,
      bounce_rate_agency_level: localRow?.bounce_rate_agency_level ?? undefined,
    };

    return new Response(
      JSON.stringify({ ok: true, campaign_id: campaignId, live, local_overlay: localOverlay }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    console.error("[smartlead-campaign-stats] error:", message);
    return new Response(
      JSON.stringify({ ok: false, error: message }),
      { status: message.includes("Unauthorized") ? 401 : 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
