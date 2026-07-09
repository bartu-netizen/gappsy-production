import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin } from "../_shared/adminAuth.ts";
import { refreshEmailFlags } from "../_shared/refreshEmailFlags.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

interface RepairReport {
  state_slug: string;
  total_valid_emails: number;
  emails_on_active_agencies: number;
  emails_on_inactive_agencies: number;
  emails_relinked: number;
  emails_ambiguous: number;
  emails_no_match: number;
  bucket_agencies_found: string[];
  relink_details: Array<{
    email: string;
    from_agency: string;
    to_agency: string;
    match_method: string;
  }>;
  dry_run: boolean;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
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
    const stateSlug = url.searchParams.get("state") || "new-jersey";
    const dryRun = url.searchParams.get("dry_run") !== "false";

    console.log(`[repair-linkage] Starting repair for ${stateSlug}, dry_run=${dryRun}`);

    const { data: validEmails, error: emailError } = await supabase
      .from("other_agency_emails")
      .select(`
        id,
        email_normalized,
        agency_id,
        validation_status,
        other_agencies!inner(
          id,
          name,
          slug,
          state_slug,
          is_active,
          website
        )
      `)
      .eq("other_agencies.state_slug", stateSlug)
      .eq("validation_status", "valid");

    if (emailError) throw emailError;

    const report: RepairReport = {
      state_slug: stateSlug,
      total_valid_emails: validEmails?.length || 0,
      emails_on_active_agencies: 0,
      emails_on_inactive_agencies: 0,
      emails_relinked: 0,
      emails_ambiguous: 0,
      emails_no_match: 0,
      bucket_agencies_found: [],
      relink_details: [],
      dry_run: dryRun,
    };

    const bucketAgencyIds = new Set<string>();
    const emailsToRepair: Array<{
      emailId: string;
      email: string;
      currentAgencyId: string;
      currentAgencyName: string;
    }> = [];

    for (const row of validEmails || []) {
      const agency = row.other_agencies as any;
      if (!agency) continue;

      if (agency.is_active) {
        report.emails_on_active_agencies++;
      } else {
        report.emails_on_inactive_agencies++;
        bucketAgencyIds.add(agency.id);
        emailsToRepair.push({
          emailId: row.id,
          email: row.email_normalized,
          currentAgencyId: agency.id,
          currentAgencyName: agency.name || agency.slug || "unknown",
        });
      }
    }

    const { data: bucketAgencies } = await supabase
      .from("other_agencies")
      .select("id, name, slug")
      .in("id", Array.from(bucketAgencyIds));

    report.bucket_agencies_found = (bucketAgencies || []).map(
      (a) => `${a.name || a.slug} (${a.id.slice(0, 8)})`
    );

    console.log(`[repair-linkage] Found ${emailsToRepair.length} emails on inactive agencies`);
    console.log(`[repair-linkage] Bucket agencies: ${report.bucket_agencies_found.join(", ")}`);

    const { data: activeAgencies, error: activeError } = await supabase
      .from("other_agencies")
      .select(`
        id,
        name,
        slug,
        website,
        other_agency_emails(
          email_normalized
        )
      `)
      .eq("state_slug", stateSlug)
      .eq("is_active", true);

    if (activeError) throw activeError;

    const emailToActiveAgency = new Map<string, { agencyId: string; agencyName: string; matchMethod: string }[]>();

    for (const agency of activeAgencies || []) {
      const agencyEmails = agency.other_agency_emails as any[];
      if (!agencyEmails) continue;

      for (const emailRow of agencyEmails) {
        const email = emailRow.email_normalized?.toLowerCase();
        if (!email) continue;

        if (!emailToActiveAgency.has(email)) {
          emailToActiveAgency.set(email, []);
        }
        emailToActiveAgency.get(email)!.push({
          agencyId: agency.id,
          agencyName: agency.name || agency.slug || "unknown",
          matchMethod: "exact_email_on_active_agency",
        });
      }

      if (agency.website) {
        try {
          const domain = new URL(agency.website).hostname.replace(/^www\./, "").toLowerCase();
          const domainKey = `@${domain}`;

          if (!emailToActiveAgency.has(domainKey)) {
            emailToActiveAgency.set(domainKey, []);
          }
          emailToActiveAgency.get(domainKey)!.push({
            agencyId: agency.id,
            agencyName: agency.name || agency.slug || "unknown",
            matchMethod: "domain_match",
          });
        } catch {
        }
      }
    }

    for (const repair of emailsToRepair) {
      const email = repair.email.toLowerCase();
      const emailDomain = email.includes("@") ? `@${email.split("@")[1]}` : null;

      let candidates = emailToActiveAgency.get(email) || [];

      if (candidates.length === 0 && emailDomain) {
        candidates = emailToActiveAgency.get(emailDomain) || [];
      }

      if (candidates.length === 0) {
        report.emails_no_match++;
        continue;
      }

      if (candidates.length > 1) {
        report.emails_ambiguous++;
        report.relink_details.push({
          email: repair.email,
          from_agency: repair.currentAgencyName,
          to_agency: `AMBIGUOUS: ${candidates.map(c => c.agencyName).join(", ")}`,
          match_method: "ambiguous",
        });
        continue;
      }

      const target = candidates[0];

      if (!dryRun) {
        const { error: updateError } = await supabase
          .from("other_agency_emails")
          .update({ agency_id: target.agencyId })
          .eq("id", repair.emailId);

        if (updateError) {
          console.error(`[repair-linkage] Failed to update ${repair.emailId}:`, updateError);
          continue;
        }
      }

      report.emails_relinked++;
      report.relink_details.push({
        email: repair.email,
        from_agency: repair.currentAgencyName,
        to_agency: target.agencyName,
        match_method: target.matchMethod,
      });
    }

    console.log(`[repair-linkage] Repair complete:`, {
      relinked: report.emails_relinked,
      ambiguous: report.emails_ambiguous,
      no_match: report.emails_no_match,
      dry_run: dryRun,
    });

    let flagsRefresh = undefined;
    if (!dryRun && report.emails_relinked > 0) {
      flagsRefresh = await refreshEmailFlags(supabase, "repair-linkage");
      if (!flagsRefresh.ok) {
        console.error(`[repair-linkage] Flag refresh failed (non-fatal): ${flagsRefresh.error}`);
      }
    }

    return new Response(JSON.stringify({ ...report, flags_refresh: flagsRefresh }, null, 2), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("[repair-linkage] Error:", error);
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
