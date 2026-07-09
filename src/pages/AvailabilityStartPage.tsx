import { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Users, Building2 } from 'lucide-react';
import { supabase } from '../lib/supabase';

interface Agency {
  id: string;
  name: string;
}

export default function AvailabilityStartPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const stateSlug = searchParams.get('state');
  const source = searchParams.get('source') || 'other';

  const [agency, setAgency] = useState<Agency | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    document.title = 'Who are you? | Gappsy';
  }, []);

  // Redirect back if missing required params
  useEffect(() => {
    if (!agencyId || !stateSlug) {
      navigate('/');
    }
  }, [agencyId, stateSlug, navigate]);

  // Load agency data
  useEffect(() => {
    async function loadAgency() {
      if (!agencyId) {
        if (import.meta.env.DEV) {
          console.warn('[AvailabilityStart] No agencyId provided');
        }
        setLoading(false);
        return;
      }

      if (import.meta.env.DEV) {
        console.log('[AvailabilityStart] Loading agency with ID:', agencyId, 'source:', source);
      }

      try {
        const table = source === 'top25' ? 'top25_slots' : 'other_agencies';
        const { data, error } = await supabase
          .from(table)
          .select('id, name')
          .eq('id', agencyId)
          .maybeSingle();

        if (error) {
          if (import.meta.env.DEV) {
            console.error('[AvailabilityStart] Error loading agency:', error);
          }
          throw error;
        }

        if (data) {
          if (import.meta.env.DEV) {
            console.log('[AvailabilityStart] Agency loaded:', data);
          }
          setAgency(data);
        } else {
          if (import.meta.env.DEV) {
            console.warn('[AvailabilityStart] No agency found for ID:', agencyId);
          }
        }
      } catch (error) {
        if (import.meta.env.DEV) {
          console.error('[AvailabilityStart] Exception loading agency:', error);
        }
      } finally {
        setLoading(false);
      }
    }

    loadAgency();
  }, [agencyId, source]);

  const handleClientClick = () => {
    navigate(`/availability/client?agencyId=${agencyId}&source=${source}&state=${stateSlug}`);
  };

  const handleOwnerClick = () => {
    navigate(`/availability/verify?agencyId=${agencyId}&source=${source}&state=${stateSlug}`);
  };

  // Dynamic text with fallback
  const agencyReference = agency?.name || 'this agency';

  // Show loading state briefly
  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-[#0A1735]"></div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center px-4 bg-gradient-to-br from-slate-50 to-slate-100">
      <div className="w-full max-w-md rounded-2xl bg-white shadow-lg p-6 md:p-8 space-y-6">
        <div className="space-y-2">
          <h1 className="text-xl md:text-2xl font-semibold text-slate-900">
            Who are you?
          </h1>
          <p className="text-sm text-slate-600">
            Choose one option to continue. This helps us show you the right next step.
          </p>
        </div>

        <div className="space-y-3">
          <button
            type="button"
            onClick={handleClientClick}
            className="w-full rounded-xl border border-slate-200 bg-slate-50 hover:bg-slate-100 px-4 py-4 text-left transition-colors group"
          >
            <div className="flex items-start gap-3">
              <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-[#E8ECFA] flex items-center justify-center group-hover:bg-blue-200 transition-colors">
                <Users className="w-5 h-5 text-[#0A1735]" />
              </div>
              <div className="flex-1 min-w-0">
                <div className="font-medium text-slate-900 mb-0.5">
                  I'm a potential client
                </div>
                <div className="text-xs text-slate-600 leading-relaxed line-clamp-2">
                  I want to check availability and learn more about {agencyReference}.
                </div>
              </div>
            </div>
          </button>

          <button
            type="button"
            onClick={handleOwnerClick}
            className="w-full rounded-xl border border-indigo-200 bg-indigo-50 hover:bg-indigo-100 px-4 py-4 text-left transition-colors group"
          >
            <div className="flex items-start gap-3">
              <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-indigo-200 flex items-center justify-center group-hover:bg-indigo-300 transition-colors">
                <Building2 className="w-5 h-5 text-indigo-700" />
              </div>
              <div className="flex-1 min-w-0">
                <div className="font-medium text-slate-900 mb-0.5">
                  I'm an owner or employee of this agency
                </div>
                <div className="text-xs text-slate-600 leading-relaxed line-clamp-2">
                  I work at {agencyReference} and want to manage this listing.
                </div>
              </div>
            </div>
          </button>
        </div>

        <div className="pt-4 border-t border-slate-200">
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
