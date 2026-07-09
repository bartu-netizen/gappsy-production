import { supabase } from './supabase';

export interface StateFromDB {
  state_slug: string;
  state_name: string;
  canonical_url: string;
  full_canonical_url: string;
  is_active: boolean;
}

export interface StateRegion {
  name: string;
  badge: string;
  description: string;
  states: StateFromDB[];
}

const REGION_DEFINITIONS = {
  'Northeast': {
    name: 'Northeast',
    badge: 'NORTHEAST REGION',
    description: 'Major East Coast marketing hubs including New York, New Jersey, Pennsylvania, and Connecticut.',
    stateNames: [
      'Maine', 'New Hampshire', 'Vermont', 'Massachusetts', 'Rhode Island', 'Connecticut',
      'New York', 'New Jersey', 'Pennsylvania', 'District of Columbia', 'District Of Columbia'
    ]
  },
  'Midwest': {
    name: 'Midwest',
    badge: 'MIDWEST REGION',
    description: 'Established and fast-growing marketing hubs in America\'s heartland.',
    stateNames: [
      'Ohio', 'Michigan', 'Indiana', 'Illinois', 'Wisconsin', 'Minnesota', 'Iowa', 'Missouri',
      'North Dakota', 'South Dakota', 'Nebraska', 'Kansas'
    ]
  },
  'South': {
    name: 'South',
    badge: 'SOUTH REGION',
    description: 'Rapidly expanding marketing ecosystems across the Southeast and Southern U.S.',
    stateNames: [
      'Delaware', 'Maryland', 'Virginia', 'West Virginia', 'Kentucky', 'North Carolina',
      'South Carolina', 'Tennessee', 'Georgia', 'Florida', 'Alabama', 'Mississippi',
      'Louisiana', 'Arkansas', 'Oklahoma', 'Texas'
    ]
  },
  'West': {
    name: 'West',
    badge: 'WEST REGION',
    description: 'Creative and tech-forward marketing ecosystems including California and Washington.',
    stateNames: [
      'Montana', 'Wyoming', 'Colorado', 'New Mexico', 'Arizona', 'Utah', 'Nevada', 'Idaho',
      'Washington', 'Oregon', 'California', 'Alaska', 'Hawaii'
    ]
  },
  'Territories': {
    name: 'Territories',
    badge: 'U.S. TERRITORIES',
    description: 'U.S. territories with growing marketing agency ecosystems.',
    stateNames: [
      'Puerto Rico'
    ]
  }
};

export async function getAllActiveStates(): Promise<StateFromDB[]> {
  const { data, error } = await supabase
    .from('state_pages')
    .select('state_slug, state_name, canonical_url, full_canonical_url, is_active')
    .eq('is_active', true)
    .order('state_name');

  if (error) {
    console.error('Failed to fetch states from database:', error);
    if (import.meta.env.DEV) {
      console.warn('⚠️ DEV WARNING: State fetch failed. Using database fallback.');
    }
    return [];
  }

  return data || [];
}

export async function getStatesByRegion(): Promise<StateRegion[]> {
  const allStates = await getAllActiveStates();

  if (allStates.length === 0) {
    console.error('❌ No active states found in database. Regional grouping will be empty.');
    return [];
  }

  const stateMap = new Map(allStates.map(state => [state.state_name.toLowerCase(), state]));

  const regions: StateRegion[] = Object.values(REGION_DEFINITIONS).map(region => {
    const seen = new Set<string>();
    const statesInRegion = region.stateNames
      .map(name => stateMap.get(name.toLowerCase()))
      .filter((state): state is StateFromDB => {
        if (!state) return false;
        if (seen.has(state.state_slug)) return false;
        seen.add(state.state_slug);
        return true;
      });

    if (import.meta.env.DEV && statesInRegion.length < 1) {
      const missing = region.stateNames.filter(name => !stateMap.has(name.toLowerCase()));
      console.warn(`⚠️ DEV WARNING: ${region.name} is missing states in database:`, missing);
    }

    return {
      name: region.name,
      badge: region.badge,
      description: region.description,
      states: statesInRegion
    };
  });

  const assignedStateNames = new Set(
    Object.values(REGION_DEFINITIONS).flatMap(r => r.stateNames)
  );

  const unassignedStates = allStates.filter(
    state => !assignedStateNames.has(state.state_name)
  );

  if (unassignedStates.length > 0 && import.meta.env.DEV) {
    console.warn(`⚠️ DEV WARNING: ${unassignedStates.length} states in database not assigned to any region:`,
      unassignedStates.map(s => s.state_name));
  }

  return regions;
}

export async function findStateBySlug(slug: string): Promise<StateFromDB | null> {
  const { data, error } = await supabase
    .from('state_pages')
    .select('state_slug, state_name, canonical_url, full_canonical_url, is_active')
    .eq('state_slug', slug)
    .eq('is_active', true)
    .maybeSingle();

  if (error) {
    console.error(`Failed to fetch state ${slug}:`, error);
    return null;
  }

  return data;
}

export async function findStateByName(name: string): Promise<StateFromDB | null> {
  const { data, error } = await supabase
    .from('state_pages')
    .select('state_slug, state_name, canonical_url, full_canonical_url, is_active')
    .ilike('state_name', name)
    .eq('is_active', true)
    .maybeSingle();

  if (error) {
    console.error(`Failed to fetch state by name ${name}:`, error);
    return null;
  }

  return data;
}
