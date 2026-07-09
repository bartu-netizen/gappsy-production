import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { normalizeRow, classifyAgencyName } from "../_shared/canonicalRowNormalizer.ts";
import { refreshEmailFlags } from "../_shared/refreshEmailFlags.ts";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-internal-secret",
};

const INTERNAL_SECRET = Deno.env.get("INTERNAL_FUNCTION_SECRET") || "internal-fn-secret-2024";

function jsonOk(data: unknown) {
  return new Response(JSON.stringify(data), {
    status: 200,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

function jsonErr(data: unknown, status: number) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

// ── Data normalization helpers ────────────────────────────────────────────────

function normalizePhoneDigits(phone: string): string | null {
  if (!phone) return null;
  let digits = phone.replace(/\D/g, "");
  if (digits.length === 11 && digits.startsWith("1")) digits = digits.slice(1);
  if (digits.length < 7) return null;
  return digits;
}

function normalizeDomain(url: string): string | null {
  if (!url) return null;
  let d = url.trim().toLowerCase();
  d = d.replace(/^https?:\/\/(www\.)?/i, "");
  d = d.replace(/\/.*$/, "").replace(/\?.*$/, "");
  if (!d || d.length < 4 || !d.includes(".")) return null;
  return d;
}

function isJunkWebsiteUrl(url: string): boolean {
  if (!url) return true;
  const lower = url.toLowerCase();
  const junkPatterns = [
    'google.com/maps',
    'maps.google',
    'goo.gl/maps',
    'facebook.com',
    'instagram.com',
    'twitter.com',
    'linkedin.com',
    'youtube.com',
    'yelp.com',
    'wix.com',
    'weebly.com',
    'squarespace.com',
    'wordpress.com',
    'godaddy.com',
    'ueniweb.com',
    '/local-pros/',
    'splinternetmarketing.com/local-pros',
  ];
  return junkPatterns.some(pattern => lower.includes(pattern));
}

function extractEmailDomain(email: string): string | null {
  if (!email || !email.includes('@')) return null;
  return email.toLowerCase().split('@')[1] || null;
}

function computeDomainMatchStatus(emailDomain: string | null, websiteDomain: string | null): string {
  if (!emailDomain) return 'pending';
  if (!websiteDomain) return 'no_website';

  const freeProviders = [
    'gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com', 'aol.com',
    'icloud.com', 'live.com', 'msn.com', 'me.com', 'protonmail.com'
  ];

  if (freeProviders.includes(emailDomain)) return 'free_email_provider';
  if (emailDomain === websiteDomain) return 'exact_match';

  const emailRoot = emailDomain.split('.')[0];
  const websiteRoot = websiteDomain.split('.')[0];

  if (emailRoot === websiteRoot) return 'brand_match';
  if (emailRoot.includes(websiteRoot) || websiteRoot.includes(emailRoot)) return 'brand_match';

  return 'different_business_domain';
}

function generateSlug(name: string): string {
  return name
    .toLowerCase()
    .replace(/\s+/g, "-")
    .replace(/[^a-z0-9-]/g, "")
    .replace(/-+/g, "-")
    .replace(/^-+|-+$/g, "");
}

function normalizeUrl(raw: string | undefined): string | null {
  if (!raw) return null;
  const trimmed = raw.trim();
  if (!trimmed) return null;
  if (/^https?:\/\//i.test(trimmed)) return trimmed;
  return `https://${trimmed}`;
}

// ── Match result types ────────────────────────────────────────────────────────

type MatchMethod =
  | "created_new"
  | "domain_exact_cross_state"
  | "domain_exact_same_state"
  | "phone_same_state"
  | "name_same_state"
  | "junk_skipped"
  | "error"
  | "unknown_existing_match";

interface MatchResult {
  id: string;
  slug: string;
  isNew: boolean;
  skippedJunk?: boolean;
  websiteDomain?: string | null;
  matchMethod: MatchMethod;
  crossState: boolean;
  matchedStateSlug: string | null;
}

// ── Diff fields — the meaningful business fields we track for change detection ─

const DIFF_FIELDS = [
  "name", "city", "description", "website_url", "website_domain_normalized",
  "maps_url", "phone", "zip_code", "full_address",
  "facebook_url", "instagram_url", "twitter_url", "linkedin_url", "youtube_url",
  "primary_service", "keyword",
] as const;

type DiffField = typeof DIFF_FIELDS[number];

interface ExistingAgencyRow {
  name: string | null;
  city: string | null;
  description: string | null;
  website_url: string | null;
  website_domain_normalized: string | null;
  maps_url: string | null;
  phone: string | null;
  zip_code: string | null;
  full_address: string | null;
  facebook_url: string | null;
  instagram_url: string | null;
  twitter_url: string | null;
  linkedin_url: string | null;
  youtube_url: string | null;
  primary_service: string | null;
  keyword: string | null;
}

function computeChangedFields(
  updatePayload: Record<string, unknown>,
  existing: ExistingAgencyRow
): DiffField[] {
  const changed: DiffField[] = [];
  for (const field of DIFF_FIELDS) {
    if (!(field in updatePayload)) continue;
    const incoming = (updatePayload[field] as string | null) ?? null;
    const current = (existing[field] as string | null) ?? null;
    if (incoming !== current) changed.push(field);
  }
  return changed;
}

// ── Audit row shape ───────────────────────────────────────────────────────────

interface AuditRow {
  job_id: string;
  chunk_index: number;
  source_row_number: number;
  source_agency_name: string | null;
  source_state_slug: string;
  source_website_url: string | null;
  normalized_domain: string | null;
  source_phone: string | null;
  matched_agency_id: string | null;
  matched_agency_slug: string | null;
  matched_agency_state_slug: string | null;
  matched_existing: boolean;
  match_method: MatchMethod;
  cross_state: boolean;
  changed_fields: string[] | null;
  changed_fields_count: number;
  only_updated_at: boolean;
  suspicious_match: boolean;
  suspicious_reason: string | null;
}

// ── Event logger ─────────────────────────────────────────────────────────────

async function logEvent(
  supabase: ReturnType<typeof createClient>,
  jobId: string,
  eventType: string,
  message: string
) {
  try {
    await supabase.from("other_agencies_import_events_v2").insert({
      job_id: jobId,
      event_type: eventType,
      message,
    });
  } catch {
    console.warn(`[v2-worker] Failed to log event: ${eventType}`);
  }
}

// ── Find or create agency with full match attribution ─────────────────────────

async function findOrCreateAgency(
  supabase: ReturnType<typeof createClient>,
  row: ReturnType<typeof normalizeRow>,
  stateSlug: string,
  warnings: string[]
): Promise<MatchResult | null> {
  if (!row) return null;

  const name = row.name;
  const nameClass = (row._nameClassification || "valid") as string;
  const nameReason = row._nameReason || "";
  const website = row.website_url || "";
  const phone = row.phone || "";
  const domain = normalizeDomain(website);
  const phoneDigits = normalizePhoneDigits(phone);

  if (nameClass === "junk" && !name) {
    return { id: "", slug: "", isNew: false, skippedJunk: true, matchMethod: "junk_skipped", crossState: false, matchedStateSlug: null };
  }

  // ── 1. Domain match (cross-state capable) ────────────────────────────────
  if (domain && !isJunkWebsiteUrl(website)) {
    const { data: byExactDomain } = await supabase
      .from("other_agencies")
      .select("id, slug, name, website_domain_normalized, state_slug")
      .eq("website_domain_normalized", domain)
      .eq("is_active", true)
      .limit(1)
      .maybeSingle();

    if (byExactDomain) {
      const crossState = byExactDomain.state_slug !== stateSlug;
      const method: MatchMethod = crossState ? "domain_exact_cross_state" : "domain_exact_same_state";

      if (nameClass === "suspicious") {
        warnings.push(`Suspicious incoming name "${name}" (${nameReason}) ignored; existing DB name "${byExactDomain.name}" preserved`);
      }
      return {
        id: byExactDomain.id,
        slug: byExactDomain.slug,
        isNew: false,
        websiteDomain: domain,
        matchMethod: method,
        crossState,
        matchedStateSlug: byExactDomain.state_slug,
      };
    }
  }

  // ── 2. Phone match (same-state only) ─────────────────────────────────────
  if (phoneDigits) {
    const { data: byPhone } = await supabase
      .from("other_agency_phones")
      .select("agency_id")
      .eq("phone_normalized", phoneDigits)
      .limit(1)
      .maybeSingle();
    if (byPhone) {
      const { data: agency } = await supabase
        .from("other_agencies")
        .select("id, slug, name, website_domain_normalized, state_slug")
        .eq("id", byPhone.agency_id)
        .eq("is_active", true)
        .eq("state_slug", stateSlug)
        .maybeSingle();
      if (agency) {
        if (nameClass === "suspicious") {
          warnings.push(`Suspicious incoming name "${name}" (${nameReason}) ignored; existing DB name "${agency.name}" preserved`);
        }
        return {
          id: agency.id,
          slug: agency.slug,
          isNew: false,
          websiteDomain: agency.website_domain_normalized,
          matchMethod: "phone_same_state",
          crossState: false,
          matchedStateSlug: agency.state_slug,
        };
      }
    }
  }

  // ── 3. Name match (same-state only, case-insensitive exact) ──────────────
  const { data: byName } = await supabase
    .from("other_agencies")
    .select("id, slug, website_domain_normalized, state_slug")
    .eq("is_active", true)
    .eq("state_slug", stateSlug)
    .ilike("name", name)
    .limit(1)
    .maybeSingle();
  if (byName) {
    return {
      id: byName.id,
      slug: byName.slug,
      isNew: false,
      websiteDomain: byName.website_domain_normalized,
      matchMethod: "name_same_state",
      crossState: false,
      matchedStateSlug: byName.state_slug,
    };
  }

  // ── 4. Create new ─────────────────────────────────────────────────────────
  if (nameClass === "junk") {
    return { id: "", slug: "", isNew: false, skippedJunk: true, matchMethod: "junk_skipped", crossState: false, matchedStateSlug: null };
  }

  if (nameClass === "suspicious") {
    warnings.push(`Suspicious name imported unchanged: "${name}" (${nameReason}). Manual review recommended.`);
  }

  let slug = generateSlug(name);
  if (!slug || slug.length < 2) {
    return { id: "", slug: "", isNew: false, skippedJunk: true, matchMethod: "junk_skipped", crossState: false, matchedStateSlug: null };
  }

  let suffix = 1;
  while (true) {
    const { data: slugTaken } = await supabase
      .from("other_agencies")
      .select("id")
      .eq("slug", slug)
      .maybeSingle();
    if (!slugTaken) break;
    suffix++;
    slug = `${generateSlug(name)}-${suffix}`;
  }

  const rawWebsite = row.website_url ? normalizeUrl(row.website_url) : null;
  const isWebsiteJunk = rawWebsite ? isJunkWebsiteUrl(rawWebsite) : true;
  const cleanWebsiteUrl = (!isWebsiteJunk && rawWebsite) ? rawWebsite : null;
  const websiteDomainNormalized = cleanWebsiteUrl ? normalizeDomain(cleanWebsiteUrl) : null;
  const mapsUrlFromWebsite = (isWebsiteJunk && rawWebsite) ? rawWebsite : null;
  const explicitMapsUrl = normalizeUrl(row.maps_url) || null;
  const finalMapsUrl = explicitMapsUrl || mapsUrlFromWebsite || null;

  const insertPayload: Record<string, unknown> = {
    name,
    slug,
    state_slug: stateSlug,
    state_name: stateSlug,
    city: row.city || null,
    description: row.description || null,
    website_url: cleanWebsiteUrl,
    website_domain_normalized: websiteDomainNormalized,
    phone: phone || null,
    zip_code: row.zip_code || null,
    full_address: row.full_address || null,
    maps_url: finalMapsUrl,
    latitude: row.latitude ? parseFloat(row.latitude) : null,
    longitude: row.longitude ? parseFloat(row.longitude) : null,
    keyword: row.keyword || null,
    facebook_url: normalizeUrl(row.facebook_url) || null,
    instagram_url: normalizeUrl(row.instagram_url) || null,
    twitter_url: normalizeUrl(row.twitter_url) || null,
    youtube_url: normalizeUrl(row.youtube_url) || null,
    linkedin_url: normalizeUrl(row.linkedin_url) || null,
    primary_service: row.primary_service || null,
    is_active: true,
    source: "import_v2",
  };

  const { data: newAgency, error: createErr } = await supabase
    .from("other_agencies")
    .insert(insertPayload)
    .select("id, slug")
    .single();

  if (createErr) {
    console.error(`[v2-worker] Insert failed for "${name}": ${createErr.message} | code=${createErr.code}`);
    return null;
  }

  return {
    id: newAgency.id,
    slug: newAgency.slug,
    isNew: true,
    websiteDomain: websiteDomainNormalized,
    matchMethod: "created_new",
    crossState: false,
    matchedStateSlug: stateSlug,
  };
}

// ── Process rows ─────────────────────────────────────────────────────────────

async function processRows(
  supabase: ReturnType<typeof createClient>,
  rows: Record<string, string>[],
  stateSlug: string,
  isDryRun: boolean,
  jobId: string,
  chunkIndex: number
): Promise<{
  created: number;
  updated: number;
  emailsAdded: number;
  errors: number;
  errorSamples: string[];
  junkSkipped: number;
  warningSamples: string[];
  realUpdated: number;
  noopUpdated: number;
  matchDomainCrossState: number;
  matchDomainSameState: number;
  matchPhoneSameState: number;
  matchNameSameState: number;
  suspiciousCount: number;
}> {
  let created = 0;
  let updated = 0;
  let emailsAdded = 0;
  let errors = 0;
  let junkSkipped = 0;
  let realUpdated = 0;
  let noopUpdated = 0;
  let matchDomainCrossState = 0;
  let matchDomainSameState = 0;
  let matchPhoneSameState = 0;
  let matchNameSameState = 0;
  let suspiciousCount = 0;

  const errorSamples: string[] = [];
  const warningSamples: string[] = [];
  const auditRows: AuditRow[] = [];

  const captureError = (msg: string) => {
    errors++;
    if (errorSamples.length < 10) errorSamples.push(msg);
    console.warn(`[v2-worker] Row error: ${msg}`);
  };

  const captureWarning = (msg: string) => {
    if (warningSamples.length < 20) warningSamples.push(msg);
  };

  for (let i = 0; i < rows.length; i++) {
    const baseAudit: Pick<AuditRow, "job_id" | "chunk_index" | "source_row_number" | "source_state_slug"> = {
      job_id: jobId,
      chunk_index: chunkIndex,
      source_row_number: i,
      source_state_slug: stateSlug,
    };

    try {
      const row = normalizeRow(rows[i], stateSlug);
      if (!row) {
        captureError(`Row ${i}: No agency name found`);
        auditRows.push({
          ...baseAudit,
          source_agency_name: null,
          source_website_url: null,
          normalized_domain: null,
          source_phone: null,
          matched_agency_id: null,
          matched_agency_slug: null,
          matched_agency_state_slug: null,
          matched_existing: false,
          match_method: "error",
          cross_state: false,
          changed_fields: null,
          changed_fields_count: 0,
          only_updated_at: false,
          suspicious_match: false,
          suspicious_reason: null,
        });
        continue;
      }

      const nameClass = row._nameClassification || "valid";
      const rawDomain = normalizeDomain(row.website_url || "");

      if (nameClass === "junk" && !row.name) {
        junkSkipped++;
        captureWarning(`Row ${i}: Junk name skipped (${row._nameReason})`);
        auditRows.push({
          ...baseAudit,
          source_agency_name: row.name || null,
          source_website_url: row.website_url || null,
          normalized_domain: rawDomain,
          source_phone: row.phone || null,
          matched_agency_id: null,
          matched_agency_slug: null,
          matched_agency_state_slug: null,
          matched_existing: false,
          match_method: "junk_skipped",
          cross_state: false,
          changed_fields: null,
          changed_fields_count: 0,
          only_updated_at: false,
          suspicious_match: false,
          suspicious_reason: null,
        });
        continue;
      }

      const rowWarnings: string[] = [];
      const agency = await findOrCreateAgency(supabase, row, stateSlug, rowWarnings);
      for (const w of rowWarnings) captureWarning(`Row ${i}: ${w}`);

      if (!agency) {
        captureError(`Row ${i}: Failed to find or create agency "${row.name}"`);
        auditRows.push({
          ...baseAudit,
          source_agency_name: row.name || null,
          source_website_url: row.website_url || null,
          normalized_domain: rawDomain,
          source_phone: row.phone || null,
          matched_agency_id: null,
          matched_agency_slug: null,
          matched_agency_state_slug: null,
          matched_existing: false,
          match_method: "error",
          cross_state: false,
          changed_fields: null,
          changed_fields_count: 0,
          only_updated_at: false,
          suspicious_match: false,
          suspicious_reason: null,
        });
        continue;
      }

      if (agency.skippedJunk) {
        junkSkipped++;
        captureWarning(`Row ${i}: Junk name "${row.name}" skipped — no valid fallback (${row._nameReason})`);
        auditRows.push({
          ...baseAudit,
          source_agency_name: row.name || null,
          source_website_url: row.website_url || null,
          normalized_domain: rawDomain,
          source_phone: row.phone || null,
          matched_agency_id: null,
          matched_agency_slug: null,
          matched_agency_state_slug: null,
          matched_existing: false,
          match_method: "junk_skipped",
          cross_state: false,
          changed_fields: null,
          changed_fields_count: 0,
          only_updated_at: false,
          suspicious_match: false,
          suspicious_reason: null,
        });
        continue;
      }

      // ── Track match-method counters ────────────────────────────────────────
      switch (agency.matchMethod) {
        case "domain_exact_cross_state": matchDomainCrossState++; break;
        case "domain_exact_same_state":  matchDomainSameState++;  break;
        case "phone_same_state":         matchPhoneSameState++;   break;
        case "name_same_state":          matchNameSameState++;    break;
        default: break;
      }

      // ── Suspicious-match detection ─────────────────────────────────────────
      let suspiciousMatch = false;
      let suspiciousReason: string | null = null;

      if (agency.matchMethod === "name_same_state") {
        const inDomain = normalizeDomain(row.website_url || "");
        const exDomain = agency.websiteDomain ?? null;
        if (inDomain && exDomain && inDomain !== exDomain) {
          suspiciousMatch = true;
          suspiciousReason = `name_same_state match but domains differ: incoming=${inDomain} existing=${exDomain}`;
        }
      }
      if (agency.matchMethod === "domain_exact_cross_state") {
        const inName = (row.name || "").toLowerCase().trim();
        const exSlug = (agency.slug || "").toLowerCase().replace(/-\d+$/, "");
        const nameMatchesSlug = inName.replace(/\s+/g, "-").replace(/[^a-z0-9-]/g, "").includes(exSlug.slice(0, 6));
        if (!nameMatchesSlug && inName.length > 3 && exSlug.length > 3) {
          suspiciousMatch = true;
          suspiciousReason = `domain_exact_cross_state: incoming name "${row.name}" may not match existing slug "${agency.slug}"`;
        }
      }

      if (suspiciousMatch) suspiciousCount++;

      if (agency.isNew) {
        created++;

        auditRows.push({
          ...baseAudit,
          source_agency_name: row.name || null,
          source_website_url: row.website_url || null,
          normalized_domain: rawDomain,
          source_phone: row.phone || null,
          matched_agency_id: agency.id || null,
          matched_agency_slug: agency.slug || null,
          matched_agency_state_slug: stateSlug,
          matched_existing: false,
          match_method: "created_new",
          cross_state: false,
          changed_fields: null,
          changed_fields_count: 0,
          only_updated_at: false,
          suspicious_match: suspiciousMatch,
          suspicious_reason: suspiciousReason,
        });

      } else {
        // ── Existing agency — fetch current row for name check + diff ─────────
        const { data: existing } = await supabase
          .from("other_agencies")
          .select(DIFF_FIELDS.join(", "))
          .eq("id", agency.id)
          .maybeSingle() as { data: ExistingAgencyRow | null };

        const updatePayload: Record<string, unknown> = { updated_at: new Date().toISOString() };

        if (existing && nameClass === "valid" && row.name) {
          const existingCheck = classifyAgencyName(existing.name ?? "");
          if (existingCheck.classification === "junk" || existingCheck.classification === "suspicious") {
            updatePayload.name = row.name;
            captureWarning(`Row ${i}: Replaced bad existing name "${existing.name}" with valid "${row.name}"`);
          }
        }

        if (row.city) updatePayload.city = row.city;
        if (row.description) updatePayload.description = row.description;

        if (row.website_url) {
          const incomingUrl = normalizeUrl(row.website_url);
          if (incomingUrl && !isJunkWebsiteUrl(incomingUrl)) {
            updatePayload.website_url = incomingUrl;
            updatePayload.website_domain_normalized = normalizeDomain(incomingUrl);
          } else if (incomingUrl && isJunkWebsiteUrl(incomingUrl)) {
            if (existing && !existing.maps_url) {
              updatePayload.maps_url = incomingUrl;
            }
            if (existing && (
              !existing.website_url ||
              isJunkWebsiteUrl(existing.website_url ?? "")
            ) && existing.website_domain_normalized) {
              updatePayload.website_url = `https://${existing.website_domain_normalized}`;
            }
          }
        }

        if (row.phone) updatePayload.phone = row.phone;
        if (row.zip_code) updatePayload.zip_code = row.zip_code;
        if (row.full_address) updatePayload.full_address = row.full_address;
        if (row.facebook_url) updatePayload.facebook_url = normalizeUrl(row.facebook_url);
        if (row.instagram_url) updatePayload.instagram_url = normalizeUrl(row.instagram_url);
        if (row.twitter_url) updatePayload.twitter_url = normalizeUrl(row.twitter_url);
        if (row.linkedin_url) updatePayload.linkedin_url = normalizeUrl(row.linkedin_url);
        if (row.youtube_url) updatePayload.youtube_url = normalizeUrl(row.youtube_url);
        if (row.primary_service) updatePayload.primary_service = row.primary_service;
        if (row.keyword) updatePayload.keyword = row.keyword;

        // ── Diff ──────────────────────────────────────────────────────────────
        const changedFields = existing
          ? computeChangedFields(updatePayload, existing)
          : Object.keys(updatePayload).filter(k => k !== "updated_at") as DiffField[];
        const onlyUpdatedAt = changedFields.length === 0;
        if (onlyUpdatedAt) { noopUpdated++; } else { realUpdated++; }

        updated++;

        auditRows.push({
          ...baseAudit,
          source_agency_name: row.name || null,
          source_website_url: row.website_url || null,
          normalized_domain: rawDomain,
          source_phone: row.phone || null,
          matched_agency_id: agency.id || null,
          matched_agency_slug: agency.slug || null,
          matched_agency_state_slug: agency.matchedStateSlug,
          matched_existing: true,
          match_method: agency.matchMethod,
          cross_state: agency.crossState,
          changed_fields: changedFields.length > 0 ? changedFields : null,
          changed_fields_count: changedFields.length,
          only_updated_at: onlyUpdatedAt,
          suspicious_match: suspiciousMatch,
          suspicious_reason: suspiciousReason,
        });

        if (!isDryRun) {
          await supabase.from("other_agencies").update(updatePayload).eq("id", agency.id);
        }
      }

      // ── Emails ────────────────────────────────────────────────────────────
      if (!isDryRun) {
        const emailRaw = row.email || "";
        const emailList = emailRaw
          .split(/[,;|\n]+/)
          .map(e => e.trim().toLowerCase())
          .filter(e => e.includes("@") && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(e));

        const agencyWebsiteDomain = agency.websiteDomain || null;

        for (let idx = 0; idx < emailList.length; idx++) {
          const emailNorm = emailList[idx];
          const emailDomain = extractEmailDomain(emailNorm);
          const domainMatchStatus = computeDomainMatchStatus(emailDomain, agencyWebsiteDomain);
          const isIdentityContaminated = domainMatchStatus === 'different_business_domain';

          if (isIdentityContaminated && agencyWebsiteDomain) {
            captureWarning(`Row ${i}: Email "${emailNorm}" (${emailDomain}) skipped - different business domain than agency website (${agencyWebsiteDomain})`);
            continue;
          }

          const { data: existingEmail } = await supabase
            .from("other_agency_emails")
            .select("id")
            .eq("agency_id", agency.id)
            .eq("email_normalized", emailNorm)
            .maybeSingle();

          if (!existingEmail) {
            const { error: emailErr } = await supabase.from("other_agency_emails").insert({
              agency_id: agency.id,
              email_raw: emailList[idx],
              email_normalized: emailNorm,
              email_domain: emailDomain,
              domain_match_status: domainMatchStatus,
              is_identity_contaminated: isIdentityContaminated,
              validation_status: "pending",
              is_primary: idx === 0,
              source: "import_v2",
            });
            if (!emailErr) emailsAdded++;
            else captureError(`Row ${i}: Email insert failed for "${emailNorm}": ${emailErr.message}`);
          }
        }

        // ── Phones ──────────────────────────────────────────────────────────
        const phoneRaw = row.phone || "";
        const phoneList = phoneRaw.split(/[,;|\n]+/).map(p => p.trim()).filter(Boolean);
        for (let idx = 0; idx < phoneList.length; idx++) {
          const digits = normalizePhoneDigits(phoneList[idx]);
          if (!digits) continue;
          const { data: existingPhone } = await supabase
            .from("other_agency_phones")
            .select("id")
            .eq("agency_id", agency.id)
            .eq("phone_normalized", digits)
            .maybeSingle();
          if (!existingPhone) {
            await supabase.from("other_agency_phones").insert({
              agency_id: agency.id,
              phone_raw: phoneList[idx],
              phone_normalized: digits,
              is_primary: idx === 0,
              source: "import_v2",
            });
          }
        }
      }

    } catch (err) {
      const msg = err instanceof Error ? err.message : String(err);
      captureError(`Row ${i}: Unexpected exception — ${msg.substring(0, 120)}`);
      auditRows.push({
        ...baseAudit,
        source_agency_name: null,
        source_website_url: null,
        normalized_domain: null,
        source_phone: null,
        matched_agency_id: null,
        matched_agency_slug: null,
        matched_agency_state_slug: null,
        matched_existing: false,
        match_method: "error",
        cross_state: false,
        changed_fields: null,
        changed_fields_count: 0,
        only_updated_at: false,
        suspicious_match: false,
        suspicious_reason: null,
      });
    }
  }

  // ── Batch write audit rows ────────────────────────────────────────────────
  if (auditRows.length > 0) {
    const BATCH = 200;
    for (let b = 0; b < auditRows.length; b += BATCH) {
      const slice = auditRows.slice(b, b + BATCH);
      const { error: auditErr } = await supabase
        .from("other_agencies_import_row_audit_v2")
        .insert(slice);
      if (auditErr) {
        console.warn(`[v2-worker] Audit batch insert failed (non-fatal): ${auditErr.message}`);
      }
    }
  }

  return {
    created, updated, emailsAdded, errors, errorSamples, junkSkipped, warningSamples,
    realUpdated, noopUpdated,
    matchDomainCrossState, matchDomainSameState, matchPhoneSameState, matchNameSameState,
    suspiciousCount,
  };
}

// ── Process one chunk ─────────────────────────────────────────────────────────

async function processOneChunk(
  supabase: ReturnType<typeof createClient>,
  jobId: string,
  stateSlug: string,
  chunkId: string,
  chunkIndex: number,
  isDryRun: boolean
): Promise<boolean> {
  const chunkPath = `v2-chunks/${jobId}/chunk_${chunkIndex}.json`;
  const { data: chunkFile, error: dlErr } = await supabase.storage
    .from("import-staging")
    .download(chunkPath);

  if (dlErr || !chunkFile) {
    const errMsg = `Cannot download chunk file: ${dlErr?.message ?? "unknown"}`;
    await supabase
      .from("other_agencies_import_job_chunks_v2")
      .update({ status: "failed", error_message: errMsg, error_samples: [errMsg], completed_at: new Date().toISOString() })
      .eq("id", chunkId);
    return false;
  }

  const { rows } = JSON.parse(await chunkFile.text()) as { rows: Record<string, string>[] };
  const result = await processRows(supabase, rows, stateSlug, isDryRun, jobId, chunkIndex);

  const allSamples = [
    ...result.errorSamples,
    ...(result.warningSamples.length > 0 ? [`--- Warnings (${result.warningSamples.length}) ---`, ...result.warningSamples.slice(0, 5)] : []),
  ];

  await supabase
    .from("other_agencies_import_job_chunks_v2")
    .update({
      status: "completed",
      agencies_created: result.created,
      agencies_updated: result.updated,
      emails_added: result.emailsAdded,
      errors_count: result.errors,
      error_samples: allSamples.length > 0 ? allSamples : null,
      error_message: result.junkSkipped > 0
        ? `${result.errors} errors, ${result.junkSkipped} junk names skipped`
        : result.errorSamples.length > 0 ? result.errorSamples[0] : null,
      completed_at: new Date().toISOString(),
      agencies_real_updated: result.realUpdated,
      agencies_noop_updated: result.noopUpdated,
      match_domain_cross_state: result.matchDomainCrossState,
      match_domain_same_state: result.matchDomainSameState,
      match_phone_same_state: result.matchPhoneSameState,
      match_name_same_state: result.matchNameSameState,
      suspicious_count: result.suspiciousCount,
    })
    .eq("id", chunkId);

  await supabase.rpc("increment_import_v2_counters", {
    p_job_id: jobId,
    p_agencies_created: result.created,
    p_agencies_updated: result.updated,
    p_emails_added: result.emailsAdded,
    p_errors_count: result.errors,
    p_agencies_real_updated: result.realUpdated,
    p_agencies_noop_updated: result.noopUpdated,
    p_match_domain_cross_state: result.matchDomainCrossState,
    p_match_domain_same_state: result.matchDomainSameState,
    p_match_phone_same_state: result.matchPhoneSameState,
    p_match_name_same_state: result.matchNameSameState,
    p_suspicious_matches_count: result.suspiciousCount,
  });

  if (result.junkSkipped > 0) {
    await logEvent(supabase, jobId, "junk_names_skipped", `Chunk ${chunkIndex}: ${result.junkSkipped} junk names skipped`);
  }
  if (result.warningSamples.length > 0) {
    await logEvent(supabase, jobId, "suspicious_names_warning", `Chunk ${chunkIndex}: ${result.warningSamples.length} suspicious names logged`);
  }

  const dryNote = isDryRun ? " [DRY RUN — no DB mutations]" : "";
  console.log(`[v2-worker] Chunk ${chunkIndex} done${dryNote}: ${rows.length} rows, created=${result.created}, updated=${result.updated} (real=${result.realUpdated} noop=${result.noopUpdated}), errors=${result.errors}, junkSkipped=${result.junkSkipped}, crossState=${result.matchDomainCrossState}, suspicious=${result.suspiciousCount}`);
  return true;
}

// ── Rebuild /your-agency index ────────────────────────────────────────────────

async function rebuildYourAgencyIndex(
  supabase: ReturnType<typeof createClient>,
  jobId: string
): Promise<{ ok: boolean; searchCount?: number; indexCount?: number; error?: string }> {
  await logEvent(supabase, jobId, "your_agency_rebuild_started", "Rebuilding /your-agency search index and profile listings");

  try {
    const { data: searchResult, error: searchErr } = await supabase.rpc("rebuild_public_agency_search");
    if (searchErr) {
      const msg = `Search MV rebuild failed: ${searchErr.message}`;
      console.error(`[v2-worker] ${msg}`);
      await logEvent(supabase, jobId, "your_agency_rebuild_failed", msg);
      return { ok: false, error: msg };
    }

    const searchInfo = searchResult?.[0] || {};
    const searchCount = searchInfo.unique_agencies ?? 0;
    console.log(`[v2-worker] Search MV rebuilt: ${searchCount} unique agencies, ${searchInfo.total_listings ?? 0} total listings`);

    const { data: indexResult, error: indexErr } = await supabase.rpc("rebuild_agency_listings_index");
    if (indexErr) {
      const msg = `Listings index rebuild failed: ${indexErr.message}`;
      console.error(`[v2-worker] ${msg}`);
      await logEvent(supabase, jobId, "your_agency_rebuild_failed", `Search MV ok (${searchCount} agencies) but ${msg}`);
      return { ok: false, searchCount, error: msg };
    }

    const indexInfo = indexResult?.[0] || {};
    const indexCount = indexInfo.processed_count ?? 0;
    console.log(`[v2-worker] Listings index rebuilt: ${indexCount} listings processed`);

    await logEvent(
      supabase,
      jobId,
      "your_agency_rebuild_completed",
      `Search index: ${searchCount} unique agencies. Profile index: ${indexCount} listings. Duration: ${searchInfo.duration_ms ?? 0}ms + ${indexInfo.duration_ms ?? 0}ms`
    );

    return { ok: true, searchCount, indexCount };
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error(`[v2-worker] Index rebuild crashed: ${msg}`);
    await logEvent(supabase, jobId, "your_agency_rebuild_failed", `Unexpected error: ${msg.substring(0, 200)}`);
    return { ok: false, error: msg };
  }
}

// ── Finalize job ──────────────────────────────────────────────────────────────

async function checkAndFinalizeJob(supabase: ReturnType<typeof createClient>, jobId: string, isDryRun: boolean): Promise<boolean> {
  const { data: counts } = await supabase
    .from("other_agencies_import_job_chunks_v2")
    .select("status")
    .eq("job_id", jobId);

  if (!counts) return false;

  const total = counts.length;
  const completed = counts.filter(c => c.status === "completed").length;
  const failed = counts.filter(c => c.status === "failed").length;
  const remaining = counts.filter(c => c.status === "queued" || c.status === "processing").length;

  if (remaining > 0) {
    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({
        chunks_processed: completed + failed,
        last_checkpoint: `${completed + failed}/${total} chunks done, ${remaining} remaining`,
      })
      .eq("id", jobId);
    return false;
  }

  const finalStatus = failed === 0 ? "completed" : (completed > 0 ? "partial_success" : "failed");
  const errorMsg = failed > 0 ? `${failed}/${total} chunks failed` : null;
  const dryNote = isDryRun ? " [DRY RUN]" : "";

  await supabase
    .from("other_agencies_import_jobs_v2")
    .update({
      status: finalStatus,
      chunks_processed: completed + failed,
      work_completed_at: new Date().toISOString(),
      error_message: errorMsg,
      last_checkpoint: finalStatus === "completed"
        ? `Import complete${dryNote} — all ${total} chunks processed`
        : `Import finished with issues${dryNote} — ${failed} chunks failed`,
    })
    .eq("id", jobId);

  console.log(`[v2-worker] Job ${jobId} finalized: ${finalStatus}${dryNote} (${completed} ok, ${failed} failed)`);

  if (!isDryRun && (finalStatus === "completed" || finalStatus === "partial_success")) {
    const rebuildResult = await rebuildYourAgencyIndex(supabase, jobId);
    const rebuildNote = rebuildResult.ok
      ? `Index rebuilt: ${rebuildResult.searchCount} search, ${rebuildResult.indexCount} profile listings`
      : `Index rebuild failed (non-fatal): ${rebuildResult.error?.substring(0, 100)} — use manual rebuild button`;

    const flagsRefresh = await refreshEmailFlags(supabase, "import-v2-worker");
    const flagsNote = flagsRefresh.ok
      ? `Flags refreshed: ${flagsRefresh.rows_newly_flagged ?? 0} newly flagged, ${flagsRefresh.rows_cleared ?? 0} cleared`
      : `Flag refresh failed (non-fatal): ${flagsRefresh.error?.substring(0, 80)}`;
    if (!flagsRefresh.ok) {
      console.warn(`[v2-worker] Post-import flag refresh failed (non-fatal): ${flagsRefresh.error}`);
    }
    await logEvent(supabase, jobId, "email_flags_refreshed", flagsNote);

    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({
        last_checkpoint: (finalStatus === "completed"
          ? `Import complete — all ${total} chunks processed. ${rebuildNote}. ${flagsNote}`
          : `Import finished with issues — ${failed} chunks failed. ${rebuildNote}. ${flagsNote}`
        ).substring(0, 500),
      })
      .eq("id", jobId);

    if (!rebuildResult.ok) {
      console.warn(`[v2-worker] Post-import rebuild failed (non-fatal): ${rebuildResult.error}. Import status: ${finalStatus}. Use manual rebuild button to retry.`);
    }
  } else if (isDryRun && (finalStatus === "completed" || finalStatus === "partial_success")) {
    await logEvent(supabase, jobId, "dry_run_complete",
      `DRY RUN complete — all ${total} chunks audited. No agency/email/phone data was mutated. Review audit summary before running live.`
    );
    await supabase
      .from("other_agencies_import_jobs_v2")
      .update({
        last_checkpoint: `DRY RUN complete — ${total} chunks audited. Check audit summary. No data was written.`,
      })
      .eq("id", jobId);
  }

  return true;
}

// ── Main handler ──────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS });

  const internalSecret = req.headers.get("x-internal-secret");
  if (internalSecret !== INTERNAL_SECRET) return jsonErr({ ok: false, error: "FORBIDDEN" }, 403);

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  try {
    const { job_id } = await req.json();
    if (!job_id) return jsonErr({ ok: false, error: "MISSING_JOB_ID" }, 400);

    const startTime = Date.now();
    console.log(`[v2-worker] Invocation started for job ${job_id} at ${new Date().toISOString()}`);
    await logEvent(supabase, job_id, "worker_invocation_started", "Worker invocation started");

    const { data: job } = await supabase
      .from("other_agencies_import_jobs_v2")
      .select("id, state_slug, status, is_dry_run")
      .eq("id", job_id)
      .maybeSingle();

    if (!job) {
      console.error(`[v2-worker] Job ${job_id} not found in database`);
      return jsonErr({ ok: false, error: "JOB_NOT_FOUND" }, 404);
    }

    const isDryRun = job.is_dry_run === true;
    if (isDryRun) {
      console.log(`[v2-worker] Job ${job_id} is a DRY RUN — no agency/email/phone mutations will occur`);
    }

    if (["failed", "cancelled", "completed", "partial_success"].includes(job.status)) {
      console.log(`[v2-worker] Job ${job_id} is terminal (${job.status}), exiting cleanly`);
      await logEvent(supabase, job_id, "worker_skipped_terminal", `Job already terminal: ${job.status}`);
      return jsonOk({ ok: true, action: "skipped", reason: `Job already terminal: ${job.status}` });
    }

    console.log(`[v2-worker] Attempting to claim next chunk for job ${job_id} (status=${job.status})`);
    const { data: claimed, error: claimErr } = await supabase.rpc("claim_next_import_v2_chunk", {
      p_job_id: job_id,
    });

    if (claimErr) {
      const msg = claimErr.message ?? "unknown claim error";
      const code = claimErr.code ?? "no_code";
      const details = claimErr.details ?? "";
      const hint = claimErr.hint ?? "";
      const fullMsg = `Claim RPC error [${code}]: ${msg}${details ? ` | details: ${details}` : ""}${hint ? ` | hint: ${hint}` : ""}`;
      console.error(`[v2-worker] ${fullMsg}`);
      await logEvent(supabase, job_id, "worker_claim_failed", fullMsg);
      return jsonErr({
        ok: false,
        error: "CLAIM_FAILED",
        action: "claim_failed",
        message: msg,
        claim_code: code,
        claim_details: details || null,
        claim_hint: hint || null,
        claim_full: fullMsg,
      }, 502);
    }

    if (!claimed || claimed.length === 0) {
      console.log(`[v2-worker] No queued chunks for job ${job_id} — checking finalization`);
      await logEvent(supabase, job_id, "worker_no_work", "No queued chunks available");
      const finalized = await checkAndFinalizeJob(supabase, job_id, isDryRun);
      return jsonOk({ ok: true, action: "no_work", finalized });
    }

    const chunk = claimed[0];
    console.log(`[v2-worker] Claimed chunk ${chunk.chunk_index} (id=${chunk.chunk_id}) for job ${job_id}`);
    await logEvent(supabase, job_id, "worker_claimed_chunk", `Claimed chunk ${chunk.chunk_index}`);

    let chunkOk = false;
    const chunkStartTime = Date.now();
    try {
      console.log(`[v2-worker] Processing chunk ${chunk.chunk_index} (id=${chunk.chunk_id}, rows=${chunk.row_start}-${chunk.row_end})`);
      chunkOk = await processOneChunk(supabase, job_id, job.state_slug, chunk.chunk_id, chunk.chunk_index, isDryRun);
      const chunkDuration = Date.now() - chunkStartTime;
      const status = chunkOk ? "completed" : "failed";
      console.log(`[v2-worker] Chunk ${chunk.chunk_index} ${status} in ${chunkDuration}ms`);
      await logEvent(supabase, job_id, "worker_processed_chunk", `Chunk ${chunk.chunk_index} ${status} in ${chunkDuration}ms`);
    } catch (err) {
      const chunkDuration = Date.now() - chunkStartTime;
      const msg = err instanceof Error ? err.message : String(err);
      console.error(`[v2-worker] Chunk ${chunk.chunk_index} crashed after ${chunkDuration}ms: ${msg}`);
      await logEvent(supabase, job_id, "worker_chunk_crash", `Chunk ${chunk.chunk_index} crash after ${chunkDuration}ms: ${msg.substring(0, 150)}`);
      await supabase
        .from("other_agencies_import_job_chunks_v2")
        .update({
          status: "failed",
          error_message: `Worker crash: ${msg.substring(0, 200)}`,
          error_samples: [`Worker crash: ${msg.substring(0, 200)}`],
          completed_at: new Date().toISOString(),
        })
        .eq("id", chunk.chunk_id);
    }

    const finalized = await checkAndFinalizeJob(supabase, job_id, isDryRun);

    if (finalized) {
      console.log(`[v2-worker] Job ${job_id} finalized, no re-dispatch needed`);
      return jsonOk({ ok: true, action: "chunk_processed_job_finalized", chunk_index: chunk.chunk_index, chunk_ok: chunkOk });
    }

    const { data: remaining } = await supabase
      .from("other_agencies_import_job_chunks_v2")
      .select("status")
      .eq("job_id", job_id)
      .in("status", ["queued"]);

    const queuedCount = remaining?.length ?? 0;

    if (queuedCount > 0) {
      console.log(`[v2-worker] ${queuedCount} queued remain — triggering re-dispatch`);
      const dispatchUrl = `${supabaseUrl}/functions/v1/other-agencies-import-v2-dispatch`;
      try {
        const dispatchRes = await fetch(dispatchUrl, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${serviceKey}`,
            "x-internal-secret": INTERNAL_SECRET,
          },
          body: JSON.stringify({ job_id }),
        });
        const dispatchBody = await dispatchRes.json();
        console.log(`[v2-worker] Re-dispatch: action=${dispatchBody.action} logic_ok=${dispatchBody.runners_logic_ok ?? "?"}`);
      } catch (e) {
        console.error(`[v2-worker] Re-dispatch fetch failed:`, e instanceof Error ? e.message : String(e));
      }
    }

    const elapsed = Date.now() - startTime;
    return jsonOk({
      ok: true,
      action: "chunk_processed",
      chunk_index: chunk.chunk_index,
      chunk_ok: chunkOk,
      queued_remaining: queuedCount,
      re_dispatched: queuedCount > 0,
      elapsed_ms: elapsed,
    });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[v2-worker] Unexpected top-level error:", msg);
    return jsonErr({ ok: false, error: "INTERNAL_ERROR", message: msg }, 500);
  }
});
