import { useState, useEffect, useRef, useCallback } from 'react';
import AvailabilityModal from './AvailabilityModal';
import ServicesBadges from './components/ServicesBadges';
import ExpandableText from './components/ExpandableText';
import Top25Summary from './components/Top25Summary';
import AgencyLogo from './components/AgencyLogo';
import LightningBadge from './components/LightningBadge';
import { type MergedAgency } from './utils/agencyMerger';
import type { OwnerPreviewStep } from './components/OwnerStickyBar';

interface NewJerseyAgencyGridProps {
  agencies: MergedAgency[];
  stateName?: string;
  stateSlug?: string;
  onSubmitAgency?: () => void;
  highlightAgencyId?: string | null;
  highlightNonce?: number;
  ownerMode?: boolean;
  ownerPreviewStep?: OwnerPreviewStep;
  ownerAgencyId?: string | null;
  onOwnerCheckAvailability?: () => void;
  onCountdownChange?: (seconds: number | null, cardVisible: boolean) => void;
  onSummaryAgencyClick?: (anchorId: string, agency: { id?: string; slug?: string; name: string }) => void;
  ownerCardReadyForCountdown?: boolean;
}

function NewJerseyAgencyGrid({
  agencies,
  stateName = "New Jersey",
  stateSlug = "new-jersey",
  onSubmitAgency,
  highlightAgencyId,
  highlightNonce,
  ownerMode = false,
  ownerPreviewStep = 1,
  ownerAgencyId,
  onOwnerCheckAvailability,
  onCountdownChange,
  onSummaryAgencyClick,
  ownerCardReadyForCountdown = false,
}: NewJerseyAgencyGridProps) {
  const [availabilityModalOpen, setAvailabilityModalOpen] = useState(false);
  const [selectedAgency, setSelectedAgency] = useState<{
    id: string;
    name: string;
    rank: number;
    website?: string;
  } | null>(null);

  const [prefersReducedMotion, setPrefersReducedMotion] = useState(false);
  const [countdown, setCountdown] = useState<number | null>(null);
  const [cardVisible, setCardVisible] = useState(false);

  const ownerCardRef = useRef<HTMLDivElement | null>(null);
  const countdownIntervalRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const autoOpenFiredRef = useRef(false);
  const didManualClickRef = useRef(false);

  useEffect(() => {
    const mq = window.matchMedia('(prefers-reduced-motion: reduce)');
    setPrefersReducedMotion(mq.matches);
    const handler = (e: MediaQueryListEvent) => setPrefersReducedMotion(e.matches);
    mq.addEventListener('change', handler);
    return () => mq.removeEventListener('change', handler);
  }, []);

  const stopCountdown = useCallback(() => {
    if (countdownIntervalRef.current) {
      clearTimeout(countdownIntervalRef.current);
      countdownIntervalRef.current = null;
    }
    setCountdown(null);
  }, []);

  // Auto-open is now centralized in StatePageTemplate (single source of truth).
  // This grid no longer arms its own Step 2 → Step 3 timer.
  const startCountdown = useCallback(() => {
    // intentionally no-op
  }, []);

  useEffect(() => {
    const isStep2 = ownerMode && ownerPreviewStep === 2;
    if (!isStep2) {
      stopCountdown();
      autoOpenFiredRef.current = false;
      didManualClickRef.current = false;
      setCardVisible(false);
      return;
    }
    if (autoOpenFiredRef.current || didManualClickRef.current) return;
    if (!ownerCardReadyForCountdown) return;
    startCountdown();
  }, [ownerMode, ownerPreviewStep, ownerCardReadyForCountdown, stopCountdown, startCountdown]);

  useEffect(() => {
    onCountdownChange?.(countdown, cardVisible);
  }, [countdown, cardVisible, onCountdownChange]);

  useEffect(() => {
    return () => {
      if (countdownIntervalRef.current) clearTimeout(countdownIntervalRef.current);
    };
  }, []);

  const openAvailabilityModal = (agencyId: string, agencyName: string, rank: number, website?: string) => {
    console.log('[Top25 Click]', { stateSlug, agencyId, agencyName, rank, website });
    setSelectedAgency({ id: agencyId, name: agencyName, rank, website });
    setAvailabilityModalOpen(true);
  };

  const handleCheckAvailabilityClick = (
    agency: MergedAgency,
    isOwnerCard: boolean,
    e?: React.MouseEvent
  ) => {
    if (isOwnerCard && ownerMode && ownerPreviewStep === 2) {
      didManualClickRef.current = true;
      stopCountdown();
      onOwnerCheckAvailability?.();
      return;
    }
    if (ownerMode && !isOwnerCard) {
      e?.preventDefault();
      e?.stopPropagation();
      return;
    }
    openAvailabilityModal(agency.id || '', agency.name, agency.rank, agency.website);
  };

  const anchorIdForAgency = (agency: MergedAgency) => {
    if (agency.id) return `agency-${agency.id}`;
    return (
      "agency-" +
      agency.name
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, "-")
        .replace(/^-+|-+$/g, "")
    );
  };

  const isOwnerAgency = (agency: MergedAgency) => {
    if (!ownerMode || !ownerAgencyId) return false;
    return agency.id === ownerAgencyId || (agency as any).ownerAgencyId === ownerAgencyId;
  };

  return (
    <>
      <style>{`
        @keyframes ownerArrowBounce {
          0%, 100% { transform: translateX(-50%) translateY(0); }
          50%       { transform: translateX(-50%) translateY(14px); }
        }
        .owner-cta-arrow-wrap {
          position: absolute;
          left: 50%;
          transform: translateX(-50%);
          top: -72px;
          pointer-events: none;
          animation: ownerArrowBounce 1s ease-in-out infinite;
          filter: drop-shadow(0 8px 16px rgba(52,211,153,0.5));
          z-index: 10;
        }
        @media (prefers-reduced-motion: reduce) {
          .owner-cta-arrow-wrap { animation: none; }
        }
        @keyframes ownerCardBreath {
          0%, 100% {
            box-shadow: 0 0 0 3px rgba(52,211,153,0.55), 0 0 18px rgba(52,211,153,0.18);
          }
          50% {
            box-shadow: 0 0 0 6px rgba(52,211,153,0.25), 0 0 32px rgba(52,211,153,0.35);
          }
        }
        .owner-card-step2 {
          outline: 2px solid #34d399;
          outline-offset: 2px;
          background: rgba(52,211,153,0.04);
          animation: ownerCardBreath 2.4s ease-in-out infinite;
        }
        @media (prefers-reduced-motion: reduce) {
          .owner-card-step2 {
            animation: none;
            box-shadow: 0 0 0 3px rgba(52,211,153,0.55);
          }
        }
        @keyframes ownerCtaPulse {
          0% { box-shadow: 0 0 0 0 rgba(52, 211, 153, 0.8); }
          70% { box-shadow: 0 0 0 8px rgba(52, 211, 153, 0); }
          100% { box-shadow: 0 0 0 0 rgba(52, 211, 153, 0); }
        }
        .owner-cta-btn-pulse {
          outline: 2px solid #34d399;
          outline-offset: 2px;
          animation: ownerCtaPulse 1.6s ease-out infinite;
        }
        @media (prefers-reduced-motion: reduce) {
          .owner-cta-btn-pulse { animation: none; outline: 2px solid #34d399; }
        }
      `}</style>
      <section id="top-25-summary" className="agencies-list-section section-block top25-section">
        <div className="container">
          <div id="top25-nosnippet-zone" data-nosnippet>
            {agencies.length > 0 && (
              <Top25Summary stateName={stateName} agencies={agencies} onAgencyClick={onSummaryAgencyClick} />
            )}

            <div data-nosnippet style={{
              maxWidth: '600px',
              margin: '24px auto 32px',
              padding: '20px 24px',
              background: '#f9fafb',
              borderRadius: '12px',
              border: '1px solid #e5e7eb',
              boxShadow: '0 1px 2px 0 rgba(0, 0, 0, 0.05)',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '8px'
            }}>
              <h3 style={{ fontSize: '16px', fontWeight: 600, textAlign: 'center', color: '#0F172A', margin: 0, lineHeight: '1.4' }}>
                Want your agency in our Top 25 {stateName} marketing agencies?
              </h3>
              <p style={{ fontSize: '14px', color: '#64748B', textAlign: 'center', maxWidth: '520px', margin: 0, lineHeight: '1.5' }}>
                Submit your agency for editorial review and be considered for future updates.
              </p>
              <button onClick={onSubmitAgency} className="btn-secondary" style={{ marginTop: '4px' }}>
                Submit Agency
              </button>
            </div>

            <div id="top25-grid" className="agencies-grid">
              {agencies.map((agency) => {
                const anchorId = anchorIdForAgency(agency);
                const isHighlighted =
                  !!highlightAgencyId &&
                  (agency.id === highlightAgencyId || (agency as any).ownerAgencyId === highlightAgencyId);
                const isOwnerCard = isOwnerAgency(agency);
                const showStep2 = isOwnerCard && ownerMode && ownerPreviewStep === 2;

                return (
                  <div
                    key={agency.rank}
                    ref={showStep2 ? ownerCardRef : undefined}
                    className={`agency-card relative flex flex-col ${isHighlighted ? 'owner-highlight' : ''} ${showStep2 ? 'owner-card-step2' : ''}`}
                    id={anchorId}
                    data-rank={agency.rank}
                    data-agency-id={agency.id || ''}
                    data-owner-agency-id={(agency as any).ownerAgencyId || ''}
                    data-owner-anchor={`top25:${agency.rank}`}
                    data-highlight-nonce={isHighlighted ? highlightNonce : undefined}
                  >
                    {agency.show_lightning && <LightningBadge />}
                    <div className="agency-card-top flex-1 flex flex-col">
                      <div className="agency-header">
                        <div className="agency-rank-badge">{agency.rank}</div>
                        <AgencyLogo
                          logoUrl={agency.logoUrl}
                          agencyName={agency.name}
                          size="sm"
                          variant="card"
                        />
                      </div>
                      <div className="agency-body flex-1 flex flex-col">
                        <h3 className="line-clamp-2" title={agency.name}>{agency.name}</h3>
                        <ExpandableText
                          shortText={agency.shortDescription || ''}
                          fullText={agency.fullDescription || ''}
                          className="mb-3"
                        />
                        <div className="services mt-auto">
                          <ServicesBadges
                            services={agency.services}
                            badgeClassName="service-tag"
                          />
                        </div>
                      </div>
                    </div>
                    <div className="agency-card-bottom">
                      <div className="agency-footer">
                        <span></span>
                        <div className="relative">
                          {showStep2 && (
                            <div
                              className="owner-cta-arrow-wrap"
                              aria-hidden="true"
                            >
                              <svg
                                width="64"
                                height="64"
                                viewBox="0 0 64 64"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                className="md:w-20 md:h-20"
                              >
                                <path
                                  d="M32 8 L32 48 M32 48 L16 32 M32 48 L48 32"
                                  stroke="#34d399"
                                  strokeWidth="6"
                                  strokeLinecap="round"
                                  strokeLinejoin="round"
                                />
                              </svg>
                            </div>
                          )}
                          <button
                            type="button"
                            onClick={(e) => handleCheckAvailabilityClick(agency, isOwnerCard, e)}
                            className={`agency-website-link ${showStep2 ? 'owner-cta-btn-pulse' : ''}`}
                          >
                            Check Availability
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                );
              })}

              <div className="wide-cta-card" data-nosnippet>
                <div className="wide-cta-content">
                  <h3 className="text-base md:text-xl font-bold leading-tight">Think Your Marketing Agency Deserves a Spot in {stateName}'s Top 25?</h3>
                  <p className="wide-cta-subtext">Submit your details for editorial review.</p>
                  <button onClick={onSubmitAgency} className="btn-secondary">
                    Submit Agency
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <AvailabilityModal
        isOpen={availabilityModalOpen}
        onClose={() => setAvailabilityModalOpen(false)}
        agencyName={selectedAgency?.name || ''}
        stateName={stateName}
        agencyId={selectedAgency?.id}
        stateSlug={stateSlug}
        agencyWebsite={selectedAgency?.website}
      />
    </>
  );
}

export default NewJerseyAgencyGrid;
