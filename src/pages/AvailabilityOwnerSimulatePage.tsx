import { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import AvailabilityModal from '../AvailabilityModal';
import { Eye } from 'lucide-react';

interface Agency {
  id: string;
  name: string;
  state_name: string;
}

export default function AvailabilityOwnerSimulatePage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const stateSlug = searchParams.get('state');
  const mode = searchParams.get('mode');

  const [agency, setAgency] = useState<Agency | null>(null);
  const [loading, setLoading] = useState(true);
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    document.title = 'Client Experience Simulation | Gappsy';
  }, []);

  useEffect(() => {
    async function loadAgency() {
      if (!agencyId || !stateSlug) {
        navigate('/');
        return;
      }

      try {
        const { data, error } = await supabase
          .from('other_agencies')
          .select('id, name, state_name')
          .eq('id', agencyId)
          .maybeSingle();

        if (error) throw error;

        if (data) {
          setAgency(data);
          setShowModal(true);
        } else {
          navigate('/');
        }
      } catch (error) {
        console.error('Error loading agency:', error);
        navigate('/');
      } finally {
        setLoading(false);
      }
    }

    loadAgency();
  }, [agencyId, stateSlug, navigate]);

  const handleModalClose = () => {
    navigate(`/availability/owner-dashboard?agencyId=${agencyId}&state=${stateSlug}`);
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600"></div>
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
            className="text-indigo-600 hover:text-indigo-700 font-medium"
          >
            ← Go back
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      <div className="fixed top-0 left-0 right-0 z-50 bg-indigo-600 text-white px-4 py-3 shadow-lg">
        <div className="max-w-4xl mx-auto flex items-center justify-center gap-2">
          <Eye className="w-5 h-5" />
          <div className="text-sm md:text-base font-medium">
            SIMULATION MODE - This is how clients experience your listing
          </div>
        </div>
      </div>

      <div className="pt-16">
        {showModal && (
          <AvailabilityModal
            isOpen={showModal}
            onClose={handleModalClose}
            agencyName={agency.name}
            stateName={agency.state_name}
            mode={mode || undefined}
            agencyId={agencyId || undefined}
            stateSlug={stateSlug || undefined}
          />
        )}
      </div>
    </div>
  );
}
