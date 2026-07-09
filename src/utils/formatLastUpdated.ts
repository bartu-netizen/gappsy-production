/**
 * Formats a timestamp into "Month Year" format for Last Updated displays
 *
 * @param timestamp - ISO timestamp string or Date-like value from database
 * @returns Formatted string like "December 2025" or null if invalid
 *
 * @example
 * formatLastUpdated("2025-12-10T00:00:00Z") // "December 2025"
 * formatLastUpdated(null) // null
 * formatLastUpdated("invalid") // null
 */
export function formatLastUpdated(timestamp: string | Date | null | undefined): string | null {
  if (!timestamp) {
    return null;
  }

  try {
    const date = typeof timestamp === 'string' ? new Date(timestamp) : timestamp;

    // Validate date is valid
    if (isNaN(date.getTime())) {
      return null;
    }

    // Format as "Month Year" (e.g., "December 2025")
    return date.toLocaleDateString('en-US', {
      month: 'long',
      year: 'numeric'
    });
  } catch (error) {
    console.warn('Invalid timestamp for formatLastUpdated:', timestamp);
    return null;
  }
}

/**
 * Returns ISO timestamp string suitable for schema.org dateModified
 *
 * @param timestamp - ISO timestamp string or Date-like value from database
 * @returns ISO 8601 formatted string or null if invalid
 */
export function formatSchemaDate(timestamp: string | Date | null | undefined): string | null {
  if (!timestamp) {
    return null;
  }

  try {
    const date = typeof timestamp === 'string' ? new Date(timestamp) : timestamp;

    if (isNaN(date.getTime())) {
      return null;
    }

    return date.toISOString();
  } catch (error) {
    console.warn('Invalid timestamp for formatSchemaDate:', timestamp);
    return null;
  }
}
