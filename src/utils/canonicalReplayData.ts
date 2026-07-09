/**
 * Single canonical source for ALL "missed client request" timing and replay data.
 *
 * V3: Storage keyed by agencyId (NOT slug) to prevent cross-state cache leakage.
 *
 * ONE function: getCanonicalReplayData(agencyId, stateSlug?, count?, newestRealMs?)
 * Returns: { agencyId, mostRecentRequestMs, missedRequestsLast30Days, entries }
 *
 * CROSS-DEVICE CANONICAL GUARANTEE
 * Cache validation rules (ALL must be true to use stored entries):
 *   1. stored.mostRecentRequestMs === resolvedAnchorMs  (anchor matches)
 *   2. stored.entries.length >= canonicalCount           (count matches or exceeds)
 *   3. stored.stateSlug === resolvedState                (state matches)
 *   4. stored.agencyId === agencyId                      (identity matches)
 */

function fnv(str: string): number {
  let h = 2166136261;
  for (let i = 0; i < str.length; i++) {
    h ^= str.charCodeAt(i);
    h = (Math.imul(h, 16777619)) >>> 0;
  }
  return h;
}

function djb2(str: string): number {
  let h = 5381;
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
    h = h >>> 0;
  }
  return h;
}

function pick<T>(arr: T[], seed: number): T {
  return arr[seed % arr.length];
}

const SHAPE_EXPONENTS = [0.52, 0.65, 0.80, 1.10, 1.35];

// Priority override window — must match server-side _shared/canonicalRotation.ts
const MIN_INTERVAL_H = 6;
const MAX_INTERVAL_H = 18;

function rotationIntervalHours(seedBase: string): number {
  const h = djb2(seedBase + ':interval');
  return MIN_INTERVAL_H + (h % (MAX_INTERVAL_H - MIN_INTERVAL_H + 1));
}

function priorityOverrideUntilMs(seedBase: string, overrideMs: number): number {
  return overrideMs + rotationIntervalHours(seedBase) * 3_600_000;
}

export const CITIES_BY_STATE: Record<string, string[]> = {
  'alabama': ['Birmingham', 'Huntsville', 'Mobile', 'Montgomery', 'Tuscaloosa', 'Hoover'],
  'alaska': ['Anchorage', 'Fairbanks', 'Juneau', 'Sitka', 'Ketchikan'],
  'arizona': ['Phoenix', 'Tucson', 'Scottsdale', 'Mesa', 'Chandler', 'Tempe', 'Gilbert'],
  'arkansas': ['Little Rock', 'Fort Smith', 'Fayetteville', 'Springdale', 'Jonesboro', 'Conway'],
  'california': ['Los Angeles', 'San Francisco', 'San Diego', 'San Jose', 'Sacramento', 'Oakland', 'Fresno', 'Long Beach'],
  'colorado': ['Denver', 'Colorado Springs', 'Aurora', 'Fort Collins', 'Boulder', 'Lakewood'],
  'connecticut': ['Bridgeport', 'Hartford', 'New Haven', 'Stamford', 'Waterbury', 'Norwalk'],
  'delaware': ['Wilmington', 'Dover', 'Newark', 'Middletown', 'Smyrna'],
  'district-of-columbia': ['Washington', 'Georgetown', 'Capitol Hill', 'Adams Morgan', 'Dupont Circle'],
  'florida': ['Miami', 'Orlando', 'Tampa', 'Jacksonville', 'St. Petersburg', 'Fort Lauderdale', 'Tallahassee', 'Hialeah'],
  'georgia': ['Atlanta', 'Savannah', 'Augusta', 'Columbus', 'Macon', 'Athens', 'Sandy Springs'],
  'hawaii': ['Honolulu', 'Hilo', 'Kailua', 'Pearl City', 'Waipahu', 'Kaneohe'],
  'idaho': ['Boise', 'Meridian', 'Nampa', 'Idaho Falls', 'Caldwell', 'Pocatello'],
  'illinois': ['Chicago', 'Aurora', 'Naperville', 'Rockford', 'Joliet', 'Springfield', 'Peoria'],
  'indiana': ['Indianapolis', 'Fort Wayne', 'Evansville', 'South Bend', 'Carmel', 'Fishers'],
  'iowa': ['Des Moines', 'Cedar Rapids', 'Davenport', 'Sioux City', 'Iowa City', 'Waterloo'],
  'kansas': ['Wichita', 'Overland Park', 'Kansas City', 'Topeka', 'Olathe', 'Lawrence'],
  'kentucky': ['Louisville', 'Lexington', 'Bowling Green', 'Owensboro', 'Covington', 'Richmond'],
  'louisiana': ['New Orleans', 'Baton Rouge', 'Shreveport', 'Metairie', 'Lafayette', 'Lake Charles'],
  'maine': ['Portland', 'Augusta', 'Bangor', 'Lewiston', 'Auburn', 'South Portland'],
  'maryland': ['Baltimore', 'Columbia', 'Annapolis', 'Frederick', 'Rockville', 'Gaithersburg'],
  'massachusetts': ['Boston', 'Worcester', 'Springfield', 'Cambridge', 'Lowell', 'Brockton', 'Quincy'],
  'michigan': ['Detroit', 'Grand Rapids', 'Lansing', 'Ann Arbor', 'Sterling Heights', 'Warren'],
  'minnesota': ['Minneapolis', 'St. Paul', 'Rochester', 'Duluth', 'Bloomington', 'Brooklyn Park'],
  'mississippi': ['Jackson', 'Gulfport', 'Southaven', 'Hattiesburg', 'Biloxi', 'Meridian'],
  'missouri': ['Kansas City', 'St. Louis', 'Springfield', 'Columbia', 'Independence', 'Lee\'s Summit'],
  'montana': ['Billings', 'Missoula', 'Great Falls', 'Bozeman', 'Helena', 'Butte'],
  'nebraska': ['Omaha', 'Lincoln', 'Bellevue', 'Grand Island', 'Kearney', 'Fremont'],
  'nevada': ['Las Vegas', 'Reno', 'Henderson', 'North Las Vegas', 'Sparks', 'Carson City'],
  'new-hampshire': ['Manchester', 'Nashua', 'Concord', 'Derry', 'Dover', 'Rochester'],
  'new-jersey': ['Newark', 'Jersey City', 'Trenton', 'Edison', 'Paterson', 'Elizabeth', 'Woodbridge'],
  'new-mexico': ['Albuquerque', 'Las Cruces', 'Rio Rancho', 'Santa Fe', 'Roswell', 'Farmington'],
  'new-york': ['New York City', 'Brooklyn', 'Buffalo', 'Rochester', 'Albany', 'Syracuse', 'Yonkers'],
  'north-carolina': ['Charlotte', 'Raleigh', 'Durham', 'Greensboro', 'Asheville', 'Wilmington', 'Winston-Salem', 'Cary'],
  'north-dakota': ['Fargo', 'Bismarck', 'Grand Forks', 'Minot', 'West Fargo', 'Dickinson'],
  'ohio': ['Columbus', 'Cleveland', 'Cincinnati', 'Toledo', 'Akron', 'Dayton', 'Parma'],
  'oklahoma': ['Oklahoma City', 'Tulsa', 'Norman', 'Broken Arrow', 'Edmond', 'Lawton'],
  'oregon': ['Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro', 'Beaverton', 'Bend'],
  'pennsylvania': ['Philadelphia', 'Pittsburgh', 'Allentown', 'Erie', 'Reading', 'Scranton', 'Bethlehem'],
  'puerto-rico': ['San Juan', 'Bayamón', 'Carolina', 'Ponce', 'Caguas', 'Guaynabo'],
  'rhode-island': ['Providence', 'Cranston', 'Warwick', 'Pawtucket', 'East Providence', 'Woonsocket'],
  'south-carolina': ['Charleston', 'Columbia', 'Greenville', 'Rock Hill', 'Mount Pleasant', 'Summerville'],
  'south-dakota': ['Sioux Falls', 'Rapid City', 'Aberdeen', 'Brookings', 'Watertown', 'Mitchell'],
  'tennessee': ['Nashville', 'Memphis', 'Knoxville', 'Chattanooga', 'Clarksville', 'Murfreesboro'],
  'texas': ['Houston', 'Dallas', 'Austin', 'San Antonio', 'Fort Worth', 'El Paso', 'Arlington', 'Plano'],
  'utah': ['Salt Lake City', 'Provo', 'Ogden', 'St. George', 'Sandy', 'West Valley City', 'Orem'],
  'vermont': ['Burlington', 'South Burlington', 'Montpelier', 'Barre', 'Rutland', 'Essex Junction'],
  'virginia': ['Virginia Beach', 'Norfolk', 'Richmond', 'Chesapeake', 'Arlington', 'Alexandria', 'Newport News'],
  'washington': ['Seattle', 'Spokane', 'Tacoma', 'Bellevue', 'Kirkland', 'Renton', 'Redmond'],
  'west-virginia': ['Charleston', 'Huntington', 'Morgantown', 'Parkersburg', 'Wheeling', 'Weirton'],
  'wisconsin': ['Milwaukee', 'Madison', 'Green Bay', 'Kenosha', 'Racine', 'Appleton', 'Waukesha'],
  'wyoming': ['Cheyenne', 'Casper', 'Laramie', 'Gillette', 'Rock Springs', 'Sheridan'],
};

export const STATE_ABBREVS: Record<string, string> = {
  'alabama': 'AL', 'alaska': 'AK', 'arizona': 'AZ', 'arkansas': 'AR',
  'california': 'CA', 'colorado': 'CO', 'connecticut': 'CT', 'delaware': 'DE',
  'district-of-columbia': 'DC', 'florida': 'FL', 'georgia': 'GA', 'hawaii': 'HI',
  'idaho': 'ID', 'illinois': 'IL', 'indiana': 'IN', 'iowa': 'IA',
  'kansas': 'KS', 'kentucky': 'KY', 'louisiana': 'LA', 'maine': 'ME',
  'maryland': 'MD', 'massachusetts': 'MA', 'michigan': 'MI', 'minnesota': 'MN',
  'mississippi': 'MS', 'missouri': 'MO', 'montana': 'MT', 'nebraska': 'NE',
  'nevada': 'NV', 'new-hampshire': 'NH', 'new-jersey': 'NJ', 'new-mexico': 'NM',
  'new-york': 'NY', 'north-carolina': 'NC', 'north-dakota': 'ND', 'ohio': 'OH',
  'oklahoma': 'OK', 'oregon': 'OR', 'pennsylvania': 'PA', 'puerto-rico': 'PR',
  'rhode-island': 'RI', 'south-carolina': 'SC', 'south-dakota': 'SD', 'tennessee': 'TN',
  'texas': 'TX', 'utah': 'UT', 'vermont': 'VT', 'virginia': 'VA',
  'washington': 'WA', 'west-virginia': 'WV', 'wisconsin': 'WI', 'wyoming': 'WY',
};

export const GENERIC_US_CITIES = [
  'Houston', 'Chicago', 'Phoenix', 'Philadelphia', 'San Antonio',
  'Columbus', 'Charlotte', 'Indianapolis', 'Denver', 'Seattle',
];

const LEDGER_SERVICES = [
  'SEO', 'Google Ads', 'Brand Strategy', 'Web Design',
  'Social Media', 'Content Marketing', 'Local SEO', 'CRO',
  'Landing Page', 'Email Marketing', 'PPC', 'Video Production',
];

const BUDGETS = [
  '$500–$1k/mo', '$1k–$2.5k/mo', '$2.5k–$5k/mo',
  '$5k–$7.5k/mo', '$7.5k–$10k/mo', '$10k+/mo',
];

const IP_PREFIXES = [
  '72.21', '74.125', '98.124', '104.18', '108.162',
  '162.158', '172.217', '199.27', '204.79', '209.85',
  '216.58', '66.249', '142.250', '35.186', '34.102',
  '23.32', '192.0', '198.41', '185.199', '151.101',
];

export interface CanonicalEntry {
  location: string;
  maskedIp: string;
  service: string;
  budget: string;
  absoluteMs: number;
  /** Present when this entry came from an admin override, not deterministic generation */
  isOverride?: boolean;
  /** Optional: timeline field from admin override */
  timeline?: string;
  /** Optional: device label from admin override */
  device?: string;
}

export interface CanonicalReplayResult {
  agencyId: string;
  mostRecentRequestMs: number;
  missedRequestsLast30Days: number;
  entries: CanonicalEntry[];
}

interface StoredCanonical {
  v: 3;
  agencyId: string;
  stateSlug: string;
  mostRecentRequestMs: number;
  entries: CanonicalEntry[];
}

const STORE_V = 3;

function storeKey(agencyId: string): string {
  return `canonical_replay_v3_${agencyId}`;
}

function loadStored(agencyId: string): StoredCanonical | null {
  try {
    const raw = localStorage.getItem(storeKey(agencyId));
    if (!raw) return null;
    const d = JSON.parse(raw) as StoredCanonical;
    if (d.v !== STORE_V || d.agencyId !== agencyId || !Array.isArray(d.entries)) return null;
    return d;
  } catch {
    return null;
  }
}

function persist(data: StoredCanonical): void {
  try {
    localStorage.setItem(storeKey(data.agencyId), JSON.stringify(data));
  } catch { }
}

export interface OverrideEntry {
  service?: string;
  budget?: string;
  timeline?: string;
  location?: string;
  maskedIp?: string;
  device?: string;
  absoluteMs: number;
}

export interface BuildInitialEntriesInput {
  agencyId?: string;
  agencySlug?: string;
  stateSlug: string;
  missedCount: number;
  /** Number of deterministic rows to generate (base count WITHOUT overrides).
   *  When provided, exactly this many deterministic rows are generated regardless
   *  of how many overrides are present.  Defaults to missedCount when omitted
   *  (legacy behaviour for callers that have not yet been updated). */
  baseGeneratedCount?: number;
  /** Stable generation anchor — ONLY used for deterministic layout.
   *  Must NEVER be changed when an admin override is added. */
  anchorMs: number;
  /** Override entries already filtered to last-30-days by the caller */
  overrideEntries?: OverrideEntry[];
  /** When set, the override whose absoluteMs matches is pinned to position 0
   *  regardless of timestamp order. Used during the manual-priority window. */
  priorityOverrideMs?: number;
}

export function buildInitialEntries(
  input: BuildInitialEntriesInput,
): CanonicalEntry[] {
  const {
    agencyId,
    agencySlug,
    stateSlug,
    missedCount: canonicalCount,
    anchorMs: baseAnchorMs,
    overrideEntries,
  } = input;
  if (!stateSlug || canonicalCount <= 0) return [];
  const cities = CITIES_BY_STATE[stateSlug];
  if (!cities) return [];
  const abbr = STATE_ABBREVS[stateSlug] ?? stateSlug.toUpperCase().slice(0, 2);

  const seedBase = `${agencyId || ''}|${agencySlug || ''}|${stateSlug}`;
  const shapeSeed = fnv(seedBase + ':shape');
  const shapeExp = SHAPE_EXPONENTS[shapeSeed % SHAPE_EXPONENTS.length];
  const totalMs = 30 * 24 * 60 * 60_000;

  // ── Override entries (pre-filtered to last-30d by caller), sorted DESC ───────
  const overridesSorted: CanonicalEntry[] = (overrideEntries ?? [])
    .slice()
    .sort((a, b) => b.absoluteMs - a.absoluteMs)
    .map((o) => ({
      location: o.location ?? `${pick(cities, djb2(String(o.absoluteMs) + 'lcit'))}, ${abbr}`,
      maskedIp: o.maskedIp ?? '172.58.xxx.xx',
      service: o.service ?? pick(LEDGER_SERVICES, djb2(String(o.absoluteMs) + 'lsvc')),
      budget: o.budget ?? BUDGETS[djb2(String(o.absoluteMs) + 'lbud') % BUDGETS.length],
      absoluteMs: o.absoluteMs,
      isOverride: true,
      timeline: o.timeline,
      device: o.device,
    }));

  // ── Deterministic entries — always from baseAnchorMs, never shifted ──────────
  // Generate ONLY baseGeneratedCount rows (the base count without overrides).
  // This ensures existing deterministic entries never shift when overrides are added.
  const deterministicCount =
    input.baseGeneratedCount !== undefined && input.baseGeneratedCount >= 0
      ? input.baseGeneratedCount
      : Math.max(0, canonicalCount - overridesSorted.length);

  const deterministicEntries: CanonicalEntry[] = [];
  for (let i = 0; i < deterministicCount; i++) {
    const s1 = djb2(seedBase + 'lrow' + i);
    const s2 = djb2(seedBase + 'lbud' + i);
    const s3 = djb2(seedBase + 'lsvc' + i);
    const s4 = djb2(seedBase + 'lcit' + i);
    const s5 = djb2(seedBase + 'lipr' + i);
    const s6 = djb2(seedBase + 'lip3' + i);

    let absoluteMs: number;
    if (i === 0) {
      absoluteMs = baseAnchorMs;
    } else {
      const t = deterministicCount > 1 ? i / (deterministicCount - 1) : 1;
      const fraction = Math.pow(t, shapeExp);
      const jitterMs = (s1 % 7200) * 60_000;
      absoluteMs = baseAnchorMs - Math.round(fraction * totalMs * 0.95) - jitterMs;
    }

    const ipPrefix = pick(IP_PREFIXES, s5);
    const oct3 = ((s6 % 220) + 10).toString();

    deterministicEntries.push({
      location: `${pick(cities, s4)}, ${abbr}`,
      maskedIp: `${ipPrefix}.${oct3.slice(0, 2)}x.xxx`,
      service: pick(LEDGER_SERVICES, s3),
      budget: BUDGETS[s2 % BUDGETS.length],
      absoluteMs,
    });
  }

  if (overridesSorted.length === 0) {
    return deterministicEntries;
  }

  // ── Merge: overrides float to correct timestamp position ─────────────────────
  // Final count = baseGeneratedCount + overrideEntries.length (safety-sliced).
  const finalCount = deterministicCount + overridesSorted.length;
  const merged = [...overridesSorted, ...deterministicEntries];
  merged.sort((a, b) => b.absoluteMs - a.absoluteMs);

  // During the priority window, the target override is pinned to index 0
  // regardless of timestamp order.
  if (typeof input.priorityOverrideMs === 'number' && input.priorityOverrideMs > 0) {
    const pinIdx = merged.findIndex(
      (e) => e.isOverride && e.absoluteMs === input.priorityOverrideMs,
    );
    if (pinIdx > 0) {
      const [pinned] = merged.splice(pinIdx, 1);
      merged.unshift(pinned);
    }
  }

  return merged.slice(0, finalCount);
}

export function getCanonicalReplayData(
  agencyId: string,
  stateSlug?: string,
  count?: number,
  newestRealMs?: number,
  agencySlug?: string,
  overrideEntries?: OverrideEntry[],
  /** Stable generation anchor (base_generated_anchor_ms from DB).
   *  When provided, used exclusively for deterministic generation.
   *  Display anchor = max(baseAnchorMs, newestFilteredOverrideMs). */
  baseAnchorMs?: number,
  /** Number of deterministic rows to generate (base count without overrides).
   *  Passed through to buildInitialEntries to prevent ledger shifting. */
  baseGeneratedCount?: number,
): CanonicalReplayResult {
  if (!agencyId) {
    return { agencyId: '', mostRecentRequestMs: 0, missedRequestsLast30Days: 0, entries: [] };
  }

  const resolvedState = stateSlug || '';
  const canonicalCount = Math.max(0, count ?? 0);
  const slug = agencySlug || agencyId;

  // Filter overrides to last-30-days here so callers don't need to
  const cutoffMs = Date.now() - 30 * 24 * 3600_000;
  const filteredOverrides = (overrideEntries ?? []).filter((o) => o.absoluteMs >= cutoffMs);
  const hasOverrides = filteredOverrides.length > 0;

  const newestOverrideMs = hasOverrides
    ? Math.max(...filteredOverrides.map((o) => o.absoluteMs))
    : 0;

  const stored = loadStored(agencyId);

  // resolvedBaseAnchorMs: stable generation anchor (never bumped by overrides)
  const resolvedBaseAnchorMs: number | null =
    (baseAnchorMs && baseAnchorMs > 0)
      ? baseAnchorMs
      : (newestRealMs && newestRealMs > 0)
        ? newestRealMs
        : stored?.mostRecentRequestMs ?? null;

  if (resolvedBaseAnchorMs === null) {
    // If we have overrides but no canonical anchor, use the newest override as base
    if (hasOverrides) {
      const seedBaseForPriorityInit = `${agencyId}|${slug}|${resolvedState}`;
      const untilMsInit = priorityOverrideUntilMs(seedBaseForPriorityInit, newestOverrideMs);
      const priorityPinMsInit = Date.now() < untilMsInit ? newestOverrideMs : undefined;
      const entries = buildInitialEntries({
        agencyId,
        agencySlug: slug,
        stateSlug: resolvedState,
        missedCount: canonicalCount,
        baseGeneratedCount,
        anchorMs: newestOverrideMs,
        overrideEntries: filteredOverrides,
        priorityOverrideMs: priorityPinMsInit,
      });
      return {
        agencyId,
        mostRecentRequestMs: newestOverrideMs,
        missedRequestsLast30Days: canonicalCount,
        entries,
      };
    }
    return { agencyId, mostRecentRequestMs: 0, missedRequestsLast30Days: 0, entries: [] };
  }

  // Display anchor: if a manual override is inside its priority window, it wins
  // unconditionally. Otherwise fall back to max(base, newest override in 30d).
  const seedBaseForPriority = `${agencyId}|${slug}|${resolvedState}`;
  let resolvedDisplayAnchorMs: number;
  let priorityPinMs: number | undefined;
  if (newestOverrideMs > 0) {
    const untilMs = priorityOverrideUntilMs(seedBaseForPriority, newestOverrideMs);
    if (Date.now() < untilMs) {
      resolvedDisplayAnchorMs = newestOverrideMs;
      priorityPinMs = newestOverrideMs;
    } else {
      resolvedDisplayAnchorMs = newestOverrideMs > resolvedBaseAnchorMs
        ? newestOverrideMs
        : resolvedBaseAnchorMs;
    }
  } else {
    resolvedDisplayAnchorMs = resolvedBaseAnchorMs;
  }

  // When overrides are present, skip localStorage cache (overrides may have changed)
  const cacheHit =
    !hasOverrides &&
    stored !== null &&
    stored.agencyId === agencyId &&
    stored.stateSlug === resolvedState &&
    stored.mostRecentRequestMs === resolvedBaseAnchorMs &&
    stored.entries.length >= canonicalCount;

  if (cacheHit && stored) {
    const entries = canonicalCount > 0 ? stored.entries.slice(0, canonicalCount) : [];
    return { agencyId, mostRecentRequestMs: resolvedDisplayAnchorMs, missedRequestsLast30Days: canonicalCount, entries };
  }

  if (canonicalCount === 0 && !hasOverrides) {
    persist({ v: STORE_V, agencyId, stateSlug: resolvedState, mostRecentRequestMs: resolvedBaseAnchorMs, entries: [] });
    return {
      agencyId,
      mostRecentRequestMs: resolvedDisplayAnchorMs,
      missedRequestsLast30Days: 0,
      entries: [],
    };
  }

  // Always pass the stable base anchor for generation, not the display anchor
  const entries = buildInitialEntries({
    agencyId,
    agencySlug: slug,
    stateSlug: resolvedState,
    missedCount: canonicalCount,
    baseGeneratedCount,
    anchorMs: resolvedBaseAnchorMs,
    overrideEntries: filteredOverrides,
    priorityOverrideMs: priorityPinMs,
  });

  // Only persist to localStorage when there are no overrides (overrides must stay server-fresh)
  if (!hasOverrides) {
    persist({ v: STORE_V, agencyId, stateSlug: resolvedState, mostRecentRequestMs: resolvedBaseAnchorMs, entries });
  }

  return {
    agencyId,
    mostRecentRequestMs: resolvedDisplayAnchorMs,
    missedRequestsLast30Days: canonicalCount,
    entries,
  };
}

export function cleanupLegacyReplayCache(): void {
  try {
    const keysToRemove: string[] = [];
    for (let i = 0; i < localStorage.length; i++) {
      const key = localStorage.key(i);
      if (!key) continue;
      if (key.startsWith('canonical_replay_v2_') || key.startsWith('missed_request_anchor_')) {
        keysToRemove.push(key);
      }
    }
    for (const key of keysToRemove) {
      localStorage.removeItem(key);
    }
    if (keysToRemove.length > 0) {
      localStorage.setItem('_replay_cache_v3_migrated', '1');
    }
  } catch { }
}

export function runReplayCacheMigration(): void {
  try {
    if (localStorage.getItem('_replay_cache_v3_migrated') === '1') return;
    cleanupLegacyReplayCache();
  } catch { }
}
