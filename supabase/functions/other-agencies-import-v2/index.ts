import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";
import { parseXlsxData, extractEmails, debugEmailExtraction } from "../_shared/xlsxParser.ts";
import {
  computeAgencyDedupeKey,
  normalizeEmail,
  computeGlobalAgencyIdentityKey,
  computeStateScopedDedupeKey,
  normalizeDomain,
} from "../_shared/normalizeHelpers.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

interface ImportRequest {
  state_slug: string;
  filename: string;
  mode: "csv" | "json" | "xlsx";
  data: string | ArrayBuffer;
  generate_slugs?: boolean;
  split_emails?: boolean;
  auto_verify_on_import?: boolean;
  skip_auto_enqueue?: boolean;
}

interface AgencyRecord {
  state_slug: string;
  name: string;
  website_url?: string;
  city?: string;
  description?: string;
  services?: string[];
  primary_service?: string;
  logo_url?: string;
  email?: string;
  phone?: string;
  slug?: string;
  zip_code?: string;
  full_address?: string;
  maps_url?: string;
  latitude?: number;
  longitude?: number;
  maps_position?: number;
  keyword?: string;
  facebook_url?: string;
  instagram_url?: string;
  twitter_url?: string;
  youtube_url?: string;
  linkedin_url?: string;
}

interface ImportResult {
  ok: boolean;
  jobId: string;
  rows_read: number;
  duplicate_agency_rows_collapsed: number;
  unique_agencies_after_collapse: number;
  total_agencies: number;
  total_emails: number;
  agencies_created: number;
  agencies_updated: number;
  agencies_skipped_duplicate: number;
  emails_created: number;
  emails_skipped: number;
  duplicate_emails_skipped: number;
  queue_ready_unique_emails: number;
  agencies_with_no_email: number;
  phones_created: number;
  phones_skipped: number;
  agencies_with_no_phone: number;
  agencies_with_multiple_phones: number;
  failed: number;
  emails_enqueued_for_verification: number;
  listclean_auto_kick_attempted: boolean;
  listclean_auto_kick_started: boolean;
  listclean_auto_kick_already_running?: boolean;
  listclean_auto_kick_error?: string | null;
  duplicate_merge_attempted: boolean;
  duplicates_merged_by_domain: number;
  duplicates_merged_by_name: number;
  duplicate_merge_error?: string | null;
  errors: Array<{ row: number; agency: string; error: string }>;
  metadata_counts?: {
    rows_with_email: number;
    rows_with_full_address: number;
    rows_with_maps_url: number;
    rows_with_coords: number;
    rows_with_social_urls: number;
  };
  parser_diagnostics?: {
    detected_sheet_name?: string;
    detected_headers?: string[];
    header_mapping_used?: Record<string, string>;
    rows_total?: number;
    rows_with_email_cell_present?: number;
    rows_with_extracted_emails?: number;
    total_emails_extracted_before_dedupe?: number;
    total_emails_inserted?: number;
    sample_email_extraction_debug?: Array<{
      row_index: number;
      raw_email_cell_value: string | null;
      extracted_emails: string[];
      reason?: string;
    }>;
  };
  email_insert_diagnostics?: {
    total_email_insert_attempts: number;
    email_insert_errors_count: number;
    email_insert_error_samples: Array<{
      row_number: number;
      agency_name: string;
      first_email: string;
      error_message: string;
    }>;
  };
}

// Slug generation helpers
function generateSlug(name: string, stateSlug: string): string {
  let slug = name.trim().toLowerCase();
  slug = slug.replace(/&/g, "and");
  slug = slug.replace(/[^a-z0-9\s-]/g, "");
  slug = slug.replace(/[\s_]+/g, "-");
  slug = slug.replace(/-{2,}/g, "-");
  slug = slug.replace(/^-+|-+$/g, "");
  slug = `${slug}-${stateSlug}`;
  return slug.replace(/-{2,}/g, "-").replace(/^-+|-+$/g, "");
}

// State name derivation from slug
function getStateName(stateSlug: string): string {
  return stateSlug
    .split("-")
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");
}

// Helper: Split phone field by common separators
function splitPhoneField(phoneField: string | null | undefined): string[] {
  if (!phoneField) return [];
  const separators = /[,;|\n/]/;
  const parts = phoneField.split(separators);
  return parts
    .map((p) => p.trim())
    .filter((p) => p.length > 0);
}

// Helper: Normalize phone to international format
function normalizePhone(phoneRaw: string): string | null {
  if (!phoneRaw) return null;
  let cleaned = phoneRaw
    .replace(/[\s\-()\.]/g, '')
    .replace(/[x|ext\.?].*$/i, '')
    .trim();
  if (cleaned.length === 0) return null;
  if (cleaned.startsWith('+')) {
    const digitsOnly = cleaned.substring(1).replace(/\D/g, '');
    if (digitsOnly.length >= 10) {
      return `+${digitsOnly}`;
    }
    return null;
  }
  const digitsOnly = cleaned.replace(/\D/g, '');
  if (digitsOnly.length === 0) return null;
  if (digitsOnly.length === 10) {
    return `+1${digitsOnly}`;
  }
  if (digitsOnly.length === 11 && digitsOnly.startsWith('1')) {
    return `+${digitsOnly}`;
  }
  if (digitsOnly.length >= 11 && /^\d{1,3}\d{6,14}/.test(digitsOnly)) {
    return `+${digitsOnly}`;
  }
  return null;
}

// Helper: Parse and normalize phones from field
function parseAndNormalizePhones(
  phoneField: string | null | undefined
): Array<{ raw: string; normalized: string | null; isPrimary: boolean }> {
  const split = splitPhoneField(phoneField);
  const parsed = split.map((raw) => ({
    raw: raw.trim(),
    normalized: normalizePhone(raw),
  }));
  const seen = new Set<string>();
  const deduped = [];
  for (const phone of parsed) {
    const key = phone.normalized || phone.raw.toLowerCase();
    if (!seen.has(key)) {
      seen.add(key);
      deduped.push(phone);
    }
  }
  return deduped.map((phone, idx) => ({
    ...phone,
    isPrimary: idx === 0 && split.length > 0,
  }));
}

// Helper: Store phones for agency
async function storePhones(
  supabase: any,
  agencyId: string,
  phoneField: string | null | undefined
): Promise<{ created: number; skipped: number; multiple: boolean }> {
  if (!phoneField || phoneField.trim().length === 0) {
    return { created: 0, skipped: 0, multiple: false };
  }

  try {
    const parsed = parseAndNormalizePhones(phoneField);
    if (parsed.length === 0) {
      return { created: 0, skipped: 0, multiple: false };
    }

    const phoneRows = parsed.map((phone) => ({
      agency_id: agencyId,
      phone_raw: phone.raw,
      phone_normalized: phone.normalized,
      is_primary: phone.isPrimary,
      source: 'import',
    }));

    const { error: deleteError } = await supabase
      .from('other_agency_phones')
      .delete()
      .eq('agency_id', agencyId);

    if (deleteError) {
      console.error('Error deleting old phones:', deleteError);
      return { created: 0, skipped: parsed.length, multiple: parsed.length > 1 };
    }

    const { error: insertError } = await supabase
      .from('other_agency_phones')
      .insert(phoneRows);

    if (insertError) {
      console.error('Error inserting phones:', insertError);
      return { created: 0, skipped: parsed.length, multiple: parsed.length > 1 };
    }

    return { created: parsed.length, skipped: 0, multiple: parsed.length > 1 };
  } catch (error) {
    console.error('Store phones error:', error);
    return { created: 0, skipped: 0, multiple: false };
  }
}

// Helper: Enqueue emails for ListClean verification
async function enqueueEmailsForVerification(
  supabase: any,
  emailIds: string[]
): Promise<number> {
  if (emailIds.length === 0) return 0;

  try {
    const { error } = await supabase
      .from("other_agency_emails")
      .update({
        verification_next_retry_at: new Date().toISOString(),
        verification_attempt_count: 0,
        verification_state: "queued",
      })
      .in("id", emailIds);

    if (error) {
      console.error("Error enqueuing emails for verification:", error);
      return 0;
    }

    return emailIds.length;
  } catch (error) {
    console.error("Enqueue verification error:", error);
    return 0;
  }
}

// Helper: Auto-kick the ListClean queue processor
async function autoKickListCleanQueue(supabaseUrl: string, serviceRoleKey: string): Promise<{
  attempted: boolean;
  started: boolean;
  already_running?: boolean;
  error?: string | null;
}> {
  try {
    const queueFunctionUrl = `${supabaseUrl}/functions/v1/other-agencies-listclean-process-queue`;

    const response = await fetch(queueFunctionUrl, {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${serviceRoleKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({}),
    });

    if (!response.ok) {
      const errorData = await response.text().catch(() => "");
      console.error(`Queue kick failed with status ${response.status}:`, errorData);
      return {
        attempted: true,
        started: false,
        error: `HTTP ${response.status}`,
      };
    }

    const result = await response.json();

    const alreadyRunning = result.paused === true;
    const started = result.ok === true && result.paused !== true;

    return {
      attempted: true,
      started,
      already_running: alreadyRunning,
      error: null,
    };
  } catch (error) {
    console.error("Auto-kick error:", error);
    return {
      attempted: true,
      started: false,
      error: error instanceof Error ? error.message : "Unknown error",
    };
  }
}

// Helper: Auto-merge duplicate agencies after import
async function autoMergeDuplicates(supabase: any, stateSlug: string): Promise<{
  attempted: boolean;
  merged_by_domain: number;
  merged_by_name: number;
  error?: string | null;
}> {
  try {
    console.log(`[import] Running automatic duplicate merge for state: ${stateSlug}`);

    // First, merge by domain (global across all states)
    const { data: domainResult, error: domainError } = await supabase.rpc(
      "find_and_merge_duplicates_by_domain"
    );

    if (domainError) {
      console.error("[import] Domain merge error:", domainError.message);
    }

    const mergedByDomain = domainResult?.total_duplicates_deactivated || 0;

    // Then, merge by name within this state
    const { data: nameResult, error: nameError } = await supabase.rpc(
      "find_and_merge_duplicates_by_name_in_state",
      { p_state_slug: stateSlug }
    );

    if (nameError) {
      console.error("[import] Name merge error:", nameError.message);
    }

    const mergedByName = nameResult?.total_duplicates_deactivated || 0;

    console.log(`[import] Duplicate merge complete: ${mergedByDomain} by domain, ${mergedByName} by name`);

    return {
      attempted: true,
      merged_by_domain: mergedByDomain,
      merged_by_name: mergedByName,
      error: domainError?.message || nameError?.message || null,
    };
  } catch (error) {
    console.error("[import] Auto-merge error:", error);
    return {
      attempted: true,
      merged_by_domain: 0,
      merged_by_name: 0,
      error: error instanceof Error ? error.message : "Unknown error",
    };
  }
}

// Normalize a URL/domain to a bare hostname for identity comparison.
// Rules (format-only, no semantic logic):
//   1. Lowercase + trim
//   2. Strip protocol (http:// or https://)
//   3. Strip leading www.
//   4. Strip everything from the first "/" onward (path, query, hash)
//   5. Strip any remaining ?query or #hash fragments
//   6. Strip trailing dot/slash
// Returns "" if the input is empty.
function normalizeDomainForKey(raw: string | null | undefined): string {
  let s = (raw || "").trim().toLowerCase();
  s = s.replace(/^https?:\/\//i, "");
  s = s.replace(/^www\./i, "");
  const slashIdx = s.indexOf("/");
  if (slashIdx !== -1) s = s.substring(0, slashIdx);
  const queryIdx = s.indexOf("?");
  if (queryIdx !== -1) s = s.substring(0, queryIdx);
  const hashIdx = s.indexOf("#");
  if (hashIdx !== -1) s = s.substring(0, hashIdx);
  s = s.replace(/[./]+$/, "");
  return s;
}

// Normalize agency name for identity matching
function normalizeNameForKey(name: string | null | undefined): string {
  if (!name) return "";
  return name.trim().replace(/\s+/g, " ").toLowerCase();
}

// Normalize phone to digits only
function normalizePhoneForKey(phone: string | null | undefined): string {
  if (!phone) return "";
  let digits = phone.replace(/\D/g, "");
  if (digits.length === 11 && digits.startsWith("1")) {
    digits = digits.slice(1);
  }
  return digits;
}

// Normalize full address for matching
function normalizeAddressForKey(address: string | null | undefined): string {
  if (!address) return "";
  return address.trim().replace(/\s+/g, " ").toLowerCase();
}

// Normalize city for matching
function normalizeCityForKey(city: string | null | undefined): string {
  if (!city) return "";
  return city.trim().toLowerCase();
}

// ══════════════════════════════════════════════════════════════════════════════
// TIERED IDENTITY KEY SYSTEM
//
// Returns the BEST available identity key for an agency record.
// Keys are prefixed with their tier for debugging and to prevent cross-tier collisions.
//
// Priority (highest to lowest):
//   Tier 1: domain:{domain}              - Website domain (strongest)
//   Tier 2: name_phone:{name}|{digits}   - Name + phone combination
//   Tier 3: name_addr:{name}|{addr}      - Name + full address
//   Tier 4: name_city:{name}|{city}      - Name + city
//   Tier 5: name:{name}                  - Name only (weakest, but catches duplicates)
//
// ══════════════════════════════════════════════════════════════════════════════
function computeBestIdentityKey(
  websiteUrl: string | null | undefined,
  name: string | null | undefined,
  phone: string | null | undefined,
  fullAddress: string | null | undefined,
  city: string | null | undefined,
): { key: string; tier: number } | null {
  const domain = normalizeDomainForKey(websiteUrl);
  const normalizedName = normalizeNameForKey(name);
  const phoneDigits = normalizePhoneForKey(phone);
  const normalizedAddress = normalizeAddressForKey(fullAddress);
  const normalizedCity = normalizeCityForKey(city);

  // Must have a name to create any identity key
  if (!normalizedName || normalizedName.length < 2) {
    return null;
  }

  // Tier 1: Domain-based (strongest)
  if (domain && domain.length >= 4 && domain.includes(".")) {
    return { key: `domain:${domain}`, tier: 1 };
  }

  // Tier 2: Name + Phone
  if (phoneDigits && phoneDigits.length >= 7) {
    return { key: `name_phone:${normalizedName}|${phoneDigits}`, tier: 2 };
  }

  // Tier 3: Name + Full Address
  if (normalizedAddress && normalizedAddress.length >= 10) {
    return { key: `name_addr:${normalizedName}|${normalizedAddress}`, tier: 3 };
  }

  // Tier 4: Name + City
  if (normalizedCity && normalizedCity.length >= 2) {
    return { key: `name_city:${normalizedName}|${normalizedCity}`, tier: 4 };
  }

  // Tier 5: Name only (weakest - use for in-file collapse, cautious for DB matching)
  return { key: `name:${normalizedName}`, tier: 5 };
}

// Legacy function for backwards compatibility
function computeExactRowKey(
  websiteUrl: string | null | undefined,
  name: string | null | undefined,
  phone: string | null | undefined,
): string {
  const domain = normalizeDomainForKey(websiteUrl);
  const normalizedName = normalizeNameForKey(name);
  const phoneDigits = normalizePhoneForKey(phone);
  return `${domain}|${normalizedName}|${phoneDigits}`;
}

// Returns true if we have strong identity signals (domain or phone)
function hasStrongIdentity(
  websiteUrl: string | null | undefined,
  phone: string | null | undefined,
): boolean {
  const domain = normalizeDomainForKey(websiteUrl);
  if (domain && domain.length >= 4 && domain.includes(".")) return true;
  const phoneDigits = normalizePhoneForKey(phone);
  if (phoneDigits && phoneDigits.length >= 7) return true;
  return false;
}

// Legacy compatibility function
function isEligibleForGrouping(
  websiteUrl: string | null | undefined,
  name: string | null | undefined,
  phone: string | null | undefined,
): boolean {
  const domain = normalizeDomainForKey(websiteUrl);
  const normalizedName = normalizeNameForKey(name);
  const phoneDigits = normalizePhoneForKey(phone);
  return domain.length > 0 && normalizedName.length > 0 && phoneDigits.length >= 7;
}

// Service pool for auto-assignment
const SERVICE_POOL = [
  'Analytics',
  'Branding',
  'CRO',
  'Conversion Optimization',
  'Email Marketing',
  'Google Ads',
  'Lead Generation',
  'Local SEO',
  'Marketing Strategy',
  'PPC',
  'PR',
  'Paid Media',
  'Paid Search',
  'Paid Social',
  'Performance Marketing',
  'Programmatic',
  'SEO',
  'SEM',
  'SMM',
  'Social Media',
  'Video Marketing',
  'Web Design',
  'Web Development',
];

function pickService(name: string, stateSlug: string): string {
  const combined = `${name.toLowerCase()}|${stateSlug}`;
  let hash = 0;
  for (let i = 0; i < combined.length; i++) {
    hash = (hash * 31 + combined.charCodeAt(i)) >>> 0;
  }
  return SERVICE_POOL[hash % SERVICE_POOL.length];
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    const body = await req.json() as ImportRequest;
    const {
      state_slug,
      filename,
      mode,
      data,
      generate_slugs = false,
      split_emails = true,
      auto_verify_on_import = false,
      skip_auto_enqueue = false,
    } = body;

    const shouldAutoEnqueue = !skip_auto_enqueue;

    if (!state_slug || !filename || !mode || !data) {
      return new Response(
        JSON.stringify({ error: "Missing required fields: state_slug, filename, mode, data" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Create import job
    const { data: jobData, error: jobError } = await supabase
      .from("other_agency_import_jobs")
      .insert({
        state_slug,
        filename,
        mode,
        status: "processing",
        inserted: 0,
        updated: 0,
        failed: 0,
        skipped: 0,
      })
      .select("id")
      .single();

    if (jobError || !jobData) {
      return new Response(
        JSON.stringify({ error: "Failed to create import job", details: jobError }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const jobId = jobData.id;

    // Parse the file
    let records: AgencyRecord[] = [];
    let parserDiagnostics: any = null;

    try {
      if (mode === "json") {
        const parsed = typeof data === "string" ? JSON.parse(data) : data;
        records = Array.isArray(parsed) ? parsed : [parsed];
      } else {
        const parseResult = await parseXlsxData(data, mode, state_slug);
        records = parseResult.records;
        parserDiagnostics = parseResult.diagnostics;
      }
    } catch (parseError) {
      await supabase
        .from("other_agency_import_jobs")
        .update({ status: "failed", failed: 1 })
        .eq("id", jobId);

      return new Response(
        JSON.stringify({
          error: "Failed to parse file",
          details: parseError instanceof Error ? parseError.message : "Unknown parse error",
        }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Validate records array
    if (!Array.isArray(records) || records.length === 0) {
      await supabase
        .from("other_agency_import_jobs")
        .update({ status: "failed", failed: 1 })
        .eq("id", jobId);

      return new Response(
        JSON.stringify({ error: "No records found in file" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Ensure state_slug on all records
    records = records.map(r => ({ ...r, state_slug: r.state_slug || state_slug }));

    // Debug email extraction for diagnostics
    let emailDiagnostics: any = null;
    if (parserDiagnostics) {
      const sampleRows = records.slice(0, 5);
      const samples = sampleRows.map((r, idx) => {
        const emailField = r.email || null;
        const dbg = emailField ? debugEmailExtraction(emailField) : null;
        return {
          row_index: idx,
          raw_email_cell_value: emailField,
          extracted_emails: dbg ? dbg.emails : [],
          reason: dbg ? dbg.reason : "no email field",
        };
      });

      let totalEmailsExtracted = 0;
      let rowsWithEmailCell = 0;
      let rowsWithExtractedEmails = 0;
      for (const r of records) {
        if (r.email) {
          rowsWithEmailCell++;
          const { emails: extracted } = extractEmails(r.email);
          if (extracted.length > 0) {
            rowsWithExtractedEmails++;
            totalEmailsExtracted += extracted.length;
          }
        }
      }

      emailDiagnostics = {
        rows_with_email_cell_present: rowsWithEmailCell,
        rows_with_extracted_emails: rowsWithExtractedEmails,
        total_emails_extracted_before_dedupe: totalEmailsExtracted,
        sample_email_extraction_debug: samples,
      };
    }

    if (parserDiagnostics && emailDiagnostics) {
      parserDiagnostics = { ...parserDiagnostics, ...emailDiagnostics };
    }

    // ── PRE-PROCESSING PHASE ─────────────────────────────────────────────────
    //
    // Step A: Collapse duplicate agency rows using TIERED identity matching.
    //         Uses the best available identity key for each record.
    //         This ensures that rows representing the same agency are merged
    //         even if they only share a name (weakest match).
    //
    //         When multiple rows share the same identity key:
    //           - the FIRST row becomes the base record
    //           - subsequent rows contribute emails (union)
    //           - any blank fields on base are back-filled from duplicates
    //           - duplicateAgencyRowsCollapsed is incremented per extra row
    //
    // Step B: Multi-email split — each collapsed record whose email field holds
    //         N addresses is expanded into N per-email rows (all fields identical,
    //         only email changes).  Rows with 0 or 1 email pass through as-is.
    //
    // Result: recordsForSplit feeds the main processing loop.
    // ─────────────────────────────────────────────────────────────────────────

    // Step A: Collapse duplicate agency rows using tiered identity keys
    let duplicateAgencyRowsCollapsed = 0;

    // Map from identity key -> { base record, collected emails, phones }
    const grouped = new Map<string, {
      base: AgencyRecord;
      emails: Set<string>;
      phones: Set<string>;
      tier: number;
    }>();

    for (const record of records) {
      if (!record.name) {
        continue; // Skip records without names
      }

      // Compute the best identity key for this record
      const identityResult = computeBestIdentityKey(
        record.website_url,
        record.name,
        record.phone,
        record.full_address,
        record.city
      );

      if (!identityResult) {
        continue; // Skip if we can't compute any identity
      }

      const { key, tier } = identityResult;

      // Extract emails from this record
      const recordEmails = new Set<string>();
      if (record.email) {
        const { emails: extracted } = extractEmails(record.email);
        for (const e of extracted) {
          const norm = e.trim().toLowerCase();
          if (norm) recordEmails.add(norm);
        }
      }

      // Extract phones from this record
      const recordPhones = new Set<string>();
      if (record.phone) {
        const normalized = normalizePhoneForKey(record.phone);
        if (normalized) recordPhones.add(normalized);
      }

      if (!grouped.has(key)) {
        // First occurrence - create base record
        const base: AgencyRecord = { ...record };
        grouped.set(key, { base, emails: recordEmails, phones: recordPhones, tier });
      } else {
        // Duplicate found - merge into existing
        duplicateAgencyRowsCollapsed++;
        const entry = grouped.get(key)!;

        // Merge emails
        for (const e of recordEmails) entry.emails.add(e);

        // Merge phones
        for (const p of recordPhones) entry.phones.add(p);

        // Backfill missing fields from duplicate
        const b = entry.base as any;
        const r = record as any;
        const backfillFields: (keyof AgencyRecord)[] = [
          "website_url", "city", "description", "full_address", "zip_code", "maps_url",
          "latitude", "longitude", "maps_position", "keyword",
          "facebook_url", "instagram_url", "twitter_url", "youtube_url", "linkedin_url",
          "logo_url", "primary_service", "phone",
        ];
        for (const field of backfillFields) {
          if (!b[field] && r[field]) b[field] = r[field];
        }

        // If the duplicate has a stronger identity (lower tier), upgrade
        if (tier < entry.tier) {
          entry.tier = tier;
        }
      }
    }

    // Build collapsed records list
    const collapsedRecords: AgencyRecord[] = [];
    for (const { base, emails } of grouped.values()) {
      base.email = Array.from(emails).join(",");
      collapsedRecords.push(base);
    }

    const recordsForSplit: AgencyRecord[] = collapsedRecords;
    const deduplicatedRecords = recordsForSplit;

    // Step B: Expand multi-email records into per-email split rows.
    interface EmailSplitRow extends AgencyRecord {
      _split_email: string;
      _source_row_index: number;
    }

    const emailSplitRows: EmailSplitRow[] = [];
    for (let idx = 0; idx < recordsForSplit.length; idx++) {
      const rec = recordsForSplit[idx];
      if (split_emails && rec.email) {
        const { emails: extracted } = extractEmails(rec.email);
        if (extracted.length > 1) {
          for (const singleEmail of extracted) {
            emailSplitRows.push({ ...rec, email: singleEmail, _split_email: singleEmail, _source_row_index: idx });
          }
          continue;
        }
      }
      emailSplitRows.push({ ...rec, _split_email: rec.email || "", _source_row_index: idx });
    }

    // ── PROCESSING PHASE ─────────────────────────────────────────────────────
    //
    // COMPREHENSIVE IDENTITY MATCHING using tiered keys:
    //
    // The identityMasterMap contains ALL known agencies indexed by ALL their
    // possible identity keys. This ensures we find matches regardless of which
    // identity signals are available in the import row.
    //
    // Pre-loading strategy:
    //   - Load ALL agencies from the current state
    //   - Load ALL agencies with matching domains (cross-state)
    //   - Compute ALL tiered identity keys for each agency
    //   - Store in a single map for O(1) lookup
    //
    // This guarantees: if the agency exists, we WILL find it.
    // ─────────────────────────────────────────────────────────────────────────

    // Master identity map: identity_key -> { agencyId, canonicalSlug, tier }
    const identityMasterMap = new Map<string, { agencyId: string; canonicalSlug: string | null; tier: number }>();

    // In-run tracking: tracks agencies we've already processed in this import
    const inRunProcessed = new Map<string, { agencyId: string; canonicalSlug: string | null }>();

    // Pre-load ACTIVE agencies from the current state with full identity data
    // IMPORTANT: Only load is_active = true agencies so identity matching always
    // resolves to the canonical live record, never to an archived duplicate.
    {
      const { data: stateAgencies } = await supabase
        .from("other_agencies")
        .select("id, slug, website_url, name, phone, full_address, city, created_at")
        .eq("state_slug", state_slug)
        .eq("is_active", true)
        .order("created_at", { ascending: true });

      (stateAgencies || []).forEach((row: any) => {
        // Compute ALL possible identity keys for this agency
        const identityResult = computeBestIdentityKey(
          row.website_url,
          row.name,
          row.phone,
          row.full_address,
          row.city
        );

        if (identityResult) {
          // Store the best key
          if (!identityMasterMap.has(identityResult.key)) {
            identityMasterMap.set(identityResult.key, {
              agencyId: row.id,
              canonicalSlug: row.slug,
              tier: identityResult.tier,
            });
          }
        }

        // Also store by normalized name alone (for name-only matching)
        const normalizedName = normalizeNameForKey(row.name);
        if (normalizedName) {
          const nameKey = `name:${normalizedName}`;
          if (!identityMasterMap.has(nameKey)) {
            identityMasterMap.set(nameKey, {
              agencyId: row.id,
              canonicalSlug: row.slug,
              tier: 5,
            });
          }
        }

        // Store by domain if available (for cross-state matching)
        const domain = normalizeDomainForKey(row.website_url);
        if (domain && domain.includes(".")) {
          const domainKey = `domain:${domain}`;
          if (!identityMasterMap.has(domainKey)) {
            identityMasterMap.set(domainKey, {
              agencyId: row.id,
              canonicalSlug: row.slug,
              tier: 1,
            });
          }
        }
      });
    }

    // Pre-load agencies from OTHER states that share domains with our import data
    // This enables multi-state agency detection
    {
      // First, collect all domains from our import data
      const importDomains = new Set<string>();
      for (const record of recordsForSplit) {
        const domain = normalizeDomainForKey(record.website_url);
        if (domain && domain.includes(".")) {
          importDomains.add(domain);
        }
      }

      if (importDomains.size > 0) {
        // Fetch ACTIVE agencies from other states that might match by domain
        // IMPORTANT: Only load is_active = true to avoid matching archived duplicates cross-state.
        const { data: crossStateAgencies } = await supabase
          .from("other_agencies")
          .select("id, slug, website_url, name, phone, full_address, city, state_slug, created_at")
          .neq("state_slug", state_slug)
          .not("website_url", "is", null)
          .eq("is_active", true)
          .order("created_at", { ascending: true });

        (crossStateAgencies || []).forEach((row: any) => {
          const domain = normalizeDomainForKey(row.website_url);
          if (domain && importDomains.has(domain)) {
            const domainKey = `domain:${domain}`;
            // Only add if not already in map (preserve oldest = canonical)
            if (!identityMasterMap.has(domainKey)) {
              identityMasterMap.set(domainKey, {
                agencyId: row.id,
                canonicalSlug: row.slug,
                tier: 1,
              });
            }
          }
        });
      }
    }

    console.log(`[import] Pre-loaded ${identityMasterMap.size} identity keys for matching`);

    const errors: Array<{ row: number; agency: string; error: string }> = [];
    const emailIdsToEnqueue: string[] = [];
    let totalEmailInsertAttempts = 0;
    let emailInsertErrorsCount = 0;
    const emailInsertErrorSamples: Array<{
      row_number: number;
      agency_name: string;
      first_email: string;
      error_message: string;
    }> = [];

    // Pre-load existing slugs for collision detection when generating slugs for NEW profiles
    const existingSlugsMap = new Map<string, boolean>();
    if (generate_slugs) {
      const { data: existingSlugs } = await supabase
        .from("other_agencies")
        .select("slug")
        .eq("state_slug", state_slug)
        .not("slug", "is", null);

      if (existingSlugs && Array.isArray(existingSlugs)) {
        existingSlugs.forEach((row: any) => {
          if (row.slug) existingSlugsMap.set(row.slug, true);
        });
      }
    }

    let agenciesCreated = 0;
    let agenciesUpdated = 0;
    let agenciesSkippedDuplicate = 0;
    let emailsCreated = 0;
    let emailsSkipped = 0;
    let duplicateEmailsSkipped = 0;
    let agenciesWithNoEmail = 0;
    let phonesCreated = 0;
    let phonesSkipped = 0;
    let agenciesWithNoPhone = 0;
    let agenciesWithMultiplePhones = 0;
    let failed = 0;
    let emailsEnqueuedForVerification = 0;

    let rowsWithEmail = 0;
    let rowsWithFullAddress = 0;
    let rowsWithMapsUrl = 0;
    let rowsWithCoords = 0;
    let rowsWithSocialUrls = 0;

    // Process email-split rows in batches of 100
    const batchSize = 100;
    for (let i = 0; i < emailSplitRows.length; i += batchSize) {
      const batch = emailSplitRows.slice(i, i + batchSize);

      for (let j = 0; j < batch.length; j++) {
        const rowNum = i + j + 2;
        const record = batch[j];

        try {
          if (!record.name) {
            throw new Error("Missing required field: name");
          }

          if (!record.state_slug) record.state_slug = state_slug;
          if (!record.state_slug) throw new Error("Missing required field: state_slug");

          if (record.email) rowsWithEmail++;
          if (record.full_address) rowsWithFullAddress++;
          if (record.maps_url) rowsWithMapsUrl++;
          if ((record.latitude !== undefined && record.latitude !== null) ||
              (record.longitude !== undefined && record.longitude !== null)) {
            rowsWithCoords++;
          }
          if (record.facebook_url || record.instagram_url || record.twitter_url ||
              record.youtube_url || record.linkedin_url) {
            rowsWithSocialUrls++;
          }

          // ── COMPREHENSIVE AGENCY IDENTITY MATCHING ─────────────────────────
          //
          // Try ALL possible identity keys from strongest to weakest:
          //   Tier 1: domain:{domain}           - Website domain (cross-state)
          //   Tier 2: name_phone:{name}|{phone} - Name + phone
          //   Tier 3: name_addr:{name}|{addr}   - Name + address
          //   Tier 4: name_city:{name}|{city}   - Name + city
          //   Tier 5: name:{name}               - Name only (within state)
          //
          // If ANY key matches, we reuse that agency. This guarantees no duplicates.
          //
          const recordIdentity = computeBestIdentityKey(
            record.website_url,
            record.name,
            record.phone,
            record.full_address,
            record.city
          );

          let matchedAgencyId: string | null = null;
          let matchedSlug: string | null = null;
          let matchSource: string | null = null;
          let matchTier: number | null = null;

          // Strategy: Try multiple keys in priority order
          const keysToTry: Array<{ key: string; tier: number; source: string }> = [];

          // Add domain key if available (Tier 1 - cross-state)
          const domain = normalizeDomainForKey(record.website_url);
          if (domain && domain.includes(".")) {
            keysToTry.push({ key: `domain:${domain}`, tier: 1, source: "domain" });
          }

          // Add name+phone key if available (Tier 2)
          const phoneDigits = normalizePhoneForKey(record.phone);
          const normalizedName = normalizeNameForKey(record.name);
          if (normalizedName && phoneDigits && phoneDigits.length >= 7) {
            keysToTry.push({ key: `name_phone:${normalizedName}|${phoneDigits}`, tier: 2, source: "name_phone" });
          }

          // Add name+address key if available (Tier 3)
          const normalizedAddress = normalizeAddressForKey(record.full_address);
          if (normalizedName && normalizedAddress && normalizedAddress.length >= 10) {
            keysToTry.push({ key: `name_addr:${normalizedName}|${normalizedAddress}`, tier: 3, source: "name_addr" });
          }

          // Add name+city key if available (Tier 4)
          const normalizedCity = normalizeCityForKey(record.city);
          if (normalizedName && normalizedCity) {
            keysToTry.push({ key: `name_city:${normalizedName}|${normalizedCity}`, tier: 4, source: "name_city" });
          }

          // Add name-only key (Tier 5 - weakest but catches duplicates)
          if (normalizedName) {
            keysToTry.push({ key: `name:${normalizedName}`, tier: 5, source: "name_only" });
          }

          // Check in-run processed first (for this import session)
          for (const { key, tier, source } of keysToTry) {
            if (inRunProcessed.has(key)) {
              const match = inRunProcessed.get(key)!;
              matchedAgencyId = match.agencyId;
              matchedSlug = match.canonicalSlug;
              matchSource = `inrun_${source}`;
              matchTier = tier;
              break;
            }
          }

          // If not found in-run, check the master DB map
          if (!matchedAgencyId) {
            for (const { key, tier, source } of keysToTry) {
              if (identityMasterMap.has(key)) {
                const match = identityMasterMap.get(key)!;
                matchedAgencyId = match.agencyId;
                matchedSlug = match.canonicalSlug;
                matchSource = `db_${source}`;
                matchTier = tier;
                break;
              }
            }
          }

          // ── AGENCY MATCHED - REUSE EXISTING ─────────────────────────────
          // When we match an existing agency, we:
          // 1. Verify the matched agency is the canonical/live (is_active = true) record
          //    If it is inactive, resolve to its active counterpart via domain lookup.
          // 2. Reuse the canonical agency identity and slug
          // 3. Add a state listing for the IMPORTED state (multi-state support)
          // 4. Add any new emails/phones to the canonical agency
          // 5. Update agency_listings_index for the new state
          if (matchedAgencyId) {
            let agencyId = matchedAgencyId;
            let canonicalSlug = matchedSlug;

            // ── CANONICAL SAFETY CHECK ──────────────────────────────────────
            // Verify the matched agency is active. Although we only preload active
            // agencies above, the in-run map could theoretically hold a stale
            // reference if re-processing within the same session. Resolve to the
            // active canonical record if the matched row is inactive.
            const { data: matchedRow } = await supabase
              .from("other_agencies")
              .select("id, slug, is_active, website_url")
              .eq("id", agencyId)
              .maybeSingle();

            if (matchedRow && !matchedRow.is_active) {
              console.warn(`[import] Matched agency ${agencyId} (${record.name}) is inactive — resolving to active canonical`);
              const matchedDomain = normalizeDomainForKey(matchedRow.website_url);
              let resolvedToActive = false;

              if (matchedDomain && matchedDomain.includes(".")) {
                const { data: activeByDomain } = await supabase
                  .from("other_agencies")
                  .select("id, slug")
                  .eq("website_domain_normalized", matchedDomain)
                  .eq("is_active", true)
                  .order("created_at", { ascending: true })
                  .limit(1)
                  .maybeSingle();

                if (activeByDomain) {
                  agencyId = activeByDomain.id;
                  canonicalSlug = activeByDomain.slug;
                  resolvedToActive = true;
                  console.log(`[import] Resolved inactive ${matchedAgencyId} -> active canonical ${agencyId} (${canonicalSlug})`);
                }
              }

              if (!resolvedToActive) {
                const { data: activeByName } = await supabase
                  .from("other_agencies")
                  .select("id, slug")
                  .eq("state_slug", record.state_slug)
                  .eq("is_active", true)
                  .ilike("name", record.name)
                  .order("created_at", { ascending: true })
                  .limit(1)
                  .maybeSingle();

                if (activeByName) {
                  agencyId = activeByName.id;
                  canonicalSlug = activeByName.slug;
                  console.log(`[import] Resolved inactive ${matchedAgencyId} -> active by name ${agencyId} (${canonicalSlug})`);
                } else {
                  console.error(`[import] Could not find active canonical for inactive agency ${matchedAgencyId} (${record.name}) — skipping index writes`);
                  agenciesSkippedDuplicate++;
                  continue;
                }
              }
            }

            agenciesSkippedDuplicate++;

            // ── MULTI-STATE SUPPORT ──────────────────────────────────────────
            // Add state listing for the imported state (creates if not exists)
            // This ensures the agency appears in the new state's page
            try {
              const { error: stateListingError } = await supabase
                .from("other_agency_state_listings")
                .upsert({
                  agency_id: agencyId,
                  state_slug: record.state_slug,
                  state_name: getStateName(record.state_slug),
                  section: "other",
                  is_visible: true,
                  import_job_id: jobId,
                }, { onConflict: "agency_id,state_slug" });

              if (stateListingError) {
                console.error(`[import] Failed to add state listing for ${record.name} in ${record.state_slug}:`, stateListingError.message);
              } else {
                console.log(`[import] Added state listing for agency ${record.name} (${canonicalSlug}) in ${record.state_slug} via ${matchSource}`);
              }
            } catch (stateErr) {
              console.error(`[import] State listing error:`, stateErr);
            }

            // Also update/create the agency_listings_index entry for search
            try {
              const agencyDomain = normalizeDomainForKey(record.website_url);
              const pagePath = `/marketing-agencies/${record.state_slug}`;

              await supabase
                .from("agency_listings_index")
                .upsert({
                  agency_id: agencyId,
                  agency_slug: canonicalSlug || "",
                  agency_name: record.name,
                  agency_domain: agencyDomain && agencyDomain.includes(".") ? agencyDomain : null,
                  state_slug: record.state_slug,
                  section: "other",
                  page_path: pagePath,
                }, { onConflict: "agency_id,state_slug,section" });
            } catch (indexErr) {
              console.error(`[import] Listings index error:`, indexErr);
            }

            // Process phones for matched agency (add new ones)
            if (record.phone) {
              const parsed = parseAndNormalizePhones(record.phone);
              for (const phone of parsed) {
                if (phone.normalized) {
                  const { data: existingPhone } = await supabase
                    .from("other_agency_phones")
                    .select("id")
                    .eq("agency_id", agencyId)
                    .eq("phone_normalized", phone.normalized)
                    .maybeSingle();

                  if (!existingPhone) {
                    await supabase
                      .from("other_agency_phones")
                      .insert({
                        agency_id: agencyId,
                        phone_raw: phone.raw,
                        phone_normalized: phone.normalized,
                        is_primary: false,
                        source: "import",
                      });
                    phonesCreated++;
                  }
                }
              }
            }

            // Still process email for this split row
            if (split_emails && record.email) {
              const { emails: singleList } = extractEmails(record.email);
              const singleEmail = singleList[0] || record.email.trim();
              if (singleEmail) {
                const normalizedEmail = normalizeEmail(singleEmail);
                if (normalizedEmail) {
                  totalEmailInsertAttempts++;
                  const { data: existingEmail } = await supabase
                    .from("other_agency_emails")
                    .select("id")
                    .eq("agency_id", agencyId)
                    .eq("email_normalized", normalizedEmail)
                    .maybeSingle();

                  if (!existingEmail) {
                    const emailPayload: any = {
                      agency_id: agencyId,
                      email_raw: singleEmail.trim(),
                      email_normalized: normalizedEmail,
                      source: "import",
                      verification_state: "queued",
                      validation_status: "pending",
                      verification_next_retry_at: new Date().toISOString(),
                      verification_attempt_count: 0,
                    };
                    const { data: newEmail, error: emailError } = await supabase
                      .from("other_agency_emails")
                      .insert(emailPayload)
                      .select("id")
                      .single();

                    if (emailError) {
                      emailsSkipped++;
                      emailInsertErrorsCount++;
                      if (emailInsertErrorSamples.length < 5) {
                        emailInsertErrorSamples.push({
                          row_number: rowNum,
                          agency_name: record.name,
                          first_email: singleEmail,
                          error_message: emailError.message,
                        });
                      }
                    } else {
                      emailsCreated++;
                      if ((shouldAutoEnqueue || auto_verify_on_import) && newEmail?.id) {
                        emailIdsToEnqueue.push(newEmail.id);
                      }
                    }
                  } else {
                    duplicateEmailsSkipped++;
                  }
                }
              }
            } else if (!split_emails && record.email) {
              agenciesWithNoEmail++;
            }

            if (split_emails && !record.email) {
              agenciesWithNoEmail++;
            }

            continue;
          }

          // ── SLUG RESOLUTION ──────────────────────────────────────────────
          // Always generate a slug - the schema now allows null but we want URLs to work
          // IMPORTANT: Never create suffixed slugs like agency-name-2 unless truly different
          let resolvedSlug: string | null = record.slug || null;

          if (!resolvedSlug) {
            // Generate base slug without suffix
            let generated = generateSlug(record.name, record.state_slug);

            // Only add suffix if slug collision AND we're certain it's a different agency
            // Since we already checked all identity matches above, if we're here, it's truly new
            let attempt = 0;
            while (existingSlugsMap.has(generated) && attempt < 10) {
              attempt++;
              generated = generateSlug(`${record.name} ${attempt}`, record.state_slug);
            }
            resolvedSlug = generated;
            existingSlugsMap.set(resolvedSlug, true);
          }

          // ── AGENCY DEDUPE KEY ────────────────────────────────────────────
          // Store the best identity key in the database for future matching
          const dedupeKeyForDb = recordIdentity ? recordIdentity.key : null;
          const agencyDedupeKeyLegacy = computeAgencyDedupeKey({
            name: record.name,
            websiteUrl: record.website_url,
            phone: record.phone,
            address: record.full_address,
            stateSlug: record.state_slug,
          });

          // Also compute and store the global identity key
          const globalIdentityKeyForDb = domain && domain.includes(".")
            ? `domain:${domain}`
            : (normalizedName && phoneDigits && phoneDigits.length >= 7)
              ? `name_phone:${normalizedName}|${phoneDigits}`
              : null;

          // ── INSERT NEW AGENCY ────────────────────────────────────────────
          // At this point, we've confirmed this is a genuinely new agency
          // (all identity checks above found no match)
          const agencyPayload: any = {
            state_slug: record.state_slug,
            name: record.name,
            slug: resolvedSlug,
            website_url: record.website_url || null,
            city: record.city || null,
            description: record.description || null,
            services: record.services || null,
            primary_service: record.primary_service || pickService(record.name, record.state_slug),
            logo_url: record.logo_url || null,
            phone: record.phone || null,
            zip_code: record.zip_code || null,
            full_address: record.full_address || null,
            maps_url: record.maps_url || null,
            latitude: record.latitude ?? null,
            longitude: record.longitude ?? null,
            maps_position: record.maps_position ?? null,
            keyword: record.keyword || null,
            facebook_url: record.facebook_url || null,
            instagram_url: record.instagram_url || null,
            twitter_url: record.twitter_url || null,
            youtube_url: record.youtube_url || null,
            linkedin_url: record.linkedin_url || null,
            agency_dedupe_key: dedupeKeyForDb,
            agency_dedupe_key_legacy: agencyDedupeKeyLegacy,
            global_identity_key: globalIdentityKeyForDb,
          };

          let agencyId: string | null = null;
          let wasCreated = false;

          // Direct insert since we've already confirmed no match exists
          const { data: insertData, error: insertError } = await supabase
            .from("other_agencies")
            .insert(agencyPayload)
            .select("id, slug")
            .single();

          if (insertError) {
            // If insert fails due to constraint, try to find and update existing
            console.error(`Insert error for ${record.name}: ${insertError.message}`);

            // Last resort: check by slug
            if (resolvedSlug) {
              const { data: existingBySlug } = await supabase
                .from("other_agencies")
                .select("id, slug")
                .eq("slug", resolvedSlug)
                .eq("state_slug", record.state_slug)
                .maybeSingle();

              if (existingBySlug) {
                agencyId = existingBySlug.id;
                resolvedSlug = existingBySlug.slug || resolvedSlug;

                const { error: updateError } = await supabase
                  .from("other_agencies")
                  .update(agencyPayload)
                  .eq("id", agencyId);

                if (updateError) {
                  throw new Error(`Agency update error: ${updateError.message}`);
                }
                wasCreated = false;
              } else {
                throw new Error(`Agency insert failed: ${insertError.message}`);
              }
            } else {
              throw new Error(`Agency insert failed: ${insertError.message}`);
            }
          } else if (insertData) {
            agencyId = insertData.id;
            resolvedSlug = insertData.slug || resolvedSlug;
            wasCreated = true;
          }

          // Track create vs update
          if (wasCreated) {
            agenciesCreated++;
          } else {
            agenciesUpdated++;
          }

          // Register in identity maps for subsequent rows in this import
          // This prevents creating duplicates within the same import run
          for (const { key } of keysToTry) {
            inRunProcessed.set(key, { agencyId, canonicalSlug: resolvedSlug });
          }

          // Also update the master map so future batches can find this agency
          if (recordIdentity) {
            identityMasterMap.set(recordIdentity.key, {
              agencyId,
              canonicalSlug: resolvedSlug,
              tier: recordIdentity.tier,
            });
          }

          // ── PHONES ───────────────────────────────────────────────────────
          if (record.phone) {
            const phoneResult = await storePhones(supabase, agencyId!, record.phone);
            phonesCreated += phoneResult.created;
            phonesSkipped += phoneResult.skipped;
            if (phoneResult.multiple) agenciesWithMultiplePhones++;
          } else {
            agenciesWithNoPhone++;
          }

          // ── EMAILS ───────────────────────────────────────────────────────
          if (split_emails && record.email) {
            const { emails: singleList } = extractEmails(record.email);
            const singleEmail = singleList[0] || record.email.trim();
            if (singleEmail) {
              const normalizedEmail = normalizeEmail(singleEmail);
              if (normalizedEmail) {
                totalEmailInsertAttempts++;
                const { data: existingEmail } = await supabase
                  .from("other_agency_emails")
                  .select("id")
                  .eq("agency_id", agencyId)
                  .eq("email_normalized", normalizedEmail)
                  .maybeSingle();

                if (!existingEmail) {
                  const emailPayload2: any = {
                    agency_id: agencyId,
                    email_raw: singleEmail.trim(),
                    email_normalized: normalizedEmail,
                    source: "import",
                    verification_state: "queued",
                    validation_status: "pending",
                    verification_next_retry_at: new Date().toISOString(),
                    verification_attempt_count: 0,
                  };
                  const { data: newEmail, error: emailError } = await supabase
                    .from("other_agency_emails")
                    .insert(emailPayload2)
                    .select("id")
                    .single();

                  if (emailError) {
                    emailsSkipped++;
                    emailInsertErrorsCount++;
                    if (emailInsertErrorSamples.length < 5) {
                      emailInsertErrorSamples.push({
                        row_number: rowNum,
                        agency_name: record.name,
                        first_email: singleEmail,
                        error_message: emailError.message,
                      });
                    }
                  } else {
                    emailsCreated++;
                    if ((shouldAutoEnqueue || auto_verify_on_import) && newEmail?.id) {
                      emailIdsToEnqueue.push(newEmail.id);
                    }
                  }
                } else {
                  duplicateEmailsSkipped++;
                }
              }
            } else {
              agenciesWithNoEmail++;
            }
          } else if (!split_emails && record.email) {
            // Store email directly on agency row (legacy mode)
            const { error: emailUpdateError } = await supabase
              .from("other_agencies")
              .update({ email: record.email })
              .eq("id", agencyId);

            if (emailUpdateError) {
              emailsSkipped++;
            } else {
              emailsCreated++;
            }
          } else {
            agenciesWithNoEmail++;
          }

        } catch (rowError) {
          failed++;
          errors.push({
            row: rowNum,
            agency: record.name || "(unknown)",
            error: rowError instanceof Error ? rowError.message : "Unknown error",
          });
        }
      }
    }

    // Enqueue emails for verification (now automatic by default)
    const shouldEnqueue = shouldAutoEnqueue || auto_verify_on_import;
    if (shouldEnqueue && emailIdsToEnqueue.length > 0) {
      emailsEnqueuedForVerification = emailIdsToEnqueue.length;
    }

    // Auto-merge duplicate agencies (runs automatically after every import)
    const mergeResult = await autoMergeDuplicates(supabase, state_slug);

    // Auto-kick ListClean queue to start processing immediately
    let autoKickResult = { attempted: false, started: false, already_running: false, error: null as string | null };
    if (shouldEnqueue && emailIdsToEnqueue.length > 0) {
      autoKickResult = await autoKickListCleanQueue(supabaseUrl, serviceRoleKey);
    }

    // Update job status
    await supabase
      .from("other_agency_import_jobs")
      .update({
        status: "succeeded",
        inserted: agenciesCreated,
        updated: agenciesUpdated,
        failed,
        skipped: agenciesWithNoEmail,
      })
      .eq("id", jobId);

    const result: ImportResult = {
      ok: true,
      jobId,
      rows_read: records.length,
      duplicate_agency_rows_collapsed: duplicateAgencyRowsCollapsed,
      unique_agencies_after_collapse: recordsForSplit.length,
      total_agencies: deduplicatedRecords.length,
      total_emails: emailsCreated + emailsSkipped,
      agencies_created: agenciesCreated,
      agencies_updated: agenciesUpdated,
      agencies_skipped_duplicate: agenciesSkippedDuplicate,
      emails_created: emailsCreated,
      emails_skipped: emailsSkipped,
      duplicate_emails_skipped: duplicateEmailsSkipped,
      queue_ready_unique_emails: emailIdsToEnqueue.length,
      agencies_with_no_email: agenciesWithNoEmail,
      phones_created: phonesCreated,
      phones_skipped: phonesSkipped,
      agencies_with_no_phone: agenciesWithNoPhone,
      agencies_with_multiple_phones: agenciesWithMultiplePhones,
      failed,
      emails_enqueued_for_verification: emailsEnqueuedForVerification,
      listclean_auto_kick_attempted: autoKickResult.attempted,
      listclean_auto_kick_started: autoKickResult.started,
      listclean_auto_kick_already_running: autoKickResult.already_running,
      listclean_auto_kick_error: autoKickResult.error,
      duplicate_merge_attempted: mergeResult.attempted,
      duplicates_merged_by_domain: mergeResult.merged_by_domain,
      duplicates_merged_by_name: mergeResult.merged_by_name,
      duplicate_merge_error: mergeResult.error,
      errors: errors.slice(0, 50),
      metadata_counts: {
        rows_with_email: rowsWithEmail,
        rows_with_full_address: rowsWithFullAddress,
        rows_with_maps_url: rowsWithMapsUrl,
        rows_with_coords: rowsWithCoords,
        rows_with_social_urls: rowsWithSocialUrls,
      },
      parser_diagnostics: parserDiagnostics ? {
        ...parserDiagnostics,
        total_emails_inserted: emailsCreated,
      } : undefined,
      email_insert_diagnostics: emailInsertErrorsCount > 0 ? {
        total_email_insert_attempts: totalEmailInsertAttempts,
        email_insert_errors_count: emailInsertErrorsCount,
        email_insert_error_samples: emailInsertErrorSamples,
      } : undefined,
    };

    return new Response(JSON.stringify(result), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
