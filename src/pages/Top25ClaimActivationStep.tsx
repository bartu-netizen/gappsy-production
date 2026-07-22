import { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { Crown, Shield, CheckCircle, Star, ChevronDown, ChevronUp, Lock, Zap } from 'lucide-react';
// ChevronDown/ChevronUp kept for the desktop-only compare toggle
import { useTop25Checkout } from '../contexts/Top25CheckoutContext';
import { logFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';
import { trackYourAgencyEvent } from '../lib/yourAgencyApi';
import FooterWrapper from '../components/FooterWrapper';
import YourAgencySEO from '../components/YourAgencySEO';

interface Top25ClaimActivationStepProps {
  agencyId: string;
  agencyName: string;
  stateSlug: string;
  stateName: string;
  top25Rank: number | null;
  top25SlotId: string | null;
  agencyWebsite?: string;
  agencyDescription?: string;
  agencyServices?: string[];
}

const BUNDLE_PRICE = 297;
const STANDARD_PRICE = 97;

export default function Top25ClaimActivationStep({
  agencyId,
  agencyName,
  stateSlug,
  stateName,
  top25Rank,
  top25SlotId,
  agencyWebsite = '',
  agencyDescription = '',
  agencyServices = [],
}: Top25ClaimActivationStepProps) {
  const navigate = useNavigate();
  const { setCheckoutData } = useTop25Checkout();
  const [isNavigating, setIsNavigating] = useState(false);
  const [detailsOpen, setDetailsOpen] = useState(false);
  const trackedOfferView = useRef(false);

  useEffect(() => {
    if (trackedOfferView.current) return;
    trackedOfferView.current = true;
    trackYourAgencyEvent({
      event_name: 'owner_top25_claim_offer_viewed',
      agency_id: agencyId,
      state_slug: stateSlug,
      meta: { rank: top25Rank, slot_id: top25SlotId },
    });
  }, []);

  const handleClaimBundle = () => {
    if (isNavigating) return;
    setIsNavigating(true);

    trackYourAgencyEvent({
      event_name: 'owner_top25_claim_bundle_selected',
      agency_id: agencyId,
      state_slug: stateSlug,
      meta: { rank: top25Rank, slot_id: top25SlotId },
    });
    logFunnelEvent({
      ...FUNNEL_EVENTS.ACTIVATE_CLICKED,
      agency_id: agencyId,
      agency_name: agencyName,
      state_slug: stateSlug,
      metadata: { plan: 'top25_claim_bundle', price: BUNDLE_PRICE, rank: top25Rank },
    });

    setCheckoutData({
      stateSlug,
      stateName,
      selectedRank: top25Rank,
      listingTier: 'premium',
      listingType: 'top25_claim_bundle' as any,
      agencyName,
      agencyWebsite,
      agencyDescription,
      agencyServices,
      agencyId,
      top25SlotId,
    });

    navigate('/top-25/claim-confirm');
  };

  const handleStandardOnly = () => {
    if (isNavigating) return;
    setIsNavigating(true);

    trackYourAgencyEvent({
      event_name: 'owner_top25_standard_only_selected',
      agency_id: agencyId,
      state_slug: stateSlug,
      meta: { rank: top25Rank, slot_id: top25SlotId },
    });
    logFunnelEvent({
      ...FUNNEL_EVENTS.ACTIVATE_CLICKED,
      agency_id: agencyId,
      agency_name: agencyName,
      state_slug: stateSlug,
      metadata: { plan: 'standard_only', price: STANDARD_PRICE },
    });

    setCheckoutData({
      stateSlug,
      stateName,
      selectedRank: null,
      listingTier: 'activation',
      listingType: 'top25_standard_only_release' as any,
      agencyName,
      agencyWebsite,
      agencyDescription,
      agencyServices,
      agencyId,
      top25SlotId,
    });

    navigate('/spotlight/confirm');
  };

  const rankLabel = top25Rank ? `#${top25Rank}` : 'a Top 25';

  const claimBullets = [
    `Keeps your current ${rankLabel} spot reserved`,
    'Receive Check Availability leads',
    `Standard Listing activation included ($${STANDARD_PRICE})`,
    'Position marked as claimed & verified',
  ];

  return (
    <>
      <YourAgencySEO
        title={`Claim Your Top 25 Position in ${stateName} | Gappsy`}
        description={`${agencyName} is currently shown in the Top 25 ${stateName} directory. Claim and activate your position.`}
        canonical="https://www.gappsy.com/your-agency"
        noindex
      />

      {/* Short-screen compact overrides (mobile ≤640px, height ≤760px) */}
      <style>{`
        @media (max-width: 640px) and (max-height: 760px) {
          .act-logo { margin-bottom: 10px !important; height: 22px !important; }
          .act-chips { margin-bottom: 8px !important; }
          .act-headline { margin-bottom: 8px !important; }
          .act-headline h1 { font-size: 11px !important; }
          .act-headline p { display: none !important; }
          .act-card-a-inner { padding: 10px 12px !important; }
          .act-card-a-header { margin-bottom: 6px !important; gap: 6px !important; }
          .act-card-a-bullets { gap: 4px !important; margin-bottom: 8px !important; }
          .act-card-a-bullets li { line-height: 1.2 !important; }
          .act-card-a-bullets span { font-size: 11px !important; }
          .act-cta-bundle { padding-top: 9px !important; padding-bottom: 9px !important; }
          .act-cards-grid { gap: 12px !important; margin-bottom: 6px !important; }
          .act-card-b-inner { padding: 8px 12px !important; gap: 6px !important; }
        }
      `}</style>

      <div className="min-h-screen flex flex-col">
        <main className="flex-1">
          <section className="relative min-h-[100svh] flex flex-col pb-safe">

            {/* ── Background ── */}
            <div className="pointer-events-none absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950" />
            <div
              className="pointer-events-none absolute inset-0"
              style={{
                backgroundImage:
                  'radial-gradient(ellipse 70% 50% at 20% 70%, rgba(59,130,246,0.12) 0%, transparent 60%), radial-gradient(ellipse 50% 40% at 80% 10%, rgba(16,185,129,0.10) 0%, transparent 55%)',
              }}
            />
            <div
              className="pointer-events-none absolute inset-0 opacity-[0.025]"
              style={{
                backgroundImage:
                  'linear-gradient(rgba(255,255,255,1) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,1) 1px, transparent 1px)',
                backgroundSize: '56px 56px',
              }}
            />

            {/* ── Content wrapper ── */}
            <div className="relative w-full max-w-5xl mx-auto px-4 sm:px-6 pt-4 sm:pt-10 pb-16 sm:pb-24 lg:pb-32 flex flex-col items-center gap-0">

              {/* Logo — visible on mobile too */}
              <img
                src="/logos/gappsy-logo-white.webp"
                alt="Gappsy"
                className="act-logo h-7 sm:h-8 w-auto mb-10 sm:mb-8"
              />

              {/* ── Context chips ── */}
              <div className="act-chips flex items-center gap-1.5 sm:gap-2 flex-nowrap justify-center mb-6 sm:mb-4 w-full">
                <span className="inline-flex items-center gap-1 sm:gap-1.5 px-2 sm:px-3 py-1 rounded-full bg-amber-500/15 border border-amber-500/30 text-amber-300 text-[10px] sm:text-[11px] font-semibold uppercase tracking-tight sm:tracking-wider whitespace-nowrap">
                  <Star className="w-3 h-3 fill-amber-400 text-amber-400 flex-shrink-0" />
                  {stateName} Top 25
                </span>
                <span className="inline-flex items-center gap-1 sm:gap-1.5 px-2 sm:px-3 py-1 rounded-full bg-white/8 border border-white/12 text-slate-300 text-[10px] sm:text-[11px] font-semibold uppercase tracking-tight sm:tracking-wider whitespace-nowrap">
                  <span className="sm:hidden">Position: {rankLabel}</span>
                  <span className="hidden sm:inline">Current position: {rankLabel}</span>
                </span>
              </div>

              {/* ── Headline ── */}
              <div className="act-headline text-center mb-8 sm:mb-8 w-full max-w-5xl px-2">
                <h1
                  className="font-bold text-white tracking-tight mb-1 sm:mb-2 sm:text-3xl lg:text-[1.6rem] sm:leading-tight lg:whitespace-nowrap"
                  style={{ fontSize: 'clamp(10px, 3.2vw, 16px)', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', lineHeight: 1.25 }}
                >
                  {agencyName} is at position {rankLabel} in the {stateName} Top 25
                </h1>
                <p className="hidden sm:block text-slate-400 text-xs sm:text-base leading-snug sm:leading-relaxed">
                  Choose whether to claim your current Top 25 position or activate a Standard Listing only.
                </p>
              </div>

              {/* ── Plan cards ── */}
              <div className="act-cards-grid w-full grid grid-cols-1 lg:grid-cols-2 gap-6 sm:gap-4 lg:gap-5 mb-3 sm:mb-4 lg:items-center">

                {/* ═══════════════════════════════════════
                    CARD A — Primary: Claim Bundle
                ═══════════════════════════════════════ */}
                <div className="flex flex-col rounded-2xl overflow-hidden relative"
                  style={{
                    background: 'linear-gradient(160deg, rgba(16,185,129,0.11) 0%, rgba(5,150,105,0.06) 100%)',
                    border: '1.5px solid rgba(16,185,129,0.45)',
                    boxShadow: '0 4px 24px rgba(16,185,129,0.12), 0 1px 4px rgba(0,0,0,0.3)',
                  }}
                >
                  {/* top accent bar */}
                  <div className="h-[3px] w-full bg-gradient-to-r from-emerald-500 to-emerald-400 flex-shrink-0" />

                  <div className="act-card-a-inner flex flex-col flex-1 p-4 sm:p-5 lg:p-6">

                    {/* ── MOBILE header: badge centered top, then icon+title row ── */}
                    <div className="act-card-a-header sm:hidden flex flex-col items-center mb-3 gap-1.5">
                      {/* Badge — centered */}
                      <span className="inline-block text-[9px] font-bold uppercase tracking-widest text-emerald-400 bg-emerald-500/12 border border-emerald-500/25 rounded-md px-2 py-0.5">
                        Recommended
                      </span>
                      {/* Icon + title row */}
                      <div className="flex items-center gap-2">
                        <div className="w-6 h-6 rounded-lg bg-gradient-to-br from-emerald-500 to-emerald-700 flex items-center justify-center flex-shrink-0 shadow-md">
                          <Crown className="w-3 h-3 text-white" />
                        </div>
                        <h2 className="text-[14px] font-bold text-white leading-tight">
                          Claim &amp; Activate {rankLabel} Position
                        </h2>
                      </div>
                    </div>

                    {/* ── DESKTOP header (sm+): original layout ── */}
                    <div className="hidden sm:flex items-start gap-3 mb-4">
                      <div className="w-9 h-9 rounded-xl bg-gradient-to-br from-emerald-500 to-emerald-700 flex items-center justify-center flex-shrink-0 shadow-md">
                        <Crown className="w-4 h-4 text-white" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <span className="inline-block text-[10px] font-bold uppercase tracking-widest text-emerald-400 bg-emerald-500/12 border border-emerald-500/25 rounded-md px-2 py-0.5 mb-1.5">
                          Recommended
                        </span>
                        <h2 className="text-[17px] sm:text-lg font-bold text-white leading-snug">
                          Claim &amp; Activate {rankLabel} Position
                        </h2>
                      </div>
                    </div>

                    {/* Price — hidden on mobile, visible sm+ */}
                    <div className="hidden sm:block mb-4">
                      <div className="flex items-baseline gap-1.5">
                        <span className="text-3xl sm:text-4xl font-extrabold text-white">${BUNDLE_PRICE}</span>
                        <span className="text-slate-400 text-sm font-medium">total</span>
                      </div>
                      <p className="text-emerald-400/80 text-xs mt-0.5 font-medium">
                        Includes Standard Listing (${STANDARD_PRICE})
                      </p>
                    </div>

                    {/* Bullets — always on mobile, also on desktop */}
                    <ul className="act-card-a-bullets flex flex-col gap-1.5 sm:gap-2 mb-3 sm:mb-5">
                      {claimBullets.map((item) => (
                        <li key={item} className="flex items-start gap-1.5 sm:gap-2">
                          <CheckCircle className="w-3 h-3 sm:w-3.5 sm:h-3.5 text-emerald-400 mt-0.5 flex-shrink-0" />
                          <span className="text-slate-300 text-[12px] sm:text-[13px] leading-snug">{item}</span>
                        </li>
                      ))}
                    </ul>

                    {/* Spacer pushes CTA to bottom on desktop */}
                    <div className="hidden sm:block flex-1" />

                    {/* CTA */}
                    <button
                      onClick={handleClaimBundle}
                      disabled={isNavigating}
                      className="act-cta-bundle w-full flex items-center justify-center gap-2 py-2.5 sm:py-3.5 px-5 rounded-xl font-bold text-[14px] sm:text-[15px] text-white transition-all duration-200 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-emerald-400 focus-visible:ring-offset-2 focus-visible:ring-offset-slate-900"
                      style={{
                        background: isNavigating ? '#64748b' : 'linear-gradient(135deg, #10b981 0%, #059669 100%)',
                        boxShadow: isNavigating ? 'none' : '0 4px 14px rgba(16,185,129,0.30)',
                        cursor: isNavigating ? 'not-allowed' : 'pointer',
                      }}
                    >
                      <Lock className="w-4 h-4 flex-shrink-0" />
                      <span>
                        {isNavigating ? 'Loading…' : `Claim ${rankLabel} Position — $${BUNDLE_PRICE}`}
                      </span>
                    </button>
                    <p className="text-center text-slate-500 text-[11px] mt-2.5 sm:mt-1.5">
                      Billed every 6 months · Cancel anytime
                    </p>

                  </div>
                </div>

                {/* ═══════════════════════════════════════
                    CARD B — Secondary: Standard Listing only
                ═══════════════════════════════════════ */}
                <div className="flex flex-col rounded-2xl overflow-hidden"
                  style={{
                    background: 'rgba(15,23,42,0.55)',
                    border: '1.5px solid rgba(71,85,105,0.40)',
                    boxShadow: '0 4px 16px rgba(0,0,0,0.25)',
                    backdropFilter: 'blur(12px)',
                  }}
                >
                  {/* top accent bar — muted */}
                  <div className="h-[3px] w-full flex-shrink-0" style={{ background: 'rgba(71,85,105,0.5)' }} />

                  <div className="act-card-b-inner flex flex-col p-3 sm:p-5 gap-2 sm:gap-3">
                    {/* Card header */}
                    <div className="flex items-center gap-2 sm:gap-3">
                      <div
                        className="w-6 h-6 sm:w-8 sm:h-8 rounded-lg sm:rounded-xl flex items-center justify-center flex-shrink-0"
                        style={{ background: 'rgba(71,85,105,0.3)', border: '1px solid rgba(71,85,105,0.4)' }}
                      >
                        <Shield className="w-3 h-3 sm:w-3.5 sm:h-3.5 text-slate-400" />
                      </div>
                      <h2 className="text-[13px] sm:text-[16px] font-bold text-slate-300 leading-snug">
                        Standard Listing only
                      </h2>
                    </div>

                    {/* Price + description — price hidden on mobile */}
                    <div>
                      <div className="hidden sm:flex items-baseline gap-1.5">
                        <span className="text-2xl sm:text-3xl font-extrabold text-slate-300">${STANDARD_PRICE}</span>
                        <span className="text-slate-500 text-sm font-medium">total</span>
                      </div>
                      <p className="text-slate-500 text-xs mt-1.5 sm:mt-0.5">
                        Get listed in the Other Agencies section and receive leads.
                      </p>
                    </div>

                    {/* Warning box */}
                    <div className="rounded-lg px-3 py-2 sm:px-3.5 sm:py-3"
                      style={{ background: 'rgba(245,158,11,0.08)', border: '1px solid rgba(245,158,11,0.20)' }}>
                      <p className="text-amber-300/80 text-xs leading-relaxed">
                        Your current placeholder spot ({rankLabel}) will be released and made available to others.
                      </p>
                    </div>

                    {/* CTA */}
                    <button
                      onClick={handleStandardOnly}
                      disabled={isNavigating}
                      className="w-full flex items-center justify-center gap-2 py-2.5 sm:py-3.5 px-5 rounded-xl font-semibold text-[13px] sm:text-[14px] transition-all duration-200 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-slate-400 focus-visible:ring-offset-2 focus-visible:ring-offset-slate-900"
                      style={{
                        background: isNavigating ? 'rgba(71,85,105,0.2)' : 'rgba(71,85,105,0.25)',
                        color: isNavigating ? '#64748b' : '#94a3b8',
                        border: '1.5px solid rgba(71,85,105,0.45)',
                        cursor: isNavigating ? 'not-allowed' : 'pointer',
                      }}
                    >
                      <Zap className="w-4 h-4 flex-shrink-0" />
                      <span>
                        {isNavigating ? 'Loading…' : `Activate Standard Listing — $${STANDARD_PRICE}`}
                      </span>
                    </button>
                    <p className="text-center text-slate-600 text-[11px] mt-2.5 sm:mt-1.5">
                      Billed every 6 months · Cancel anytime
                    </p>

                  </div>
                </div>
              </div>

              {/* ── Desktop-only: Compare details toggle (hidden on mobile) ── */}
              <div className="hidden sm:block w-full lg:hidden">
                <button
                  onClick={() => setDetailsOpen((v) => !v)}
                  className="w-full flex items-center justify-center gap-1.5 py-2.5 text-slate-400 text-xs font-medium hover:text-slate-300 transition-colors"
                >
                  {detailsOpen ? (
                    <>Hide details <ChevronUp className="w-3.5 h-3.5" /></>
                  ) : (
                    <>Compare details <ChevronDown className="w-3.5 h-3.5" /></>
                  )}
                </button>

                {detailsOpen && (
                  <div className="mt-1 mb-2 rounded-xl overflow-hidden border border-white/8">
                    <div className="px-4 py-3 border-b border-white/8"
                      style={{ background: 'rgba(16,185,129,0.06)' }}>
                      <p className="text-emerald-400 text-[11px] font-semibold uppercase tracking-wider mb-2">
                        Claim &amp; Activate {rankLabel}
                      </p>
                      <ul className="flex flex-col gap-1.5">
                        {claimBullets.map((item) => (
                          <li key={item} className="flex items-start gap-1.5">
                            <CheckCircle className="w-3 h-3 text-emerald-400 mt-0.5 flex-shrink-0" />
                            <span className="text-slate-300 text-xs leading-snug">{item}</span>
                          </li>
                        ))}
                      </ul>
                    </div>
                    <div className="px-4 py-3" style={{ background: 'rgba(15,23,42,0.4)' }}>
                      <p className="text-slate-400 text-[11px] font-semibold uppercase tracking-wider mb-2">
                        Standard Listing only
                      </p>
                      <p className="text-slate-500 text-xs leading-snug">
                        Standard listing — receive leads without claiming a Top 25 spot.
                      </p>
                    </div>
                  </div>
                )}
              </div>


            </div>
          </section>
        </main>

        <div className="bg-white h-[72px] sm:h-[120px]" aria-hidden="true" />
        <FooterWrapper />
      </div>
    </>
  );
}
