import type { SupabaseClient } from "npm:@supabase/supabase-js@2";
import { normalizeAgencyNameStrict, normalizeEmail } from "./normalizeHelpers.ts";

export interface PaidAgencyRecord {
  agency_id: string | null;
  agency_name: string | null;
  agency_name_canonical: string | null;
  agency_name_preserved: string | null;
  state_slug: string | null;
  listing_type: string;
  top25_rank: number | null;
  paid_at: string | null;
  source: "agency_listings" | "paid_override" | "is_paid_listing" | "top25_slots" | "spotlight_placements" | "stripe_orders";
}

interface OtherAgencyMin {
  id: string;
  name: string | null;
  state_slug: string | null;
  is_paid_listing: boolean | null;
  paid_listing_type: string | null;
  paid_listing_rank: number | null;
  paid_override_active: boolean | null;
  paid_override_value: boolean | null;
  paid_override_updated_at: string | null;
  updated_at?: string | null;
  created_at?: string | null;
}

async function fetchAll<T>(
  supabase: SupabaseClient,
  builder: (from: number, to: number) => Promise<{ data: T[] | null; error: { message: string } | null }>,
  chunk = 1000,
): Promise<T[]> {
  const out: T[] = [];
  let page = 0;
  while (true) {
    const from = page * chunk;
    const to = from + chunk - 1;
    const { data, error } = await builder(from, to);
    if (error) throw new Error(error.message);
    const rows = data ?? [];
    out.push(...rows);
    if (rows.length < chunk) break;
    page++;
  }
  return out;
}

function pushRecord(
  bucket: Map<string, PaidAgencyRecord>,
  rec: PaidAgencyRecord,
) {
  if (!rec.agency_id || !rec.state_slug) return;
  const key = `${rec.agency_id}|${rec.state_slug}`;
  const existing = bucket.get(key);
  if (!existing) {
    bucket.set(key, rec);
    return;
  }
  const sourceRank: Record<PaidAgencyRecord["source"], number> = {
    agency_listings: 1,
    paid_override: 2,
    top25_slots: 3,
    spotlight_placements: 4,
    is_paid_listing: 5,
    stripe_orders: 6,
  };
  if (sourceRank[rec.source] < sourceRank[existing.source]) {
    bucket.set(key, { ...rec, agency_name: rec.agency_name ?? existing.agency_name });
  } else if (existing.top25_rank == null && rec.top25_rank != null) {
    existing.top25_rank = rec.top25_rank;
  }
}

/**
 * Returns a deduplicated list of paid agencies, keyed by (agency_id, state_slug).
 * Pulls from agency_listings (authoritative), other_agencies overrides + legacy flags,
 * top25_slots, spotlight_placements, and stripe_orders (matched via customer email).
 */
export async function getPaidAgencies(
  supabase: SupabaseClient,
  opts: { stateSlug?: string | null; listingType?: string | null } = {},
): Promise<PaidAgencyRecord[]> {
  const stateSlug = opts.stateSlug && opts.stateSlug !== "all" ? opts.stateSlug : null;
  const listingTypeFilter = opts.listingType && opts.listingType !== "all" ? opts.listingType : null;

  const bucket = new Map<string, PaidAgencyRecord>();

  const agencyMetaCache = new Map<string, OtherAgencyMin>();
  const otherAgenciesQuery = await fetchAll<OtherAgencyMin>(supabase, async (from, to) => {
    let q = supabase
      .from("other_agencies")
      .select("id, name, state_slug, is_paid_listing, paid_listing_type, paid_listing_rank, paid_override_active, paid_override_value, paid_override_updated_at, updated_at, created_at")
      .order("id")
      .range(from, to);
    if (stateSlug) q = q.eq("state_slug", stateSlug);
    return q;
  });
  for (const row of otherAgenciesQuery) agencyMetaCache.set(row.id, row);

  const listings = await fetchAll<{ agency_id: string; state_slug: string; paid_active: boolean | null; listing_tier: string | null; updated_at: string | null }>(
    supabase,
    async (from, to) => {
      let q = supabase
        .from("agency_listings")
        .select("agency_id, state_slug, paid_active, listing_tier, updated_at")
        .eq("paid_active", true)
        .order("agency_id")
        .range(from, to);
      if (stateSlug) q = q.eq("state_slug", stateSlug);
      return q;
    },
  );
  for (const row of listings) {
    if (!row.agency_id || !row.state_slug) continue;
    const meta = agencyMetaCache.get(row.agency_id);
    const name = meta?.name ?? null;
    const norm = normalizeAgencyNameStrict(name);
    pushRecord(bucket, {
      agency_id: row.agency_id,
      agency_name: name,
      agency_name_canonical: norm.canonical,
      agency_name_preserved: norm.preserved,
      state_slug: row.state_slug,
      listing_type: row.listing_tier || "standard",
      top25_rank: null,
      paid_at: row.updated_at,
      source: "agency_listings",
    });
  }

  for (const meta of otherAgenciesQuery) {
    if (meta.paid_override_active === true && meta.paid_override_value === true) {
      const norm = normalizeAgencyNameStrict(meta.name);
      pushRecord(bucket, {
        agency_id: meta.id,
        agency_name: meta.name,
        agency_name_canonical: norm.canonical,
        agency_name_preserved: norm.preserved,
        state_slug: meta.state_slug,
        listing_type: meta.paid_listing_type || "override",
        top25_rank: meta.paid_listing_rank ?? null,
        paid_at: meta.paid_override_updated_at,
        source: "paid_override",
      });
    }
    if (meta.is_paid_listing === true) {
      const norm = normalizeAgencyNameStrict(meta.name);
      pushRecord(bucket, {
        agency_id: meta.id,
        agency_name: meta.name,
        agency_name_canonical: norm.canonical,
        agency_name_preserved: norm.preserved,
        state_slug: meta.state_slug,
        listing_type: meta.paid_listing_type || "legacy_paid",
        top25_rank: meta.paid_listing_rank ?? null,
        paid_at: meta.paid_override_updated_at ?? meta.updated_at ?? meta.created_at ?? null,
        source: "is_paid_listing",
      });
    }
  }

  try {
    const top25 = await fetchAll<{ agency_id: string | null; state_slug: string; rank: number | null; is_paid: boolean | null; claimed_at: string | null }>(
      supabase,
      async (from, to) => {
        let q = supabase
          .from("top25_slots")
          .select("agency_id, state_slug, rank, is_paid, claimed_at")
          .eq("is_paid", true)
          .order("state_slug")
          .order("rank")
          .range(from, to);
        if (stateSlug) q = q.eq("state_slug", stateSlug);
        return q;
      },
    );
    for (const row of top25) {
      if (!row.agency_id) continue;
      const meta = agencyMetaCache.get(row.agency_id);
      const name = meta?.name ?? null;
      const norm = normalizeAgencyNameStrict(name);
      pushRecord(bucket, {
        agency_id: row.agency_id,
        agency_name: name,
        agency_name_canonical: norm.canonical,
        agency_name_preserved: norm.preserved,
        state_slug: row.state_slug,
        listing_type: "top25",
        top25_rank: row.rank ?? null,
        paid_at: row.claimed_at,
        source: "top25_slots",
      });
    }
  } catch (e) {
    console.warn("[paidAgencyResolver] top25_slots skipped:", (e as Error).message);
  }

  try {
    const spotlight = await fetchAll<{ agency_id: string | null; state_slug: string; is_paid: boolean | null; pricing_tier: string | null; claimed_at: string | null }>(
      supabase,
      async (from, to) => {
        let q = supabase
          .from("spotlight_placements")
          .select("agency_id, state_slug, is_paid, pricing_tier, claimed_at")
          .eq("is_paid", true)
          .order("state_slug")
          .range(from, to);
        if (stateSlug) q = q.eq("state_slug", stateSlug);
        return q;
      },
    );
    for (const row of spotlight) {
      if (!row.agency_id) continue;
      const meta = agencyMetaCache.get(row.agency_id);
      const name = meta?.name ?? null;
      const norm = normalizeAgencyNameStrict(name);
      pushRecord(bucket, {
        agency_id: row.agency_id,
        agency_name: name,
        agency_name_canonical: norm.canonical,
        agency_name_preserved: norm.preserved,
        state_slug: row.state_slug,
        listing_type: row.pricing_tier || "spotlight",
        top25_rank: null,
        paid_at: row.claimed_at,
        source: "spotlight_placements",
      });
    }
  } catch (e) {
    console.warn("[paidAgencyResolver] spotlight_placements skipped:", (e as Error).message);
  }

  try {
    const orders = await fetchAll<{ customer_email: string | null; state_slug: string | null; status: string | null; amount_total: number | null; created_at: string | null }>(
      supabase,
      async (from, to) => {
        let q = supabase
          .from("stripe_orders")
          .select("customer_email, state_slug, status, amount_total, created_at")
          .in("status", ["completed", "paid"])
          .gt("amount_total", 0)
          .order("created_at", { ascending: false })
          .range(from, to);
        if (stateSlug) q = q.eq("state_slug", stateSlug);
        return q;
      },
    );
    if (orders.length > 0) {
      const emails = Array.from(new Set(orders.map((o) => normalizeEmail(o.customer_email || "")).filter(Boolean) as string[]));
      const emailToAgency = new Map<string, { agency_id: string; state_slug: string | null }>();
      const chunkSize = 200;
      for (let i = 0; i < emails.length; i += chunkSize) {
        const batch = emails.slice(i, i + chunkSize);
        const { data, error } = await supabase
          .from("other_agency_emails")
          .select("email_normalized, agency_id, agency:other_agencies!inner(state_slug)")
          .in("email_normalized", batch);
        if (error) {
          console.warn("[paidAgencyResolver] stripe email lookup error:", error.message);
          continue;
        }
        for (const row of data || []) {
          if (row.email_normalized && row.agency_id) {
            emailToAgency.set(row.email_normalized, {
              agency_id: row.agency_id,
              // deno-lint-ignore no-explicit-any
              state_slug: (row as any).agency?.state_slug ?? null,
            });
          }
        }
      }
      for (const order of orders) {
        const e = normalizeEmail(order.customer_email || "");
        if (!e) continue;
        const link = emailToAgency.get(e);
        if (!link) continue;
        const targetState = order.state_slug || link.state_slug;
        if (!targetState) continue;
        if (stateSlug && targetState !== stateSlug) continue;
        const meta = agencyMetaCache.get(link.agency_id);
        const name = meta?.name ?? null;
        const norm = normalizeAgencyNameStrict(name);
        pushRecord(bucket, {
          agency_id: link.agency_id,
          agency_name: name,
          agency_name_canonical: norm.canonical,
          agency_name_preserved: norm.preserved,
          state_slug: targetState,
          listing_type: "stripe_order",
          top25_rank: null,
          paid_at: order.created_at,
          source: "stripe_orders",
        });
      }
    }
  } catch (e) {
    console.warn("[paidAgencyResolver] stripe_orders skipped:", (e as Error).message);
  }

  let records = Array.from(bucket.values());
  if (listingTypeFilter) {
    records = records.filter((r) => r.listing_type === listingTypeFilter);
  }
  return records;
}
