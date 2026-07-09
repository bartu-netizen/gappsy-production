import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { logFunnelEvent, FUNNEL_EVENTS } from '../utils/yourAgencyFunnel';
import { Zap } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { getRetainerAmountWithFallback, formatCurrency, DEFAULT_RETAINER_AMOUNT } from '../utils/retainerUtils';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';
import { buildActivationDirectLink } from '../utils/activationDirectLink';

interface Agency {
  id: string;
  name: string;
  state_name: string;
  location: string;
  intro: string;
  services: string[];
  created_at: string;
  average_retainer_range?: string | null;
  average_retainer_amount?: number | null;
}

const MOCK_OTHER_AGENCIES: Agency[] = [
  {
    id: "0a13b250-b119-45fc-84ce-d3848dcff951",
    name: "Garden State Digital",
    state_name: "",
    location: "",
    intro: "Full-service digital marketing agency helping local businesses grow through data-driven campaigns and conversion-focused websites.",
    services: ["SEO", "PPC", "Web Design", "Content Marketing"],
    created_at: new Date().toISOString(),
    average_retainer_range: null
  },
  {
    id: "e748c792-3bc0-4c05-8eaa-33320f2d97e1",
    name: "Shoreline Marketing Co.",
    state_name: "",
    location: "",
    intro: "Specialized in performance marketing for startups and ecommerce brands, with a strong focus on ROI and lead generation.",
    services: ["Paid Social", "Email Marketing", "Conversion Optimization", "Analytics"],
    created_at: new Date().toISOString(),
    average_retainer_range: null
  },
];

interface OwnerUpsellDashboardProps {
  agencyId: string;
  stateSlug: string;
  stateName: string;
  agencyName?: string;
  agencySlug?: string;
  isPlaceholder?: boolean;
  isDemoStep5?: boolean;
  isTop25Unpaid?: boolean;
}

export default function OwnerUpsellDashboard({
  agencyId,
  stateSlug,
  stateName,
  agencyName,
  agencySlug,
  isPlaceholder = false,
  isDemoStep5 = false,
  isTop25Unpaid = false,
}: OwnerUpsellDashboardProps) {
  const navigate = useNavigate();
  const [agency, setAgency] = useState<Agency | null>(null);
  const [displayedRequests, setDisplayedRequests] = useState<number | null>(null);
  const [requestsReady, setRequestsReady] = useState<boolean>(false);

  const { agency: canonical, loading: canonicalLoading } = useCanonicalAgency(agencySlug || undefined);
  const [lastVisitCount, setLastVisitCount] = useState<number | null>(null);
  const [showGrowthIndicator, setShowGrowthIndicator] = useState(false);
  const [loading, setLoading] = useState(true);

  const displayStateName = isPlaceholder ? stateName : (agency?.state_name || stateName);

  useEffect(() => {
    logFunnelEvent({
      ...FUNNEL_EVENTS.MISSED_CLIENTS_CTA_CLICKED,
      agency_id: agencyId,
      agency_name: agencyName,
      state_slug: stateSlug,
    });
  }, []);


  useEffect(() => {
    async function loadData() {
      try {
        if (!agencyId || !stateSlug) {
          setLoading(false);
          return;
        }

        const { data: agencyData, error: agencyError } = await supabase
          .from('other_agencies')
          .select('id, name, state_name, location, intro, services, created_at, average_retainer_range, average_retainer_amount')
          .eq('id', agencyId)
          .maybeSingle();

        if (agencyError) {
          throw agencyError;
        }

        if (!agencyData) {
          const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
          setAgency({ ...fallbackAgency, state_name: stateName, location: '', name: agencyName || fallbackAgency.name });
        } else {
          const finalAgencyData = isPlaceholder
            ? { ...agencyData, state_name: stateName, location: '' }
            : agencyData;
          setAgency(finalAgencyData);
        }
      } catch (error) {
        const fallbackAgency = MOCK_OTHER_AGENCIES.find(a => a.id === agencyId) || MOCK_OTHER_AGENCIES[0];
        setAgency({ ...fallbackAgency, state_name: stateName, location: '', name: agencyName || fallbackAgency.name });
      } finally {
        setLoading(false);
      }
    }

    loadData();
  }, [agencyId, stateSlug, stateName, agencyName, isPlaceholder]);

  useEffect(() => {
    if (canonicalLoading) return;
    const total = normalizeDisplayedMissedCount(canonical.missedCount);
    try {
      const key = `last_visit_${agencyId}`;
      const stored = localStorage.getItem(key);
      if (stored) {
        const last = parseInt(stored, 10);
        if (!isNaN(last) && total > last) {
          setLastVisitCount(last);
          setShowGrowthIndicator(true);
        }
      }
      localStorage.setItem(key, total.toString());
    } catch {}
    setDisplayedRequests(total);
    setRequestsReady(true);
  }, [canonicalLoading, canonical.missedCount, canonical.anchorMs, agencyId]);

  // Hard safety timeout: if KPI never resolves in 5 s, unblock the funnel anyway
  // so the component never stays in an infinite skeleton state.
  useEffect(() => {
    const t = setTimeout(() => setRequestsReady(true), 5000);
    return () => clearTimeout(t);
  }, []);

  if (loading) {
    return (
      <div className="flex items-center justify-center py-8">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-slate-400"></div>
      </div>
    );
  }

  if (!agency) {
    return (
      <div className="text-center py-6">
        <p className="text-slate-600">Loading agency details...</p>
      </div>
    );
  }

  const retainerAmount = getRetainerAmountWithFallback(
    agency.average_retainer_amount,
    agency.average_retainer_range
  );

  const handleActivateListingClick = () => {
    const url = buildActivationDirectLink({
      agencyId,
      stateSlug,
      agencyName: agency.name,
      stateName: agency.state_name,
      agencyDescription: agency.intro,
    });
    if (!url) return;
    const finalUrl = isPlaceholder ? `${url}&placeholder=1` : url;
    console.log('ACTIVATION_DIRECT_LINK GENERATED:', finalUrl);
    navigate(finalUrl);
  };

  // Explicit 3-state model — never conflate "exited loading" with "data present"
  const kpiDataAvailable = requestsReady && displayedRequests !== null;

  // These are only meaningful (and only used) in the kpiDataAvailable branch
  const confirmedRequests = displayedRequests as number;
  const effectiveRetainer = retainerAmount ?? DEFAULT_RETAINER_AMOUNT;
  const estimatedMissedRevenue = kpiDataAvailable && confirmedRequests > 0
    ? effectiveRetainer * confirmedRequests
    : null;

  return (
    <div className="space-y-1.5 md:space-y-2">

      {/* ── STATE 1: LOADING — skeleton for stats + CTA, no real values ───────── */}
      {!requestsReady && (
        <>
          <div className="bg-white rounded-lg shadow-sm p-1.5 md:p-3 space-y-1 md:space-y-2 animate-pulse">
            <div className="md:hidden bg-slate-50 rounded-lg p-2 grid grid-cols-2 gap-2">
              <div className="space-y-1.5">
                <div className="h-2.5 bg-slate-200 rounded w-20" />
                <div className="h-6 bg-slate-200 rounded w-10" />
              </div>
              <div className="space-y-1.5">
                <div className="h-2.5 bg-slate-200 rounded w-24" />
                <div className="h-6 bg-slate-200 rounded w-14" />
              </div>
            </div>
            <div className="hidden md:grid md:grid-cols-2 md:gap-3">
              <div className="bg-slate-50 rounded-lg p-4 space-y-2">
                <div className="h-6 bg-slate-200 rounded w-10" />
                <div className="h-4 bg-slate-200 rounded w-32" />
                <div className="h-3 bg-slate-200 rounded w-full" />
              </div>
              <div className="bg-slate-50 rounded-lg p-4 space-y-2">
                <div className="h-6 bg-slate-200 rounded w-16" />
                <div className="h-4 bg-slate-200 rounded w-28" />
                <div className="h-3 bg-slate-200 rounded w-full" />
              </div>
            </div>
            <div className="h-10 md:h-16 bg-slate-100 rounded-lg" />
          </div>
          <div className="bg-slate-800/80 rounded-lg h-14 md:h-16 animate-pulse" />
        </>
      )}

      {/* ── STATE 2: READY — real KPI data confirmed, real CTA allowed ─────────── */}
      {kpiDataAvailable && (
        <>
          {isDemoStep5 ? (
            <div className="bg-white rounded-lg shadow-sm p-3 md:p-5 text-center space-y-1.5">
              <h2 className="text-base md:text-xl font-bold text-slate-900 leading-tight">
                You&rsquo;re losing clients right now
              </h2>
              <p className="text-xs md:text-sm text-slate-700 leading-snug">
                {confirmedRequests} client requests were sent to other agencies in the last 30 days
              </p>
              <p className="text-[11px] md:text-xs text-slate-500 leading-snug">
                &asymp; {formatCurrency(estimatedMissedRevenue ?? effectiveRetainer * confirmedRequests)} in missed revenue
              </p>
            </div>
          ) : (
            <div className="bg-white rounded-lg shadow-sm p-1.5 md:p-3 space-y-1 md:space-y-2">

              <div className="md:hidden bg-slate-50 rounded-lg p-2 grid grid-cols-2 gap-2">
                <div className="space-y-0.5">
                  <div className="text-lg font-bold text-slate-900 leading-tight">{confirmedRequests}</div>
                  <h3 className="text-[10px] font-semibold text-slate-700 leading-tight">Client requests missed (last 30 days)</h3>
                  {showGrowthIndicator && lastVisitCount !== null && (
                    <div className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 px-1 py-0.5 rounded text-[9px] font-bold">
                      +{confirmedRequests - lastVisitCount}
                    </div>
                  )}
                </div>
                <div className="space-y-0.5">
                  <div className="text-lg font-bold text-slate-900 leading-tight">
                    {formatCurrency(estimatedMissedRevenue ?? effectiveRetainer * confirmedRequests)}
                  </div>
                  <h3 className="text-[10px] font-semibold text-slate-700 leading-tight">Revenue lost (last 30 days)</h3>
                </div>
              </div>

              <div className="hidden md:grid md:grid-cols-2 md:gap-2">
                <div className="bg-slate-50 rounded-lg p-2.5 space-y-1">
                  <span className="text-2xl font-bold text-slate-900 block">{confirmedRequests}</span>
                  <h3 className="text-xs font-semibold text-slate-900">Client requests missed (last 30 days)</h3>
                  {showGrowthIndicator && lastVisitCount !== null && (
                    <div className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 px-1.5 py-0.5 rounded text-[10px] font-bold">
                      +{confirmedRequests - lastVisitCount} since last visit
                    </div>
                  )}
                </div>

                <div className="bg-slate-50 rounded-lg p-2.5 space-y-1">
                  <span className="text-2xl font-bold text-slate-900 block">{estimatedMissedRevenue !== null ? formatCurrency(estimatedMissedRevenue) : formatCurrency(effectiveRetainer * confirmedRequests)}</span>
                  <h3 className="text-xs font-semibold text-slate-900">Revenue lost (last 30 days)</h3>
                </div>
              </div>

              <div className="bg-red-50 border border-red-200 rounded-lg p-2 md:p-2.5">
                <p className="text-[11px] md:text-sm font-semibold text-red-900 leading-snug">You're receiving 0 of these requests</p>
                <p className="text-[11px] md:text-xs text-red-700 mt-0.5 leading-snug">Clients are being redirected right now.</p>
              </div>

            </div>
          )}

          {/* CTA */}
          <div className="bg-gradient-to-br from-slate-800 to-slate-900 text-white rounded-lg shadow-lg p-3 md:p-4 space-y-1.5">
            {!isDemoStep5 && (
              <>
                <h3 className="text-sm md:text-base font-bold">One step left to fix this</h3>
                <p className="text-[11px] md:text-xs text-slate-300 leading-snug">Start receiving client requests directly.</p>
              </>
            )}
            <button
              onClick={handleActivateListingClick}
              style={{
                touchAction: 'manipulation',
                WebkitTapHighlightColor: 'transparent',
                cursor: 'pointer',
                position: 'relative',
                zIndex: 50,
                pointerEvents: 'auto',
              }}
              className="w-full bg-white text-slate-900 py-2.5 md:py-3 px-4 rounded-lg font-bold hover:bg-slate-50 transition-all shadow-md hover:shadow-lg inline-flex items-center justify-center gap-2 text-sm md:text-base"
            >
              <Zap className="w-4 h-4 md:w-5 md:h-5 flex-shrink-0" />
              {isTop25Unpaid ? (
                <span>Continue to Top-25 Activation Options</span>
              ) : (
                <span>Stop losing clients — activate your listing now</span>
              )}
            </button>
            {!isDemoStep5 && (
              <p className="text-center text-[10px] md:text-xs text-red-400 font-medium leading-tight">Clients are being redirected right now.</p>
            )}
          </div>
        </>
      )}


    </div>
  );
}
