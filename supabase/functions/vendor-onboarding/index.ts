// deno-lint-ignore-file no-explicit-any
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import Stripe from "npm:stripe@17.7.0";
import { normalizeHostname, isMultiTenantHost, validateWebsite } from "../_shared/discoveryValidation.ts";
import { validateCrawlUrl, resolvesToPublicAddress } from "../_shared/crawlUrlSafety.ts";
import { findDuplicate, ingestOne, slugify, type NormalizedCandidate } from "../_shared/discoveryIngest.ts";
import { fetchLightweightMetadata } from "../_shared/lightweightMetadataFetch.ts";
import { extractVisitorContext } from "../_shared/visitorContext.ts";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

const supabase = createClient(Deno.env.get("SUPABASE_URL") ?? "", Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "");

// Server-side price source of truth — the frontend never supplies a price.
// Two products now instead of one: a one-time "claim" fee (required first),
// then a recurring "growth" upgrade (monthly or yearly) that unlocks the
// actual visibility features. ACTIVE_SUBSCRIPTION_STATUSES is shared by
// both — the DB's per-(tool, product) unique indexes are what actually let
// a tool hold one active row of each product at once (see the v2 migration).
const CLAIM_PRICE_LOOKUP_KEY = "feature_my_product_claim_v1";
const CLAIM_PRICE_AMOUNT_CENTS = 2900; // $29 one-time
// Shown on Stripe Checkout itself — must spell out every benefit already
// promised earlier in the /list-your-product funnel (claim step, growth
// upsell copy), or a buyer who lands on Checkout after skimming that promise
// sees a bare "$29, verify your listing" line and feels like they're paying
// for less than they were shown.
const CLAIM_PRODUCT_NAME = "Gappsy Verified Product Listing";
const CLAIM_PRODUCT_DESCRIPTION =
  "One-time fee, not a subscription. Includes: a verified badge on your listing, a profile we build for you (edit anytime), self-serve editing, replying to reviews from your dashboard, and a link to your site from your Gappsy listing.";
const GROWTH_PRICE_LOOKUP_KEYS: Record<"month" | "year", string> = {
  month: "feature_my_product_growth_monthly_v1",
  // Bumped to v2 alongside the $890 -> $699 price drop — Stripe Prices are
  // immutable, so reusing the v1 lookup key would keep resolving to the old
  // $890 Price object (if one was ever created) instead of a new one.
  year: "feature_my_product_growth_yearly_v2",
};
const GROWTH_PRICE_AMOUNT_CENTS: Record<"month" | "year", number> = {
  month: 8900, // $89/mo
  year: 69900, // $699/yr (~35% off vs. paying monthly for 12 months)
};
const ACTIVE_SUBSCRIPTION_STATUSES = ["pending_payment", "active", "past_due", "pending_verification"];
// A visitor who opens Stripe Checkout and never completes it leaves a
// "pending_payment" row behind. Without a cutoff, that row blocks this
// tool/product combination forever — nobody, including the real owner,
// could ever claim or subscribe to it again. Anything older than this
// window is treated as abandoned.
const PENDING_PAYMENT_STALE_MINUTES = 30;

async function getOrCreateClaimPriceId(stripe: Stripe): Promise<string> {
  const existing = await stripe.prices.list({ lookup_keys: [CLAIM_PRICE_LOOKUP_KEY], limit: 1 });
  if (existing.data[0]) {
    // Stripe Prices are immutable but Products aren't — syncing on every
    // call (instead of only at creation) means editing the two consts above
    // and redeploying is enough to update what buyers see on Checkout, with
    // no separate one-off script ever needed.
    const productId = existing.data[0].product as string;
    await stripe.products.update(productId, { name: CLAIM_PRODUCT_NAME, description: CLAIM_PRODUCT_DESCRIPTION });
    return existing.data[0].id;
  }
  const product = await stripe.products.create({
    name: CLAIM_PRODUCT_NAME,
    description: CLAIM_PRODUCT_DESCRIPTION,
  });
  const price = await stripe.prices.create({
    product: product.id,
    unit_amount: CLAIM_PRICE_AMOUNT_CENTS,
    currency: "usd",
    lookup_key: CLAIM_PRICE_LOOKUP_KEY,
  });
  return price.id;
}

async function getOrCreateGrowthPriceId(stripe: Stripe, interval: "month" | "year"): Promise<string> {
  const lookupKey = GROWTH_PRICE_LOOKUP_KEYS[interval];
  const existing = await stripe.prices.list({ lookup_keys: [lookupKey], limit: 1 });
  if (existing.data[0]) return existing.data[0].id;
  const product = await stripe.products.create({
    name: `Gappsy Growth Listing (${interval === "year" ? "Yearly" : "Monthly"})`,
    description: "Priority software directory placement across category, comparison, alternative, and search surfaces.",
  });
  const price = await stripe.prices.create({
    product: product.id,
    unit_amount: GROWTH_PRICE_AMOUNT_CENTS[interval],
    currency: "usd",
    recurring: { interval },
    lookup_key: lookupKey,
  });
  return price.id;
}

function normalizeSubmittedUrl(raw: string): string | null {
  const trimmed = raw.trim();
  if (!trimmed) return null;
  const withProtocol = /^https?:\/\//i.test(trimmed) ? trimmed : `https://${trimmed}`;
  try {
    return new URL(withProtocol).toString();
  } catch {
    return null;
  }
}

function emailDomainMatchesHost(email: string, hostname: string | null): boolean {
  if (!hostname) return false;
  const domain = email.split("@")[1]?.toLowerCase().trim();
  if (!domain) return false;
  return domain === hostname || domain.endsWith(`.${hostname}`) || hostname.endsWith(`.${domain}`);
}

async function fetchToolSummary(toolId: string) {
  const { data: tool } = await supabase
    .from("tools")
    .select("id, slug, name, logo, website, short_description, long_description, status, featured, featured_until")
    .eq("id", toolId)
    .maybeSingle();
  if (!tool) return null;
  const { data: catLink } = await supabase
    .from("tool_category_links")
    .select("category_id, primary_category, tool_categories(name, slug)")
    .eq("tool_id", toolId)
    .order("primary_category", { ascending: false })
    .limit(1)
    .maybeSingle();
  return { ...tool, category: (catLink as any)?.tool_categories?.name || null };
}

// Flips stale "pending_payment" rows to "canceled" so they stop counting as
// active — both for the application-level already_featured/already_claimed
// checks below and for the DB's partial unique index (which would otherwise
// reject a legitimate retry with a duplicate-key error). Run this before
// every read/write that cares whether a subscription is "active".
async function reapStalePendingPayments(toolId: string | null, discoveredToolId: string | null, product: "claim" | "growth") {
  const staleCutoff = new Date(Date.now() - PENDING_PAYMENT_STALE_MINUTES * 60 * 1000).toISOString();
  if (toolId) {
    await supabase
      .from("vendor_feature_subscriptions")
      .update({ status: "canceled", canceled_at: new Date().toISOString() })
      .eq("tool_id", toolId)
      .eq("product", product)
      .eq("status", "pending_payment")
      .lt("created_at", staleCutoff);
  }
  if (discoveredToolId) {
    await supabase
      .from("vendor_feature_subscriptions")
      .update({ status: "canceled", canceled_at: new Date().toISOString() })
      .eq("discovered_tool_id", discoveredToolId)
      .eq("product", product)
      .eq("status", "pending_payment")
      .lt("created_at", staleCutoff);
  }
}

async function findActiveSubscription(toolId: string | null, discoveredToolId: string | null, product: "claim" | "growth") {
  if (toolId) {
    const { data } = await supabase
      .from("vendor_feature_subscriptions")
      .select("id, status")
      .eq("tool_id", toolId)
      .eq("product", product)
      .in("status", ACTIVE_SUBSCRIPTION_STATUSES)
      .maybeSingle();
    if (data) return data;
  }
  if (discoveredToolId) {
    const { data } = await supabase
      .from("vendor_feature_subscriptions")
      .select("id, status")
      .eq("discovered_tool_id", discoveredToolId)
      .eq("product", product)
      .in("status", ACTIVE_SUBSCRIPTION_STATUSES)
      .maybeSingle();
    if (data) return data;
  }
  return null;
}

// Growth is only purchasable once the one-time claim fee has actually
// cleared — checked against vendor_feature_subscriptions directly (not the
// tools.claim_paid_at mirror) so a not-yet-published new product (which has
// no tools row at all yet) is still gated correctly via discovered_tool_id.
async function hasActiveClaim(toolId: string | null, discoveredToolId: string | null): Promise<boolean> {
  const claim = await findActiveSubscription(toolId, discoveredToolId, "claim");
  return Boolean(claim && claim.status === "active");
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  const visitor = extractVisitorContext(req);
  let payload: Record<string, unknown>;
  try {
    payload = await req.json();
  } catch {
    return jsonResponse({ ok: false, error: "Invalid JSON body" }, 400);
  }
  const action = typeof payload.action === "string" ? payload.action : null;

  try {
    switch (action) {
      // ── Step 1+2: normalize the submitted URL and look it up ──────────
      case "normalize_and_match": {
        const rawUrl = typeof payload.raw_url === "string" ? payload.raw_url : "";
        const normalized = normalizeSubmittedUrl(rawUrl);
        if (!normalized) return jsonResponse({ ok: false, error_code: "invalid_url", error: "That doesn't look like a valid website." }, 400);

        const urlCheck = validateCrawlUrl(normalized);
        if (!urlCheck.ok) {
          return jsonResponse({ ok: false, error_code: urlCheck.reason, error: "That URL can't be used — please enter a public website address." }, 400);
        }
        const dnsCheck = await resolvesToPublicAddress(urlCheck.hostname!);
        if (!dnsCheck.ok && dnsCheck.reason === "dns_rebinding_private_ip") {
          return jsonResponse({ ok: false, error_code: dnsCheck.reason, error: "That URL can't be used — please enter a public website address." }, 400);
        }

        const hostname = normalizeHostname(normalized);
        if (!hostname) return jsonResponse({ ok: false, error_code: "invalid_url", error: "That doesn't look like a valid website." }, 400);

        const validation = await validateWebsite(normalized);
        const finalUrl = validation.final_url || urlCheck.normalizedUrl || normalized;
        const duplicateMatch = await findDuplicate(supabase, hostname, slugify(hostname), finalUrl);

        const baseSessionRow = {
          submitted_url: rawUrl.trim(),
          normalized_hostname: hostname,
          normalized_url: finalUrl,
          utm_source: typeof payload.utm_source === "string" ? payload.utm_source : null,
          utm_medium: typeof payload.utm_medium === "string" ? payload.utm_medium : null,
          utm_campaign: typeof payload.utm_campaign === "string" ? payload.utm_campaign : null,
          referrer: typeof payload.referrer === "string" ? payload.referrer : null,
          landing_page: typeof payload.landing_page === "string" ? payload.landing_page : null,
          ip_address: visitor.ip_address,
          user_agent: visitor.user_agent,
        };

        if (duplicateMatch.againstTable === "tools") {
          const tool = await fetchToolSummary(duplicateMatch.id!);
          await reapStalePendingPayments(duplicateMatch.id, null, "growth");
          await reapStalePendingPayments(duplicateMatch.id, null, "claim");
          const activeSub = await findActiveSubscription(duplicateMatch.id, null, "growth");
          const alreadyClaimed = await hasActiveClaim(duplicateMatch.id, null);

          const { data: session } = await supabase
            .from("vendor_onboarding_sessions")
            .insert({
              ...baseSessionRow,
              status: "matched_existing",
              matched_tool_id: duplicateMatch.id,
              match_confidence: isMultiTenantHost(hostname) ? "exact_host_path" : "exact_host",
              is_new_product: false,
            })
            .select("id")
            .single();

          await supabase.from("vendor_funnel_events").insert([
            { onboarding_session_id: session?.id, event_name: "funnel_started", ...utmMeta(baseSessionRow) },
            { onboarding_session_id: session?.id, event_name: "website_submitted", ...utmMeta(baseSessionRow) },
            { onboarding_session_id: session?.id, event_name: "product_match_found", metadata: { tool_id: duplicateMatch.id } },
          ]);

          if (activeSub) {
            return jsonResponse({
              ok: true,
              session_id: session?.id,
              is_new_product: false,
              already_featured: true,
              already_claimed: alreadyClaimed,
              requires_verification_to_manage: true,
              tool: tool ? { name: tool.name, slug: tool.slug, logo: tool.logo } : null,
            });
          }

          return jsonResponse({ ok: true, session_id: session?.id, is_new_product: false, already_featured: false, already_claimed: alreadyClaimed, tool });
        }

        if (duplicateMatch.againstTable === "discovered_tools") {
          const { data: candidate } = await supabase
            .from("discovered_tools")
            .select("id, name, official_website, short_description, logo_url, status")
            .eq("id", duplicateMatch.id)
            .maybeSingle();
          await reapStalePendingPayments(null, duplicateMatch.id, "growth");
          await reapStalePendingPayments(null, duplicateMatch.id, "claim");
          const activeSub = await findActiveSubscription(null, duplicateMatch.id, "growth");
          const alreadyClaimed = await hasActiveClaim(null, duplicateMatch.id);

          const { data: session } = await supabase
            .from("vendor_onboarding_sessions")
            .insert({
              ...baseSessionRow,
              status: "matched_new",
              matched_discovered_tool_id: duplicateMatch.id,
              match_confidence: "exact_host",
              is_new_product: true,
              product_name_input: candidate?.name || null,
              website_input: candidate?.official_website || finalUrl,
            })
            .select("id")
            .single();

          await supabase.from("vendor_funnel_events").insert([
            { onboarding_session_id: session?.id, event_name: "funnel_started", ...utmMeta(baseSessionRow) },
            { onboarding_session_id: session?.id, event_name: "website_submitted", ...utmMeta(baseSessionRow) },
            { onboarding_session_id: session?.id, event_name: "product_match_found", metadata: { discovered_tool_id: duplicateMatch.id, pending: true } },
          ]);

          if (activeSub) {
            return jsonResponse({ ok: true, session_id: session?.id, is_new_product: true, already_featured: true, already_claimed: alreadyClaimed, requires_verification_to_manage: true });
          }

          return jsonResponse({
            ok: true,
            session_id: session?.id,
            is_new_product: true,
            pending_submission: true,
            already_claimed: alreadyClaimed,
            prefill: { name: candidate?.name || "", website: candidate?.official_website || finalUrl, description: candidate?.short_description || null, logo: candidate?.logo_url || null },
          });
        }

        // No match anywhere — genuinely new product.
        const metadata = await fetchLightweightMetadata(finalUrl);
        const { data: session } = await supabase
          .from("vendor_onboarding_sessions")
          .insert({
            ...baseSessionRow,
            status: "matched_new",
            is_new_product: true,
            product_name_input: metadata.title,
            website_input: finalUrl,
          })
          .select("id")
          .single();

        await supabase.from("vendor_funnel_events").insert([
          { onboarding_session_id: session?.id, event_name: "funnel_started", ...utmMeta(baseSessionRow) },
          { onboarding_session_id: session?.id, event_name: "website_submitted", ...utmMeta(baseSessionRow) },
          { onboarding_session_id: session?.id, event_name: "product_not_found" },
        ]);

        return jsonResponse({
          ok: true,
          session_id: session?.id,
          is_new_product: true,
          pending_submission: false,
          already_claimed: false,
          prefill: { name: metadata.title || "", website: finalUrl, description: metadata.description, logo: metadata.faviconUrl || metadata.ogImageUrl },
        });
      }

      // ── "We found a new product" — confirm/edit, then land a lightweight
      // submission record (never runs the full crawler synchronously) ──
      case "confirm_new_product": {
        const sessionId = typeof payload.session_id === "string" ? payload.session_id : "";
        const productName = typeof payload.product_name === "string" ? payload.product_name.trim() : "";
        const website = typeof payload.website === "string" ? payload.website.trim() : "";
        const shortDescriptionInput = typeof payload.short_description === "string" ? payload.short_description.trim() : "";
        if (!sessionId || !productName || !website) return jsonResponse({ ok: false, error: "product_name and website are required" }, 400);

        const { data: session } = await supabase.from("vendor_onboarding_sessions").select("*").eq("id", sessionId).maybeSingle();
        if (!session || !session.is_new_product) return jsonResponse({ ok: false, error: "Session not found or not eligible" }, 404);

        let discoveredToolId = session.matched_discovered_tool_id as string | null;

        if (discoveredToolId) {
          const update: Record<string, string> = { name: productName };
          if (shortDescriptionInput) update.short_description = shortDescriptionInput;
          await supabase.from("discovered_tools").update(update).eq("id", discoveredToolId);
        } else {
          const metadata = await fetchLightweightMetadata(website);
          const { data: provider } = await supabase.from("discovery_providers").select("id").eq("key", "vendor_submission").maybeSingle();
          const candidate: NormalizedCandidate = {
            name: productName,
            officialWebsite: website,
            categoryId: null,
            shortDescription: shortDescriptionInput || metadata.description,
            logoUrl: metadata.faviconUrl || metadata.ogImageUrl,
            sourceUrl: null,
          };
          const outcome = await ingestOne(supabase, candidate, provider?.id || null, null);
          if (!outcome.ok) return jsonResponse({ ok: false, error: outcome.error }, 500);
          discoveredToolId = outcome.id;
        }

        await supabase
          .from("vendor_onboarding_sessions")
          .update({ matched_discovered_tool_id: discoveredToolId, product_name_input: productName, website_input: website, updated_at: new Date().toISOString() })
          .eq("id", sessionId);
        await supabase.from("vendor_funnel_events").insert({ onboarding_session_id: sessionId, event_name: "product_confirmed", metadata: { discovered_tool_id: discoveredToolId } });

        return jsonResponse({ ok: true, discovered_tool_id: discoveredToolId });
      }

      // ── Step 3: contact + ownership confirmation ──────────────────────
      case "submit_contact": {
        const sessionId = typeof payload.session_id === "string" ? payload.session_id : "";
        const email = typeof payload.email === "string" ? payload.email.trim().toLowerCase() : "";
        const name = typeof payload.name === "string" ? payload.name.trim() : null;
        const ownershipConfirmed = payload.ownership_confirmed === true;
        if (!sessionId || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || !ownershipConfirmed) {
          return jsonResponse({ ok: false, error: "A valid business email and ownership confirmation are required." }, 400);
        }

        const { data: session } = await supabase.from("vendor_onboarding_sessions").select("normalized_hostname").eq("id", sessionId).maybeSingle();
        if (!session) return jsonResponse({ ok: false, error: "Session not found" }, 404);

        const domainMatch = emailDomainMatchesHost(email, session.normalized_hostname);
        await supabase
          .from("vendor_onboarding_sessions")
          .update({ contact_email: email, contact_name: name, ownership_confirmed: true, email_domain_matches_website: domainMatch, status: "contact_collected", updated_at: new Date().toISOString() })
          .eq("id", sessionId);
        await supabase.from("vendor_funnel_events").insert({ onboarding_session_id: sessionId, event_name: "email_submitted", metadata: { domain_match: domainMatch } });

        return jsonResponse({ ok: true, email_domain_matches_website: domainMatch });
      }

      // ── Step 3b: does this email already have a Gappsy account? ───────
      // Existence-only check so the contact step can nudge an existing
      // vendor to sign in instead of picking a password for a second
      // account — the actual account (if any) is still only ever created
      // client-side via supabase.auth.signUp(), never here.
      case "check_email_account": {
        const email = typeof payload.email === "string" ? payload.email.trim().toLowerCase() : "";
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
          return jsonResponse({ ok: false, error: "A valid email is required." }, 400);
        }
        const { data: exists, error: lookupError } = await supabase.rpc("check_email_registered", { p_email: email });
        if (lookupError) return jsonResponse({ ok: false, error: "Could not check that email." }, 500);
        return jsonResponse({ ok: true, exists: Boolean(exists) });
      }

      // ── Step 4/5: create the Stripe Checkout session ──────────────────
      case "create_checkout": {
        const sessionId = typeof payload.session_id === "string" ? payload.session_id : "";
        const product: "claim" | "growth" = payload.product === "growth" ? "growth" : "claim";
        const billingInterval: "month" | "year" = payload.billing_interval === "year" ? "year" : "month";

        const { data: session } = await supabase.from("vendor_onboarding_sessions").select("*").eq("id", sessionId).maybeSingle();
        if (!session || !session.contact_email) return jsonResponse({ ok: false, error: "Session not ready for checkout" }, 400);

        await supabase.from("vendor_funnel_events").insert({ onboarding_session_id: sessionId, event_name: "plan_viewed", metadata: { product, billing_interval: billingInterval } });

        await reapStalePendingPayments(session.matched_tool_id, session.matched_discovered_tool_id, product);

        // Growth is only purchasable once the one-time claim fee has cleared.
        if (product === "growth") {
          const claimed = await hasActiveClaim(session.matched_tool_id, session.matched_discovered_tool_id);
          if (!claimed) return jsonResponse({ ok: false, error_code: "claim_required", error: "Claim & Verify your listing before upgrading to Growth." }, 409);
        }

        const existingActive = await findActiveSubscription(session.matched_tool_id, session.matched_discovered_tool_id, product);
        if (existingActive) {
          return jsonResponse({
            ok: false,
            error_code: product === "claim" ? "already_claimed" : "already_subscribed",
            error: product === "claim" ? "This product has already been claimed." : "This product already has an active Growth subscription.",
          }, 409);
        }

        const stripeKey = Deno.env.get("STRIPE_SECRET_KEY");
        if (!stripeKey) return jsonResponse({ ok: false, error: "Billing is not configured" }, 500);
        const stripe = new Stripe(stripeKey, { apiVersion: "2024-11-20.acacia" });

        const { data: subRow, error: subInsertError } = await supabase
          .from("vendor_feature_subscriptions")
          .insert({
            onboarding_session_id: sessionId,
            tool_id: session.matched_tool_id,
            discovered_tool_id: session.matched_discovered_tool_id,
            status: "pending_payment",
            contact_email: session.contact_email,
            product,
            billing_interval: product === "claim" ? "one_time" : billingInterval,
          })
          .select("id")
          .single();
        if (subInsertError) {
          const isDuplicateRace = (subInsertError as { code?: string }).code === "23505";
          return jsonResponse({
            ok: false,
            error_code: isDuplicateRace ? (product === "claim" ? "already_claimed" : "already_subscribed") : "insert_failed",
            error: isDuplicateRace ? (product === "claim" ? "This product has already been claimed." : "This product already has an active Growth subscription.") : subInsertError.message,
          }, isDuplicateRace ? 409 : 500);
        }

        const priceId = product === "claim" ? await getOrCreateClaimPriceId(stripe) : await getOrCreateGrowthPriceId(stripe, billingInterval);
        const baseUrl = Deno.env.get("PUBLIC_BASE_URL") || "https://gappsy.com";
        // Claim success routes to the Growth upsell screen next; Growth
        // success (whichever interval) is the end of the wizard.
        const nextStage = product === "claim" ? "growth_upsell" : "done";
        const successUrl = `${baseUrl}/list-your-product/onboarding?step=success&session_id=${sessionId}&stripe_session_id={CHECKOUT_SESSION_ID}&next=${nextStage}`;
        const cancelUrl = `${baseUrl}/list-your-product/onboarding?step=${product === "claim" ? "claim" : "growth_upsell"}&session_id=${sessionId}&checkout=cancelled`;

        const metadata: Record<string, string> = {
          funnel_type: "feature_my_product",
          onboarding_session_id: sessionId,
          contact_email: session.contact_email,
          product,
          billing_interval: product === "claim" ? "one_time" : billingInterval,
        };
        if (session.matched_tool_id) metadata.matched_tool_id = session.matched_tool_id;
        if (session.matched_discovered_tool_id) metadata.discovered_tool_id = session.matched_discovered_tool_id;

        // Claim is a genuine one-time charge (mode: "payment", no
        // subscription_data) — growth stays a recurring subscription like
        // the original single-tier flow.
        const stripeSession = await stripe.checkout.sessions.create(
          product === "claim"
            ? {
                mode: "payment",
                line_items: [{ price: priceId, quantity: 1 }],
                customer_email: session.contact_email,
                success_url: successUrl,
                cancel_url: cancelUrl,
                metadata,
                custom_text: { submit: { message: "One-time payment — no recurring charge." } },
              }
            : {
                mode: "subscription",
                line_items: [{ price: priceId, quantity: 1 }],
                customer_email: session.contact_email,
                success_url: successUrl,
                cancel_url: cancelUrl,
                metadata,
                subscription_data: { metadata },
                custom_text: { submit: { message: billingInterval === "year" ? "Billed yearly — cancel anytime." : "Billed monthly — cancel anytime." } },
              }
        );

        await supabase.from("vendor_feature_subscriptions").update({ stripe_checkout_session_id: stripeSession.id }).eq("id", subRow.id);
        await supabase.from("vendor_onboarding_sessions").update({ stripe_checkout_session_id: stripeSession.id, status: "checkout_pending", updated_at: new Date().toISOString() }).eq("id", sessionId);
        await supabase.from("vendor_funnel_events").insert({ onboarding_session_id: sessionId, event_name: "checkout_started", metadata: { stripe_checkout_session_id: stripeSession.id, product, billing_interval: billingInterval } });

        return jsonResponse({ ok: true, checkout_url: stripeSession.url });
      }

      // ── Resume / poll for webhook-driven completion ───────────────────
      case "session_status": {
        const sessionId = typeof payload.session_id === "string" ? payload.session_id : "";
        const stripeSessionId = typeof payload.stripe_session_id === "string" ? payload.stripe_session_id : "";
        if (!sessionId && !stripeSessionId) return jsonResponse({ ok: false, error: "session_id or stripe_session_id is required" }, 400);

        const query = supabase.from("vendor_onboarding_sessions").select("*");
        const { data: session } = sessionId ? await query.eq("id", sessionId).maybeSingle() : await query.eq("stripe_checkout_session_id", stripeSessionId).maybeSingle();
        if (!session) return jsonResponse({ ok: false, error: "Session not found" }, 404);

        const { data: subscriptions } = await supabase
          .from("vendor_feature_subscriptions")
          .select("id, status, tool_id, discovered_tool_id, product, billing_interval")
          .eq("onboarding_session_id", session.id)
          .order("created_at", { ascending: false });

        const latest = subscriptions?.[0] || null;
        const claimRow = subscriptions?.find((s) => s.product === "claim") || null;
        const growthRow = subscriptions?.find((s) => s.product === "growth") || null;

        // Looked up by onboarding_session_id (not the latest subscription's
        // id) — the ownership token is only ever created once, during claim
        // activation, and must still resolve after a later Growth checkout
        // round creates its own separate vendor_feature_subscriptions row.
        let ownershipToken: string | null = null;
        const { data: tokenRow } = await supabase.from("vendor_ownership_tokens").select("token, verified").eq("onboarding_session_id", session.id).order("created_at", { ascending: false }).limit(1).maybeSingle();
        ownershipToken = tokenRow?.token || null;

        return jsonResponse({
          ok: true,
          session_status: session.status,
          subscription_status: latest?.status || null,
          tool_id: latest?.tool_id || null,
          discovered_tool_id: latest?.discovered_tool_id || null,
          ownership_token: ownershipToken,
          claim_status: claimRow?.status || null,
          growth_status: growthRow?.status || null,
          growth_billing_interval: growthRow?.billing_interval || null,
        });
      }

      case "track_event": {
        const sessionId = typeof payload.session_id === "string" ? payload.session_id : "";
        const eventName = typeof payload.event_name === "string" ? payload.event_name : "";
        const allowed = ["checkout_abandoned", "verification_started"];
        if (!sessionId || !allowed.includes(eventName)) return jsonResponse({ ok: false, error: "Invalid event" }, 400);
        await supabase.from("vendor_funnel_events").insert({ onboarding_session_id: sessionId, event_name: eventName, metadata: (payload.metadata as Record<string, unknown>) || {} });
        return jsonResponse({ ok: true });
      }

      default:
        return jsonResponse({ ok: false, error: "Unknown action" }, 400);
    }
  } catch (err) {
    console.error("[vendor-onboarding] unhandled error:", (err as Error).message);
    return jsonResponse({ ok: false, error: "Something went wrong. Please try again." }, 500);
  }
});

function utmMeta(row: { utm_source: string | null; utm_medium: string | null; utm_campaign: string | null; referrer: string | null; landing_page: string | null }) {
  return { utm_source: row.utm_source, utm_medium: row.utm_medium, utm_campaign: row.utm_campaign, referrer: row.referrer, landing_page: row.landing_page };
}
