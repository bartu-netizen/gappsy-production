import { supabase } from './supabase';

interface AgencyLogoRecord {
  agency_name: string;
  state: string;
  logo_url: string;
  display_order: number | null;
}

const logoCache = new Map<string, AgencyLogoRecord[]>();

export async function fetchAgencyLogos(state: string): Promise<Map<string, string>> {
  const cacheKey = state.toLowerCase();

  if (logoCache.has(cacheKey)) {
    return mapLogosToNames(logoCache.get(cacheKey)!);
  }

  try {
    const { data, error } = await supabase
      .from('agency_logos')
      .select('agency_name, state, logo_url, display_order')
      .eq('state', cacheKey);

    if (error) {
      console.error('Error fetching agency logos:', error);
      return new Map();
    }

    if (data) {
      logoCache.set(cacheKey, data as AgencyLogoRecord[]);
      return mapLogosToNames(data as AgencyLogoRecord[]);
    }

    return new Map();
  } catch (error) {
    console.error('Error fetching agency logos:', error);
    return new Map();
  }
}

function mapLogosToNames(logos: AgencyLogoRecord[]): Map<string, string> {
  const map = new Map<string, string>();
  logos.forEach(logo => {
    map.set(logo.agency_name, logo.logo_url);
  });
  return map;
}

export function clearLogoCache(state?: string) {
  if (state) {
    logoCache.delete(state.toLowerCase());
  } else {
    logoCache.clear();
  }
}
