/**
 * Global service list for auto-generating agency services
 */
const GLOBAL_SERVICES = [
  "Web Design",
  "SEO",
  "PPC",
  "Branding",
  "Social Media",
  "Email Marketing",
  "Content Marketing",
  "Digital Advertising",
  "E-Commerce",
  "Web Development",
  "CRO",
  "Analytics",
  "Packaging",
  "Traditional Advertising",
  "Conversion Optimization"
];

/**
 * Generates random services for an agency if they don't have enough
 * @param existingServices - Array of existing services (if any)
 * @param minServices - Minimum number of services to generate (default: 2)
 * @param maxServices - Maximum number of services to generate (default: 5)
 * @returns Array of services (existing + generated if needed)
 */
export function ensureAgencyServices(
  existingServices: string[] | undefined,
  minServices: number = 2,
  maxServices: number = 5
): string[] {
  // If agency already has enough services, return them as-is
  if (existingServices && existingServices.length >= minServices) {
    return existingServices;
  }

  // Start with existing services or empty array
  const services = existingServices ? [...existingServices] : [];

  // Determine how many services to add
  const currentCount = services.length;
  const targetCount = Math.floor(Math.random() * (maxServices - minServices + 1)) + minServices;
  const servicesToAdd = Math.max(0, targetCount - currentCount);

  // Create a pool of services not already included
  const availableServices = GLOBAL_SERVICES.filter(
    service => !services.includes(service)
  );

  // Shuffle the available services for randomness
  const shuffled = [...availableServices].sort(() => Math.random() - 0.5);

  // Add random services up to the target count
  for (let i = 0; i < servicesToAdd && i < shuffled.length; i++) {
    services.push(shuffled[i]);
  }

  return services;
}

/**
 * Validates that an agency has all required fields
 * @param agency - Agency object to validate
 * @returns Object with isValid flag and missing fields array
 */
export function validateAgency(agency: any): { isValid: boolean; missing: string[] } {
  // Only name and description are truly required for display
  // Website is optional - agencies without websites can still be listed
  const required = ['name', 'description'];
  const missing: string[] = [];

  for (const field of required) {
    if (!agency[field] || (typeof agency[field] === 'string' && agency[field].trim() === '')) {
      missing.push(field);
    }
  }

  return {
    isValid: missing.length === 0,
    missing
  };
}
