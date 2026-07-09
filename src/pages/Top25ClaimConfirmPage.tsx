import { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { getAddonProduct } from '../config/stripe';
import { CHECKOUT_UPSELLS, replaceStateName } from '../config/upsells';
import { getFsid, getEntryPath, logFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';
import { trackActivationPageView } from '../utils/trackActivationPageView';
import { getOfferTokenIfFlow, validateOfferToken, resolveActiveScopedOfferToken } from '../utils/discountOffer';
import type { DiscountOffer } from '../utils/discountOffer';
import { getDiscountedFullCardPrice, formatPrice } from '../utils/discountPricing';
import { extractDiscountContext, trackDiscountCheckoutOpened } from '../utils/discountCheckoutTracking';
import { useFastCheckout } from '../hooks/useFastCheckout';
import { useNoindex } from '../components/NoindexMeta';

const BUNDLE_PRICE = 297;
const BUNDLE_PRICE_ID = 'price_1SZKecIoPJm5BB2Xf1ZNcRmt';

export default function Top25ClaimConfirmPage() {
  useNoindex();
  const navigate = useNavigate();
  const { checkoutData, upsells, setUpsell } = useTop25Checkout();
  const { isProcessing, error, setError, launch: launchCheckout } = useFastCheckout();
  const [showTooltip, setShowTooltip] = useState(false);
  const [step, setStep] = useState<1 | 2>(1);
  const [activeOffer, setActiveOffer] = useState<DiscountOffer | null>(null);
  const tooltipRef = useRef<HTMLDivElement>(null);
  const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;

  useEffect(() => {
    window.scrollTo({ top: 0, left: 0, behavior: 'instant' });
    setTimeout(() => window.scrollTo(0, 0), 50);
  }, []);

  useEffect(() => {
    const token = getOfferTokenIfFlow(['offer_redirect']);
    if (!token) return;
    validateOfferToken(token).then((res) => {
      if (res.valid && res.offer) setActiveOffer(res.offer);
    });
  }, []);

  useEffect(() => {
    if (!checkoutData || checkoutData.listingType !== 'top25_claim_bundle') {
      navigate('/your-agency');
      return;
    }
    document.title = `Claim Your Top 25 Position — ${checkoutData.stateName} | Gappsy`;
    logFunnelEvent({
      ...FUNNEL_EVENTS.ACTIVATION_OFFER_VIEWED,
      agency_id:   checkoutData.agencyId || undefined,
      agency_name: checkoutData.agencyName,
      state_slug:  checkoutData.stateSlug,
    });
    trackActivationPageView({
      agency_id: checkoutData.agencyId,
      agency_name: checkoutData.agencyName,
      state_slug: checkoutData.stateSlug,
      listing_type: 'top25_claim_bundle',
      rank: typeof checkoutData.selectedRank === 'number' ? checkoutData.selectedRank : null,
    });
  }, [checkoutData, navigate]);

  if (!checkoutData || checkoutData.listingType !== 'top25_claim_bundle') {
    return (
      <div className="funnelBackground" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '20px', textAlign: 'center', color: '#475569' }}>
        Loading...
      </div>
    );
  }

  const offerDiscountPercent = activeOffer?.discount_type === 'percentage' ? activeOffer.discount_value : 0;
  const hasOfferDiscount = offerDiscountPercent > 0;

  const applyDiscount = (amount: number): number => {
    if (hasOfferDiscount) return getDiscountedFullCardPrice(amount, offerDiscountPercent);
    return amount;
  };

  const discountedBundlePrice = applyDiscount(BUNDLE_PRICE);

  const calculateTotal = () => {
    let total = discountedBundlePrice;

    if (upsells.cardVisual) {
      const product = getAddonProduct('cardVisual');
      if (product) total += applyDiscount(product.amount);
    }

    if (upsells.getMatched) {
      const product = getAddonProduct('getMatched');
      if (product) total += applyDiscount(product.amount);
    }

    return total;
  };

  const totalPrice = calculateTotal();

  const handleCheckout = () => {
    if (activeOffer) {
      trackDiscountCheckoutOpened(extractDiscountContext(activeOffer, {
        agency_id: checkoutData.agencyId,
      }));
    }

    const fsid      = getFsid(false);
    const entryPath = getEntryPath();
    const agencySlug = checkoutData.agencyId
      ? checkoutData.agencyId
      : (checkoutData.agencyName || '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '') + (checkoutData.stateSlug ? `-${checkoutData.stateSlug}` : '');

    const lineItems: Array<{ price: string; quantity: number }> = [
      { price: BUNDLE_PRICE_ID, quantity: 1 },
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
        listingType:        'top25_claim_bundle',
        stateSlug:          checkoutData.stateSlug,
        stateName:          checkoutData.stateName,
        rank:               checkoutData.selectedRank,
        agencyName:         checkoutData.agencyName,
        agencyWebsite:      checkoutData.agencyWebsite,
        agencyDescription:  checkoutData.agencyDescription,
        agencyServices:     checkoutData.agencyServices,
        listingTier:        'premium',
        lineItems,
        agencyId:           checkoutData.agencyId    ?? '',
        top25SlotId:        checkoutData.top25SlotId ?? '',
        upsells: {
          cardVisual: upsells.cardVisual,
          getMatched: upsells.getMatched,
          spotlight:  false,
        },
        fsid:         fsid       || undefined,
        agencySlug:   agencySlug || undefined,
        entryPath:    entryPath  || undefined,
        offer_token:  getOfferTokenIfFlow(['offer_redirect']) || resolveActiveScopedOfferToken({ agencyId: checkoutData.agencyId || null, stateSlug: checkoutData.stateSlug || null }) || undefined,
        checkoutSource: 'top25_claim_confirm',
      }),
      {
        trackingPayload: {
          funnel_name:  'top25_claim_bundle',
          event_name:   'checkout_page_viewed',
          step_number:  150,
          state_slug:   checkoutData.stateSlug,
          agency_name:  checkoutData.agencyName,
          agency_id:    checkoutData.agencyId || undefined,
          is_demo:      false,
          metadata: {
            rank:               checkoutData.selectedRank,
            listing_tier:       'premium',
            upsell_card_visual: upsells.cardVisual,
            upsell_get_matched: upsells.getMatched,
            source:             'claim_confirm_page',
          },
        },
      }
    );
  };

  const rankLabel = checkoutData.selectedRank ? `#${checkoutData.selectedRank}` : 'a Top 25';

  return (
    <div className="funnelBackground" style={{ padding: isMobile ? '20px 16px' : '40px 24px' }}>
      <div style={{ maxWidth: isMobile ? '100%' : '720px', margin: '0 auto' }}>
        <h1 style={{ fontSize: isMobile ? '18px' : '22px', fontWeight: 600, color: '#0f172a', lineHeight: 1.3, marginBottom: isMobile ? '10px' : '12px', textAlign: 'center' }}>
          Claim &amp; Activate {checkoutData.agencyName}'s Top 25 Position
        </h1>

        <p style={{ fontSize: isMobile ? '13px' : '14px', color: '#475569', lineHeight: 1.5, textAlign: 'center', maxWidth: '540px', margin: '0 auto', marginBottom: isMobile ? '16px' : '24px' }}>
          You're claiming rank {rankLabel} on the <strong style={{ fontWeight: 600 }}>{checkoutData.stateName} Top 25 list</strong>.
          This locks your position permanently and cannot be added later.
        </p>

        {error && (
          <div style={{ backgroundColor: '#FEE2E2', border: '1px solid #FCA5A5', borderRadius: '8px', padding: '12px 16px', marginBottom: '16px', color: '#DC2626', fontSize: '14px', textAlign: 'center' }}>
            {error}
          </div>
        )}

        {step === 1 && (
          <div
            onClick={() => setUpsell('cardVisual', !upsells.cardVisual)}
            style={{ border: '2px dashed #fb923c', borderRadius: '12px', backgroundColor: '#fff7ed', padding: isMobile ? '16px' : '24px', marginTop: isMobile ? '16px' : '24px', marginBottom: isMobile ? '14px' : '18px', cursor: 'pointer', boxShadow: '0 2px 10px rgba(251, 146, 60, 0.12)', transition: 'all 0.2s ease', minHeight: isMobile ? 'auto' : '140px' }}
            onMouseEnter={(e) => { e.currentTarget.style.boxShadow = '0 6px 20px rgba(251, 146, 60, 0.2)'; e.currentTarget.style.transform = 'translateY(-2px)'; }}
            onMouseLeave={(e) => { e.currentTarget.style.boxShadow = '0 2px 10px rgba(251, 146, 60, 0.12)'; e.currentTarget.style.transform = 'translateY(0)'; }}
          >
            <div style={{ display: 'flex', gap: isMobile ? '12px' : '16px', alignItems: 'flex-start' }}>
              <input
                type="checkbox"
                checked={upsells.cardVisual}
                onChange={(e) => { e.stopPropagation(); setUpsell('cardVisual', e.target.checked); }}
                onClick={(e) => e.stopPropagation()}
                style={{ marginTop: '3px', width: isMobile ? '18px' : '22px', height: isMobile ? '18px' : '22px', cursor: 'pointer', flexShrink: 0, accentColor: '#ea580c' }}
              />
              <div style={{ flex: 1 }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '8px', flexWrap: 'wrap' }}>
                  <div style={{ position: 'relative' }} onMouseEnter={() => setShowTooltip(true)} onMouseLeave={() => setShowTooltip(false)}>
                    <img src="/featured-agency-badge.svg" alt="Featured badge" style={{ width: '32px', height: '32px', verticalAlign: 'middle', flexShrink: 0 }} />
                    {showTooltip && (
                      <div ref={tooltipRef} style={{ position: 'absolute', bottom: '100%', left: '50%', transform: 'translateX(-50%)', marginBottom: '8px', backgroundColor: '#1e293b', color: 'white', padding: '6px 12px', borderRadius: '6px', fontSize: '12px', whiteSpace: 'nowrap', zIndex: 1000, boxShadow: '0 4px 12px rgba(0,0,0,0.15)', pointerEvents: 'none' }}>
                        Featured badge — helps your agency stand out in the listings
                        <div style={{ position: 'absolute', top: '100%', left: '50%', transform: 'translateX(-50%)', width: 0, height: 0, borderLeft: '6px solid transparent', borderRight: '6px solid transparent', borderTop: '6px solid #1e293b' }} />
                      </div>
                    )}
                  </div>
                  <p style={{ fontSize: isMobile ? '14px' : '16px', fontWeight: 600, color: '#F97316', margin: 0 }}>
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
                          <span>${formatPrice(applyDiscount(p.amount))}</span>
                        </>
                      );
                    })()}
                  </p>
                </div>
                <p style={{ fontSize: isMobile ? '12px' : '14px', color: '#64748b', lineHeight: 1.6 }}>
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
            style={{ border: '2px dashed #3b82f6', borderRadius: '12px', backgroundColor: '#eff6ff', padding: isMobile ? '16px' : '24px', marginBottom: isMobile ? '18px' : '24px', cursor: 'pointer', boxShadow: '0 2px 10px rgba(59, 130, 246, 0.12)', transition: 'all 0.2s ease', minHeight: isMobile ? 'auto' : '140px' }}
            onMouseEnter={(e) => { e.currentTarget.style.boxShadow = '0 6px 20px rgba(59, 130, 246, 0.2)'; e.currentTarget.style.transform = 'translateY(-2px)'; }}
            onMouseLeave={(e) => { e.currentTarget.style.boxShadow = '0 2px 10px rgba(59, 130, 246, 0.12)'; e.currentTarget.style.transform = 'translateY(0)'; }}
          >
            <div style={{ display: 'flex', gap: isMobile ? '12px' : '16px', alignItems: 'flex-start' }}>
              <input
                type="checkbox"
                checked={upsells.getMatched}
                onChange={(e) => { e.stopPropagation(); setUpsell('getMatched', e.target.checked); }}
                onClick={(e) => e.stopPropagation()}
                style={{ marginTop: '3px', width: isMobile ? '18px' : '22px', height: isMobile ? '18px' : '22px', cursor: 'pointer', flexShrink: 0, accentColor: '#2563eb' }}
              />
              <div style={{ flex: 1 }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '8px', flexWrap: 'wrap' }}>
                  <p style={{ fontSize: isMobile ? '14px' : '16px', fontWeight: 600, color: '#4F46E5', margin: 0 }}>
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
                          <span>${formatPrice(applyDiscount(p.amount))}</span>
                        </>
                      );
                    })()}
                  </p>
                  {CHECKOUT_UPSELLS.leadMatching.recommended && (
                    <span style={{ backgroundColor: '#dcfce7', color: '#166534', fontSize: isMobile ? '11px' : '12px', fontWeight: 600, padding: '3px 10px', borderRadius: '12px', whiteSpace: 'nowrap', flexShrink: 0 }}>
                      Recommended
                    </span>
                  )}
                </div>
                <p style={{ fontSize: isMobile ? '12px' : '14px', color: '#64748b', lineHeight: 1.6 }}>
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

        <div style={{ backgroundColor: '#ffffff', border: '1px solid #e2e8f0', borderRadius: '10px', padding: isMobile ? '12px' : '14px', marginBottom: isMobile ? '14px' : '16px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
            <div>
              <div style={{ fontSize: isMobile ? '13px' : '14px', fontWeight: 600, color: '#0f172a', marginBottom: '2px' }}>
                Rank {rankLabel} — {checkoutData.stateName} Top 25 (Claim &amp; Activate)
              </div>
              <div style={{ fontSize: isMobile ? '12px' : '13px', color: '#64748b' }}>
                {hasOfferDiscount
                  ? `$${formatPrice(discountedBundlePrice)} every 6 months — cancel anytime`
                  : `$${BUNDLE_PRICE} every 6 months — cancel anytime`}
              </div>
              {hasOfferDiscount && (
                <div style={{ fontSize: '12px', color: '#16a34a', fontWeight: 600, marginTop: '2px' }}>
                  {offerDiscountPercent}% discount applied
                </div>
              )}
            </div>
            <div style={{ fontSize: isMobile ? '16px' : '18px', fontWeight: 700, color: '#0f172a', textAlign: 'right' }}>
              {hasOfferDiscount ? (
                <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-end', gap: '2px' }}>
                  <span style={{ textDecoration: 'line-through', color: '#94a3b8', fontSize: isMobile ? '13px' : '14px', fontWeight: 400 }}>
                    ${BUNDLE_PRICE}
                  </span>
                  <span>${formatPrice(discountedBundlePrice)}</span>
                </div>
              ) : (
                <>${BUNDLE_PRICE}</>
              )}
            </div>
          </div>
        </div>

        {hasOfferDiscount && (
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            padding: isMobile ? '8px 10px' : '10px 10px',
            backgroundColor: '#f0fdf4',
            borderRadius: '6px',
            marginBottom: '4px',
          }}>
            <span style={{ fontSize: isMobile ? '12px' : '13px', color: '#15803d', fontWeight: 600 }}>
              This exclusive discount is currently active for your agency
            </span>
          </div>
        )}

        <div style={{ borderTop: '2px solid #e2e8f0', borderBottom: '2px solid #e2e8f0', padding: isMobile ? '12px 0' : '14px 0', marginBottom: isMobile ? '12px' : '20px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontSize: isMobile ? '15px' : '17px', fontWeight: 600, color: '#0f172a' }}>Total Today</span>
            <span style={{ fontSize: isMobile ? '20px' : '24px', fontWeight: 700, color: '#0f172a' }}>${formatPrice(totalPrice)}</span>
          </div>
        </div>

        <button
          onClick={step === 1 ? () => setStep(2) : handleCheckout}
          disabled={isProcessing}
          style={{ width: '100%', backgroundColor: isProcessing ? '#94a3b8' : '#4F46E5', color: '#FFFFFF', fontSize: isMobile ? '15px' : '17px', fontWeight: 600, padding: isMobile ? '14px 20px' : '16px 24px', borderRadius: '10px', border: 'none', cursor: isProcessing ? 'not-allowed' : 'pointer', boxShadow: '0 4px 14px rgba(58, 90, 254, 0.25)', transition: 'all 0.3s ease' }}
          onMouseEnter={(e) => { if (!isProcessing) { e.currentTarget.style.backgroundColor = '#4338CA'; e.currentTarget.style.transform = 'translateY(-1px)'; } }}
          onMouseLeave={(e) => { if (!isProcessing) { e.currentTarget.style.backgroundColor = '#4F46E5'; e.currentTarget.style.transform = 'translateY(0)'; } }}
        >
          {isProcessing ? 'Redirecting to secure checkout...' : 'Continue to secure your spot'}
        </button>

        <p style={{ marginTop: '16px', fontSize: isMobile ? '11px' : '12px', color: '#94a3b8', textAlign: 'center', lineHeight: 1.5 }}>
          Secure payment powered by Stripe · Renews every 6 months · Cancel anytime
        </p>
      </div>
    </div>
  );
}
