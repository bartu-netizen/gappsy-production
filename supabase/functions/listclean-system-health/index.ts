import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

interface SystemHealth {
  timestamp: string;
  state_slug: string;

  email_inventory: {
    total_emails: number;
    by_validation_status: Record<string, number>;
    valid_on_active_agencies: number;
    valid_on_inactive_agencies: number;
    orphan_rate_percent: number;
  };

  agency_inventory: {
    total_agencies: number;
    active_agencies: number;
    inactive_agencies: number;
    agencies_with_valid_emails: number;
    active_agencies_with_valid_emails: number;
  };

  lineage_system: {
    total_export_jobs: number;
    total_lineage_rows: number;
    jobs_with_imports: number;
    lineage_match_rate_percent: number;
    recent_exports: Array<{
      id: string;
      filename: string;
      total_rows: number;
      status: string;
      created_at: string;
      imported_at: string | null;
    }>;
  };

  smartlead_readiness: {
    sendable_emails_active_only: number;
    sendable_emails_with_inactive: number;
    emails_with_your_agency_slug: number;
    emails_missing_slug: number;
  };

  repair_status: {
    business_domain_orphans: number;
    generic_domain_orphans: number;
    repaired_in_last_24h: number;
  };

  recommendations: string[];
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
    const stateSlug = url.searchParams.get("state") || "new-jersey";

    const health: SystemHealth = {
      timestamp: new Date().toISOString(),
      state_slug: stateSlug,
      email_inventory: {
        total_emails: 0,
        by_validation_status: {},
        valid_on_active_agencies: 0,
        valid_on_inactive_agencies: 0,
        orphan_rate_percent: 0,
      },
      agency_inventory: {
        total_agencies: 0,
        active_agencies: 0,
        inactive_agencies: 0,
        agencies_with_valid_emails: 0,
        active_agencies_with_valid_emails: 0,
      },
      lineage_system: {
        total_export_jobs: 0,
        total_lineage_rows: 0,
        jobs_with_imports: 0,
        lineage_match_rate_percent: 0,
        recent_exports: [],
      },
      smartlead_readiness: {
        sendable_emails_active_only: 0,
        sendable_emails_with_inactive: 0,
        emails_with_your_agency_slug: 0,
        emails_missing_slug: 0,
      },
      repair_status: {
        business_domain_orphans: 0,
        generic_domain_orphans: 0,
        repaired_in_last_24h: 0,
      },
      recommendations: [],
    };

    const { data: emailStats } = await supabase.rpc("get_email_stats_by_state", { p_state_slug: stateSlug });

    if (!emailStats) {
      const { data: emails } = await supabase
        .from("other_agency_emails")
        .select(`
          id,
          validation_status,
          email_domain,
          other_agencies!inner(id, state_slug, is_active, slug)
        `)
        .eq("other_agencies.state_slug", stateSlug);

      if (emails) {
        health.email_inventory.total_emails = emails.length;

        const statusCounts: Record<string, number> = {};
        let validActive = 0;
        let validInactive = 0;
        let withSlug = 0;
        let withoutSlug = 0;

        for (const e of emails) {
          const status = e.validation_status || "unknown";
          statusCounts[status] = (statusCounts[status] || 0) + 1;

          const agency = e.other_agencies as any;
          if (e.validation_status === "valid") {
            if (agency?.is_active) {
              validActive++;
            } else {
              validInactive++;
            }
          }

          if (agency?.slug) {
            withSlug++;
          } else {
            withoutSlug++;
          }
        }

        health.email_inventory.by_validation_status = statusCounts;
        health.email_inventory.valid_on_active_agencies = validActive;
        health.email_inventory.valid_on_inactive_agencies = validInactive;

        const totalValid = validActive + validInactive;
        health.email_inventory.orphan_rate_percent = totalValid > 0
          ? Math.round((validInactive / totalValid) * 100)
          : 0;

        health.smartlead_readiness.sendable_emails_active_only = validActive;
        health.smartlead_readiness.sendable_emails_with_inactive = totalValid;
        health.smartlead_readiness.emails_with_your_agency_slug = withSlug;
        health.smartlead_readiness.emails_missing_slug = withoutSlug;
      }
    }

    const { data: agencies } = await supabase
      .from("other_agencies")
      .select("id, is_active, slug")
      .eq("state_slug", stateSlug);

    if (agencies) {
      health.agency_inventory.total_agencies = agencies.length;
      health.agency_inventory.active_agencies = agencies.filter(a => a.is_active).length;
      health.agency_inventory.inactive_agencies = agencies.filter(a => !a.is_active).length;
    }

    const { data: agenciesWithValid } = await supabase
      .from("other_agencies")
      .select(`
        id,
        is_active,
        other_agency_emails!inner(id, validation_status)
      `)
      .eq("state_slug", stateSlug)
      .eq("other_agency_emails.validation_status", "valid");

    if (agenciesWithValid) {
      const uniqueIds = new Set(agenciesWithValid.map(a => a.id));
      health.agency_inventory.agencies_with_valid_emails = uniqueIds.size;
      health.agency_inventory.active_agencies_with_valid_emails =
        agenciesWithValid.filter(a => a.is_active).length;
    }

    const { data: exportJobs } = await supabase
      .from("other_agency_cleaning_exports")
      .select("id, filename, total_rows, status, created_at, imported_at")
      .eq("state_slug", stateSlug)
      .order("created_at", { ascending: false })
      .limit(10);

    if (exportJobs) {
      health.lineage_system.total_export_jobs = exportJobs.length;
      health.lineage_system.jobs_with_imports = exportJobs.filter(j => j.imported_at).length;
      health.lineage_system.recent_exports = exportJobs.slice(0, 5).map(j => ({
        id: j.id,
        filename: j.filename || "",
        total_rows: j.total_rows,
        status: j.status,
        created_at: j.created_at,
        imported_at: j.imported_at,
      }));
    }

    const { count: lineageCount } = await supabase
      .from("other_agency_cleaning_export_rows")
      .select("id", { count: "exact", head: true })
      .eq("state_slug", stateSlug);

    health.lineage_system.total_lineage_rows = lineageCount || 0;

    const { count: matchedCount } = await supabase
      .from("other_agency_cleaning_export_rows")
      .select("id", { count: "exact", head: true })
      .eq("state_slug", stateSlug)
      .eq("matched", true);

    if (lineageCount && lineageCount > 0) {
      health.lineage_system.lineage_match_rate_percent =
        Math.round(((matchedCount || 0) / lineageCount) * 100);
    }

    const genericDomains = ["gmail.com", "yahoo.com", "aol.com", "hotmail.com", "outlook.com", "mail.com", "icloud.com"];

    const { data: orphanEmails } = await supabase
      .from("other_agency_emails")
      .select(`
        id,
        email_domain,
        other_agencies!inner(id, state_slug, is_active)
      `)
      .eq("other_agencies.state_slug", stateSlug)
      .eq("other_agencies.is_active", false)
      .eq("validation_status", "valid");

    if (orphanEmails) {
      let genericOrphans = 0;
      let businessOrphans = 0;

      for (const e of orphanEmails) {
        if (genericDomains.includes(e.email_domain || "")) {
          genericOrphans++;
        } else {
          businessOrphans++;
        }
      }

      health.repair_status.generic_domain_orphans = genericOrphans;
      health.repair_status.business_domain_orphans = businessOrphans;
    }

    if (health.email_inventory.orphan_rate_percent > 50) {
      health.recommendations.push(
        `CRITICAL: ${health.email_inventory.orphan_rate_percent}% of valid emails are orphaned on inactive agencies. Run listclean-repair-orphaned-emails to fix.`
      );
    } else if (health.email_inventory.orphan_rate_percent > 10) {
      health.recommendations.push(
        `WARNING: ${health.email_inventory.orphan_rate_percent}% orphan rate. Consider running repair function.`
      );
    }

    if (health.repair_status.business_domain_orphans > 0) {
      health.recommendations.push(
        `${health.repair_status.business_domain_orphans} business-domain orphan emails can be repaired by creating agencies.`
      );
    }

    if (health.repair_status.generic_domain_orphans > 0) {
      health.recommendations.push(
        `${health.repair_status.generic_domain_orphans} generic-domain orphan emails (gmail, etc.) cannot be auto-repaired.`
      );
    }

    if (health.lineage_system.total_export_jobs === 0) {
      health.recommendations.push(
        "No ListClean exports found. Use other-agencies-export-listclean-csv with lineage tracking enabled."
      );
    }

    if (health.smartlead_readiness.emails_missing_slug > 0) {
      health.recommendations.push(
        `${health.smartlead_readiness.emails_missing_slug} emails are on agencies without /your-agency slugs.`
      );
    }

    return new Response(JSON.stringify(health, null, 2), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("[system-health] Error:", error);
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
