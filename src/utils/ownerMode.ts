export interface OwnerHashParams {
  owner: string | null;
  agency: string | null;
  section: 'top25' | 'other' | null;
  rank: number | null;
}

export interface AgencyMatch {
  found: boolean;
  agencyId: string;
  agencyName: string;
  rank?: number;
  section: 'top25' | 'other';
  stateName: string;
  stateSlug: string;
  matchKey?: string;
}

export function buildOwnerPreviewHash(
  agencyId: string,
  section: 'top25' | 'other',
  rank: number
): string {
  return `#owner=1&agency=${encodeURIComponent(agencyId)}&section=${section}&rank=${rank}`;
}

export function parseOwnerHash(): OwnerHashParams {
  const hash = window.location.hash.substring(1);
  const params = new URLSearchParams(hash);

  const rawSection = params.get('section');
  const section: 'top25' | 'other' | null =
    rawSection === 'other' ? 'other' : rawSection === 'top25' ? 'top25' : null;

  const rawRank = params.get('rank');
  const rank = rawRank && rawRank !== '' ? parseInt(rawRank, 10) : null;

  return {
    owner: params.get('owner'),
    agency: params.get('agency') || params.get('agencyId'),
    section,
    rank: rank !== null && !isNaN(rank) ? rank : null,
  };
}

export function normalizeId(value: any): string {
  return String(value).toLowerCase().trim();
}

export function tryMatchAgency(
  agencyId: string,
  agencies: any[] | undefined,
  section: 'top25' | 'other'
): { agency: any; matchKey: string } | null {
  if (!agencies || agencies.length === 0) return null;

  const normalizedSearchId = normalizeId(agencyId);

  const possibleKeys = section === 'top25'
    ? ['id', 'uuid', 'agency_id', 'agencyId', 'ownerAgencyId']
    : ['id', 'uuid', 'agency_id', 'agencyId'];

  for (const agency of agencies) {
    for (const key of possibleKeys) {
      if (agency[key] && normalizeId(agency[key]) === normalizedSearchId) {
        return { agency, matchKey: key };
      }
    }
  }

  return null;
}

export function launchOwnerPreview(
  agencyId: string,
  section: 'top25' | 'other',
  rank: number,
  targetStateSlug: string,
  currentStateSlug: string
): void {
  const hash = buildOwnerPreviewHash(agencyId, section, rank);
  if (targetStateSlug === currentStateSlug) {
    history.replaceState(null, '', window.location.pathname + window.location.search + hash);
    window.dispatchEvent(new HashChangeEvent('hashchange'));
  } else {
    window.location.href = `/marketing-agencies-in-${targetStateSlug}-united-states/${hash}`;
  }
}

export function resolveOwnerAgency(
  agencyId: string | null,
  stateName: string,
  stateSlug: string,
  top25Agencies: any[] | undefined,
  otherAgencies: any[] | undefined,
  debug: boolean = false
): AgencyMatch | null {
  if (!agencyId) return null;

  if (debug) {
    console.log('[OwnerMode Debug]', {
      agencyId,
      stateName,
      stateSlug,
      top25Length: top25Agencies?.length || 0,
      otherLength: otherAgencies?.length || 0,
    });
  }

  // Try Top-25
  const top25Match = tryMatchAgency(agencyId, top25Agencies, 'top25');
  if (top25Match) {
    const agency = top25Match.agency;
    if (debug) {
      console.log('[OwnerMode] Found in Top-25:', {
        matchKey: top25Match.matchKey,
        name: agency.name,
        rank: agency.rank,
      });
    }
    return {
      found: true,
      agencyId,
      agencyName: agency.name,
      rank: agency.rank,
      section: 'top25',
      stateName,
      stateSlug,
      matchKey: top25Match.matchKey,
    };
  }

  // Try Other Agencies
  const otherMatch = tryMatchAgency(agencyId, otherAgencies, 'other');
  if (otherMatch) {
    const agency = otherMatch.agency;
    if (debug) {
      console.log('[OwnerMode] Found in Other Agencies:', {
        matchKey: otherMatch.matchKey,
        name: agency.name,
      });
    }
    return {
      found: true,
      agencyId,
      agencyName: agency.name,
      section: 'other',
      stateName,
      stateSlug,
      matchKey: otherMatch.matchKey,
    };
  }

  if (debug) {
    console.log('[OwnerMode] Not found in any list');
  }

  return null;
}
