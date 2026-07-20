import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import Stripe from "npm:stripe@17.7.0";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";
import { sendEmail } from "../_shared/emailClient.ts";
import { buildAgencyAdminUrl } from "../_shared/adminEmailContext.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, stripe-signature",
};

const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
);

// ─── helpers ────────────────────────────────────────────────────────────────

function funnelNameFromListingType(listingType: string): string {
  if (listingType === "top25" || listingType === "top25_rank") return "top25_checkout";
  if (listingType === "spotlight") return "spotlight_checkout";
  if (listingType === "standard" || listingType === "other_listing") return "standard_checkout";
  return "your_agency";
}

function productSummaryFromMetadata(meta: Record<string, string>): string {
  const lt = meta.listingType || meta.funnel || "";
  const rank = meta.rank ? `#${meta.rank}` : "";
  const state = meta.stateName || meta.stateSlug || "";
  if (lt === "top25" || lt === "top25_rank") return `Top 25 ${rank} – ${state}`.trim();
  if (lt === "spotlight") return `Spotlight – ${state}`.trim();
  if (lt === "standard" || lt === "other_listing") return `Standard Listing – ${state}`.trim();
  return meta.agencyName ? `${meta.agencyName} – ${state}`.trim() : "Paid Listing";
}

// ─── normalize website URL ────────────────────────────────────────────────────

function normalizeWebsiteUrl(raw: string | null | undefined): string | null {
  if (!raw) return null;
  const trimmed = raw.trim();
  if (!trimmed) return null;
  try {
    const withScheme = trimmed.startsWith("http://") || trimmed.startsWith("https://")
      ? trimmed
      : `https://${trimmed}`;
    const parsed = new URL(withScheme);
    if (parsed.protocol !== "http:" && parsed.protocol !== "https:") return null;
    if (!parsed.hostname || !parsed.hostname.includes(".")) return null;
    return withScheme;
  } catch {
    return null;
  }
}

// ─── resolve agency fields from DB ──────────────────────────────────────────

async function resolveAgencyFields(params: {
  agencyId?: string | null;
  agencySlug?: string | null;
  agencyName?: string | null;
  stateSlug?: string | null;
}): Promise<{ agencyId: string | null; agencySlug: string | null; agencyName: string | null }> {
  let { agencyId, agencySlug, agencyName } = params;

  if (agencyId && (!agencySlug || !agencyName)) {
    const { data } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .eq("id", agencyId)
      .maybeSingle();
    if (data) {
      agencySlug = agencySlug || data.slug || null;
      agencyName = agencyName || data.name || null;
    }
  }

  if (!agencyId && agencySlug) {
    const { data } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .eq("slug", agencySlug)
      .maybeSingle();
    if (data) {
      agencyId = data.id;
      agencyName = agencyName || data.name || null;
    }
  }

  return {
    agencyId: agencyId || null,
    agencySlug: agencySlug || null,
    agencyName: agencyName || null,
  };
}

// ─── resolve other_agency for standard listing activation ────────────────────
// Deterministic 4-path resolution used when a standard/$97 listing is paid.
// Returns resolved DB row fields so stripe_orders and activateAgency both use
// the real row id — not a potentially-blank metadata field.

type ResolvedOtherAgency = {
  resolvedAgencyId: string | null;
  resolvedAgencySlug: string | null;
  resolvedAgencyName: string | null;
  resolvedWebsiteUrl: string | null;
};

async function resolveOtherAgencyForActivation(params: {
  agencyId?: string | null;
  agencySlug?: string | null;
  agencyName?: string | null;
  stateSlug?: string | null;
  agencyWebsite?: string | null;
}): Promise<ResolvedOtherAgency> {
  const empty: ResolvedOtherAgency = {
    resolvedAgencyId: null,
    resolvedAgencySlug: null,
    resolvedAgencyName: null,
    resolvedWebsiteUrl: null,
  };

  function rowToResolved(row: { id: string; slug: string | null; name: string; website_url: string | null }): ResolvedOtherAgency {
    return {
      resolvedAgencyId: row.id,
      resolvedAgencySlug: row.slug,
      resolvedAgencyName: row.name,
      resolvedWebsiteUrl: row.website_url,
    };
  }

  // A — by id (most reliable; try with stateSlug first, then without)
  if (params.agencyId) {
    {
      let q = supabase.from("other_agencies").select("id, slug, name, website_url").eq("id", params.agencyId);
      if (params.stateSlug) q = q.eq("state_slug", params.stateSlug);
      const { data } = await q.maybeSingle();
      if (data) {
        console.log("[webhook:resolve] Resolved by agencyId + state:", data.id);
        return rowToResolved(data);
      }
    }
    {
      const { data } = await supabase.from("other_agencies").select("id, slug, name, website_url").eq("id", params.agencyId).maybeSingle();
      if (data) {
        console.log("[webhook:resolve] Resolved by agencyId (no state filter):", data.id);
        return rowToResolved(data);
      }
    }
  }

  // B — by slug + stateSlug
  if (params.agencySlug && params.stateSlug) {
    const { data } = await supabase
      .from("other_agencies")
      .select("id, slug, name, website_url")
      .eq("slug", params.agencySlug)
      .eq("state_slug", params.stateSlug)
      .maybeSingle();
    if (data) {
      console.log("[webhook:resolve] Resolved by slug + state:", data.id);
      return rowToResolved(data);
    }
  }

  // C — by normalized name + stateSlug
  if (params.agencyName && params.stateSlug) {
    const { data } = await supabase
      .from("other_agencies")
      .select("id, slug, name, website_url")
      .ilike("name", params.agencyName.trim())
      .eq("state_slug", params.stateSlug)
      .maybeSingle();
    if (data) {
      console.log("[webhook:resolve] Resolved by name + state:", data.id);
      return rowToResolved(data);
    }
  }

  // D — by website domain (last resort)
  if (params.agencyWebsite) {
    try {
      const withScheme = params.agencyWebsite.startsWith("http")
        ? params.agencyWebsite
        : `https://${params.agencyWebsite}`;
      const hostname = new URL(withScheme).hostname.replace(/^www\./, "");
      if (hostname && hostname.includes(".")) {
        const { data } = await supabase
          .from("other_agencies")
          .select("id, slug, name, website_url")
          .ilike("website_url", `%${hostname}%`)
          .maybeSingle();
        if (data) {
          console.log("[webhook:resolve] Resolved by website domain:", data.id, hostname);
          return rowToResolved(data);
        }
      }
    } catch {
      // ignore URL parse errors
    }
  }

  console.error("[webhook:resolve] CRITICAL: Could not resolve other_agency from any path. Metadata:", {
    agencyId: params.agencyId,
    agencySlug: params.agencySlug,
    agencyName: params.agencyName,
    stateSlug: params.stateSlug,
    agencyWebsite: params.agencyWebsite,
  });

  return empty;
}

// ─── activate paid agency ─────────────────────────────────────────────────────
// CRITICAL: Called on every successful payment to mark the agency as paid/active.
// Must never fail silently — errors are logged but do not fail the webhook response.

async function activateAgency(params: {
  agencyId: string | null;
  stateSlug: string | null;
  listingType: string | null;
  checkoutSessionId: string;
  agencyWebsite?: string | null;
  subscriptionId?: string | null;
  rank?: number | null;
  reservedSlotId?: string | null;
  reservedLockStartedAt?: string | null;
  top25SlotId?: string | null;
}): Promise<{ top25NeedsReview: boolean; top25ReviewReason?: string }> {
  const { agencyId, stateSlug, listingType, checkoutSessionId, subscriptionId, rank, reservedSlotId, reservedLockStartedAt, top25SlotId } = params;

  if (!agencyId) {
    console.error("[webhook:activate] CRITICAL: No agencyId — activation impossible. checkoutSession:", checkoutSessionId, "listingType:", listingType);
    return { top25NeedsReview: false };
  }

  const now = new Date().toISOString();
  // top25_upgrade is a paid upgrade to a Top 25 slot — treat same as top25/top25_rank for slot activation
  const isTop25 = listingType === "top25" || listingType === "top25_rank" || listingType === "top25_upgrade";
  const isStandard = listingType === "standard" || listingType === "other_listing" || listingType === "activation";

  console.log("[webhook:activate] Activating agency:", { agencyId, stateSlug, listingType, isTop25, isStandard, reservedSlotId });

  let top25NeedsReview = false;
  let top25ReviewReason: string | undefined;

  // 1. Activate in top25_slots when listing type is top25.
  // CRITICAL: prefer reservedSlotId-scoped claim. Never overwrite another
  // agency's reserved slot via state_slug+rank alone.
  if (isTop25) {
    const top25Update: Record<string, unknown> = {
      agency_id: agencyId,
      is_paid: true,
      is_available: false,
      slot_status: "sold",
      status_updated_at: now,
      status_reason: "stripe_payment",
      status_updated_by: "stripe_webhook",
      billing_status: "paid",
      purchased_at: now,
      stripe_checkout_session_id: checkoutSessionId,
      updated_at: now,
    };
    if (subscriptionId) top25Update.stripe_subscription_id = subscriptionId;

    const hasStateAndRank =
      !!stateSlug && rank !== null && rank !== undefined;

    let updatedRows: { id: string }[] = [];
    let updateError: { message: string } | null = null;

    if (reservedSlotId) {
      // Strict path: claim ONLY the slot that was reserved for this checkout.
      // Discriminate by lock_started_at to defeat the race where the
      // reservation expired and another checkout reserved the same row.
      let q = supabase
        .from("top25_slots")
        .update(top25Update)
        .eq("id", reservedSlotId)
        .eq("slot_status", "reserved");
      if (stateSlug) q = q.eq("state_slug", stateSlug as string);
      if (rank !== null && rank !== undefined) q = q.eq("rank", rank as number);
      if (reservedLockStartedAt) q = q.eq("lock_started_at", reservedLockStartedAt);
      const { error, data } = await q.select("id");
      updateError = error;
      updatedRows = data ?? [];

      if (!updateError && updatedRows.length === 0) {
        // Idempotent retry: this exact reserved slot already sold to this agency
        const { data: idempotent } = await supabase
          .from("top25_slots")
          .update(top25Update)
          .eq("id", reservedSlotId)
          .eq("agency_id", agencyId)
          .select("id");
        updatedRows = idempotent ?? [];

        if (updatedRows.length === 0) {
          top25NeedsReview = true;
          top25ReviewReason = "top25_reservation_mismatch_or_expired";
          console.error("[webhook:activate] CRITICAL: reservedSlotId/lock mismatch — reservation expired or claimed by another agency. NOT overwriting.", { reservedSlotId, reservedLockStartedAt, agencyId, stateSlug, rank });
        }
      }
    } else if (top25SlotId) {
      // top25_upgrade path: slot id is known from stripe_orders.top25_slot_id.
      // Claim the exact slot regardless of slot_status so upgrades on 'reserved'
      // slots are not silently skipped. Idempotent: second run is a no-op because
      // agency_id already matches.
      const { error, data } = await supabase
        .from("top25_slots")
        .update(top25Update)
        .eq("id", top25SlotId)
        .neq("agency_id", agencyId); // skip if already owned by this agency
      updateError = error;
      updatedRows = data ?? [];

      if (!updateError && updatedRows.length === 0) {
        // Idempotent: slot already owned by this agency
        const { data: already } = await supabase
          .from("top25_slots")
          .select("id")
          .eq("id", top25SlotId)
          .eq("agency_id", agencyId);
        if ((already ?? []).length > 0) {
          updatedRows = already as { id: string }[];
          console.log("[webhook:activate] top25_upgrade slot already owned by agency (idempotent):", top25SlotId);
        } else {
          top25NeedsReview = true;
          top25ReviewReason = "top25_upgrade_slot_not_found_or_conflict";
          console.error("[webhook:activate] CRITICAL: top25_upgrade slot update matched 0 rows:", { top25SlotId, agencyId, stateSlug, rank });
        }
      }
    } else if (hasStateAndRank) {
      // Legacy path (no reservedSlotId): only claim a still-available slot
      // OR confirm idempotent retry by agency_id. Never claim a 'reserved' slot.
      const { error, data } = await supabase
        .from("top25_slots")
        .update(top25Update)
        .eq("state_slug", stateSlug as string)
        .eq("rank", rank as number)
        .eq("slot_status", "available")
        .select("id");
      updateError = error;
      updatedRows = data ?? [];

      if (!updateError && updatedRows.length === 0) {
        const { data: alreadySold } = await supabase
          .from("top25_slots")
          .update(top25Update)
          .eq("state_slug", stateSlug as string)
          .eq("rank", rank as number)
          .eq("agency_id", agencyId)
          .select("id");
        updatedRows = alreadySold ?? [];

        if (updatedRows.length === 0) {
          // Fallback by agency_id (+ state_slug) for legacy/admin migrated rows
          let q = supabase
            .from("top25_slots")
            .update(top25Update)
            .eq("agency_id", agencyId);
          if (stateSlug) q = q.eq("state_slug", stateSlug);
          const { error: fbErr, data: fbData } = await q.select("id");
          if (fbErr) updateError = fbErr;
          updatedRows = fbData ?? [];

          if (!fbErr && updatedRows.length === 0) {
            top25NeedsReview = true;
            top25ReviewReason = "top25_no_matching_slot_legacy";
            console.error("[webhook:activate] Legacy Top 25 activation found no matching slot. NOT overwriting reserved slots.", { agencyId, stateSlug, rank });
          }
        }
      }
    } else {
      // No state/rank, no reservedSlotId → only safe fallback is by agency_id
      const { error, data } = await supabase
        .from("top25_slots")
        .update(top25Update)
        .eq("agency_id", agencyId)
        .select("id");
      updateError = error;
      updatedRows = data ?? [];
      if (!updateError && updatedRows.length === 0) {
        top25NeedsReview = true;
        top25ReviewReason = "top25_missing_slot_identifiers";
      }
    }

    if (updateError) {
      console.error("[webhook:activate] FAILED to update top25_slots:", updateError.message, { agencyId, stateSlug, rank, reservedSlotId });
    } else if (updatedRows.length === 0) {
      console.error("[webhook:activate] CRITICAL: top25_slots 0 rows updated:", { agencyId, stateSlug, rank, reservedSlotId, reason: top25ReviewReason });
    } else {
      console.log("[webhook:activate] top25_slots hardened paid for", updatedRows.length, "row(s):", { agencyId, stateSlug, rank, reservedSlotId });
    }
  }

  // 2. Activate in other_agencies for standard/other_listing AND as fallback for all types
  const { error: oaError, data: oaData } = await supabase
    .from("other_agencies")
    .update({ is_paid_listing: true, updated_at: now })
    .eq("id", agencyId)
    .select("id, name, website_url");

  if (oaError) {
    console.error("[webhook:activate] FAILED to update other_agencies:", oaError.message, { agencyId });
  } else if ((oaData ?? []).length === 0) {
    if (isStandard) {
      console.error("[webhook:activate] CRITICAL ACTIVATION MISS: Standard listing payment received but other_agencies row not found for id:", agencyId, "checkoutSession:", checkoutSessionId);
    } else {
      console.warn("[webhook:activate] other_agencies: no row found for id (non-standard listing):", agencyId);
    }
  } else {
    const row = (oaData ?? [])[0] as { id: string; name: string; website_url: string | null } | undefined;
    console.log("[webhook:activate] other_agencies.is_paid_listing=true set:", { agencyId, name: row?.name });

    // Backfill website_url when the row has none but metadata carries the URL
    const existingWebsite = row?.website_url?.trim() || "";
    const metaWebsite = normalizeWebsiteUrl(params.agencyWebsite);
    if (!existingWebsite && metaWebsite) {
      const { error: wErr } = await supabase
        .from("other_agencies")
        .update({ website_url: metaWebsite, updated_at: now })
        .eq("id", agencyId);
      if (wErr) {
        console.error("[webhook:activate] Failed to backfill website_url:", wErr.message, { agencyId });
      } else {
        console.log("[webhook:activate] website_url backfilled from checkout metadata:", { agencyId, website: metaWebsite });
      }
    }
  }

  return { top25NeedsReview, top25ReviewReason };
}

// ─── admin sale email ─────────────────────────────────────────────────────────
// Sends a sale notification directly via SMTP.
// email-center does not handle admin_sale_notification — this uses SMTP directly.

async function sendAdminSaleEmail(params: {
  agencyName: string | null;
  agencyId: string | null;
  stateSlug: string | null;
  listingType: string | null;
  amountFormatted: string;
  productSummary: string;
  checkoutSessionId: string;
  customerEmail: string | null;
  customerName: string | null;
  rank?: number | null;
  isUpgrade?: boolean;
  originalAmountCents?: number | null;
  discountPercent?: number | null;
  discountAmountCents?: number | null;
  amountTotalCents?: number | null;
  promoCode?: string | null;
  upsellSource?: string | null;
  creditAppliedCents?: number | null;
  originalProduct?: string | null;
  upgradedToProduct?: string | null;
  renewalAmountCents?: number | null;
  renewalInterval?: string | null;
  subscriptionId?: string | null;
  listingPublished?: boolean | null;
  finalizationStatus?: string | null;
  livePageUrl?: string | null;
  warnings?: string[];
}): Promise<void> {
  try {
    const recipient = Deno.env.get("SMTP_INTERNAL_EMAIL") || "bartu@gappsy.com";

    const fmt = (cents: number | null | undefined): string =>
      cents == null || Number.isNaN(cents) ? "N/A" : `$${(cents / 100).toFixed(2)}`;

    const stateName = params.stateSlug
      ? params.stateSlug.split("-").map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(" ")
      : null;

    const rankLabel = params.rank ? `#${params.rank}` : null;
    const productLabel = [params.productSummary, rankLabel].filter(Boolean).join(" ");

    const subjectParts: string[] = [];
    if (params.isUpgrade) {
      subjectParts.push(`Upgrade: ${params.originalProduct || "Standard"} -> ${params.upgradedToProduct || params.productSummary}${rankLabel ? ` ${rankLabel}` : ""}`);
    } else {
      subjectParts.push(`New sale: ${productLabel}`);
    }
    subjectParts.push(params.amountFormatted);
    if (params.discountPercent && params.discountPercent > 0) {
      subjectParts.push(`${params.discountPercent}% off`);
    }
    subjectParts.push(params.agencyName || "Unknown agency");
    const subject = subjectParts.join(" - ");

    // Build line-item breakdown
    const breakdownRows: string[] = [];
    if (params.originalAmountCents != null && params.originalAmountCents > 0) {
      breakdownRows.push(`<tr><td style="padding:6px 8px;color:#475569">${params.originalProduct || params.productSummary}</td><td style="padding:6px 8px;text-align:right;font-family:monospace">${fmt(params.originalAmountCents)}</td></tr>`);
    }
    if (params.creditAppliedCents != null && params.creditAppliedCents > 0) {
      breakdownRows.push(`<tr><td style="padding:6px 8px;color:#475569">Credit applied</td><td style="padding:6px 8px;text-align:right;font-family:monospace;color:#dc2626">- ${fmt(params.creditAppliedCents)}</td></tr>`);
    }
    if (params.discountAmountCents != null && params.discountAmountCents > 0) {
      const pct = params.discountPercent ? ` (${params.discountPercent}%)` : "";
      breakdownRows.push(`<tr><td style="padding:6px 8px;color:#475569">Discount${pct}</td><td style="padding:6px 8px;text-align:right;font-family:monospace;color:#dc2626">- ${fmt(params.discountAmountCents)}</td></tr>`);
    }
    breakdownRows.push(`<tr style="border-top:2px solid #0A1735"><td style="padding:8px;font-weight:700">Paid today</td><td style="padding:8px;text-align:right;font-weight:700;font-family:monospace;color:#16a34a">${params.amountFormatted}</td></tr>`);
    if (params.renewalAmountCents != null && params.renewalAmountCents > 0) {
      breakdownRows.push(`<tr><td style="padding:6px 8px;color:#64748b;font-size:12px">Renews</td><td style="padding:6px 8px;text-align:right;font-family:monospace;font-size:12px;color:#64748b">${fmt(params.renewalAmountCents)}${params.renewalInterval ? ` / ${params.renewalInterval}` : ""}</td></tr>`);
    }

    // Badges
    const badges: string[] = [];
    if (params.isUpgrade) {
      badges.push(`<span style="display:inline-block;background:#dbeafe;color:#1e40af;font-size:11px;font-weight:600;padding:3px 8px;border-radius:4px;margin-right:6px">UPGRADE</span>`);
    }
    if (params.discountPercent && params.discountPercent > 0) {
      badges.push(`<span style="display:inline-block;background:#fef3c7;color:#92400e;font-size:11px;font-weight:600;padding:3px 8px;border-radius:4px;margin-right:6px">DISCOUNT ${params.discountPercent}%</span>`);
    }
    if (params.listingType === "top25" || rankLabel) {
      badges.push(`<span style="display:inline-block;background:#fce7f3;color:#9f1239;font-size:11px;font-weight:600;padding:3px 8px;border-radius:4px;margin-right:6px">TOP 25${rankLabel ? ` ${rankLabel}` : ""}</span>`);
    }
    if (params.listingPublished === false) {
      badges.push(`<span style="display:inline-block;background:#fee2e2;color:#991b1b;font-size:11px;font-weight:600;padding:3px 8px;border-radius:4px;margin-right:6px">NOT LIVE</span>`);
    }

    // Admin links
    const baseUrl = Deno.env.get("PUBLIC_BASE_URL") || "https://www.gappsy.com";
    const orderUrl = `${baseUrl}/wp-admin/stripe?session=${encodeURIComponent(params.checkoutSessionId)}`;
    const helperUrl = (params.agencyId || params.agencySlug)
      ? buildAgencyAdminUrl({ agency_id: params.agencyId, agency_slug: params.agencySlug })
      : null;
    const livePageUrl = params.livePageUrl
      || (params.stateSlug ? `${baseUrl}/marketing-agencies-in-${params.stateSlug}-united-states/` : null);
    const top25EditorUrl = (params.listingType === "top25" && params.stateSlug)
      ? `${baseUrl}/wp-admin/top25-editor?state=${encodeURIComponent(params.stateSlug)}`
      : null;

    const linkButton = (href: string, label: string, color: string) =>
      `<a href="${href}" style="display:inline-block;background:${color};color:#ffffff;text-decoration:none;font-weight:600;font-size:12px;padding:8px 14px;border-radius:6px;margin-right:6px;margin-bottom:6px">${label}</a>`;

    const linksHtml = [
      linkButton(orderUrl, "Open revenue order", "#0A1735"),
      helperUrl ? linkButton(helperUrl, "Open Admin", "#1d4ed8") : "",
      livePageUrl ? linkButton(livePageUrl, "Open live page", "#0f766e") : "",
      top25EditorUrl ? linkButton(top25EditorUrl, "Top 25 editor", "#9f1239") : "",
    ].filter(Boolean).join("");

    // Warnings
    const warnings = params.warnings || [];
    const warningHtml = warnings.length
      ? `<div style="background:#fef2f2;border:1px solid #fecaca;border-radius:8px;padding:12px;margin-top:14px">
           <div style="font-weight:700;color:#991b1b;font-size:13px;margin-bottom:6px">Warnings</div>
           <ul style="margin:0;padding-left:18px;color:#b91c1c;font-size:12px">
             ${warnings.map((w) => `<li>${w}</li>`).join("")}
           </ul>
         </div>`
      : "";

    const html = `
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:640px;margin:0 auto;padding:24px;background:#f8fafc">
        <div style="background:#ffffff;border-radius:12px;padding:24px;border:1px solid #e2e8f0">
          <div style="margin-bottom:14px">${badges.join("")}</div>
          <h2 style="color:#0A1735;margin:0 0 6px 0;font-size:20px">${params.isUpgrade ? "Upgrade" : "New sale"}: ${productLabel}</h2>
          <div style="color:#64748b;font-size:13px;margin-bottom:18px">${params.agencyName || "Unknown agency"}${stateName ? ` &middot; ${stateName}` : ""}</div>

          <table style="width:100%;border-collapse:collapse;font-size:14px;margin-bottom:18px">
            ${breakdownRows.join("")}
          </table>

          <table style="width:100%;border-collapse:collapse;font-size:13px;margin-bottom:18px">
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b;width:160px">Agency</td><td style="padding:6px 0">${params.agencyName || "Unknown"}</td></tr>
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Agency ID</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${params.agencyId || "N/A"}</td></tr>
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">State</td><td style="padding:6px 0">${stateName || params.stateSlug || "N/A"}</td></tr>
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Listing type</td><td style="padding:6px 0">${params.listingType || "N/A"}${rankLabel ? ` ${rankLabel}` : ""}</td></tr>
            ${params.promoCode ? `<tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Promo code</td><td style="padding:6px 0;font-family:monospace;font-size:12px">${params.promoCode}</td></tr>` : ""}
            ${params.upsellSource ? `<tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Upsell source</td><td style="padding:6px 0">${params.upsellSource}</td></tr>` : ""}
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Customer</td><td style="padding:6px 0">${params.customerName || "N/A"} &lt;${params.customerEmail || "N/A"}&gt;</td></tr>
            ${params.subscriptionId ? `<tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Subscription</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${params.subscriptionId}</td></tr>` : ""}
            <tr><td style="padding:6px 0;color:#64748b">Checkout session</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${params.checkoutSessionId}</td></tr>
          </table>

          <div style="margin-top:14px">${linksHtml}</div>

          ${warningHtml}
        </div>
        <p style="margin:14px 0 0 0;font-size:11px;color:#94a3b8;text-align:center">Internal admin notification - Gappsy Stripe webhook</p>
      </div>
    `;

    await sendEmail({
      to: recipient,
      subject,
      html,
    });

    console.log("[webhook:email] Admin sale email sent to:", recipient, "for", params.checkoutSessionId);
  } catch (e) {
    console.error("[webhook:email] Admin sale email FAILED:", (e as Error).message, "session:", params.checkoutSessionId);
  }
}

// ─── insert checkout_completed funnel event ──────────────────────────────────

async function insertPaymentFunnelEvent(params: {
  sessionId: string;
  checkoutSessionId: string;
  funnelName: string;
  fsid?: string | null;
  agencyId?: string | null;
  agencySlug?: string | null;
  agencyName?: string | null;
  stateSlug?: string | null;
  listingType?: string | null;
  amountTotal?: number | null;
  currency?: string | null;
  paymentIntentId?: string | null;
}) {
  const { error } = await supabase.from("funnel_events").insert({
    session_id:  params.sessionId,
    funnel_type: params.funnelName,
    funnel_name: params.funnelName,
    event_name:  "checkout_completed",
    step_number: 160,
    state_slug:  params.stateSlug  ?? null,
    is_demo:     false,
    fsid:        params.fsid       ?? null,
    metadata: {
      agency_id:           params.agencyId         ?? null,
      agency_name:         params.agencyName        ?? null,
      agency_slug:         params.agencySlug        ?? null,
      checkout_session_id: params.checkoutSessionId,
      listing_type:        params.listingType       ?? null,
      amount_total:        params.amountTotal       ?? null,
      currency:            params.currency          ?? null,
      payment_intent_id:   params.paymentIntentId   ?? null,
      source: "stripe_webhook",
    },
  });
  if (error) {
    console.error("[webhook] checkout_completed funnel event insert failed:", error.message);
  }
}

// ─── backfill funnel session ─────────────────────────────────────────────────

async function backfillFunnelSession(params: {
  checkoutSessionId: string;
  fsid?: string | null;
  agencyId?: string | null;
  agencySlug?: string | null;
  agencyName?: string | null;
  stateSlug?: string | null;
  entryPath?: string | null;
  listingType?: string | null;
  upsellCardVisual?: boolean;
  upsellGetMatched?: boolean;
  amountTotal?: number | null;
  currency?: string | null;
  paymentIntentId?: string | null;
}) {
  const {
    checkoutSessionId,
    fsid,
    stateSlug,
    entryPath,
    listingType,
    upsellCardVisual,
    upsellGetMatched,
    amountTotal,
    currency,
    paymentIntentId,
  } = params;

  const resolved = await resolveAgencyFields({
    agencyId: params.agencyId,
    agencySlug: params.agencySlug,
    agencyName: params.agencyName,
    stateSlug,
  });

  const funnelName = funnelNameFromListingType(listingType || "");
  const purchasedAmountCents = amountTotal ? Math.round(amountTotal * 100) : null;

  const paidFields: Record<string, unknown> = {
    stage: "paid",
    payment_status: "paid",
    payment_source: "webhook",
    checkout_session_id: checkoutSessionId,
    purchased_product: listingType || "listing",
    purchased_amount: purchasedAmountCents,
    upsell_taken: upsellCardVisual || upsellGetMatched || false,
    last_event_name: "checkout_completed",
    last_event_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  };

  if (resolved.agencyId) paidFields.agency_id = resolved.agencyId;
  if (resolved.agencySlug) paidFields.agency_slug = resolved.agencySlug;
  if (resolved.agencyName) paidFields.agency_name = resolved.agencyName;
  if (stateSlug) paidFields.state_slug = stateSlug;
  if (entryPath) paidFields.entry_path = entryPath;
  if (paymentIntentId) paidFields.payment_intent_id = paymentIntentId;
  if (currency) paidFields.currency = currency;

  const eventBase = {
    checkoutSessionId,
    funnelName,
    fsid,
    agencyId: resolved.agencyId,
    agencySlug: resolved.agencySlug,
    agencyName: resolved.agencyName,
    stateSlug,
    listingType,
    amountTotal: amountTotal ?? null,
    currency: currency ?? null,
    paymentIntentId: paymentIntentId ?? null,
  };

  // 1) Match by fsid (most reliable – set at checkout open time)
  if (fsid) {
    const { data: existing } = await supabase
      .from("funnel_sessions")
      .select("id, payment_source, stage")
      .eq("fsid", fsid)
      .maybeSingle();

    if (existing) {
      if (existing.stage === "paid" && existing.payment_source === "client") {
        console.log("[backfill] Session already paid via client, skipping:", existing.id);
        return;
      }
      console.log("[backfill] Updating session by fsid:", existing.id);
      await supabase.from("funnel_sessions").update(paidFields).eq("id", existing.id);
      await insertPaymentFunnelEvent({ ...eventBase, sessionId: existing.id });
      return;
    }
  }

  // 2) Match by checkout_session_id
  {
    const { data: existing } = await supabase
      .from("funnel_sessions")
      .select("id, payment_source, stage")
      .eq("checkout_session_id", checkoutSessionId)
      .maybeSingle();

    if (existing) {
      if (existing.stage === "paid" && existing.payment_source === "client") {
        console.log("[backfill] Session already paid via client, skipping:", existing.id);
        return;
      }
      console.log("[backfill] Updating session by checkout_session_id:", existing.id);
      await supabase.from("funnel_sessions").update(paidFields).eq("id", existing.id);
      await insertPaymentFunnelEvent({ ...eventBase, sessionId: existing.id });
      return;
    }
  }

  // 3) Match by agency_slug (most recent checkout-stage session)
  if (resolved.agencySlug) {
    const { data: existing } = await supabase
      .from("funnel_sessions")
      .select("id, payment_source, stage")
      .eq("agency_slug", resolved.agencySlug)
      .in("stage", ["checkout", "checkout_open", "payment_pending", "checkout_started"])
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();

    if (existing) {
      console.log("[backfill] Updating session by agency_slug:", existing.id);
      await supabase.from("funnel_sessions").update(paidFields).eq("id", existing.id);
      await insertPaymentFunnelEvent({ ...eventBase, sessionId: existing.id });
      return;
    }
  }

  // 4) No existing session — create synthetic paid session
  console.log("[backfill] No existing session found, creating synthetic session for", checkoutSessionId);
  const syntheticSession = {
    funnel_type: funnelName,
    funnel_name: funnelName,
    ...paidFields,
    fsid: fsid || null,
    is_demo: false,
    created_at: new Date().toISOString(),
  };

  const { data: newSession, error } = await supabase
    .from("funnel_sessions")
    .insert(syntheticSession)
    .select("id")
    .maybeSingle();
  if (error) {
    console.error("[backfill] Failed to create synthetic session:", error.message);
  } else {
    console.log("[backfill] Synthetic session created for", checkoutSessionId);
    if (newSession?.id) {
      await insertPaymentFunnelEvent({ ...eventBase, sessionId: newSession.id });
    }
  }
}

// ─── handle upgrade checkout completion ──────────────────────────────────────
// Called only when metadata.upgrade_offer === "true".
// Activates new slot by rank, cancels old subscription, updates upgrade_offers.

async function handleUpgradeCompletion(params: {
  session: Stripe.Checkout.Session;
  stripe: Stripe;
  agencyId: string;
  agencyName: string;
  stateSlug: string;
  targetRank: number;
  targetTier: string;
  oldSubscriptionId: string | null;
  newSubscriptionId: string | null;
}): Promise<void> {
  const { session, stripe, agencyId, agencyName, stateSlug, targetRank, targetTier, oldSubscriptionId, newSubscriptionId } = params;
  const now = new Date().toISOString();

  console.log("[webhook:upgrade] Processing upgrade completion:", { agencyId, stateSlug, targetRank, targetTier, oldSubscriptionId, newSubscriptionId });

  // 1. Re-validate slot is still available (or belongs to this agency already)
  const { data: slot } = await supabase
    .from("top25_slots")
    .select("id, rank, is_paid, agency_id, agency_name, state_slug")
    .eq("state_slug", stateSlug)
    .eq("rank", targetRank)
    .maybeSingle();

  if (!slot) {
    console.error("[webhook:upgrade] Slot not found:", { stateSlug, targetRank });
  } else if (slot.is_paid && slot.agency_id !== agencyId) {
    console.error("[webhook:upgrade] SLOT CONFLICT: Rank", targetRank, "in", stateSlug, "is already taken by", slot.agency_name, "— paid checkout but slot unavailable");
  } else {
    // Activate the specific slot by rank — match the normal Top 25 paid activation shape.
    const { data: existingSlot } = await supabase
      .from("top25_slots")
      .select("purchased_at")
      .eq("id", slot.id)
      .maybeSingle();

    const slotUpdate: Record<string, unknown> = {
      is_paid: true,
      is_available: false,
      slot_status: "sold",
      billing_status: "paid",
      agency_id: agencyId,
      agency_name: agencyName,
      updated_at: now,
    };
    if (!existingSlot?.purchased_at) {
      slotUpdate.purchased_at = now;
    }

    const { error: slotError } = await supabase
      .from("top25_slots")
      .update(slotUpdate)
      .eq("id", slot.id);

    if (slotError) {
      console.error("[webhook:upgrade] Failed to activate slot:", slotError.message);
    } else {
      console.log("[webhook:upgrade] Slot activated: rank", targetRank, "state", stateSlug, "agency", agencyName);
    }
  }

  // 2. Mark upgrade_offers as completed
  const { data: offer, error: offerLookupError } = await supabase
    .from("upgrade_offers")
    .select("id, old_subscription_id")
    .eq("checkout_session_id", session.id)
    .maybeSingle();

  if (offerLookupError) {
    console.error("[webhook:upgrade] Failed to lookup upgrade_offer:", offerLookupError.message);
  }

  const resolvedOldSubId = oldSubscriptionId || offer?.old_subscription_id || null;

  if (offer?.id) {
    await supabase
      .from("upgrade_offers")
      .update({
        status: "completed",
        new_subscription_id: newSubscriptionId,
        new_plan_activated_at: now,
        updated_at: now,
      })
      .eq("id", offer.id);
    console.log("[webhook:upgrade] upgrade_offers marked completed:", offer.id);
  } else {
    console.warn("[webhook:upgrade] No upgrade_offer record found for checkout session:", session.id);
  }

  // 3. Cancel old subscription AFTER new one is confirmed active.
  // CRITICAL: Re-validate target slot is owned by this agency before cancelling.
  // If a conflict appeared (rank claimed by someone else), do NOT cancel — we
  // would otherwise leave the agency without any active listing.
  if (resolvedOldSubId && newSubscriptionId && resolvedOldSubId !== newSubscriptionId) {
    const { data: confirmSlot } = await supabase
      .from("top25_slots")
      .select("agency_id, agency_name, slot_status, is_paid")
      .eq("state_slug", stateSlug)
      .eq("rank", targetRank)
      .maybeSingle();

    const slotOwnedByThisAgency = !!confirmSlot
      && confirmSlot.agency_id === agencyId
      && (confirmSlot.is_paid === true || confirmSlot.slot_status === "sold");

    if (!slotOwnedByThisAgency) {
      console.error("[webhook:upgrade] CONFLICT — target slot is NOT owned by upgrading agency. Skipping old-subscription cancel to avoid revenue loss.", { stateSlug, targetRank, agencyId, slotAgencyId: confirmSlot?.agency_id, slotStatus: confirmSlot?.slot_status });

      // Stamp stripe_orders.metadata.activation_status='conflict_needs_review'
      try {
        const { data: existingOrder } = await supabase
          .from("stripe_orders")
          .select("metadata")
          .eq("checkout_session_id", session.id)
          .maybeSingle();
        const conflictMeta = {
          ...((existingOrder?.metadata as Record<string, unknown>) || {}),
          activation_status: "conflict_needs_review",
          activation_review_reason: "upgrade_slot_taken_by_another_agency",
          activation_review_at: now,
        };
        await supabase
          .from("stripe_orders")
          .update({ metadata: conflictMeta, updated_at: now })
          .eq("checkout_session_id", session.id);
      } catch (metaErr) {
        console.error("[webhook:upgrade] Failed to stamp conflict_needs_review metadata:", (metaErr as Error).message);
      }

      // Send admin alert
      EdgeRuntime.waitUntil((async () => {
        try {
          const recipient = Deno.env.get("SMTP_INTERNAL_EMAIL") || "bartu@gappsy.com";
          const html = `
            <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:640px;margin:0 auto;padding:24px;background:#f8fafc">
              <div style="background:#ffffff;border-radius:12px;padding:24px;border:1px solid #fecaca">
                <span style="display:inline-block;background:#fee2e2;color:#991b1b;font-size:11px;font-weight:700;padding:3px 8px;border-radius:4px;margin-bottom:10px">UPGRADE CONFLICT</span>
                <h2 style="color:#991b1b;margin:0 0 6px 0;font-size:18px">Upgrade paid but target slot conflict — old subscription NOT cancelled</h2>
                <p style="color:#475569;font-size:13px;line-height:1.5;margin:6px 0 14px 0">An upgrade payment was captured but the target slot is no longer owned by the upgrading agency. Old subscription was preserved to prevent revenue loss.</p>
                <table style="width:100%;border-collapse:collapse;font-size:13px">
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b;width:180px">Checkout session</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${session.id}</td></tr>
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Upgrading agency</td><td style="padding:6px 0">${agencyName || agencyId}</td></tr>
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">State / Target rank</td><td style="padding:6px 0">${stateSlug} / #${targetRank}</td></tr>
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Slot is owned by</td><td style="padding:6px 0">${confirmSlot?.agency_name || confirmSlot?.agency_id || "(unknown)"}</td></tr>
                  <tr><td style="padding:6px 0;color:#64748b">Old subscription (kept)</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${resolvedOldSubId}</td></tr>
                </table>
              </div>
            </div>`;
          await sendEmail({
            to: recipient,
            subject: `UPGRADE CONFLICT: target slot taken - ${agencyName || agencyId} - ${stateSlug} #${targetRank}`,
            html,
          });
        } catch (e) {
          console.error("[webhook:upgrade] Conflict admin email failed:", (e as Error).message);
        }
      })());
    } else {
      try {
        await stripe.subscriptions.cancel(resolvedOldSubId);
        console.log("[webhook:upgrade] Old subscription cancelled:", resolvedOldSubId);

        if (offer?.id) {
          await supabase
            .from("upgrade_offers")
            .update({ old_subscription_cancelled_at: now, updated_at: now })
            .eq("id", offer.id);
        }
      } catch (e) {
        console.error("[webhook:upgrade] Failed to cancel old subscription:", resolvedOldSubId, (e as Error).message);
      }
    }
  } else if (!resolvedOldSubId) {
    console.warn("[webhook:upgrade] No old subscription ID to cancel — skipping cancellation");
  }

  // 4. Admin email is sent by the unified sendAdminSaleEmail() in the main webhook flow.
  // This avoids duplicate, inconsistent admin notifications for upgrade orders.
  console.log("[webhook:upgrade] Slot activation + offer reconciliation complete; admin email handled by unified sale email.", {
    agencyId, stateSlug, targetRank, targetTier, newSubscriptionId, resolvedOldSubId,
  });
}

// ─── handle checkout.session.completed ───────────────────────────────────────

async function handleCheckoutCompleted(
  session: Stripe.Checkout.Session,
  stripe: Stripe
) {
  const metadata = (session.metadata || {}) as Record<string, string>;
  const agencyId = metadata.agencyId || null;
  const agencyName = metadata.agencyName || null;
  const agencySlug = metadata.agencySlug || null;
  const agencyWebsite = metadata.agencyWebsite || null;
  const stateSlug = metadata.stateSlug || metadata.state_slug || null;
  const listingType = metadata.listingType || metadata.funnel || null;
  const isStandardListing = listingType === "standard" || listingType === "other_listing" || listingType === "activation";

  console.log("[webhook] checkout.session.completed", {
    id: session.id,
    mode: session.mode,
    payment_status: session.payment_status,
    agencyId,
    agencySlug,
    listingType,
    stateSlug,
    isStandardListing,
  });

  // ── For standard/$97 listings: resolve agency from DB before writing stripe_orders
  // This ensures agency_id is never blank in the revenue record even when
  // the checkout was opened without a resolved agencyId in metadata.
  let effectiveAgencyId = agencyId;
  let effectiveAgencyName = agencyName;
  let effectiveAgencySlug = agencySlug;
  let effectiveAgencyWebsite = agencyWebsite;
  let unresolvedStandardActivation = false;

  if (isStandardListing && session.payment_status === "paid") {
    console.log("[webhook:resolve] Standard listing paid — resolving agency row:", { agencyId, agencySlug, agencyName, stateSlug });
    const resolved = await resolveOtherAgencyForActivation({
      agencyId,
      agencySlug,
      agencyName,
      stateSlug,
      agencyWebsite,
    });
    if (resolved.resolvedAgencyId) {
      effectiveAgencyId = resolved.resolvedAgencyId;
      effectiveAgencyName = resolved.resolvedAgencyName || agencyName;
      effectiveAgencySlug = resolved.resolvedAgencySlug || agencySlug;
      effectiveAgencyWebsite = resolved.resolvedWebsiteUrl || agencyWebsite;
      console.log("[webhook:resolve] Agency resolved for stripe_orders:", { effectiveAgencyId, effectiveAgencyName });
    } else {
      unresolvedStandardActivation = true;
      console.error("[webhook:resolve] CRITICAL: Standard listing payment — agency could not be resolved. Revenue recorded but listing NOT activated. Session:", session.id, "Metadata:", { agencyId, agencySlug, agencyName, stateSlug, agencyWebsite });
    }
  }

  // ── stripe_orders upsert (revenue record) ─────────────────────────────────
  const rank = metadata.rank ? parseInt(metadata.rank, 10) : null;
  const top25SlotId = metadata.top25SlotId || null;
  const productSummary = productSummaryFromMetadata(metadata);

  // For upgrade orders, enrich metadata with upgrade_offers fields so admin UI
  // can render Order Breakdown without a second lookup. Lookup by
  // checkout_session_id (always written) — never overwrite existing metadata
  // with nulls.
  const enrichedMetadata: Record<string, unknown> = { ...metadata };
  if (unresolvedStandardActivation) {
    enrichedMetadata.activation_status = "needs_review";
    enrichedMetadata.activation_review_reason = "agency_not_resolved";
    enrichedMetadata.activation_review_at = new Date().toISOString();
  }
  if (metadata.upgrade_offer === "true") {
    try {
      const { data: upgradeOfferRow } = await supabase
        .from("upgrade_offers")
        .select("credit_cents, extra_discount_cents, final_upgrade_price_cents, old_subscription_id, target_rank, target_tier")
        .eq("checkout_session_id", session.id)
        .maybeSingle();
      if (upgradeOfferRow) {
        const merge: Record<string, unknown> = {};
        if (upgradeOfferRow.credit_cents != null) merge.credit_cents = String(upgradeOfferRow.credit_cents);
        if (upgradeOfferRow.extra_discount_cents != null) merge.extra_discount_cents = String(upgradeOfferRow.extra_discount_cents);
        if (upgradeOfferRow.final_upgrade_price_cents != null) merge.final_upgrade_price_cents = String(upgradeOfferRow.final_upgrade_price_cents);
        if (upgradeOfferRow.old_subscription_id) merge.old_subscription_id = upgradeOfferRow.old_subscription_id;
        if (upgradeOfferRow.target_rank != null && enrichedMetadata.target_rank == null) merge.target_rank = String(upgradeOfferRow.target_rank);
        if (upgradeOfferRow.target_tier && enrichedMetadata.target_tier == null) merge.target_tier = upgradeOfferRow.target_tier;
        Object.assign(enrichedMetadata, merge);
      }
    } catch (err) {
      console.error("[webhook] upgrade_offers enrichment failed (non-fatal):", err);
    }
  }

  const orderPayload = {
    checkout_session_id: session.id,
    payment_intent_id: typeof session.payment_intent === "string"
      ? session.payment_intent
      : (session.payment_intent as Stripe.PaymentIntent | null)?.id || null,
    customer_id: typeof session.customer === "string"
      ? session.customer
      : (session.customer as Stripe.Customer | null)?.id || null,
    amount_subtotal: session.amount_subtotal,
    amount_total: session.amount_total,
    currency: session.currency,
    payment_status: session.payment_status,
    status: session.payment_status === "paid" ? "completed" : "pending",
    customer_email: session.customer_details?.email || null,
    customer_name: session.customer_details?.name || null,
    checkout_mode: session.mode,
    state_slug: stateSlug,
    funnel_type: listingType || "unknown",
    agency_id: effectiveAgencyId,
    agency_name: effectiveAgencyName,
    source_listing_type: listingType,
    metadata: enrichedMetadata,
    product_summary: productSummary,
    top25_slot_id: top25SlotId,
    top25_rank: rank,
    stripe_created_at: new Date(session.created * 1000).toISOString(),
    paid_at: session.payment_status === "paid" ? new Date().toISOString() : null,
    livemode: session.livemode,
    updated_at: new Date().toISOString(),
    offer_token: metadata.offer_token || null,
    discount_percentage: metadata.discount_percentage ? Number(metadata.discount_percentage) : null,
    discount_amount_cents: metadata.discount_amount_cents ? Number(metadata.discount_amount_cents) : null,
    original_amount_cents: metadata.cart_subtotal_cents ? Number(metadata.cart_subtotal_cents) : null,
    discount_source: metadata.discount_source || null,
  };

  const { error: orderError } = await supabase
    .from("stripe_orders")
    .upsert(orderPayload, { onConflict: "checkout_session_id" });

  if (orderError) {
    console.error("[webhook] stripe_orders upsert error:", orderError.message);
  } else {
    console.log("[webhook] stripe_orders upserted for", session.id, "agency_id:", effectiveAgencyId || "NOT RESOLVED");
  }

  if (unresolvedStandardActivation) {
    EdgeRuntime.waitUntil((async () => {
      try {
        const recipient = Deno.env.get("SMTP_INTERNAL_EMAIL") || "bartu@gappsy.com";
        const amount = session.amount_total
          ? `$${(session.amount_total / 100).toFixed(2)}`
          : "N/A";
        const html = `
          <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:640px;margin:0 auto;padding:24px;background:#f8fafc">
            <div style="background:#ffffff;border-radius:12px;padding:24px;border:1px solid #fecaca">
              <span style="display:inline-block;background:#fee2e2;color:#991b1b;font-size:11px;font-weight:700;padding:3px 8px;border-radius:4px;margin-bottom:10px">NEEDS REVIEW</span>
              <h2 style="color:#991b1b;margin:0 0 6px 0;font-size:18px">Standard listing paid but NOT activated</h2>
              <p style="color:#475569;font-size:13px;line-height:1.5;margin:6px 0 14px 0">A standard listing payment of <strong>${amount}</strong> was captured, but the agency record could not be resolved. Revenue is recorded; listing activation requires manual review.</p>
              <table style="width:100%;border-collapse:collapse;font-size:13px">
                <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b;width:160px">Checkout session</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${session.id}</td></tr>
                <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Agency name</td><td style="padding:6px 0">${agencyName || "(missing)"}</td></tr>
                <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Agency slug</td><td style="padding:6px 0">${agencySlug || "(missing)"}</td></tr>
                <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">State</td><td style="padding:6px 0">${stateSlug || "(missing)"}</td></tr>
                <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Agency website</td><td style="padding:6px 0">${agencyWebsite || "(missing)"}</td></tr>
                <tr><td style="padding:6px 0;color:#64748b">Customer</td><td style="padding:6px 0">${session.customer_details?.email || "N/A"}</td></tr>
              </table>
            </div>
          </div>`;
        await sendEmail({
          to: recipient,
          subject: `NEEDS REVIEW: Standard listing paid but not activated - ${agencyName || "unknown"} - ${session.id}`,
          html,
        });
        console.log("[webhook:email] Unresolved-activation admin alert sent for", session.id);
      } catch (e) {
        console.error("[webhook:email] Unresolved-activation alert FAILED:", (e as Error).message);
      }
    })());
  }

  // ── line items sync ───────────────────────────────────────────────────────
  try {
    const lineItems = await stripe.checkout.sessions.listLineItems(session.id, { limit: 10 });
    if (lineItems.data.length > 0) {
      const entitlementTypes = lineItems.data
        .map((li) => li.description || "listing")
        .filter(Boolean);

      await supabase
        .from("stripe_orders")
        .update({ entitlement_types: entitlementTypes })
        .eq("checkout_session_id", session.id);
    }
  } catch (e) {
    console.error("[webhook] line items sync error:", (e as Error).message);
  }

  // ── CRITICAL: activate paid agency ───────────────────────────────────────
  // Must run on every paid checkout regardless of listing type.
  if (session.payment_status === "paid") {
    const activationSubscriptionId = typeof session.subscription === "string"
      ? session.subscription
      : (session.subscription as Stripe.Subscription | null)?.id || null;
    const reservedSlotId = metadata.reservedSlotId || null;
    const reservedLockStartedAt = metadata.reservedLockStartedAt || null;
    const activationResult = await activateAgency({
      agencyId: effectiveAgencyId,
      stateSlug,
      listingType,
      checkoutSessionId: session.id,
      agencyWebsite: effectiveAgencyWebsite,
      subscriptionId: activationSubscriptionId,
      rank,
      reservedSlotId,
      reservedLockStartedAt,
      top25SlotId: top25SlotId || null,
    });

    if (activationResult.top25NeedsReview) {
      const reviewAt = new Date().toISOString();
      try {
        const { data: existingOrder } = await supabase
          .from("stripe_orders")
          .select("metadata")
          .eq("checkout_session_id", session.id)
          .maybeSingle();
        const reviewMeta = {
          ...((existingOrder?.metadata as Record<string, unknown>) || {}),
          activation_status: "needs_review",
          activation_review_reason: activationResult.top25ReviewReason || "top25_reservation_mismatch_or_expired",
          activation_review_at: reviewAt,
        };
        await supabase
          .from("stripe_orders")
          .update({ metadata: reviewMeta, updated_at: reviewAt })
          .eq("checkout_session_id", session.id);
      } catch (metaErr) {
        console.error("[webhook] Failed to stamp top25 needs_review metadata:", (metaErr as Error).message);
      }

      EdgeRuntime.waitUntil((async () => {
        try {
          const recipient = Deno.env.get("SMTP_INTERNAL_EMAIL") || "bartu@gappsy.com";
          const amount = session.amount_total
            ? `$${(session.amount_total / 100).toFixed(2)}`
            : "N/A";
          const html = `
            <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:640px;margin:0 auto;padding:24px;background:#f8fafc">
              <div style="background:#ffffff;border-radius:12px;padding:24px;border:1px solid #fecaca">
                <span style="display:inline-block;background:#fee2e2;color:#991b1b;font-size:11px;font-weight:700;padding:3px 8px;border-radius:4px;margin-bottom:10px">TOP 25 NEEDS REVIEW</span>
                <h2 style="color:#991b1b;margin:0 0 6px 0;font-size:18px">Top 25 paid but reservation mismatch — slot NOT claimed</h2>
                <p style="color:#475569;font-size:13px;line-height:1.5;margin:6px 0 14px 0">A Top 25 payment of <strong>${amount}</strong> was captured, but the reserved slot was no longer in 'reserved' state when the webhook fired (likely lock expired and another reservation took it). Revenue is recorded; activation needs manual review. No other agency's slot was overwritten.</p>
                <table style="width:100%;border-collapse:collapse;font-size:13px">
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b;width:180px">Reason</td><td style="padding:6px 0;font-family:monospace;font-size:12px">${activationResult.top25ReviewReason || "top25_reservation_mismatch_or_expired"}</td></tr>
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Checkout session</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${session.id}</td></tr>
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Agency</td><td style="padding:6px 0">${effectiveAgencyName || effectiveAgencyId || "(missing)"}</td></tr>
                  <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">State / Rank</td><td style="padding:6px 0">${stateSlug || "(missing)"} / ${rank != null ? "#" + rank : "(missing)"}</td></tr>
                  <tr><td style="padding:6px 0;color:#64748b">Reserved slot id</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${reservedSlotId || "(none — legacy)"}</td></tr>
                </table>
              </div>
            </div>`;
          await sendEmail({
            to: recipient,
            subject: `TOP 25 NEEDS REVIEW: reservation mismatch - ${effectiveAgencyName || effectiveAgencyId} - ${stateSlug} ${rank != null ? "#" + rank : ""}`,
            html,
          });
          console.log("[webhook:email] Top25 needs_review admin alert sent for", session.id);
        } catch (e) {
          console.error("[webhook:email] Top25 needs_review alert FAILED:", (e as Error).message);
        }
      })());
    }
  }

  // ── CRITICAL: admin sale email ────────────────────────────────────────────
  // Sent directly via SMTP — email-center does not handle admin_sale_notification type.
  if (session.payment_status === "paid") {
    const amountFormatted = session.amount_total
      ? `$${(session.amount_total / 100).toFixed(2)}`
      : "N/A";

    const isUpgrade = metadata.upgrade_offer === "true";
    const subscriptionId = typeof session.subscription === "string"
      ? session.subscription
      : (session.subscription as Stripe.Subscription | null)?.id || null;

    // Enrich with subscription renewal info when available
    let renewalAmountCents: number | null = null;
    let renewalInterval: string | null = null;
    if (subscriptionId) {
      try {
        const sub = await stripe.subscriptions.retrieve(subscriptionId, {
          expand: ["items.data.price"],
        });
        const item = sub.items?.data?.[0];
        const price = item?.price;
        if (price) {
          renewalAmountCents = price.unit_amount ?? null;
          if (price.recurring) {
            const cnt = price.recurring.interval_count || 1;
            renewalInterval = cnt > 1
              ? `${cnt} ${price.recurring.interval}s`
              : price.recurring.interval;
          }
        }
      } catch (e) {
        console.error("[webhook:email] Failed to fetch subscription for renewal info:", (e as Error).message);
      }
    }

    // Compute upgrade fields when applicable
    let creditAppliedCents: number | null = null;
    let originalProduct: string | null = null;
    let upgradedToProduct: string | null = null;
    let oldSubscriptionIdForEmail: string | null = null;
    if (isUpgrade) {
      try {
        // Prefer lookup by checkout_session_id (always populated at offer creation time).
        // new_subscription_id may not yet be persisted when this email fires.
        let { data: offer } = await supabase
          .from("upgrade_offers")
          .select("credit_cents, extra_discount_cents, final_upgrade_price_cents, target_tier, target_rank, old_subscription_id")
          .eq("checkout_session_id", session.id)
          .maybeSingle();

        if (!offer && subscriptionId) {
          const fallback = await supabase
            .from("upgrade_offers")
            .select("credit_cents, extra_discount_cents, final_upgrade_price_cents, target_tier, target_rank, old_subscription_id")
            .eq("new_subscription_id", subscriptionId)
            .maybeSingle();
          offer = fallback.data ?? null;
        }

        if (offer) {
          creditAppliedCents = offer.credit_cents ?? null;
          oldSubscriptionIdForEmail = offer.old_subscription_id ?? null;
          originalProduct = "Standard Listing";
          const tierLabel = offer.target_tier === "top25" ? "Top 25" : (offer.target_tier || "Top 25");
          upgradedToProduct = offer.target_rank
            ? `${tierLabel} #${offer.target_rank}`
            : tierLabel;
        } else {
          // Last-resort: fall back to checkout metadata so the email still labels the upgrade.
          if (metadata.target_tier || metadata.target_rank) {
            const tierLabel = metadata.target_tier === "top25" ? "Top 25" : (metadata.target_tier || "Top 25");
            originalProduct = "Standard Listing";
            upgradedToProduct = metadata.target_rank
              ? `${tierLabel} #${metadata.target_rank}`
              : tierLabel;
          }
          oldSubscriptionIdForEmail = metadata.old_subscription_id || null;
        }
      } catch (e) {
        console.error("[webhook:email] Upgrade enrichment failed:", (e as Error).message);
      }
    }

    // Determine upsell source
    const upsellSource = metadata.upsell_source
      || metadata.smart_routing_source
      || metadata.entryPath
      || metadata.discount_source
      || null;

    // Compose warnings
    const warnings: string[] = [];
    if (!effectiveAgencyId) warnings.push("Paid order without resolved agency_id");
    if (isUpgrade && creditAppliedCents == null) warnings.push("Upgrade missing credit_applied info");
    if (isUpgrade && metadata.target_rank && !rank) warnings.push("Upgrade target_rank metadata mismatch");
    if (!stateSlug) warnings.push("Order has no state_slug");

    await sendAdminSaleEmail({
      agencyName: effectiveAgencyName,
      agencyId: effectiveAgencyId,
      stateSlug,
      listingType,
      amountFormatted,
      productSummary,
      checkoutSessionId: session.id,
      customerEmail: session.customer_details?.email || null,
      customerName: session.customer_details?.name || null,
      rank,
      isUpgrade,
      originalAmountCents: metadata.cart_subtotal_cents ? Number(metadata.cart_subtotal_cents) : null,
      discountPercent: metadata.discount_percentage ? Number(metadata.discount_percentage) : null,
      discountAmountCents: metadata.discount_amount_cents ? Number(metadata.discount_amount_cents) : null,
      amountTotalCents: session.amount_total ?? null,
      promoCode: metadata.offer_token || null,
      upsellSource,
      creditAppliedCents,
      originalProduct,
      upgradedToProduct,
      renewalAmountCents,
      renewalInterval,
      subscriptionId,
      warnings,
    });
  }

  // ── Canonical Stripe subscription sync (so revenue admin reflects new sale) ──
  if (session.subscription) {
    try {
      const subId = typeof session.subscription === "string"
        ? session.subscription
        : (session.subscription as Stripe.Subscription).id;
      const fullSub = await stripe.subscriptions.retrieve(subId, {
        expand: ["items.data.price.product", "default_payment_method"],
      });
      await syncStripeSubscription(fullSub, stripe);
    } catch (e) {
      console.error("[webhook:checkout] syncStripeSubscription failed:", (e as Error).message);
    }
  }

  // ── SMART ROUTING: sync lead_funnel_state ────────────────────────────────
  // Update lead funnel state when payment completes from smart routing
  if (session.payment_status === "paid" && effectiveAgencyId) {
    try {
      const isStandardActivation = listingType === 'standard' || listingType === 'activation';

      // Update all lead_funnel_state records for this agency
      const { error: funnelError } = await supabase
        .from('lead_funnel_state')
        .update({
          has_completed_payment: true,
          has_standard_paid: isStandardActivation,
          is_top25_upgrade_eligible: isStandardActivation,
          intent_score: 100,
          last_activity_at: new Date().toISOString(),
          updated_at: new Date().toISOString(),
        })
        .eq('agency_id', effectiveAgencyId);

      if (funnelError) {
        console.error('[webhook] lead_funnel_state sync error:', funnelError.message);
      } else {
        console.log('[webhook] lead_funnel_state synced for agency:', effectiveAgencyId, {
          has_completed_payment: true,
          has_standard_paid: isStandardActivation,
          is_top25_upgrade_eligible: isStandardActivation,
        });
      }

      // Log smart routing payment completion event
      const smartRoutingSource = metadata.smart_routing_source === 'true' ||
                                   metadata.source_listing_type?.includes('smart_route');
      if (smartRoutingSource) {
        await supabase.from('smartlead_link_events').insert({
          agency_id: effectiveAgencyId,
          agency_slug: effectiveAgencySlug || null,
          state_slug: stateSlug,
          lead_email: session.customer_details?.email || null,
          lead_key: metadata.lead_key || null,
          campaign_id: metadata.campaign_id || null,
          campaign_name: metadata.campaign_name || null,
          sequence_name: metadata.sequence_name || null,
          email_step: null,
          email_variant: null,
          smart_link_type: 'payment_completion',
          event_type: 'payment_completed_from_smart_route',
          session_id: null,
          request_ip: null,
          user_agent: null,
          referrer: null,
          is_bot: false,
          is_duplicate: false,
          metadata: {
            checkout_session_id: session.id,
            listing_type: listingType,
            amount: session.amount_total ? session.amount_total / 100 : 0,
            currency: session.currency,
          },
        });
        console.log('[webhook] Smart routing payment completion event logged');
      }
    } catch (e) {
      console.error('[webhook] lead_funnel_state sync exception:', (e as Error).message);
    }
  }

  // ── UPGRADE: handle top25 upgrade completion ─────────────────────────────
  if (session.payment_status === "paid" && metadata.upgrade_offer === "true") {
    const targetRank = metadata.target_rank ? parseInt(metadata.target_rank, 10) : null;
    const targetTier = metadata.target_tier || "standard";
    const oldSubscriptionId = metadata.old_subscription_id || null;
    const newSubscriptionId = typeof session.subscription === "string"
      ? session.subscription
      : (session.subscription as Stripe.Subscription | null)?.id || null;

    if (agencyId && stateSlug && targetRank) {
      await handleUpgradeCompletion({
        session,
        stripe,
        agencyId,
        agencyName: agencyName || "Unknown",
        stateSlug,
        targetRank,
        targetTier,
        oldSubscriptionId,
        newSubscriptionId,
      });
    } else {
      console.error("[webhook:upgrade] Missing required upgrade metadata:", { agencyId, stateSlug, targetRank });
    }
  }

  // ── backfill funnel session (one-time payments) ───────────────────────────
  if (session.mode === "payment" && session.payment_status === "paid") {
    console.log("[webhook] Backfilling funnel session for one-time payment:", session.id);
    await backfillFunnelSession({
      checkoutSessionId: session.id,
      fsid: metadata.fsid || null,
      agencyId,
      agencySlug,
      agencyName,
      stateSlug,
      entryPath: metadata.entryPath || null,
      listingType,
      upsellCardVisual: metadata.upsellCardVisual === "true",
      upsellGetMatched: metadata.upsellGetMatched === "true",
      amountTotal: session.amount_total ? session.amount_total / 100 : null,
      currency: session.currency,
      paymentIntentId: typeof session.payment_intent === "string"
        ? session.payment_intent
        : (session.payment_intent as Stripe.PaymentIntent | null)?.id || null,
    });
  }

  // ── discount_checkout_completed + discount_consumed: when offer_token present ──
  if (session.payment_status === "paid" && metadata.offer_token) {
    let offerDiscountPercentage: number | null = null;
    let offerIntentScore: number | null = null;
    let offerCreatedBy: string | null = null;
    try {
      const { data: offerMeta } = await supabase
        .from("discount_offers")
        .select("discount_type, discount_value, intent_score_at_creation, created_by")
        .eq("token", metadata.offer_token)
        .maybeSingle();
      if (offerMeta) {
        offerDiscountPercentage = offerMeta.discount_type === "percentage"
          ? Math.round(Number(offerMeta.discount_value)) : null;
        offerIntentScore = offerMeta.intent_score_at_creation ?? null;
        offerCreatedBy = offerMeta.created_by || null;
      }
    } catch {}

    const discountMeta = {
      offer_token: metadata.offer_token,
      offer_id: metadata.offer_id || null,
      agency_id: effectiveAgencyId,
      agency_slug: effectiveAgencySlug,
      discount_type: metadata.discount_type || null,
      discount_value: metadata.discount_value || null,
      discount_percentage: offerDiscountPercentage,
      link_variant: offerDiscountPercentage != null ? String(offerDiscountPercentage) : null,
      intent_score_at_creation: offerIntentScore,
      source: offerCreatedBy === "smartlead_export" ? "smartlead" : (metadata.discount_source || "direct"),
      checkout_session_id: session.id,
      amount_total: session.amount_total ? session.amount_total / 100 : null,
      currency: session.currency,
      listing_type: listingType,
    };

    try {
      await supabase.from("funnel_events").insert({
        funnel_type: "discount",
        event_name: "discount_checkout_completed",
        visitor_id: metadata.fsid || session.id,
        agency_id: effectiveAgencyId,
        page_path: "/activation/upgrade",
        metadata: discountMeta,
      });
      console.log("[webhook] discount_checkout_completed event emitted for offer_token:", metadata.offer_token);
    } catch (discErr) {
      console.error("[webhook] discount_checkout_completed insert failed (non-fatal):", (discErr as Error).message);
    }

    // Increment usage_count on the discount_offers row and emit discount_consumed.
    // Idempotency guard: only increment once per Stripe checkout session id.
    try {
      const { data: alreadyConsumed } = await supabase
        .from("funnel_events")
        .select("id")
        .eq("event_name", "discount_consumed")
        .eq("metadata->>checkout_session_id", session.id)
        .maybeSingle();

      if (alreadyConsumed) {
        console.log("[webhook] discount_consumed already recorded for session:", session.id, "— skipping increment");
      } else {
      const { data: offerRow, error: offerErr } = await supabase
        .from("discount_offers")
        .select("id, usage_count")
        .eq("token", metadata.offer_token)
        .maybeSingle();

      if (offerErr) {
        console.error("[webhook] discount_offers lookup failed:", offerErr.message);
      } else if (offerRow) {
        const { error: updateErr } = await supabase
          .from("discount_offers")
          .update({
            usage_count: (offerRow.usage_count || 0) + 1,
            updated_at: new Date().toISOString(),
          })
          .eq("id", offerRow.id);

        if (updateErr) {
          console.error("[webhook] discount_offers usage_count increment failed:", updateErr.message);
        } else {
          console.log("[webhook] discount_offers usage_count incremented for:", metadata.offer_token);

          await supabase.from("funnel_events").insert({
            funnel_type: "discount",
            event_name: "discount_consumed",
            visitor_id: metadata.fsid || session.id,
            agency_id: effectiveAgencyId,
            page_path: "/activation/upgrade",
            metadata: {
              ...discountMeta,
              new_usage_count: (offerRow.usage_count || 0) + 1,
            },
          });
          console.log("[webhook] discount_consumed event emitted for offer_token:", metadata.offer_token);
        }
      } else {
        console.warn("[webhook] discount_offers row not found for token:", metadata.offer_token);
      }
      } // end else (not alreadyConsumed)
    } catch (consumeErr) {
      console.error("[webhook] discount_consumed processing failed (non-fatal):", (consumeErr as Error).message);
    }
  }
}

// ─── handle invoice.paid ──────────────────────────────────────────────────────

async function handleInvoicePaid(invoice: Stripe.Invoice, stripe: Stripe) {
  const subscriptionId = typeof invoice.subscription === "string"
    ? invoice.subscription
    : (invoice.subscription as Stripe.Subscription | null)?.id || null;

  console.log("[webhook] invoice.paid", { invoiceId: invoice.id, subscriptionId });

  // Retrieve checkout session via payment_intent if available
  let checkoutSession: Stripe.Checkout.Session | null = null;
  const paymentIntentId = typeof invoice.payment_intent === "string"
    ? invoice.payment_intent
    : (invoice.payment_intent as Stripe.PaymentIntent | null)?.id || null;

  if (paymentIntentId) {
    try {
      const sessions = await stripe.checkout.sessions.list({
        payment_intent: paymentIntentId,
        limit: 1,
      });
      if (sessions.data.length > 0) {
        checkoutSession = sessions.data[0];
      }
    } catch (e) {
      console.error("[webhook] Failed to find checkout session for invoice:", (e as Error).message);
    }
  }

  // Update stripe_orders if we have a checkout session
  if (checkoutSession) {
    await supabase
      .from("stripe_orders")
      .update({
        payment_status: "paid",
        status: "completed",
        invoice_id: invoice.id,
        subscription_id: subscriptionId,
        paid_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      })
      .eq("checkout_session_id", checkoutSession.id);
  }

  // CRITICAL: Activate agency on invoice.paid (covers subscription renewals and first invoice)
  const meta = (checkoutSession?.metadata || {}) as Record<string, string>;
  const rawAgencyId = meta.agencyId || null;
  const stateSlug = meta.stateSlug || null;
  const listingType = meta.listingType || meta.funnel || null;
  const isStandardInvoice = listingType === "standard" || listingType === "other_listing" || listingType === "activation";

  let effectiveAgencyId = rawAgencyId;
  let effectiveAgencyWebsite = meta.agencyWebsite || null;

  // For standard listings, resolve agency if agencyId is blank in metadata
  if (isStandardInvoice && !rawAgencyId) {
    console.log("[webhook:resolve] invoice.paid standard listing — agencyId missing, attempting resolution:", {
      agencySlug: meta.agencySlug,
      agencyName: meta.agencyName,
      stateSlug,
    });
    const resolved = await resolveOtherAgencyForActivation({
      agencyId: rawAgencyId,
      agencySlug: meta.agencySlug || null,
      agencyName: meta.agencyName || null,
      stateSlug,
      agencyWebsite: meta.agencyWebsite || null,
    });
    if (resolved.resolvedAgencyId) {
      effectiveAgencyId = resolved.resolvedAgencyId;
      effectiveAgencyWebsite = resolved.resolvedWebsiteUrl || effectiveAgencyWebsite;
      console.log("[webhook:resolve] invoice.paid — agency resolved:", { effectiveAgencyId });
    } else {
      console.error("[webhook:resolve] CRITICAL: invoice.paid standard listing — agency unresolvable. invoiceId:", invoice.id);
    }
  }

  if (effectiveAgencyId) {
    const invoiceRank = meta.rank ? parseInt(String(meta.rank), 10) : null;
    await activateAgency({
      agencyId: effectiveAgencyId,
      stateSlug,
      listingType,
      checkoutSessionId: checkoutSession?.id || `invoice_${invoice.id}`,
      agencyWebsite: effectiveAgencyWebsite,
      subscriptionId,
      rank: invoiceRank,
    });
  }

  // Canonical Stripe subscription sync on renewal/first invoice
  if (subscriptionId) {
    try {
      const fullSub = await stripe.subscriptions.retrieve(subscriptionId, {
        expand: ["items.data.price.product", "default_payment_method"],
      });
      await syncStripeSubscription(fullSub, stripe);
    } catch (e) {
      console.error("[webhook:invoice] syncStripeSubscription failed:", (e as Error).message);
    }
  }

  // Backfill funnel session
  await backfillFunnelSession({
    checkoutSessionId: checkoutSession?.id || `invoice_${invoice.id}`,
    fsid: meta.fsid || null,
    agencyId,
    agencySlug: meta.agencySlug || null,
    agencyName: meta.agencyName || null,
    stateSlug,
    entryPath: meta.entryPath || null,
    listingType: listingType || "your_agency",
    upsellCardVisual: meta.upsellCardVisual === "true",
    upsellGetMatched: meta.upsellGetMatched === "true",
    amountTotal: invoice.amount_paid ? invoice.amount_paid / 100 : null,
    currency: invoice.currency,
    paymentIntentId,
  });
}

// ─── canonical Stripe subscription sync ─────────────────────────────────────

async function syncStripePrice(price: Stripe.Price): Promise<void> {
  if (!price?.id) return;
  const now = new Date().toISOString();
  const { error } = await supabase
    .from("stripe_prices")
    .upsert(
      {
        stripe_price_id: price.id,
        unit_amount: price.unit_amount ?? null,
        currency: price.currency ?? "usd",
        recurring_interval: price.recurring?.interval ?? null,
        recurring_interval_count: price.recurring?.interval_count ?? null,
        active: price.active ?? true,
        product_id: typeof price.product === "string" ? price.product : (price.product as Stripe.Product | null)?.id ?? null,
        nickname: price.nickname ?? null,
        raw: price as unknown as Record<string, unknown>,
        updated_at: now,
      },
      { onConflict: "stripe_price_id" }
    );
  if (error) console.error("[sync:price]", price.id, error.message);
}

async function syncStripeSubscription(
  subscription: Stripe.Subscription,
  stripe?: Stripe
): Promise<{ subscription_id: string; items_synced: number; price_synced: number; error?: string }> {
  const subscriptionId = subscription.id;
  const now = new Date().toISOString();

  // Re-fetch with expansion if items/prices not present
  let sub: Stripe.Subscription = subscription;
  const firstItem = sub.items?.data?.[0];
  const firstPrice = firstItem?.price;
  const needsExpansion = !firstItem || !firstPrice || typeof firstPrice === "string";
  if (needsExpansion && stripe) {
    try {
      sub = await stripe.subscriptions.retrieve(subscriptionId, {
        expand: ["items.data.price.product", "default_payment_method"],
      });
    } catch (e) {
      console.error("[sync:sub] retrieve failed:", subscriptionId, (e as Error).message);
    }
  }

  const customerId = typeof sub.customer === "string"
    ? sub.customer
    : (sub.customer as Stripe.Customer | null)?.id ?? null;
  const primaryItem = sub.items?.data?.[0];
  const primaryPrice = primaryItem?.price ?? null;
  const primaryPriceId = primaryPrice?.id ?? null;

  let pmBrand: string | null = null;
  let pmLast4: string | null = null;
  const dpm = sub.default_payment_method;
  if (dpm && typeof dpm !== "string") {
    pmBrand = dpm.card?.brand ?? null;
    pmLast4 = dpm.card?.last4 ?? null;
  }

  // Upsert prices first (subscription items reference price_id)
  let priceSynced = 0;
  for (const item of sub.items?.data ?? []) {
    if (item.price && typeof item.price !== "string") {
      await syncStripePrice(item.price);
      priceSynced += 1;
    }
  }

  // Upsert subscription row.
  // Schema has UNIQUE(customer_id) — must dedupe by customer.
  // Strategy: if a row exists for this customer with a DIFFERENT subscription_id, update it
  // to point to the latest subscription (the same customer can only have one row).
  if (customerId) {
    const { data: existing } = await supabase
      .from("stripe_subscriptions")
      .select("id, subscription_id")
      .eq("customer_id", customerId)
      .maybeSingle();

    const row = {
      customer_id: customerId,
      subscription_id: subscriptionId,
      price_id: primaryPriceId,
      status: sub.status as never,
      current_period_start: sub.current_period_start ?? null,
      current_period_end: sub.current_period_end ?? null,
      cancel_at_period_end: !!sub.cancel_at_period_end,
      payment_method_brand: pmBrand,
      payment_method_last4: pmLast4,
      updated_at: now,
    };

    if (existing) {
      const { error } = await supabase
        .from("stripe_subscriptions")
        .update(row)
        .eq("id", existing.id);
      if (error) {
        console.error("[sync:sub] update failed:", subscriptionId, error.message);
        return { subscription_id: subscriptionId, items_synced: 0, price_synced: priceSynced, error: error.message };
      }
    } else {
      const { error } = await supabase
        .from("stripe_subscriptions")
        .insert({ ...row, created_at: now });
      if (error) {
        console.error("[sync:sub] insert failed:", subscriptionId, error.message);
        return { subscription_id: subscriptionId, items_synced: 0, price_synced: priceSynced, error: error.message };
      }
    }
  } else {
    console.warn("[sync:sub] no customer_id, skipping subscriptions row:", subscriptionId);
  }

  // Upsert items
  let itemsSynced = 0;
  const seenItemIds: string[] = [];
  for (const item of sub.items?.data ?? []) {
    if (!item?.id) continue;
    seenItemIds.push(item.id);
    const itemPriceId = typeof item.price === "string" ? item.price : item.price?.id ?? null;
    const { error } = await supabase
      .from("stripe_subscription_items")
      .upsert(
        {
          stripe_subscription_item_id: item.id,
          subscription_id: subscriptionId,
          price_id: itemPriceId,
          quantity: item.quantity ?? 1,
          active: true,
          updated_at: now,
        },
        { onConflict: "stripe_subscription_item_id" }
      );
    if (error) console.error("[sync:item]", item.id, error.message);
    else itemsSynced += 1;
  }

  // Mark items removed from this subscription as inactive
  if (seenItemIds.length > 0) {
    await supabase
      .from("stripe_subscription_items")
      .update({ active: false, updated_at: now })
      .eq("subscription_id", subscriptionId)
      .not("stripe_subscription_item_id", "in", `(${seenItemIds.map((id) => `"${id}"`).join(",")})`);
  }

  return { subscription_id: subscriptionId, items_synced: itemsSynced, price_synced: priceSynced };
}

// ─── handle subscription changes ─────────────────────────────────────────────

async function handleSubscriptionChange(subscription: Stripe.Subscription, stripe?: Stripe) {
  const subscriptionId = subscription.id;
  const status = subscription.status;
  const currentPeriodEnd = subscription.current_period_end;

  console.log("[webhook] subscription change:", { subscriptionId, status });

  await supabase
    .from("stripe_orders")
    .update({
      subscription_id: subscriptionId,
      payment_status: status === "active" ? "paid" : status,
      status: status === "active" ? "completed" : status === "canceled" ? "canceled" : "pending",
      current_period_end: currentPeriodEnd,
      updated_at: new Date().toISOString(),
    })
    .eq("subscription_id", subscriptionId);

  // Canonical sync into stripe_subscriptions / items / prices
  try {
    await syncStripeSubscription(subscription, stripe);
  } catch (e) {
    console.error("[webhook] syncStripeSubscription failed:", subscriptionId, (e as Error).message);
  }
}

// ─── refund / dispute helpers ────────────────────────────────────────────────

async function lookupOrderByCharge(params: {
  chargeId?: string | null;
  paymentIntentId?: string | null;
  checkoutSessionId?: string | null;
}): Promise<{ orderId: number | null; agencyId: string | null; subscriptionId: string | null }> {
  let q = supabase.from("stripe_orders").select("id, agency_id, subscription_id").limit(1);
  if (params.checkoutSessionId) {
    const { data } = await q.eq("checkout_session_id", params.checkoutSessionId).maybeSingle();
    if (data) return { orderId: data.id, agencyId: data.agency_id, subscriptionId: data.subscription_id };
  }
  if (params.paymentIntentId) {
    const { data } = await supabase
      .from("stripe_orders")
      .select("id, agency_id, subscription_id")
      .eq("payment_intent_id", params.paymentIntentId)
      .maybeSingle();
    if (data) return { orderId: data.id, agencyId: data.agency_id, subscriptionId: data.subscription_id };
  }
  return { orderId: null, agencyId: null, subscriptionId: null };
}

async function sendAdminRefundOrDisputeEmail(params: {
  kind: "refund_processed" | "dispute_opened" | "dispute_lost" | "dispute_won";
  amountCents: number;
  currency: string;
  agencyId: string | null;
  orderId: number | null;
  stripeId: string;
  reason?: string | null;
  status?: string | null;
}): Promise<void> {
  try {
    const recipient = Deno.env.get("SMTP_INTERNAL_EMAIL") || "bartu@gappsy.com";
    const fmt = `$${(params.amountCents / 100).toFixed(2)}`;
    const labels: Record<typeof params.kind, string> = {
      refund_processed: "Refund processed",
      dispute_opened: "Dispute opened",
      dispute_lost: "Dispute LOST",
      dispute_won: "Dispute won",
    };
    const colors: Record<typeof params.kind, string> = {
      refund_processed: "#b45309",
      dispute_opened: "#b91c1c",
      dispute_lost: "#7f1d1d",
      dispute_won: "#15803d",
    };
    const subject = `${labels[params.kind]} - ${fmt} - ${params.stripeId}`;
    const baseUrl = Deno.env.get("PUBLIC_BASE_URL") || "https://www.gappsy.com";
    const adminUrl = `${baseUrl}/wp-admin/stripe?tab=refunds-disputes`;

    const html = `
      <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:640px;margin:0 auto;padding:24px;background:#f8fafc">
        <div style="background:#ffffff;border-radius:12px;padding:24px;border:1px solid #e2e8f0">
          <h2 style="color:${colors[params.kind]};margin:0 0 12px 0;font-size:20px">${labels[params.kind]}</h2>
          <table style="width:100%;border-collapse:collapse;font-size:13px">
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b;width:160px">Amount</td><td style="padding:6px 0;font-weight:600">${fmt} ${params.currency.toUpperCase()}</td></tr>
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Stripe ID</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${params.stripeId}</td></tr>
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Order ID</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${params.orderId ?? "N/A"}</td></tr>
            <tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Agency ID</td><td style="padding:6px 0;font-family:monospace;font-size:11px">${params.agencyId ?? "N/A"}</td></tr>
            ${params.reason ? `<tr style="border-bottom:1px solid #eef2f7"><td style="padding:6px 0;color:#64748b">Reason</td><td style="padding:6px 0">${params.reason}</td></tr>` : ""}
            ${params.status ? `<tr><td style="padding:6px 0;color:#64748b">Status</td><td style="padding:6px 0">${params.status}</td></tr>` : ""}
          </table>
          <div style="margin-top:18px"><a href="${adminUrl}" style="display:inline-block;background:#0A1735;color:#fff;text-decoration:none;font-weight:600;font-size:12px;padding:8px 14px;border-radius:6px">Open Refunds & Disputes</a></div>
        </div>
      </div>
    `;
    await sendEmail({ to: recipient, subject, html });
  } catch (e) {
    console.error("[webhook:email] refund/dispute email FAILED:", (e as Error).message);
  }
}

async function handleChargeRefunded(charge: Stripe.Charge): Promise<void> {
  const refunds = charge.refunds?.data ?? [];
  const link = await lookupOrderByCharge({
    chargeId: charge.id,
    paymentIntentId: typeof charge.payment_intent === "string" ? charge.payment_intent : null,
  });

  for (const refund of refunds) {
    const row = {
      stripe_refund_id: refund.id,
      stripe_charge_id: charge.id,
      stripe_payment_intent_id: typeof charge.payment_intent === "string" ? charge.payment_intent : null,
      stripe_order_id: link.orderId,
      stripe_subscription_id: link.subscriptionId,
      agency_id: link.agencyId,
      amount_cents: refund.amount ?? 0,
      currency: refund.currency ?? charge.currency ?? "usd",
      status: refund.status ?? null,
      reason: refund.reason ?? null,
      metadata: refund.metadata ?? {},
      updated_at: new Date().toISOString(),
    };

    const { error } = await supabase
      .from("stripe_refunds")
      .upsert(row, { onConflict: "stripe_refund_id" });

    if (error) {
      console.error("[webhook:refund] upsert failed:", error.message, refund.id);
      continue;
    }

    if (refund.status === "succeeded") {
      await sendAdminRefundOrDisputeEmail({
        kind: "refund_processed",
        amountCents: refund.amount ?? 0,
        currency: refund.currency ?? "usd",
        agencyId: link.agencyId,
        orderId: link.orderId,
        stripeId: refund.id,
        reason: refund.reason ?? null,
        status: refund.status ?? null,
      });
    }
  }
}

async function handleRefundEvent(refund: Stripe.Refund): Promise<void> {
  const chargeId = typeof refund.charge === "string" ? refund.charge : refund.charge?.id ?? null;
  const piId = typeof refund.payment_intent === "string" ? refund.payment_intent : refund.payment_intent?.id ?? null;
  const link = await lookupOrderByCharge({ chargeId, paymentIntentId: piId });

  const row = {
    stripe_refund_id: refund.id,
    stripe_charge_id: chargeId,
    stripe_payment_intent_id: piId,
    stripe_order_id: link.orderId,
    stripe_subscription_id: link.subscriptionId,
    agency_id: link.agencyId,
    amount_cents: refund.amount ?? 0,
    currency: refund.currency ?? "usd",
    status: refund.status ?? null,
    reason: refund.reason ?? null,
    metadata: refund.metadata ?? {},
    updated_at: new Date().toISOString(),
  };

  const { error } = await supabase
    .from("stripe_refunds")
    .upsert(row, { onConflict: "stripe_refund_id" });

  if (error) {
    console.error("[webhook:refund] upsert failed:", error.message, refund.id);
    return;
  }

  if (refund.status === "succeeded") {
    await sendAdminRefundOrDisputeEmail({
      kind: "refund_processed",
      amountCents: refund.amount ?? 0,
      currency: refund.currency ?? "usd",
      agencyId: link.agencyId,
      orderId: link.orderId,
      stripeId: refund.id,
      reason: refund.reason ?? null,
      status: refund.status ?? null,
    });
  }
}

async function handleDisputeEvent(
  dispute: Stripe.Dispute,
  phase: "created" | "updated" | "closed"
): Promise<void> {
  const chargeId = typeof dispute.charge === "string" ? dispute.charge : dispute.charge?.id ?? null;
  const piId = typeof dispute.payment_intent === "string" ? dispute.payment_intent : dispute.payment_intent?.id ?? null;
  const link = await lookupOrderByCharge({ chargeId, paymentIntentId: piId });

  const status = dispute.status ?? null;
  const won = status === "won";
  const lost = status === "lost";
  const evidenceDueBy = dispute.evidence_details?.due_by
    ? new Date(dispute.evidence_details.due_by * 1000).toISOString()
    : null;

  const row = {
    stripe_dispute_id: dispute.id,
    stripe_charge_id: chargeId,
    stripe_payment_intent_id: piId,
    stripe_order_id: link.orderId,
    stripe_subscription_id: link.subscriptionId,
    agency_id: link.agencyId,
    amount_cents: dispute.amount ?? 0,
    currency: dispute.currency ?? "usd",
    reason: dispute.reason ?? null,
    status,
    evidence_due_by: evidenceDueBy,
    won,
    metadata: dispute.metadata ?? {},
    updated_at: new Date().toISOString(),
  };

  const { error } = await supabase
    .from("stripe_disputes")
    .upsert(row, { onConflict: "stripe_dispute_id" });

  if (error) {
    console.error("[webhook:dispute] upsert failed:", error.message, dispute.id);
    return;
  }

  if (phase === "created") {
    await sendAdminRefundOrDisputeEmail({
      kind: "dispute_opened",
      amountCents: dispute.amount ?? 0,
      currency: dispute.currency ?? "usd",
      agencyId: link.agencyId,
      orderId: link.orderId,
      stripeId: dispute.id,
      reason: dispute.reason ?? null,
      status,
    });
  } else if (phase === "closed" || lost || won) {
    await sendAdminRefundOrDisputeEmail({
      kind: lost ? "dispute_lost" : won ? "dispute_won" : "dispute_opened",
      amountCents: dispute.amount ?? 0,
      currency: dispute.currency ?? "usd",
      agencyId: link.agencyId,
      orderId: link.orderId,
      stripeId: dispute.id,
      reason: dispute.reason ?? null,
      status,
    });
  }
}

// ─── main handler ─────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const stripeSecret = Deno.env.get("STRIPE_SECRET_KEY");
    const webhookSecret = Deno.env.get("STRIPE_WEBHOOK_SECRET");

    if (!stripeSecret || !webhookSecret) {
      console.error("[webhook] Missing Stripe configuration");
      return new Response(
        JSON.stringify({ error: "Stripe not configured" }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const stripe = new Stripe(stripeSecret, { apiVersion: "2024-11-20.acacia" });

    const body = await req.text();
    const sig = req.headers.get("stripe-signature");

    if (!sig) {
      return new Response(
        JSON.stringify({ error: "Missing stripe-signature header" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    let event: Stripe.Event;
    try {
      event = await stripe.webhooks.constructEventAsync(body, sig, webhookSecret);
    } catch (err) {
      console.error("[webhook] Signature verification failed:", (err as Error).message);
      return new Response(
        JSON.stringify({ error: "Webhook signature verification failed" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    console.log("[webhook] Event:", event.type, event.id);

    switch (event.type) {
      case "checkout.session.completed":
        await handleCheckoutCompleted(
          event.data.object as Stripe.Checkout.Session,
          stripe
        );
        break;

      case "invoice.paid":
        await handleInvoicePaid(event.data.object as Stripe.Invoice, stripe);
        break;

      case "customer.subscription.created":
      case "customer.subscription.updated":
      case "customer.subscription.deleted":
        await handleSubscriptionChange(event.data.object as Stripe.Subscription, stripe);
        break;

      case "charge.refunded":
        await handleChargeRefunded(event.data.object as Stripe.Charge);
        break;

      case "refund.created":
      case "refund.updated":
      case "charge.refund.updated":
        await handleRefundEvent(event.data.object as Stripe.Refund);
        break;

      case "charge.dispute.created":
        await handleDisputeEvent(event.data.object as Stripe.Dispute, "created");
        break;

      case "charge.dispute.updated":
        await handleDisputeEvent(event.data.object as Stripe.Dispute, "updated");
        break;

      case "charge.dispute.closed":
        await handleDisputeEvent(event.data.object as Stripe.Dispute, "closed");
        break;

      default:
        console.log("[webhook] Unhandled event type:", event.type);
    }

    return new Response(
      JSON.stringify({ received: true, type: event.type }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("[webhook] Unhandled error:", error);
    return new Response(
      JSON.stringify({ error: "Internal server error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
