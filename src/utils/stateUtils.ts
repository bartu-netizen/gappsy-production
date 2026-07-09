/**
 * CRITICAL: DO NOT USE THIS FOR UI STATE LISTINGS
 *
 * This array is ONLY for utility functions (slug lookups, abbreviations, name conversions).
 *
 * For listing states in UI components, ALWAYS use the database:
 * - Import from: `src/lib/stateDatabase.ts`
 * - Use: `getAllActiveStates()` or `getStatesByRegion()`
 *
 * The database (state_pages table) is the SINGLE SOURCE OF TRUTH for active states.
 */

export interface StateInfo {
  name: string;
  slug: string;
  abbr: string;
}

export const US_STATES: StateInfo[] = [
  { name: 'Alabama', slug: 'alabama', abbr: 'AL' },
  { name: 'Alaska', slug: 'alaska', abbr: 'AK' },
  { name: 'Arizona', slug: 'arizona', abbr: 'AZ' },
  { name: 'Arkansas', slug: 'arkansas', abbr: 'AR' },
  { name: 'California', slug: 'california', abbr: 'CA' },
  { name: 'Colorado', slug: 'colorado', abbr: 'CO' },
  { name: 'Connecticut', slug: 'connecticut', abbr: 'CT' },
  { name: 'Delaware', slug: 'delaware', abbr: 'DE' },
  { name: 'Florida', slug: 'florida', abbr: 'FL' },
  { name: 'Georgia', slug: 'georgia', abbr: 'GA' },
  { name: 'Hawaii', slug: 'hawaii', abbr: 'HI' },
  { name: 'Idaho', slug: 'idaho', abbr: 'ID' },
  { name: 'Illinois', slug: 'illinois', abbr: 'IL' },
  { name: 'Indiana', slug: 'indiana', abbr: 'IN' },
  { name: 'Iowa', slug: 'iowa', abbr: 'IA' },
  { name: 'Kansas', slug: 'kansas', abbr: 'KS' },
  { name: 'Kentucky', slug: 'kentucky', abbr: 'KY' },
  { name: 'Louisiana', slug: 'louisiana', abbr: 'LA' },
  { name: 'Maine', slug: 'maine', abbr: 'ME' },
  { name: 'Maryland', slug: 'maryland', abbr: 'MD' },
  { name: 'Massachusetts', slug: 'massachusetts', abbr: 'MA' },
  { name: 'Michigan', slug: 'michigan', abbr: 'MI' },
  { name: 'Minnesota', slug: 'minnesota', abbr: 'MN' },
  { name: 'Mississippi', slug: 'mississippi', abbr: 'MS' },
  { name: 'Missouri', slug: 'missouri', abbr: 'MO' },
  { name: 'Montana', slug: 'montana', abbr: 'MT' },
  { name: 'Nebraska', slug: 'nebraska', abbr: 'NE' },
  { name: 'Nevada', slug: 'nevada', abbr: 'NV' },
  { name: 'New Hampshire', slug: 'new-hampshire', abbr: 'NH' },
  { name: 'New Jersey', slug: 'new-jersey', abbr: 'NJ' },
  { name: 'New Mexico', slug: 'new-mexico', abbr: 'NM' },
  { name: 'New York', slug: 'new-york', abbr: 'NY' },
  { name: 'North Carolina', slug: 'north-carolina', abbr: 'NC' },
  { name: 'North Dakota', slug: 'north-dakota', abbr: 'ND' },
  { name: 'Ohio', slug: 'ohio', abbr: 'OH' },
  { name: 'Oklahoma', slug: 'oklahoma', abbr: 'OK' },
  { name: 'Oregon', slug: 'oregon', abbr: 'OR' },
  { name: 'Pennsylvania', slug: 'pennsylvania', abbr: 'PA' },
  { name: 'Rhode Island', slug: 'rhode-island', abbr: 'RI' },
  { name: 'South Carolina', slug: 'south-carolina', abbr: 'SC' },
  { name: 'South Dakota', slug: 'south-dakota', abbr: 'SD' },
  { name: 'Tennessee', slug: 'tennessee', abbr: 'TN' },
  { name: 'Texas', slug: 'texas', abbr: 'TX' },
  { name: 'Utah', slug: 'utah', abbr: 'UT' },
  { name: 'Vermont', slug: 'vermont', abbr: 'VT' },
  { name: 'Virginia', slug: 'virginia', abbr: 'VA' },
  { name: 'Washington', slug: 'washington', abbr: 'WA' },
  { name: 'West Virginia', slug: 'west-virginia', abbr: 'WV' },
  { name: 'Wisconsin', slug: 'wisconsin', abbr: 'WI' },
  { name: 'Wyoming', slug: 'wyoming', abbr: 'WY' },
  { name: 'District of Columbia', slug: 'district-of-columbia', abbr: 'DC' },
  { name: 'Puerto Rico', slug: 'puerto-rico', abbr: 'PR' }
];

/**
 * Get state info by slug
 * @param slug - The state slug (e.g., 'new-jersey')
 * @returns StateInfo object or undefined if not found
 */
export function getStateBySlug(slug: string): StateInfo | undefined {
  return US_STATES.find(s => s.slug === slug);
}

/**
 * Get state abbreviation by slug
 * @param slug - The state slug (e.g., 'new-jersey')
 * @returns Two-letter state abbreviation or empty string if not found
 */
export function getStateAbbr(slug: string): string {
  return getStateBySlug(slug)?.abbr || '';
}

/**
 * Convert state name to slug
 * @param stateName - The full state name (e.g., 'New Jersey')
 * @returns State slug or 'new-jersey' as fallback
 */
export function stateNameToSlug(stateName: string): string {
  const state = US_STATES.find(s => s.name === stateName);
  return state?.slug || 'new-jersey';
}

/**
 * Get state name by slug
 * @param slug - The state slug (e.g., 'new-jersey')
 * @returns State name or empty string if not found
 */
export function getStateName(slug: string): string {
  return getStateBySlug(slug)?.name || '';
}

/**
 * Check if a slug is valid
 * @param slug - The state slug to validate
 * @returns true if slug exists in US_STATES
 */
export function isValidStateSlug(slug: string): boolean {
  return US_STATES.some(s => s.slug === slug);
}
