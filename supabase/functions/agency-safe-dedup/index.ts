import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { refreshEmailFlags } from "../_shared/refreshEmailFlags.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret, Apikey",
};

function normalizeDomain(urlOrDomain: string): string | null {
  if (!urlOrDomain) return null;
  let d = urlOrDomain.trim().toLowerCase();
  d = d.replace(/^https?:\/\/(www\.)?/i, "");
  d = d.replace(/\/.*$/, "").replace(/\?.*$/, "").trim();
  if (!d || d.length < 4 || !d.includes(".")) return null;
  return d;
}

function normalizeAgencyName(name: string): string | null {
  if (!name) return null;
  let n = name.trim().toLowerCase().replace(/\s+/g, " ").trim();
  n = n.replace(/[.,/#!$%^&*;:{}=\-_`~()]/g, "");
  return n || null;
}

function normalizePhoneDigits(phoneRaw: string): string | null {
  if (!phoneRaw) return null;
  let digits = phoneRaw.replace(/\D/g, "");
  if (digits.length === 11 && digits.startsWith("1")) digits = digits.slice(1);
  if (digits.length < 7) return null;
  return digits || null;
}

async function validateAdmin(token: string, secret: string): Promise<boolean> {
  if (!token || !secret) return false;
  return secret === Deno.env.get("ADMIN_SECRET");
}

interface Agency {
  id: string;
  name: string;
  state_slug: string;
  website_url: string | null;
  website_domain_normalized: string | null;
  phone: string | null;
  created_at: string;
  slug: string | null;
}

interface DuplicateCluster {
  priority: number;
  priority_label: string;
  identity_key: string;
  count: number;
  canonical_id: string;
  canonical_name: string;
  canonical_slug: string | null;
  canonical_state: string;
  canonical_website: string | null;
  canonical_domain: string | null;
  duplicate_ids: string[];
  duplicates: Array<{
    id: string;
    name: string;
    state_slug: string;
    website_url: string | null;
    phone: string | null;
    created_at: string;
    slug: string | null;
  }>;
}

const PRIORITY_LABELS: Record<number, string> = {
  1: "Domain match",
  2: "Phone match",
  3: "Name + website",
  4: "Name + phone",
  5: "Name in state",
};

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
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
    const SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") as string;
    const supabase = createClient(SUPABASE_URL, SERVICE_KEY);

    const body = await req.json().catch(() => ({}));
    const action: string = body.action ?? "detect";

    // ── ACTION: detect ───────────────────────────────────────────────────────
    if (action === "detect") {
      const { data: agencies, error: agencyErr } = await supabase
        .from("other_agencies")
        .select("id, name, state_slug, website_url, website_domain_normalized, phone, created_at, slug")
        .eq("is_active", true);

      if (agencyErr || !agencies) {
        return new Response(
          JSON.stringify({ error: `Failed to fetch agencies: ${agencyErr?.message}` }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const typedAgencies = agencies as Agency[];
      const clusters: DuplicateCluster[] = [];
      const seenAgencyIds = new Set<string>();
      const summary = { priority_1_domain: 0, priority_2_phone: 0, priority_3_name_website: 0, priority_4_name_phone: 0, priority_5_name_state: 0 };

      const buildCluster = (priority: number, key: string, group: Agency[]): DuplicateCluster => {
        const sorted = [...group].sort((a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime());
        const canonical = sorted[0];
        const dups = sorted.slice(1);
        dups.forEach(d => seenAgencyIds.add(d.id));
        return {
          priority,
          priority_label: PRIORITY_LABELS[priority],
          identity_key: key,
          count: group.length,
          canonical_id: canonical.id,
          canonical_name: canonical.name,
          canonical_slug: canonical.slug,
          canonical_state: canonical.state_slug,
          canonical_website: canonical.website_url,
          canonical_domain: canonical.website_domain_normalized ?? normalizeDomain(canonical.website_url ?? ""),
          duplicate_ids: dups.map(d => d.id),
          duplicates: dups.map(d => ({ id: d.id, name: d.name, state_slug: d.state_slug, website_url: d.website_url, phone: d.phone, created_at: d.created_at, slug: d.slug })),
        };
      };

      const isAlreadyCovered = (group: Agency[]) =>
        group.some(a => seenAgencyIds.has(a.id));

      // Priority 1: Domain
      const domainMap = new Map<string, Agency[]>();
      for (const a of typedAgencies) {
        const d = a.website_domain_normalized || normalizeDomain(a.website_url ?? "");
        if (d) { if (!domainMap.has(d)) domainMap.set(d, []); domainMap.get(d)!.push(a); }
      }
      for (const [domain, group] of domainMap) {
        if (group.length > 1) {
          summary.priority_1_domain++;
          clusters.push(buildCluster(1, `domain:${domain}`, group));
        }
      }

      // Priority 2: Phone
      const phoneMap = new Map<string, Agency[]>();
      for (const a of typedAgencies) {
        const p = normalizePhoneDigits(a.phone ?? "");
        if (p) { if (!phoneMap.has(p)) phoneMap.set(p, []); phoneMap.get(p)!.push(a); }
      }
      for (const [phone, group] of phoneMap) {
        if (group.length > 1 && !isAlreadyCovered(group)) {
          summary.priority_2_phone++;
          clusters.push(buildCluster(2, `phone:${phone}`, group));
        }
      }

      // Priority 3: Name + website
      const nameWebMap = new Map<string, Agency[]>();
      for (const a of typedAgencies) {
        const n = normalizeAgencyName(a.name);
        const d = a.website_domain_normalized || normalizeDomain(a.website_url ?? "");
        if (n && d) { const k = `${n}|${d}`; if (!nameWebMap.has(k)) nameWebMap.set(k, []); nameWebMap.get(k)!.push(a); }
      }
      for (const [key, group] of nameWebMap) {
        if (group.length > 1 && !isAlreadyCovered(group)) {
          summary.priority_3_name_website++;
          clusters.push(buildCluster(3, `name_website:${key}`, group));
        }
      }

      // Priority 4: Name + phone
      const namePhoneMap = new Map<string, Agency[]>();
      for (const a of typedAgencies) {
        const n = normalizeAgencyName(a.name);
        const p = normalizePhoneDigits(a.phone ?? "");
        if (n && p) { const k = `${n}|${p}`; if (!namePhoneMap.has(k)) namePhoneMap.set(k, []); namePhoneMap.get(k)!.push(a); }
      }
      for (const [key, group] of namePhoneMap) {
        if (group.length > 1 && !isAlreadyCovered(group)) {
          summary.priority_4_name_phone++;
          clusters.push(buildCluster(4, `name_phone:${key}`, group));
        }
      }

      // Priority 5: Name in same state
      const nameStateMap = new Map<string, Agency[]>();
      for (const a of typedAgencies) {
        const n = normalizeAgencyName(a.name);
        if (n) { const k = `${a.state_slug}|${n}`; if (!nameStateMap.has(k)) nameStateMap.set(k, []); nameStateMap.get(k)!.push(a); }
      }
      for (const [key, group] of nameStateMap) {
        if (group.length > 1 && !isAlreadyCovered(group)) {
          summary.priority_5_name_state++;
          clusters.push(buildCluster(5, `name_state:${key}`, group));
        }
      }

      const totalDuplicates = clusters.reduce((s, c) => s + c.duplicate_ids.length, 0);

      return new Response(JSON.stringify({
        total_agencies: typedAgencies.length,
        total_duplicates_found: totalDuplicates,
        total_clusters: clusters.length,
        clusters: clusters.sort((a, b) => a.priority - b.priority),
        detection_summary: summary,
      }), { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } });
    }

    // ── ACTION: preview ──────────────────────────────────────────────────────
    if (action === "preview") {
      const { canonical_id, duplicate_ids, detection_priority = 5 } = body;
      if (!canonical_id || !Array.isArray(duplicate_ids) || duplicate_ids.length === 0) {
        return new Response(
          JSON.stringify({ error: "canonical_id and duplicate_ids[] required" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const { data, error } = await supabase.rpc("preview_safe_agency_merge", {
        p_canonical_agency_id:  canonical_id,
        p_duplicate_agency_ids: duplicate_ids,
        p_detection_priority:   detection_priority,
      });

      if (error) {
        return new Response(
          JSON.stringify({ error: error.message }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      return new Response(JSON.stringify(data), {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // ── ACTION: merge ────────────────────────────────────────────────────────
    if (action === "merge") {
      const { canonical_id, duplicate_ids, detection_priority = 5, dry_run = true } = body;
      if (!canonical_id || !Array.isArray(duplicate_ids) || duplicate_ids.length === 0) {
        return new Response(
          JSON.stringify({ error: "canonical_id and duplicate_ids[] required" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const { data, error } = await supabase.rpc("safe_merge_duplicate_agencies", {
        p_canonical_agency_id:  canonical_id,
        p_duplicate_agency_ids: duplicate_ids,
        p_detection_priority:   detection_priority,
        p_dry_run:              dry_run,
      });

      if (error) {
        return new Response(
          JSON.stringify({ error: error.message }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      let flagsRefresh = undefined;
      if (!dry_run) {
        flagsRefresh = await refreshEmailFlags(supabase, "agency-safe-dedup-merge");
        if (!flagsRefresh.ok) {
          console.error(`[agency-safe-dedup] Flag refresh failed (non-fatal): ${flagsRefresh.error}`);
        }
      }

      return new Response(JSON.stringify({ ...data, flags_refresh: flagsRefresh }), {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // ── ACTION: refresh-flags ────────────────────────────────────────────────
    // Recomputes is_shared_conflict and all exclude flags across all email rows.
    // Call this after any bulk import or dedup merge to keep flags in sync.
    if (action === "refresh-flags") {
      const { data, error } = await supabase.rpc("refresh_shared_email_conflicts");

      if (error) {
        return new Response(
          JSON.stringify({ error: error.message }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      return new Response(JSON.stringify({ ok: true, ...data }), {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    return new Response(
      JSON.stringify({ error: `Unknown action: ${action}. Use detect | preview | merge | refresh-flags` }),
      { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );

  } catch (err) {
    console.error("[agency-safe-dedup] Error:", err);
    return new Response(
      JSON.stringify({ error: String(err) }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
