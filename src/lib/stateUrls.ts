import { US_STATES } from './usStates';

export type StateRegionName = 'Northeast' | 'Midwest' | 'South' | 'West' | 'Territories';

export interface StateWithRegion {
  name: string;
  slug: string;
  abbr: string;
  region: StateRegionName;
}

export function top25StateUrl(slug: string): string {
  return `/marketing-agencies-in-${slug}-united-states/`;
}

const SLUG_TO_REGION: Record<string, StateRegionName> = {
  'maine': 'Northeast',
  'new-hampshire': 'Northeast',
  'vermont': 'Northeast',
  'massachusetts': 'Northeast',
  'rhode-island': 'Northeast',
  'connecticut': 'Northeast',
  'new-york': 'Northeast',
  'new-jersey': 'Northeast',
  'pennsylvania': 'Northeast',
  'district-of-columbia': 'Northeast',

  'ohio': 'Midwest',
  'michigan': 'Midwest',
  'indiana': 'Midwest',
  'illinois': 'Midwest',
  'wisconsin': 'Midwest',
  'minnesota': 'Midwest',
  'iowa': 'Midwest',
  'missouri': 'Midwest',
  'north-dakota': 'Midwest',
  'south-dakota': 'Midwest',
  'nebraska': 'Midwest',
  'kansas': 'Midwest',

  'delaware': 'South',
  'maryland': 'South',
  'virginia': 'South',
  'west-virginia': 'South',
  'kentucky': 'South',
  'north-carolina': 'South',
  'south-carolina': 'South',
  'tennessee': 'South',
  'georgia': 'South',
  'florida': 'South',
  'alabama': 'South',
  'mississippi': 'South',
  'louisiana': 'South',
  'arkansas': 'South',
  'oklahoma': 'South',
  'texas': 'South',

  'montana': 'West',
  'wyoming': 'West',
  'colorado': 'West',
  'new-mexico': 'West',
  'arizona': 'West',
  'utah': 'West',
  'nevada': 'West',
  'idaho': 'West',
  'washington': 'West',
  'oregon': 'West',
  'california': 'West',
  'alaska': 'West',
  'hawaii': 'West',

  'puerto-rico': 'Territories',
};

export const STATES_WITH_REGION: StateWithRegion[] = US_STATES.map(s => ({
  ...s,
  region: SLUG_TO_REGION[s.slug] ?? 'Territories',
}));

export interface ExploreRegion {
  name: StateRegionName;
  description: string;
  states: StateWithRegion[];
}

const REGION_DESCRIPTIONS: Record<StateRegionName, string> = {
  Northeast: 'Major East Coast marketing hubs including New York, New Jersey, Pennsylvania, and Connecticut.',
  Midwest: "Established and fast-growing marketing hubs in America's heartland.",
  South: 'Rapidly expanding marketing ecosystems across the Southeast and Southern U.S.',
  West: 'Creative and tech-forward marketing ecosystems including California and Washington.',
  Territories: 'U.S. territories with growing marketing agency ecosystems.',
};

const REGION_ORDER: StateRegionName[] = ['Northeast', 'Midwest', 'South', 'West', 'Territories'];

export function getStaticExploreRegions(): ExploreRegion[] {
  const byRegion = new Map<StateRegionName, StateWithRegion[]>();

  for (const state of STATES_WITH_REGION) {
    const list = byRegion.get(state.region) ?? [];
    list.push(state);
    byRegion.set(state.region, list);
  }

  return REGION_ORDER
    .filter(r => byRegion.has(r))
    .map(r => ({
      name: r,
      description: REGION_DESCRIPTIONS[r],
      states: byRegion.get(r)!,
    }));
}
