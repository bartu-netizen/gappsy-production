import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin } from "../_shared/adminAuth.ts";
import { refreshEmailFlags, type FlagRefreshResult } from "../_shared/refreshEmailFlags.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

interface CleanedEmailRow {
  email_id?: string;
  agency_id?: string;
  email_normalized?: string;
  validation_status: string;
  validation_provider?: string;
  validation_reason?: string;
  validation_score?: number;
  detected_provider?: string;
}

interface ImportCleanedRequest {
  filename: string;
  mode: "csv" | "json";
  data: string;
  provider?: string;
  export_job_id?: string;
}

interface ImportCleanedResult {
  ok: boolean;
  total_rows: number;
  rows_matched: number;
  rows_updated: number;
  rows_unmatched: number;
  rows_invalid: number;
  detected_format?: string;
  timing_ms?: number;
  match_method_stats: {
    via_lineage: number;
    via_lineage_dedup_fan_out: number;
    via_email_id: number;
    via_agency_email: number;
    via_unique_email: number;
    ambiguous_skipped: number;
  };
  errors: Array<{ row: number; reason: string }>;
  flags_refresh?: FlagRefreshResult;
}

function normalizeHeaderName(header: string): string {
  return header
    .trim()
    .replace(/^\ufeff/, "")
    .replace(/^"|"$/g, "")
    .replace(/\s+/g, "_")
    .replace(/-/g, "_")
    .toLowerCase();
}

function findHeaderIndex(headers: string[], aliases: string[]): number {
  for (const alias of aliases) {
    for (let i = 0; i < headers.length; i++) {
      if (normalizeHeaderName(headers[i]) === alias) {
        return i;
      }
    }
  }
  return -1;
}

function mapExternalStatus(status: string): string {
  const normalized = (status || "").trim().toLowerCase();
  const statusMap: { [key: string]: string } = {
    "clean": "valid",
    "valid": "valid",
    "invalid": "invalid",
    "bad": "invalid",
    "undeliverable": "invalid",
    "risky": "retry",
    "catch-all": "retry",
    "catch all": "retry",
    "catch_all": "retry",
    "duplicate": "invalid",
    "unknown": "retry",
  };
  if (statusMap[normalized]) return statusMap[normalized];
  if (!normalized || normalized === "") return "pending";
  return "retry";
}

function parseCleanedCSV(csvData: string): { rows: CleanedEmailRow[]; detectedFormat: string } {
  const lines = csvData.trim().split("\n");
  if (lines.length < 2) return { rows: [], detectedFormat: "unknown" };

  const headerLine = lines[0];
  const rawHeaders = headerLine.split(",");

  const hasListCleanFields = findHeaderIndex(rawHeaders, ["lc_status", "lc_email", "lc_reason"]) >= 0;
  const detectedFormat = hasListCleanFields ? "ListClean" : "Standard";

  const emailIdIdx = findHeaderIndex(rawHeaders, ["email_id", "id"]);
  const agencyIdIdx = findHeaderIndex(rawHeaders, ["agency_id"]);
  const emailIdx = hasListCleanFields
    ? findHeaderIndex(rawHeaders, ["lc_email", "email", "email_normalized"])
    : findHeaderIndex(rawHeaders, ["email", "email_normalized", "lc_email"]);
  const statusIdx = findHeaderIndex(rawHeaders, ["lc_status", "validation_status", "status"]);
  const reasonIdx = findHeaderIndex(rawHeaders, ["lc_reason", "validation_reason", "reason"]);
  const providerIdx = findHeaderIndex(rawHeaders, ["validation_provider", "provider"]);
  const scoreIdx = findHeaderIndex(rawHeaders, ["validation_score", "score"]);

  if (statusIdx === -1) {
    throw new Error("CSV must contain LC_Status or validation_status column");
  }

  const rows: CleanedEmailRow[] = [];

  for (let i = 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;

    const values: string[] = [];
    let current = "";
    let inQuotes = false;

    for (let j = 0; j < line.length; j++) {
      const char = line[j];
      if (char === '"') {
        inQuotes = !inQuotes;
      } else if (char === "," && !inQuotes) {
        values.push(current.trim().replace(/^"|"$/g, ""));
        current = "";
      } else {
        current += char;
      }
    }
    values.push(current.trim().replace(/^"|"$/g, ""));

    const rawStatus = values[statusIdx] || "pending";
    const mappedStatus = mapExternalStatus(rawStatus);

    const row: CleanedEmailRow = {
      validation_status: mappedStatus,
      detected_provider: detectedFormat === "ListClean" ? "ListClean" : undefined,
    };

    if (emailIdIdx >= 0 && values[emailIdIdx]) row.email_id = values[emailIdIdx].trim();
    if (agencyIdIdx >= 0 && values[agencyIdIdx]) row.agency_id = values[agencyIdIdx].trim();
    if (emailIdx >= 0 && values[emailIdx]) {
      row.email_normalized = values[emailIdx].trim().toLowerCase();
    }
    if (providerIdx >= 0 && values[providerIdx]) row.validation_provider = values[providerIdx].trim();
    if (reasonIdx >= 0 && values[reasonIdx]) row.validation_reason = values[reasonIdx].trim();
    if (scoreIdx >= 0) {
      const score = parseFloat(values[scoreIdx]);
      if (!isNaN(score)) row.validation_score = score;
    }

    rows.push(row);
  }

  return { rows, detectedFormat };
}

// ─────────────────────────────────────────────────────────────────────────────
// Lineage entry type
// ─────────────────────────────────────────────────────────────────────────────
interface LineageEntry {
  other_agency_email_id: string;
  agency_id: string;
  lineage_row_id: string;
  is_dedup_anchor: boolean;
}

// ─────────────────────────────────────────────────────────────────────────────
// BULK LINEAGE PATH
// ─────────────────────────────────────────────────────────────────────────────
// Old: 1 row = 2+ DB roundtrips → O(N) roundtrips total
// New: all rows → 1 RPC call that does 2 bulk UPDATEs inside Postgres
// ─────────────────────────────────────────────────────────────────────────────
async function applyLineageBulk(
  supabase: ReturnType<typeof createClient>,
  rows: CleanedEmailRow[],
  lineageMap: Map<string, LineageEntry[]>,
  resolvedProvider: string
): Promise<{
  matched: number;
  updated: number;
  unmatched_emails: string[];
  via_lineage: number;
  via_lineage_dedup_fan_out: number;
}> {
  // Build a flat list of all update records by expanding lineage entries per email
  const updateRecords: Array<{
    other_agency_email_id: string;
    lineage_row_id: string;
    is_dedup_anchor: boolean;
    validation_status: string;
    validation_provider: string;
    validation_reason: string | null;
    validation_score: number | null;
  }> = [];

  let matchedEmails = 0;
  let anchorCount = 0;
  let fanOutCount = 0;
  const unmatchedEmails: string[] = [];

  for (const row of rows) {
    if (!row.email_normalized) {
      unmatchedEmails.push(row.email_normalized || "(no email)");
      continue;
    }

    const entries = lineageMap.get(row.email_normalized.toLowerCase());
    if (!entries || entries.length === 0) {
      unmatchedEmails.push(row.email_normalized);
      continue;
    }

    matchedEmails++;
    const finalProvider = row.validation_provider || row.detected_provider || resolvedProvider;

    for (const entry of entries) {
      updateRecords.push({
        other_agency_email_id: entry.other_agency_email_id,
        lineage_row_id: entry.lineage_row_id,
        // Agency ID invariant guard: the RPC will refuse to update rows where
        // the email's current agency_id no longer matches this lineage_agency_id.
        // This prevents cleaning results from silently re-attaching to the wrong
        // agency if the email row was re-linked between export and import time.
        lineage_agency_id: entry.agency_id,
        // Allowed values: 'exact' | 'lineage' | 'ambiguous' | 'not_found'
        // anchor rows are the primary deduplicated email → 'exact'
        // fan-out rows are duplicates sharing the same email → 'lineage'
        match_confidence: entry.is_dedup_anchor ? "exact" : "lineage",
        validation_status: row.validation_status,
        validation_provider: finalProvider,
        validation_reason: row.validation_reason || null,
        validation_score: row.validation_score || null,
      });

      if (entry.is_dedup_anchor) {
        anchorCount++;
      } else {
        fanOutCount++;
      }
    }
  }

  if (updateRecords.length === 0) {
    return {
      matched: matchedEmails,
      updated: 0,
      unmatched_emails: unmatchedEmails,
      via_lineage: 0,
      via_lineage_dedup_fan_out: 0,
    };
  }

  // Single RPC call replaces O(N) individual UPDATE calls
  const { data: rpcResult, error: rpcError } = await supabase
    .rpc("bulk_apply_lineage_cleaned_results", {
      p_updates: updateRecords,
    });

  if (rpcError) {
    console.error("[import-cleaned] bulk_apply_lineage_cleaned_results error:", rpcError);
    throw new Error(`Bulk lineage update failed: ${rpcError.message}`);
  }

  const emailRowsUpdated = rpcResult?.email_rows_updated ?? 0;

  return {
    matched: matchedEmails,
    updated: emailRowsUpdated,
    unmatched_emails: unmatchedEmails,
    via_lineage: anchorCount,
    via_lineage_dedup_fan_out: fanOutCount,
  };
}

// ─────────────────────────────────────────────────────────────────────────────
// BULK DIRECT PATH (no lineage)
// ─────────────────────────────────────────────────────────────────────────────
// Match priority:
//   Tier 1 — email_id            (strongest: direct PK match)
//   Tier 2 — agency_id + email   (scoped to specific agency)
//   Tier 3 — exact unique email  (safe only when exactly 1 DB record exists)
//
// Tier 3 uses the bulk_apply_exact_email_fallback RPC instead of a client-side
// .in() query. The .in() approach creates a URL query string that exceeds the
// ~8 KB HTTP URL length limit when >150 emails are present, causing PostgREST
// to silently fail and return empty results. The RPC sends a JSONB POST body
// with no size constraint and does the lookup + ambiguity check + UPDATE in a
// single DB round-trip.
// ─────────────────────────────────────────────────────────────────────────────
async function applyDirectBulk(
  supabase: ReturnType<typeof createClient>,
  rows: CleanedEmailRow[],
  resolvedProvider: string
): Promise<{
  matched: number;
  updated: number;
  via_email_id: number;
  via_agency_email: number;
  via_unique_email: number;
  ambiguous_skipped: number;
  errors: Array<{ row: number; reason: string }>;
}> {
  // Separate rows by match tier
  const byEmailId: Array<{ idx: number; row: CleanedEmailRow }> = [];
  const byAgencyEmail: Array<{ idx: number; row: CleanedEmailRow }> = [];
  const byUniqueEmail: Array<{ idx: number; row: CleanedEmailRow }> = [];

  for (let i = 0; i < rows.length; i++) {
    const row = rows[i];
    if (row.email_id) {
      byEmailId.push({ idx: i, row });
    } else if (row.agency_id && row.email_normalized) {
      byAgencyEmail.push({ idx: i, row });
    } else if (row.email_normalized) {
      byUniqueEmail.push({ idx: i, row });
    }
  }

  const errors: Array<{ row: number; reason: string }> = [];
  let viaEmailId = 0;
  let viaAgencyEmail = 0;
  let viaUniqueEmail = 0;
  let ambiguousSkipped = 0;
  let totalUpdated = 0;

  // ── Tier 1: by email_id — bulk RPC, one round-trip ───────────────────────
  if (byEmailId.length > 0) {
    const updateRecords = byEmailId.map(({ row }) => ({
      email_id: row.email_id,
      validation_status: row.validation_status,
      validation_provider: row.validation_provider || row.detected_provider || resolvedProvider,
      validation_reason: row.validation_reason || null,
      validation_score: row.validation_score || null,
    }));

    const { data: rpcResult, error: rpcError } = await supabase
      .rpc("bulk_apply_direct_cleaned_results", { p_updates: updateRecords });

    if (rpcError) {
      console.error("[import-cleaned] tier1 email_id RPC error:", rpcError.message);
      errors.push({ row: -1, reason: `Tier 1 (email_id) RPC failed: ${rpcError.message}` });
    } else {
      viaEmailId = rpcResult?.rows_updated ?? 0;
      totalUpdated += viaEmailId;
      console.log(`[import-cleaned] tier1 email_id: ${viaEmailId} of ${byEmailId.length} updated`);
    }
  }

  // ── Tier 2: by agency_id + email_normalized — bulk RPC, one round-trip ───
  if (byAgencyEmail.length > 0) {
    const updateRecords = byAgencyEmail.map(({ row }) => ({
      agency_id: row.agency_id,
      email_normalized: row.email_normalized,
      validation_status: row.validation_status,
      validation_provider: row.validation_provider || row.detected_provider || resolvedProvider,
      validation_reason: row.validation_reason || null,
      validation_score: row.validation_score || null,
    }));

    const { data: rpcResult, error: rpcError } = await supabase
      .rpc("bulk_apply_direct_cleaned_results", { p_updates: updateRecords });

    if (rpcError) {
      console.error("[import-cleaned] tier2 agency+email RPC error:", rpcError.message);
      errors.push({ row: -1, reason: `Tier 2 (agency+email) RPC failed: ${rpcError.message}` });
    } else {
      viaAgencyEmail = rpcResult?.rows_updated ?? 0;
      totalUpdated += viaAgencyEmail;
      console.log(`[import-cleaned] tier2 agency+email: ${viaAgencyEmail} of ${byAgencyEmail.length} updated`);
    }
  }

  // ── Tier 3: exact unique email — server-side RPC, no URL length limit ────
  //
  // PREVIOUS BUG: used `.in("email_normalized", emailList)` via PostgREST GET.
  // For 700+ emails the resulting URL exceeds the ~8 KB HTTP limit, PostgREST
  // silently returns empty results, and via_unique_email stays at 0.
  //
  // FIX: bulk_apply_exact_email_fallback RPC accepts a JSONB POST body and
  // does lookup + ambiguity check + UPDATE in a single server-side function.
  // Ambiguous emails (matching multiple agencies) are counted and skipped —
  // never attached to the wrong agency.
  // ──────────────────────────────────────────────────────────────────────────
  if (byUniqueEmail.length > 0) {
    console.log(`[import-cleaned] tier3 exact-email: sending ${byUniqueEmail.length} emails to RPC`);

    const updateRecords = byUniqueEmail.map(({ row }) => ({
      email_normalized: row.email_normalized,
      validation_status: row.validation_status,
      validation_provider: row.validation_provider || row.detected_provider || resolvedProvider,
      validation_reason: row.validation_reason || null,
      validation_score: row.validation_score || null,
    }));

    const { data: rpcResult, error: rpcError } = await supabase
      .rpc("bulk_apply_exact_email_fallback", { p_updates: updateRecords });

    if (rpcError) {
      // Log the real error so the user can diagnose — do NOT silently swallow
      console.error("[import-cleaned] tier3 exact-email RPC error:", rpcError.message, rpcError.details, rpcError.hint, rpcError.code);
      errors.push({ row: -1, reason: `Tier 3 (exact email) RPC failed: ${rpcError.message}` });
    } else {
      viaUniqueEmail   = rpcResult?.unique_updated    ?? 0;
      ambiguousSkipped = rpcResult?.ambiguous_skipped ?? 0;
      const notFound   = rpcResult?.not_found         ?? 0;
      totalUpdated    += viaUniqueEmail;

      console.log(`[import-cleaned] tier3 exact-email: ${viaUniqueEmail} updated, ${ambiguousSkipped} ambiguous, ${notFound} not-found`);

      // Report a sample of not-found emails so the user knows what's missing
      const sampleSize = Math.min(notFound, 20);
      for (let i = 0; i < sampleSize; i++) {
        const email = byUniqueEmail[i]?.row.email_normalized;
        if (email) {
          errors.push({ row: byUniqueEmail[i].idx + 2, reason: `not_found_in_db: ${email}` });
        }
      }
      if (notFound > sampleSize) {
        errors.push({ row: -1, reason: `...and ${notFound - sampleSize} more not-found emails omitted from log` });
      }

      // Report ambiguous emails (multiple agencies matched → skipped for safety)
      if (ambiguousSkipped > 0) {
        errors.push({
          row: -1,
          reason: `${ambiguousSkipped} emails skipped: each matched multiple agency records (ambiguous — use export_job_id for exact lineage matching)`,
        });
      }
    }
  }

  const matched = viaEmailId + viaAgencyEmail + viaUniqueEmail;

  return {
    matched,
    updated: totalUpdated,
    via_email_id: viaEmailId,
    via_agency_email: viaAgencyEmail,
    via_unique_email: viaUniqueEmail,
    ambiguous_skipped: ambiguousSkipped,
    errors,
  };
}

// ─────────────────────────────────────────────────────────────────────────────
// MAIN HANDLER
// ─────────────────────────────────────────────────────────────────────────────
Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const startMs = Date.now();

  try {
    if (req.method !== "POST") {
      return new Response(
        JSON.stringify({ error: "Method not allowed" }),
        { status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return new Response(
        JSON.stringify({ error: authResult.error?.message || "Unauthorized" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing environment variables");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);
    const cleanedReq: ImportCleanedRequest = await req.json();
    const { filename, mode, data, provider, export_job_id } = cleanedReq;

    if (!filename || !mode || !data) {
      return new Response(
        JSON.stringify({ error: "Missing required fields: filename, mode, data" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    let rows: CleanedEmailRow[] = [];
    let detectedFormat = "unknown";

    if (mode === "csv") {
      const parseResult = parseCleanedCSV(data);
      rows = parseResult.rows;
      detectedFormat = parseResult.detectedFormat;
    } else if (mode === "json") {
      try {
        rows = JSON.parse(data);
        if (!Array.isArray(rows)) throw new Error("JSON must be an array");
        detectedFormat = "Standard";
      } catch (e) {
        return new Response(
          JSON.stringify({ error: `Parse error: ${e instanceof Error ? e.message : "Invalid JSON"}` }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
    }

    console.log(`[import-cleaned] Parsed ${rows.length} rows from ${filename} (format: ${detectedFormat})`);

    const resolvedProvider = provider?.trim() || "ListClean";

    // ── BUILD LINEAGE MAP (single SELECT for entire job) ───────────────────────
    let lineageMap: Map<string, LineageEntry[]> | null = null;

    if (export_job_id) {
      console.log(`[import-cleaned] Loading lineage for export_job_id: ${export_job_id}`);
      const { data: lineageRows, error: lineageError } = await supabase
        .from("other_agency_cleaning_export_rows")
        .select("id, other_agency_email_id, agency_id, email_normalized, is_dedup_anchor")
        .eq("export_job_id", export_job_id);

      if (lineageError) {
        console.error("[import-cleaned] Failed to load lineage:", lineageError);
      } else if (lineageRows && lineageRows.length > 0) {
        lineageMap = new Map();
        for (const lr of lineageRows) {
          const key = lr.email_normalized.toLowerCase();
          const entry: LineageEntry = {
            other_agency_email_id: lr.other_agency_email_id,
            agency_id: lr.agency_id,
            lineage_row_id: lr.id,
            is_dedup_anchor: lr.is_dedup_anchor !== false,
          };
          const existing = lineageMap.get(key);
          if (existing) {
            existing.push(entry);
          } else {
            lineageMap.set(key, [entry]);
          }
        }
        console.log(`[import-cleaned] Loaded lineage: ${lineageMap.size} unique emails (${lineageRows.length} total lineage rows)`);
      }
    }

    // ── APPLY UPDATES ─────────────────────────────────────────────────────────
    // With lineage: 2 DB roundtrips total (1 RPC for email updates + lineage updates combined)
    // Without lineage: 2–4 DB roundtrips total (1–3 bulk RPCs depending on tiers used)
    // Previous: up to 3,587 roundtrips for a 1793-row file

    let matched = 0;
    let updated = 0;
    let unmatched = 0;
    const invalid = 0;
    const errors: Array<{ row: number; reason: string }> = [];
    const matchMethodStats = {
      via_lineage: 0,
      via_lineage_dedup_fan_out: 0,
      via_email_id: 0,
      via_agency_email: 0,
      via_unique_email: 0,
      ambiguous_skipped: 0,
    };

    if (lineageMap) {
      // PRIMARY PATH: Use lineage matching
      const lineageResult = await applyLineageBulk(supabase, rows, lineageMap, resolvedProvider);
      matched = lineageResult.matched;
      updated = lineageResult.updated;
      matchMethodStats.via_lineage = lineageResult.via_lineage;
      matchMethodStats.via_lineage_dedup_fan_out = lineageResult.via_lineage_dedup_fan_out;

      // SAFE FALLBACK: For emails that didn't match via lineage, try direct matching
      // This prevents data loss when lineage is incomplete (e.g., partial export failure)
      if (lineageResult.unmatched_emails.length > 0) {
        console.log(`[import-cleaned] ${lineageResult.unmatched_emails.length} emails have no lineage entry — applying safe fallback matching`);

        // Build rows for fallback matching
        const fallbackRows: CleanedEmailRow[] = [];
        for (const email of lineageResult.unmatched_emails) {
          const originalRow = rows.find(r => r.email_normalized?.toLowerCase() === email.toLowerCase());
          if (originalRow) {
            fallbackRows.push(originalRow);
          }
        }

        if (fallbackRows.length > 0) {
          const fallbackResult = await applyDirectBulk(supabase, fallbackRows, resolvedProvider);

          // Add fallback results to totals
          matched += fallbackResult.matched;
          updated += fallbackResult.updated;
          matchMethodStats.via_email_id += fallbackResult.via_email_id;
          matchMethodStats.via_agency_email += fallbackResult.via_agency_email;
          matchMethodStats.via_unique_email += fallbackResult.via_unique_email;
          matchMethodStats.ambiguous_skipped += fallbackResult.ambiguous_skipped;

          console.log(`[import-cleaned] Fallback matched ${fallbackResult.matched} of ${fallbackRows.length} unmatched emails`);

          // Only report emails that failed both lineage AND fallback
          const fallbackUnmatched = fallbackRows.length - fallbackResult.matched - fallbackResult.ambiguous_skipped;
          for (let i = 0; i < fallbackUnmatched && errors.length < 100; i++) {
            const email = lineageResult.unmatched_emails[i];
            errors.push({ row: -1, reason: `No lineage entry and no direct match for: ${email}` });
          }
        }
      }

      unmatched = rows.length - matched;
    } else {
      const directResult = await applyDirectBulk(supabase, rows, resolvedProvider);
      matched = directResult.matched;
      updated = directResult.updated;
      unmatched = rows.length - matched - directResult.ambiguous_skipped;
      matchMethodStats.via_email_id = directResult.via_email_id;
      matchMethodStats.via_agency_email = directResult.via_agency_email;
      matchMethodStats.via_unique_email = directResult.via_unique_email;
      matchMethodStats.ambiguous_skipped = directResult.ambiguous_skipped;
      errors.push(...directResult.errors);
    }

    // ── UPDATE EXPORT JOB RECORD ──────────────────────────────────────────────
    if (export_job_id && matched > 0) {
      await supabase
        .from("other_agency_cleaning_exports")
        .update({
          imported_at: new Date().toISOString(),
          import_stats: {
            total_rows: rows.length,
            rows_matched: matched,
            rows_updated: updated,
            rows_unmatched: unmatched,
            rows_invalid: invalid,
            match_method_stats: matchMethodStats,
          },
        })
        .eq("id", export_job_id);
    }

    const timingMs = Date.now() - startMs;

    const result: ImportCleanedResult = {
      ok: true,
      total_rows: rows.length,
      rows_matched: matched,
      rows_updated: updated,
      rows_unmatched: unmatched,
      rows_invalid: invalid,
      detected_format: detectedFormat,
      timing_ms: timingMs,
      match_method_stats: matchMethodStats,
      errors: errors.slice(0, 100),
    };

    const flagsRefresh = await refreshEmailFlags(supabase, "import-cleaned");
    if (!flagsRefresh.ok) {
      console.error(`[import-cleaned] Flag refresh failed (non-fatal): ${flagsRefresh.error}`);
    }
    result.flags_refresh = flagsRefresh;

    console.log(`[import-cleaned] Complete in ${timingMs}ms:`, JSON.stringify({
      total_rows: result.total_rows,
      rows_matched: result.rows_matched,
      rows_updated: result.rows_updated,
      timing_ms: timingMs,
      flags_refresh_ok: flagsRefresh.ok,
    }));

    return new Response(JSON.stringify(result), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    const timingMs = Date.now() - startMs;
    console.error(`[import-cleaned] Error after ${timingMs}ms:`, error);
    const e = error as any;
    return new Response(
      JSON.stringify({
        error: typeof e?.message === "string" ? e.message : String(error),
        details: e?.details,
        hint: e?.hint,
        code: e?.code,
        timing_ms: timingMs,
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
