import { createClient } from "npm:@supabase/supabase-js@2";
import { CORS_HEADERS, requireAdminSession } from "../_shared/adminSession.ts";
import { getPaidAgencies, type PaidAgencyRecord } from "../_shared/paidAgencyResolver.ts";
import { normalizeAgencyNameStrict } from "../_shared/normalizeHelpers.ts";
import { ALL_52_STATES } from "../_shared/allStates.ts";
import { getExclusionReason } from "../_shared/smartleadSelection.ts";

type PaidSourceType =
  | "stripe_verified"
  | "manual_top25"
  | "manual_standard"
  | "legacy_paid_flag"
  | "spotlight";

type MatchMethod = "agency_id" | "name_state_slug" | "name_state_name" | "fuzzy_name";
type MatchConfidence = "exact" | "high" | "medium" | "low";

interface SuppressedPaidAgency {
  agency_id: string;
  agency_name: string | null;
  normalized_agency_name: string | null;
  state_slug: string | null;
  state_name: string | null;
  listing_type: string;
  top25_rank: number | null;
  paid_source: PaidAgencyRecord["source"];
  paid_source_type: PaidSourceType;
  paid_at: string | null;
  confidence: "exact" | "high" | "medium" | "low";
  requires_manual_review: boolean;
  matched_email_count: number;
  protected_from_future_exports: true;
}

interface MatchedSuppressionEmail {
  email: string;
  email_normalized: string;
  company_name: string | null;
  state: string | null;
  state_slug: string | null;
  agency_id: string;
  paid_agency_id: string;
  paid_agency_name: string | null;
  listing_type: string;
  top25_rank: number | null;
  paid_source_type: PaidSourceType;
  paid_at: string | null;
  match_method: MatchMethod;
  match_confidence: MatchConfidence;
  fallback_email_source: boolean;
  suppression_reason: string;
}

interface SuppressionResponse {
  generated_at: string;
  filters: { stateSlug: string | null; listingType: string | null; includeFuzzy: boolean };
  summary: {
    total_paid_agencies: number;
    total_leads_suppressed: number;
    suppressed_agencies_with_zero_emails: number;
    leads_by_match_method: Record<string, number>;
    paid_agencies_by_listing_type: Record<string, number>;
    paid_agencies_by_source_type: Record<string, number>;
    fallback_email_source_count: number;
    requires_manual_review_count: number;
    future_export_protection_enabled: true;
    identity_layer_present: true;
  };
  suppressed_paid_agencies: SuppressedPaidAgency[];
  matched_suppression_emails: MatchedSuppressionEmail[];
  warnings: string[];
  // Backwards-compatible aliases (older clients)
  paid_agencies: PaidAgencyRecord[];
  leads: MatchedSuppressionEmail[];
}

function stateNameForSlug(slug: string | null | undefined): string | null {
  if (!slug) return null;
  return ALL_52_STATES.find((s) => s.slug === slug)?.name ?? null;
}

function tokenSetRatio(a: string, b: string): number {
  const ta = new Set(a.split(/\s+/).filter(Boolean));
  const tb = new Set(b.split(/\s+/).filter(Boolean));
  if (ta.size === 0 || tb.size === 0) return 0;
  let intersect = 0;
  for (const t of ta) if (tb.has(t)) intersect++;
  const union = new Set([...ta, ...tb]).size;
  return intersect / union;
}

function dedupeKey(lead: MatchedSuppressionEmail): string {
  return `${lead.email_normalized}|${lead.agency_id}|${lead.state_slug ?? ""}`;
}

function derivePaidSourceType(record: PaidAgencyRecord): PaidSourceType {
  switch (record.source) {
    case "agency_listings":
    case "stripe_orders":
      return "stripe_verified";
    case "top25_slots":
      return "manual_top25";
    case "spotlight_placements":
      return "spotlight";
    case "paid_override": {
      const lt = (record.listing_type || "").toLowerCase();
      if (lt.includes("top25") || lt.includes("rank")) return "manual_top25";
      return "manual_standard";
    }
    case "is_paid_listing":
      return "legacy_paid_flag";
    default:
      return "manual_standard";
  }
}

function paidIdentityKey(record: PaidAgencyRecord): string | null {
  if (!record.agency_id) return null;
  return `${record.agency_id}|${record.state_slug ?? ""}`;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    await requireAdminSession(req);
  } catch (e) {
    return new Response(JSON.stringify({ error: (e as Error).message }), {
      status: 401,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }

  try {
    const url = new URL(req.url);
    const stateSlug = url.searchParams.get("state_slug") || null;
    const listingType = url.searchParams.get("listing_type") || null;
    const includeFuzzy = url.searchParams.get("include_fuzzy") === "true";
    const fuzzyThreshold = Math.max(0.7, Math.min(1, parseFloat(url.searchParams.get("fuzzy_threshold") || "0.85")));

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const paidAgencies = await getPaidAgencies(supabase, { stateSlug, listingType });

    const paidByAgencyId = new Map<string, PaidAgencyRecord>();
    for (const p of paidAgencies) {
      if (p.agency_id) {
        const key = `${p.agency_id}|${p.state_slug ?? ""}`;
        if (!paidByAgencyId.has(key)) paidByAgencyId.set(key, p);
      }
    }

    const paidByNameSlug = new Map<string, PaidAgencyRecord>();
    const paidByNameStateName = new Map<string, PaidAgencyRecord>();
    const paidNamesAll: { record: PaidAgencyRecord; canonical: string; preserved: string; stateSlug: string }[] = [];
    for (const p of paidAgencies) {
      if (!p.state_slug) continue;
      const canonical = p.agency_name_canonical;
      const preserved = p.agency_name_preserved;
      if (canonical) {
        paidByNameSlug.set(`${canonical}|${p.state_slug}`, p);
        const stateName = stateNameForSlug(p.state_slug);
        if (stateName) paidByNameStateName.set(`${canonical}|${stateName.toLowerCase()}`, p);
      }
      if (preserved) {
        paidByNameSlug.set(`${preserved}|${p.state_slug}`, p);
      }
      if (canonical && preserved) {
        paidNamesAll.push({ record: p, canonical, preserved, stateSlug: p.state_slug });
      }
    }

    const matchedEmails: MatchedSuppressionEmail[] = [];
    const seenKeys = new Set<string>();
    const matchCounts: Record<string, number> = {
      agency_id: 0,
      name_state_slug: 0,
      name_state_name: 0,
      fuzzy_name: 0,
    };
    const matchedCountByPaid = new Map<string, number>();

    const chunk = 1000;
    let page = 0;
    while (true) {
      const from = page * chunk;
      const to = from + chunk - 1;
      let q = supabase
        .from("other_agency_emails")
        .select(`
          id,
          email,
          email_normalized,
          agency_id,
          validation_status,
          outreach_status,
          domain_match_status,
          is_identity_contaminated,
          agency:other_agencies!inner(id, name, state_slug, is_active)
        `)
        .eq("validation_status", "valid")
        .not("outreach_status", "in", "(opted_out,blocked)")
        .order("id")
        .range(from, to);
      if (stateSlug) q = q.eq("agency.state_slug", stateSlug);
      const { data, error } = await q;
      if (error) throw new Error(`other_agency_emails fetch: ${error.message}`);
      const rows = data || [];

      for (const row of rows) {
        // deno-lint-ignore no-explicit-any
        const ag = (row as any).agency;
        if (!ag) continue;
        if (!row.email_normalized || !row.agency_id) continue;

        const exclusion = getExclusionReason({
          id: row.id,
          email_normalized: row.email_normalized,
          agency_id: row.agency_id,
          domain_match_status: row.domain_match_status,
          is_identity_contaminated: row.is_identity_contaminated,
        });
        if (exclusion) continue;

        const leadStateSlug: string | null = ag.state_slug || null;

        let paid = paidByAgencyId.get(`${row.agency_id}|${leadStateSlug ?? ""}`);
        let method: MatchMethod | null = paid ? "agency_id" : null;
        let confidence: MatchConfidence = "exact";

        if (!paid) {
          for (const [k, v] of paidByAgencyId.entries()) {
            if (k.startsWith(`${row.agency_id}|`)) {
              paid = v;
              method = "agency_id";
              confidence = "exact";
              break;
            }
          }
        }

        if (!paid && leadStateSlug) {
          const norm = normalizeAgencyNameStrict(ag.name);
          if (norm.canonical) {
            const m1 = paidByNameSlug.get(`${norm.canonical}|${leadStateSlug}`);
            if (m1) {
              paid = m1;
              method = "name_state_slug";
              confidence = "high";
            } else if (norm.preserved) {
              const m2 = paidByNameSlug.get(`${norm.preserved}|${leadStateSlug}`);
              if (m2) {
                paid = m2;
                method = "name_state_slug";
                confidence = "high";
              }
            }
          }

          if (!paid && norm.canonical) {
            const stateName = stateNameForSlug(leadStateSlug);
            if (stateName) {
              const m3 = paidByNameStateName.get(`${norm.canonical}|${stateName.toLowerCase()}`);
              if (m3) {
                paid = m3;
                method = "name_state_name";
                confidence = "medium";
              }
            }
          }

          if (!paid && includeFuzzy && norm.canonical) {
            let bestScore = 0;
            let bestRecord: PaidAgencyRecord | null = null;
            for (const candidate of paidNamesAll) {
              if (candidate.stateSlug !== leadStateSlug) continue;
              const score = Math.max(
                tokenSetRatio(norm.canonical, candidate.canonical),
                tokenSetRatio(norm.preserved || norm.canonical, candidate.preserved),
              );
              if (score > bestScore) {
                bestScore = score;
                bestRecord = candidate.record;
              }
            }
            if (bestRecord && bestScore >= fuzzyThreshold) {
              paid = bestRecord;
              method = "fuzzy_name";
              confidence = bestScore >= 0.92 ? "medium" : "low";
            }
          }
        }

        if (!paid || !method) continue;

        const paidSourceType = derivePaidSourceType(paid);
        const fallbackEmailSource = method === "name_state_name" || method === "fuzzy_name";

        const lead: MatchedSuppressionEmail = {
          email: row.email,
          email_normalized: row.email_normalized,
          company_name: ag.name ?? null,
          state: stateNameForSlug(leadStateSlug),
          state_slug: leadStateSlug,
          agency_id: row.agency_id,
          paid_agency_id: paid.agency_id ?? row.agency_id,
          paid_agency_name: paid.agency_name ?? ag.name ?? null,
          listing_type: paid.listing_type,
          top25_rank: paid.top25_rank,
          paid_source_type: paidSourceType,
          paid_at: paid.paid_at,
          match_method: method,
          match_confidence: confidence,
          fallback_email_source: fallbackEmailSource,
          suppression_reason: "paid_customer_agency_do_not_contact",
        };
        const k = dedupeKey(lead);
        if (seenKeys.has(k)) continue;
        seenKeys.add(k);
        matchedEmails.push(lead);
        matchCounts[method] = (matchCounts[method] || 0) + 1;

        const idKey = paidIdentityKey(paid);
        if (idKey) {
          matchedCountByPaid.set(idKey, (matchedCountByPaid.get(idKey) || 0) + 1);
        }
      }

      if (rows.length < chunk) break;
      page++;
    }

    const suppressedPaidAgencies: SuppressedPaidAgency[] = [];
    let zeroEmailCount = 0;
    let manualReviewCount = 0;
    const sourceTypeCounts: Record<string, number> = {};

    for (const p of paidAgencies) {
      if (!p.agency_id) continue;
      const idKey = paidIdentityKey(p);
      if (!idKey) continue;
      const matchedCount = matchedCountByPaid.get(idKey) || 0;
      if (matchedCount === 0) zeroEmailCount++;

      const paidSourceType = derivePaidSourceType(p);
      sourceTypeCounts[paidSourceType] = (sourceTypeCounts[paidSourceType] || 0) + 1;

      const requiresManualReview =
        paidSourceType === "legacy_paid_flag" ||
        paidSourceType === "manual_top25" ||
        paidSourceType === "manual_standard";
      if (requiresManualReview) manualReviewCount++;

      const confidence: SuppressedPaidAgency["confidence"] =
        paidSourceType === "stripe_verified"
          ? "exact"
          : paidSourceType === "spotlight"
            ? "high"
            : paidSourceType === "manual_top25"
              ? "high"
              : paidSourceType === "manual_standard"
                ? "medium"
                : "low";

      suppressedPaidAgencies.push({
        agency_id: p.agency_id,
        agency_name: p.agency_name,
        normalized_agency_name: p.agency_name_canonical,
        state_slug: p.state_slug,
        state_name: stateNameForSlug(p.state_slug),
        listing_type: p.listing_type,
        top25_rank: p.top25_rank,
        paid_source: p.source,
        paid_source_type: paidSourceType,
        paid_at: p.paid_at,
        confidence,
        requires_manual_review: requiresManualReview,
        matched_email_count: matchedCount,
        protected_from_future_exports: true,
      });
    }

    const fallbackEmailSourceCount = matchedEmails.filter((m) => m.fallback_email_source).length;

    const listingTypeCounts: Record<string, number> = {};
    for (const p of paidAgencies) {
      listingTypeCounts[p.listing_type] = (listingTypeCounts[p.listing_type] || 0) + 1;
    }

    const warnings: string[] = [];
    if (manualReviewCount > 0) {
      warnings.push(
        `${manualReviewCount} paid agency identities are sourced from manual or legacy flags and require manual review before live Smartlead suppression.`,
      );
    }
    if (fallbackEmailSourceCount > 0) {
      warnings.push(
        `${fallbackEmailSourceCount} matched emails were resolved via fallback identity matching (name+state_name or fuzzy). Verify before live run.`,
      );
    }
    if (zeroEmailCount > 0) {
      warnings.push(
        `${zeroEmailCount} paid agency identities have zero matched emails today but remain protected from all future Smartlead exports.`,
      );
    }

    const response: SuppressionResponse = {
      generated_at: new Date().toISOString(),
      filters: { stateSlug, listingType, includeFuzzy },
      summary: {
        total_paid_agencies: paidAgencies.length,
        total_leads_suppressed: matchedEmails.length,
        suppressed_agencies_with_zero_emails: zeroEmailCount,
        leads_by_match_method: matchCounts,
        paid_agencies_by_listing_type: listingTypeCounts,
        paid_agencies_by_source_type: sourceTypeCounts,
        fallback_email_source_count: fallbackEmailSourceCount,
        requires_manual_review_count: manualReviewCount,
        future_export_protection_enabled: true,
        identity_layer_present: true,
      },
      suppressed_paid_agencies: suppressedPaidAgencies,
      matched_suppression_emails: matchedEmails,
      warnings,
      paid_agencies: paidAgencies,
      leads: matchedEmails,
    };

    return new Response(JSON.stringify(response), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (e) {
    console.error("[customer-suppression-resolver] error:", e);
    return new Response(JSON.stringify({ error: (e as Error).message }), {
      status: 500,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }
});
