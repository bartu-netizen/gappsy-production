import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { addLeadsToCampaign } from "../_shared/smartleadClient.ts";
import {
  selectOnePerAgency,
  isRoleBasedEmail,
  getIdentityKey,
  getExclusionReason,
  EmailRowForSelection
} from "../_shared/smartleadSelection.ts";

interface SyncRequest {
  campaign_id: string;
  state?: string;
  send_mode: "all_clean_emails" | "one_per_agency";
  dry_run?: boolean;
  include_inactive_agencies?: boolean;
}

interface PreviewRow {
  agency_id: string;
  agency_name: string;
  agency_slug: string;
  state_slug: string;
  selected_email: string;
  is_primary: boolean;
  is_role_based: boolean;
  total_clean_emails_for_agency: number;
  total_ready_emails_for_agency: number;
  selection_reason: string;
  identity_key: string;
  email_domain: string;
  website_domain: string;
  domain_match_status: string;
}

interface SyncResponse {
  ok: boolean;
  campaign_id: string;
  state?: string;
  send_mode: string;
  dry_run: boolean;
  selected_email_rows: number;
  selected_unique_agencies: number;
  selected_unique_identities: number;
  attempted_to_sync: number;
  synced_success: number;
  skipped_duplicates: number;
  skipped_contaminated: number;
  failed: number;
  errors: string[];
  preview_rows?: PreviewRow[];
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ error: "Method not allowed" }),
        { status: 405, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) return authResult;

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase configuration");

    const supabase = createClient(supabaseUrl, serviceRoleKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const body: SyncRequest = await req.json();

    if (!body.campaign_id) {
      return new Response(
        JSON.stringify({ ok: false, error: "campaign_id is required" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    if (!body.send_mode || !["all_clean_emails", "one_per_agency"].includes(body.send_mode)) {
      return new Response(
        JSON.stringify({ ok: false, error: "send_mode must be 'all_clean_emails' or 'one_per_agency'" }),
        { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    const dryRun = body.dry_run ?? false;
    const stateFilter = body.state || null;
    const includeInactiveAgencies = body.include_inactive_agencies ?? false;

    // Fetch all eligible emails with identity fields via join
    const { data: allEmails, error: allEmailsError } = await supabase
      .from("other_agency_emails")
      .select(`
        id, email_normalized, email_raw, agency_id, is_primary,
        validation_checked_at, created_at, email_domain,
        domain_match_status, is_identity_contaminated,
        other_agencies(
          id, state_slug, name, slug, website_url, phone, is_active,
          website_domain_normalized, global_identity_key, agency_dedupe_key
        )
      `)
      .eq("validation_status", "valid")
      .not("outreach_status", "in", "(opted_out,blocked)")
      .order("created_at", { ascending: true });

    if (allEmailsError) throw allEmailsError;

    if (!allEmails || allEmails.length === 0) {
      return new Response(
        JSON.stringify({
          ok: true,
          campaign_id: body.campaign_id,
          state: stateFilter,
          send_mode: body.send_mode,
          dry_run: dryRun,
          selected_email_rows: 0,
          selected_unique_agencies: 0,
          selected_unique_identities: 0,
          attempted_to_sync: 0,
          synced_success: 0,
          skipped_duplicates: 0,
          skipped_contaminated: 0,
          failed: 0,
          errors: [],
        } as SyncResponse),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Step 1: Filter by eligibility (active agencies, state filter) and exclude contaminated
    let skippedContaminated = 0;

    interface EnrichedEmail extends EmailRowForSelection {
      email_raw: string;
      other_agencies: {
        id: string;
        state_slug: string;
        name: string;
        slug: string;
        website_url: string;
        phone: string;
        is_active: boolean;
        website_domain_normalized: string | null;
        global_identity_key: string | null;
        agency_dedupe_key: string | null;
      };
    }

    const eligibleEmails: EnrichedEmail[] = [];

    for (const e of allEmails) {
      const agency = e.other_agencies as any;
      if (!agency) continue;
      if (!agency.is_active && !includeInactiveAgencies) continue;
      if (stateFilter && agency.state_slug !== stateFilter) continue;

      // Enrich with identity fields from agency
      const enriched: EnrichedEmail = {
        ...e,
        global_identity_key: agency.global_identity_key,
        agency_dedupe_key: agency.agency_dedupe_key,
        website_domain_normalized: agency.website_domain_normalized,
        other_agencies: agency,
      };

      // Check for identity contamination - exclude these emails
      const exclusionReason = getExclusionReason(enriched);
      if (exclusionReason) {
        skippedContaminated++;
        continue;
      }

      eligibleEmails.push(enriched);
    }

    if (eligibleEmails.length === 0) {
      return new Response(
        JSON.stringify({
          ok: true,
          campaign_id: body.campaign_id,
          state: stateFilter,
          send_mode: body.send_mode,
          dry_run: dryRun,
          selected_email_rows: 0,
          selected_unique_agencies: 0,
          selected_unique_identities: 0,
          attempted_to_sync: 0,
          synced_success: 0,
          skipped_duplicates: 0,
          skipped_contaminated: skippedContaminated,
          failed: 0,
          errors: [],
        } as SyncResponse),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Step 2: Apply send_mode selection using identity-aware deduplication
    let selectedEmails: EnrichedEmail[];

    if (body.send_mode === "one_per_agency") {
      selectedEmails = selectOnePerAgency(eligibleEmails);
    } else {
      selectedEmails = eligibleEmails;
    }

    const selectedEmailRowCount = selectedEmails.length;
    const selectedUniqueAgencies = new Set(selectedEmails.map((e) => e.agency_id)).size;
    const selectedUniqueIdentities = new Set(selectedEmails.map((e) => getIdentityKey(e))).size;

    // Step 4: Dedupe against already synced to this campaign
    const { data: alreadySynced, error: syncCheckError } = await supabase
      .from("smartlead_campaign_email_sync")
      .select("email_normalized")
      .eq("campaign_id", body.campaign_id);

    if (syncCheckError) throw syncCheckError;

    const syncedSet = new Set((alreadySynced || []).map((s) => s.email_normalized));
    const toSync = selectedEmails.filter((e) => !syncedSet.has(e.email_normalized));
    const skippedDuplicates = selectedEmails.length - toSync.length;

    // Build rich per-agency clean/ready counts for preview
    const agencyCleanCount = new Map<string, number>();
    const agencyReadyCount = new Map<string, number>();
    for (const e of eligibleEmails) {
      agencyCleanCount.set(e.agency_id, (agencyCleanCount.get(e.agency_id) || 0) + 1);
      if (!syncedSet.has(e.email_normalized)) {
        agencyReadyCount.set(e.agency_id, (agencyReadyCount.get(e.agency_id) || 0) + 1);
      }
    }

    if (dryRun) {
      // Build rich preview rows with identity diagnostics
      const previewRows: PreviewRow[] = toSync.slice(0, 50).map((e) => {
        const agency = e.other_agencies;
        const isRole = isRoleBasedEmail(e.email_normalized);
        const totalClean = agencyCleanCount.get(e.agency_id) || 1;
        const totalReady = agencyReadyCount.get(e.agency_id) || 1;
        const identityKey = getIdentityKey(e);

        let selectionReason = "all_clean_emails";
        if (body.send_mode === "one_per_agency") {
          if (e.is_primary) selectionReason = "is_primary=true";
          else if (!isRole) selectionReason = "personal email preferred";
          else selectionReason = "only option / role-based fallback";
        }

        return {
          agency_id: e.agency_id,
          agency_name: agency.name || "",
          agency_slug: agency.slug || "",
          state_slug: agency.state_slug || "",
          selected_email: e.email_normalized,
          is_primary: e.is_primary === true,
          is_role_based: isRole,
          total_clean_emails_for_agency: totalClean,
          total_ready_emails_for_agency: totalReady,
          selection_reason: selectionReason,
          identity_key: identityKey,
          email_domain: e.email_domain || "",
          website_domain: agency.website_domain_normalized || "",
          domain_match_status: e.domain_match_status || "",
        };
      });

      const syncRun = {
        campaign_id: body.campaign_id,
        state_slug: stateFilter,
        send_mode: body.send_mode,
        dry_run: true,
        requested_limit: requestLimit,
        selected_email_rows: selectedEmailRowCount,
        selected_unique_agencies: selectedUniqueAgencies,
        attempted_to_sync: toSync.length,
        synced_success: 0,
        skipped_duplicates: skippedDuplicates,
        failed: 0,
        notes: `Dry run preview (${skippedContaminated} contaminated excluded)`,
        result_json: { preview: previewRows.slice(0, 20), skipped_contaminated: skippedContaminated },
      };

      await supabase.from("smartlead_sync_runs").insert(syncRun);

      return new Response(
        JSON.stringify({
          ok: true,
          campaign_id: body.campaign_id,
          state: stateFilter,
          send_mode: body.send_mode,
          dry_run: true,
          selected_email_rows: selectedEmailRowCount,
          selected_unique_agencies: selectedUniqueAgencies,
          selected_unique_identities: selectedUniqueIdentities,
          attempted_to_sync: toSync.length,
          synced_success: 0,
          skipped_duplicates: skippedDuplicates,
          skipped_contaminated: skippedContaminated,
          failed: 0,
          errors: [],
          preview_rows: previewRows,
        } as SyncResponse),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Create sync run record
    const syncRunRecord = {
      campaign_id: body.campaign_id,
      state_slug: stateFilter,
      send_mode: body.send_mode,
      dry_run: false,
      requested_limit: requestLimit,
      selected_email_rows: selectedEmailRowCount,
      selected_unique_agencies: selectedUniqueAgencies,
      attempted_to_sync: toSync.length,
      synced_success: 0,
      skipped_duplicates: skippedDuplicates,
      failed: 0,
      notes: `Sync in progress... (${skippedContaminated} contaminated excluded)`,
      result_json: { skipped_contaminated: skippedContaminated },
    };

    const { data: createdRun, error: runInsertError } = await supabase
      .from("smartlead_sync_runs")
      .insert(syncRunRecord)
      .select("id")
      .single();

    if (runInsertError) throw new Error(`Failed to create sync run: ${runInsertError.message}`);

    const syncRunId = createdRun.id;

    let syncedSuccess = 0;
    let syncedFailed = 0;
    const syncErrors: string[] = [];

    if (toSync.length > 0) {
      const leads = toSync.map((e) => {
        const agency = e.other_agencies;
        const identityKey = getIdentityKey(e);

        return {
          email: e.email_normalized,
          first_name: "",
          last_name: "",
          company_name: agency.name || "",
          website: agency.website_url,
          phone_number: agency.phone,
          custom_fields: {
            agency_id: e.agency_id,
            other_agency_email_id: e.id,
            state_slug: agency.state_slug,
            agency_slug: agency.slug,
            source: "gappsy_other_agencies",
            send_mode: body.send_mode,
            identity_key: identityKey,
            your_agency_url: agency.slug ? `https://www.gappsy.com/your-agency/${agency.slug}` : "",
          },
        };
      });

      try {
        const result = await addLeadsToCampaign(body.campaign_id, leads);
        syncedSuccess = result.success;
        syncedFailed = result.failed;
        syncErrors.push(...result.errors);
      } catch (error) {
        syncedFailed = leads.length;
        syncErrors.push(error instanceof Error ? error.message : String(error));
      }

      if (syncedSuccess > 0) {
        const syncRecords = toSync.slice(0, syncedSuccess).map((e) => ({
          campaign_id: body.campaign_id,
          agency_id: e.agency_id,
          other_agency_email_id: e.id,
          email_normalized: e.email_normalized,
          send_mode: body.send_mode,
          state_slug: e.other_agencies.state_slug,
          sync_run_id: syncRunId,
          sync_status: "synced",
        }));

        const { error: insertError } = await supabase
          .from("smartlead_campaign_email_sync")
          .upsert(syncRecords, { onConflict: "campaign_id,email_normalized" });

        if (insertError) {
          syncErrors.push(`Error recording sync: ${insertError.message}`);
        } else {
          const emailIds = toSync.slice(0, syncedSuccess).map((e) => e.id);
          const { data: currentEmails, error: fetchError } = await supabase
            .from("other_agency_emails")
            .select("id, outreach_count")
            .in("id", emailIds);

          if (fetchError) {
            syncErrors.push(`Error fetching email counts: ${fetchError.message}`);
          } else if (currentEmails) {
            const updateRecords = currentEmails.map((e) => ({
              id: e.id,
              outreach_count: (e.outreach_count || 0) + 1,
              outreach_status: "synced_to_smartlead",
              last_outreach_at: new Date().toISOString(),
            }));

            const { error: updateError } = await supabase
              .from("other_agency_emails")
              .upsert(updateRecords);

            if (updateError) {
              syncErrors.push(`Error updating email outreach status: ${updateError.message}`);
            }
          }
        }
      }
    }

    await supabase
      .from("smartlead_sync_runs")
      .update({
        synced_success: syncedSuccess,
        failed: syncedFailed,
        notes: `Sync completed: ${syncedSuccess} success, ${syncedFailed} failed, ${skippedContaminated} contaminated excluded`,
        result_json: { synced: syncedSuccess, failed: syncedFailed, errors: syncErrors, skipped_contaminated: skippedContaminated },
      })
      .eq("id", syncRunId);

    return new Response(
      JSON.stringify({
        ok: true,
        campaign_id: body.campaign_id,
        state: stateFilter,
        send_mode: body.send_mode,
        dry_run: false,
        selected_email_rows: selectedEmailRowCount,
        selected_unique_agencies: selectedUniqueAgencies,
        selected_unique_identities: selectedUniqueIdentities,
        attempted_to_sync: toSync.length,
        synced_success: syncedSuccess,
        skipped_duplicates: skippedDuplicates,
        skipped_contaminated: skippedContaminated,
        failed: syncedFailed,
        errors: syncErrors,
      } as SyncResponse),
      { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("Smartlead sync error:", error);
    const e = error as any;
    const message = (typeof e?.message === 'string' && e.message) ? e.message
      : (typeof e?.error === 'string' && e.error) ? e.error
      : String(error);
    return new Response(
      JSON.stringify({
        ok: false,
        error: message,
        message,
        details: e?.details,
        hint: e?.hint,
        code: e?.code,
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
