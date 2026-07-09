import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { getSmartleadRuntimeHealth, SmartleadHealth } from "../_shared/smartleadHealth.ts";
import { mapLegacyVerificationStatus } from "../_shared/normalizeHelpers.ts";
import {
  isRoleBasedEmail,
  getIdentityKey,
  getExclusionReason,
  EmailRowForSelection,
} from "../_shared/smartleadSelection.ts";

interface StatsResponse {
  ok: boolean;
  filters: {
    state?: string;
    campaign_id?: string;
    include_inactive_agencies?: boolean;
  };
  raw_valid_inventory: {
    total_valid_emails: number;
    valid_on_active_agencies: number;
    valid_on_inactive_agencies: number;
    unique_valid_emails: number;
    unique_agencies_with_valid: number;
  };
  exclusion_breakdown: {
    excluded_inactive_agency: number;
    excluded_identity_contaminated: number;
    excluded_opted_out: number;
    excluded_blocked: number;
    total_excluded: number;
  };
  final_sendable: {
    sendable_email_rows: number;
    sendable_with_inactive: number;
    unique_agencies: number;
    unique_identities: number;
  };
  inventory: {
    total_email_rows: number;
    clean_email_rows: number;
    ready_email_rows: number;
    invalid_email_rows: number;
    pending_email_rows: number;
    retry_email_rows: number;
    failed_email_rows: number;
    risky_email_rows: number;
    catch_all_email_rows: number;
    contaminated_email_rows: number;
  };
  agency_inventory: {
    total_unique_agencies: number;
    active_agencies: number;
    inactive_agencies: number;
    unique_agencies_with_clean_email: number;
    unique_agencies_with_ready_email: number;
    agencies_with_1_clean_email: number;
    agencies_with_2_clean_emails: number;
    agencies_with_3plus_clean_emails: number;
    avg_clean_emails_per_clean_agency: number;
  };
  identity_inventory: {
    unique_real_identities: number;
    identities_with_clean_email: number;
    identities_with_ready_email: number;
    identities_with_1_clean_email: number;
    identities_with_2_clean_emails: number;
    identities_with_3plus_clean_emails: number;
    avg_clean_emails_per_identity: number;
  };
  campaign_performance_email_level: {
    synced_email_rows: number;
    opened_email_rows: number;
    clicked_email_rows: number;
    replied_email_rows: number;
    bounced_email_rows: number;
    unsubscribed_email_rows: number;
  };
  campaign_performance_agency_level: {
    synced_unique_agencies: number;
    opened_unique_agencies: number;
    clicked_unique_agencies: number;
    replied_unique_agencies: number;
    bounced_unique_agencies: number;
    unsubscribed_unique_agencies: number;
  };
  campaign_performance_identity_level: {
    synced_unique_identities: number;
    opened_unique_identities: number;
    clicked_unique_identities: number;
    replied_unique_identities: number;
    bounced_unique_identities: number;
    unsubscribed_unique_identities: number;
  };
  role_based_split: {
    clean_role_based: number;
    clean_personal: number;
    ready_role_based: number;
    ready_personal: number;
  };
  distortion: {
    avg_synced_emails_per_contacted_agency: number | null;
    contacted_agencies_with_1_email: number;
    contacted_agencies_with_2_emails: number;
    contacted_agencies_with_3plus_emails: number;
    avg_synced_emails_per_contacted_identity: number | null;
    contacted_identities_with_1_email: number;
    contacted_identities_with_2_emails: number;
    contacted_identities_with_3plus_emails: number;
  };
  send_mode_comparison: {
    all_clean_emails: {
      email_rows: number;
      unique_agencies: number;
      unique_identities: number;
    };
    one_per_agency: {
      email_rows: number;
      unique_agencies: number;
      unique_identities: number;
    };
  };
  health: SmartleadHealth;
  warnings: string[];
  recent_sync_runs: Array<Record<string, any>>;
  recent_webhook_events: Array<Record<string, any>>;
  sync_health: Array<Record<string, any>>;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    if (req.method !== "GET") {
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

    const url = new URL(req.url);
    const state = url.searchParams.get("state") || undefined;
    const campaignId = url.searchParams.get("campaign_id") || undefined;

    // ─── A: FETCH EMAILS + AGENCY DATA — PAGINATED JOIN QUERY ───────────────
    // PostgREST returns at most 1000 rows per request by default.
    // We paginate with .range() until we have all rows.
    // We do NOT use .in("agency_id", [...]) — for NJ that is 8,500+ UUIDs and
    // will exceed URL length limits. The !inner join + state_slug filter is
    // entirely server-side.

    const PAGE_SIZE = 1000;
    const emailsRaw: any[] = [];
    let offset = 0;

    while (true) {
      let emailQuery = supabase
        .from("other_agency_emails")
        .select(`
          id,
          agency_id,
          email_normalized,
          email_domain,
          validation_status,
          outreach_status,
          is_primary,
          validation_checked_at,
          created_at,
          domain_match_status,
          is_identity_contaminated,
          other_agencies!inner (
            id,
            state_slug,
            is_active,
            website_domain_normalized,
            global_identity_key,
            agency_dedupe_key
          )
        `)
        .range(offset, offset + PAGE_SIZE - 1);

      if (state) {
        emailQuery = emailQuery.eq("other_agencies.state_slug", state);
      }

      const { data: page, error: pageError } = await emailQuery;
      if (pageError) throw pageError;

      const rows = page || [];
      emailsRaw.push(...rows);

      if (rows.length < PAGE_SIZE) break;
      offset += PAGE_SIZE;
    }

    // Build agency lookup from joined data — no separate agency fetch needed
    const agencyMap = new Map<string, any>();
    const activeAgencyIds = new Set<string>();

    interface EnrichedEmail extends EmailRowForSelection {
      validation_status: string;
      outreach_status?: string;
    }

    const enrichedEmails: EnrichedEmail[] = [];

    for (const row of (emailsRaw || [])) {
      const agency = (row as any).other_agencies;
      if (!agency) continue;

      if (!agencyMap.has(row.agency_id)) {
        agencyMap.set(row.agency_id, agency);
        if (agency.is_active) {
          activeAgencyIds.add(row.agency_id);
        }
      }

      enrichedEmails.push({
        id: row.id,
        agency_id: row.agency_id,
        email_normalized: row.email_normalized,
        email_domain: row.email_domain,
        validation_status: row.validation_status,
        outreach_status: row.outreach_status,
        is_primary: row.is_primary,
        validation_checked_at: row.validation_checked_at,
        created_at: row.created_at,
        domain_match_status: row.domain_match_status,
        is_identity_contaminated: row.is_identity_contaminated,
        global_identity_key: agency.global_identity_key || null,
        agency_dedupe_key: agency.agency_dedupe_key || null,
        website_domain_normalized: agency.website_domain_normalized || null,
      });
    }

    const allAgencies = [...agencyMap.values()];

    // ─── B: INVENTORY SECTION ─────────────────────────────────────────────────

    const totalEmailRows = enrichedEmails.length;

    const cleanEmails = enrichedEmails.filter((e) =>
      mapLegacyVerificationStatus(e.validation_status) === "valid"
    );
    const cleanEmailRows = cleanEmails.length;

    const contaminatedEmailRows = enrichedEmails.filter((e) =>
      getExclusionReason(e) !== null
    ).length;

    // ─── B2: RAW VALID INVENTORY ──────────────────────────────────────────────

    const validOnActiveAgencies = cleanEmails.filter((e) => activeAgencyIds.has(e.agency_id)).length;
    const validOnInactiveAgencies = cleanEmails.filter((e) => !activeAgencyIds.has(e.agency_id)).length;
    const uniqueValidEmails = new Set(cleanEmails.map((e) => e.email_normalized)).size;
    const uniqueAgenciesWithValid = new Set(cleanEmails.map((e) => e.agency_id)).size;

    const excludedInactiveAgency = cleanEmails.filter((e) =>
      !activeAgencyIds.has(e.agency_id) && getExclusionReason(e) === null
    ).length;
    const excludedIdentityContaminated = cleanEmails.filter((e) =>
      getExclusionReason(e) !== null
    ).length;
    const excludedOptedOut = cleanEmails.filter((e) => e.outreach_status === "opted_out").length;
    const excludedBlocked = cleanEmails.filter((e) => e.outreach_status === "blocked").length;

    const readyEmails = enrichedEmails.filter((e) =>
      mapLegacyVerificationStatus(e.validation_status) === "valid" &&
      activeAgencyIds.has(e.agency_id) &&
      e.outreach_status !== "opted_out" &&
      e.outreach_status !== "blocked" &&
      getExclusionReason(e) === null
    );
    const readyEmailRows = readyEmails.length;

    const sendableWithInactive = cleanEmails.filter((e) =>
      e.outreach_status !== "opted_out" &&
      e.outreach_status !== "blocked" &&
      getExclusionReason(e) === null
    ).length;

    const invalidEmailRows = enrichedEmails.filter((e) =>
      mapLegacyVerificationStatus(e.validation_status) === "invalid"
    ).length;
    const pendingEmailRows = enrichedEmails.filter((e) =>
      mapLegacyVerificationStatus(e.validation_status) === "pending"
    ).length;
    const retryEmailRows = enrichedEmails.filter((e) =>
      mapLegacyVerificationStatus(e.validation_status) === "retry"
    ).length;
    const failedEmailRows = enrichedEmails.filter((e) =>
      mapLegacyVerificationStatus(e.validation_status) === "failed"
    ).length;
    const riskyEmailRows = enrichedEmails.filter((e) =>
      e.validation_status === "risky"
    ).length;
    const catchAllEmailRows = enrichedEmails.filter((e) =>
      e.validation_status === "catch_all"
    ).length;

    // ─── C: AGENCY INVENTORY ──────────────────────────────────────────────────

    const totalUniqueAgencies = agencyMap.size;
    const activeAgenciesCount = allAgencies.filter((a) => a.is_active).length;
    const inactiveAgenciesCount = allAgencies.filter((a) => !a.is_active).length;

    const agencyCleanCountMap = new Map<string, number>();
    for (const e of cleanEmails) {
      agencyCleanCountMap.set(e.agency_id, (agencyCleanCountMap.get(e.agency_id) || 0) + 1);
    }

    const uniqueAgenciesWithCleanEmail = agencyCleanCountMap.size;
    const agenciesWith1Clean = [...agencyCleanCountMap.values()].filter((c) => c === 1).length;
    const agenciesWith2Clean = [...agencyCleanCountMap.values()].filter((c) => c === 2).length;
    const agenciesWith3PlusClean = [...agencyCleanCountMap.values()].filter((c) => c >= 3).length;

    const avgCleanEmailsPerCleanAgency =
      uniqueAgenciesWithCleanEmail > 0
        ? parseFloat((cleanEmailRows / uniqueAgenciesWithCleanEmail).toFixed(2))
        : 0;

    const readyAgencyIds = new Set(readyEmails.map((e) => e.agency_id));
    const uniqueAgenciesWithReadyEmail = readyAgencyIds.size;

    // ─── C2: IDENTITY INVENTORY ───────────────────────────────────────────────

    const allIdentityKeys = new Set<string>();
    for (const [agencyId, agency] of agencyMap.entries()) {
      const fakeEmail: EmailRowForSelection = {
        id: agencyId,
        email_normalized: "",
        agency_id: agencyId,
        global_identity_key: agency.global_identity_key,
        agency_dedupe_key: agency.agency_dedupe_key,
        website_domain_normalized: agency.website_domain_normalized,
      };
      allIdentityKeys.add(getIdentityKey(fakeEmail));
    }
    const uniqueRealIdentities = allIdentityKeys.size;

    const identityCleanCountMap = new Map<string, number>();
    for (const e of cleanEmails) {
      const identityKey = getIdentityKey(e);
      identityCleanCountMap.set(identityKey, (identityCleanCountMap.get(identityKey) || 0) + 1);
    }

    const identitiesWithCleanEmail = identityCleanCountMap.size;
    const identitiesWith1Clean = [...identityCleanCountMap.values()].filter((c) => c === 1).length;
    const identitiesWith2Clean = [...identityCleanCountMap.values()].filter((c) => c === 2).length;
    const identitiesWith3PlusClean = [...identityCleanCountMap.values()].filter((c) => c >= 3).length;

    const avgCleanEmailsPerIdentity =
      identitiesWithCleanEmail > 0
        ? parseFloat((cleanEmailRows / identitiesWithCleanEmail).toFixed(2))
        : 0;

    const readyIdentityKeys = new Set(readyEmails.map((e) => getIdentityKey(e)));
    const identitiesWithReadyEmail = readyIdentityKeys.size;

    // ─── D: ROLE-BASED SPLIT ──────────────────────────────────────────────────

    let cleanRoleBased = 0;
    let cleanPersonal = 0;
    let readyRoleBased = 0;
    let readyPersonal = 0;

    for (const e of cleanEmails) {
      if (isRoleBasedEmail(e.email_normalized)) {
        cleanRoleBased++;
      } else {
        cleanPersonal++;
      }
    }
    for (const e of readyEmails) {
      if (isRoleBasedEmail(e.email_normalized)) {
        readyRoleBased++;
      } else {
        readyPersonal++;
      }
    }

    // ─── E: SEND MODE COMPARISON ──────────────────────────────────────────────

    const allCleanEmailsRows = readyEmailRows;
    const allCleanEmailsAgencies = readyAgencyIds.size;
    const allCleanEmailsIdentities = readyIdentityKeys.size;

    const onePerAgencyIdentities = readyIdentityKeys.size;
    const onePerAgencyRows = onePerAgencyIdentities;
    const onePerAgencyAgencies = readyAgencyIds.size;

    // ─── F: CAMPAIGN PERFORMANCE ──────────────────────────────────────────────

    let syncQuery = supabase
      .from("smartlead_campaign_email_sync")
      .select("agency_id, other_agency_email_id, email_normalized")
      .eq("sync_status", "synced");
    if (campaignId) syncQuery = syncQuery.eq("campaign_id", campaignId);
    if (state) syncQuery = syncQuery.eq("state_slug", state);

    const { data: syncedData, error: syncedError } = await syncQuery;
    if (syncedError) throw syncedError;

    const syncedRows = syncedData || [];
    const syncedEmailIds = new Set(syncedRows.map((s) => s.other_agency_email_id));
    const syncedEmailNormalized = new Set(syncedRows.map((s) => s.email_normalized));
    const syncedAgencyIds = new Set(syncedRows.map((s) => s.agency_id));

    const syncedEmailRowCount = syncedRows.length;
    const syncedUniqueAgencies = syncedAgencyIds.size;

    let webhookQuery = supabase
      .from("smartlead_webhook_events")
      .select("event_type, email_normalized, campaign_id, smartlead_lead_id, received_at")
      .eq("processing_status", "processed");
    if (campaignId) webhookQuery = webhookQuery.eq("campaign_id", campaignId);

    const { data: webhookData, error: webhookError } = await webhookQuery;
    if (webhookError) throw webhookError;

    const webhookEvents = (webhookData || []).filter((evt) => {
      if (state) {
        return syncedEmailNormalized.has(evt.email_normalized);
      }
      return true;
    });

    const openedEmailRows = webhookEvents.filter((e) => e.event_type === "opened" || e.event_type === "EMAIL_OPENED").length;
    const clickedEmailRows = webhookEvents.filter((e) => e.event_type === "clicked" || e.event_type === "LINK_CLICKED").length;
    const repliedEmailRows = webhookEvents.filter((e) => e.event_type === "replied" || e.event_type === "REPLY_TO_EMAIL").length;
    const bouncedEmailRows = webhookEvents.filter((e) => e.event_type === "bounced" || e.event_type === "EMAIL_BOUNCED").length;
    const unsubscribedEmailRows = webhookEvents.filter((e) => e.event_type === "unsubscribed" || e.event_type === "UNSUBSCRIBED").length;

    const getAgencyIdForEmail = (emailNorm: string): string | null => {
      const row = syncedRows.find((s) => s.email_normalized === emailNorm);
      return row?.agency_id || null;
    };

    const getIdentityKeyForAgencyId = (agencyId: string): string => {
      const agency = agencyMap.get(agencyId);
      if (!agency) return `aid:${agencyId}`;
      const fakeEmail: EmailRowForSelection = {
        id: agencyId,
        email_normalized: "",
        agency_id: agencyId,
        global_identity_key: agency.global_identity_key,
        agency_dedupe_key: agency.agency_dedupe_key,
        website_domain_normalized: agency.website_domain_normalized,
      };
      return getIdentityKey(fakeEmail);
    };

    const openedAgencyIds = new Set<string>();
    const clickedAgencyIds = new Set<string>();
    const repliedAgencyIds = new Set<string>();
    const bouncedAgencyIds = new Set<string>();
    const unsubscribedAgencyIds = new Set<string>();

    const syncedIdentityKeys = new Set<string>();
    const openedIdentityKeys = new Set<string>();
    const clickedIdentityKeys = new Set<string>();
    const repliedIdentityKeys = new Set<string>();
    const bouncedIdentityKeys = new Set<string>();
    const unsubscribedIdentityKeys = new Set<string>();

    for (const s of syncedRows) {
      syncedIdentityKeys.add(getIdentityKeyForAgencyId(s.agency_id));
    }

    for (const evt of webhookEvents) {
      const agencyId = getAgencyIdForEmail(evt.email_normalized);
      if (!agencyId) continue;
      const identityKey = getIdentityKeyForAgencyId(agencyId);
      const type = evt.event_type;
      if (type === "opened" || type === "EMAIL_OPENED") {
        openedAgencyIds.add(agencyId);
        openedIdentityKeys.add(identityKey);
      }
      if (type === "clicked" || type === "LINK_CLICKED") {
        clickedAgencyIds.add(agencyId);
        clickedIdentityKeys.add(identityKey);
      }
      if (type === "replied" || type === "REPLY_TO_EMAIL") {
        repliedAgencyIds.add(agencyId);
        repliedIdentityKeys.add(identityKey);
      }
      if (type === "bounced" || type === "EMAIL_BOUNCED") {
        bouncedAgencyIds.add(agencyId);
        bouncedIdentityKeys.add(identityKey);
      }
      if (type === "unsubscribed" || type === "UNSUBSCRIBED") {
        unsubscribedAgencyIds.add(agencyId);
        unsubscribedIdentityKeys.add(identityKey);
      }
    }

    const syncedUniqueIdentities = syncedIdentityKeys.size;

    // ─── G: DISTORTION ANALYSIS ───────────────────────────────────────────────

    const syncedEmailsPerAgency = new Map<string, number>();
    for (const s of syncedRows) {
      syncedEmailsPerAgency.set(s.agency_id, (syncedEmailsPerAgency.get(s.agency_id) || 0) + 1);
    }

    const contactedAgenciesWith1 = [...syncedEmailsPerAgency.values()].filter((c) => c === 1).length;
    const contactedAgenciesWith2 = [...syncedEmailsPerAgency.values()].filter((c) => c === 2).length;
    const contactedAgenciesWith3Plus = [...syncedEmailsPerAgency.values()].filter((c) => c >= 3).length;

    const avgSyncedEmailsPerContactedAgency =
      syncedUniqueAgencies > 0
        ? parseFloat((syncedEmailRowCount / syncedUniqueAgencies).toFixed(2))
        : null;

    const syncedEmailsPerIdentity = new Map<string, number>();
    for (const s of syncedRows) {
      const identityKey = getIdentityKeyForAgencyId(s.agency_id);
      syncedEmailsPerIdentity.set(identityKey, (syncedEmailsPerIdentity.get(identityKey) || 0) + 1);
    }

    const contactedIdentitiesWith1 = [...syncedEmailsPerIdentity.values()].filter((c) => c === 1).length;
    const contactedIdentitiesWith2 = [...syncedEmailsPerIdentity.values()].filter((c) => c === 2).length;
    const contactedIdentitiesWith3Plus = [...syncedEmailsPerIdentity.values()].filter((c) => c >= 3).length;

    const avgSyncedEmailsPerContactedIdentity =
      syncedUniqueIdentities > 0
        ? parseFloat((syncedEmailRowCount / syncedUniqueIdentities).toFixed(2))
        : null;

    // ─── H: HEALTH + WARNINGS ─────────────────────────────────────────────────

    const health = await getSmartleadRuntimeHealth();
    const warnings: string[] = [];

    if (!health.api_key_configured) {
      warnings.push(
        "SMARTLEAD_API_KEY not visible in Edge Function runtime. If you added it in Bolt Secrets, redeploy this function."
      );
    }
    if (!health.webhook_secret_configured) {
      warnings.push("SMARTLEAD_WEBHOOK_SECRET not configured. Webhook validation may fail.");
    }
    if (pendingEmailRows > 0) {
      warnings.push(`${pendingEmailRows} emails pending verification (not yet checked by ListClean)`);
    }
    if (contaminatedEmailRows > 0) {
      warnings.push(`${contaminatedEmailRows} emails excluded due to identity contamination (email domain doesn't match agency website)`);
    }

    // ─── I: RECENT HISTORY ────────────────────────────────────────────────────

    const { data: recentRuns } = await supabase
      .from("smartlead_sync_runs")
      .select("*")
      .order("created_at", { ascending: false })
      .limit(5);

    const { data: recentEvents } = await supabase
      .from("smartlead_webhook_events")
      .select("*")
      .order("received_at", { ascending: false })
      .limit(10);

    const { data: syncHealthRows } = await supabase
      .from("smartlead_sync_health")
      .select("*")
      .order("sync_type", { ascending: true });

    // ─── RESPONSE ─────────────────────────────────────────────────────────────

    const response: StatsResponse = {
      ok: true,
      filters: { state, campaign_id: campaignId, include_inactive_agencies: false },
      raw_valid_inventory: {
        total_valid_emails: cleanEmailRows,
        valid_on_active_agencies: validOnActiveAgencies,
        valid_on_inactive_agencies: validOnInactiveAgencies,
        unique_valid_emails: uniqueValidEmails,
        unique_agencies_with_valid: uniqueAgenciesWithValid,
      },
      exclusion_breakdown: {
        excluded_inactive_agency: excludedInactiveAgency,
        excluded_identity_contaminated: excludedIdentityContaminated,
        excluded_opted_out: excludedOptedOut,
        excluded_blocked: excludedBlocked,
        total_excluded: excludedInactiveAgency + excludedIdentityContaminated + excludedOptedOut + excludedBlocked,
      },
      final_sendable: {
        sendable_email_rows: readyEmailRows,
        sendable_with_inactive: sendableWithInactive,
        unique_agencies: readyAgencyIds.size,
        unique_identities: readyIdentityKeys.size,
      },
      inventory: {
        total_email_rows: totalEmailRows,
        clean_email_rows: cleanEmailRows,
        ready_email_rows: readyEmailRows,
        invalid_email_rows: invalidEmailRows,
        pending_email_rows: pendingEmailRows,
        retry_email_rows: retryEmailRows,
        failed_email_rows: failedEmailRows,
        risky_email_rows: riskyEmailRows,
        catch_all_email_rows: catchAllEmailRows,
        contaminated_email_rows: contaminatedEmailRows,
      },
      agency_inventory: {
        total_unique_agencies: totalUniqueAgencies,
        active_agencies: activeAgenciesCount,
        inactive_agencies: inactiveAgenciesCount,
        unique_agencies_with_clean_email: uniqueAgenciesWithCleanEmail,
        unique_agencies_with_ready_email: uniqueAgenciesWithReadyEmail,
        agencies_with_1_clean_email: agenciesWith1Clean,
        agencies_with_2_clean_emails: agenciesWith2Clean,
        agencies_with_3plus_clean_emails: agenciesWith3PlusClean,
        avg_clean_emails_per_clean_agency: avgCleanEmailsPerCleanAgency,
      },
      identity_inventory: {
        unique_real_identities: uniqueRealIdentities,
        identities_with_clean_email: identitiesWithCleanEmail,
        identities_with_ready_email: identitiesWithReadyEmail,
        identities_with_1_clean_email: identitiesWith1Clean,
        identities_with_2_clean_emails: identitiesWith2Clean,
        identities_with_3plus_clean_emails: identitiesWith3PlusClean,
        avg_clean_emails_per_identity: avgCleanEmailsPerIdentity,
      },
      campaign_performance_email_level: {
        synced_email_rows: syncedEmailRowCount,
        opened_email_rows: openedEmailRows,
        clicked_email_rows: clickedEmailRows,
        replied_email_rows: repliedEmailRows,
        bounced_email_rows: bouncedEmailRows,
        unsubscribed_email_rows: unsubscribedEmailRows,
      },
      campaign_performance_agency_level: {
        synced_unique_agencies: syncedUniqueAgencies,
        opened_unique_agencies: openedAgencyIds.size,
        clicked_unique_agencies: clickedAgencyIds.size,
        replied_unique_agencies: repliedAgencyIds.size,
        bounced_unique_agencies: bouncedAgencyIds.size,
        unsubscribed_unique_agencies: unsubscribedAgencyIds.size,
      },
      campaign_performance_identity_level: {
        synced_unique_identities: syncedUniqueIdentities,
        opened_unique_identities: openedIdentityKeys.size,
        clicked_unique_identities: clickedIdentityKeys.size,
        replied_unique_identities: repliedIdentityKeys.size,
        bounced_unique_identities: bouncedIdentityKeys.size,
        unsubscribed_unique_identities: unsubscribedIdentityKeys.size,
      },
      role_based_split: {
        clean_role_based: cleanRoleBased,
        clean_personal: cleanPersonal,
        ready_role_based: readyRoleBased,
        ready_personal: readyPersonal,
      },
      distortion: {
        avg_synced_emails_per_contacted_agency: avgSyncedEmailsPerContactedAgency,
        contacted_agencies_with_1_email: contactedAgenciesWith1,
        contacted_agencies_with_2_emails: contactedAgenciesWith2,
        contacted_agencies_with_3plus_emails: contactedAgenciesWith3Plus,
        avg_synced_emails_per_contacted_identity: avgSyncedEmailsPerContactedIdentity,
        contacted_identities_with_1_email: contactedIdentitiesWith1,
        contacted_identities_with_2_emails: contactedIdentitiesWith2,
        contacted_identities_with_3plus_emails: contactedIdentitiesWith3Plus,
      },
      send_mode_comparison: {
        all_clean_emails: {
          email_rows: allCleanEmailsRows,
          unique_agencies: allCleanEmailsAgencies,
          unique_identities: allCleanEmailsIdentities,
        },
        one_per_agency: {
          email_rows: onePerAgencyRows,
          unique_agencies: onePerAgencyAgencies,
          unique_identities: onePerAgencyIdentities,
        },
      },
      health,
      warnings,
      recent_sync_runs: recentRuns || [],
      recent_webhook_events: recentEvents || [],
      sync_health: syncHealthRows || [],
    };

    return new Response(JSON.stringify(response), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Smartlead stats error:", error);
    const e = error as any;
    const message = (typeof e?.message === "string" && e.message) ? e.message
      : (typeof e?.error === "string" && e.error) ? e.error
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
