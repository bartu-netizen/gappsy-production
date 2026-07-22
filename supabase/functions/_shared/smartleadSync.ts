// Shared "push clean, unsynced emails into a Smartlead campaign" logic —
// used by BOTH the admin manual-sync action (admin-tool-contact-emails)
// and the two auto-sync scheduled jobs (tool_email_smartlead_sync,
// discovered_tool_email_smartlead_sync), so there is exactly one code
// path for what "syncing to Smartlead" means, matching the same
// single-source-of-truth pattern already used for scheduler execution
// (schedulerRunner.ts) and ListClean verification.
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { fetchInChunks } from "./dbChunking.ts";
import { addLeadsToCampaign, type SmartleadLead } from "./smartleadClient.ts";

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
  const entitySelect = source === "discovered" ? "id, slug, name, official_website" : "id, slug, name, website";
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

  const leads: SmartleadLead[] = (eligible as any[]).map((r) => {
    const entity = entityById.get(r[idColumn]) as any;
    return {
      email: r.email,
      company_name: entity?.name || undefined,
      website: entity?.[websiteField] || undefined,
      custom_fields: {
        [idColumn]: r[idColumn],
        tool_slug: entity?.slug || null,
        profile_url: profileUrlFor(entity?.slug),
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
