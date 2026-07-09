import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";
import { refreshEmailFlags } from "../_shared/refreshEmailFlags.ts";

interface RepairStats {
  state_slug: string;
  dry_run: boolean;
  total_valid_orphans: number;
  generic_domain_skipped: number;
  franchise_domain_skipped: number;
  business_domain_repairable: number;
  agencies_created: number;
  emails_relinked: number;
  emails_failed: number;
  repair_details: Array<{
    email_domain: string;
    email_count: number;
    agency_name: string;
    agency_slug: string;
    agency_id: string;
    action: "created" | "existing" | "skipped";
  }>;
  unrepaired_emails: Array<{
    email: string;
    reason: string;
  }>;
}

const GENERIC_DOMAINS = new Set([
  "gmail.com", "yahoo.com", "aol.com", "hotmail.com", "outlook.com",
  "mail.com", "icloud.com", "protonmail.com", "live.com", "msn.com",
  "comcast.net", "verizon.net", "att.net", "sbcglobal.net"
]);

const FRANCHISE_DOMAINS = new Set([
  "kw.com", "remax.net", "coldwellbanker.com", "century21.com",
  "sothebysrealty.com", "bhhs.com"
]);

function domainToAgencyName(domain: string): string {
  const base = domain.split(".")[0];
  const words = base
    .replace(/([a-z])([A-Z])/g, "$1 $2")
    .replace(/[_-]/g, " ")
    .split(" ")
    .map(w => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase());
  return words.join(" ");
}

function domainToSlug(domain: string, stateSlug: string): string {
  const base = domain.split(".")[0];
  const slug = base.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
  return `${slug}-${stateSlug}`;
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
    const dryRun = url.searchParams.get("dry_run") !== "false";
    const limitDomains = parseInt(url.searchParams.get("limit") || "0") || 0;

    console.log(`[repair-orphans] Starting repair for ${stateSlug}, dry_run=${dryRun}, limit=${limitDomains}`);

    const stats: RepairStats = {
      state_slug: stateSlug,
      dry_run: dryRun,
      total_valid_orphans: 0,
      generic_domain_skipped: 0,
      franchise_domain_skipped: 0,
      business_domain_repairable: 0,
      agencies_created: 0,
      emails_relinked: 0,
      emails_failed: 0,
      repair_details: [],
      unrepaired_emails: [],
    };

    const { data: orphanEmails, error: orphanError } = await supabase
      .from("other_agency_emails")
      .select(`
        id,
        email_normalized,
        email_domain,
        validation_status,
        validation_provider,
        validation_checked_at,
        agency_id,
        other_agencies!inner(
          id,
          name,
          state_slug,
          is_active
        )
      `)
      .eq("other_agencies.state_slug", stateSlug)
      .eq("other_agencies.is_active", false)
      .eq("validation_status", "valid");

    if (orphanError) throw orphanError;

    stats.total_valid_orphans = orphanEmails?.length || 0;
    console.log(`[repair-orphans] Found ${stats.total_valid_orphans} valid orphan emails`);

    const domainGroups = new Map<string, Array<{
      id: string;
      email_normalized: string;
      email_domain: string;
    }>>();

    for (const email of orphanEmails || []) {
      const domain = email.email_domain?.toLowerCase();
      if (!domain) {
        stats.unrepaired_emails.push({
          email: email.email_normalized,
          reason: "no_domain"
        });
        continue;
      }

      if (GENERIC_DOMAINS.has(domain)) {
        stats.generic_domain_skipped++;
        stats.unrepaired_emails.push({
          email: email.email_normalized,
          reason: "generic_domain"
        });
        continue;
      }

      if (FRANCHISE_DOMAINS.has(domain)) {
        stats.franchise_domain_skipped++;
        stats.unrepaired_emails.push({
          email: email.email_normalized,
          reason: "franchise_domain"
        });
        continue;
      }

      if (!domainGroups.has(domain)) {
        domainGroups.set(domain, []);
      }
      domainGroups.get(domain)!.push({
        id: email.id,
        email_normalized: email.email_normalized,
        email_domain: domain,
      });
    }

    stats.business_domain_repairable = Array.from(domainGroups.values())
      .reduce((sum, arr) => sum + arr.length, 0);

    console.log(`[repair-orphans] ${domainGroups.size} unique domains, ${stats.business_domain_repairable} emails to repair`);

    let domainsProcessed = 0;
    for (const [domain, emails] of domainGroups) {
      if (limitDomains > 0 && domainsProcessed >= limitDomains) break;
      domainsProcessed++;

      const agencyName = domainToAgencyName(domain);
      const agencySlug = domainToSlug(domain, stateSlug);

      const { data: existingAgency } = await supabase
        .from("other_agencies")
        .select("id, name, slug, is_active")
        .eq("state_slug", stateSlug)
        .eq("slug", agencySlug)
        .maybeSingle();

      let targetAgencyId: string;
      let action: "created" | "existing" | "skipped" = "skipped";

      if (existingAgency) {
        targetAgencyId = existingAgency.id;
        action = "existing";

        if (!existingAgency.is_active && !dryRun) {
          await supabase
            .from("other_agencies")
            .update({ is_active: true })
            .eq("id", existingAgency.id);
        }
      } else {
        if (dryRun) {
          targetAgencyId = "dry-run-would-create";
          action = "created";
        } else {
          const { data: newAgency, error: createError } = await supabase
            .from("other_agencies")
            .insert({
              name: agencyName,
              slug: agencySlug,
              state_slug: stateSlug,
              state_name: stateSlug.split("-").map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(" "),
              website_url: `https://${domain}`,
              website_domain_normalized: domain,
              is_active: true,
              source: "repair_from_orphan_emails",
              import_source: "listclean_repair",
            })
            .select("id")
            .single();

          if (createError) {
            console.error(`[repair-orphans] Failed to create agency for ${domain}:`, createError);
            for (const email of emails) {
              stats.emails_failed++;
              stats.unrepaired_emails.push({
                email: email.email_normalized,
                reason: `agency_creation_failed: ${createError.message}`
              });
            }
            continue;
          }

          targetAgencyId = newAgency.id;
          action = "created";
          stats.agencies_created++;
        }
      }

      stats.repair_details.push({
        email_domain: domain,
        email_count: emails.length,
        agency_name: agencyName,
        agency_slug: agencySlug,
        agency_id: targetAgencyId,
        action,
      });

      if (!dryRun && targetAgencyId !== "dry-run-would-create") {
        for (const email of emails) {
          const { error: relinkError } = await supabase
            .from("other_agency_emails")
            .update({ agency_id: targetAgencyId })
            .eq("id", email.id);

          if (relinkError) {
            stats.emails_failed++;
            stats.unrepaired_emails.push({
              email: email.email_normalized,
              reason: `relink_failed: ${relinkError.message}`
            });
          } else {
            stats.emails_relinked++;
          }
        }
      } else if (dryRun) {
        stats.emails_relinked += emails.length;
      }
    }

    console.log(`[repair-orphans] Complete:`, {
      agencies_created: stats.agencies_created,
      emails_relinked: stats.emails_relinked,
      emails_failed: stats.emails_failed,
      dry_run: dryRun,
    });

    let flagsRefresh = undefined;
    if (!dryRun && (stats.agencies_created > 0 || stats.emails_relinked > 0)) {
      flagsRefresh = await refreshEmailFlags(supabase, "repair-orphans");
      if (!flagsRefresh.ok) {
        console.error(`[repair-orphans] Flag refresh failed (non-fatal): ${flagsRefresh.error}`);
      }
    }

    return new Response(JSON.stringify({ ...stats, flags_refresh: flagsRefresh }, null, 2), {
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("[repair-orphans] Error:", error);
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Unknown error",
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
