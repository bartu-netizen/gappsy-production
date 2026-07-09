import { useState, useEffect, useRef } from 'react';
import { findState, type USState } from '../lib/usStates';
import { getAgencyListings, type GetAgencyListingsResult } from '../lib/yourAgencyApi';

export interface AgencyFunnelContext {
  agencyId: string;
  agencySlug: string;
  agencyName: string;
  agencyDomain: string | null;
  stateSlug: string;
  stateName: string;
  stateAbbr: string;
  listingType: 'top25' | 'other' | null;
  rank: number | null;
  resolved: true;
}

export interface AgencyContextResult {
  ctx: AgencyFunnelContext | null;
  loading: boolean;
  error: boolean;
}

const contextCache = new Map<string, { data: AgencyFunnelContext; ts: number }>();
const CONTEXT_CACHE_TTL = 120_000;

function resolveStateFromSlug(stateSlug: string): USState | null {
  if (!stateSlug) return null;
  return findState(stateSlug);
}

function buildContextFromResult(
  result: GetAgencyListingsResult,
  urlSlug: string,
): AgencyFunnelContext {
  const agency = result.agency;
  const canonicalListing =
    result.listings.find(l => l.section === 'top25') ??
    result.listings[0] ??
    null;

  const rawStateSlug = canonicalListing?.state_slug ?? '';
  const stateInfo = resolveStateFromSlug(rawStateSlug);

  return {
    agencyId: agency.id,
    agencySlug: agency.slug || urlSlug,
    agencyName: agency.name,
    agencyDomain: agency.domain,
    stateSlug: stateInfo?.slug ?? rawStateSlug,
    stateName: stateInfo?.name ?? '',
    stateAbbr: stateInfo?.abbr ?? '',
    listingType: canonicalListing?.section ?? null,
    rank: canonicalListing?.rank ?? null,
    resolved: true,
  };
}

export function useAgencyContext(
  agencySlug: string | undefined,
  searchParamHints?: {
    agencyName?: string | null;
    stateSlug?: string | null;
    stateName?: string | null;
  },
): AgencyContextResult {
  const slug = agencySlug || '';
  const [ctx, setCtx] = useState<AgencyFunnelContext | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const fetchedSlug = useRef('');

  useEffect(() => {
    if (!slug) {
      setLoading(false);
      setError(true);
      return;
    }

    if (fetchedSlug.current === slug && ctx) return;

    const cached = contextCache.get(slug);
    if (cached && Date.now() - cached.ts < CONTEXT_CACHE_TTL) {
      setCtx(cached.data);
      setLoading(false);
      setError(false);
      fetchedSlug.current = slug;
      return;
    }

    let cancelled = false;
    setLoading(true);
    setError(false);

    getAgencyListings({ agency_slug: slug })
      .then(result => {
        if (cancelled) return;

        if (result) {
          const resolved = buildContextFromResult(result, slug);
          contextCache.set(slug, { data: resolved, ts: Date.now() });
          setCtx(resolved);
          fetchedSlug.current = slug;
          setLoading(false);
        } else {
          const fallback = buildFallbackContext(slug, searchParamHints);
          setCtx(fallback);
          fetchedSlug.current = slug;
          setLoading(false);
        }
      })
      .catch(() => {
        if (cancelled) return;
        const fallback = buildFallbackContext(slug, searchParamHints);
        setCtx(fallback);
        setLoading(false);
      });

    return () => { cancelled = true; };
  }, [slug]);

  return { ctx, loading, error };
}

function buildFallbackContext(
  slug: string,
  hints?: {
    agencyName?: string | null;
    stateSlug?: string | null;
    stateName?: string | null;
  },
): AgencyFunnelContext {
  const rawState = hints?.stateSlug || '';
  const stateInfo = resolveStateFromSlug(rawState);

  return {
    agencyId: '',
    agencySlug: slug,
    agencyName: hints?.agencyName || formatSlugAsName(slug),
    agencyDomain: null,
    stateSlug: stateInfo?.slug ?? rawState,
    stateName: stateInfo?.name ?? (hints?.stateName || ''),
    stateAbbr: stateInfo?.abbr ?? '',
    listingType: null,
    rank: null,
    resolved: true,
  };
}

function formatSlugAsName(slug: string): string {
  return slug
    .split('-')
    .map(w => w.charAt(0).toUpperCase() + w.slice(1))
    .join(' ');
}

export function getValidatedStateName(stateSlug: string): string {
  const state = findState(stateSlug);
  return state?.name ?? '';
}

export function getValidatedStateAbbr(stateSlug: string): string {
  const state = findState(stateSlug);
  return state?.abbr ?? '';
}
