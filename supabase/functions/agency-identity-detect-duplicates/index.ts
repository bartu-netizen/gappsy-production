import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret",
};

interface DuplicateCluster {
  priority: number;
  identity_key: string;
  count: number;
  canonical_id: string;
  canonical_name: string;
  canonical_state: string;
  duplicate_ids: string[];
  duplicates: Array<{
    id: string;
    name: string;
    state_slug: string;
    website_url: string | null;
    phone: string | null;
    created_at: string;
  }>;
}

interface DetectionResult {
  total_agencies: number;
  total_duplicates_found: number;
  clusters: DuplicateCluster[];
  detection_summary: {
    priority_1_domain: number;
    priority_2_name_phone: number;
    priority_3_name_website: number;
    priority_4_name_phone_fallback: number;
    priority_5_name_location: number;
  };
}

function normalizeDomain(urlOrDomain: string): string | null {
  if (!urlOrDomain) return null;
  let d = urlOrDomain.trim().toLowerCase();
  d = d.replace(/^https?:\/\/(www\.)?/i, "");
  d = d.replace(/\/.*$/, "");
  d = d.replace(/\?.*$/, "");
  d = d.trim();
  if (!d || d.length < 4 || !d.includes(".")) return null;
  return d;
}

function normalizeAgencyName(name: string): string | null {
  if (!name) return null;
  let n = name.trim().toLowerCase();
  n = n.replace(/\s+/g, " ").trim();
  n = n.replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g, "");
  return n || null;
}

function normalizePhoneDigits(phoneRaw: string): string | null {
  if (!phoneRaw) return null;
  let digits = phoneRaw.replace(/\D/g, "");
  if (digits.length === 11 && digits.startsWith("1")) {
    digits = digits.slice(1);
  }
  if (digits.length < 7) return null;
  return digits || null;
}

async function validateAdmin(token: string, secret: string): Promise<boolean> {
  if (!token || !secret) return false;
  const ADMIN_SECRET = Deno.env.get("ADMIN_SECRET");
  return secret === ADMIN_SECRET;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const adminToken = req.headers.get("x-admin-token") || "";
    const adminSecret = req.headers.get("x-admin-secret") || "";

    if (!(await validateAdmin(adminToken, adminSecret))) {
      return new Response(JSON.stringify({ error: "Unauthorized" }), {
        status: 401,
        headers: corsHeaders,
      });
    }

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
    const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") as string;
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    console.log("[agency-identity] Starting duplicate detection...");

    const { data: agencies, error: agencyErr } = await supabase
      .from("other_agencies")
      .select("id, name, state_slug, website_url, phone, created_at")
      .eq("is_active", true);

    if (agencyErr || !agencies) {
      return new Response(
        JSON.stringify({ error: `Failed to fetch agencies: ${agencyErr?.message}` }),
        { status: 500, headers: corsHeaders }
      );
    }

    console.log(`[agency-identity] Fetched ${agencies.length} active agencies`);

    const clusters: DuplicateCluster[] = [];
    const summary = {
      priority_1_domain: 0,
      priority_2_name_phone: 0,
      priority_3_name_website: 0,
      priority_4_name_phone_fallback: 0,
      priority_5_name_location: 0,
    };

    // PRIORITY 1: Normalized website domain match (cross-state)
    const domainMap = new Map<string, typeof agencies>();
    for (const agency of agencies) {
      const domain = normalizeDomain(agency.website_url);
      if (domain) {
        if (!domainMap.has(domain)) {
          domainMap.set(domain, []);
        }
        domainMap.get(domain)!.push(agency);
      }
    }

    for (const [domain, agencyGroup] of domainMap) {
      if (agencyGroup.length > 1) {
        summary.priority_1_domain++;
        const canonical = agencyGroup.sort(
          (a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime()
        )[0];
        clusters.push({
          priority: 1,
          identity_key: `domain:${domain}`,
          count: agencyGroup.length,
          canonical_id: canonical.id,
          canonical_name: canonical.name,
          canonical_state: canonical.state_slug,
          duplicate_ids: agencyGroup.slice(1).map((a) => a.id),
          duplicates: agencyGroup.slice(1),
        });
      }
    }

    // PRIORITY 2: Normalized phone match (cross-state)
    const phoneMap = new Map<string, typeof agencies>();
    for (const agency of agencies) {
      const phoneDigits = normalizePhoneDigits(agency.phone);
      if (phoneDigits) {
        if (!phoneMap.has(phoneDigits)) {
          phoneMap.set(phoneDigits, []);
        }
        phoneMap.get(phoneDigits)!.push(agency);
      }
    }

    for (const [phone, agencyGroup] of phoneMap) {
      if (agencyGroup.length > 1) {
        // Check if this cluster is already covered by domain cluster
        const alreadyCovered = clusters.some(
          (c) => c.priority === 1 && c.duplicate_ids.some((id) => agencyGroup.map((a) => a.id).includes(id))
        );
        if (!alreadyCovered) {
          summary.priority_2_name_phone++;
          const canonical = agencyGroup.sort(
            (a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime()
          )[0];
          clusters.push({
            priority: 2,
            identity_key: `phone:${phone}`,
            count: agencyGroup.length,
            canonical_id: canonical.id,
            canonical_name: canonical.name,
            canonical_state: canonical.state_slug,
            duplicate_ids: agencyGroup.slice(1).map((a) => a.id),
            duplicates: agencyGroup.slice(1),
          });
        }
      }
    }

    // PRIORITY 3: Normalized name + website domain match (cross-state)
    const nameWebsiteMap = new Map<string, typeof agencies>();
    for (const agency of agencies) {
      const name = normalizeAgencyName(agency.name);
      const domain = normalizeDomain(agency.website_url);
      if (name && domain) {
        const key = `${name}|${domain}`;
        if (!nameWebsiteMap.has(key)) {
          nameWebsiteMap.set(key, []);
        }
        nameWebsiteMap.get(key)!.push(agency);
      }
    }

    for (const [key, agencyGroup] of nameWebsiteMap) {
      if (agencyGroup.length > 1) {
        const alreadyCovered = clusters.some(
          (c) => [1, 2].includes(c.priority) && c.duplicate_ids.some((id) => agencyGroup.map((a) => a.id).includes(id))
        );
        if (!alreadyCovered) {
          summary.priority_3_name_website++;
          const canonical = agencyGroup.sort(
            (a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime()
          )[0];
          clusters.push({
            priority: 3,
            identity_key: `name_website:${key}`,
            count: agencyGroup.length,
            canonical_id: canonical.id,
            canonical_name: canonical.name,
            canonical_state: canonical.state_slug,
            duplicate_ids: agencyGroup.slice(1).map((a) => a.id),
            duplicates: agencyGroup.slice(1),
          });
        }
      }
    }

    // PRIORITY 4: Normalized name + phone match (cross-state)
    const namePhoneMap = new Map<string, typeof agencies>();
    for (const agency of agencies) {
      const name = normalizeAgencyName(agency.name);
      const phoneDigits = normalizePhoneDigits(agency.phone);
      if (name && phoneDigits) {
        const key = `${name}|${phoneDigits}`;
        if (!namePhoneMap.has(key)) {
          namePhoneMap.set(key, []);
        }
        namePhoneMap.get(key)!.push(agency);
      }
    }

    for (const [key, agencyGroup] of namePhoneMap) {
      if (agencyGroup.length > 1) {
        const alreadyCovered = clusters.some(
          (c) => [1, 2, 3].includes(c.priority) && c.duplicate_ids.some((id) => agencyGroup.map((a) => a.id).includes(id))
        );
        if (!alreadyCovered) {
          summary.priority_4_name_phone_fallback++;
          const canonical = agencyGroup.sort(
            (a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime()
          )[0];
          clusters.push({
            priority: 4,
            identity_key: `name_phone:${key}`,
            count: agencyGroup.length,
            canonical_id: canonical.id,
            canonical_name: canonical.name,
            canonical_state: canonical.state_slug,
            duplicate_ids: agencyGroup.slice(1).map((a) => a.id),
            duplicates: agencyGroup.slice(1),
          });
        }
      }
    }

    // PRIORITY 5: Same state, normalized name + location match
    const stateLocationMap = new Map<string, typeof agencies>();
    for (const agency of agencies) {
      const name = normalizeAgencyName(agency.name);
      if (name) {
        const key = `${agency.state_slug}|${name}`;
        if (!stateLocationMap.has(key)) {
          stateLocationMap.set(key, []);
        }
        stateLocationMap.get(key)!.push(agency);
      }
    }

    for (const [key, agencyGroup] of stateLocationMap) {
      if (agencyGroup.length > 1) {
        const alreadyCovered = clusters.some(
          (c) =>
            [1, 2, 3, 4].includes(c.priority) && c.duplicate_ids.some((id) => agencyGroup.map((a) => a.id).includes(id))
        );
        if (!alreadyCovered) {
          summary.priority_5_name_location++;
          const canonical = agencyGroup.sort(
            (a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime()
          )[0];
          clusters.push({
            priority: 5,
            identity_key: `name_location:${key}`,
            count: agencyGroup.length,
            canonical_id: canonical.id,
            canonical_name: canonical.name,
            canonical_state: canonical.state_slug,
            duplicate_ids: agencyGroup.slice(1).map((a) => a.id),
            duplicates: agencyGroup.slice(1),
          });
        }
      }
    }

    const totalDuplicates = clusters.reduce((sum, c) => sum + c.duplicate_ids.length, 0);

    console.log(`[agency-identity] Detection complete: ${totalDuplicates} duplicates in ${clusters.length} clusters`);

    const result: DetectionResult = {
      total_agencies: agencies.length,
      total_duplicates_found: totalDuplicates,
      clusters: clusters.sort((a, b) => a.priority - b.priority),
      detection_summary: summary,
    };

    return new Response(JSON.stringify(result), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    console.error("[agency-identity] Error:", err);
    return new Response(JSON.stringify({ error: String(err) }), {
      status: 500,
      headers: corsHeaders,
    });
  }
});
