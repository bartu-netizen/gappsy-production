import { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import AvailabilityModal from '../AvailabilityModal';
import { formatStateName } from '../utils/formatLocation';

interface ResolvedAgency {
  id: string;
  name: string;
  stateSlug: string | null;
  stateName: string;
  source: 'other' | 'top25';
}

export default function AvailabilityClientPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const stateSlugParam = searchParams.get('state');
  const sourceParam = searchParams.get('source');

  const [agency, setAgency] = useState<ResolvedAgency | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadAgency() {
      if (!agencyId) {
        navigate('/');
        return;
      }

      try {
        const preferTop25 = sourceParam === 'top25';

        // Resolve agency from either other_agencies or top25_slots so paid Top25
        // listings reach the modal with the same agency_id the modal uses to
        // detect paid status and route the recommendation to the paid agency.
        let resolved: ResolvedAgency | null = null;

        if (!preferTop25) {
          const { data: other } = await supabase
            .from('other_agencies')
            .select('id, name, state_name, state_slug')
            .eq('id', agencyId)
            .maybeSingle();

          if (other) {
            resolved = {
              id: other.id,
              name: other.name,
              stateSlug: other.state_slug || stateSlugParam,
              stateName: formatStateName(other.state_name || stateSlugParam || ''),
              source: 'other',
            };
          }
        }

        if (!resolved) {
          // Try top25_slots by id (slot UUID) first, then by agency_id.
          const { data: slotById } = await supabase
            .from('top25_slots')
            .select('id, agency_id, agency_name, state_slug')
            .eq('id', agencyId)
            .maybeSingle();

          const slot = slotById || await (async () => {
            const { data } = await supabase
              .from('top25_slots')
              .select('id, agency_id, agency_name, state_slug')
              .eq('agency_id', agencyId)
              .maybeSingle();
            return data;
          })();

          if (slot) {
            const resolvedId = slot.agency_id || slot.id;
            resolved = {
              id: resolvedId,
              name: slot.agency_name,
              stateSlug: slot.state_slug || stateSlugParam,
              stateName: formatStateName(slot.state_slug || stateSlugParam || ''),
              source: 'top25',
            };
          }
        }

        if (preferTop25 && !resolved) {
          // If caller explicitly asked for top25 but we didn't find it above,
          // re-check other_agencies as a last resort so we never dead-end.
          const { data: other } = await supabase
            .from('other_agencies')
            .select('id, name, state_name, state_slug')
            .eq('id', agencyId)
            .maybeSingle();

          if (other) {
            resolved = {
              id: other.id,
              name: other.name,
              stateSlug: other.state_slug || stateSlugParam,
              stateName: formatStateName(other.state_name || stateSlugParam || ''),
              source: 'other',
            };
          }
        }

        if (resolved) {
          setAgency(resolved);
          document.title = `Check Availability – ${resolved.name} | Gappsy`;
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
  }, [agencyId, sourceParam, stateSlugParam, navigate]);

  const handleClose = () => {
    navigate(-1);
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-[#0A1735]"></div>
      </div>
    );
  }

  if (!agency) {
    return null;
  }

  return (
    <AvailabilityModal
      isOpen={true}
      onClose={handleClose}
      agencyName={agency.name}
      stateName={agency.stateName}
      agencyId={agency.id}
      stateSlug={agency.stateSlug ?? undefined}
    />
  );
}
