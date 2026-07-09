import { supabase } from '../lib/supabase';

export interface StatePageInfo {
  stateSlug: string;
  stateName: string;
  canonicalUrl: string;
  fullCanonicalUrl: string;
  isActive: boolean;
}

export async function resolveStateByUrl(pathname: string): Promise<StatePageInfo | null> {
  console.log('[DB ROUTE] pathname:', pathname);

  const pathNoSlash = pathname.endsWith('/') ? pathname.slice(0, -1) : pathname;
  const pathWithSlash = pathNoSlash + '/';
  const variants = [pathname, pathNoSlash, pathWithSlash];

  console.log('[DB ROUTE] trying variants:', variants);

  const { data, error } = await supabase
    .from('state_pages')
    .select('*')
    .in('canonical_url', variants)
    .eq('is_active', true)
    .maybeSingle();

  if (error) {
    console.error('[DB ROUTE] ❌ Error resolving state by URL:', error);
    return null;
  }

  if (!data) {
    console.warn('[DB ROUTE] ❌ No state found for URL:', pathname, 'tried variants:', variants);
    return null;
  }

  console.log('[DB ROUTE] ✅ Resolved to state:', data.state_slug);

  return {
    stateSlug: data.state_slug,
    stateName: data.state_name,
    canonicalUrl: data.canonical_url,
    fullCanonicalUrl: data.full_canonical_url,
    isActive: data.is_active
  };
}

export async function getAllStateUrls(): Promise<string[]> {
  const { data, error } = await supabase
    .from('state_pages')
    .select('canonical_url')
    .eq('is_active', true);

  if (error) {
    console.error('[stateRouting] Error fetching state URLs:', error);
    return [];
  }

  return data?.map(row => row.canonical_url) || [];
}

export async function getStateBySlug(stateSlug: string): Promise<StatePageInfo | null> {
  const { data, error } = await supabase
    .from('state_pages')
    .select('*')
    .eq('state_slug', stateSlug)
    .eq('is_active', true)
    .maybeSingle();

  if (error) {
    console.error('[stateRouting] Error fetching state by slug:', error);
    return null;
  }

  if (!data) {
    return null;
  }

  return {
    stateSlug: data.state_slug,
    stateName: data.state_name,
    canonicalUrl: data.canonical_url,
    fullCanonicalUrl: data.full_canonical_url,
    isActive: data.is_active
  };
}
