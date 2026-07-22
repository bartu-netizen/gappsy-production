/**
 * Canonical URL Builder
 *
 * Builds deterministic canonical URLs for SEO.
 * Target format: https://www.gappsy.com/<path>/
 *
 * Rules:
 * - Always https://
 * - Always www.gappsy.com (primary domain)
 * - Always trailing slash at the end of the path
 * - Must match the final URL after redirects
 */

const CANONICAL_DOMAIN = 'https://www.gappsy.com';

/**
 * Build a canonical URL from a path
 * @param path - The path (with or without leading slash, with or without trailing slash)
 * @returns Canonical URL with www and trailing slash
 */
export function buildCanonicalUrl(path: string): string {
  // Remove any leading domain if present
  let cleanPath = path;
  if (path.startsWith('http://') || path.startsWith('https://')) {
    try {
      const url = new URL(path);
      cleanPath = url.pathname;
    } catch {
      // If URL parsing fails, treat as path
      cleanPath = path;
    }
  }

  // Ensure path starts with /
  if (!cleanPath.startsWith('/')) {
    cleanPath = '/' + cleanPath;
  }

  // Ensure path ends with / (but avoid double slashes)
  if (!cleanPath.endsWith('/')) {
    cleanPath = cleanPath + '/';
  }

  // Combine domain and path
  return `${CANONICAL_DOMAIN}${cleanPath}`;
}

/**
 * Build canonical URL for a state page
 * @param stateSlug - The state slug (e.g., "new-jersey")
 * @returns Canonical URL for the state page
 */
export function buildStateCanonicalUrl(stateSlug: string): string {
  return buildCanonicalUrl(`/marketing-agencies-in-${stateSlug}-united-states/`);
}
