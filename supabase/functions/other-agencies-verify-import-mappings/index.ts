import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

interface VerifyRequest {
  export_job_id?: string;
  state_slug?: string;
  sample_size?: number;
}

interface MismatchRow {
  email: string;
  imported_agency_id: string;
  imported_agency_name: string;
  imported_agency_slug: string | null;
  imported_state_slug: string;
  imported_your_agency_url: string;
  lookup_agency_id: string | null;
  lookup_agency_name: string | null;
  lookup_agency_slug: string | null;
  lookup_your_agency_url: string | null;
  conflict_type:
    | "agency_id_mismatch"
    | "url_mismatch"
    | "lookup_not_found"
    | "expected_placeholder_conflict"
    | "dangerous_real_conflict";
  is_placeholder_email?: boolean;
  is_shared_conflict?: boolean;
}

interface VerifyResult {
  ok: boolean;
  sample_checked: number;
  exact_agreement_count: number;
  mismatch_count: number;
  duplicate_conflict_count: number;
  expected_placeholder_conflict_count: number;
  dangerous_real_conflict_count: number;
  no_data_count: number;
  timing_ms: number;
  export_job_id: string | null;
  state_slug: string | null;
  mismatches: MismatchRow[];
  message?: string;
}

interface LookupEntry {
  agency_id: string;
  name: string;
  slug: string | null;
  state_slug: string;
  is_placeholder_email: boolean;
  is_shared_conflict: boolean;
}

function deriveYourAgencyUrl(slug: string | null, id: string): string {
  if (slug) return `https://www.gappsy.com/your-agency/${slug}`;
  return `https://www.gappsy.com/your-agency/${id}`;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const t0 = Date.now();

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

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
    );

    const body: VerifyRequest = await req.json();
    const { export_job_id, state_slug, sample_size = 50 } = body;
    const clampedSize = Math.min(Math.max(sample_size, 1), 200);

    // ── STEP 1: Collect sample of email IDs to verify ──────────────────────
    let emailIds: string[] = [];

    if (export_job_id) {
      const { data: lineageRows, error: lineageErr } = await supabase
        .from("other_agency_cleaning_export_rows")
        .select("other_agency_email_id")
        .eq("export_job_id", export_job_id)
        .eq("is_dedup_anchor", true)
        .limit(clampedSize);

      if (lineageErr) {
        throw new Error(`Failed to fetch lineage: ${lineageErr.message}`);
      }
      emailIds = (lineageRows || []).map((r: { other_agency_email_id: string }) => r.other_agency_email_id);
    } else {
      let query = supabase
        .from("other_agency_emails")
        .select("id")
        .not("validation_checked_at", "is", null)
        .order("validation_checked_at", { ascending: false })
        .limit(clampedSize);

      if (state_slug) {
        const { data: agencyRows } = await supabase
          .from("other_agencies")
          .select("id")
          .eq("state_slug", state_slug)
          .eq("is_active", true)
          .limit(1000);

        if (agencyRows && agencyRows.length > 0) {
          const agencyIds = agencyRows.map((a: { id: string }) => a.id);
          query = query.in("agency_id", agencyIds);
        }
      }

      const { data: emailRows, error: emailErr } = await query;
      if (emailErr) {
        throw new Error(`Failed to fetch emails: ${emailErr.message}`);
      }
      emailIds = (emailRows || []).map((r: { id: string }) => r.id);
    }

    if (emailIds.length === 0) {
      return new Response(
        JSON.stringify({
          ok: true,
          sample_checked: 0,
          exact_agreement_count: 0,
          mismatch_count: 0,
          duplicate_conflict_count: 0,
          expected_placeholder_conflict_count: 0,
          dangerous_real_conflict_count: 0,
          no_data_count: 0,
          timing_ms: Date.now() - t0,
          export_job_id: export_job_id || null,
          state_slug: state_slug || null,
          mismatches: [],
          message: "No validated emails found to sample. Run an import first.",
        } satisfies VerifyResult),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // ── STEP 2: Fetch full email rows with agency join and flags ───────────
    const { data: emailDetails, error: detailErr } = await supabase
      .from("other_agency_emails")
      .select(`
        id,
        email_normalized,
        agency_id,
        is_placeholder_email,
        is_shared_conflict,
        other_agencies!inner (
          id,
          name,
          slug,
          state_slug,
          is_active
        )
      `)
      .in("id", emailIds);

    if (detailErr) {
      throw new Error(`Failed to fetch email details: ${detailErr.message}`);
    }

    const rows = emailDetails || [];

    // ── STEP 3: Build lookup index for all unique emails ────────────────────
    const uniqueEmails = [...new Set(rows.map((r: any) => r.email_normalized))];

    const { data: lookupRows, error: lookupErr } = await supabase
      .from("other_agency_emails")
      .select(`
        id,
        email_normalized,
        agency_id,
        is_placeholder_email,
        is_shared_conflict,
        other_agencies!inner (
          id,
          name,
          slug,
          state_slug,
          is_active
        )
      `)
      .in("email_normalized", uniqueEmails)
      .eq("other_agencies.is_active", true);

    if (lookupErr) {
      console.error("[verify-mappings] lookup query error:", lookupErr.message);
    }

    const lookupIndex = new Map<string, LookupEntry[]>();
    for (const lr of (lookupRows || [])) {
      const agency = lr.other_agencies as any;
      if (!agency) continue;
      const key = lr.email_normalized;
      const entry: LookupEntry = {
        agency_id: agency.id as string,
        name: agency.name as string,
        slug: agency.slug as string | null,
        state_slug: agency.state_slug as string,
        is_placeholder_email: (lr as any).is_placeholder_email ?? false,
        is_shared_conflict: (lr as any).is_shared_conflict ?? false,
      };
      const existing = lookupIndex.get(key);
      if (existing) {
        if (!existing.some((e) => e.agency_id === entry.agency_id)) {
          existing.push(entry);
        }
      } else {
        lookupIndex.set(key, [entry]);
      }
    }

    // ── STEP 4: Compare imported vs lookup ─────────────────────────────────
    let exactAgreement = 0;
    let mismatchCount = 0;
    let duplicateConflicts = 0;
    let expectedPlaceholderConflicts = 0;
    let dangerousRealConflicts = 0;
    let noDataCount = 0;
    const mismatches: MismatchRow[] = [];

    for (const row of rows) {
      const importedAgency = row.other_agencies as any;
      if (!importedAgency) {
        noDataCount++;
        continue;
      }

      const importedAgencyId = importedAgency.id as string;
      const importedAgencyName = importedAgency.name as string;
      const importedAgencySlug = importedAgency.slug as string | null;
      const importedStateSlug = importedAgency.state_slug as string;
      const importedUrl = deriveYourAgencyUrl(importedAgencySlug, importedAgencyId);
      const rowIsPlaceholder = (row as any).is_placeholder_email ?? false;
      const rowIsShared = (row as any).is_shared_conflict ?? false;

      const lookupMatches = lookupIndex.get(row.email_normalized) || [];

      if (lookupMatches.length === 0) {
        noDataCount++;
        continue;
      }

      // ── Multiple agencies share this email ───────────────────────────────
      if (lookupMatches.length > 1) {
        duplicateConflicts++;
        mismatchCount++;

        const primaryLookup = lookupMatches[0];
        const lookupUrl = deriveYourAgencyUrl(primaryLookup.slug, primaryLookup.agency_id);

        // "Expected" if the email is a known placeholder/shared junk email.
        // "Dangerous" if it looks like a real branded business email that
        // somehow ended up on multiple agency records.
        const isExpected =
          rowIsPlaceholder ||
          rowIsShared ||
          lookupMatches.every((m) => m.is_placeholder_email || m.is_shared_conflict);

        if (isExpected) {
          expectedPlaceholderConflicts++;
        } else {
          dangerousRealConflicts++;
        }

        mismatches.push({
          email: row.email_normalized,
          imported_agency_id: importedAgencyId,
          imported_agency_name: importedAgencyName,
          imported_agency_slug: importedAgencySlug,
          imported_state_slug: importedStateSlug,
          imported_your_agency_url: importedUrl,
          lookup_agency_id: primaryLookup.agency_id,
          lookup_agency_name: primaryLookup.name,
          lookup_agency_slug: primaryLookup.slug,
          lookup_your_agency_url: lookupUrl,
          conflict_type: isExpected ? "expected_placeholder_conflict" : "dangerous_real_conflict",
          is_placeholder_email: rowIsPlaceholder,
          is_shared_conflict: rowIsShared,
        });
        continue;
      }

      const lookupAgency = lookupMatches[0];
      const lookupUrl = deriveYourAgencyUrl(lookupAgency.slug, lookupAgency.agency_id);

      if (importedAgencyId !== lookupAgency.agency_id) {
        mismatchCount++;
        mismatches.push({
          email: row.email_normalized,
          imported_agency_id: importedAgencyId,
          imported_agency_name: importedAgencyName,
          imported_agency_slug: importedAgencySlug,
          imported_state_slug: importedStateSlug,
          imported_your_agency_url: importedUrl,
          lookup_agency_id: lookupAgency.agency_id,
          lookup_agency_name: lookupAgency.name,
          lookup_agency_slug: lookupAgency.slug,
          lookup_your_agency_url: lookupUrl,
          conflict_type: "agency_id_mismatch",
          is_placeholder_email: rowIsPlaceholder,
          is_shared_conflict: rowIsShared,
        });
        continue;
      }

      if (importedUrl !== lookupUrl) {
        mismatchCount++;
        mismatches.push({
          email: row.email_normalized,
          imported_agency_id: importedAgencyId,
          imported_agency_name: importedAgencyName,
          imported_agency_slug: importedAgencySlug,
          imported_state_slug: importedStateSlug,
          imported_your_agency_url: importedUrl,
          lookup_agency_id: lookupAgency.agency_id,
          lookup_agency_name: lookupAgency.name,
          lookup_agency_slug: lookupAgency.slug,
          lookup_your_agency_url: lookupUrl,
          conflict_type: "url_mismatch",
          is_placeholder_email: rowIsPlaceholder,
          is_shared_conflict: rowIsShared,
        });
        continue;
      }

      exactAgreement++;
    }

    const result: VerifyResult = {
      ok: true,
      sample_checked: rows.length,
      exact_agreement_count: exactAgreement,
      mismatch_count: mismatchCount,
      duplicate_conflict_count: duplicateConflicts,
      expected_placeholder_conflict_count: expectedPlaceholderConflicts,
      dangerous_real_conflict_count: dangerousRealConflicts,
      no_data_count: noDataCount,
      timing_ms: Date.now() - t0,
      export_job_id: export_job_id || null,
      state_slug: state_slug || null,
      mismatches: mismatches.slice(0, 50),
    };

    console.log("[verify-mappings] Complete:", {
      sample_checked: result.sample_checked,
      exact_agreement: result.exact_agreement_count,
      mismatches: result.mismatch_count,
      duplicate_conflicts: result.duplicate_conflict_count,
      expected_placeholder: result.expected_placeholder_conflict_count,
      dangerous_real: result.dangerous_real_conflict_count,
      timing_ms: result.timing_ms,
    });

    return new Response(JSON.stringify(result), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    const timingMs = Date.now() - t0;
    console.error(`[verify-mappings] Error after ${timingMs}ms:`, err);
    const e = err as any;
    return new Response(
      JSON.stringify({
        ok: false,
        error: e?.message || String(err),
        timing_ms: timingMs,
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
