/**
 * Phone number parsing and normalization utility
 * Supports splitting multiple phones from one field and normalizing to international format
 */

/**
 * Split phone field by common separators
 * Supports: comma, semicolon, pipe, slash, newline
 */
export function splitPhoneField(phoneField: string | null | undefined): string[] {
  if (!phoneField) return [];

  const separators = /[,;|\n/]/;
  const parts = phoneField.split(separators);

  return parts
    .map((p) => p.trim())
    .filter((p) => p.length > 0);
}

/**
 * Normalize phone number to international format
 * Best effort US normalization first
 * If cannot normalize reliably, returns null
 */
export function normalizePhone(phoneRaw: string): string | null {
  if (!phoneRaw) return null;

  // Remove common formatting
  let cleaned = phoneRaw
    .replace(/[\s\-()\.]/g, '')
    .replace(/[x|ext\.?].*$/i, '') // Remove extension
    .trim();

  if (cleaned.length === 0) return null;

  // If starts with +, preserve it (international)
  if (cleaned.startsWith('+')) {
    // Extract only digits after +
    const digitsOnly = cleaned.substring(1).replace(/\D/g, '');
    if (digitsOnly.length >= 10) {
      return `+${digitsOnly}`;
    }
    return null;
  }

  // Extract only digits
  const digitsOnly = cleaned.replace(/\D/g, '');

  if (digitsOnly.length === 0) return null;

  // Handle US numbers
  // 10 digits = US format
  if (digitsOnly.length === 10) {
    return `+1${digitsOnly}`;
  }

  // 11 digits starting with 1 = US format with country code
  if (digitsOnly.length === 11 && digitsOnly.startsWith('1')) {
    return `+${digitsOnly}`;
  }

  // If 11+ digits and starts with country code pattern, keep as-is
  if (digitsOnly.length >= 11 && /^\d{1,3}\d{6,14}/.test(digitsOnly)) {
    return `+${digitsOnly}`;
  }

  // Cannot normalize reliably, return null
  return null;
}

/**
 * Dedupe phone numbers within a list
 * Uses normalized format if available, otherwise raw
 */
export function dedupePhones(
  phones: Array<{ raw: string; normalized: string | null }>
): Array<{ raw: string; normalized: string | null }> {
  const seen = new Set<string>();
  const result: Array<{ raw: string; normalized: string | null }> = [];

  for (const phone of phones) {
    const key = phone.normalized || phone.raw.toLowerCase();
    if (!seen.has(key)) {
      seen.add(key);
      result.push(phone);
    }
  }

  return result;
}

/**
 * Parse, normalize, and dedupe phone numbers from a field
 */
export function parseAndNormalizePhones(
  phoneField: string | null | undefined
): Array<{ raw: string; normalized: string | null; isPrimary: boolean }> {
  const split = splitPhoneField(phoneField);

  const parsed = split.map((raw) => ({
    raw: raw.trim(),
    normalized: normalizePhone(raw),
  }));

  const deduped = dedupePhones(parsed);

  // Mark first as primary
  return deduped.map((phone, idx) => ({
    ...phone,
    isPrimary: idx === 0 && split.length > 0,
  }));
}

/**
 * Get display value for phone
 * Prefers normalized, falls back to raw
 */
export function getPhoneDisplay(raw: string, normalized: string | null): string {
  return normalized || raw;
}
