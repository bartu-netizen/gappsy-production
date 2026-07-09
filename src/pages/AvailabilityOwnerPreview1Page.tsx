import { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Eye, Lock, ArrowRight } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useOwnerListingEdit } from '../contexts/OwnerListingEditContext';
import ServicesBadges from '../components/ServicesBadges';
import ListingDescription from '../components/ListingDescription';

interface Agency {
  id: string;
  name: string;
  state_name: string;
  location: string;
  intro: string;
  services: string[];
}

export default function AvailabilityOwnerPreview1Page() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const stateSlug = searchParams.get('state');
  const isEdited = searchParams.get('edited') === '1';
  const { editedData } = useOwnerListingEdit();

  const [agency, setAgency] = useState<Agency | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    document.title = 'Client Simulation Preview | Gappsy';
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
          .select('id, name, state_name, location, intro, services')
          .eq('id', agencyId)
          .maybeSingle();

        if (agencyError) throw agencyError;

        if (!agencyData) {
          navigate('/');
          return;
        }

        setAgency(agencyData);
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
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
      </div>
    );
  }

  if (!agency) {
    return null;
  }

  // Use edited data if available, otherwise use original data
  const displayIntro = isEdited && editedData ? editedData.intro : agency.intro;
  const displayServices = isEdited && editedData && editedData.services.length > 0
    ? [editedData.services[0]]
    : agency.services && agency.services.length > 0
    ? [agency.services[0]]
    : [];
  const remainingCount = isEdited && editedData
    ? editedData.services.length - 1
    : agency.services ? agency.services.length - 1 : 0;

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 py-4 md:py-8 px-4">
      <div className="max-w-2xl mx-auto space-y-4 md:space-y-6">
        <div className="bg-indigo-600 text-white rounded-xl p-4 flex items-center gap-3 shadow-lg">
          <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-indigo-500 flex items-center justify-center">
            <Eye className="w-5 h-5" />
          </div>
          <div>
            <div className="font-semibold text-sm md:text-base">PRIVATE OWNER VIEW</div>
            <div className="text-xs md:text-sm text-indigo-100">Clients cannot see this page</div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-4 md:p-6 space-y-4">
          <div className="space-y-2">
            <h1 className="text-lg md:text-xl font-semibold text-slate-900">
              See what potential clients currently see for "{agency.name}"
            </h1>
            <p className="text-xs md:text-sm text-slate-600 leading-relaxed">
              <strong>Hint:</strong> visitors have already been clicking "Check Availability" — you'll see the exact missed requests after this quick simulation.
            </p>
          </div>

          <div className="border border-slate-200 rounded-lg p-4 space-y-3 bg-slate-50">
            <div>
              <h2 className="font-semibold text-slate-900 text-base md:text-lg">{agency.name}</h2>
              <p className="text-xs md:text-sm text-slate-600 mt-1">
                {agency.location}, {agency.state_name}
              </p>
            </div>

            <ListingDescription
              fullText={displayIntro}
              limit={160}
              forceCollapsed={false}
              isPreviewPage={true}
            />

            {displayServices.length > 0 && (
              <div className="flex flex-wrap gap-1.5">
                <ServicesBadges
                  services={displayServices}
                  badgeStyle={{
                    fontSize: '11px',
                    padding: '4px 8px',
                    backgroundColor: '#f1f5f9',
                    color: '#475569',
                    border: '1px solid #e2e8f0',
                    borderRadius: '4px'
                  }}
                />
                {remainingCount > 0 && (
                  <span className="text-xs px-2 py-1 bg-slate-100 text-slate-600 rounded border border-slate-200">
                    +{remainingCount} more
                  </span>
                )}
              </div>
            )}

            <button
              disabled
              className="w-full bg-slate-200 text-slate-400 py-2 rounded-lg font-medium text-sm cursor-not-allowed"
            >
              Check Availability
            </button>
          </div>

          <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-3 md:p-4 flex items-start gap-2">
            <Lock className="w-5 h-5 text-yellow-600 flex-shrink-0 mt-0.5" />
            <div className="space-y-1">
              <p className="text-xs md:text-sm font-medium text-slate-900">
                This is what clients currently see — and why they aren't converting.
              </p>
              <p className="text-xs text-slate-600 leading-relaxed">
                Your listing is unclaimed and missing essential info like website, phone number, pricing, and contact details. To understand how clients experience your listing, please go through a quick simulation.
              </p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm p-4 md:p-6">
          <button
            onClick={() => navigate(`/availability/owner-simulate?agencyId=${agencyId}&state=${stateSlug}&mode=owner-sim`)}
            className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md flex items-center justify-center gap-2"
          >
            Continue Simulation
            <ArrowRight className="w-5 h-5" />
          </button>
        </div>

        <div className="text-center">
          <button
            onClick={() => navigate(-1)}
            className="text-sm text-slate-500 hover:text-slate-700 transition-colors"
          >
            ← Go back
          </button>
        </div>
      </div>
    </div>
  );
}
