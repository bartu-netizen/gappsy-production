import { useState, useEffect, useRef } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Zap, ArrowRight } from 'lucide-react';
import { getAvailableTop25SlotsForState, Top25Slot } from '../lib/top25Slots';
import { getAgencyActivationProduct, getListingProductByTier, type ListingTier } from '../config/stripe';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { navigateToTop25Confirm } from '../utils/top25FunnelNav';
import { getStateContextFromSearchParams, slugToStateName } from '../utils/stateContext';
import { logFunnelEvent, FUNNEL_EVENTS, trackAgencyFunnelEvent, getFsid } from '../utils/yourAgencyFunnel';
import { trackActivationPageView } from '../utils/trackActivationPageView';
import { setActiveOfferFlow, clearActiveOfferFlow, validateOfferToken, resolveScopedDiscountForAgency, type DiscountOffer } from '../utils/discountOffer';
import DiscountStatsStickyHeader from '../components/DiscountStatsStickyHeader';
import CompactDiscountBanner from '../components/CompactDiscountBanner';
import {
  extractDiscountContext,
  trackDiscountLinkOpened,
  trackDiscountValidated,
  trackDiscountInvalidOrExpired,
  trackDiscountCheckoutOpened,
} from '../utils/discountCheckoutTracking';
import Top25ClaimActivationStep from './Top25ClaimActivationStep';
import ErrorBoundary from '../components/ErrorBoundary';
import { isSmartRoutingContext, extractRoutingParams } from '../utils/smartRoutingTracker';
import { getSmartRoutingContext, buildSmartRoutingQuery, hasSmartRoutingContext } from '../utils/smartRoutingContext';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { deriveHoursAgo } from '../utils/deterministicFallback';
import { getDiscountedFullCardPrice, formatPrice } from '../utils/discountPricing';
import { useNoindex } from '../components/NoindexMeta';
import { trackBeforeNav } from '../utils/trackBeforeNav';
import { markCommercialInteraction } from '../utils/humanSignalCollector';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

function safeDecodeParam(value?: string | null): string {
  if (!value) return '';
  try {
    return decodeURIComponent(decodeURIComponent(value));
  } catch {
    try {
      return decodeURIComponent(value);
    } catch {
      return value;
    }
  }
}

interface OwnerTop25Status {
  ownerFlowType: 'top25_unpaid_current' | 'top25_paid_current' | 'not_top25_current' | 'top25_unresolved_current';
  top25SlotId: string | null;
  top25Rank: number | null;
  top25StateSlug: string | null;
  canShowTop25ClaimEntry: boolean;
}

function ActivationUpgradePageInner() {
  const navigate = useNavigate();
  const { setCheckoutData } = useTop25Checkout();
  const [searchParams] = useSearchParams();
  const paramAgencyId = searchParams.get('agencyId') || '';
  const paramAgencySlug = searchParams.get('agencySlug') || '';
  const paramAgencyName = safeDecodeParam(searchParams.get('agencyName'));
  const { stateSlug: paramStateSlug, stateName: paramStateName } = getStateContextFromSearchParams(searchParams);

  const cToken = searchParams.get('c') || undefined;
  // Always resolve canonical agency data when an identifier is present so short
  // links (agencyId + stateSlug only) hydrate name/details from the database
  // instead of rendering "Your Agency". stateSlug is forwarded as a hint so the
  // resolver can pick the correct state listing for multi-state agencies.
  const shouldResolveCanonical =
    !!paramAgencyId || !!paramAgencySlug || !!paramAgencyName || !!cToken;
  const { agency: canonical, loading: canonicalLoading } = useCanonicalAgency(
    shouldResolveCanonical ? (paramAgencySlug || undefined) : undefined,
    shouldResolveCanonical
      ? {
          token: cToken,
          agencyId: paramAgencyId || undefined,
          agencyName: paramAgencyName || undefined,
          stateHint: paramStateSlug || undefined,
        }
      : undefined,
  );

  const hasResolvedAgency = shouldResolveCanonical && !!canonical.agencyId && !canonical.isDeterministic;

  const agencyId = paramAgencyId || canonical.agencyId || '';
  // Prefer URL agencyName first (long activation links carry it explicitly so
  // the page never shows "Your Agency" when fallback data is present). Canonical
  // is a secondary enhancement for short links.
  const agencyName = paramAgencyName
    || (hasResolvedAgency ? canonical.agencyName : '')
    || 'Your Agency';
  const stateSlug = paramStateSlug || canonical.stateSlug || '';
  // If canonical resolved a stateSlug that differs from the URL stateSlug param, the
  // incoming stateName may be stale (e.g. URL had stateSlug=new-york but stateName=Hawaii).
  // In that case, derive stateName from the canonical stateSlug so checkout metadata
  // and admin emails always reflect the actual activated state.
  const canonicalStateName = hasResolvedAgency
    ? (canonical.stateName || slugToStateName(canonical.stateSlug || ''))
    : '';
  const stateNameIsStale =
    hasResolvedAgency &&
    !!canonical.stateSlug &&
    !!paramStateSlug &&
    paramStateSlug !== canonical.stateSlug;
  const stateName = stateNameIsStale
    ? canonicalStateName
    : (paramStateName || canonicalStateName || slugToStateName(stateSlug) || '');

  // Page is ready as soon as we have a resolvable state. Canonical lookup is an
  // enhancement, not a blocker — long activation links carry stateName/stateSlug
  // directly so the page can render immediately.
  const contextReady = !!stateSlug && !!stateName;

  // URL self-heal: repairs agencyId, stateSlug, and stateName from canonical
  // resolution so checkout metadata and admin emails always reflect the correct state.
  // stateSlug is the source of truth — a stale stateName (e.g. stateName=Hawaii with
  // stateSlug=new-york) is overwritten with the canonical human-readable state name.
  const selfHealDoneRef = useRef(false);
  useEffect(() => {
    if (selfHealDoneRef.current) return;
    if (!shouldResolveCanonical) return;
    if (canonicalLoading) return;
    if (!canonical.agencyId || !canonical.stateSlug) return;

    const currentAgencyId = searchParams.get('agencyId') || '';
    const currentStateSlug = searchParams.get('stateSlug') || '';
    const currentStateName = searchParams.get('stateName') || '';
    const canonicalStateNameHealed =
      canonical.stateName || slugToStateName(canonical.stateSlug);
    // stateName is stale if stateSlug differs from canonical OR stateName doesn't
    // match what the canonical stateSlug should produce
    const stateNameMismatch =
      currentStateName !== canonicalStateNameHealed &&
      (currentStateSlug !== canonical.stateSlug || !!currentStateName);

    const needsRewrite =
      currentAgencyId !== canonical.agencyId ||
      currentStateSlug !== canonical.stateSlug ||
      stateNameMismatch;

    if (!needsRewrite) {
      selfHealDoneRef.current = true;
      return;
    }

    const next = new URLSearchParams(searchParams.toString());
    next.set('agencyId', canonical.agencyId);
    next.set('stateSlug', canonical.stateSlug);
    next.set('stateName', canonicalStateNameHealed);

    selfHealDoneRef.current = true;
    navigate(`/activation/upgrade?${next.toString()}`, { replace: true });
  }, [
    shouldResolveCanonical,
    canonicalLoading,
    canonical.agencyId,
    canonical.agencySlug,
    canonical.agencyName,
    canonical.stateSlug,
    canonical.stateName,
    searchParams,
    navigate,
  ]);

  const agencyWebsite = safeDecodeParam(searchParams.get('agencyWebsite'));
  const agencyDescription = safeDecodeParam(searchParams.get('agencyDescription'));
  const agencyServicesParam = safeDecodeParam(searchParams.get('agencyServices'));
  const agencyServices = agencyServicesParam ? agencyServicesParam.split(',') : [];
  const agencyLogoUrl = safeDecodeParam(searchParams.get('agencyLogoUrl'));

  const offerTokenFromUrl = searchParams.get('offer');

  const [availableSlots, setAvailableSlots] = useState<Top25Slot[]>([]);
  const [, setLoading] = useState(true);
  const [, setFetchFailed] = useState(false);
  const [checkoutLoading] = useState(false);
  const activationPrice = getAgencyActivationProduct()?.amount || 97;

  const [hasActiveOffer, setHasActiveOffer] = useState(false);
  const [validatedOffer, setValidatedOffer] = useState<DiscountOffer | null>(null);

  // Internal phase state: phase 1 = standard-only hero, phase 2 = top-25 cards
  type ActivationPhase = 'standard' | 'top25';
  const [activationPhase, setActivationPhase] = useState<ActivationPhase>('standard');

  // Phase 1 cinematic scene flow — hero headline in, CTA reveals after short beat.
  type ActivationScene = 'hero' | 'ready';
  const [activationScene, setActivationScene] = useState<ActivationScene>('hero');
  useEffect(() => {
    const prefersReduced =
      typeof window !== 'undefined' &&
      (() => {
        try {
          return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        } catch {
          return false;
        }
      })();
    if (prefersReduced) {
      setActivationScene('ready');
      return;
    }
    setActivationScene('hero');
    const tReady = window.setTimeout(() => setActivationScene('ready'), 900);
    return () => {
      window.clearTimeout(tReady);
    };
  }, []);

  const sceneReady = activationScene === 'ready';

  const discountPercent = validatedOffer?.discount_type === 'percentage' ? validatedOffer.discount_value : 0;
  const discountedActivationPrice = validatedOffer
    ? validatedOffer.discount_type === 'percentage'
      ? getDiscountedFullCardPrice(activationPrice, validatedOffer.discount_value)
      : Math.max(0, Math.round((activationPrice - validatedOffer.discount_value) * 100) / 100)
    : activationPrice;
  const activationSavings = Math.round((activationPrice - discountedActivationPrice) * 100) / 100;
  const hasDiscount = validatedOffer && activationSavings > 0;

  // Owner Top-25 status check — only when agencyId is present
  const [ownerTop25Status, setOwnerTop25Status] = useState<OwnerTop25Status | null>(null);
  const [top25StatusLoading, setTop25StatusLoading] = useState(!!agencyId);

  const discountCheckoutEventFiredRef = useRef(false);

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  // Smart routing tracking: offer page viewed
  useEffect(() => {
    const isRouting = isSmartRoutingContext(searchParams);
    if (!isRouting) return;

    const params = extractRoutingParams(searchParams);
    if (!params.agencyId || !params.leadKey) return;

    console.log('[ActivationUpgradePage] Smart routing context detected, tracking offer page view', params);

    fetch(`${SUPABASE_URL}/functions/v1/smart-routing-track-event`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        agency_id: params.agencyId,
        lead_key: params.leadKey,
        event_type: 'offer_page_viewed',
        metadata: {
          page: 'activation_upgrade',
          agency_id: agencyId,
          state_slug: stateSlug,
          has_discount: hasActiveOffer,
        },
      }),
    }).catch((err) => {
      console.warn('[ActivationUpgradePage] Smart routing tracking failed:', err);
    });
  }, [searchParams, agencyId, stateSlug, hasActiveOffer]);

  // Smart routing tracking: discount checkout viewed (when discount is active)
  useEffect(() => {
    if (!hasActiveOffer || discountCheckoutEventFiredRef.current) return;
    if (!hasSmartRoutingContext(searchParams)) return;

    const smartContext = getSmartRoutingContext(searchParams);
    if (!smartContext.aid || !smartContext.lid) return;

    discountCheckoutEventFiredRef.current = true;
    fetch(`${SUPABASE_URL}/functions/v1/smart-routing-track-event`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
      },
      body: JSON.stringify({
        agency_id: smartContext.aid,
        lead_key: smartContext.lid,
        event_type: "discount_checkout_viewed",
        metadata: {
          page: 'activation_upgrade',
          agency_id: agencyId,
          state_slug: stateSlug,
          has_discount: true,
        },
      }),
    }).catch((err) => {
      console.error("[ActivationUpgradePage] Discount checkout tracking error:", err);
    });
  }, [hasActiveOffer, searchParams, agencyId, stateSlug]);

  // No URL token — try session-scoped or admin-pushed discount for this agency
  useEffect(() => {
    if (offerTokenFromUrl) return;
    if (!agencyId || !stateSlug) {
      setHasActiveOffer(false);
      setValidatedOffer(null);
      return;
    }
    let cancelled = false;
    resolveScopedDiscountForAgency({
      agencyId,
      stateSlug,
      urlToken: null,
      allowSessionScopedDiscount: true,
      allowGlobalScopedDiscount: true,
    }).then((resolved) => {
      if (cancelled) return;
      if (resolved) {
        setHasActiveOffer(true);
        setValidatedOffer(resolved.offer);
        setActiveOfferFlow(resolved.token, 'offer_redirect', agencyId, stateSlug, null);
      } else {
        setHasActiveOffer(false);
        setValidatedOffer(null);
        try { clearActiveOfferFlow(); } catch { /* ignore */ }
      }
    }).catch(() => {
      if (!cancelled) {
        setHasActiveOffer(false);
        setValidatedOffer(null);
      }
    });
    return () => { cancelled = true; };
  }, [offerTokenFromUrl, agencyId, stateSlug]);

  useEffect(() => {
    if (!offerTokenFromUrl) return;

    let cancelled = false;

    const ctx = extractDiscountContext(null, {
      offer_token: offerTokenFromUrl,
      agency_id: agencyId || null,
      agency_slug: null,
    });
    trackDiscountLinkOpened(ctx);

    setHasActiveOffer(false);
    setValidatedOffer(null);

    // Pass resolved agency/state context so server can enforce scope guards
    validateOfferToken(offerTokenFromUrl, agencyId || null, stateSlug || null).then(({ valid, offer, reason }) => {
      if (cancelled) return;
      if (valid && offer) {
        // Agency-scope guard: if offer is agency-bound, it must match the current agency
        if (offer.agency_id && agencyId && offer.agency_id !== agencyId) {
          setHasActiveOffer(false);
          setValidatedOffer(null);
          trackDiscountInvalidOrExpired(ctx, 'agency_mismatch');
          return;
        }
        const sessionExpiry = offer.scope_expires_at
          ? Math.min(new Date(offer.scope_expires_at).getTime(), Date.now() + 24 * 60 * 60 * 1000)
          : Date.now() + 24 * 60 * 60 * 1000;
        setActiveOfferFlow(offerTokenFromUrl, 'offer_redirect', agencyId || null, stateSlug || null, sessionExpiry);
        setHasActiveOffer(true);
        setValidatedOffer(offer);
        trackDiscountValidated(extractDiscountContext(offer));
      } else {
        setHasActiveOffer(false);
        setValidatedOffer(null);
        trackDiscountInvalidOrExpired(ctx, reason);
      }
    });

    return () => {
      cancelled = true;
    };
  }, [offerTokenFromUrl, agencyId]);

  useEffect(() => {
    if (!agencyId) {
      setTop25StatusLoading(false);
      return;
    }
    let cancelled = false;
    const controller = new AbortController();
    const timeoutId = setTimeout(() => {
      controller.abort();
      if (!cancelled) setTop25StatusLoading(false);
    }, 2500);
    fetch(`${SUPABASE_URL}/functions/v1/owner-top25-status`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
      body: JSON.stringify({ agency_id: agencyId }),
      signal: controller.signal,
    })
      .then((r) => r.ok ? r.json() : null)
      .catch(() => null)
      .then((data) => {
        if (cancelled) return;
        clearTimeout(timeoutId);
        if (data?.ok) {
          setOwnerTop25Status({
            ownerFlowType: data.ownerFlowType,
            top25SlotId: data.top25SlotId ?? null,
            top25Rank: data.top25Rank ?? null,
            top25StateSlug: data.top25StateSlug ?? null,
            canShowTop25ClaimEntry: data.canShowTop25ClaimEntry ?? false,
          });
        }
        setTop25StatusLoading(false);
      });
    return () => { cancelled = true; clearTimeout(timeoutId); };
  }, [agencyId]);

  const slotsLoadedForSlugRef = useRef('');
  const missedClientsViewedRef = useRef(false);

  useEffect(() => {
    // Fail-open: when state is missing we can't fetch Top-25 slots, but the
    // standard activation CTA must still render without a perpetual skeleton.
    if (!contextReady) {
      setLoading(false);
      return;
    }
    document.title = `Choose Your ${stateName} Marketing Agency Listing | Gappsy`;
    // Top-25 slots may only be fetched once we have a real resolved state.
    // Missing state must NEVER be converted into a fetchFailed/"Unable to load"
    // state — fetchFailed is reserved for genuine slot-fetch network failures.
    if (slotsLoadedForSlugRef.current !== stateSlug) {
      slotsLoadedForSlugRef.current = stateSlug;
      loadAvailableSpots(stateSlug);
    }
    if (!missedClientsViewedRef.current) {
      missedClientsViewedRef.current = true;
      logFunnelEvent({
        ...FUNNEL_EVENTS.MISSED_CLIENTS_PAGE_VIEWED,
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
      });
      trackActivationPageView({
        agency_id: agencyId || null,
        agency_name: agencyName,
        state_slug: stateSlug,
        listing_type: 'activation',
        prev_step: 'missed_clients_page',
      });
    }
    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.ACTIVATION_PAGE_VIEWED.event_name,
      {
        page: 'activation_upgrade',
        agency_id: agencyId || null,
        agency_name: agencyName,
        state_slug: stateSlug,
        state_name: stateName,
        has_discount: !!hasDiscount,
        discount_percent: discountPercent || 0,
        available_top25_positions: availableSlots.map((s) => s.rank),
        source: (() => {
          const srcParam = searchParams.get('src');
          if (srcParam) return srcParam;
          if (typeof document !== 'undefined') {
            const ref = document.referrer || '';
            if (ref.includes('/your-agency')) return 'your_agency';
            if (ref.includes('/manage')) return 'manage_listing';
            if (ref.includes('/request-replay')) return 'request_replay';
            if (ref) return 'unknown';
          }
          return 'direct';
        })(),
      },
      {
        kind: 'page_view',
        stepNumber: FUNNEL_EVENTS.ACTIVATION_PAGE_VIEWED.step_number,
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
        state_name: stateName,
      }
    );
  }, [contextReady, stateSlug, stateName, availableSlots, hasDiscount, discountPercent]);

  const loadAvailableSpots = async (slug: string) => {
    setLoading(true);
    setFetchFailed(false);
    const fetchOnce = async () => {
      const timeout = new Promise<null>((resolve) => setTimeout(() => resolve(null), 3500));
      return Promise.race([getAvailableTop25SlotsForState(slug), timeout]);
    };
    try {
      let result = await fetchOnce();
      if (!result || result.fetchFailed) {
        result = await fetchOnce();
      }
      if (!result || result.fetchFailed) {
        setAvailableSlots([]);
        setFetchFailed(true);
      } else {
        setAvailableSlots(result.slots);
      }
    } catch {
      setAvailableSlots([]);
      setFetchFailed(true);
    } finally {
      setLoading(false);
    }
  };

  const getSelectedSlots = (): Top25Slot[] => {
    if (availableSlots.length === 0) return [];
    if (availableSlots.length === 1) return [availableSlots[0]];

    const sortedSlots = [...availableSlots].sort((a, b) => a.rank - b.rank);
    const primarySlot = sortedSlots.find(s => s.rank === 2) ?? sortedSlots[0];
    const secondarySlot =
      sortedSlots.find(s => s.rank === 12 && s.rank !== primarySlot.rank) ??
      sortedSlots.find(s => s.rank >= primarySlot.rank + 10 && s.rank !== primarySlot.rank) ??
      sortedSlots.find(s => s.rank !== primarySlot.rank) ??
      sortedSlots[sortedSlots.length - 1];

    if (!secondarySlot || secondarySlot.rank === primarySlot.rank) {
      return [primarySlot];
    }
    return [primarySlot, secondarySlot];
  };

  const selectedSlots = getSelectedSlots();

  useEffect(() => {
    if (selectedSlots.length === 0 || !stateSlug) return;
    try {
      const payload = {
        stateSlug,
        ranks: selectedSlots.map(s => s.rank),
      };
      sessionStorage.setItem('top25:selectedUpgradeRanks', JSON.stringify(payload));
    } catch {
      // ignore
    }
  }, [selectedSlots, stateSlug]);

  const standardClickStartedRef = useRef(false);
  const activationOptionSelectedRef = useRef<Set<string>>(new Set());

  const fireActivationOptionSelected = (opts: {
    option_type: 'standard' | 'top25' | 'standard_discounted';
    selected_rank?: number | null;
    selected_price: number;
    discount_percent?: number | null;
    next_destination: string;
  }) => {
    if (typeof window === 'undefined') return;
    const fsid = getFsid(true);
    if (!fsid) return;
    const dedupKey = `${opts.option_type}:${opts.selected_rank ?? ''}:${agencyId}`;
    if (activationOptionSelectedRef.current.has(dedupKey)) return;
    activationOptionSelectedRef.current.add(dedupKey);
    const payload = {
      fsid,
      agency_id: agencyId || null,
      agency_slug: canonical.agencySlug || paramAgencySlug || null,
      agency_name: agencyName,
      state_slug: stateSlug || null,
      option_type: opts.option_type,
      selected_rank: opts.selected_rank ?? null,
      selected_price: opts.selected_price,
      discount_percent: opts.discount_percent ?? null,
      next_destination: opts.next_destination,
      page_url: window.location.href,
    };
    fetch(`${SUPABASE_URL}/functions/v1/activation-option-selected`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${SUPABASE_ANON_KEY}` },
      body: JSON.stringify(payload),
    }).catch(() => {});
  };

  const phase2ShownRef = useRef(false);

  // Phase 1 CTA: reveal Phase 2 (Top-25 cards) inside the same page.
  // This is a micro-commitment/reveal action, not final checkout.
  const handlePhase1StandardClick = () => {
    if (standardClickStartedRef.current) return;
    standardClickStartedRef.current = true;
    if (checkoutLoading) return;

    markCommercialInteraction('pricing_selection');

    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.ACTIVATION_STANDARD_PHASE1_CLICKED.event_name,
      {
        page: 'activation_upgrade',
        phase: 'phase1',
        action: 'standard_clicked_reveal_top25',
        plan: 'standard',
        price: activationPrice,
        state_slug: stateSlug || null,
        agency_id: agencyId || null,
        agency_name: agencyName,
        has_discount: !!hasDiscount,
        discount_percent: discountPercent || 0,
      },
      {
        kind: 'click',
        dedupeKey: 'phase1_standard_reveal',
        stepNumber: FUNNEL_EVENTS.ACTIVATION_STANDARD_PHASE1_CLICKED.step_number,
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
        state_name: stateName,
      }
    );

    setActivationPhase('top25');
    standardClickStartedRef.current = false;
  };

  useEffect(() => {
    if (activationPhase !== 'top25' || phase2ShownRef.current) return;
    phase2ShownRef.current = true;
    try {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    } catch { /* ignore */ }
    trackAgencyFunnelEvent(
      'activation_phase2_viewed',
      {
        page: 'activation_upgrade',
        agency_id: agencyId || null,
        state_slug: stateSlug || null,
        available_top25_positions: availableSlots.map(s => s.rank),
      },
      {
        kind: 'page_view',
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
        state_name: stateName,
      }
    );
    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.ACTIVATION_TOP25_OPTIONS_VIEWED.event_name,
      {
        page: 'activation_upgrade',
        phase: 'phase2',
        available_top25_positions: availableSlots.map(s => s.rank),
        agency_id: agencyId || null,
        state_slug: stateSlug || null,
        agency_name: agencyName,
      },
      {
        kind: 'page_view',
        dedupeKey: 'activation_top25_options_viewed',
        stepNumber: FUNNEL_EVENTS.ACTIVATION_TOP25_OPTIONS_VIEWED.step_number,
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
        state_name: stateName,
      }
    );
  }, [activationPhase, agencyId, stateSlug, stateName, agencyName, availableSlots]);

  // Final Standard choice (user skipped Top-25 in Phase 2).
  // Restored original downstream path: /spotlight/confirm
  const finalStandardClickRef = useRef(false);
  const handleStandardActivationCheckout = async () => {
    if (finalStandardClickRef.current) return;
    finalStandardClickRef.current = true;
    if (checkoutLoading) { finalStandardClickRef.current = false; return; }
    try {
    markCommercialInteraction('checkout_open');
    await trackBeforeNav(() => {
      logFunnelEvent({
        ...FUNNEL_EVENTS.ACTIVATE_CLICKED,
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
        metadata: { plan: 'activation', price: activationPrice },
      });
      trackAgencyFunnelEvent(
        FUNNEL_EVENTS.ACTIVATION_FINAL_OPTION_CLICKED.event_name,
        {
          selected_option_type: 'standard',
          selected_option: 'Standard Listing',
          selected_price: hasDiscount ? (discountedActivationPrice ?? activationPrice) : activationPrice,
          selected_rank: null,
          phase: 'phase2_final',
          next_destination: 'Spotlight Confirm Page',
        },
        {
          kind: 'click',
          dedupeKey: 'phase2_final_standard',
          stepNumber: FUNNEL_EVENTS.ACTIVATION_FINAL_OPTION_CLICKED.step_number,
          agency_id: agencyId || undefined,
          agency_name: agencyName,
          state_slug: stateSlug,
          state_name: stateName,
        }
      );
      trackAgencyFunnelEvent(
        FUNNEL_EVENTS.ACTIVATION_OPTION_CLICKED.event_name,
        {
          page: 'activation_upgrade',
          plan: 'standard',
          position: null,
          price: activationPrice,
          billing_period: '6_months',
          has_discount: !!hasDiscount,
          discount_percent: discountPercent || 0,
          click_location: 'phase2_standard_continue',
          phase: 'phase2_final',
        },
        {
          kind: 'click',
          dedupeKey: 'phase2_standard_final',
          stepNumber: FUNNEL_EVENTS.ACTIVATION_OPTION_CLICKED.step_number,
          agency_id: agencyId || undefined,
          agency_name: agencyName,
          state_slug: stateSlug,
          state_name: stateName,
        }
      );
      if (hasActiveOffer) {
        trackDiscountCheckoutOpened(extractDiscountContext(validatedOffer, {
          agency_id: agencyId || null,
        }));
      }
    });
    fireActivationOptionSelected({
      option_type: hasDiscount ? 'standard_discounted' : 'standard',
      selected_price: hasDiscount ? (discountedActivationPrice ?? activationPrice) : activationPrice,
      discount_percent: hasDiscount ? (discountPercent ?? null) : null,
      next_destination: 'Spotlight Confirm Page',
    });
    setCheckoutData({
      stateSlug,
      stateName,
      selectedRank: null,
      listingTier: 'activation',
      listingType: 'activation',
      agencyName,
      agencyWebsite,
      agencyDescription,
      agencyServices,
      agencyId: agencyId || undefined,
      logoUrl: agencyLogoUrl || undefined,
    });

    // Preserve smart routing context
    const smartContext = getSmartRoutingContext(searchParams);
    const smartQuery = buildSmartRoutingQuery(smartContext);
    navigate(`/spotlight/confirm${smartQuery}`);
    } catch { finalStandardClickRef.current = false; }
  };

  // Top-25 selection handler (Phase 2 card click).
  const top25ClickRef = useRef(false);
  const getTierForSlotIndex = (index: number): ListingTier => {
    return index === 0 ? 'premium' : 'priority';
  };
  const handleTop25Selection = (slot: Top25Slot, index: number) => {
    if (top25ClickRef.current) return;
    top25ClickRef.current = true;
    try {

    markCommercialInteraction('top25_selection');

    const tier = getTierForSlotIndex(index);
    const product = getListingProductByTier(tier);
    const price = product?.amount || 0;

    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.ACTIVATION_FINAL_OPTION_CLICKED.event_name,
      {
        selected_option_type: 'top25',
        selected_option: `Top-25 Rank #${slot.rank}`,
        selected_rank: slot.rank,
        selected_price: price,
        upgrade_amount: price,
        phase: 'phase2_final',
        next_destination: 'Top25 Confirm Page',
      },
      {
        kind: 'click',
        dedupeKey: `phase2_final_top25_${slot.rank}`,
        stepNumber: FUNNEL_EVENTS.ACTIVATION_FINAL_OPTION_CLICKED.step_number,
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
        state_name: stateName,
      }
    );
    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.ACTIVATION_OPTION_CLICKED.event_name,
      {
        page: 'activation_upgrade',
        plan: 'top25',
        position: slot.rank,
        price,
        billing_period: '6_months',
        has_discount: !!hasDiscount,
        discount_percent: discountPercent || 0,
        click_location: 'phase2_top25_card',
        phase: 'phase2_final',
      },
      {
        kind: 'click',
        dedupeKey: `phase2_top25_${slot.rank}`,
        stepNumber: FUNNEL_EVENTS.ACTIVATION_OPTION_CLICKED.step_number,
        agency_id: agencyId || undefined,
        agency_name: agencyName,
        state_slug: stateSlug,
        state_name: stateName,
      }
    );

    fireActivationOptionSelected({
      option_type: 'top25',
      selected_rank: slot.rank,
      selected_price: price,
      discount_percent: hasDiscount ? (discountPercent ?? null) : null,
      next_destination: 'Top25 Confirm Page',
    });

    navigateToTop25Confirm(navigate, setCheckoutData, {
      stateSlug,
      stateName,
      selectedRank: slot.rank,
      listingTier: tier,
      listingType: 'top25',
      agencyName,
      agencyWebsite,
      agencyDescription,
      agencyServices,
      agencyId: agencyId || undefined,
      top25SlotId: slot.id,
      logoUrl: agencyLogoUrl || undefined,
    });
    } catch { top25ClickRef.current = false; }
  };


  // While waiting for owner-top25-status, show the same spinner as the slots loading state
  // to prevent CLS / flash of the wrong activation variant.
  if (top25StatusLoading) {
    return (
      <div className="upgrade-page-root">
        <div className="upgrade-page-inner">
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', flex: 1, padding: '60px 0' }}>
            <div
              style={{
                width: '40px',
                height: '40px',
                border: '3px solid #e2e8f0',
                borderTop: '3px solid #FFAE00',
                borderRadius: '50%',
                animation: 'spin 1s linear infinite',
              }}
            />
          </div>
        </div>
        <style>{`@keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } } * { box-sizing: border-box; } .upgrade-page-root { min-height: 100svh; background-color: #F8FAFC; display: flex; flex-direction: column; } .upgrade-page-inner { max-width: 860px; margin: 0 auto; width: 100%; flex: 1; display: flex; flex-direction: column; padding: 14px 16px 20px; }`}</style>
      </div>
    );
  }

  // Branch: Top-25 unpaid owner — show claim activation step instead of normal upgrade page
  if (ownerTop25Status?.canShowTop25ClaimEntry && agencyId) {
    const claimStateSlug = ownerTop25Status.top25StateSlug ?? stateSlug;
    const claimStateName = stateName;
    return (
      <Top25ClaimActivationStep
        agencyId={agencyId}
        agencyName={agencyName}
        stateSlug={claimStateSlug}
        stateName={claimStateName}
        top25Rank={ownerTop25Status.top25Rank}
        top25SlotId={ownerTop25Status.top25SlotId}
        agencyWebsite={agencyWebsite}
        agencyDescription={agencyDescription}
        agencyServices={agencyServices}
      />
    );
  }

  return (
    <div className={`upgrade-page-root ${hasActiveOffer && validatedOffer ? 'upgrade-page-root--discount' : ''} ${activationPhase === 'top25' ? 'upgrade-page-root--phase2' : ''}`}>
      {hasActiveOffer && validatedOffer && discountPercent > 0 ? (
        <div className="discount-unlocked-bar" role="status">
          <span className="discount-unlocked-bar__text">
            You've unlocked a <strong>{discountPercent}%</strong> activation discount
          </span>
        </div>
      ) : (
        hasActiveOffer && validatedOffer && agencyId && (
          <DiscountStatsStickyHeader agencyId={agencyId} agencyName={agencyName} />
        )
      )}
      <div className="upgrade-page-inner">
        {checkoutLoading ? (
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', flex: 1, padding: '60px 0' }}>
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '12px' }}>
              <div
                style={{
                  width: '40px',
                  height: '40px',
                  border: '3px solid #e2e8f0',
                  borderTop: '3px solid #FFAE00',
                  borderRadius: '50%',
                  animation: 'spin 1s linear infinite',
                }}
              />
              <p style={{ color: '#64748b', fontSize: '13px', margin: 0 }}>Processing...</p>
            </div>
          </div>
        ) : (
          <>
            {validatedOffer && !hasActiveOffer && (
              <CompactDiscountBanner offer={validatedOffer} />
            )}

            {/* Phase 1 — Standard Listing activation only. Single viewport. */}
            {activationPhase === 'standard' && (
            <section
              className={`phase1-stage ${sceneReady ? 'phase1-stage--ready' : 'phase1-stage--hero'}`}
              data-scene={activationScene}
            >
              <div className="phase1-inner">
                <div className="phase1-hero">
                  <h1 className="phase1-title">Activate your listing</h1>
                  <div className="phase1-subline">
                    <span className="phase1-hero-line">
                      to start receiving{' '}
                      <span className="activation-cinema-highlight">client requests</span>
                    </span>
                  </div>
                </div>

                <div className={`phase1-activity ${sceneReady ? 'phase1-activity--in' : ''}`}>
                  <div className="phase1-activity-cell">
                    <span className="phase1-activity-value">{canonical.missedCount}</span>
                    <span className="phase1-activity-label">client requests in the last 30 days</span>
                  </div>
                  <div className="phase1-activity-cell">
                    <span className="phase1-activity-value">{deriveHoursAgo(canonical.anchorMs)}h ago</span>
                    <span className="phase1-activity-label">most recent request</span>
                  </div>
                  <div className="phase1-activity-cell">
                    <span className="phase1-activity-value phase1-activity-value--muted">Inactive</span>
                    <span className="phase1-activity-label">listing currently inactive</span>
                  </div>
                </div>

                <div className={`phase1-benefits ${sceneReady ? 'phase1-benefits--in' : ''}`}>
                  <h2 className="phase1-benefits-title">What's included in your Standard Listing</h2>
                  <ul className="phase1-benefits-list">
                    <li>Visible on the {stateName || 'state'} Top Agencies page</li>
                    <li>Receive direct client requests</li>
                    <li>Your agency profile becomes active</li>
                    <li>Opportunity to upgrade to a Top-25 position</li>
                    <li>6-month active listing</li>
                  </ul>
                  <ul className="phase1-benefits-chips">
                    <li><span className="phase1-chip-icon" />Receive direct client requests</li>
                    <li><span className="phase1-chip-icon" />Visible on the {stateName || 'state'} Top Agencies page</li>
                    <li><span className="phase1-chip-icon" />Agency profile visibility</li>
                    <li><span className="phase1-chip-icon" />Opportunity to upgrade to a Top-25 position</li>
                    <li><span className="phase1-chip-icon" />6-month active listing</li>
                  </ul>
                </div>

                <div className={`phase1-cta-wrap ${sceneReady ? 'phase1-cta-wrap--in' : ''}`}>
                  <button
                    type="button"
                    onClick={handlePhase1StandardClick}
                    className={`phase1-cta phase1-cta--2col ${hasDiscount ? 'phase1-cta--discount' : ''}`}
                    style={{ position: 'relative', zIndex: 50, touchAction: 'manipulation', WebkitTapHighlightColor: 'transparent' }}
                  >
                    <div className="phase1-cta-left">
                      <Zap size={16} className="phase1-cta-zap" />
                      <div className="phase1-cta-labels">
                        <span className="phase1-cta-title">Activate Standard Listing</span>
                        <span className="phase1-cta-subtitle">{hasDiscount ? `${discountPercent}% off \u2022 ` : ''}One-time payment for a 6-month listing</span>
                      </div>
                    </div>
                    <div className="phase1-cta-right">
                      <span className="phase1-cta-price">${hasDiscount ? formatPrice(discountedActivationPrice) : activationPrice}</span>
                      {hasDiscount && <span className="phase1-cta-old">${activationPrice}</span>}
                      <ArrowRight size={18} className="phase1-cta-arrow-icon" />
                    </div>
                  </button>
                  <p className="phase1-cta-support">Start receiving client requests.</p>
                </div>
              </div>
            </section>
            )}

            {/* Phase 2 — Top-25 upgrade cards (revealed after Phase 1 CTA). */}
            {activationPhase === 'top25' && (
              <section className="phase2-stage">
                <div className="phase2-inner">
                  <div className="phase2-hero">
                    <h1 className="phase2-title">Upgrade your listing to a Top-25 position</h1>
                    <p className="phase2-sub">
                      Higher ranks appear first on the {stateName || 'state'} page and receive the most client requests.
                    </p>
                  </div>

                  <div className="phase2-skip-wrap">
                    <p className="phase2-skip-hint">Prefer the Standard Listing instead?</p>
                    <button
                      type="button"
                      className="phase2-skip"
                      onClick={handleStandardActivationCheckout}
                    >
                      <span className="phase2-skip-inner">
                        <ArrowRight size={14} className="phase2-skip-icon" />
                        <span className="phase2-skip-text">
                          <span className="phase2-skip-main">No thanks &mdash; continue with Standard Listing ${hasDiscount ? formatPrice(discountedActivationPrice) : activationPrice}</span>
                          <span className="phase2-skip-sub">One payment for a 6-month listing</span>
                        </span>
                      </span>
                    </button>
                  </div>

                  {selectedSlots.length > 0 ? (
                    <div className="phase2-cards">
                      {selectedSlots.map((slot, index) => {
                        const tier = getTierForSlotIndex(index);
                        const product = getListingProductByTier(tier);
                        const tierPrice = product?.amount ?? 0;
                        const isPremium = index === 0;
                        const displayUpgrade = isPremium ? 197 : 147;
                        const displayTotal = activationPrice + displayUpgrade;
                        const placementLabel = isPremium ? 'Premium Top-25 placement' : 'Priority Top-25 placement';
                        return (
                          <button
                            type="button"
                            key={slot.id}
                            className={`phase2-card ${isPremium ? 'phase2-card--premium' : 'phase2-card--priority'}`}
                            onClick={() => handleTop25Selection(slot, index)}
                          >
                            <div className="phase2-card-topbar" />
                            <div className="phase2-card-body">
                              <h3 className="phase2-card-title">
                                Upgrade to Rank <span className="phase2-rank-badge">#{slot.rank}</span>
                              </h3>
                              <div className="phase2-card-price">
                                <span className="phase2-card-amount">+${displayUpgrade}</span>
                                <span className="phase2-card-term">added to your listing</span>
                              </div>
                              <ul className="phase2-card-benefits">
                                <li>Appears above Standard listings</li>
                                <li>Higher visibility &amp; more client requests</li>
                                <li>Top-25 placement for 6 months</li>
                              </ul>
                              <p className="phase2-card-note">
                                Includes your Standard Listing (${activationPrice}) + Rank #{slot.rank} Upgrade (${displayUpgrade}) — ${displayTotal} total for a 6-month listing
                              </p>
                              <span className="phase2-card-cta">
                                Upgrade to Rank #{slot.rank} &rarr;
                              </span>
                            </div>
                          </button>
                        );
                      })}
                    </div>
                  ) : (
                    <div className="phase2-empty">
                      <p>No Top-25 positions available in {stateName || 'your state'} right now.</p>
                    </div>
                  )}

                  <div className="phase2-skip-wrap phase2-skip-wrap--bottom">
                    <button
                      type="button"
                      className="phase2-skip"
                      onClick={handleStandardActivationCheckout}
                    >
                      <span className="phase2-skip-inner">
                        <ArrowRight size={14} className="phase2-skip-icon" />
                        <span className="phase2-skip-text">
                          <span className="phase2-skip-main">No thanks &mdash; continue with Standard Listing ${hasDiscount ? formatPrice(discountedActivationPrice) : activationPrice}</span>
                          <span className="phase2-skip-sub">One payment for a 6-month listing</span>
                        </span>
                      </span>
                    </button>
                  </div>
                </div>
              </section>
            )}
          </>
        )}
      </div>

      <style>{`
        @keyframes spin {
          0% { transform: rotate(0deg); }
          100% { transform: rotate(360deg); }
        }

        @keyframes phase1FadeUp {
          0% { opacity: 0; transform: translateY(14px); }
          100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes phase1CinemaLineIn {
          0% { opacity: 0; transform: translateY(18px) scale(0.985); }
          100% { opacity: 1; transform: translateY(0) scale(1); }
        }

        @keyframes phase1HighlightPill {
          0% { transform: scale(0.9); opacity: 0; }
          100% { transform: scale(1); opacity: 1; }
        }

        @keyframes phase1CtaPulse {
          0%, 100% { box-shadow: 0 10px 28px rgba(15, 23, 42, 0.18), 0 0 0 0 rgba(37, 99, 235, 0.35); }
          50% { box-shadow: 0 14px 36px rgba(15, 23, 42, 0.22), 0 0 0 10px rgba(37, 99, 235, 0); }
        }

        * { box-sizing: border-box; }

        .upgrade-page-root {
          height: 100svh;
          min-height: 100svh;
          max-height: 100svh;
          background: radial-gradient(circle at 20% 10%, #F1F5F9 0%, #F8FAFC 60%, #F8FAFC 100%);
          display: flex;
          flex-direction: column;
          overflow: hidden;
        }

        .upgrade-page-root--phase2 {
          height: auto;
          max-height: none;
          min-height: 100svh;
          overflow: auto;
        }

        .upgrade-page-root--phase2 .upgrade-page-inner {
          overflow: visible;
          padding-top: clamp(18px, 4vh, 36px);
          padding-bottom: clamp(18px, 4vh, 36px);
        }

        .upgrade-page-inner {
          max-width: 760px;
          margin: 0 auto;
          width: 100%;
          flex: 1;
          display: flex;
          flex-direction: column;
          padding: clamp(6px, 1.2vh, 14px) clamp(14px, 4vw, 24px);
          min-height: 0;
          overflow: hidden;
        }

        .phase1-stage {
          flex: 1;
          display: flex;
          align-items: center;
          justify-content: center;
          min-height: 0;
          width: 100%;
        }

        .phase1-inner {
          width: 100%;
          display: flex;
          flex-direction: column;
          gap: clamp(8px, 1.4vh, 16px);
        }

        .phase1-hero {
          text-align: center;
          animation: phase1CinemaLineIn 700ms cubic-bezier(0.22, 1, 0.36, 1) both;
        }

        .phase1-title {
          margin: 0;
          font-size: clamp(26px, 6.2vw, 48px);
          line-height: 1.05;
          font-weight: 800;
          letter-spacing: -0.02em;
          color: #0f172a;
        }

        .phase1-subline {
          margin-top: clamp(6px, 1.2vh, 12px);
          display: flex;
          flex-wrap: wrap;
          align-items: center;
          justify-content: center;
          gap: 8px;
        }

        .phase1-hero-line {
          display: inline-flex;
          align-items: center;
          gap: 8px;
          flex-wrap: wrap;
          justify-content: center;
          font-size: clamp(14px, 3.4vw, 20px);
          color: #475569;
          font-weight: 500;
          line-height: 1.3;
        }

        .activation-cinema-highlight {
          display: inline-block;
          padding: 2px 12px;
          border-radius: 999px;
          background: linear-gradient(135deg, #DBEAFE 0%, #EFF6FF 100%);
          color: #1D4ED8;
          font-weight: 700;
          border: 1px solid rgba(37, 99, 235, 0.18);
          animation: phase1HighlightPill 600ms 280ms cubic-bezier(0.22, 1, 0.36, 1) both;
        }

        .phase1-activity {
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: clamp(6px, 1.2vw, 12px);
          padding: clamp(8px, 1.4vh, 14px) clamp(10px, 2vw, 16px);
          border-radius: 14px;
          background: #ffffff;
          border: 1px solid #E2E8F0;
          box-shadow: 0 4px 18px rgba(15, 23, 42, 0.04);
          opacity: 0;
          transform: translateY(10px);
          transition: opacity 520ms ease, transform 520ms cubic-bezier(0.22, 1, 0.36, 1);
          transition-delay: 180ms;
        }

        .phase1-activity--in {
          opacity: 1;
          transform: translateY(0);
        }

        .phase1-activity-cell {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          text-align: center;
          gap: 2px;
          min-width: 0;
        }

        .phase1-activity-value {
          font-size: clamp(15px, 3.6vw, 20px);
          font-weight: 800;
          color: #0f172a;
          line-height: 1.05;
          letter-spacing: -0.01em;
        }

        .phase1-activity-value--muted {
          color: #DC2626;
          font-weight: 700;
        }

        .phase1-activity-label {
          font-size: clamp(10px, 2.4vw, 12px);
          color: #64748b;
          line-height: 1.25;
        }

        .phase1-benefits {
          padding: clamp(10px, 1.6vh, 16px) clamp(14px, 2.4vw, 20px);
          background: #ffffff;
          border-radius: 14px;
          border: 1px solid #E2E8F0;
          box-shadow: 0 4px 18px rgba(15, 23, 42, 0.04);
          opacity: 0;
          transform: translateY(10px);
          transition: opacity 520ms ease, transform 520ms cubic-bezier(0.22, 1, 0.36, 1);
          transition-delay: 280ms;
        }

        .phase1-benefits--in {
          opacity: 1;
          transform: translateY(0);
        }

        .phase1-benefits-title {
          margin: 0 0 clamp(6px, 1vh, 10px);
          font-size: clamp(13px, 3vw, 16px);
          font-weight: 700;
          color: #0f172a;
          line-height: 1.2;
        }

        .phase1-benefits-list {
          margin: 0;
          padding: 0;
          list-style: none;
          display: grid;
          grid-template-columns: 1fr;
          row-gap: clamp(3px, 0.6vh, 6px);
        }

        .phase1-benefits-list li {
          position: relative;
          padding-left: 20px;
          font-size: clamp(13px, 3.2vw, 15px);
          color: #1e293b;
          line-height: 1.45;
          font-weight: 500;
        }

        .phase1-benefits-list li::before {
          content: '';
          position: absolute;
          left: 2px;
          top: 0.58em;
          width: 7px;
          height: 7px;
          border-radius: 50%;
          background: #2563EB;
        }

        /* Desktop chip grid — hidden on mobile */
        .phase1-benefits-chips {
          display: none;
        }

        /* Support text under CTA — mobile only */
        .phase1-cta-support {
          margin: 0;
          font-size: 12.5px;
          color: #64748b;
          text-align: center;
          letter-spacing: 0.01em;
          font-weight: 400;
        }

        @media (min-width: 768px) {
          .phase1-cta-support {
            display: none;
          }
        }

        @media (min-width: 768px) {
          .phase1-benefits {
            padding: 24px 32px 28px;
            text-align: center;
            background: #ffffff;
            border: 1px solid #EEF2F7;
            box-shadow: 0 2px 12px rgba(15, 23, 42, 0.03);
          }

          .phase1-benefits-title {
            text-align: center;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            color: #94a3b8;
            margin-bottom: 20px;
          }

          /* Hide plain bullet list on desktop */
          .phase1-benefits-list {
            display: none;
          }

          /* Premium 2-column feature row layout */
          .phase1-benefits-chips {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2px 24px;
            margin: 0;
            padding: 0;
            list-style: none;
          }

          .phase1-benefits-chips li {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px 10px 9px 6px;
            font-size: 13.5px;
            font-weight: 500;
            color: #334155;
            line-height: 1.35;
            text-align: left;
            border-radius: 8px;
            transition: background 140ms ease;
          }

          .phase1-benefits-chips li:hover {
            background: #F8FAFC;
          }

          .phase1-chip-icon {
            flex-shrink: 0;
            display: inline-block;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: linear-gradient(135deg, #2563EB 0%, #3B82F6 100%);
            position: relative;
            box-shadow: 0 1px 4px rgba(37, 99, 235, 0.22);
          }

          .phase1-chip-icon::after {
            content: '';
            position: absolute;
            left: 5px;
            top: 4px;
            width: 8px;
            height: 5px;
            border-left: 2px solid #fff;
            border-bottom: 2px solid #fff;
            transform: rotate(-45deg);
          }
        }

        .phase1-cta-wrap {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: clamp(4px, 0.8vh, 8px);
          opacity: 0;
          transform: translateY(10px);
          pointer-events: none;
          transition: opacity 560ms ease, transform 560ms cubic-bezier(0.22, 1, 0.36, 1);
          transition-delay: 400ms;
        }

        .phase1-cta-wrap--in {
          opacity: 1;
          transform: translateY(0);
          pointer-events: auto;
        }

        .phase1-cta {
          width: auto;
          max-width: 520px;
          display: inline-flex;
          align-items: center;
          gap: 16px;
          padding: 12px 16px 12px 14px;
          border-radius: 11px;
          border: none;
          cursor: pointer;
          font-size: 15px;
          font-weight: 700;
          color: #ffffff;
          background: linear-gradient(135deg, #1D4ED8 0%, #2563EB 100%);
          box-shadow: 0 8px 24px rgba(15, 23, 42, 0.16);
          transition: transform 180ms ease, box-shadow 180ms ease;
          animation: phase1CtaPulse 2600ms ease-in-out 800ms infinite;
          letter-spacing: 0.01em;
        }

        .phase1-cta:hover {
          transform: translateY(-1px);
          box-shadow: 0 10px 28px rgba(15, 23, 42, 0.22);
        }

        .phase1-cta:active {
          transform: translateY(0);
        }

        .phase1-cta--discount {
          background: linear-gradient(135deg, #0F172A 0%, #1E293B 100%);
        }

        .phase1-cta-left {
          display: flex;
          align-items: center;
          gap: 9px;
          min-width: 0;
        }

        .phase1-cta-zap {
          color: #FDE68A;
          flex-shrink: 0;
        }

        .phase1-cta-labels {
          display: flex;
          flex-direction: column;
          gap: 1px;
          text-align: left;
        }

        .phase1-cta-title {
          font-size: clamp(13.5px, 3.2vw, 15px);
          font-weight: 700;
          white-space: nowrap;
          line-height: 1.25;
        }

        .phase1-cta-subtitle {
          font-size: clamp(10px, 2.3vw, 11px);
          font-weight: 500;
          color: rgba(255, 255, 255, 0.6);
          white-space: nowrap;
          line-height: 1.2;
        }

        .phase1-cta-right {
          display: flex;
          align-items: center;
          gap: 4px;
          flex-shrink: 0;
          padding-left: 12px;
          border-left: 1px solid rgba(255, 255, 255, 0.15);
        }

        .phase1-cta-price {
          font-size: clamp(19px, 4.2vw, 22px);
          font-weight: 800;
          letter-spacing: -0.02em;
          line-height: 1;
        }

        .phase1-cta-old {
          font-size: clamp(10.5px, 2.2vw, 12px);
          font-weight: 500;
          text-decoration: line-through;
          color: rgba(255, 255, 255, 0.4);
          line-height: 1;
          margin-right: 2px;
        }

        .phase1-cta-arrow-icon {
          opacity: 0.5;
          flex-shrink: 0;
          transition: transform 180ms ease, opacity 180ms ease;
          margin-left: 2px;
        }

        .phase1-cta:hover .phase1-cta-arrow-icon {
          transform: translateX(2px);
          opacity: 1;
        }

        @media (max-width: 480px) {
          .phase1-cta--2col {
            padding: 11px 12px 11px 12px;
            gap: 10px;
          }
          .phase1-cta-right {
            padding-left: 10px;
            gap: 3px;
          }
          .phase1-cta-title {
            font-size: 13px;
          }
          .phase1-cta-subtitle {
            font-size: 9.5px;
          }
          .phase1-cta-price {
            font-size: 17px;
          }
          .phase1-cta-old {
            display: none;
          }
        }


        .discount-unlocked-bar {
          padding: 8px 14px;
          background: linear-gradient(90deg, #0F172A 0%, #1E293B 100%);
          color: #fff;
          text-align: center;
          font-size: clamp(11px, 2.6vw, 13px);
          flex-shrink: 0;
        }

        .discount-unlocked-bar__text strong {
          color: #FDE68A;
        }

        @media (max-height: 700px) {
          .upgrade-page-inner { padding-top: clamp(6px, 1.2vh, 12px); padding-bottom: clamp(6px, 1.2vh, 12px); }
          .phase1-inner { gap: clamp(6px, 1.2vh, 12px); }
          .phase1-benefits { padding: 8px 14px; }
          .phase1-benefits-list { row-gap: 3px; }
          .phase1-benefits-list li { font-size: 12.5px; line-height: 1.3; }
          .phase1-cta-support { font-size: 11.5px; }
        }

        @media (max-width: 420px) {
          .phase1-activity { gap: 6px; padding: 8px 8px; }
          .phase1-activity-value { font-size: 15px; }
          .phase1-activity-label { font-size: 10px; }
          .phase1-benefits-list li { font-size: 12.5px; padding-left: 18px; }
          .phase1-benefits-list li::before { width: 6px; height: 6px; }
          .phase1-cta-support { font-size: 11.5px; }
        }

        @media (prefers-reduced-motion: reduce) {
          .phase1-hero,
          .phase1-activity,
          .phase1-benefits,
          .phase1-cta-wrap,
          .phase1-cta,
          .activation-cinema-highlight {
            animation: none !important;
            transition: none !important;
            opacity: 1 !important;
            transform: none !important;
          }
        }

        /* Phase 2 — Top-25 cards */
        .phase2-stage {
          flex: 1;
          display: flex;
          align-items: center;
          justify-content: center;
          min-height: 0;
          width: 100%;
          animation: phase1FadeUp 420ms cubic-bezier(0.22, 1, 0.36, 1) both;
        }

        .phase2-inner {
          width: 100%;
          display: flex;
          flex-direction: column;
          gap: clamp(10px, 2vh, 20px);
        }

        .phase2-hero {
          text-align: center;
        }

        .phase2-title {
          margin: 0;
          font-size: clamp(22px, 5.2vw, 34px);
          line-height: 1.1;
          font-weight: 800;
          letter-spacing: -0.02em;
          color: #0f172a;
        }

        .phase2-sub {
          margin: clamp(4px, 0.8vh, 8px) 0 0;
          font-size: clamp(13px, 3vw, 16px);
          color: #475569;
          line-height: 1.4;
        }

        .phase2-cards {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
          gap: 12px;
        }

        .phase2-card {
          position: relative;
          display: flex;
          flex-direction: column;
          text-align: left;
          padding: 0;
          border: 1px solid #e2e8f0;
          border-radius: 14px;
          background: #ffffff;
          box-shadow: 0 4px 18px rgba(15, 23, 42, 0.06);
          cursor: pointer;
          overflow: hidden;
          transition: transform 180ms ease, box-shadow 180ms ease, border-color 180ms ease;
        }

        .phase2-card:hover {
          transform: translateY(-2px);
          box-shadow: 0 10px 26px rgba(15, 23, 42, 0.1);
          border-color: #cbd5e1;
        }

        .phase2-card-topbar {
          height: 3px;
          width: 100%;
          background: #2563EB;
        }

        .phase2-card--premium .phase2-card-topbar {
          background: #FFAE00;
        }

        .phase2-card-body {
          padding: clamp(10px, 1.5vh, 14px) 16px clamp(12px, 1.8vh, 16px);
          display: flex;
          flex-direction: column;
          gap: clamp(5px, 0.9vh, 8px);
        }

        .phase2-rank-badge {
          display: inline-flex;
          align-items: center;
          justify-content: center;
          min-width: 34px;
          height: 26px;
          padding: 0 8px;
          border-radius: 7px;
          font-size: 12px;
          font-weight: 800;
          color: #ffffff;
          background: #2563EB;
          letter-spacing: 0.02em;
          vertical-align: middle;
          position: relative;
          top: -1px;
        }

        .phase2-card--premium .phase2-rank-badge {
          background: #FFAE00;
          color: #1f2937;
        }

        .phase2-card-title {
          margin: 0;
          font-size: 15px;
          font-weight: 700;
          color: #0f172a;
          line-height: 1.25;
          display: flex;
          align-items: center;
          gap: 7px;
        }

        .phase2-card-benefits {
          margin: 0;
          padding: 0;
          list-style: none;
          display: grid;
          gap: 3px;
        }

        .phase2-card-benefits li {
          position: relative;
          padding-left: 16px;
          font-size: 12.5px;
          color: #334155;
          line-height: 1.4;
        }

        .phase2-card-benefits li::before {
          content: '';
          position: absolute;
          left: 2px;
          top: 0.55em;
          width: 5px;
          height: 5px;
          border-radius: 50%;
          background: #2563EB;
        }

        .phase2-card--premium .phase2-card-benefits li::before {
          background: #FFAE00;
        }

        .phase2-card-price {
          display: flex;
          align-items: baseline;
          gap: 6px;
          margin-top: 2px;
        }

        .phase2-card-amount {
          font-size: clamp(17px, 4vw, 20px);
          font-weight: 800;
          color: #0f172a;
        }

        .phase2-card-term {
          font-size: 11.5px;
          color: #64748b;
        }

        .phase2-card-note {
          margin: 0;
          font-size: 12px;
          color: #475569;
          line-height: 1.4;
          padding: 6px 8px;
          background: #f8fafc;
          border-radius: 6px;
          border: 1px dashed #e2e8f0;
        }


        .phase2-card-cta {
          margin-top: 2px;
          display: inline-flex;
          align-items: center;
          justify-content: center;
          padding: clamp(7px, 1vh, 9px) 14px;
          border-radius: 10px;
          background: linear-gradient(135deg, #1D4ED8 0%, #2563EB 100%);
          color: #ffffff;
          font-weight: 700;
          font-size: 13px;
          letter-spacing: 0.01em;
        }

        .phase2-card--premium .phase2-card-cta {
          background: linear-gradient(135deg, #F59E0B 0%, #FFAE00 100%);
          color: #1f2937;
        }

        .phase2-empty {
          padding: 16px;
          border-radius: 12px;
          background: #ffffff;
          border: 1px solid #e2e8f0;
          text-align: center;
          color: #64748b;
          font-size: 14px;
        }

        .phase2-skip-wrap {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 6px;
          margin-top: 2px;
        }

        .phase2-skip-wrap--bottom {
          margin-top: 4px;
          margin-bottom: 8px;
        }

        .phase2-skip-hint {
          margin: 0;
          font-size: clamp(10px, 2.4vw, 12px);
          color: #94a3b8;
          text-align: center;
          font-weight: 400;
        }

        .phase2-skip {
          width: 100%;
          max-width: 520px;
          padding: clamp(11px, 1.6vh, 15px) 20px;
          border-radius: 10px;
          border: 1.5px solid #f87171;
          background: #fff1f2;
          color: #b91c1c;
          cursor: pointer;
          display: flex;
          align-items: center;
          justify-content: center;
          transition: background 160ms ease, border-color 160ms ease, box-shadow 160ms ease;
          box-shadow: 0 1px 4px rgba(185, 28, 28, 0.08);
        }

        .phase2-skip:hover {
          background: #ffe4e6;
          border-color: #ef4444;
          box-shadow: 0 2px 10px rgba(185, 28, 28, 0.13);
        }

        .phase2-skip:active {
          background: #fecdd3;
          border-color: #dc2626;
        }

        .phase2-skip-inner {
          display: flex;
          align-items: center;
          gap: 9px;
        }

        .phase2-skip-icon {
          flex-shrink: 0;
          opacity: 0.75;
        }

        .phase2-skip-text {
          display: flex;
          flex-direction: column;
          align-items: flex-start;
          gap: 2px;
          text-align: left;
        }

        .phase2-skip-main {
          font-size: clamp(12px, 3vw, 14px);
          font-weight: 600;
          line-height: 1.3;
          color: #b91c1c;
        }

        .phase2-skip-sub {
          font-size: clamp(10px, 2.4vw, 11.5px);
          font-weight: 400;
          opacity: 0.6;
          line-height: 1.2;
          color: #b91c1c;
        }

        @media (max-width: 640px) {
          .phase2-sub {
            display: none;
          }

          .phase2-title {
            font-size: 19px;
          }

          .phase2-inner {
            gap: 8px;
          }

          .phase2-card-body {
            padding: 9px 13px 11px;
            gap: 5px;
          }

          .phase2-card-note {
            padding: 5px 7px;
            font-size: 11px;
          }

          .phase2-card-benefits {
            gap: 2px;
          }

          .phase2-card-benefits li {
            font-size: 12px;
          }

          .phase2-card-cta {
            padding: 7px 12px;
            margin-top: 1px;
          }

          .phase2-skip-wrap {
            margin-top: 1px;
            margin-bottom: 16px;
            gap: 3px;
          }

          .phase2-skip {
            padding: 9px 14px;
          }
        }
      `}</style>
    </div>
  );
}

function ActivationUpgradeFallback() {
  return (
    <div style={{ minHeight: '100svh', backgroundColor: '#F8FAFC', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '24px' }}>
      <div style={{ maxWidth: '480px', width: '100%', textAlign: 'center' }}>
        <div style={{ marginBottom: '24px' }}>
          <div style={{ width: '48px', height: '48px', borderRadius: '50%', backgroundColor: '#f1f5f9', display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 16px' }}>
            <Zap size={22} style={{ color: '#64748b' }} />
          </div>
          <h1 style={{ fontSize: '20px', fontWeight: 700, color: '#0f172a', marginBottom: '8px', lineHeight: 1.2 }}>
            Your activation details are loading
          </h1>
          <p style={{ fontSize: '14px', color: '#475569', lineHeight: 1.6 }}>
            We're preparing your listing options. You can continue below or return to the previous page.
          </p>
        </div>
        <div style={{ display: 'flex', gap: '10px', justifyContent: 'center', flexWrap: 'wrap' }}>
          <button
            onClick={() => window.history.back()}
            style={{ backgroundColor: '#fff', color: '#374151', padding: '10px 20px', borderRadius: '8px', border: '1.5px solid #cbd5e1', fontSize: '14px', fontWeight: 500, cursor: 'pointer' }}
          >
            Go back
          </button>
          <button
            onClick={() => { window.location.href = '/'; }}
            style={{ backgroundColor: '#0f172a', color: '#fff', padding: '10px 20px', borderRadius: '8px', border: 'none', fontSize: '14px', fontWeight: 500, cursor: 'pointer' }}
          >
            Return to home
          </button>
        </div>
      </div>
    </div>
  );
}

export default function ActivationUpgradePage() {
  useNoindex();
  return (
    <ErrorBoundary fallback={<ActivationUpgradeFallback />}>
      <ActivationUpgradePageInner />
    </ErrorBoundary>
  );
}
