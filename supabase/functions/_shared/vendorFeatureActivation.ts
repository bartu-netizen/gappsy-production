// Feature My Product — post-checkout activation. Called from stripe-webhook's
// handleCheckoutCompleted/handleSubscriptionChange when metadata.funnel_type
// === "feature_my_product", kept in its own module so the existing
// agency-activation code paths in stripe-webhook/index.ts stay untouched.
//
// Never auto-publishes a tool: for a brand-new product this only moves the
// discovered_tools candidate into the existing approved_for_crawl -> crawl_jobs
// -> draft pipeline (drainCrawlQueue), which produces an UNPUBLISHED draft.
// Editorial review still gates the eventual publish, exactly like every other
// discovery-sourced tool.
// deno-lint-ignore-file no-explicit-any
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import type Stripe from "npm:stripe@17.7.0";
import { validateCrawlUrl } from "./crawlUrlSafety.ts";
import { drainCrawlQueue } from "./crawlRunner.ts";
import { sendEmail } from "./emailClient.ts";
import { syncSmartleadAfterPurchase } from "./smartleadSync.ts";

const TOKEN_ALPHABET = "ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";

// TEMPORARY, per explicit request: domain-ownership verification (meta
// tag/DNS/file — see FeatureMyProductVerifyPage.tsx) is switched off for
// now. New ownership tokens are created pre-verified below, so the verify
// page shows "Ownership verified" immediately and /vendor/claim links the
// account right away, without the vendor ever touching their own site.
// Flip this back to false to re-enable the real check — nothing else needs
// to change, since the entire verify/claim UI already handles both an
// already-verified and a not-yet-verified token identically.
const SKIP_OWNERSHIP_VERIFICATION = true;

// Mirrors sendAdminSaleEmail's role for agency-listing sales (stripe-webhook
// /index.ts) — that one never fires for feature_my_product checkouts (the
// webhook returns right after activateVendorFeatureSubscription), so a $29
// claim or Growth subscription previously produced no admin notification at
// all. Deliberately a separate, simpler function rather than generalizing
// sendAdminSaleEmail itself — that one's shape (rank/state/promo/Top25 deep
// links) is agency-specific and doesn't apply here.
const VENDOR_SALE_EMAIL_RECIPIENT = "bartu@gappsy.com";
const VENDOR_CLAIM_AMOUNT_CENTS = 2900;
const VENDOR_GROWTH_AMOUNT_CENTS: Record<string, number> = { month: 8900, year: 69900 };

async function sendVendorSaleEmail(
  supabase: SupabaseClient,
  params: {
    onboardingSessionId: string | null;
    matchedToolId: string | null;
    discoveredToolId: string | null;
    contactEmail: string;
    product: "claim" | "growth";
    billingInterval: "one_time" | "month" | "year";
  },
) {
  try {
    let toolName = "Unknown product";
    let toolSlug: string | null = null;
    if (params.matchedToolId) {
      const { data } = await supabase.from("tools").select("name, slug").eq("id", params.matchedToolId).maybeSingle();
      if (data) {
        toolName = data.name;
        toolSlug = data.slug;
      }
    } else if (params.discoveredToolId) {
      const { data } = await supabase.from("discovered_tools").select("name").eq("id", params.discoveredToolId).maybeSingle();
      if (data?.name) toolName = data.name;
    }

    const amountCents = params.product === "claim" ? VENDOR_CLAIM_AMOUNT_CENTS : VENDOR_GROWTH_AMOUNT_CENTS[params.billingInterval] ?? null;
    const amountLabel = amountCents != null ? `$${(amountCents / 100).toFixed(2)}` : "unknown amount";
    const productLabel = params.product === "claim"
      ? "Claim & Verify (one-time)"
      : `Growth (${params.billingInterval === "year" ? "yearly" : "monthly"})`;
    const baseUrl = Deno.env.get("PUBLIC_BASE_URL") || "https://gappsy.com";
    const adminLink = params.onboardingSessionId
      ? `${baseUrl}/wp-admin/vendor-monetization?id=${params.onboardingSessionId}`
      : `${baseUrl}/wp-admin/vendor-monetization`;
    const toolLink = toolSlug ? `${baseUrl}/tools/${toolSlug}` : null;

    await sendEmail({
      to: Deno.env.get("SMTP_INTERNAL_EMAIL") || VENDOR_SALE_EMAIL_RECIPIENT,
      subject: `New software sale: ${productLabel} — ${toolName}`,
      text: [
        `Product: ${productLabel}`,
        `Amount: ${amountLabel}`,
        `Tool: ${toolName}`,
        `Customer: ${params.contactEmail}`,
        "",
        `Admin: ${adminLink}`,
        toolLink ? `Live listing: ${toolLink}` : null,
      ].filter((line): line is string => line !== null).join("\n"),
    });
  } catch (err) {
    // A failed notification email must never break activation itself.
    console.error("[vendorFeatureActivation] failed to send sale notification email:", err);
  }
}

function generateSecureToken(length = 32): string {
  const bytes = new Uint8Array(length);
  crypto.getRandomValues(bytes);
  let token = "";
  for (let i = 0; i < length; i++) token += TOKEN_ALPHABET[bytes[i] % TOKEN_ALPHABET.length];
  return token;
}

export interface VendorCheckoutMetadata {
  funnel_type: string;
  onboarding_session_id: string;
  matched_tool_id?: string;
  discovered_tool_id?: string;
  contact_email: string;
  product?: "claim" | "growth";
  billing_interval?: "one_time" | "month" | "year";
}

// Creates the crawl_jobs row for a newly-approved candidate, mirroring
// admin-crawl-jobs/index.ts's "start" action insert exactly (kept in sync by
// hand since that function is admin-session-gated and can't be called
// server-to-server from a webhook).
async function enqueueCrawlForCandidate(supabase: SupabaseClient, candidateId: string, officialWebsite: string, actorLabel: string) {
  const urlCheck = validateCrawlUrl(officialWebsite);
  if (!urlCheck.ok) {
    console.error("[vendorFeatureActivation] candidate URL failed crawl validation, skipping auto-crawl:", candidateId, urlCheck.reason);
    return;
  }
  const { data: settings } = await supabase.from("crawl_settings").select("lease_seconds").eq("id", true).maybeSingle();
  const leaseSeconds = settings?.lease_seconds ?? 240;
  const nowIso = new Date().toISOString();
  const { error } = await supabase.from("crawl_jobs").insert({
    discovery_candidate_id: candidateId,
    requested_url: officialWebsite,
    normalized_url: urlCheck.normalizedUrl,
    status: "starting",
    started_at: nowIso,
    worker_id: actorLabel,
    lease_expires_at: new Date(Date.now() + leaseSeconds * 1000).toISOString(),
    heartbeat_at: nowIso,
    created_by: actorLabel,
  });
  if (error) {
    console.error("[vendorFeatureActivation] failed to enqueue crawl_jobs row:", candidateId, error.message);
    return;
  }
  EdgeRuntime.waitUntil(drainCrawlQueue(supabase, Deno.env.get("SUPABASE_URL") || "", Deno.env.get("SUPABASE_ANON_KEY") || ""));
}

export async function activateVendorFeatureSubscription(supabase: SupabaseClient, session: Stripe.Checkout.Session, stripe: Stripe) {
  const metadata = (session.metadata || {}) as Partial<VendorCheckoutMetadata>;
  const onboardingSessionId = metadata.onboarding_session_id || null;
  const matchedToolId = metadata.matched_tool_id || null;
  const discoveredToolId = metadata.discovered_tool_id || null;
  const contactEmail = metadata.contact_email || session.customer_details?.email || "";
  // Pre-migration in-flight checkouts (started before the claim/growth
  // split shipped) carry no product/billing_interval metadata at all — a
  // recurring session with no product tag is the old single-tier product,
  // i.e. today's "growth".
  const product: "claim" | "growth" = metadata.product === "claim" ? "claim" : "growth";
  const billingInterval: "one_time" | "month" | "year" = metadata.billing_interval || "month";

  console.log("[vendorFeatureActivation] checkout.session.completed", {
    sessionId: session.id, onboardingSessionId, matchedToolId, discoveredToolId, product, billingInterval,
  });

  const subscriptionId = typeof session.subscription === "string" ? session.subscription : session.subscription?.id;
  let currentPeriodEnd: string | null = null;
  let priceId: string | null = null;
  if (subscriptionId) {
    try {
      const subscription = await stripe.subscriptions.retrieve(subscriptionId);
      currentPeriodEnd = new Date(subscription.current_period_end * 1000).toISOString();
      priceId = subscription.items.data[0]?.price?.id || null;
    } catch (err) {
      console.error("[vendorFeatureActivation] failed to retrieve subscription:", subscriptionId, (err as Error).message);
    }
  }

  // Claim is a one-time payment with no ongoing period — it never expires
  // on its own (only a refund/chargeback would undo it, handled like any
  // other charge.refunded event elsewhere in stripe-webhook).
  const isClaim = product === "claim";

  const { data: vendorSub, error: vendorSubError } = await supabase
    .from("vendor_feature_subscriptions")
    .update({
      status: "active",
      stripe_subscription_id: subscriptionId || null,
      stripe_customer_id: typeof session.customer === "string" ? session.customer : session.customer?.id || null,
      stripe_price_id: priceId,
      current_period_end: isClaim ? null : currentPeriodEnd,
      featured_until: isClaim ? null : currentPeriodEnd,
      updated_at: new Date().toISOString(),
    })
    .eq("stripe_checkout_session_id", session.id)
    .select()
    .maybeSingle();

  if (vendorSubError || !vendorSub) {
    console.error("[vendorFeatureActivation] CRITICAL: could not find/update vendor_feature_subscriptions row for session", session.id, vendorSubError?.message);
    return;
  }

  if (matchedToolId) {
    if (isClaim) {
      await supabase.from("tools").update({ claim_paid_at: new Date().toISOString(), vendor_subscription_id: vendorSub.id }).eq("id", matchedToolId);
    } else {
      await supabase
        .from("tools")
        .update({ featured: true, featured_until: currentPeriodEnd, billing_interval: billingInterval, vendor_subscription_id: vendorSub.id })
        .eq("id", matchedToolId);
    }
  }

  if (discoveredToolId) {
    const { data: candidate } = await supabase.from("discovered_tools").select("id, status, official_website").eq("id", discoveredToolId).maybeSingle();
    if (candidate && candidate.status !== "duplicate" && candidate.status !== "rejected" && candidate.status !== "approved_for_crawl" && candidate.status !== "crawled") {
      await supabase
        .from("discovered_tools")
        .update({ status: "approved_for_crawl", approved_by: `vendor_payment:${contactEmail}`, approved_at: new Date().toISOString() })
        .eq("id", discoveredToolId);
      await enqueueCrawlForCandidate(supabase, discoveredToolId, candidate.official_website, `vendor-${contactEmail}`);
    } else if (candidate) {
      console.warn("[vendorFeatureActivation] paid candidate is duplicate/rejected/already queued — not auto-approving, needs manual admin review:", discoveredToolId, candidate.status);
    }
  }

  // Ownership verification only needs to happen once — Growth is gated
  // behind an already-active claim, so a token already exists by the time
  // a Growth checkout completes. Only mint one on claim activation.
  if (isClaim) {
    const ownershipToken = generateSecureToken();
    // Bare token — vendor-ownership-verify/index.ts builds the exact expected
    // string per method (meta tag content, DNS TXT value, file body).
    const verificationTarget = generateSecureToken(16);
    await supabase.from("vendor_ownership_tokens").insert({
      token: ownershipToken,
      onboarding_session_id: onboardingSessionId,
      vendor_subscription_id: vendorSub.id,
      tool_id: matchedToolId,
      contact_email: contactEmail,
      verification_target: verificationTarget,
      verified: SKIP_OWNERSHIP_VERIFICATION,
      // Honest audit trail — this was never a real meta-tag/DNS/file check,
      // so it shouldn't look like one to anyone reviewing this data later
      // (verification_method otherwise only ever holds a real method name
      // set by vendor-ownership-verify/index.ts on an actual passed check).
      ...(SKIP_OWNERSHIP_VERIFICATION ? { verified_at: new Date().toISOString(), verification_method: "auto_skip_temporary" } : {}),
    });
  }

  if (onboardingSessionId) {
    await supabase
      .from("vendor_onboarding_sessions")
      .update({ status: "checkout_completed", stripe_subscription_id: subscriptionId || null, updated_at: new Date().toISOString() })
      .eq("id", onboardingSessionId);
    await supabase.from("vendor_funnel_events").insert({
      onboarding_session_id: onboardingSessionId,
      event_name: "checkout_completed",
      metadata: { stripe_checkout_session_id: session.id, product, billing_interval: billingInterval },
    });
  }

  // Fires once per actual purchase (this function only runs on
  // checkout.session.completed, never on a subscription renewal — those go
  // through handleVendorSubscriptionChange below, which doesn't call this).
  await sendVendorSaleEmail(supabase, {
    onboardingSessionId,
    matchedToolId,
    discoveredToolId,
    contactEmail,
    product,
    billingInterval,
  });

  // Stops the cold-outreach "you're not listed yet" campaign the instant
  // someone converts, and (claim-only buyers) enrolls them in the separate
  // Growth-upsell campaign instead — see smartleadSync.ts for the full
  // rationale. Best-effort: a Smartlead hiccup must never affect the
  // customer's actual purchase/activation.
  if (contactEmail) {
    try {
      const smartleadResult = await syncSmartleadAfterPurchase(contactEmail, product);
      console.log("[vendorFeatureActivation] post-purchase Smartlead sync:", { contactEmail, product, ...smartleadResult });
    } catch (err) {
      console.error("[vendorFeatureActivation] post-purchase Smartlead sync failed:", (err as Error).message);
    }
  }
}

// customer.subscription.updated/deleted — keeps featured_until / tools.featured
// in sync with the subscription's actual lifecycle (renewal, past_due, cancel).
// Only Growth is ever a real Stripe Subscription (Claim is mode: "payment",
// so Stripe never fires this event for it) — no product branching needed.
export async function handleVendorSubscriptionChange(supabase: SupabaseClient, subscription: Stripe.Subscription) {
  const metadata = (subscription.metadata || {}) as Partial<VendorCheckoutMetadata>;
  if (metadata.funnel_type !== "feature_my_product") return;

  const status = subscription.status;
  const mapped = status === "active" ? "active" : status === "past_due" ? "past_due" : status === "canceled" || status === "unpaid" ? "canceled" : "active";
  const currentPeriodEnd = new Date(subscription.current_period_end * 1000).toISOString();
  const billingInterval: "one_time" | "month" | "year" = metadata.billing_interval || "month";

  const { data: vendorSub } = await supabase
    .from("vendor_feature_subscriptions")
    .update({
      status: mapped,
      current_period_end: currentPeriodEnd,
      featured_until: mapped === "active" ? currentPeriodEnd : null,
      canceled_at: mapped === "canceled" ? new Date().toISOString() : null,
      updated_at: new Date().toISOString(),
    })
    .eq("stripe_subscription_id", subscription.id)
    .select("id, tool_id")
    .maybeSingle();

  if (vendorSub?.tool_id) {
    await supabase
      .from("tools")
      .update({
        featured: mapped === "active",
        featured_until: mapped === "active" ? currentPeriodEnd : null,
        billing_interval: mapped === "active" ? billingInterval : null,
      })
      .eq("id", vendorSub.tool_id);
  }
}
