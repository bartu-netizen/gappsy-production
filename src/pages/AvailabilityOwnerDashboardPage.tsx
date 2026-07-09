import { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Mail, Crown, Eye, CreditCard, Zap } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useCanonicalAgency } from '../hooks/useCanonicalAgency';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';
import { getRetainerAmountWithFallback, formatCurrency, DEFAULT_RETAINER_AMOUNT } from '../utils/retainerUtils';
import UpsellTop25SpotModal from '../components/UpsellTop25SpotModal';
import { getStateContextFromSearchParams } from '../utils/stateContext';
import { buildActivationDirectLink } from '../utils/activationDirectLink';

interface Agency {
  id: string;
  slug: string | null;
  name: string;
  state_name: string;
  created_at: string;
  average_retainer_range?: string | null;
  average_retainer_amount?: number | null;
}

export default function AvailabilityOwnerDashboardPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const isPlaceholder = searchParams.get('placeholder') === '1';
  const { stateSlug, stateName } = getStateContextFromSearchParams(searchParams);

  const [agency, setAgency] = useState<Agency | null>(null);
  const [loading, setLoading] = useState(true);
  const [showUpsellModal, setShowUpsellModal] = useState(false);
  const [pageError, setPageError] = useState<string | null>(null);

  const { agency: canonical, loading: canonicalLoading } = useCanonicalAgency(agency?.slug || undefined);
  const availabilityRequests = canonicalLoading ? null : normalizeDisplayedMissedCount(canonical.missedCount);

  useEffect(() => {
    document.title = 'Your Missed Opportunities | Gappsy';
  }, []);

  useEffect(() => {
    async function loadData() {
      if (!agencyId || !stateSlug) {
        navigate('/');
        return;
      }

      try {
        const { data: agencyData, error: agencyError } = await supabase
          .from('other_agencies')
          .select('id, slug, name, state_name, created_at, average_retainer_range, average_retainer_amount')
          .eq('id', agencyId)
          .maybeSingle();

        if (agencyError) throw agencyError;

        if (!agencyData) {
          navigate('/');
          return;
        }

        const finalAgencyData = isPlaceholder
          ? { ...agencyData, state_name: stateName }
          : agencyData;
        setAgency(finalAgencyData);
      } catch (error) {
        console.error('Error loading data:', error);
        navigate('/');
      } finally {
        setLoading(false);
      }
    }

    loadData();
  }, [agencyId, stateSlug, navigate]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100">
        <div className="flex flex-col items-center gap-3">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-slate-400"></div>
        </div>
      </div>
    );
  }

  if (!agency) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100">
        <div className="text-center p-6">
          <p className="text-slate-600 mb-4">We couldn't load your agency details.</p>
          <button
            onClick={() => navigate(-1)}
            className="text-slate-600 hover:text-slate-700 font-medium"
          >
            ← Go back
          </button>
        </div>
      </div>
    );
  }

  const effectiveRetainer = getRetainerAmountWithFallback(agency.average_retainer_amount, agency.average_retainer_range) ?? DEFAULT_RETAINER_AMOUNT;
  const estimatedMissedRevenue =
    availabilityRequests !== null
      ? effectiveRetainer * availabilityRequests
      : null;

  const handleActivateListingClick = () => {
    const url = buildActivationDirectLink({
      agencyId,
      stateSlug,
      agencyName: agency.name,
      stateName: agency.state_name,
    });
    if (!url) return;
    console.log('ACTIVATION_DIRECT_LINK GENERATED:', url);
    navigate(url);
  };

  const displayCount = availabilityRequests ?? '—';

  // Page-level error fallback
  if (pageError) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100 px-4">
        <div className="max-w-md w-full bg-white rounded-lg shadow-lg p-6 text-center space-y-4">
          <h1 className="text-xl font-bold text-slate-900">Unable to load your dashboard</h1>
          <p className="text-sm text-slate-600">Your dashboard data could not be loaded. Please try again.</p>
          <div className="flex gap-3 justify-center pt-2">
            <button
              onClick={() => navigate(-1)}
              className="px-4 py-2 bg-slate-200 text-slate-700 rounded-lg font-medium hover:bg-slate-300 transition-colors"
            >
              Go back
            </button>
            <button
              onClick={() => navigate('/')}
              className="px-4 py-2 bg-slate-700 text-white rounded-lg font-medium hover:bg-slate-800 transition-colors"
            >
              Go to homepage
            </button>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 py-3 md:py-4 px-3 md:px-4">
      <div className="max-w-3xl mx-auto space-y-3 md:space-y-4">
        {/* Compact Private Banner - Single Line */}
        <div className="bg-slate-700 text-white rounded-lg px-3 py-2 md:px-4 md:py-2 flex items-center gap-2 shadow-sm">
          <Eye className="w-3.5 h-3.5 md:w-4 md:h-4 flex-shrink-0" />
          <span className="text-xs md:text-sm font-medium">Private owner view — only visible to you</span>
        </div>

        {/* Compact Stats Section */}
        <div className="bg-white rounded-lg shadow-sm p-2 md:p-4 space-y-1.5 md:space-y-3">
          <h2 className="text-sm md:text-base font-semibold text-slate-900">You are currently losing clients</h2>

          {/* Mobile: Combined single card with 2-column layout */}
          <div className="md:hidden bg-slate-50 rounded-lg p-2.5 grid grid-cols-2 gap-2.5">
            <div className="space-y-1">
              <div className="flex items-center gap-1.5">
                <Mail className="w-3.5 h-3.5 text-slate-600 flex-shrink-0" />
                <h3 className="text-[11px] font-medium text-slate-600 leading-tight">Client requests missed (30d)</h3>
              </div>
              <div className="text-xl md:text-2xl font-bold text-slate-900">{displayCount}</div>
            </div>
            <div className="space-y-1">
              <div className="flex items-center gap-1.5">
                <CreditCard className="w-3.5 h-3.5 text-slate-700 flex-shrink-0" />
                <h3 className="text-[11px] font-medium text-slate-600 leading-tight">Revenue lost (30d)</h3>
              </div>
              <div className="text-xl md:text-2xl font-bold text-slate-900">
                {estimatedMissedRevenue !== null ? formatCurrency(estimatedMissedRevenue) : '—'}
              </div>
            </div>
          </div>

          {/* Desktop: Two separate cards side by side */}
          <div className="hidden md:grid md:grid-cols-2 md:gap-3">
            <div className="bg-slate-50 rounded-lg p-4 space-y-2">
              <div className="flex items-center gap-2">
                <Mail className="w-5 h-5 text-slate-600 flex-shrink-0" />
                <span className="text-2xl font-bold text-slate-900">{displayCount}</span>
              </div>
              <h3 className="text-sm font-semibold text-slate-900">Client requests missed (last 30 days)</h3>
            </div>

            {estimatedMissedRevenue !== null ? (
              <div className="bg-slate-50 rounded-lg p-4 space-y-2">
                <div className="flex items-center gap-2">
                  <CreditCard className="w-5 h-5 text-slate-700 flex-shrink-0" />
                  <span className="text-2xl font-bold text-slate-900">{formatCurrency(estimatedMissedRevenue)}</span>
                </div>
                <h3 className="text-sm font-semibold text-slate-900">Revenue lost (last 30 days)</h3>
              </div>
            ) : (
              <div className="bg-slate-50 rounded-lg p-4 space-y-2">
                <div className="flex items-center gap-2">
                  <CreditCard className="w-5 h-5 text-slate-400 flex-shrink-0" />
                  <span className="text-2xl font-bold text-slate-400">—</span>
                </div>
                <h3 className="text-sm font-semibold text-slate-900">Revenue lost (last 30 days)</h3>
                <button
                  type="button"
                  onClick={() => navigate(`/availability/owner/edit-listing?agencyId=${agencyId}&state=${stateSlug}`)}
                  className="text-xs font-medium text-slate-600 hover:text-slate-700"
                >
                  Set retainer to see estimate →
                </button>
              </div>
            )}
          </div>

          {availabilityRequests !== null && (
            <div className="bg-red-50 border border-red-200 rounded-lg p-2 md:p-3">
              <p className="text-[11px] md:text-sm font-semibold text-red-900 leading-snug">You're receiving 0 of these requests</p>
              <p className="text-[11px] md:text-xs text-red-700 mt-0.5 leading-snug">Clients are being redirected right now.</p>
            </div>
          )}
        </div>

        {/* CTA Section */}
        <div className="bg-gradient-to-br from-slate-800 to-slate-900 text-white rounded-lg shadow-lg p-3 md:p-4 space-y-1.5 md:space-y-2.5">
          <div>
            <h2 className="text-sm md:text-lg font-bold flex items-center gap-2">
              <Crown className="w-4 h-4 md:w-5 md:h-5 text-white" />
              One step left to fix this
            </h2>
            <p className="text-[11px] md:text-sm text-slate-300 leading-snug mt-0.5">
              Start receiving client requests directly.
            </p>
          </div>

          <div className="space-y-1.5">
            <button
              onClick={handleActivateListingClick}
              className="w-full bg-white text-slate-800 py-2.5 md:py-3 px-4 rounded-lg font-bold hover:bg-slate-100 transition-colors shadow-md hover:shadow-lg inline-flex items-center justify-center gap-2 text-sm md:text-base"
            >
              <Zap className="w-4 h-4 md:w-5 md:h-5 flex-shrink-0" />
              <span>Stop losing clients — activate your listing now</span>
            </button>
            <p className="text-center text-[10px] md:text-xs text-red-400 font-medium leading-tight">Clients are being redirected right now.</p>
          </div>
        </div>
      </div>

      <UpsellTop25SpotModal
        isOpen={showUpsellModal}
        onClose={() => setShowUpsellModal(false)}
        stateSlug={stateSlug || ''}
        stateName={agency?.state_name || ''}
        agencyName={agency?.name || ''}
      />
    </div>
  );
}
