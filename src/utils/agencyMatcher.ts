export function normalizeAgencyName(name: string): string {
  return name
    .trim()
    .toLowerCase()
    .replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g, '')
    .replace(/\s+/g, ' ');
}

const PLACEHOLDER_VALUES = new Set(['-', 'n/a', 'none', 'null', 'undefined', 'na', 'no', 'not available', '']);

const TRAILING_SUFFIX_TOKENS = [
  'marketing agency',
  'digital agency',
  'creative agency',
  'advertising agency',
  'corporation',
  'company',
  'marketing',
  'digital',
  'agency',
  'agencies',
  'studio',
  'studios',
  'group',
  'media',
  'llc',
  'l.l.c',
  'inc',
  'incorporated',
  'ltd',
  'limited',
  'co',
  'corp',
];

/**
 * Strict normalizer for customer suppression matching.
 * Mirrors supabase/functions/_shared/normalizeHelpers.ts::normalizeAgencyNameStrict
 */
export function normalizeAgencyNameStrict(name: string | null | undefined): {
  canonical: string | null;
  preserved: string | null;
} {
  if (!name) return { canonical: null, preserved: null };
  let n = name.trim().toLowerCase();
  if (PLACEHOLDER_VALUES.has(n)) return { canonical: null, preserved: null };
  n = n.replace(/[.,&'"`!?:;|/\\()\[\]{}]/g, ' ').replace(/\s+/g, ' ').trim();
  if (!n) return { canonical: null, preserved: null };

  const preserved = n;
  let canonical = n;

  let didStrip = true;
  while (didStrip) {
    didStrip = false;
    for (const suffix of TRAILING_SUFFIX_TOKENS) {
      const re = new RegExp(`(^|\\s)${suffix.replace(/\s+/g, '\\s+')}$`);
      if (re.test(canonical)) {
        const candidate = canonical.replace(re, '').trim();
        const tokens = candidate.split(/\s+/).filter(Boolean);
        if (candidate.length >= 3 && tokens.length >= 1 && candidate !== canonical) {
          canonical = candidate;
          didStrip = true;
          break;
        }
      }
    }
  }

  if (!canonical || canonical.length < 3) {
    return { canonical: preserved, preserved };
  }

  return { canonical, preserved };
}

export function normalizeWebsiteUrl(url: string): string {
  let normalized = url.trim().toLowerCase();

  normalized = normalized.replace(/^(https?:\/\/)?(www\.)?/, '');

  normalized = normalized.replace(/\/.*$/, '');

  normalized = normalized.replace(/\?.*$/, '');

  return normalized;
}

export interface AgencyMatchResult {
  exists: boolean;
  agencyId?: string;
  agencyName?: string;
  stateName?: string;
}

export async function checkExistingAgency(
  stateSlug: string,
  agencyName: string,
  websiteUrl: string,
  supabaseUrl: string,
  supabaseAnonKey: string
): Promise<AgencyMatchResult> {
  try {
    const apiUrl = `${supabaseUrl}/functions/v1/check-existing-agency`;

    console.log('🌐 FRONTEND - Calling match API:', apiUrl);

    const response = await fetch(apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${supabaseAnonKey}`,
      },
      body: JSON.stringify({
        stateSlug,
        agencyName,
        websiteUrl,
      }),
    });

    console.log('🌐 FRONTEND - API response status:', response.status);

    if (!response.ok) {
      const errorText = await response.text();
      console.error('🌐 FRONTEND - API error:', response.status, errorText);
      return { exists: false };
    }

    const data = await response.json();
    console.log('🌐 FRONTEND - API response data:', data);
    return data;
  } catch (error) {
    console.error('🌐 FRONTEND - Exception calling API:', error);
    return { exists: false };
  }
}
