/**
 * Deterministic service assignment for agencies
 * Uses a seeded hash based on agency slug for stable, varied service selection
 */

const SERVICE_POOL = [
  'Analytics',
  'Branding',
  'CRO',
  'Conversion Optimization',
  'Email Marketing',
  'Google Ads',
  'Lead Generation',
  'Local SEO',
  'Marketing Strategy',
  'PPC',
  'Paid Social',
  'Performance Marketing',
  'UX/UI Design',
  'Web Development',
];

/**
 * Simple hash function for deterministic but varied selection
 * Uses slug to ensure same agency always gets same services
 */
function simpleHash(str: string): number {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    const char = str.charCodeAt(i);
    hash = ((hash << 5) - hash) + char;
    hash = hash & hash; // Convert to 32bit integer
  }
  return Math.abs(hash);
}

/**
 * Generate deterministic services for an agency based on its slug
 * @param slug - Agency slug (used as seed for deterministic selection)
 * @param count - Number of services to select (4-5)
 * @returns Array of service names
 */
export function generateDeterministicServices(
  slug: string | undefined,
  count: number = 4
): string[] {
  if (!slug) {
    // Fallback if no slug: select first N services
    return SERVICE_POOL.slice(0, Math.max(4, Math.min(5, count)));
  }

  const hash = simpleHash(slug);

  // Use hash to select consistent starting point
  const startIndex = hash % SERVICE_POOL.length;

  // Determine how many services (4 or 5)
  const serviceCount = count === 5 ? 5 : (hash % 2 === 0 ? 4 : 5);

  const services: string[] = [];
  for (let i = 0; i < serviceCount; i++) {
    const index = (startIndex + i) % SERVICE_POOL.length;
    services.push(SERVICE_POOL[index]);
  }

  return services;
}

/**
 * Check if services need to be assigned (empty or minimal)
 * @param services - Existing services array
 * @returns true if services should be auto-assigned
 */
export function shouldAssignServices(services: string[] | null | undefined): boolean {
  if (!services) return true;
  if (Array.isArray(services) && services.length === 0) return true;
  if (Array.isArray(services) && services.length < 2) return true;
  return false;
}

/**
 * Try to extract service hints from agency data
 * Returns bias toward certain services based on keywords
 */
export function extractServiceHints(
  name: string,
  description: string | null | undefined
): string[] {
  const text = `${name} ${description || ''}`.toLowerCase();
  const hints: string[] = [];

  // Check for keyword signals
  if (
    text.includes('seo') ||
    text.includes('search') ||
    text.includes('organic')
  ) {
    hints.push('Local SEO', 'Performance Marketing');
  }

  if (
    text.includes('web') ||
    text.includes('design') ||
    text.includes('studio') ||
    text.includes('creative')
  ) {
    hints.push('Web Development', 'UX/UI Design', 'Branding');
  }

  if (
    text.includes('ads') ||
    text.includes('ppc') ||
    text.includes('google') ||
    text.includes('media')
  ) {
    hints.push('Google Ads', 'PPC', 'Paid Social');
  }

  if (text.includes('email') || text.includes('marketing automation')) {
    hints.push('Email Marketing');
  }

  if (text.includes('analytics') || text.includes('data')) {
    hints.push('Analytics');
  }

  // Remove duplicates
  return [...new Set(hints)];
}

/**
 * Main function to generate services for an agency
 * Combines deterministic selection with optional keyword hints
 * @param slug - Agency slug (required for deterministic behavior)
 * @param existingServices - Existing services (will be preserved if non-empty)
 * @param name - Agency name (for keyword extraction)
 * @param description - Agency description (for keyword extraction)
 * @returns Array of 4-5 service names
 */
export function assignServices(
  slug: string | undefined,
  existingServices: string[] | null | undefined,
  name: string,
  description: string | null | undefined
): string[] {
  // Preserve existing services if good
  if (existingServices && existingServices.length >= 2) {
    return existingServices;
  }

  // Start with keyword hints if available
  const hints = extractServiceHints(name, description);
  const services = hints.length > 0 ? hints : [];

  // Generate deterministic services
  const count = services.length < 2 ? 5 : 4; // 5 if no hints, 4 if some hints
  const baseServices = generateDeterministicServices(slug, count);

  // Merge: hints first, then fill with base services (avoiding duplicates)
  const result = [...services];
  for (const service of baseServices) {
    if (!result.includes(service) && result.length < 5) {
      result.push(service);
    }
  }

  // Ensure at least 4 services
  while (result.length < 4 && result.length < SERVICE_POOL.length) {
    for (const service of SERVICE_POOL) {
      if (!result.includes(service)) {
        result.push(service);
        if (result.length >= 4) break;
      }
    }
  }

  return result.slice(0, 5); // Max 5
}
