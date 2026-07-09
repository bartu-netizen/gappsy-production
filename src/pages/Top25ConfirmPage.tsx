import { useState, useEffect, useRef } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { getListingProductByTier, getAddonProduct } from '../config/stripe';
import { CHECKOUT_UPSELLS, replaceStateName } from '../config/upsells';
import { decodeTop25ConfirmParams } from '../utils/top25FunnelNav';
import { getFsid, getEntryPath, logFunnelEvent, FUNNEL_EVENTS, trackAgencyFunnelEvent } from '../utils/yourAgencyFunnel';
import { reliablePost } from '../utils/trackingTransport';
import { resolveScopedDiscountForAgency, getOfferTokenIfFlow, resolveActiveScopedOfferToken } from '../utils/discountOffer';
import type { DiscountOffer } from '../utils/discountOffer';
import { getDiscountedFullCardPrice, formatPrice } from '../utils/discountPricing';
import { extractDiscountContext, trackDiscountCheckoutOpened } from '../utils/discountCheckoutTracking';
import { useFastCheckout } from '../hooks/useFastCheckout';
import { useNoindex } from '../components/NoindexMeta';
import { trackBeforeNav } from '../utils/trackBeforeNav';

export default function Top25ConfirmPage() {
  useNoindex();
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const { checkoutData: contextData, upsells, setUpsell, setCheckoutData } = useTop25Checkout();
  const { isProcessing, error, setError, launch: launchCheckout } = useFastCheckout();
  const [showTooltip, setShowTooltip] = useState(false);
  const [step, setStep] = useState<1 | 2>(1);
  const [activeOffer, setActiveOffer] = useState<DiscountOffer | null>(null);
  const [activeOfferToken, setActiveOfferToken] = useState<string | null>(null);
  const tooltipRef = useRef<HTMLDivElement>(null);
  const checkoutClickRef = useRef(false);
  const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;
  const showDebug = searchParams.get('debug') === '1';

  const checkoutData = contextData ?? decodeTop25ConfirmParams(searchParams);

  useEffect(() => {
    if (checkoutData && !contextData) {
      setCheckoutData(checkoutData);
    }
  }, []);

  useEffect(() => {
    if (!checkoutData) return;
    const agencyId = checkoutData.agencyId || null;
    const stateSlug = checkoutData.stateSlug || null;
    // URL token may have been stored in session flow by prior page
    const urlToken = getOfferTokenIfFlow(['offer_redirect', 'top25_landing']);
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

  useEffect(() => {
    window.scrollTo({ top: 0, left: 0, behavior: "instant" });
    setTimeout(() => window.scrollTo(0, 0), 50);
  }, []);

  useEffect(() => {
    if (!checkoutData) return;
    logFunnelEvent({
      ...FUNNEL_EVENTS.ACTIVATION_OFFER_VIEWED,
      agency_id: checkoutData.agencyId || undefined,
      agency_name: checkoutData.agencyName,
      state_slug: checkoutData.stateSlug,
    });
    reliablePost('funnel-track', {
      funnelType: 'activation',
      eventName: 'top25_confirm_viewed',
      stateSlug: checkoutData.stateSlug,
      agencyName: checkoutData.agencyName,
      agencyId: checkoutData.agencyId,
      metadata: {
        page: 'top25_confirm',
        listing_type: 'top25',
        rank: typeof checkoutData.selectedRank === 'number' ? checkoutData.selectedRank : null,
      },
    }, 'top25_confirm_viewed');

    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.TOP25_CONFIRM_VIEWED.event_name,
      {
        page: 'top25_confirm',
        selected_position: checkoutData.selectedRank ?? null,
        listing_tier: checkoutData.listingTier,
        replaced_standard: checkoutData.replacedStandard ?? false,
        agency_id: checkoutData.agencyId || null,
        agency_name: checkoutData.agencyName,
        state_slug: checkoutData.stateSlug,
        state_name: checkoutData.stateName,
      },
      {
        kind: 'page_view',
        stepNumber: FUNNEL_EVENTS.TOP25_CONFIRM_VIEWED.step_number,
        agency_id: checkoutData.agencyId || undefined,
        agency_name: checkoutData.agencyName,
        state_slug: checkoutData.stateSlug,
        state_name: checkoutData.stateName,
      }
    );
  }, []);

  useEffect(() => {
    if (checkoutData) {
      document.title = `Confirm Your Top 25 ${checkoutData.stateName} Listing | Gappsy`;
    }
  }, [checkoutData]);

  if (!checkoutData) {
    const stateSlug = searchParams.get('state') || '';
    const stateParam = stateSlug ? `/marketing-agencies-in-${stateSlug}-united-states/` : '/';
    return (
      <div style={{
        minHeight: '100vh',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: '#f8fafc',
        padding: '40px 20px',
      }}>
        <div style={{ maxWidth: '480px', textAlign: 'center' }}>
          <div style={{ fontSize: '40px', marginBottom: '16px' }}>⚠</div>
          <h2 style={{ fontSize: '20px', fontWeight: 700, color: '#0f172a', marginBottom: '12px' }}>
            We couldn't load your listing selection
          </h2>
          <p style={{ fontSize: '14px', color: '#64748b', lineHeight: 1.6, marginBottom: '28px' }}>
            Your session may have expired or this page was opened directly. Please go back to the state page and select a listing again.
          </p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '10px', alignItems: 'center' }}>
            {stateSlug && (
              <button
                onClick={() => navigate(stateParam)}
                style={{
                  width: '100%',
                  maxWidth: '320px',
                  backgroundColor: '#4F46E5',
                  color: '#fff',
                  padding: '12px 24px',
                  borderRadius: '8px',
                  border: 'none',
                  fontWeight: 600,
                  fontSize: '14px',
                  cursor: 'pointer',
                }}
              >
                Go back to state page
              </button>
            )}
            <button
              onClick={() => navigate('/')}
              style={{
                width: '100%',
                maxWidth: '320px',
                backgroundColor: '#fff',
                color: '#475569',
                padding: '12px 24px',
                borderRadius: '8px',
                border: '1px solid #e2e8f0',
                fontWeight: 500,
                fontSize: '14px',
                cursor: 'pointer',
              }}
            >
              Restart listing flow
            </button>
            <button
              onClick={() => window.location.reload()}
              style={{
                width: '100%',
                maxWidth: '320px',
                backgroundColor: '#fff',
                color: '#94a3b8',
                padding: '10px 24px',
                borderRadius: '8px',
                border: '1px solid #e2e8f0',
                fontWeight: 500,
                fontSize: '13px',
                cursor: 'pointer',
              }}
            >
              Retry
            </button>
          </div>
          {import.meta.env.DEV && (
            <details style={{ marginTop: '24px', textAlign: 'left' }}>
              <summary style={{ fontSize: '12px', color: '#94a3b8', cursor: 'pointer' }}>Debug info</summary>
              <pre style={{ fontSize: '11px', color: '#64748b', marginTop: '8px', whiteSpace: 'pre-wrap', wordBreak: 'break-all' }}>
                {`URL params: ${searchParams.toString()}\nContext data: null\nURL decoded: null (missing required fields)`}
              </pre>
            </details>
          )}
        </div>
      </div>
    );
  }

  const listingProduct = getListingProductByTier(checkoutData.listingTier);

  if (!listingProduct) {
    return (
      <div className="funnelBackground" style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '40px 20px',
        textAlign: 'center'
      }}>
        <div style={{ maxWidth: '500px' }}>
          <h2 style={{ color: '#DC2626', marginBottom: '16px', fontSize: '24px', fontWeight: 600 }}>
            Product Configuration Error
          </h2>
          <p style={{ color: '#475569', marginBottom: '24px', lineHeight: 1.6 }}>
            We're unable to load the pricing for this listing tier. Please contact support or try again later.
          </p>
          <button
            onClick={() => navigate('/')}
            style={{
              backgroundColor: '#4F46E5',
              color: '#fff',
              padding: '12px 24px',
              borderRadius: '8px',
              border: 'none',
              fontWeight: 600,
              cursor: 'pointer'
            }}
          >
            Return to Home
          </button>
        </div>
      </div>
    );
  }

  const creditDollars = (checkoutData.creditCents ?? 0) / 100;
  const extraDiscountDollars = (checkoutData.extraDiscountCents ?? 0) / 100;

  const upgradeDiscount = checkoutData.replacedStandard ? 0.20 : 0;

  const offerDiscountPercent = activeOffer?.discount_type === 'percentage' ? activeOffer.discount_value : 0;
  const hasOfferDiscount = offerDiscountPercent > 0;

  const applyDiscount = (amount: number): number => {
    if (hasOfferDiscount) return getDiscountedFullCardPrice(amount, offerDiscountPercent);
    if (upgradeDiscount > 0) return Math.round(amount * (1 - upgradeDiscount) * 100) / 100;
    return amount;
  };

  const discountedListingAmount = applyDiscount(listingProduct.amount);

  const calculateTotal = () => {
    let total = discountedListingAmount;

    if (upsells.cardVisual) {
      const product = getAddonProduct('cardVisual');
      if (product) total += applyDiscount(product.amount);
    }

    if (upsells.getMatched) {
      const product = getAddonProduct('getMatched');
      if (product) total += applyDiscount(product.amount);
    }

    return Math.max(0, total - creditDollars - extraDiscountDollars);
  };

  const totalPrice = calculateTotal();

  const handleToggleAddon = (addonKey: 'cardVisual' | 'getMatched', newValue: boolean) => {
    setUpsell(addonKey, newValue);
    if (!checkoutData) return;
    trackAgencyFunnelEvent(
      FUNNEL_EVENTS.TOP25_CONFIRM_ADDON_TOGGLED.event_name,
      {
        page: 'top25_confirm',
        addon: addonKey,
        action: newValue ? 'enabled' : 'disabled',
        selected_position: checkoutData.selectedRank ?? null,
        agency_id: checkoutData.agencyId || null,
        agency_name: checkoutData.agencyName,
        state_slug: checkoutData.stateSlug,
        state_name: checkoutData.stateName,
      },
      {
        kind: 'toggle',
        dedupeKey: `addon:${addonKey}:${newValue ? 'on' : 'off'}`,
        stepNumber: FUNNEL_EVENTS.TOP25_CONFIRM_ADDON_TOGGLED.step_number,
        agency_id: checkoutData.agencyId || undefined,
        agency_name: checkoutData.agencyName,
        state_slug: checkoutData.stateSlug,
        state_name: checkoutData.stateName,
      }
    );
  };

  const handleCheckout = async () => {
    if (checkoutClickRef.current) return;
    checkoutClickRef.current = true;
    try {
    await trackBeforeNav(() => {
      if (checkoutData) {
        trackAgencyFunnelEvent(
          FUNNEL_EVENTS.TOP25_CONFIRM_CONTINUE_CLICKED.event_name,
          {
            page: 'top25_confirm',
            selected_position: checkoutData.selectedRank ?? null,
            listing_tier: checkoutData.listingTier,
            addon_card_visual: !!upsells.cardVisual,
            addon_get_matched: !!upsells.getMatched,
            total_price: totalPrice,
            replaced_standard: checkoutData.replacedStandard ?? false,
            click_location: 'confirm_continue_button',
            agency_id: checkoutData.agencyId || null,
            agency_name: checkoutData.agencyName,
            state_slug: checkoutData.stateSlug,
            state_name: checkoutData.stateName,
          },
          {
            kind: 'click',
            dedupeKey: 'confirm_continue',
            stepNumber: FUNNEL_EVENTS.TOP25_CONFIRM_CONTINUE_CLICKED.step_number,
            agency_id: checkoutData.agencyId || undefined,
            agency_name: checkoutData.agencyName,
            state_slug: checkoutData.stateSlug,
            state_name: checkoutData.stateName,
          }
        );
      }

      if (activeOffer) {
        trackDiscountCheckoutOpened(extractDiscountContext(activeOffer, {
          agency_id: checkoutData.agencyId,
        }));
      }
    });

    const fsid = getFsid(false);
    const entryPath = getEntryPath();
    const agencySlug = checkoutData.agencyId
      ? checkoutData.agencyId
      : (checkoutData.agencyName || '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '') + (checkoutData.stateSlug ? `-${checkoutData.stateSlug}` : '');

    const lineItems: Array<{ price: string; quantity: number }> = [
      { price: listingProduct.priceId, quantity: 1 },
    ];

    if (upsells.cardVisual) {
      const product = getAddonProduct('cardVisual');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    if (upsells.getMatched) {
      const product = getAddonProduct('getMatched');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    launchCheckout(
      () => ({
        listingType:        checkoutData.replacedStandard ? 'top25_upgrade' : (checkoutData.listingType || 'top25'),
        stateSlug:          checkoutData.stateSlug,
        stateName:          checkoutData.stateName,
        rank:               checkoutData.selectedRank,
        agencyName:         checkoutData.agencyName,
        agencyWebsite:      checkoutData.agencyWebsite,
        agencyDescription:  checkoutData.agencyDescription,
        agencyServices:     checkoutData.agencyServices,
        listingTier:        checkoutData.listingTier,
        lineItems,
        agencyId:           checkoutData.agencyId    || '',
        top25SlotId:        checkoutData.top25SlotId || '',
        logoUrl:            checkoutData.logoUrl     || '',
        upsells: {
          cardVisual: upsells.cardVisual,
          getMatched: upsells.getMatched,
          spotlight:  upsells.spotlight,
        },
        fsid:               fsid       || undefined,
        agencySlug:         agencySlug || undefined,
        entryPath:          entryPath  || undefined,
        offer_token:        activeOfferToken || getOfferTokenIfFlow(['offer_redirect', 'top25_landing']) || resolveActiveScopedOfferToken({ agencyId: checkoutData.agencyId || null, stateSlug: checkoutData.stateSlug || null }) || undefined,
        upgrade_offer_id:   checkoutData.upgradeOfferId || undefined,
        creditCents:        checkoutData.creditCents        ?? undefined,
        extraDiscountCents: checkoutData.extraDiscountCents ?? undefined,
        replacedStandard:   checkoutData.replacedStandard   ?? undefined,
        upgradeDiscount:    upgradeDiscount > 0 ? upgradeDiscount : undefined,
        checkoutSource:     'top25_confirm',
      }),
      {
        trackingPayload: {
          funnel_name:  checkoutData.replacedStandard ? 'top25_upgrade' : (checkoutData.listingType || 'top25'),
          event_name:   'checkout_page_viewed',
          step_number:  150,
          state_slug:   checkoutData.stateSlug,
          agency_name:  checkoutData.agencyName,
          agency_id:    checkoutData.agencyId || undefined,
          is_demo:      false,
          metadata: {
            rank:               checkoutData.selectedRank,
            listing_tier:       checkoutData.listingTier,
            upsell_card_visual: upsells.cardVisual,
            upsell_get_matched: upsells.getMatched,
            source:             'top25_confirm_page',
            replaced_standard:  checkoutData.replacedStandard ?? false,
            upgrade_discount:   upgradeDiscount > 0 ? `${upgradeDiscount * 100}%` : undefined,
            original_intent:    checkoutData.replacedStandard ? 'standard_97' : undefined,
          },
        },
      }
    );
    } catch { checkoutClickRef.current = false; }
  };

  return (
    <div
      className="funnelBackground"
      style={{
        padding: isMobile ? '20px 16px' : '40px 24px'
      }}
    >
      <div style={{ maxWidth: isMobile ? '100%' : '720px', margin: '0 auto' }}>
        {searchParams.get('position_unavailable') === '1' && (
          <div
            role="status"
            style={{
              margin: '0 0 16px',
              padding: '12px 16px',
              background: '#FFF7ED',
              border: '1px solid #FED7AA',
              borderRadius: '10px',
              color: '#9A3412',
              fontSize: '14px',
              lineHeight: 1.5,
              textAlign: 'center',
            }}
          >
            That position is no longer available. Here are the currently available positions.
          </div>
        )}
        <h1 style={{
          fontSize: isMobile ? '18px' : '22px',
          fontWeight: 600,
          color: '#0f172a',
          lineHeight: 1.3,
          marginBottom: isMobile ? '10px' : '12px',
          textAlign: 'center'
        }}>
          Secure {checkoutData.agencyName}'s Spot
        </h1>

        {isMobile ? (
          <p style={{
            fontSize: '13px',
            color: '#475569',
            lineHeight: 1.5,
            textAlign: 'center',
            maxWidth: '540px',
            margin: '0 auto',
            marginBottom: '16px'
          }}>
            You're securing Rank #{checkoutData.selectedRank} for 6 months on the {checkoutData.stateName} Top 25 list.
            This upgrade is only available now and cannot be added later.
          </p>
        ) : (
          <>
            <p style={{
              fontSize: '14px',
              color: '#475569',
              lineHeight: 1.5,
              textAlign: 'center',
              maxWidth: '540px',
              margin: '0 auto',
              marginBottom: '8px'
            }}>
              You're securing Rank #{checkoutData.selectedRank} for 6 months on the {checkoutData.stateName} Top 25 list.
            </p>
            <p style={{
              fontSize: '14px',
              color: '#4B5563',
              lineHeight: 1.5,
              textAlign: 'center',
              maxWidth: '540px',
              margin: '0 auto',
              marginBottom: '24px'
            }}>
              This upgrade is only available now and cannot be added later.
            </p>
          </>
        )}

        {error && (
          <div style={{
            backgroundColor: '#FEE2E2',
            border: '1px solid #FCA5A5',
            borderRadius: '8px',
            padding: '12px 16px',
            marginBottom: '16px',
            color: '#DC2626',
            fontSize: '14px',
            textAlign: 'center'
          }}>
            {error}
          </div>
        )}

        {step === 1 && (
          <div
            onClick={() => handleToggleAddon('cardVisual', !upsells.cardVisual)}
            style={{
              border: '2px dashed #fb923c',
              borderRadius: '12px',
              backgroundColor: '#fff7ed',
              padding: isMobile ? '16px' : '24px',
              marginTop: isMobile ? '16px' : '24px',
              marginBottom: isMobile ? '14px' : '18px',
              cursor: 'pointer',
              boxShadow: '0 2px 10px rgba(251, 146, 60, 0.12)',
              transition: 'all 0.2s ease',
              minHeight: isMobile ? 'auto' : '140px'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.boxShadow = '0 6px 20px rgba(251, 146, 60, 0.2)';
              e.currentTarget.style.transform = 'translateY(-2px)';
              e.currentTarget.style.backgroundColor = '#fff9f5';
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.boxShadow = '0 2px 10px rgba(251, 146, 60, 0.12)';
              e.currentTarget.style.transform = 'translateY(0)';
              e.currentTarget.style.backgroundColor = '#fff7ed';
            }}
          >
            <div style={{ display: 'flex', gap: isMobile ? '12px' : '16px', alignItems: 'flex-start' }}>
              <input
                type="checkbox"
                checked={upsells.cardVisual}
                onChange={(e) => {
                  e.stopPropagation();
                  handleToggleAddon('cardVisual', e.target.checked);
                }}
                onClick={(e) => e.stopPropagation()}
                style={{
                  marginTop: '3px',
                  width: isMobile ? '18px' : '22px',
                  height: isMobile ? '18px' : '22px',
                  cursor: 'pointer',
                  flexShrink: 0,
                  accentColor: '#ea580c'
                }}
              />
              <div style={{ flex: 1 }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '8px', flexWrap: 'wrap' }}>
                  <div
                    style={{ position: 'relative' }}
                    onMouseEnter={() => setShowTooltip(true)}
                    onMouseLeave={() => setShowTooltip(false)}
                  >
                    <img
                      src="/featured-agency-badge.svg"
                      alt="Featured badge"
                      style={{
                        width: '32px',
                        height: '32px',
                        verticalAlign: 'middle',
                        flexShrink: 0
                      }}
                    />
                    {showTooltip && (
                      <div
                        ref={tooltipRef}
                        style={{
                          position: 'absolute',
                          bottom: '100%',
                          left: '50%',
                          transform: 'translateX(-50%)',
                          marginBottom: '8px',
                          backgroundColor: '#1e293b',
                          color: 'white',
                          padding: '6px 12px',
                          borderRadius: '6px',
                          fontSize: '12px',
                          whiteSpace: 'nowrap',
                          zIndex: 1000,
                          boxShadow: '0 4px 12px rgba(0,0,0,0.15)',
                          pointerEvents: 'none'
                        }}
                      >
                        Featured badge — helps your agency stand out in the listings
                        <div style={{
                          position: 'absolute',
                          top: '100%',
                          left: '50%',
                          transform: 'translateX(-50%)',
                          width: 0,
                          height: 0,
                          borderLeft: '6px solid transparent',
                          borderRight: '6px solid transparent',
                          borderTop: '6px solid #1e293b'
                        }} />
                      </div>
                    )}
                  </div>
                  <p style={{
                    fontSize: isMobile ? '14px' : '16px',
                    fontWeight: 600,
                    color: '#F97316',
                    margin: 0
                  }}>
                    {CHECKOUT_UPSELLS.visualUpgrade.title}
                  </p>
                </div>
                <p style={{
                  fontSize: isMobile ? '12px' : '14px',
                  color: '#64748b',
                  lineHeight: 1.6
                }}>
                  {replaceStateName(CHECKOUT_UPSELLS.visualUpgrade.description, checkoutData.stateName)}
                </p>
              </div>
            </div>
          </div>
        )}

        {step === 2 && (
          <div
            onClick={() => handleToggleAddon('getMatched', !upsells.getMatched)}
            style={{
              border: '2px dashed #3b82f6',
              borderRadius: '12px',
              backgroundColor: '#eff6ff',
              padding: isMobile ? '16px' : '24px',
              marginBottom: isMobile ? '18px' : '24px',
              cursor: 'pointer',
              boxShadow: '0 2px 10px rgba(59, 130, 246, 0.12)',
              transition: 'all 0.2s ease',
              minHeight: isMobile ? 'auto' : '140px'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.boxShadow = '0 6px 20px rgba(59, 130, 246, 0.2)';
              e.currentTarget.style.transform = 'translateY(-2px)';
              e.currentTarget.style.backgroundColor = '#f0f7ff';
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.boxShadow = '0 2px 10px rgba(59, 130, 246, 0.12)';
              e.currentTarget.style.transform = 'translateY(0)';
              e.currentTarget.style.backgroundColor = '#eff6ff';
            }}
          >
            <div style={{ display: 'flex', gap: isMobile ? '12px' : '16px', alignItems: 'flex-start' }}>
              <input
                type="checkbox"
                checked={upsells.getMatched}
                onChange={(e) => {
                  e.stopPropagation();
                  handleToggleAddon('getMatched', e.target.checked);
                }}
                onClick={(e) => e.stopPropagation()}
                style={{
                  marginTop: '3px',
                  width: isMobile ? '18px' : '22px',
                  height: isMobile ? '18px' : '22px',
                  cursor: 'pointer',
                  flexShrink: 0,
                  accentColor: '#2563eb'
                }}
              />
              <div style={{ flex: 1 }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '8px', flexWrap: 'wrap' }}>
                  <p style={{
                    fontSize: isMobile ? '14px' : '16px',
                    fontWeight: 600,
                    color: '#4F46E5',
                    margin: 0
                  }}>
                    {CHECKOUT_UPSELLS.leadMatching.title}
                  </p>
                  {CHECKOUT_UPSELLS.leadMatching.recommended && (
                    <span style={{
                      backgroundColor: '#dcfce7',
                      color: '#166534',
                      fontSize: isMobile ? '11px' : '12px',
                      fontWeight: 600,
                      padding: '3px 10px',
                      borderRadius: '12px',
                      whiteSpace: 'nowrap',
                      flexShrink: 0
                    }}>
                      Recommended
                    </span>
                  )}
                </div>
                <p style={{
                  fontSize: isMobile ? '12px' : '14px',
                  color: '#64748b',
                  lineHeight: 1.6
                }}>
                  {replaceStateName(CHECKOUT_UPSELLS.leadMatching.description, checkoutData.stateName)}
                </p>
              </div>
            </div>
          </div>
        )}

        <div style={{
          backgroundColor: '#ffffff',
          border: '1px solid #e2e8f0',
          borderRadius: '10px',
          padding: isMobile ? '12px' : '14px',
          marginBottom: isMobile ? '14px' : '16px'
        }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
            <div>
              <div style={{
                fontSize: isMobile ? '13px' : '14px',
                fontWeight: 600,
                color: '#0f172a',
                marginBottom: '2px'
              }}>
                {checkoutData.listingType === 'top25_upgrade'
                  ? `Upgrade to Rank #${checkoutData.selectedRank} — ${checkoutData.stateName} Top 25`
                  : `Rank #${checkoutData.selectedRank} — ${checkoutData.stateName} Top 25 List`}
              </div>
              <div style={{
                fontSize: isMobile ? '12px' : '13px',
                color: '#64748b'
              }}>
                {hasOfferDiscount || upgradeDiscount > 0
                  ? `$${formatPrice(discountedListingAmount)} every 6 months — cancel anytime`
                  : `$${listingProduct.amount} every 6 months — cancel anytime`}
              </div>
              {checkoutData.listingType === 'top25_upgrade' && (
                <div style={{ fontSize: '12px', color: '#475569', marginTop: '4px' }}>
                  Includes your Standard Listing + {checkoutData.listingTier === 'premium' ? 'Premium' : checkoutData.listingTier === 'priority' ? 'Priority' : 'Standard'} Top-25 placement
                </div>
              )}
              {(hasOfferDiscount || upgradeDiscount > 0) && (
                <div style={{ fontSize: '12px', color: '#16a34a', fontWeight: 600, marginTop: '2px' }}>
                  {hasOfferDiscount ? `${offerDiscountPercent}% discount applied` : 'Upgrade discount (20% off)'}
                </div>
              )}
            </div>
            <div style={{
              fontSize: isMobile ? '16px' : '18px',
              fontWeight: 700,
              color: '#0f172a',
              textAlign: 'right'
            }}>
              {(hasOfferDiscount || upgradeDiscount > 0) ? (
                <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-end', gap: '2px' }}>
                  <span style={{ textDecoration: 'line-through', color: '#94a3b8', fontSize: isMobile ? '13px' : '14px', fontWeight: 400 }}>
                    ${listingProduct.amount}
                  </span>
                  <span>${formatPrice(discountedListingAmount)}</span>
                </div>
              ) : (
                <>${listingProduct.amount}</>
              )}
            </div>
          </div>
        </div>

        {creditDollars > 0 && (
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            padding: isMobile ? '8px 0' : '10px 0',
            borderTop: '1px dashed #e2e8f0',
            marginBottom: '4px',
          }}>
            <span style={{ fontSize: isMobile ? '13px' : '14px', color: '#16a34a', fontWeight: 500 }}>
              Prior activation credit applied
            </span>
            <span style={{ fontSize: isMobile ? '14px' : '16px', color: '#16a34a', fontWeight: 600 }}>
              −${creditDollars.toFixed(0)}
            </span>
          </div>
        )}

        {extraDiscountDollars > 0 && (
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            padding: isMobile ? '8px 0' : '10px 0',
            borderTop: '1px dashed #e2e8f0',
            marginBottom: '4px',
          }}>
            <span style={{ fontSize: isMobile ? '13px' : '14px', color: '#2563eb', fontWeight: 500 }}>
              Extra admin discount applied
            </span>
            <span style={{ fontSize: isMobile ? '14px' : '16px', color: '#2563eb', fontWeight: 600 }}>
              −${extraDiscountDollars.toFixed(0)}
            </span>
          </div>
        )}

        {hasOfferDiscount && (
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            padding: isMobile ? '8px 0' : '10px 0',
            borderTop: '1px dashed #e2e8f0',
            marginBottom: '4px',
            backgroundColor: '#f0fdf4',
            borderRadius: '6px',
            paddingLeft: '10px',
            paddingRight: '10px',
          }}>
            <span style={{ fontSize: isMobile ? '12px' : '13px', color: '#15803d', fontWeight: 600 }}>
              This exclusive discount is currently active for your agency
            </span>
          </div>
        )}

        <div style={{
          backgroundColor: isMobile ? '#ffffff' : 'transparent',
          border: isMobile ? '1px solid #e2e8f0' : 'none',
          borderTop: isMobile ? '2px solid #e2e8f0' : '2px solid #e2e8f0',
          borderBottom: isMobile ? '2px solid #e2e8f0' : '2px solid #e2e8f0',
          borderRadius: isMobile ? '10px' : '0',
          padding: isMobile ? '12px' : '14px 0',
          marginBottom: isMobile ? '12px' : '20px'
        }}>
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center'
          }}>
            <span style={{
              fontSize: isMobile ? '15px' : '17px',
              fontWeight: 600,
              color: '#0f172a'
            }}>
              Total Today
            </span>
            <span style={{
              fontSize: isMobile ? '20px' : '24px',
              fontWeight: 700,
              color: '#0f172a',
              textAlign: 'right'
            }}>
              ${formatPrice(totalPrice)}
            </span>
          </div>
        </div>

        <button
          onClick={step === 1 ? () => setStep(2) : handleCheckout}
          disabled={isProcessing}
          style={{
            width: '100%',
            backgroundColor: isProcessing ? '#94a3b8' : '#4F46E5',
            color: '#FFFFFF',
            fontSize: isMobile ? '15px' : '17px',
            fontWeight: 600,
            padding: isMobile ? '14px 20px' : '16px 24px',
            borderRadius: '10px',
            border: 'none',
            cursor: isProcessing ? 'not-allowed' : 'pointer',
            boxShadow: '0 4px 14px rgba(58, 90, 254, 0.25)',
            transition: 'all 0.3s ease'
          }}
          onMouseEnter={(e) => {
            if (!isProcessing) {
              e.currentTarget.style.backgroundColor = '#4338CA';
              e.currentTarget.style.transform = 'translateY(-1px)';
              e.currentTarget.style.boxShadow = '0 6px 20px rgba(58, 90, 254, 0.35)';
            }
          }}
          onMouseLeave={(e) => {
            if (!isProcessing) {
              e.currentTarget.style.backgroundColor = '#4338CA';
              e.currentTarget.style.transform = 'translateY(0)';
              e.currentTarget.style.boxShadow = '0 4px 14px rgba(58, 90, 254, 0.25)';
            }
          }}
        >
          {isProcessing ? 'Redirecting to secure checkout...' : 'Continue to secure your spot'}
        </button>

        <p style={{
          marginTop: '16px',
          fontSize: isMobile ? '11px' : '12px',
          color: '#94a3b8',
          textAlign: 'center',
          lineHeight: 1.5
        }}>
          Secure payment powered by Stripe • Renews every 6 months • Cancel anytime
        </p>

        {showDebug && (
          <details open style={{ marginTop: '32px', textAlign: 'left' }}>
            <summary style={{ fontSize: '12px', color: '#94a3b8', cursor: 'pointer', marginBottom: '8px' }}>
              Debug panel (?debug=1)
            </summary>
            <pre style={{
              fontSize: '11px',
              color: '#64748b',
              backgroundColor: '#f8fafc',
              border: '1px solid #e2e8f0',
              borderRadius: '6px',
              padding: '12px',
              overflow: 'auto',
              whiteSpace: 'pre-wrap',
              wordBreak: 'break-all',
            }}>
              {JSON.stringify({
                checkoutData,
                upsells,
                listingProduct: { priceId: listingProduct.priceId, amount: listingProduct.amount, name: listingProduct.name },
                totalPrice,
                urlParams: Object.fromEntries(searchParams.entries()),
                contextDataPresent: contextData !== null,
                urlDecodedDataPresent: contextData === null,
              }, null, 2)}
            </pre>
          </details>
        )}
      </div>
    </div>
  );
}
