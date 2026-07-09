/**
 * Deterministic competitor resolver for /request-compare.
 *
 * Selection priority:
 *   1. Paid Top-25 (rank 1) in state (server-resolved — we only consume name/slug)
 *   2. Paid Other Agency in state (server-resolved)
 *   3. Pinned showcase agency
 *   4. Existing global recommended agency
 *   5. Deterministic fallback using the agency slug seed
 *
 * This client helper only handles 3–5; (1) and (2) are passed in via props when
 * available. Keeps the page rendering deterministically offline.
 */
import { recommendedAgency } from '../config/recommendedAgency';

export interface CompareCompetitor {
  name: string;
  slug: string | null;
  website: string | null;
  source: 'paid_top25' | 'paid_other' | 'pinned' | 'recommended' | 'fallback';
}

export interface ResolveCompetitorInput {
  paidTop25?: { name: string; slug: string | null; website?: string | null } | null;
  paidOther?: { name: string; slug: string | null; website?: string | null } | null;
  pinned?: { name: string; slug: string | null; website?: string | null } | null;
  agencySlug: string;
  stateName?: string;
}

export function resolveCompareCompetitor(input: ResolveCompetitorInput): CompareCompetitor {
  if (input.paidTop25?.name) {
    return {
      name: input.paidTop25.name,
      slug: input.paidTop25.slug,
      website: input.paidTop25.website || null,
      source: 'paid_top25',
    };
  }
  if (input.paidOther?.name) {
    return {
      name: input.paidOther.name,
      slug: input.paidOther.slug,
      website: input.paidOther.website || null,
      source: 'paid_other',
    };
  }
  if (input.pinned?.name) {
    return {
      name: input.pinned.name,
      slug: input.pinned.slug,
      website: input.pinned.website || null,
      source: 'pinned',
    };
  }
  if (recommendedAgency?.name) {
    return {
      name: recommendedAgency.name,
      slug: recommendedAgency.slug || null,
      website: recommendedAgency.website || null,
      source: 'recommended',
    };
  }
  return {
    name: 'Active agency',
    slug: null,
    website: null,
    source: 'fallback',
  };
}
