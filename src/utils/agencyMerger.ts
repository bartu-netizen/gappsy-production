import { supabase } from '../lib/supabase';

export interface PlaceholderAgency {
  rank: number;
  name: string;
  website: string;
  logoUrl: string;
  description: string;
  shortDescription?: string;
  fullDescription?: string;
  services: string[];
  isPaid: false;
}

export interface PaidAgency {
  id: string;
  agency_id: string;
  state_slug: string;
  rank: number;
  agency_name: string;
  website: string;
  logo_url: string;
  description?: string;
  services?: string[];
  is_paid: true;
  claimed_at: string;
  created_at: string;
}

export interface MergedAgency {
  rank: number;
  name: string;
  website: string;
  logoUrl: string;
  description: string;
  shortDescription?: string;
  fullDescription?: string;
  services: string[];
  isPaid: boolean;
  show_lightning?: boolean;
  id?: string;
  claimedAt?: string;
  ownerAgencyId?: string;
}

export async function getStateAgencies(stateSlug: string): Promise<MergedAgency[]> {
  const paidAgencies = await supabase
    .from('top25_slots')
    .select('*')
    .eq('state_slug', stateSlug)
    .eq('is_paid', true)
    .eq('is_available', false)
    .not('agency_id', 'is', null)
    .order('rank', { ascending: true });

  const placeholderResponse = await fetch(`/data/${stateSlug}.json`);
  if (!placeholderResponse.ok) {
    throw new Error(`Failed to load placeholder data for ${stateSlug}`);
  }
  const placeholderData = await placeholderResponse.json();

  const logoOverrides = await supabase
    .from('placeholder_agency_logos')
    .select('*')
    .eq('state_slug', stateSlug);

  const agencies: MergedAgency[] = Array(25)
    .fill(null)
    .map((_, i) => {
      const rank = i + 1;

      const paid = paidAgencies.data?.find((a) => a.rank === rank);
      if (paid) {
        return {
          rank: paid.rank,
          name: paid.agency_name || 'Unnamed Agency',
          website: paid.website || '',
          logoUrl: paid.logo_url || '',
          description: paid.description || '',
          services: paid.services || [],
          isPaid: true,
          id: paid.id,
          claimedAt: paid.claimed_at || undefined,
          ownerAgencyId: paid.agency_id,
        };
      }

      const placeholder = placeholderData.agencies.find((a: PlaceholderAgency) => a.rank === rank);
      if (placeholder) {
        const logoOverride = logoOverrides.data?.find((l) => l.agency_rank === rank);

        return {
          rank: placeholder.rank,
          name: placeholder.name,
          website: placeholder.website,
          logoUrl: logoOverride?.logo_url || placeholder.logoUrl,
          description: placeholder.description,
          shortDescription: placeholder.shortDescription,
          fullDescription: placeholder.fullDescription,
          services: placeholder.services,
          isPaid: false,
        };
      }

      return {
        rank,
        name: `Available Spot #${rank}`,
        website: '',
        logoUrl: '',
        description: 'This spot is available for your agency.',
        services: [],
        isPaid: false,
      };
    });

  return agencies;
}

export async function getAvailableSpots(stateSlug: string): Promise<number[]> {
  const { data: unavailableSlots } = await supabase
    .from('top25_slots')
    .select('rank')
    .eq('state_slug', stateSlug)
    .eq('is_available', false);

  const occupiedRanks = unavailableSlots?.map((a) => a.rank) || [];

  const availableSpots: number[] = [];
  for (let rank = 1; rank <= 25; rank++) {
    if (!occupiedRanks.includes(rank)) {
      availableSpots.push(rank);
    }
  }

  return availableSpots;
}

export async function checkSpotAvailability(
  stateSlug: string,
  rank: number
): Promise<{ available: boolean; reason?: string }> {
  const { data } = await supabase
    .from('top25_slots')
    .select('*')
    .eq('state_slug', stateSlug)
    .eq('rank', rank)
    .eq('is_available', false)
    .maybeSingle();

  if (data) {
    return {
      available: false,
      reason: 'This spot is already occupied',
    };
  }

  return { available: true };
}
