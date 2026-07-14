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

const TOKEN_ALPHABET = "ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";

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

  console.log("[vendorFeatureActivation] checkout.session.completed", {
    sessionId: session.id, onboardingSessionId, matchedToolId, discoveredToolId,
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

  const { data: vendorSub, error: vendorSubError } = await supabase
    .from("vendor_feature_subscriptions")
    .update({
      status: "active",
      stripe_subscription_id: subscriptionId || null,
      stripe_customer_id: typeof session.customer === "string" ? session.customer : session.customer?.id || null,
      stripe_price_id: priceId,
      current_period_end: currentPeriodEnd,
      featured_until: currentPeriodEnd,
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
    await supabase
      .from("tools")
      .update({ featured: true, featured_until: currentPeriodEnd, vendor_subscription_id: vendorSub.id })
      .eq("id", matchedToolId);
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
  });

  if (onboardingSessionId) {
    await supabase
      .from("vendor_onboarding_sessions")
      .update({ status: "checkout_completed", stripe_subscription_id: subscriptionId || null, updated_at: new Date().toISOString() })
      .eq("id", onboardingSessionId);
    await supabase.from("vendor_funnel_events").insert({
      onboarding_session_id: onboardingSessionId,
      event_name: "checkout_completed",
      metadata: { stripe_checkout_session_id: session.id },
    });
  }
}

// customer.subscription.updated/deleted — keeps featured_until / tools.featured
// in sync with the subscription's actual lifecycle (renewal, past_due, cancel).
export async function handleVendorSubscriptionChange(supabase: SupabaseClient, subscription: Stripe.Subscription) {
  const metadata = (subscription.metadata || {}) as Partial<VendorCheckoutMetadata>;
  if (metadata.funnel_type !== "feature_my_product") return;

  const status = subscription.status;
  const mapped = status === "active" ? "active" : status === "past_due" ? "past_due" : status === "canceled" || status === "unpaid" ? "canceled" : "active";
  const currentPeriodEnd = new Date(subscription.current_period_end * 1000).toISOString();

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
      .update({ featured: mapped === "active", featured_until: mapped === "active" ? currentPeriodEnd : null })
      .eq("id", vendorSub.tool_id);
  }
}
