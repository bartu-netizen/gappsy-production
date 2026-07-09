/**
 * Slug Generation Utility
 * Generates clean, URL-safe slugs for agencies with consistent rules
 * Used for /your-agency/:slug URLs and Other Agencies management
 */

interface SlugGenerationOptions {
  appendState?: boolean;
  stateSlug?: string;
  stateName?: string;
}

/**
 * Generate a clean slug from agency name and optional state
 *
 * Rules:
 * - Lowercase
 * - Replace & with "and"
 * - Remove special characters (keep only alphanumeric and hyphens)
 * - Collapse repeated dashes
 * - Trim spaces
 * - Optionally append state slug for uniqueness and clarity
 *
 * Examples:
 * - "Calta Marketing" -> "calta-marketing"
 * - "Calta Marketing" + "new-york" -> "calta-marketing-new-york"
 * - "A & B Agency" -> "a-and-b-agency"
 * - "Smith, Inc." -> "smith-inc"
 */
export function generateAgencySlug(
  agencyName: string,
  options: SlugGenerationOptions = {}
): string {
  if (!agencyName || typeof agencyName !== 'string') {
    throw new Error('agencyName is required and must be a string');
  }

  let slug = agencyName.trim();

  // Replace & with "and"
  slug = slug.replace(/&/g, 'and');

  // Convert to lowercase
  slug = slug.toLowerCase();

  // Remove special characters (keep only alphanumeric, spaces, and hyphens)
  slug = slug.replace(/[^a-z0-9\s-]/g, '');

  // Replace spaces and underscores with hyphens
  slug = slug.replace(/[\s_]+/g, '-');

  // Collapse repeated dashes
  slug = slug.replace(/-{2,}/g, '-');

  // Trim hyphens from start and end
  slug = slug.replace(/^-+|-+$/g, '');

  // Append state for uniqueness and clarity
  if (options.appendState && options.stateSlug) {
    slug = `${slug}-${options.stateSlug}`;
  } else if (options.appendState && options.stateName) {
    // Convert state name to slug format
    const stateSlug = options.stateName
      .toLowerCase()
      .replace(/\s+/g, '-')
      .replace(/[^a-z0-9-]/g, '');
    slug = `${slug}-${stateSlug}`;
  }

  // Final cleanup
  slug = slug.replace(/-{2,}/g, '-').replace(/^-+|-+$/g, '');

  if (!slug) {
    throw new Error('Generated slug is empty. Agency name may contain only special characters.');
  }

  return slug;
}

/**
 * Generate a slug with numeric suffix for collision handling
 *
 * Used when:
 * - First attempt: "calta-marketing-new-york"
 * - Already exists: "calta-marketing-new-york-2"
 * - Exists again: "calta-marketing-new-york-3"
 */
export function generateUniqueSlug(
  baseSlug: string,
  existingSlugs: Set<string>,
  maxAttempts: number = 1000
): string {
  let slug = baseSlug;
  let attempt = 2;

  while (existingSlugs.has(slug) && attempt <= maxAttempts) {
    slug = `${baseSlug}-${attempt}`;
    attempt++;
  }

  if (existingSlugs.has(slug)) {
    throw new Error(
      `Could not generate unique slug after ${maxAttempts} attempts. Base: ${baseSlug}`
    );
  }

  return slug;
}

/**
 * Parse and normalize multiple emails from a single field
 *
 * Handles:
 * - Multiple delimiters: comma, semicolon, newline
 * - Whitespace trimming
 * - Basic validation (has @ symbol)
 * - Lowercase normalization
 * - Duplicate detection
 *
 * Returns: Array of normalized emails (lowercase, trimmed)
 */
export function parseAndNormalizeEmails(emailField: string | undefined): {
  emails: string[];
  invalid: string[];
} {
  if (!emailField) {
    return { emails: [], invalid: [] };
  }

  // Split on multiple delimiters
  const parts = emailField
    .split(/[,;\n]/)
    .map(e => e.trim())
    .filter(e => e.length > 0);

  const emails = new Set<string>();
  const invalid: string[] = [];

  for (const part of parts) {
    const normalized = part.toLowerCase().trim();

    // Basic email validation (must have @)
    if (!normalized.includes('@')) {
      invalid.push(part);
      continue;
    }

    // Check basic format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(normalized)) {
      invalid.push(part);
      continue;
    }

    emails.add(normalized);
  }

  return {
    emails: Array.from(emails),
    invalid,
  };
}

/**
 * Normalize a single email
 *
 * - Lowercase
 * - Trim whitespace
 * - No validation (assumes input is valid)
 */
export function normalizeEmail(email: string): string {
  return email.toLowerCase().trim();
}

/**
 * Check if a string is likely a valid email (basic check)
 * Used for filtering during import
 */
export function isLikelyEmail(value: string): boolean {
  const trimmed = value.trim();
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(trimmed.toLowerCase());
}
