import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import {
  selectOnePerAgency,
  isRoleBasedEmail,
  getIdentityKey,
  getExclusionReason,
  EmailRowForSelection
} from "../_shared/smartleadSelection.ts";
import { buildSmartLink, computeLeadKey, generateSmartToken, signLeadParams } from "../_shared/leadIdentity.ts";
import { buildActivationDirectLink } from "../_shared/activationDirectLink.ts";
import { ALL_52_STATES } from "../_shared/allStates.ts";
import { getPaidAgencies } from "../_shared/paidAgencyResolver.ts";
import { normalizeAgencyNameStrict } from "../_shared/normalizeHelpers.ts";
// discountTiers no longer needed — we always create all 3 tiers (15/20/25)

function escapeCSVField(value: any): string {
  if (value === null || value === undefined) return "";
  const str = String(value);
  if (str.includes(",") || str.includes('"') || str.includes("\n")) {
    return `"${str.replace(/"/g, '""')}"`;
  }
  return str;
}

function buildCSVRow(fields: any[]): string {
  return fields.map(escapeCSVField).join(",");
}

const stateNameBySlug = new Map(ALL_52_STATES.map(s => [s.slug, s.name]));

function resolveStateName(slug: string | null | undefined): string {
  if (!slug) return "";
  const match = stateNameBySlug.get(slug);
  if (match) return match;
  return slug.split("-").map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(" ");
}

function isGoogleMapsUrl(url: string): boolean {
  return url.includes("google.com/maps") || url.includes("maps.google.com");
}

function resolveWebsiteUrl(websiteUrl: string | null | undefined, domainNormalized: string | null | undefined): string {
  if (websiteUrl && !isGoogleMapsUrl(websiteUrl)) {
    return websiteUrl;
  }
  if (domainNormalized && domainNormalized.trim() !== "") {
    const d = domainNormalized.trim().toLowerCase();
    if (!d.includes("/") && d.includes(".")) {
      return `https://${d}`;
    }
  }
  return "";
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const authResult = await requireAdminSession(req);
    if (authResult instanceof Response) return authResult;

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") || "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || ""
    );

    const url = new URL(req.url);
    const campaignId = url.searchParams.get("campaign_id") || undefined;
    const state = url.searchParams.get("state") || undefined;
    const sendMode = url.searchParams.get("send_mode") || "all_clean_emails";
    const excludeAlreadySynced =
      url.searchParams.get("exclude_already_synced") !== "false" && !!campaignId;
    const includeContaminated = url.searchParams.get("include_contaminated") === "true";
    const includeInactiveAgencies = url.searchParams.get("include_inactive_agencies") === "true";
    const discountLinkMode = url.searchParams.get("discount_link_mode") || "none"; // "none" | "existing" | "auto_create"
    const agencyIdsParam = url.searchParams.get("agency_ids") || undefined;
    const agencyIds = agencyIdsParam ? agencyIdsParam.split(",").map(id => id.trim()).filter(Boolean) : undefined;

    const csvHeaders = buildCSVRow([
      "email",
      "first_name",
      "last_name",
      "company_name",
      "website",
      "phone_number",
      "state_slug",
      "state_name",
      "agency_slug",
      "agency_id",
      "other_agency_email_id",
      "send_mode",
      "source",
      "your_agency_url",
      "smart_next_url",
      "best_next_step",
      "best_next_reason",
      "qualified_views",
      "intent_score",
      "is_primary",
      "is_role_based",
      "validation_status",
      "selection_reason",
      "identity_key",
      "email_domain",
      "website_domain",
      "domain_match_status",
      "is_identity_contaminated",
      "excluded_reason",
      "agency_is_active",
      "manage_listing_url_v2",
      "request_replay_url_v2",
      "REQUEST_COMPARE_URL",
      "activation_direct_link",
      "activation_discount_link_15",
      "activation_discount_link_20",
      "activation_discount_link_25",
      // ── Appended engagement columns (agency-level, not token-level) ──
      "engaged_leads_count",
      "total_interactions",
      "trigger_flags",
      // ── Multi-dimensional scoring (agency-level) ──
      "positive_intent_score",
      "churn_intent_score",
      "recovery_opportunity_score",
      "final_priority_score",
      "recovery_priority",
      "manage_opened_count",
      "manage_remove_intent_count",
      "manage_recovered_count",
      "manage_removed_count",
    ]);

    // ─── SCALABLE PAGINATED JOIN QUERY WITH FUNNEL STATE ─────────────────────
    // PostgREST returns max 1000 rows per request. We paginate with .range().
    // We do NOT use .in("agency_id", [...]) — for NJ (8,500+ agencies) that
    // exceeds URL length limits. The !inner join + state_slug filter is server-side.
    // LEFT JOIN lead_funnel_state so missing state doesn't remove agencies from export.

    const PAGE_SIZE = 1000;
    const emailsRaw: any[] = [];
    const leadStates = new Map<string, any>(); // Map of "${agency_id}:${lead_key}" -> state
    let fetchOffset = 0;

    // First, fetch all lead_funnel_state rows for this state filter (if any)
    // This is more efficient than joining on every pagination loop
    if (state) {
      const { data: stateData } = await supabase
        .from("lead_funnel_state")
        .select("*")
        .eq("state_slug", state);

      (stateData || []).forEach((s: any) => {
        // Use composite key to prevent collision between different agencies with same email
        const compositeKey = `${s.agency_id}:${s.lead_key}`;
        leadStates.set(compositeKey, s);
      });
    }

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
            name,
            slug,
            state_slug,
            website_url,
            website_domain_normalized,
            global_identity_key,
            agency_dedupe_key,
            is_active,
            description,
            short_description
          )
        `)
        .eq("validation_status", "valid")
        .not("outreach_status", "in", '("opted_out","blocked")')
        .order("created_at", { ascending: true })
        .range(fetchOffset, fetchOffset + PAGE_SIZE - 1);

      if (agencyIds && agencyIds.length > 0) {
        emailQuery = emailQuery.in("agency_id", agencyIds);
      } else if (state) {
        emailQuery = emailQuery.eq("other_agencies.state_slug", state);
      }

      if (!includeInactiveAgencies) {
        emailQuery = emailQuery.eq("other_agencies.is_active", true);
      }

      const { data: page, error: pageError } = await emailQuery;
      if (pageError) throw pageError;

      const rows = page || [];
      emailsRaw.push(...rows);

      if (rows.length < PAGE_SIZE) break;
      fetchOffset += PAGE_SIZE;
    }

    // Build already-synced exclusion set
    const alreadySyncedEmails = new Set<string>();
    if (excludeAlreadySynced && campaignId) {
      const { data: syncedData } = await supabase
        .from("smartlead_campaign_email_sync")
        .select("other_agency_email_id")
        .eq("campaign_id", campaignId)
        .eq("sync_status", "synced");
      (syncedData || []).forEach((s: any) => alreadySyncedEmails.add(s.other_agency_email_id));
    }

    // Enrich emails with agency identity fields and filter
    interface EnrichedEmail extends EmailRowForSelection {
      validation_status: string;
      outreach_status?: string;
      agency_name: string;
      agency_slug: string;
      state_slug: string;
      website_url: string;
      agency_is_active: boolean;
      agency_description: string;
    }

    const enrichedEmails: EnrichedEmail[] = [];
    const excludedEmails: Array<EnrichedEmail & { excluded_reason: string }> = [];
    // Dedupe by normalized email — first valid row wins, duplicates are dropped
    const seenEmails = new Set<string>();

    for (const row of (emailsRaw || [])) {
      if (alreadySyncedEmails.has(row.id)) continue;

      const agency = (row as any).other_agencies;
      if (!agency) continue;

      // Skip exact duplicate email addresses
      if (seenEmails.has(row.email_normalized)) continue;
      seenEmails.add(row.email_normalized);

      const enriched: EnrichedEmail = {
        id: row.id,
        agency_id: row.agency_id,
        email_normalized: row.email_normalized,
        email_domain: row.email_domain,
        validation_status: row.validation_status,
        outreach_status: row.outreach_status,
        is_primary: row.is_primary,
        domain_match_status: row.domain_match_status,
        is_identity_contaminated: row.is_identity_contaminated,
        global_identity_key: agency.global_identity_key,
        agency_dedupe_key: agency.agency_dedupe_key,
        website_domain_normalized: agency.website_domain_normalized,
        agency_name: agency.name,
        agency_slug: agency.slug,
        state_slug: agency.state_slug,
        website_url: resolveWebsiteUrl(agency.website_url, agency.website_domain_normalized),
        agency_is_active: agency.is_active,
        agency_description: (agency.short_description || agency.description || "").toString().trim(),
      };

      const exclusionReason = getExclusionReason(enriched);
      if (exclusionReason && !includeContaminated) {
        excludedEmails.push({ ...enriched, excluded_reason: exclusionReason });
        continue;
      }

      enrichedEmails.push(enriched);
    }

    if (enrichedEmails.length === 0 && excludedEmails.length === 0) {
      return new Response(`${csvHeaders}\n`, {
        status: 200,
        headers: {
          ...CORS_HEADERS,
          "Content-Type": "text/csv; charset=utf-8",
          "Content-Disposition": 'attachment; filename="smartlead-export.csv"',
        },
      });
    }

    // Apply send_mode selection using identity-aware deduplication
    let selectedEmails: EnrichedEmail[];
    let selectionReason: string;

    if (sendMode === "one_per_agency") {
      selectedEmails = selectOnePerAgency(enrichedEmails);
      selectionReason = "one_per_real_identity";
    } else {
      selectedEmails = enrichedEmails;
      selectionReason = "all_clean_emails";
    }

    // ─── Paid-customer agency suppression (HARD GUARDRAIL) ────────────────────
    // Block ALL contacts of any agency that has paid for ANY listing tier.
    // Matching priority (state-strict): agency_id → name+state_slug → name+state_name.
    // Excluded rows are tagged `excluded_reason = 'paid_customer_agency'` and dropped
    // from the export (kept in `excludedEmails` so debug-mode CSVs can still show them).
    let excludedPaidCustomerAgencyCount = 0;
    try {
      const paidAgencies = await getPaidAgencies(supabase, { stateSlug: state || null });
      const paidByAgencyId = new Set<string>();
      const paidByNameState = new Set<string>();
      for (const p of paidAgencies) {
        if (p.agency_id) paidByAgencyId.add(p.agency_id);
        if (p.state_slug && p.agency_name_canonical) {
          paidByNameState.add(`${p.agency_name_canonical}|${p.state_slug}`);
        }
        if (p.state_slug && p.agency_name_preserved) {
          paidByNameState.add(`${p.agency_name_preserved}|${p.state_slug}`);
        }
      }

      const kept: EnrichedEmail[] = [];
      for (const email of selectedEmails) {
        let suppressed = false;
        if (email.agency_id && paidByAgencyId.has(email.agency_id)) {
          suppressed = true;
        } else if (email.state_slug) {
          const norm = normalizeAgencyNameStrict(email.agency_name);
          if (norm.canonical && paidByNameState.has(`${norm.canonical}|${email.state_slug}`)) {
            suppressed = true;
          } else if (norm.preserved && paidByNameState.has(`${norm.preserved}|${email.state_slug}`)) {
            suppressed = true;
          }
        }
        if (suppressed) {
          excludedPaidCustomerAgencyCount++;
          excludedEmails.push({ ...email, excluded_reason: "paid_customer_agency" });
        } else {
          kept.push(email);
        }
      }
      selectedEmails = kept;
    } catch (paidErr) {
      console.warn("[export] paid-agency suppression skipped (non-fatal):", (paidErr as Error).message);
    }

    const BASE_URL = "https://www.gappsy.com";

    // --- Pass 1: pre-generate compact tokens for all selected emails ---
    // Each token maps to the same signed payload as the old ?aid/lid/ts/sig params.
    // We batch-insert them all before building the CSV so the resolver can look
    // them up the instant a recipient clicks the link.
    const tokenByEmailId = new Map<string, string>(); // email.id → token
    const tokenInsertBatch: {
      token: string;
      agency_id: string;
      agency_slug: string | null;
      lead_key: string;
      ts: number;
      sig: string;
    }[] = [];

    for (const email of selectedEmails) {
      if (!email.agency_slug) continue;
      const leadKey = computeLeadKey(email.email_normalized);
      const ts = Date.now();
      const sig = signLeadParams({ agency_id: email.agency_id, lead_key: leadKey, timestamp: ts });
      const token = generateSmartToken();
      tokenByEmailId.set(email.id, token);
      tokenInsertBatch.push({
        token,
        agency_id: email.agency_id,
        agency_slug: email.agency_slug || null,
        lead_key: leadKey,
        ts,
        sig,
      });
    }

    if (tokenInsertBatch.length > 0) {
      const { error: tokenError } = await supabase
        .from("smart_link_tokens")
        .insert(tokenInsertBatch);
      if (tokenError) {
        console.error("[export] smart_link_tokens batch insert failed:", tokenError.message);
        // Clear map so the CSV loop falls back to legacy URL format silently.
        tokenByEmailId.clear();
      }
    }

    // --- Pass 1b: fetch engagement from agency-funnel-summary (single source of truth) ---
    // agency-funnel-summary is the canonical source for all engagement metrics and triggers.
    // We call it per unique agency_id in parallel (concurrency-limited) so there is
    // ZERO duplicate logic here — dedup, rename, and trigger decisions all live there.

    type EngagementRow = { engaged_leads_count: number; total_interactions: number; trigger_flags: string };
    const engagementByAgency = new Map<string, EngagementRow>();

    try {
      const uniqueAgencyIds = [...new Set(selectedEmails.map(e => e.agency_id).filter(Boolean))];

      if (uniqueAgencyIds.length > 0) {
        const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
        const SERVICE_KEY  = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
        const CONCURRENCY  = 20;

        for (let i = 0; i < uniqueAgencyIds.length; i += CONCURRENCY) {
          const batch = uniqueAgencyIds.slice(i, i + CONCURRENCY);

          const results = await Promise.all(
            batch.map(async (agencyId) => {
              try {
                const res = await fetch(
                  `${SUPABASE_URL}/functions/v1/agency-funnel-summary?agency_id=${encodeURIComponent(agencyId)}`,
                  { headers: { Authorization: `Bearer ${SERVICE_KEY}` } }
                );
                const data = await res.json();
                if (!data.ok) return { agencyId, eng: null };
                return {
                  agencyId,
                  eng: {
                    engaged_leads_count: data.engagement.engaged_leads_count as number,
                    total_interactions:  data.engagement.total_interactions as number,
                    trigger_flags:       JSON.stringify(data.triggers),
                  },
                };
              } catch {
                return { agencyId, eng: null };
              }
            })
          );

          for (const { agencyId, eng } of results) {
            if (eng) engagementByAgency.set(agencyId, eng);
          }
        }
      }
    } catch (engErr) {
      console.warn("[export] engagement fetch failed (non-fatal):", (engErr as Error).message);
    }

    // --- Pass 1c: fetch intent scores v2 (multi-dimensional scoring with manage funnel) ---
    type IntentScoreRow = {
      positive_intent_score: number;
      churn_intent_score: number;
      recovery_opportunity_score: number;
      final_priority_score: number;
      recovery_priority: string;
      manage_opened_count: number;
      manage_remove_intent_count: number;
      manage_recovered_count: number;
      manage_removed_count: number;
    };
    const intentScoresByAgency = new Map<string, IntentScoreRow>();

    if (state) {
      try {
        const { data: scoresData, error: scoresError } = await supabase.rpc(
          "compute_agency_intent_scores_v2",
          { p_state_slug: state }
        );

        if (scoresError) {
          console.warn("[export] intent scores v2 fetch failed (non-fatal):", scoresError.message);
        } else if (Array.isArray(scoresData)) {
          for (const score of scoresData) {
            intentScoresByAgency.set(score.agency_id, {
              positive_intent_score: score.positive_intent_score || 0,
              churn_intent_score: score.churn_intent_score || 0,
              recovery_opportunity_score: score.recovery_opportunity_score || 0,
              final_priority_score: score.final_priority_score || 0,
              recovery_priority: score.recovery_priority || "none",
              manage_opened_count: score.manage_opened_count || 0,
              manage_remove_intent_count: score.manage_remove_intent_count || 0,
              manage_recovered_count: score.manage_recovered_count || 0,
              manage_removed_count: score.manage_removed_count || 0,
            });
          }
        }
      } catch (scoresErr) {
        console.warn("[export] intent scores v2 fetch failed (non-fatal):", (scoresErr as Error).message);
      }
    }

    // --- Pass 1d: resolve activation discount offers per agency (3 tiers: 15/20/25) ---
    // Modes: "none" = skip entirely, "existing" = lookup only, "auto_create" = reuse or create
    const DISCOUNT_TIERS = [15, 20, 25] as const;
    type DiscountTierTokens = { t15: string; t20: string; t25: string };
    const discountTokensByAgency = new Map<string, DiscountTierTokens>();

    if (discountLinkMode === "existing" || discountLinkMode === "auto_create") {
      try {
        // Build unique agency+state pairs from actual email rows (not a single global state)
        const agencyStatePairs = new Map<string, { agencyId: string; stateSlug: string; slug: string | null }>();
        for (const e of selectedEmails) {
          if (!e.agency_id) continue;
          const compositeKey = `${e.agency_id}:${e.state_slug || ""}`;
          if (!agencyStatePairs.has(compositeKey)) {
            agencyStatePairs.set(compositeKey, { agencyId: e.agency_id, stateSlug: e.state_slug || "", slug: e.agency_slug || null });
          }
        }

        if (agencyStatePairs.size > 0) {
          const now = new Date();
          const PAGE = 1000;
          const uniqueAgencyIds = [...new Set([...agencyStatePairs.values()].map(p => p.agencyId))];
          const uniqueStateSlugs = [...new Set([...agencyStatePairs.values()].map(p => p.stateSlug))];

          // Step A: fetch all existing valid activation offers grouped by agency+state+percentage
          const existingByKey = new Map<string, string>(); // "agencyId:stateSlug:pct" -> token
          for (let i = 0; i < uniqueAgencyIds.length; i += PAGE) {
            const batch = uniqueAgencyIds.slice(i, i + PAGE);
            let offersQuery = supabase
              .from("discount_offers")
              .select("agency_id, state_slug, token, discount_type, discount_value, allowed_products, expires_at, max_uses, usage_count, is_active")
              .in("agency_id", batch)
              .eq("is_active", true)
              .eq("discount_type", "percentage");
            // Filter by known state_slugs if all rows share one state; otherwise fetch all and filter client-side
            if (uniqueStateSlugs.length === 1 && uniqueStateSlugs[0]) {
              offersQuery = offersQuery.eq("state_slug", uniqueStateSlugs[0]);
            } else if (uniqueStateSlugs.length === 1 && !uniqueStateSlugs[0]) {
              offersQuery = offersQuery.is("state_slug", null);
            }
            // If multiple states, we fetch all and filter below
            const { data: offers } = await offersQuery;
            if (Array.isArray(offers)) {
              for (const o of offers) {
                if (o.max_uses !== null && o.max_uses !== undefined && o.usage_count >= o.max_uses) continue;
                if (o.expires_at && new Date(o.expires_at) < now) continue;
                const products: string[] = o.allowed_products || [];
                if (!products.includes("activation") && !products.includes("all")) continue;
                const pct = Math.round(Number(o.discount_value));
                if (!DISCOUNT_TIERS.includes(pct as 15|20|25)) continue;
                const key = `${o.agency_id}:${o.state_slug || ""}:${pct}`;
                if (!existingByKey.has(key)) {
                  existingByKey.set(key, o.token);
                }
              }
            }
          }

          // Populate existing tokens per agency+state pair
          for (const [compositeKey, pair] of agencyStatePairs) {
            const t15 = existingByKey.get(`${pair.agencyId}:${pair.stateSlug}:15`) || "";
            const t20 = existingByKey.get(`${pair.agencyId}:${pair.stateSlug}:20`) || "";
            const t25 = existingByKey.get(`${pair.agencyId}:${pair.stateSlug}:25`) || "";
            if (t15 && t20 && t25) {
              discountTokensByAgency.set(compositeKey, { t15, t20, t25 });
            }
          }

          // Step B: auto-create missing tier offers per agency+state pair
          if (discountLinkMode === "auto_create") {
            const exportBatchId = `sle-${Date.now()}-${Math.random().toString(36).slice(2, 6)}`;
            const expiresAt = new Date();
            expiresAt.setDate(expiresAt.getDate() + 30);
            const expiresIso = expiresAt.toISOString();

            const insertRows: any[] = [];
            const pendingByCompositeKey = new Map<string, Partial<DiscountTierTokens>>();

            for (const [compositeKey, pair] of agencyStatePairs) {
              if (discountTokensByAgency.has(compositeKey)) continue;
              const scores = intentScoresByAgency.get(pair.agencyId);
              const rawIntent = scores?.positive_intent_score ?? null;
              const partial: Partial<DiscountTierTokens> = {};

              for (const pct of DISCOUNT_TIERS) {
                const existing = existingByKey.get(`${pair.agencyId}:${pair.stateSlug}:${pct}`);
                if (existing) {
                  if (pct === 15) partial.t15 = existing;
                  if (pct === 20) partial.t20 = existing;
                  if (pct === 25) partial.t25 = existing;
                  continue;
                }
                const token = crypto.randomUUID().replace(/-/g, "");
                if (pct === 15) partial.t15 = token;
                if (pct === 20) partial.t20 = token;
                if (pct === 25) partial.t25 = token;
                insertRows.push({
                  agency_id: pair.agencyId,
                  agency_slug: pair.slug || null,
                  state_slug: pair.stateSlug || null,
                  token,
                  discount_type: "percentage",
                  discount_value: pct,
                  allowed_products: ["activation"],
                  max_uses: 1,
                  usage_count: 0,
                  is_active: true,
                  expires_at: expiresIso,
                  intent_score_at_creation: rawIntent !== null ? Math.round(rawIntent) : null,
                  internal_note: `${pct}% discount | batch: ${exportBatchId}`,
                  created_by: "smartlead_export",
                });
              }
              pendingByCompositeKey.set(compositeKey, partial);
            }

            console.log(`[export] discount auto-create: ${insertRows.length} new offers for ${pendingByCompositeKey.size} agency+state pairs (${discountTokensByAgency.size} fully reused)`);

            const BATCH_INSERT = 200;
            for (let i = 0; i < insertRows.length; i += BATCH_INSERT) {
              const batch = insertRows.slice(i, i + BATCH_INSERT);
              const { error: insertErr } = await supabase
                .from("discount_offers")
                .insert(batch);
              if (insertErr) {
                console.error("[export] discount auto-create batch insert failed:", insertErr.message);
              }
            }

            for (const [compositeKey, partial] of pendingByCompositeKey) {
              discountTokensByAgency.set(compositeKey, {
                t15: partial.t15 || "",
                t20: partial.t20 || "",
                t25: partial.t25 || "",
              });
            }

            console.log(`[export] discount auto-create complete: ${discountTokensByAgency.size} total agency+state pairs with offers`);
          }
        }
      } catch (discErr) {
        console.warn("[export] discount offers processing failed (non-fatal):", (discErr as Error).message);
      }
    }

    // --- Pass 2: build CSV rows using pre-generated tokens ---
    const csvLines: string[] = [csvHeaders];

    for (const email of selectedEmails) {
      const identityKey = getIdentityKey(email);
      const yourAgencyUrl = email.agency_slug
        ? `${BASE_URL}/your-agency/${email.agency_slug}`
        : "";

      // Generate lead_key and look up funnel state using composite key
      const leadKey = computeLeadKey(email.email_normalized);
      const compositeKey = `${email.agency_id}:${leadKey}`;
      const funnelState = leadStates.get(compositeKey);

      let smartNextUrl = "";
      let bestNextStep = "";
      let bestNextReason = "";
      let qualifiedViews = "";
      let intentScore = "";

      if (email.agency_slug) {
        const token = tokenByEmailId.get(email.id);
        if (token) {
          // New clean URL: /continue/<slug>?c=<token>
          smartNextUrl = `${BASE_URL}/continue/${email.agency_slug}?c=${token}`;
        } else {
          // Fallback to legacy signed URL if token batch insert failed
          smartNextUrl = buildSmartLink(BASE_URL, email.agency_slug, {
            agency_id: email.agency_id,
            lead_email: email.email_normalized,
            lead_key: leadKey,
          });
        }

        if (funnelState) {
          bestNextStep = funnelState.best_next_step || "";
          bestNextReason = funnelState.best_next_reason || "";
          qualifiedViews = String(funnelState.your_agency_qualified_views_count || 0);
          intentScore = String(funnelState.intent_score || 0);
        }
      }

      const token = tokenByEmailId.get(email.id);
      const manageParams = new URLSearchParams();
      if (token) manageParams.set("c", token);
      if (email.agency_id) manageParams.set("aid", email.agency_id);
      if (email.state_slug) manageParams.set("stateSlug", email.state_slug);
      // Require canonical identifiers to guarantee the funnel resolves deterministically.
      const manageListingUrl = token && email.agency_slug && email.agency_id && email.state_slug
        ? `${BASE_URL}/manage-listing/${email.agency_slug}?${manageParams.toString()}`
        : "";
      const replayParams = new URLSearchParams();
      if (token) replayParams.set("c", token);
      if (email.agency_id) replayParams.set("aid", email.agency_id);
      if (email.state_slug) replayParams.set("stateSlug", email.state_slug);
      const requestReplayUrl = token && email.agency_slug && email.agency_id && email.state_slug
        ? `${BASE_URL}/request-replay/${email.agency_slug}?${replayParams.toString()}`
        : "";
      const requestCompareUrl = token && email.agency_slug && email.agency_id && email.state_slug
        ? `${BASE_URL}/request-compare/${email.agency_slug}?${replayParams.toString()}`
        : "";

      const eng = engagementByAgency.get(email.agency_id);
      const intentScores = intentScoresByAgency.get(email.agency_id);
      const row = buildCSVRow([
        email.email_normalized,
        "",
        "",
        email.agency_name,
        email.website_url,
        "",
        email.state_slug,
        resolveStateName(email.state_slug),
        email.agency_slug || "",
        email.agency_id,
        email.id,
        sendMode,
        "gappsy_other_agencies",
        yourAgencyUrl,
        smartNextUrl,
        bestNextStep,
        bestNextReason,
        qualifiedViews,
        intentScore,
        email.is_primary ? "Y" : "N",
        isRoleBasedEmail(email.email_normalized) ? "Y" : "N",
        email.validation_status,
        selectionReason,
        identityKey,
        email.email_domain || "",
        email.website_domain_normalized || "",
        email.domain_match_status || "",
        email.is_identity_contaminated ? "Y" : "N",
        "",
        email.agency_is_active ? "Y" : "N",
        manageListingUrl,
        requestReplayUrl,
        requestCompareUrl,
        buildActivationDirectLink({
          agencyId: email.agency_id,
          agencyName: email.agency_name,
          stateName: email.state_slug
            ? (ALL_52_STATES.find(s => s.slug === email.state_slug)?.name || null)
            : null,
          stateSlug: email.state_slug,
          agencyWebsite: email.website_url,
          agencyDescription: email.agency_description,
        }) ?? "",
        (() => { const dk = `${email.agency_id}:${email.state_slug || ""}`; return discountTokensByAgency.get(dk)?.t15 ? `${BASE_URL}/offer/${discountTokensByAgency.get(dk)!.t15}` : ""; })(),
        (() => { const dk = `${email.agency_id}:${email.state_slug || ""}`; return discountTokensByAgency.get(dk)?.t20 ? `${BASE_URL}/offer/${discountTokensByAgency.get(dk)!.t20}` : ""; })(),
        (() => { const dk = `${email.agency_id}:${email.state_slug || ""}`; return discountTokensByAgency.get(dk)?.t25 ? `${BASE_URL}/offer/${discountTokensByAgency.get(dk)!.t25}` : ""; })(),
        eng?.engaged_leads_count ?? "",
        eng?.total_interactions ?? "",
        eng?.trigger_flags ?? "",
        // Multi-dimensional scoring (agency-level)
        intentScores?.positive_intent_score ?? "",
        intentScores?.churn_intent_score ?? "",
        intentScores?.recovery_opportunity_score ?? "",
        intentScores?.final_priority_score ?? "",
        intentScores?.recovery_priority ?? "",
        intentScores?.manage_opened_count ?? "",
        intentScores?.manage_remove_intent_count ?? "",
        intentScores?.manage_recovered_count ?? "",
        intentScores?.manage_removed_count ?? "",
      ]);
      csvLines.push(row);
    }

    // Optionally include excluded rows at the end with their exclusion reason
    if (includeContaminated) {
      for (const email of excludedEmails) {
        const identityKey = getIdentityKey(email);
        const yourAgencyUrl = email.agency_slug
          ? `${BASE_URL}/your-agency/${email.agency_slug}`
          : "";

        // Generate smart routing fields for excluded emails too
        const leadKey = computeLeadKey(email.email_normalized);
        const compositeKey = `${email.agency_id}:${leadKey}`;
        const funnelState = leadStates.get(compositeKey);

        let smartNextUrl = "";
        let bestNextStep = "";
        let bestNextReason = "";
        let qualifiedViews = "";
        let intentScore = "";

        if (email.agency_slug) {
          smartNextUrl = buildSmartLink(BASE_URL, email.agency_slug, {
            agency_id: email.agency_id,
            lead_email: email.email_normalized,
            lead_key: leadKey,
          });

          if (funnelState) {
            bestNextStep = funnelState.best_next_step || "";
            bestNextReason = funnelState.best_next_reason || "";
            qualifiedViews = String(funnelState.your_agency_qualified_views_count || 0);
            intentScore = String(funnelState.intent_score || 0);
          }
        }

        const engEx = engagementByAgency.get(email.agency_id);
        const intentScoresEx = intentScoresByAgency.get(email.agency_id);
        const row = buildCSVRow([
          email.email_normalized,
          "",
          "",
          email.agency_name,
          email.website_url,
          "",
          email.state_slug,
          resolveStateName(email.state_slug),
          email.agency_slug || "",
          email.agency_id,
          email.id,
          sendMode,
          "gappsy_other_agencies",
          yourAgencyUrl,
          smartNextUrl,
          bestNextStep,
          bestNextReason,
          qualifiedViews,
          intentScore,
          email.is_primary ? "Y" : "N",
          isRoleBasedEmail(email.email_normalized) ? "Y" : "N",
          email.validation_status,
          "EXCLUDED",
          identityKey,
          email.email_domain || "",
          email.website_domain_normalized || "",
          email.domain_match_status || "",
          "Y",
          email.excluded_reason,
          email.agency_is_active ? "Y" : "N",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          engEx?.engaged_leads_count ?? "",
          engEx?.total_interactions ?? "",
          engEx?.trigger_flags ?? "",
          // Multi-dimensional scoring (agency-level)
          intentScoresEx?.positive_intent_score ?? "",
          intentScoresEx?.churn_intent_score ?? "",
          intentScoresEx?.recovery_opportunity_score ?? "",
          intentScoresEx?.final_priority_score ?? "",
          intentScoresEx?.recovery_priority ?? "",
          intentScoresEx?.manage_opened_count ?? "",
          intentScoresEx?.manage_remove_intent_count ?? "",
          intentScoresEx?.manage_recovered_count ?? "",
          intentScoresEx?.manage_removed_count ?? "",
        ]);
        csvLines.push(row);
      }
    }

    const csvContent = csvLines.join("\n");

    return new Response(csvContent, {
      status: 200,
      headers: {
        ...CORS_HEADERS,
        "Content-Type": "text/csv; charset=utf-8",
        "Content-Disposition": `attachment; filename="smartlead-export-${new Date().toISOString().split("T")[0]}.csv"`,
        "X-Excluded-Paid-Customer-Agency-Count": String(excludedPaidCustomerAgencyCount),
        "X-Future-Export-Protection": "enabled",
      },
    });
  } catch (error) {
    const e = error as any;
    const message = (typeof e?.message === "string" && e.message) ? e.message
      : (typeof e?.error === "string" && e.error) ? e.error
      : String(error);
    console.error("smartlead-export-eligible-contacts error:", message, e?.details, e?.hint);
    return new Response(
      JSON.stringify({ ok: false, error: message, details: e?.details, hint: e?.hint, code: e?.code }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
