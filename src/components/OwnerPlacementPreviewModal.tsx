import { useState, useEffect, useRef, type MouseEvent } from 'react';
import { X, RotateCcw, ChevronDown, AlertCircle, Loader2 } from 'lucide-react';
import ServicesBadges from './ServicesBadges';
import ExpandableText from './ExpandableText';
import { supabase } from '../lib/supabase';

interface Top25Agency {
  rank: number;
  agency_name: string;
  description?: string;
  short_description?: string;
  agency_id: string;
  logo_url?: string;
  services?: string[];
  website?: string;
}

interface OwnerPlacementPreviewModalProps {
  isOpen: boolean;
  onClose: () => void;
  stateSlug: string;
  stateName: string;
  selectedAgencyId: string;
  selectedAgency: {
    id: string;
    name: string;
  };
  mode: 'top25' | 'other';
}

export default function OwnerPlacementPreviewModal({
  isOpen,
  onClose,
  stateSlug,
  stateName,
  selectedAgencyId,
  selectedAgency,
  mode,
}: OwnerPlacementPreviewModalProps) {
  const [agencies, setAgencies] = useState<Top25Agency[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [highlightedId, setHighlightedId] = useState<string | null>(null);
  const selectedCardRef = useRef<HTMLDivElement>(null);
  const contentScrollRef = useRef<HTMLDivElement>(null);

  const prefersReducedMotion = typeof window !== 'undefined'
    ? window.matchMedia('(prefers-reduced-motion: reduce)').matches
    : false;

  const performScrollAndHighlight = () => {
    if (!selectedCardRef.current) return;

    setHighlightedId(selectedAgencyId);

    setTimeout(() => {
      if (!selectedCardRef.current) return;

      selectedCardRef.current.scrollIntoView({
        behavior: prefersReducedMotion ? 'auto' : 'smooth',
        block: 'center',
      });

      if (!prefersReducedMotion) {
        const timeoutId = setTimeout(() => {
          setHighlightedId(null);
        }, 800);
        return () => clearTimeout(timeoutId);
      }
    }, 50);
  };

  const handleSkip = () => {
    if (!selectedCardRef.current) return;
    setHighlightedId(null);
    selectedCardRef.current.scrollIntoView({
      behavior: 'auto',
      block: 'center',
    });
  };

  const handleRetry = () => {
    setLoading(true);
    setError(null);
    setAgencies([]);
  };

  useEffect(() => {
    if (!isOpen) return;

    async function loadData() {
      try {
        setLoading(true);
        setError(null);

        if (mode === 'top25') {
          const { data, error: dbError } = await supabase
            .from('top25_slots')
            .select('*')
            .eq('state_slug', stateSlug)
            .order('rank', { ascending: true });

          if (dbError) throw new Error(`Database error: ${dbError.message}`);

          if (data && data.length > 0) {
            setAgencies(data as Top25Agency[]);
          } else {
            setAgencies([]);
          }
        }
      } catch (err) {
        const errorMsg = err instanceof Error ? err.message : 'Failed to load preview data';
        setError(errorMsg);
        if (import.meta.env.DEV) {
          console.error('[OwnerPlacementPreviewModal] Error loading data:', err);
        }
      } finally {
        setLoading(false);
      }
    }

    if (mode === 'top25') {
      loadData();
    }
  }, [isOpen, stateSlug, mode]);

  useEffect(() => {
    if (!isOpen || loading) return;

    if (agencies.length > 0) {
      performScrollAndHighlight();
    }
  }, [isOpen, agencies, loading]);

  if (!isOpen) return null;

  const handleBackdropClick = (e: MouseEvent<HTMLDivElement>) => {
    e.preventDefault();
    e.stopPropagation();
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm overflow-y-auto py-4 md:py-16"
      role="dialog"
      aria-modal="true"
      onClick={handleBackdropClick}
    >
      <div
        className="absolute inset-0 bg-black/40 backdrop-blur-sm"
        onClick={handleBackdropClick}
        aria-hidden="true"
      />

      <div
        className="relative w-full md:w-[90%] lg:w-[920px] bg-white rounded-2xl shadow-[0_8px_24px_rgba(0,0,0,0.06)] overflow-hidden flex flex-col max-h-[90dvh]"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between px-4 sm:px-6 py-4 border-b border-slate-100 bg-white sticky top-0 z-10">
            <div className="flex items-center gap-3">
              <div className="w-8 h-8 rounded bg-gradient-to-br from-slate-900 to-slate-700 flex items-center justify-center">
                <span className="text-white text-xs font-bold">G</span>
              </div>
              <h2 className="text-sm font-semibold text-slate-500 uppercase tracking-wide">Client view preview</h2>
            </div>
            <div className="flex items-center gap-2">
              {!loading && (
                <>
                  <button
                    onClick={performScrollAndHighlight}
                    className="flex items-center gap-1.5 px-3 py-2 text-sm text-slate-600 hover:text-slate-700 hover:bg-slate-100 rounded-lg transition-colors"
                    title="Replay scroll animation"
                  >
                    <RotateCcw className="w-4 h-4" />
                    <span className="hidden sm:inline">Replay</span>
                  </button>
                  <button
                    onClick={handleSkip}
                    className="flex items-center gap-1.5 px-3 py-2 text-sm text-slate-600 hover:text-slate-700 hover:bg-slate-100 rounded-lg transition-colors"
                    title="Skip animation"
                  >
                    <ChevronDown className="w-4 h-4" />
                    <span className="hidden sm:inline">Skip</span>
                  </button>
                </>
              )}
              <button
                onClick={onClose}
                className="p-2 text-slate-400 hover:text-slate-600 hover:bg-slate-100 rounded-lg transition-colors"
                aria-label="Close modal"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
          </div>

          <div
            ref={contentScrollRef}
            className="flex-1 overflow-y-auto"
          >
            <style>{`
              @keyframes pulseGlow {
                0%, 100% {
                  box-shadow: 0 0 0 0 rgba(59, 130, 246, 0.7);
                }
                50% {
                  box-shadow: 0 0 0 8px rgba(59, 130, 246, 0);
                }
              }
              .pulse-glow {
                animation: pulseGlow 0.8s ease-in-out;
              }
              @media (prefers-reduced-motion: reduce) {
                .pulse-glow {
                  animation: none;
                }
              }
            `}</style>

            {loading ? (
              <div className="flex flex-col items-center justify-center py-24 gap-2">
                <Loader2 className="w-5 h-5 text-slate-400 animate-spin" />
                <p className="text-sm text-slate-500">Loading preview...</p>
              </div>
            ) : error ? (
              <div className="p-4 m-4 sm:p-6 sm:m-6 bg-red-50 border border-red-200 rounded-xl">
                <div className="flex gap-3 mb-4">
                  <AlertCircle className="w-5 h-5 text-red-600 shrink-0 mt-0.5" />
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-semibold text-red-900">Failed to load preview</p>
                    <p className="text-sm text-red-700 mt-1">{error}</p>
                  </div>
                </div>
                <button
                  onClick={handleRetry}
                  className="px-4 py-2 text-sm font-semibold text-red-700 bg-red-100 border border-red-300 rounded-lg hover:bg-red-200 transition-colors"
                >
                  Try again
                </button>
              </div>
            ) : (
              <>
                <div className="border-b border-slate-200">
                  <div className="px-4 py-6 sm:px-6 sm:py-8 max-w-3xl mx-auto">
                    <h1 className="text-2xl sm:text-3xl md:text-4xl font-bold text-slate-900 mb-3">
                      Top Marketing Agencies in {stateName}
                    </h1>
                    <p className="text-sm sm:text-base text-slate-600">
                      Clients browse this page to find and hire the best marketing agencies in the area.
                    </p>
                  </div>
                </div>

                <div className="px-4 py-6 sm:px-6 sm:py-8 max-w-3xl mx-auto w-full">
                  <h2 className="text-2xl font-bold text-slate-900 mb-6">Top 25 Agencies</h2>

                  <div className="space-y-4">
                    {agencies.length > 0 ? (
                      agencies.map((agency) => {
                        const isSelected = agency.agency_id === selectedAgencyId;
                        const isHighlighted = highlightedId === selectedAgencyId;

                        return (
                          <div
                            key={`agency-${agency.rank}`}
                            ref={isSelected ? selectedCardRef : null}
                            className={`relative agency-card flex flex-col rounded-xl border transition-all ${
                              isHighlighted ? 'pulse-glow' : ''
                            } ${
                              isSelected
                                ? 'border-blue-400 bg-blue-50/30 ring-2 ring-blue-200'
                                : 'border-slate-200 bg-white hover:border-slate-300'
                            }`}
                            data-rank={agency.rank}
                          >
                            <div className="p-5 flex-1 flex flex-col">
                              <div className="flex items-start gap-4 mb-3">
                                <div className="shrink-0">
                                  {agency.logo_url ? (
                                    <img
                                      src={agency.logo_url}
                                      alt={agency.agency_name}
                                      className="w-14 h-14 rounded-lg object-cover bg-slate-100"
                                      loading="lazy"
                                    />
                                  ) : (
                                    <div className="w-14 h-14 rounded-lg bg-gradient-to-br from-slate-300 to-slate-400 flex items-center justify-center text-white font-semibold text-sm">
                                      {agency.agency_name.charAt(0)}
                                    </div>
                                  )}
                                </div>

                                <div className="flex-1 min-w-0">
                                  <div className="flex items-start justify-between gap-3 mb-1">
                                    <div>
                                      <div className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-0.5">
                                        #{agency.rank}
                                      </div>
                                      <h3 className="text-lg font-bold text-slate-900 line-clamp-2">
                                        {agency.agency_name}
                                      </h3>
                                    </div>
                                    {isSelected && (
                                      <div className="shrink-0 inline-flex items-center gap-1 px-3 py-1.5 rounded-full bg-blue-600 text-white text-xs font-semibold whitespace-nowrap">
                                        <span>You</span>
                                        <span>•</span>
                                        <span>#{agency.rank}</span>
                                      </div>
                                    )}
                                  </div>
                                </div>
                              </div>

                              {(agency.short_description || agency.description) && (
                                <ExpandableText
                                  shortText={agency.short_description || ''}
                                  fullText={agency.description || ''}
                                  className="mb-3"
                                />
                              )}

                              {agency.services && agency.services.length > 0 && (
                                <div className="mt-auto pt-3">
                                  <ServicesBadges
                                    services={agency.services}
                                    badgeClassName="service-tag"
                                  />
                                </div>
                              )}
                            </div>

                            <div className="px-5 py-3 border-t border-slate-100 bg-slate-50/50">
                              <button
                                disabled
                                className="w-full px-4 py-2 text-sm font-semibold text-slate-600 bg-white border border-slate-200 rounded-lg cursor-not-allowed opacity-60"
                              >
                                Check Availability
                              </button>
                            </div>
                          </div>
                        );
                      })
                    ) : (
                      <div className="text-center py-12">
                        <p className="text-slate-500">No agencies loaded</p>
                      </div>
                    )}
                  </div>
                </div>
              </>
            )}
          </div>
        </div>
      </div>
  );
}
