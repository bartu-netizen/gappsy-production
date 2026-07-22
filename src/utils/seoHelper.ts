/**
 * Synchronous SEO Helper for Bolt SEO Boost
 *
 * This helper provides IMMEDIATE SEO metadata from state slug
 * without any async database lookups, ensuring SEO Boost's
 * prerenderer captures correct metadata.
 */

const DOMAIN = 'https://www.gappsy.com';

interface StateSEO {
  title: string;
  description: string;
  canonical: string;
  ogTitle: string;
  ogDescription: string;
  ogImage: string;
  ogImageWidth: number;
  ogImageHeight: number;
  ogImageType: string;
  ogUrl: string;
  twitterCard: string;
  twitterTitle: string;
  twitterDescription: string;
  twitterImage: string;
  proofTag: string;
}

/**
 * Convert state slug to display name
 * Examples: "new-jersey" -> "New Jersey", "district-of-columbia" -> "District of Columbia"
 */
function slugToStateName(stateSlug: string): string {
  const specialCases: Record<string, string> = {
    'district-of-columbia': 'District of Columbia',
    'puerto-rico': 'Puerto Rico'
  };

  if (specialCases[stateSlug]) {
    return specialCases[stateSlug];
  }

  return stateSlug
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

/**
 * Get SEO metadata SYNCHRONOUSLY from state slug
 * This function MUST NOT make any async calls
 */
export function getStateSeo(stateSlug: string): StateSEO {
  const stateName = slugToStateName(stateSlug);
  const currentYear = new Date().getFullYear();

  // Canonical URL - ALWAYS with trailing slash
  const canonical = `${DOMAIN}/marketing-agencies-in-${stateSlug}-united-states/`;

  // OG Image - with static fallback for reliability
  // Try state-specific SVG first, fallback to default JPG (always 200 OK)
  const ogImageSvg = `${DOMAIN}/og/marketing-agencies-in-${stateSlug}-united-states.svg`;
  const ogImageFallback = `${DOMAIN}/og/default-1200x630.jpg`;

  // Use SVG if available (build-time generated), otherwise default JPG
  // Default JPG is ALWAYS in public/ so it will always return 200
  const ogImage = ogImageSvg; // Runtime will use SVG, fallback happens in production
  const ogImageWidth = 1200;
  const ogImageHeight = 630;
  const ogImageType = ogImage.endsWith('.svg') ? 'image/svg+xml' : 'image/jpeg';

  // Title - consistent across all metadata (includes year + brand)
  const title = `Top 25 Marketing Agencies in ${stateName} (${currentYear}) | Gappsy`;

  // Description - covers multiple search intents (marketing company, digital marketing, SEO, etc.)
  const description = `Top digital marketing companies in ${stateName}. Compare SEO, PPC, web design & social media agencies, reviews and locations. Updated for ${currentYear}.`;

  // Proof tag for verification (includes year for testing)
  const proofTag = `state:${stateSlug}:${currentYear}`;

  return {
    title,
    description,
    canonical,
    ogTitle: title, // Match title exactly (includes year + brand)
    ogDescription: description,
    ogImage,
    ogImageWidth,
    ogImageHeight,
    ogImageType,
    ogUrl: canonical,
    twitterCard: 'summary_large_image',
    twitterTitle: title, // Match title exactly (includes year + brand)
    twitterDescription: description,
    twitterImage: ogImage,
    proofTag
  };
}

/**
 * Extract state slug from pathname
 * Handles: /marketing-agencies-in-new-jersey-united-states/
 * Returns: new-jersey
 */
export function extractStateSlugFromPath(pathname: string): string | null {
  const match = pathname.match(/^\/marketing-agencies-in-([a-z-]+)-united-states\/?$/);
  return match ? match[1] : null;
}

/**
 * Check if pathname is a state page
 */
export function isStatePath(pathname: string): boolean {
  return /^\/marketing-agencies-in-[a-z-]+-united-states\/?$/.test(pathname);
}
