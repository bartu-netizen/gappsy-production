import { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { getSpotlightPlacementProduct, getAgencyActivationProduct, getAddonProduct } from '../config/stripe';
import { CHECKOUT_UPSELLS, replaceStateName } from '../config/upsells';
import { getFsid, getEntryPath, logFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';
import { trackActivationPageView } from '../utils/trackActivationPageView';
import { getOfferTokenIfFlow, resolveActiveScopedOfferToken, resolveScopedDiscountForAgency } from '../utils/discountOffer';
import type { DiscountOffer } from '../utils/discountOffer';
import { getDiscountedFullCardPrice, formatPrice } from '../utils/discountPricing';
import { useFastCheckout } from '../hooks/useFastCheckout';
import { useNoindex } from '../components/NoindexMeta';

export default function SpotlightConfirmPage() {
  useNoindex();
  const navigate = useNavigate();
  const { checkoutData, upsells, setUpsell, setCheckoutData } = useTop25Checkout();
  const { isProcessing, error, setError, launch: launchCheckout } = useFastCheckout();
  const [showTooltip, setShowTooltip] = useState(false);
  const [step, setStep] = useState<1 | 2>(1);
  const [activeOffer, setActiveOffer] = useState<DiscountOffer | null>(null);
  const [activeOfferToken, setActiveOfferToken] = useState<string | null>(null);
  const tooltipRef = useRef<HTMLDivElement>(null);
  const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;

  // Calculate this before useEffects that depend on it
  const isStandardListing =
    checkoutData?.listingType === 'activation' ||
    checkoutData?.listingType === 'other_listing' ||
    checkoutData?.listingType === 'top25_standard_only_release';

  useEffect(() => {
    window.scrollTo({
      top: 0,
      left: 0,
      behavior: "instant"
    });
    setTimeout(() => {
      window.scrollTo(0, 0);
    }, 50);
  }, []);

  useEffect(() => {
    if (!checkoutData) return;
    logFunnelEvent({
      ...FUNNEL_EVENTS.ACTIVATION_OFFER_VIEWED,
      agency_id: checkoutData.agencyId || undefined,
      agency_name: checkoutData.agencyName,
      state_slug: checkoutData.stateSlug,
    });
    trackActivationPageView({
      agency_id: checkoutData.agencyId,
      agency_name: checkoutData.agencyName,
      state_slug: checkoutData.stateSlug,
      listing_type: isStandardListing ? 'standard' : 'spotlight',
    });
  }, []);

  useEffect(() => {
    if (!checkoutData) {
      console.error('No checkout data found, redirecting...');
      navigate('/');
      return;
    }

    // CRITICAL GUARD 1: If user has already completed the standard upsells and moved forward,
    // NEVER show this page again - their upsell choices are locked in
    if (checkoutData.completedStandardUpsells) {
      console.log('User already completed standard upsells - blocking re-entry to upsell page');
      // If they're a standard listing buyer, send them to the upgrade offer
      // Otherwise send them home
      if (isStandardListing && !checkoutData.completedFinalUpgradeOffer) {
        navigate('/standard/upgrade-offer');
      } else {
        navigate('/');
      }
      return;
    }

    // CRITICAL GUARD 2: If user has already completed the final upgrade offer, NEVER show this page again
    // The upgrade offer page is the FINAL decision point - after that, we go directly to checkout
    if (checkoutData.completedFinalUpgradeOffer) {
      console.log('User already completed final upgrade offer - blocking re-entry to upsell page');
      // Send them home - they should not be able to re-enter the upsell flow
      navigate('/');
      return;
    }

    document.title = `Secure Your Spotlight Placement – ${checkoutData.stateName} | Gappsy`;
  }, [checkoutData, navigate, isStandardListing]);

  useEffect(() => {
    if (!checkoutData) return;
    let cancelled = false;
    const urlToken = getOfferTokenIfFlow(['offer_redirect', 'top25_landing']) || undefined;
    resolveScopedDiscountForAgency({
      agencyId: checkoutData.agencyId || null,
      stateSlug: checkoutData.stateSlug || null,
      urlToken,
      allowSessionScopedDiscount: true,
      allowGlobalScopedDiscount: true,
    })
      .then((resolved) => {
        if (cancelled) return;
        if (resolved && resolved.offer) {
          setActiveOffer(resolved.offer);
          setActiveOfferToken(resolved.token);
        }
      })
      .catch(() => {});
    return () => { cancelled = true; };
  }, [checkoutData?.agencyId, checkoutData?.stateSlug]);

  if (!checkoutData) {
    return (
      <div className="funnelBackground" style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '20px',
        textAlign: 'center',
        color: '#475569'
      }}>
        Loading...
      </div>
    );
  }

  const spotlightProduct = isStandardListing ? getAgencyActivationProduct() : getSpotlightPlacementProduct();

  if (!spotlightProduct) {
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
            We're unable to load the Spotlight product. Please contact support or try again later.
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

  const offerDiscountPercent = activeOffer?.discount_type === 'percentage' ? activeOffer.discount_value : 0;
  const hasOfferDiscount = offerDiscountPercent > 0;
  const applyOfferDiscount = (amount: number): number =>
    hasOfferDiscount ? getDiscountedFullCardPrice(amount, offerDiscountPercent) : amount;

  const discountedMainPrice = applyOfferDiscount(spotlightProduct.amount);

  const calculateTotal = () => {
    let total = discountedMainPrice;

    if (upsells.cardVisual) {
      const product = getAddonProduct('cardVisual');
      if (product) total += applyOfferDiscount(product.amount);
    }

    if (upsells.getMatched) {
      const product = getAddonProduct('getMatched');
      if (product) total += applyOfferDiscount(product.amount);
    }

    return total;
  };

  const totalPrice = calculateTotal();

  const handleContinue = () => {
    // For standard listing buyers who haven't seen the upgrade offer yet, show it now
    if (isStandardListing && !checkoutData.replacedStandard && !checkoutData.skippedUpgrade) {
      // CRITICAL: Mark that we're proceeding to the final upgrade offer
      // This prevents the user from being sent back to this upsell page
      // The upsell selections are now LOCKED IN and will be preserved
      setCheckoutData({
        ...checkoutData,
        completedStandardUpsells: true, // Flag that standard upsells have been shown and locked
      });
      navigate('/standard/upgrade-offer');
      return;
    }

    // Otherwise, proceed to checkout
    handleCheckout();
  };

  const handleCheckout = () => {
    const isStandardOnlyRelease = checkoutData.listingType === 'top25_standard_only_release';
    const resolvedListingType = isStandardOnlyRelease
      ? 'top25_standard_only_release'
      : isStandardListing ? 'other_listing' : 'spotlight';

    const lineItems: Array<{ price: string; quantity: number }> = [
      { price: spotlightProduct.priceId, quantity: 1 },
    ];

    if (upsells.cardVisual) {
      const product = getAddonProduct('cardVisual');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    if (upsells.getMatched) {
      const product = getAddonProduct('getMatched');
      if (product) lineItems.push({ price: product.priceId, quantity: 1 });
    }

    const fsid       = getFsid(false);
    const entryPath  = getEntryPath();
    const agencySlug = checkoutData.agencyId
      ? checkoutData.agencyId
      : (checkoutData.agencyName || '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '') + (checkoutData.stateSlug ? `-${checkoutData.stateSlug}` : '');

    launchCheckout(
      () => {
        const payload: Record<string, unknown> = {
          listingType:        resolvedListingType,
          stateSlug:          checkoutData.stateSlug,
          stateName:          checkoutData.stateName,
          agencyId:           checkoutData.agencyId || '',
          agencyName:         checkoutData.agencyName,
          agencyWebsite:      checkoutData.agencyWebsite,
          agencyDescription:  checkoutData.agencyDescription,
          agencyServices:     checkoutData.agencyServices,
          listingTier:        isStandardListing ? 'activation' : checkoutData.listingTier,
          lineItems,
          upsells: {
            cardVisual: upsells.cardVisual,
            getMatched: upsells.getMatched,
            spotlight:  false,
          },
          fsid:         fsid       || undefined,
          agencySlug:   agencySlug || undefined,
          entryPath:    entryPath  || undefined,
          checkoutSource: isStandardListing ? 'activation_upgrade' : 'spotlight_confirm',
        };
        if (isStandardOnlyRelease) {
          if (checkoutData.top25SlotId)               payload.top25SlotId = checkoutData.top25SlotId;
          if (checkoutData.selectedRank != null)      payload.rank        = checkoutData.selectedRank;
        } else {
          payload.rank = null;
        }
        const offerToken =
          activeOfferToken ||
          resolveActiveScopedOfferToken({
            agencyId: checkoutData.agencyId || null,
            stateSlug: checkoutData.stateSlug || null,
          }) ||
          getOfferTokenIfFlow(['offer_redirect', 'top25_landing']);
        if (offerToken) payload.offer_token = offerToken;
        return payload;
      },
      {
        trackingPayload: {
          funnel_name:  resolvedListingType,
          event_name:   'checkout_page_viewed',
          step_number:  150,
          state_slug:   checkoutData.stateSlug,
          agency_name:  checkoutData.agencyName,
          agency_id:    checkoutData.agencyId || undefined,
          is_demo:      false,
          metadata: {
            listing_type:       resolvedListingType,
            upsell_card_visual: upsells.cardVisual,
            upsell_get_matched: upsells.getMatched,
            source:             'spotlight_confirm_page',
          },
        },
      }
    );
  };

  return (
    <div
      className="funnelBackground"
      style={{
        padding: isMobile ? '20px 16px' : '40px 24px'
      }}
    >
      <div style={{ maxWidth: isMobile ? '100%' : '720px', margin: '0 auto' }}>
        <h1 style={{
          fontSize: isMobile ? '18px' : '22px',
          fontWeight: 600,
          color: '#0f172a',
          lineHeight: 1.3,
          marginBottom: isMobile ? '10px' : '12px',
          textAlign: 'center'
        }}>
          {isStandardListing ? `Secure ${checkoutData.agencyName}'s Spot` : `Secure ${checkoutData.agencyName}'s Spotlight Placement`}
        </h1>

        <p style={{
          fontSize: isMobile ? '13px' : '14px',
          color: '#475569',
          lineHeight: 1.5,
          textAlign: 'center',
          maxWidth: '540px',
          margin: '0 auto',
          marginBottom: isMobile ? '16px' : '24px'
        }}>
          {isStandardListing ? (
            <>You're securing a <strong style={{ fontWeight: 600 }}>Standard Listing</strong> for {checkoutData.agencyName} on the {checkoutData.stateName} page. This upgrade is only available now and cannot be added later.</>
          ) : (
            <>You're securing a <strong style={{ fontWeight: 600 }}>6-month Spotlight Placement</strong> for {checkoutData.agencyName} on our {checkoutData.stateName} page. This upgrade is only available now and cannot be added later.</>
          )}
        </p>

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
            onClick={() => setUpsell('cardVisual', !upsells.cardVisual)}
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
                  setUpsell('cardVisual', e.target.checked);
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
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '8px' }}>
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
                    {hasOfferDiscount
                      ? CHECKOUT_UPSELLS.visualUpgrade.title.replace(/\s*—\s*\$\d+(\.\d+)?\s*$/, '')
                      : CHECKOUT_UPSELLS.visualUpgrade.title}
                    {hasOfferDiscount && (() => {
                      const p = getAddonProduct('cardVisual');
                      if (!p) return null;
                      return (
                        <>
                          {' — '}
                          <span style={{ textDecoration: 'line-through', color: '#94a3b8', fontWeight: 400 }}>${p.amount}</span>
                          {' '}
                          <span>${formatPrice(applyOfferDiscount(p.amount))}</span>
                        </>
                      );
                    })()}
                  </p>
                </div>
                <p style={{
                  fontSize: isMobile ? '12px' : '14px',
                  color: '#64748b',
                  lineHeight: 1.6
                }}>
                  {replaceStateName(CHECKOUT_UPSELLS.visualUpgrade.description, checkoutData.stateName)}
                </p>
                {hasOfferDiscount && (
                  <p style={{ fontSize: '12px', color: '#16a34a', fontWeight: 600, marginTop: '6px' }}>
                    {offerDiscountPercent}% discount applied
                  </p>
                )}
              </div>
            </div>
          </div>
        )}

        {step === 2 && (
          <div
            onClick={() => setUpsell('getMatched', !upsells.getMatched)}
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
                  setUpsell('getMatched', e.target.checked);
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
                    {hasOfferDiscount
                      ? CHECKOUT_UPSELLS.leadMatching.title.replace(/\s*—\s*\$\d+(\.\d+)?\s*$/, '')
                      : CHECKOUT_UPSELLS.leadMatching.title}
                    {hasOfferDiscount && (() => {
                      const p = getAddonProduct('getMatched');
                      if (!p) return null;
                      return (
                        <>
                          {' — '}
                          <span style={{ textDecoration: 'line-through', color: '#94a3b8', fontWeight: 400 }}>${p.amount}</span>
                          {' '}
                          <span>${formatPrice(applyOfferDiscount(p.amount))}</span>
                        </>
                      );
                    })()}
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
                {hasOfferDiscount && (
                  <p style={{ fontSize: '12px', color: '#16a34a', fontWeight: 600, marginTop: '6px' }}>
                    {offerDiscountPercent}% discount applied
                  </p>
                )}
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
                {isStandardListing ? `${checkoutData.stateName} Standard Listing` : `${checkoutData.stateName} Spotlight Placement`}
              </div>
              <div style={{
                fontSize: isMobile ? '12px' : '13px',
                color: '#64748b'
              }}>
                {isStandardListing
                  ? (hasOfferDiscount
                      ? `$${formatPrice(discountedMainPrice)} every 6 months — cancel anytime`
                      : `$${spotlightProduct.amount} every 6 months — cancel anytime`)
                  : '6-Month Listing'}
              </div>
              {hasOfferDiscount && (
                <div style={{ fontSize: '12px', color: '#16a34a', fontWeight: 600, marginTop: '2px' }}>
                  {offerDiscountPercent}% discount applied
                </div>
              )}
            </div>
            <div style={{
              fontSize: isMobile ? '16px' : '18px',
              fontWeight: 700,
              color: '#0f172a',
              textAlign: 'right'
            }}>
              {hasOfferDiscount ? (
                <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-end', gap: '2px' }}>
                  <span style={{ textDecoration: 'line-through', color: '#94a3b8', fontSize: isMobile ? '13px' : '14px', fontWeight: 400 }}>
                    ${spotlightProduct.amount}
                  </span>
                  <span>${formatPrice(discountedMainPrice)}</span>
                </div>
              ) : (
                <>${spotlightProduct.amount}</>
              )}
            </div>
          </div>
        </div>

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
          onClick={step === 1 ? () => setStep(2) : handleContinue}
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
          {isStandardListing ? 'Secure payment powered by Stripe • Renews every 6 months • Cancel anytime' : 'Secure payment powered by Stripe • 6-month recurring subscription • Cancel anytime'}
        </p>
      </div>
    </div>
  );
}
