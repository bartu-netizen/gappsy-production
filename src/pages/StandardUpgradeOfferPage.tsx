import { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { getAvailableTop25SlotsForState } from '../lib/top25Slots';
import { getListingProductByTier, getAgencyActivationProduct, getAddonProduct } from '../config/stripe';
import type { ListingTier } from '../config/stripe';
import { reliablePost } from '../utils/trackingTransport';
import { getFsid, getEntryPath, trackAgencyFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';
import { getOfferTokenIfFlow, resolveScopedDiscountForAgency, resolveActiveScopedOfferToken } from '../utils/discountOffer';
import type { DiscountOffer } from '../utils/discountOffer';
import { useFastCheckout } from '../hooks/useFastCheckout';
import { getDiscountedFullCardPrice, formatPrice } from '../utils/discountPricing';
import { extractDiscountContext, trackDiscountCheckoutOpened } from '../utils/discountCheckoutTracking';
import { useNoindex } from '../components/NoindexMeta';
import { trackBeforeNav } from '../utils/trackBeforeNav';

export default function StandardUpgradeOfferPage() {
  useNoindex();
  const navigate = useNavigate();
  const { checkoutData, setCheckoutData, upsells } = useTop25Checkout();
  const { isProcessing, error, setError, launch: launchCheckout } = useFastCheckout();
  const [availableSlots, setAvailableSlots] = useState<{ rank: number; listingTier: ListingTier; originalPrice: number; discountedPrice: number }[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [activeOffer, setActiveOffer] = useState<DiscountOffer | null>(null);
  const [activeOfferToken, setActiveOfferToken] = useState<string | null>(null);
  const [isMobile, setIsMobile] = useState(typeof window !== 'undefined' && window.innerWidth < 768);
  const [stage, setStage] = useState(0);
  const [prefersReducedMotion, setPrefersReducedMotion] = useState(false);
  const [slotLoadStatus, setSlotLoadStatus] = useState<'loading' | 'success' | 'empty_confirmed' | 'timeout' | 'error'>('loading');
  const viewedFiredRef = useRef<string | null>(null);
  const upgradeClickRef = useRef(false);
  const skipClickRef = useRef(false);

  useEffect(() => {
    const onResize = () => setIsMobile(window.innerWidth < 768);
    window.addEventListener('resize', onResize);
    return () => window.removeEventListener('resize', onResize);
  }, []);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const mq = window.matchMedia('(prefers-reduced-motion: reduce)');
    setPrefersReducedMotion(mq.matches);
    const handler = () => setPrefersReducedMotion(mq.matches);
    mq.addEventListener?.('change', handler);
    return () => mq.removeEventListener?.('change', handler);
  }, []);

  const BASE_ACTIVATION = 97;
  const DEFAULT_DISCOUNT_PERCENT = 20;
  const hasActiveOffer = activeOffer !== null;
  const tokenPercent = activeOffer?.discount_type === 'percentage' ? activeOffer.discount_value : null;
  const tokenFixedAmount = activeOffer?.discount_type === 'fixed_amount' ? activeOffer.discount_value : null;
  const discountPercent = tokenPercent ?? DEFAULT_DISCOUNT_PERCENT;
  const discountedActivation = !hasActiveOffer
    ? BASE_ACTIVATION
    : tokenFixedAmount !== null
      ? Math.max(0, Math.round((BASE_ACTIVATION - tokenFixedAmount) * 100) / 100)
      : tokenPercent !== null
        ? getDiscountedFullCardPrice(BASE_ACTIVATION, tokenPercent)
        : BASE_ACTIVATION;
  const hasActivationDiscount = discountedActivation < BASE_ACTIVATION;
  const activationLabel = hasActivationDiscount
    ? `$${formatPrice(discountedActivation)}`
    : `$${BASE_ACTIVATION}`;

  useEffect(() => {
    const agencyId = checkoutData?.agencyId || null;
    const stateSlug = checkoutData?.stateSlug || null;
    const urlToken = getOfferTokenIfFlow(['offer_redirect']);
    resolveScopedDiscountForAgency({
      agencyId,
      stateSlug,
      urlToken,
      allowSessionScopedDiscount: true,
      allowGlobalScopedDiscount: true,
    }).then((resolved) => {
      if (resolved) {
        setActiveOffer(resolved.offer);
        setActiveOfferToken(resolved.token);
      } else {
        setActiveOffer(null);
        setActiveOfferToken(null);
      }
    }).catch(() => { /* non-fatal */ });
  }, [checkoutData?.agencyId, checkoutData?.stateSlug]);


  // STRICT GUARD: Only show for standard listing buyers
  useEffect(() => {
    if (!checkoutData) {
      navigate('/');
      return;
    }

    // Only show for standard listing flow
    if (
      checkoutData.listingType !== 'activation' &&
      checkoutData.listingType !== 'other_listing' &&
      checkoutData.listingType !== 'top25_standard_only_release' &&
      checkoutData.listingTier !== 'activation'
    ) {
      // User is already buying Top-25 or in wrong flow, skip this step
      navigate('/spotlight/confirm');
      return;
    }

    // Fire-and-forget tracking (never block the funnel)
    try {
      reliablePost('funnel-track', {
        funnelType: 'top25',
        eventName: 'page_view',
        stateSlug: checkoutData.stateSlug,
        agencyName: checkoutData.agencyName,
        agencyId: checkoutData.agencyId,
        metadata: {
          page: 'standard_upgrade_offer',
          original_listing_type: checkoutData.listingType,
          source: 'last_chance_upgrade',
        },
      }, 'top25:last_chance_viewed');
    } catch {
      // swallow
    }

    try {
      reliablePost('funnel-track', {
        funnelType: 'activation',
        eventName: 'top25_upsell_viewed',
        stateSlug: checkoutData.stateSlug,
        agencyName: checkoutData.agencyName,
        agencyId: checkoutData.agencyId,
        metadata: {
          page: 'standard_upgrade_offer',
          prev_step: 'standard_listing_selected',
          listing_type: 'standard',
        },
      }, 'top25_upsell_viewed');
    } catch {
      // swallow
    }

  }, [checkoutData, navigate, setCheckoutData]);

  useEffect(() => {
    if (!checkoutData) return;
    if (isLoading) return;

    const fsid = getFsid(false) || '';
    const dedupeKey = `${fsid}|standard_upgrade_offer|${checkoutData.agencyId || ''}|${checkoutData.stateSlug || ''}`;
    if (viewedFiredRef.current === dedupeKey) return;
    viewedFiredRef.current = dedupeKey;

    try {
    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.STANDARD_UPGRADE_OFFER_VIEWED.event_name,
      {
        page: 'standard_upgrade_offer',
        selected_plan: 'standard',
        standard_price: BASE_ACTIVATION,
        agency_id: checkoutData.agencyId || null,
        agency_name: checkoutData.agencyName,
        state_slug: checkoutData.stateSlug,
        state_name: checkoutData.stateName,
        has_discount: hasActiveOffer || discountPercent > 0,
        discount_percent: discountPercent,
        slot_load_status: slotLoadStatus,
        available_slots_count: availableSlots.length,
        offered_positions: availableSlots.map((s, idx) => ({
          position: s.rank,
          listing_tier: s.listingTier,
          original_price: s.originalPrice,
          discounted_price: s.discountedPrice,
          final_price: s.discountedPrice,
          is_recommended: idx === 0,
        })),
      },
      {
        kind: 'page_view',
        stepNumber: FUNNEL_EVENTS.STANDARD_UPGRADE_OFFER_VIEWED.step_number,
        agency_id: checkoutData.agencyId || undefined,
        agency_name: checkoutData.agencyName,
        state_slug: checkoutData.stateSlug,
        state_name: checkoutData.stateName,
      }
    );
    } catch {
      // tracking errors must never block navigation
    }
  }, [checkoutData, isLoading, availableSlots, discountPercent, hasActiveOffer, slotLoadStatus]);

  // Fetch available slots
  useEffect(() => {
    if (!checkoutData?.stateSlug) return;

    const readPersistedRanks = (): number[] | null => {
      try {
        const raw = sessionStorage.getItem('top25:selectedUpgradeRanks');
        if (!raw) return null;
        const parsed = JSON.parse(raw) as { stateSlug?: string; ranks?: number[] };
        if (
          parsed &&
          parsed.stateSlug === checkoutData.stateSlug &&
          Array.isArray(parsed.ranks) &&
          parsed.ranks.length > 0
        ) {
          return parsed.ranks;
        }
      } catch {
        // ignore
      }
      return null;
    };

    const buildFallbackFromRanks = (ranks: number[]) => {
      const sorted = [...ranks].sort((a, b) => a - b);
      return sorted.map((rank, idx) => {
        const listingTier: ListingTier = idx === 0 ? 'premium' : 'priority';
        const product = getListingProductByTier(listingTier);
        const originalPrice = product?.amount ?? 0;
        const discountedPrice = getDiscountedFullCardPrice(originalPrice, discountPercent);
        return { rank, listingTier, originalPrice, discountedPrice };
      });
    };

    const fetchSlots = async () => {
      setIsLoading(true);
      setSlotLoadStatus('loading');

      let result: Awaited<ReturnType<typeof getAvailableTop25SlotsForState>>;
      try {
        result = await Promise.race([
          getAvailableTop25SlotsForState(checkoutData.stateSlug),
          new Promise<never>((_, reject) =>
            setTimeout(() => reject(new Error('slot_fetch_timeout')), 3000)
          ),
        ]);
      } catch (err) {
        const isTimeout = err instanceof Error && err.message === 'slot_fetch_timeout';
        const persistedRanks = readPersistedRanks();
        if (persistedRanks && persistedRanks.length > 0) {
          setAvailableSlots(buildFallbackFromRanks(persistedRanks));
        } else {
          setAvailableSlots([]);
        }
        setSlotLoadStatus(isTimeout ? 'timeout' : 'error');
        setIsLoading(false);
        return;
      }

      const sortedAvailable = [...result.slots].sort((a, b) => a.rank - b.rank);
      let chosen: typeof sortedAvailable = [];

      // STRICT: Reuse the EXACT ranks selected on /activation/upgrade so the
      // funnel stays consistent across steps. Never recompute if we have them.
      const persistedRanks = readPersistedRanks();

      if (persistedRanks && persistedRanks.length > 0) {
        chosen = persistedRanks
          .map(rank => sortedAvailable.find(s => s.rank === rank))
          .filter((s): s is typeof sortedAvailable[number] => Boolean(s));
      }

      if (chosen.length === 0) {
        // Fallback: mirror activation selection logic only when no persisted
        // ranks exist (direct entry / expired session).
        if (sortedAvailable.length === 1) {
          chosen = [sortedAvailable[0]];
        } else if (sortedAvailable.length >= 2) {
          const primarySlot = sortedAvailable.find(s => s.rank === 2) ?? sortedAvailable[0];
          const secondarySlot =
            sortedAvailable.find(s => s.rank === 12 && s.rank !== primarySlot.rank) ??
            sortedAvailable.find(s => s.rank >= primarySlot.rank + 10 && s.rank !== primarySlot.rank) ??
            sortedAvailable.find(s => s.rank !== primarySlot.rank) ??
            sortedAvailable[sortedAvailable.length - 1];
          chosen = secondarySlot && secondarySlot.rank !== primarySlot.rank
            ? [primarySlot, secondarySlot]
            : [primarySlot];
        }
      }

      const orderedChosen = [...chosen].sort((a, b) => a.rank - b.rank);
      const slots = orderedChosen.map((slot, idx) => {
        const listingTier: ListingTier = idx === 0 ? 'premium' : 'priority';
        const product = getListingProductByTier(listingTier);
        const originalPrice = product?.amount ?? 0;
        const discountedPrice = getDiscountedFullCardPrice(originalPrice, discountPercent);

        return {
          rank: slot.rank,
          listingTier,
          originalPrice,
          discountedPrice,
        };
      });

      setAvailableSlots(slots);
      setSlotLoadStatus(slots.length === 0 ? 'empty_confirmed' : 'success');
      setIsLoading(false);
    };

    fetchSlots();
  }, [checkoutData?.stateSlug, discountPercent]);

  const handleUpgrade = async (rank: number, discountedPrice: number) => {
    if (!checkoutData) return;
    if (upgradeClickRef.current) return;
    upgradeClickRef.current = true;
    try {

    const slot = availableSlots.find(s => s.rank === rank);
    const isRecommended = availableSlots.length > 0 && availableSlots[0].rank === rank;
    const listingTier = slot?.listingTier ?? null;

    await trackBeforeNav(() => {
      // Track conversion
      reliablePost('funnel-track', {
        funnelType: 'top25',
        eventName: 'cta_click',
        stateSlug: checkoutData.stateSlug,
        agencyName: checkoutData.agencyName,
        agencyId: checkoutData.agencyId,
        metadata: {
          action: 'top25_upgrade_converted',
          rank,
          listing_tier: listingTier,
          discounted_price: discountedPrice,
          replaced_standard: true,
          discount_percent: discountPercent,
        },
      }, 'top25:last_chance_converted');

      // Canonical funnel event for admin timeline visibility
      trackAgencyFunnelEvent(
        'top25_upgrade_selected',
        {
          page: 'standard_upgrade_offer',
          selected_rank: rank,
          selected_price: discountedPrice,
          listing_tier: listingTier,
          source_page: 'standard_upgrade_offer',
          previous_step: 'standard_listing_selected',
          next_expected_step: 'top25_confirm_viewed',
          discount_percent: hasActiveOffer ? discountPercent : null,
          offer_token: activeOfferToken || null,
          agency_id: checkoutData.agencyId || null,
          agency_name: checkoutData.agencyName,
          agency_slug: checkoutData.agencySlug || null,
          state_slug: checkoutData.stateSlug,
          state_name: checkoutData.stateName,
        },
        {
          kind: 'click',
          dedupeKey: `top25_upgrade_selected:${rank}`,
          stepNumber: 130,
          agency_id: checkoutData.agencyId || undefined,
          agency_name: checkoutData.agencyName,
          state_slug: checkoutData.stateSlug,
          state_name: checkoutData.stateName,
        }
      );

      // Fire admin notification for Top-25 upgrade selection
      reliablePost('top25-upgrade-selected', {
        agency_id: checkoutData.agencyId || null,
        agency_slug: checkoutData.agencySlug || null,
        agency_name: checkoutData.agencyName || null,
        state_slug: checkoutData.stateSlug || null,
        state_name: checkoutData.stateName || null,
        selected_rank: rank,
        selected_price: discountedPrice,
        listing_tier: listingTier,
        source_page: 'standard_upgrade_offer',
        previous_step: 'standard_listing_selected',
        next_expected_step: 'top25_confirm_viewed',
        offer_token: activeOfferToken || null,
        discount_percent: hasActiveOffer ? discountPercent : null,
        page_url: window.location.href,
        fsid: getFsid(false) || null,
      }, 'top25_upgrade_selected');

      if (activeOffer) {
        trackDiscountCheckoutOpened(extractDiscountContext(activeOffer, {
          agency_id: checkoutData.agencyId,
        }));
      }
    });

    proceedToTop25Checkout(rank);
    } catch { upgradeClickRef.current = false; }
  };

  const handleSkip = async () => {
    if (!checkoutData) return;
    if (skipClickRef.current) return;
    skipClickRef.current = true;
    try {

    await trackBeforeNav(() => {
      trackAgencyFunnelEvent(
        FUNNEL_EVENTS.STANDARD_UPGRADE_OFFER_STANDARD_CONTINUED.event_name,
        {
          page: 'standard_upgrade_offer',
          action: 'continue_standard',
          final_price: BASE_ACTIVATION,
          click_location: 'standard_continue_button',
          agency_id: checkoutData.agencyId || null,
          agency_name: checkoutData.agencyName,
          state_slug: checkoutData.stateSlug,
          state_name: checkoutData.stateName,
        },
        {
          kind: 'click',
          dedupeKey: 'standard_continue',
          stepNumber: FUNNEL_EVENTS.STANDARD_UPGRADE_OFFER_STANDARD_CONTINUED.step_number,
          agency_id: checkoutData.agencyId || undefined,
          agency_name: checkoutData.agencyName,
          state_slug: checkoutData.stateSlug,
          state_name: checkoutData.stateName,
        }
      );

      // Track skip
      reliablePost('funnel-track', {
        funnelType: 'top25',
        eventName: 'cta_click',
        stateSlug: checkoutData.stateSlug,
        agencyName: checkoutData.agencyName,
        agencyId: checkoutData.agencyId,
        metadata: {
          action: 'top25_upgrade_skipped',
          kept_standard: true,
        },
      }, 'top25:last_chance_skipped');
    });

    // Mark that user skipped upgrade offer and completed this final step
    setCheckoutData({
      ...checkoutData,
      skippedUpgrade: true,
      completedFinalUpgradeOffer: true, // Mark that user has been through this page
    });

    // CRITICAL FIX: Do NOT navigate back to /spotlight/confirm
    // Instead, proceed DIRECTLY to checkout with standard listing + existing upsells
    proceedToCheckout();
    } catch { skipClickRef.current = false; }
  };

  const proceedToTop25Checkout = (rank: number) => {
    if (!checkoutData) return;

    const card = availableSlots.find(s => s.rank === rank);
    if (!card) {
      setError?.('Selected position is no longer available. Please try again.');
      return;
    }

    const listingTier = card.listingTier;
    const listingProduct = getListingProductByTier(listingTier);

    if (!listingProduct) {
      setError?.('Product configuration error. Please contact support.');
      return;
    }

    const originalPriceCents = Math.round(listingProduct.amount * 100);
    const extraDiscountCents = Math.round(originalPriceCents * (discountPercent / 100));

    const lineItems: Array<{ price: string; quantity: number }> = [
      { price: listingProduct.priceId, quantity: 1 },
    ];

    // CRITICAL: Preserve earlier upsell selections from /spotlight/confirm
    if (upsells.cardVisual) {
      const product = getAddonProduct('cardVisual');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    if (upsells.getMatched) {
      const product = getAddonProduct('getMatched');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    const fsid = getFsid(false);
    const entryPath = getEntryPath();
    const agencySlug = checkoutData.agencyId
      ? checkoutData.agencyId
      : (checkoutData.agencyName || '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '') + (checkoutData.stateSlug ? `-${checkoutData.stateSlug}` : '');

    launchCheckout(
      () => {
        const payload: Record<string, unknown> = {
          listingType: 'top25_upgrade',
          stateSlug: checkoutData.stateSlug,
          stateName: checkoutData.stateName,
          agencyName: checkoutData.agencyName,
          agencyWebsite: checkoutData.agencyWebsite,
          agencyDescription: checkoutData.agencyDescription,
          agencyServices: checkoutData.agencyServices,
          listingTier: listingTier,
          rank: rank,
          lineItems,
          upsells: {
            cardVisual: upsells.cardVisual,
            getMatched: upsells.getMatched,
            spotlight: false,
          },
          fsid: fsid || undefined,
          agencySlug: agencySlug || undefined,
          entryPath: entryPath || undefined,
          replacedStandard: true,
          extraDiscountCents: extraDiscountCents,
          upgradeDiscountPercent: discountPercent,
          agencyId: checkoutData.agencyId || '',
          logoUrl: checkoutData.logoUrl || '',
          checkoutSource: 'standard_upgrade_offer_converted',
        };

        const offerToken =
          activeOfferToken ||
          getOfferTokenIfFlow(['offer_redirect']) ||
          resolveActiveScopedOfferToken({
            agencyId: checkoutData.agencyId || null,
            stateSlug: checkoutData.stateSlug || null,
          });
        if (offerToken) payload.offer_token = offerToken;

        return payload;
      },
      {
        trackingPayload: {
          funnel_name: 'top25_upgrade',
          event_name: 'checkout_page_viewed',
          step_number: 150,
          state_slug: checkoutData.stateSlug,
          agency_name: checkoutData.agencyName,
          agency_id: checkoutData.agencyId || undefined,
          is_demo: false,
          metadata: {
            listing_type: 'top25_upgrade',
            listing_tier: listingTier,
            rank: rank,
            upsell_card_visual: upsells.cardVisual,
            upsell_get_matched: upsells.getMatched,
            source: 'standard_upgrade_offer_converted',
            replaced_standard: true,
            discount_percent: discountPercent,
          },
        },
      }
    );
  };

  const proceedToCheckout = () => {
    if (!checkoutData) return;

    const spotlightProduct = getAgencyActivationProduct();
    if (!spotlightProduct) {
      setError?.('Product configuration error. Please contact support.');
      return;
    }

    const lineItems: Array<{ price: string; quantity: number }> = [
      { price: spotlightProduct.priceId, quantity: 1 },
    ];

    // CRITICAL: Preserve earlier upsell selections from /spotlight/confirm
    if (upsells.cardVisual) {
      const product = getAddonProduct('cardVisual');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    if (upsells.getMatched) {
      const product = getAddonProduct('getMatched');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    const fsid = getFsid(false);
    const entryPath = getEntryPath();
    const agencySlug = checkoutData.agencyId
      ? checkoutData.agencyId
      : (checkoutData.agencyName || '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '') + (checkoutData.stateSlug ? `-${checkoutData.stateSlug}` : '');

    launchCheckout(
      () => {
        const payload: Record<string, unknown> = {
          listingType: 'other_listing',
          stateSlug: checkoutData.stateSlug,
          stateName: checkoutData.stateName,
          agencyId: checkoutData.agencyId || '',
          agencyName: checkoutData.agencyName,
          agencyWebsite: checkoutData.agencyWebsite,
          agencyDescription: checkoutData.agencyDescription,
          agencyServices: checkoutData.agencyServices,
          listingTier: 'activation',
          lineItems,
          upsells: {
            cardVisual: upsells.cardVisual,
            getMatched: upsells.getMatched,
            spotlight: false,
          },
          fsid: fsid || undefined,
          agencySlug: agencySlug || undefined,
          entryPath: entryPath || undefined,
          rank: null,
          checkoutSource: 'standard_upgrade_offer_skip',
        };

        const offerToken =
          activeOfferToken ||
          getOfferTokenIfFlow(['offer_redirect']) ||
          resolveActiveScopedOfferToken({
            agencyId: checkoutData.agencyId || null,
            stateSlug: checkoutData.stateSlug || null,
          });
        if (offerToken) payload.offer_token = offerToken;

        return payload;
      },
      {
        trackingPayload: {
          funnel_name: 'other_listing',
          event_name: 'checkout_page_viewed',
          step_number: 150,
          state_slug: checkoutData.stateSlug,
          agency_name: checkoutData.agencyName,
          agency_id: checkoutData.agencyId || undefined,
          is_demo: false,
          metadata: {
            listing_type: 'other_listing',
            upsell_card_visual: upsells.cardVisual,
            upsell_get_matched: upsells.getMatched,
            source: 'standard_upgrade_offer_skip',
            skipped_top25_upgrade: true,
          },
        },
      }
    );
  };

  useEffect(() => {
    if (isLoading) return;
    if (prefersReducedMotion) {
      setStage(5);
      return;
    }
    const timings = [350, 750, 1250, 1800, 2400];
    const timers = timings.map((t, i) => window.setTimeout(() => setStage(i + 1), t));
    return () => { timers.forEach(clearTimeout); };
  }, [isLoading, prefersReducedMotion]);

  useEffect(() => {
    if (!checkoutData) return;
    if (isLoading) return;
    if (availableSlots.length !== 0) return;
    // Only auto-skip to Standard checkout when the API successfully confirms
    // there are no available Top-25 slots. Never auto-skip on timeout/error.
    if (slotLoadStatus !== 'empty_confirmed') return;
    const t = window.setTimeout(() => {
      setCheckoutData({
        ...checkoutData,
        skippedUpgrade: true,
        completedFinalUpgradeOffer: true,
      });
      proceedToCheckout();
    }, 100);
    return () => clearTimeout(t);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [checkoutData, isLoading, availableSlots.length, slotLoadStatus]);

  if (!checkoutData) {
    return (
      <div className="funnelBackground" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '20px', color: '#475569' }}>
        Loading...
      </div>
    );
  }

  if (isLoading) {
    return (
      <div className="funnelBackground" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '40px 20px', minHeight: '100vh' }}>
        <div style={{ textAlign: 'center' }}>
          <div style={{ fontSize: '14px', color: '#64748b' }}>Loading available positions...</div>
        </div>
      </div>
    );
  }

  if (availableSlots.length === 0) {
    // Only blank while waiting for the confirmed-empty auto-skip effect to run.
    // On timeout/error we still want the page to render so the user isn't
    // stranded — we fall through to the main render (which shows the Standard
    // continue button even when no Top-25 cards are available).
    if (slotLoadStatus === 'empty_confirmed') {
      return null;
    }
  }

  const showS1 = stage >= 1;
  const showS2 = stage >= 2;
  const showS3 = stage >= 3;
  const showS4 = stage >= 4;
  const showCards = stage >= 5;
  const movedUp1 = stage >= 3;
  const movedUp2 = stage >= 5;

  return (
    <div className="sup-root funnelBackground">
      <style>{`
        .sup-root {
          min-height: 100vh;
          height: 100vh;
          overflow: hidden;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          padding: 16px 14px;
          box-sizing: border-box;
        }
        .sup-inner {
          width: 100%;
          max-width: 820px;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 10px;
        }
        .sup-fade {
          opacity: 0;
          transform: translateY(14px);
          transition: opacity 650ms cubic-bezier(0.22,1,0.36,1), transform 650ms cubic-bezier(0.22,1,0.36,1);
          will-change: opacity, transform;
        }
        .sup-fade.sup-in {
          opacity: 1;
          transform: translateY(0);
        }
        .sup-move {
          transition: transform 650ms cubic-bezier(0.22,1,0.36,1);
          will-change: transform;
        }
        .sup-move.sup-up-1 { transform: translateY(-6px); }
        .sup-move.sup-up-2 { transform: translateY(-12px); }
        @media (prefers-reduced-motion: reduce) {
          .sup-fade, .sup-move { transition: none !important; }
          .sup-fade { opacity: 1; transform: none; }
          .sup-move.sup-up-1, .sup-move.sup-up-2 { transform: none; }
        }
        .sup-h1 {
          font-size: clamp(18px, 3.2vw, 28px);
          font-weight: 700;
          color: #0f172a;
          line-height: 1.2;
          text-align: center;
          margin: 0;
        }
        .sup-sub {
          font-size: clamp(13px, 1.7vw, 17px);
          color: #0f172a;
          line-height: 1.35;
          font-weight: 600;
          text-align: center;
          margin: 0;
          max-width: 640px;
        }
        .sup-or {
          font-size: clamp(11px, 1.3vw, 13px);
          letter-spacing: 0.18em;
          color: #94a3b8;
          font-weight: 700;
          text-transform: uppercase;
          margin: 0;
        }
        .sup-discount-line {
          font-size: clamp(12px, 1.5vw, 15px);
          color: #dc2626;
          font-weight: 700;
          margin: 0;
        }
        .sup-grid {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 10px;
          width: 100%;
        }
        @media (max-width: 640px) {
          .sup-grid { grid-template-columns: 1fr; gap: 8px; }
          .sup-root { padding: 10px 10px; justify-content: flex-start; padding-top: 14px; }
          .sup-inner { gap: 8px; }
        }
        .sup-card {
          background: #fff;
          border-radius: 10px;
          padding: 10px 12px;
          box-sizing: border-box;
        }
        .sup-standard-btn {
          width: 100%;
          max-width: 520px;
        }
      `}</style>
      <div className="sup-inner">

        {error && (
          <div style={{
            backgroundColor: '#FEE2E2',
            border: '1px solid #FCA5A5',
            borderRadius: '8px',
            padding: '8px 12px',
            color: '#DC2626',
            fontSize: '13px',
            textAlign: 'center',
            width: '100%'
          }}>
            {error}
          </div>
        )}

        {/* Block A: Standard intro + skip CTA */}
        <div className={`sup-move ${movedUp1 ? 'sup-up-1' : ''} ${movedUp2 ? 'sup-up-2' : ''}`} style={{ width: '100%', display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 8 }}>
          <h1 className={`sup-h1 sup-fade ${showS1 ? 'sup-in' : ''}`}>
            You selected the Standard Listing ({hasActivationDiscount ? <><s style={{ color: '#94a3b8', fontWeight: 400 }}>${BASE_ACTIVATION}</s> {activationLabel}</> : `$${BASE_ACTIVATION}`})
          </h1>
          <p className={`sup-fade ${showS2 ? 'sup-in' : ''}`} style={{ margin: 0, fontSize: 'clamp(12px, 1.4vw, 14px)', color: '#64748b' }}>
            You can continue with that
          </p>
          <div className={`sup-fade ${showS2 ? 'sup-in' : ''}`} style={{ width: '100%', display: 'flex', justifyContent: 'center' }}>
            <button
              onClick={handleSkip}
              disabled={isProcessing}
              className="sup-standard-btn"
              style={{
                backgroundColor: isProcessing ? '#f8fafc' : '#fff5f5',
                color: isProcessing ? '#cbd5e1' : '#991b1b',
                padding: isMobile ? '9px 14px' : '11px 20px',
                border: `1.5px solid ${isProcessing ? '#e2e8f0' : '#fca5a5'}`,
                borderRadius: '10px',
                cursor: isProcessing ? 'not-allowed' : 'pointer',
                transition: 'background 160ms ease, border-color 160ms ease, color 160ms ease',
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                gap: '3px',
                width: '100%',
                maxWidth: '520px',
              }}
            >
              {isProcessing ? (
                <span style={{ fontSize: isMobile ? '12px' : '14px', fontWeight: 600 }}>Processing...</span>
              ) : (
                <>
                  <span style={{ fontSize: isMobile ? '12px' : '14px', fontWeight: 600, lineHeight: 1.3 }}>
                    Continue with Standard Listing {activationLabel}
                  </span>
                  <span style={{ fontSize: isMobile ? '10px' : '11.5px', fontWeight: 400, opacity: 0.65, lineHeight: 1.2 }}>
                    Listing remains active for 6 months
                  </span>
                </>
              )}
            </button>
          </div>
        </div>

        {/* Block B: OR + upgrade intro */}
        {availableSlots.length > 0 && (
        <div className={`sup-move ${movedUp2 ? 'sup-up-2' : ''}`} style={{ width: '100%', display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 4, marginTop: 4 }}>
          <p className={`sup-or sup-fade ${showS3 ? 'sup-in' : ''}`}>OR</p>
          <p className={`sup-sub sup-fade ${showS3 ? 'sup-in' : ''}`}>
            We can upgrade you to one of {availableSlots.length} available Top-25 positions in {checkoutData.stateName}
          </p>
          {discountPercent > 0 && (
            <p className={`sup-discount-line sup-fade ${showS4 ? 'sup-in' : ''}`}>
              With {discountPercent}% off today
            </p>
          )}
        </div>
        )}

        {/* Block C: Cards reveal */}
        {availableSlots.length > 0 && (
        <div className={`sup-fade ${showCards ? 'sup-in' : ''}`} style={{ width: '100%' }}>
        <div className="sup-grid">
          {availableSlots.map((slot, idx) => {
            const isPrimary = idx === 0;
            const badge = isPrimary ? { text: '⭐ Recommended', color: '#dcfce7', textColor: '#166534' } : null;

            return (
              <div
                key={slot.rank}
                style={{
                  backgroundColor: '#ffffff',
                  border: `2px solid ${isPrimary ? '#fbbf24' : '#e2e8f0'}`,
                  borderRadius: isMobile ? '8px' : '12px',
                  padding: isMobile ? '10px 14px' : '16px',
                  position: 'relative',
                  boxShadow: isPrimary ? '0 4px 12px rgba(251, 191, 36, 0.15)' : '0 2px 6px rgba(0,0,0,0.05)',
                }}
              >
                {/* Badges */}
                <div style={{ display: 'flex', gap: isMobile ? '4px' : '6px', marginBottom: isMobile ? '3px' : '8px', flexWrap: 'wrap' }}>
                  {badge && (
                    <span style={{
                      backgroundColor: badge.color,
                      color: badge.textColor,
                      fontSize: isMobile ? '9px' : '11px',
                      fontWeight: 600,
                      padding: isMobile ? '2px 6px' : '3px 10px',
                      borderRadius: isMobile ? '8px' : '10px'
                    }}>
                      {badge.text}
                    </span>
                  )}
                  {discountPercent > 0 && (
                    <span style={{
                      background: 'linear-gradient(135deg, #dc2626 0%, #ea580c 100%)',
                      color: '#ffffff',
                      fontSize: isMobile ? '11px' : '13px',
                      fontWeight: 800,
                      letterSpacing: '0.03em',
                      padding: isMobile ? '3px 9px' : '4px 12px',
                      borderRadius: isMobile ? '10px' : '12px',
                      boxShadow: '0 2px 6px rgba(220, 38, 38, 0.25)',
                      textTransform: 'uppercase'
                    }}>
                      {discountPercent}% OFF
                    </span>
                  )}
                </div>

                {/* Rank */}
                <div style={{
                  fontSize: isMobile ? '17px' : '28px',
                  fontWeight: 800,
                  color: '#0f172a',
                  marginBottom: isMobile ? '3px' : '6px',
                  lineHeight: 1
                }}>
                  #{slot.rank} Position
                </div>

                {/* Pricing */}
                <div style={{ marginBottom: isMobile ? '6px' : '12px' }}>
                  <div style={{ display: 'flex', alignItems: 'baseline', gap: isMobile ? '8px' : '10px', flexWrap: 'wrap' }}>
                    {slot.discountedPrice < slot.originalPrice && (
                      <span style={{
                        fontSize: isMobile ? '15px' : '18px',
                        color: '#94a3b8',
                        textDecoration: 'line-through',
                        fontWeight: 500
                      }}>
                        ${slot.originalPrice}
                      </span>
                    )}
                    <span style={{
                      fontSize: isMobile ? '14px' : '16px',
                      color: '#64748b',
                      fontWeight: 600
                    }}>
                      {'\u2192'}
                    </span>
                    <span style={{
                      fontSize: isMobile ? '20px' : '32px',
                      fontWeight: 800,
                      color: '#0f172a',
                      lineHeight: 1
                    }}>
                      ${formatPrice(slot.discountedPrice)}
                    </span>
                    {isMobile && slot.discountedPrice < slot.originalPrice && (
                      <span style={{
                        fontSize: '11px',
                        fontWeight: 700,
                        color: '#16a34a',
                        marginLeft: '2px'
                      }}>
                        Save ${formatPrice(slot.originalPrice - slot.discountedPrice)}
                      </span>
                    )}
                  </div>
                  {!isMobile && slot.discountedPrice < slot.originalPrice && (
                    <div style={{
                      marginTop: '6px',
                      fontSize: '14px',
                      fontWeight: 700,
                      color: '#16a34a'
                    }}>
                      You save ${formatPrice(slot.originalPrice - slot.discountedPrice)}
                    </div>
                  )}
                </div>

                {/* Trust Lines */}
                <div style={{ marginBottom: isMobile ? '6px' : '12px' }}>
                  <div style={{ display: 'flex', alignItems: 'flex-start', gap: '6px', marginBottom: isMobile ? '2px' : '5px' }}>
                    <span style={{ color: '#22c55e', fontSize: isMobile ? '11px' : '14px', marginTop: '1px', flexShrink: 0, fontWeight: 700 }}>✔</span>
                    <span style={{ fontSize: isMobile ? '10.5px' : '13px', color: '#334155', lineHeight: 1.3 }}>
                      Your Standard Listing ($97) is already included
                    </span>
                  </div>
                  <div style={{ display: 'flex', alignItems: 'flex-start', gap: '6px' }}>
                    <span style={{ color: '#22c55e', fontSize: isMobile ? '11px' : '14px', marginTop: '1px', flexShrink: 0, fontWeight: 700 }}>✔</span>
                    <span style={{ fontSize: isMobile ? '10.5px' : '13px', color: '#334155', lineHeight: 1.3 }}>
                      Higher positions get significantly more visibility
                    </span>
                  </div>
                </div>

                {/* CTA Button */}
                <button
                  onClick={() => handleUpgrade(slot.rank, slot.discountedPrice)}
                  disabled={isProcessing}
                  style={{
                    width: '100%',
                    backgroundColor: isProcessing ? '#94a3b8' : (isPrimary ? '#f59e0b' : '#4F46E5'),
                    color: '#ffffff',
                    fontSize: isMobile ? '12px' : '14px',
                    fontWeight: 600,
                    padding: isMobile ? '11px 12px' : '12px 20px',
                    borderRadius: isMobile ? '7px' : '8px',
                    border: 'none',
                    cursor: isProcessing ? 'not-allowed' : 'pointer',
                    transition: 'all 0.2s ease',
                  }}
                  onMouseEnter={(e) => {
                    if (!isProcessing) {
                      e.currentTarget.style.transform = 'translateY(-1px)';
                      e.currentTarget.style.boxShadow = '0 4px 12px rgba(0,0,0,0.15)';
                    }
                  }}
                  onMouseLeave={(e) => {
                    if (!isProcessing) {
                      e.currentTarget.style.transform = 'translateY(0)';
                      e.currentTarget.style.boxShadow = 'none';
                    }
                  }}
                >
                  {isProcessing ? 'Processing...' : `Claim #${slot.rank} \u2014 before it's gone`}
                </button>
              </div>
            );
          })}
        </div>
        </div>
        )}

      </div>
    </div>
  );
}
