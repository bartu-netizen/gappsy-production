// Shared "push clean, unsynced emails into a Smartlead campaign" logic —
// used by BOTH the admin manual-sync action (admin-tool-contact-emails)
// and the two auto-sync scheduled jobs (tool_email_smartlead_sync,
// discovered_tool_email_smartlead_sync), so there is exactly one code
// path for what "syncing to Smartlead" means, matching the same
// single-source-of-truth pattern already used for scheduler execution
// (schedulerRunner.ts) and ListClean verification.
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { fetchInChunks } from "./dbChunking.ts";
import { addLeadsToCampaign, getLeadByEmail, pauseLeadInCampaign, type SmartleadLead } from "./smartleadClient.ts";

export type ContactEmailSource = "listed" | "discovered";

export interface SmartleadSyncResult {
  ok: boolean;
  synced: number;
  campaign_id: string;
  note?: string;
  error?: string;
  smartlead_response?: unknown;
}

export async function syncValidEmailsToSmartlead(
  supabase: SupabaseClient,
  source: ContactEmailSource,
  campaignId: string,
): Promise<SmartleadSyncResult> {
  const emailTable = source === "discovered" ? "discovered_tool_contact_emails" : "tool_contact_emails";
  const idColumn = source === "discovered" ? "discovered_tool_id" : "tool_id";
  const entityTable = source === "discovered" ? "discovered_tools" : "tools";
  // short_description/pricing_model are sent as custom_fields so Smartlead
  // sequences can reference {{short_description}} / {{pricing_model}} for
  // a more personalized opening line, not just the tool's name/website.
  const entitySelect = source === "discovered" ? "id, slug, name, official_website, short_description" : "id, slug, name, website, short_description, pricing_model";
  const websiteField = source === "discovered" ? "official_website" : "website";
  const profileUrlFor = (slug: string | undefined) => (source === "discovered" ? null : slug ? `https://gappsy.com/tools/${slug}/` : null);

  // Only ListClean-verified-deliverable emails, never already synced —
  // this is the one gate between "scraped" and "a real cold email goes
  // out", so it deliberately never widens beyond listclean_status='valid'.
  const { data: eligible, error: eligibleError } = await supabase
    .from(emailTable)
    .select(`id, ${idColumn}, email`)
    .eq("listclean_status", "valid")
    .is("smartlead_synced_at", null)
    .limit(2000);
  if (eligibleError) return { ok: false, synced: 0, campaign_id: campaignId, error: eligibleError.message };
  if (!eligible || eligible.length === 0) return { ok: true, synced: 0, campaign_id: campaignId, note: "No clean, unsynced emails to send." };

  const entityIds = [...new Set((eligible as any[]).map((r) => r[idColumn]))];
  const { data: entities, error: entitiesError } = await fetchInChunks(entityIds, (chunk) =>
    supabase.from(entityTable).select(entitySelect).in("id", chunk)
  );
  if (entitiesError) return { ok: false, synced: 0, campaign_id: campaignId, error: entitiesError.message };
  const entityById = new Map((entities || []).map((t: any) => [t.id, t]));

  // Free lead-magnet hook (see schedulerRegistry.ts's
  // leadMagnetComparisonGeneratorHandler): a listed tool may already have a
  // real, published "Tool vs Competitor" page waiting — surfaced here as a
  // custom field so the Smartlead sequence can reference {{comparison_url}}
  // as "we already made this for you" instead of a generic pitch. Only
  // applies to listed tools (tool_comparisons only ever pairs real tools.rows,
  // never discovered_tools candidates).
  const comparisonByToolId = new Map<string, { url: string; competitorName: string }>();
  if (source === "listed" && entityIds.length > 0) {
    const { data: comparisons } = await fetchInChunks(entityIds, (chunk) =>
      supabase
        .from("tool_comparisons")
        .select("slug, tool_a_id, tool_b_id, tool_a:tools!tool_comparisons_tool_a_id_fkey(id,name), tool_b:tools!tool_comparisons_tool_b_id_fkey(id,name)")
        .eq("status", "published")
        .or(`tool_a_id.in.(${chunk.join(",")}),tool_b_id.in.(${chunk.join(",")})`)
    );
    for (const c of (comparisons || []) as any[]) {
      const isA = entityIds.includes(c.tool_a_id);
      const thisToolId = isA ? c.tool_a_id : c.tool_b_id;
      const competitor = isA ? c.tool_b : c.tool_a;
      if (!comparisonByToolId.has(thisToolId)) {
        comparisonByToolId.set(thisToolId, { url: `https://gappsy.com/compare/${c.slug}/`, competitorName: competitor?.name || "" });
      }
    }
  }

  const leads: SmartleadLead[] = (eligible as any[]).map((r) => {
    const entity = entityById.get(r[idColumn]) as any;
    const comparison = comparisonByToolId.get(r[idColumn]);
    return {
      email: r.email,
      company_name: entity?.name || undefined,
      website: entity?.[websiteField] || undefined,
      custom_fields: {
        [idColumn]: r[idColumn],
        tool_slug: entity?.slug || null,
        profile_url: profileUrlFor(entity?.slug),
        short_description: entity?.short_description || null,
        pricing_model: entity?.pricing_model || null,
        comparison_url: comparison?.url || null,
        comparison_competitor_name: comparison?.competitorName || null,
        source: emailTable,
      },
    };
  });

  const result = await addLeadsToCampaign(campaignId, leads);
  if (!result.ok) return { ok: false, synced: 0, campaign_id: campaignId, error: "Smartlead rejected the request", smartlead_response: result.raw };

  const nowIso = new Date().toISOString();
  const { error: updateError } = await supabase
    .from(emailTable)
    .update({ smartlead_campaign_id: campaignId, smartlead_synced_at: nowIso })
    .in("id", (eligible as any[]).map((r) => r.id));
  if (updateError) return { ok: false, synced: 0, campaign_id: campaignId, error: `Sent to Smartlead but failed to record sync state: ${updateError.message}` };

  return { ok: true, synced: eligible.length, campaign_id: campaignId, smartlead_response: result };
}

// The two existing cold-outreach campaigns ("Software Tool Listed On
// Gappsy" / "Software Tool NOT Listed On Gappsy" — see
// 20260723010000_smartlead_auto_sync_jobs.sql). Kept as a small local const
// rather than yet another scheduled_jobs.config lookup, since this runs
// from a purchase-event trigger, not a scheduled tick.
const COLD_OUTREACH_CAMPAIGN_IDS = ["3707597", "3707931"];

export interface PostPurchaseSyncResult {
  ok: boolean;
  paused_from: string[];
  enrolled_in_upsell: boolean;
  note?: string;
}

// Called once per real purchase (claim or featured) from
// vendorFeatureActivation.ts's sendVendorSaleEmail neighbor. Two jobs:
// (1) ALWAYS stop the cold-outreach "you're not listed yet" emails the
// instant someone converts — remaining on that list after paying is exactly
// the awkward scenario this exists to prevent; (2) a claim-only buyer (not
// yet on Featured) gets enrolled in a separate upsell campaign instead — its
// actual email copy/sequence lives entirely in Smartlead's own dashboard,
// this only ever adds/removes the lead, never touches campaign content.
// SMARTLEAD_FEATURED_UPSELL_CAMPAIGN_ID is an env var (not code) specifically
// so turning the upsell enrollment on is a config change, not a redeploy —
// the pause-from-cold-outreach half already works today with it unset.
export async function syncSmartleadAfterPurchase(email: string, product: "claim" | "featured"): Promise<PostPurchaseSyncResult> {
  const upsellCampaignId = Deno.env.get("SMARTLEAD_FEATURED_UPSELL_CAMPAIGN_ID") || null;
  const pausedFrom: string[] = [];

  try {
    const lead = await getLeadByEmail(email);
    if (lead) {
      const candidates = new Set([
        ...COLD_OUTREACH_CAMPAIGN_IDS,
        ...lead.campaignIds,
        ...(upsellCampaignId ? [upsellCampaignId] : []),
      ]);
      for (const campaignId of candidates) {
        // Featured is the endpoint of the upsell — never pause a claim-only
        // buyer OUT of the very upsell campaign we're about to add them to.
        if (product === "claim" && campaignId === upsellCampaignId) continue;
        const paused = await pauseLeadInCampaign(campaignId, lead.id);
        if (paused) pausedFrom.push(campaignId);
      }
    }
  } catch (err) {
    console.error(`[smartleadSync] failed to look up/pause lead for ${email}:`, (err as Error).message);
  }

  if (product !== "claim") {
    return { ok: true, paused_from: pausedFrom, enrolled_in_upsell: false };
  }
  if (!upsellCampaignId) {
    return { ok: true, paused_from: pausedFrom, enrolled_in_upsell: false, note: "SMARTLEAD_FEATURED_UPSELL_CAMPAIGN_ID not configured yet" };
  }

  try {
    const result = await addLeadsToCampaign(upsellCampaignId, [{ email }]);
    return { ok: result.ok, paused_from: pausedFrom, enrolled_in_upsell: result.ok, note: result.ok ? undefined : "Smartlead rejected enrollment" };
  } catch (err) {
    console.error(`[smartleadSync] failed to enroll ${email} in featured upsell campaign:`, (err as Error).message);
    return { ok: false, paused_from: pausedFrom, enrolled_in_upsell: false, note: (err as Error).message };
  }
}
