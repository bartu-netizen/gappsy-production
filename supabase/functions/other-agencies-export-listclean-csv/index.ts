import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret",
  "Access-Control-Expose-Headers": "X-Export-Job-Id, X-Export-Stats, Content-Disposition",
};

interface EmailWithAgency {
  id: string;
  email_normalized: string;
  validation_status: string;
  agency_id: string;
  agency_slug: string | null;
  state_slug: string;
}

interface ExportStats {
  state: string;
  validation_status_filter: string;
  active_agencies_only: boolean;
  raw_rows_fetched: number;
  unique_emails_exported: number;
  duplicate_rows_skipped: number;
  duplicates_excluded: boolean;
  export_job_id: string;
}

function cleanEmail(email: string): string {
  return email.trim().toLowerCase();
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    if (req.method !== "GET") {
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

    const url = new URL(req.url);
    const stateSlug = url.searchParams.get("state");
    const skipLineage = url.searchParams.get("skip_lineage") === "true";
    const validationStatus = url.searchParams.get("validation_status") || "all";

    if (!stateSlug) {
      return new Response(
        JSON.stringify({ error: "state parameter is required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    console.log(`[listclean-csv] Starting export for state: ${stateSlug}, status_filter: ${validationStatus}, skip_lineage: ${skipLineage}`);

    const allEmails: EmailWithAgency[] = [];
    const PAGE_SIZE = 500;
    let offset = 0;
    let hasMore = true;

    while (hasMore) {
      let query = supabase
        .from("other_agency_emails")
        .select(`
          id,
          email_normalized,
          validation_status,
          agency_id,
          other_agencies!inner(
            id,
            slug,
            state_slug,
            is_active
          )
        `)
        .eq("other_agencies.state_slug", stateSlug)
        .eq("other_agencies.is_active", true)
        .eq("exclude_from_outreach", false)
        .range(offset, offset + PAGE_SIZE - 1);

      if (validationStatus !== "all") {
        query = query.eq("validation_status", validationStatus);
      }

      const { data: emailRows, error: emailError } = await query;

      if (emailError) {
        throw emailError;
      }

      if (!emailRows || emailRows.length === 0) {
        hasMore = false;
        break;
      }

      for (const row of emailRows) {
        const agency = row.other_agencies as any;
        if (!agency) continue;

        const email = row.email_normalized || "";
        const normalized = cleanEmail(email);

        if (!normalized || !normalized.includes("@")) continue;

        allEmails.push({
          id: row.id,
          email_normalized: normalized,
          validation_status: row.validation_status || "pending",
          agency_id: row.agency_id,
          agency_slug: agency.slug || null,
          state_slug: agency.state_slug,
        });
      }

      if (emailRows.length < PAGE_SIZE) {
        hasMore = false;
      } else {
        offset += PAGE_SIZE;
      }
    }

    console.log(`[listclean-csv] Fetched ${allEmails.length} raw rows from DB`);

    // ── DEDUPLICATION ─────────────────────────────────────────────────────────
    // Build a map from normalized email → all source rows with that email.
    // The first row encountered for each email becomes the "anchor" (exported to CSV).
    // All additional rows for the same email are "non-anchor" duplicates — they are
    // tracked in lineage but NOT included in the CSV sent to ListClean.
    //
    // Dedupe rule:
    //   1. trim whitespace (already done by cleanEmail above)
    //   2. lowercase (already done by cleanEmail above)
    //   3. exact string match — no domain or agency collapsing
    //
    const emailToSourceRows = new Map<string, EmailWithAgency[]>();
    for (const e of allEmails) {
      const existing = emailToSourceRows.get(e.email_normalized);
      if (existing) {
        existing.push(e);
      } else {
        emailToSourceRows.set(e.email_normalized, [e]);
      }
    }

    // anchorEmails: exactly one entry per unique email — what goes in the CSV
    const anchorEmails: EmailWithAgency[] = [];
    // duplicateCount: total non-anchor rows that were skipped from CSV
    let duplicateCount = 0;

    for (const [, rows] of emailToSourceRows) {
      anchorEmails.push(rows[0]);
      duplicateCount += rows.length - 1;
    }

    console.log(`[listclean-csv] After dedup: ${anchorEmails.length} unique emails, ${duplicateCount} duplicate rows skipped`);
    // ─────────────────────────────────────────────────────────────────────────

    const dateStr = new Date().toISOString().split("T")[0];
    let exportJobId = "";
    let filename = `listclean-export-${stateSlug}-${dateStr}.csv`;

    if (!skipLineage && allEmails.length > 0) {
      const { data: exportJob, error: exportJobError } = await supabase
        .from("other_agency_cleaning_exports")
        .insert({
          state_slug: stateSlug,
          filename: filename,
          source: "listclean",
          total_rows: allEmails.length,
          unique_emails_exported: anchorEmails.length,
          duplicate_rows_skipped: duplicateCount,
          status: "completed",
          created_by: "admin",
          notes: `Exported ${anchorEmails.length} unique emails (${duplicateCount} duplicates skipped) for ListClean verification (filter: ${validationStatus})`,
        })
        .select("id")
        .single();

      if (exportJobError) {
        console.error("[listclean-csv] Failed to create export job:", exportJobError);
      } else if (exportJob) {
        exportJobId = exportJob.id;
        filename = `listclean-export-${stateSlug}-${exportJobId.slice(0, 8)}.csv`;

        await supabase
          .from("other_agency_cleaning_exports")
          .update({ filename })
          .eq("id", exportJobId);

        // Insert lineage rows for ALL source rows (anchors + non-anchors).
        // Anchor rows get is_dedup_anchor=true and dedup_anchor_id=null.
        // Non-anchor rows get is_dedup_anchor=false and dedup_anchor_id pointing to
        // the anchor row's lineage id (set in a second pass after anchor insert).
        //
        // We insert anchors first so we can get their lineage IDs, then insert
        // non-anchors with dedup_anchor_id set.

        const now = new Date().toISOString();

        // Build anchor lineage rows
        const anchorLineageRows = anchorEmails.map((e) => ({
          export_job_id: exportJobId,
          other_agency_email_id: e.id,
          agency_id: e.agency_id,
          agency_slug: e.agency_slug,
          state_slug: e.state_slug,
          email_normalized: e.email_normalized,
          exported_at: now,
          matched: false,
          is_dedup_anchor: true,
          dedup_anchor_id: null,
        }));

        // Insert anchor rows in batches, collecting their IDs
        const batchSize = 500;
        const anchorIdMap = new Map<string, string>(); // email_normalized → lineage row id

        for (let i = 0; i < anchorLineageRows.length; i += batchSize) {
          const batch = anchorLineageRows.slice(i, i + batchSize);
          const { data: inserted, error: lineageError } = await supabase
            .from("other_agency_cleaning_export_rows")
            .insert(batch)
            .select("id, email_normalized");

          if (lineageError) {
            console.error(`[listclean-csv] FATAL: Failed to insert anchor lineage batch:`, lineageError);
            throw new Error(`Export aborted: anchor lineage insert failed — ${lineageError.message}. Lineage must be complete to prevent data loss on import.`);
          }

          if (!inserted || inserted.length === 0) {
            throw new Error(`Export aborted: anchor lineage insert returned no rows. Expected ${batch.length} rows.`);
          }

          for (const row of inserted) {
            anchorIdMap.set(row.email_normalized, row.id);
          }
        }

        // Build non-anchor lineage rows (duplicates) with dedup_anchor_id set
        const nonAnchorLineageRows: object[] = [];
        for (const [email, rows] of emailToSourceRows) {
          if (rows.length <= 1) continue;
          const anchorLineageId = anchorIdMap.get(email);
          if (!anchorLineageId) continue;

          // Skip first row (anchor), insert the rest as non-anchors
          for (let r = 1; r < rows.length; r++) {
            const e = rows[r];
            nonAnchorLineageRows.push({
              export_job_id: exportJobId,
              other_agency_email_id: e.id,
              agency_id: e.agency_id,
              agency_slug: e.agency_slug,
              state_slug: e.state_slug,
              email_normalized: e.email_normalized,
              exported_at: now,
              matched: false,
              is_dedup_anchor: false,
              dedup_anchor_id: anchorLineageId,
            });
          }
        }

        for (let i = 0; i < nonAnchorLineageRows.length; i += batchSize) {
          const batch = nonAnchorLineageRows.slice(i, i + batchSize);
          const { error: lineageError } = await supabase
            .from("other_agency_cleaning_export_rows")
            .insert(batch);

          if (lineageError) {
            console.error(`[listclean-csv] FATAL: Failed to insert non-anchor lineage batch:`, lineageError);
            throw new Error(`Export aborted: non-anchor lineage insert failed — ${lineageError.message}. Lineage must be complete to prevent data loss on import.`);
          }
        }

        console.log(`[listclean-csv] Inserted lineage: ${anchorLineageRows.length} anchor rows + ${nonAnchorLineageRows.length} non-anchor rows`);

        // ── INTEGRITY CHECK: Verify lineage is complete ───────────────────────────
        const { count: lineageCount, error: countError } = await supabase
          .from("other_agency_cleaning_export_rows")
          .select("id", { count: "exact", head: true })
          .eq("export_job_id", exportJobId)
          .eq("is_dedup_anchor", true);

        if (countError) {
          console.error(`[listclean-csv] FATAL: Failed to verify lineage integrity:`, countError);
          throw new Error(`Export aborted: lineage integrity check failed — ${countError.message}`);
        }

        const expectedAnchorCount = anchorLineageRows.length;
        if (lineageCount !== expectedAnchorCount) {
          console.error(`[listclean-csv] FATAL: Lineage integrity check failed. Expected ${expectedAnchorCount} anchor rows, found ${lineageCount} in database.`);
          throw new Error(`Export aborted: lineage incomplete. Expected ${expectedAnchorCount} anchor rows, found ${lineageCount}. This would cause data loss on import.`);
        }

        console.log(`[listclean-csv] ✅ Lineage integrity verified: ${lineageCount} anchor rows match ${expectedAnchorCount} exported emails`);
      }
    }

    // CSV contains unique anchor emails WITH stable identifiers for roundtrip preservation
    // Format: email,email_normalized,email_id,agency_id,export_job_id
    // This allows import to match via email_id (strongest) or agency_id + email fallback
    const csvRows = anchorEmails.map((r) => {
      return [
        r.email_normalized,              // email (required by ListClean)
        r.email_normalized,              // email_normalized (for clarity)
        r.id,                            // email_id (strongest match key)
        r.agency_id,                     // agency_id (second-tier match key)
        exportJobId || ""                // export_job_id (lineage match key)
      ].join(",");
    });

    const csvContent = ["email,email_normalized,email_id,agency_id,export_job_id", ...csvRows].join("\n");

    const stats: ExportStats = {
      state: stateSlug,
      validation_status_filter: validationStatus,
      active_agencies_only: true,
      raw_rows_fetched: allEmails.length,
      unique_emails_exported: anchorEmails.length,
      duplicate_rows_skipped: duplicateCount,
      duplicates_excluded: true,
      export_job_id: exportJobId,
    };

    console.log(`[listclean-csv] Export complete:`, stats);

    return new Response(csvContent, {
      status: 200,
      headers: {
        ...corsHeaders,
        "Content-Type": "text/csv; charset=utf-8",
        "Content-Disposition": `attachment; filename="${filename}"`,
        "X-Export-Stats": JSON.stringify(stats),
        "X-Export-Job-Id": exportJobId,
      },
    });
  } catch (err) {
    console.error("[listclean-csv] Error:", err);
    const e = err as any;
    return new Response(
      JSON.stringify({
        error: typeof e?.message === "string" ? e.message : String(err),
        details: e?.details,
        hint: e?.hint,
        code: e?.code,
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
