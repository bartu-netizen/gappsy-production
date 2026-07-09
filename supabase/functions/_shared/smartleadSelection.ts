/**
 * Shared deterministic one-per-agency email selection logic.
 * Used by both smartlead-export-eligible-contacts and smartlead-sync-eligible-contacts
 * to ensure preview/export and real sync select the exact same email per agency.
 *
 * CRITICAL: one_per_agency now dedupes by REAL IDENTITY KEY, not just agency_id.
 * This ensures that if the same real company exists across multiple agency rows,
 * only ONE email total is selected for that real company.
 *
 * Identity key priority:
 * 1. global_identity_key (if set)
 * 2. agency_dedupe_key (if set)
 * 3. website_domain_normalized (if trustworthy)
 * 4. agency_id (fallback)
 *
 * Email selection priority within each identity group:
 * 1. is_primary = true
 * 2. Non-role-based email preferred over role-based
 * 3. Latest validation_checked_at
 * 4. Earliest created_at
 * 5. Stable id fallback (lexicographic)
 */

export const ROLE_EMAIL_PREFIXES = [
  "info@",
  "support@",
  "sales@",
  "hello@",
  "contact@",
  "team@",
  "noreply@",
  "no-reply@",
  "abuse@",
  "admin@",
  "postmaster@",
  "webmaster@",
  "billing@",
  "accounts@",
  "jobs@",
  "careers@",
  "hr@",
  "press@",
  "media@",
  "marketing@",
  "enquiries@",
  "enquiry@",
  "customerservice@",
  "customercare@",
  "care@",
  "office@",
  "reception@",
  "general@",
  "mail@",
];

export function isRoleBasedEmail(email: string): boolean {
  const lower = email.toLowerCase();
  return ROLE_EMAIL_PREFIXES.some((prefix) => lower.startsWith(prefix));
}

export interface EmailRowForSelection {
  id: string;
  email_normalized: string;
  agency_id: string;
  is_primary?: boolean | null;
  validation_checked_at?: string | null;
  created_at?: string | null;
  // Identity fields for real-company deduplication
  global_identity_key?: string | null;
  agency_dedupe_key?: string | null;
  website_domain_normalized?: string | null;
  // Domain match fields for filtering
  email_domain?: string | null;
  domain_match_status?: string | null;
  is_identity_contaminated?: boolean | null;
}

/**
 * Compute the real identity key for an email row.
 * This key represents the ACTUAL company identity, not just the agency row.
 * Multiple agency rows with the same identity key are treated as ONE company.
 */
export function getIdentityKey(row: EmailRowForSelection): string {
  // Priority 1: Explicit global identity key
  if (row.global_identity_key && row.global_identity_key.trim()) {
    return `gik:${row.global_identity_key.trim().toLowerCase()}`;
  }
  // Priority 2: Agency dedupe key
  if (row.agency_dedupe_key && row.agency_dedupe_key.trim()) {
    return `adk:${row.agency_dedupe_key.trim().toLowerCase()}`;
  }
  // Priority 3: Normalized website domain (if trustworthy - not a junk/platform URL)
  if (row.website_domain_normalized && row.website_domain_normalized.trim()) {
    const domain = row.website_domain_normalized.trim().toLowerCase();
    // Skip platform/junk domains that don't represent real company identity
    const junkDomains = [
      'wix.com', 'weebly.com', 'squarespace.com', 'wordpress.com',
      'godaddy.com', 'ueniweb.com', 'wixsite.com'
    ];
    if (!junkDomains.some(junk => domain.includes(junk))) {
      return `dom:${domain}`;
    }
  }
  // Fallback: agency_id (no cross-row deduplication)
  return `aid:${row.agency_id}`;
}

/**
 * Check if an email row should be excluded from Smartlead export.
 * Returns exclusion reason or null if eligible.
 */
export function getExclusionReason(row: EmailRowForSelection): string | null {
  if (row.is_identity_contaminated === true) {
    return 'identity_contaminated';
  }
  if (row.domain_match_status === 'different_business_domain') {
    return 'domain_mismatch';
  }
  return null;
}

/**
 * Compare two email rows for priority selection.
 * Returns positive if `a` should replace `b` (a is higher priority).
 */
export function compareEmailPriority(
  a: EmailRowForSelection,
  b: EmailRowForSelection
): number {
  // 1. is_primary = true wins
  const aPrimary = a.is_primary === true;
  const bPrimary = b.is_primary === true;
  if (aPrimary && !bPrimary) return 1;
  if (!aPrimary && bPrimary) return -1;

  // 2. Non-role email wins
  const aIsRole = isRoleBasedEmail(a.email_normalized);
  const bIsRole = isRoleBasedEmail(b.email_normalized);
  if (!aIsRole && bIsRole) return 1;
  if (aIsRole && !bIsRole) return -1;

  // 3. Most recent validation_checked_at wins
  if (a.validation_checked_at && b.validation_checked_at) {
    const aTime = new Date(a.validation_checked_at).getTime();
    const bTime = new Date(b.validation_checked_at).getTime();
    if (aTime !== bTime) return aTime > bTime ? 1 : -1;
  } else if (a.validation_checked_at && !b.validation_checked_at) {
    return 1;
  } else if (!a.validation_checked_at && b.validation_checked_at) {
    return -1;
  }

  // 4. Earliest created_at wins
  if (a.created_at && b.created_at) {
    const aTime = new Date(a.created_at).getTime();
    const bTime = new Date(b.created_at).getTime();
    if (aTime !== bTime) return aTime < bTime ? 1 : -1;
  }

  // 5. Stable id fallback (lexicographic ascending)
  return a.id < b.id ? 1 : a.id > b.id ? -1 : 0;
}

/**
 * From a list of eligible email rows, select exactly one per REAL COMPANY IDENTITY
 * using deterministic priority rules.
 *
 * CRITICAL: This now uses identity keys, not just agency_id.
 * If two agency rows represent the same real company, only ONE email is selected.
 */
export function selectOnePerAgency<T extends EmailRowForSelection>(
  emails: T[]
): T[] {
  const identityMap = new Map<string, T>();

  for (const email of emails) {
    // Use identity key for deduplication, not just agency_id
    const identityKey = getIdentityKey(email);
    const existing = identityMap.get(identityKey);
    if (!existing) {
      identityMap.set(identityKey, email);
    } else {
      if (compareEmailPriority(email, existing) > 0) {
        identityMap.set(identityKey, email);
      }
    }
  }

  return Array.from(identityMap.values());
}

/**
 * Legacy function that dedupes by agency_id only (for backwards compatibility).
 * Use selectOnePerAgency for proper identity-based deduplication.
 */
export function selectOnePerAgencyId<T extends EmailRowForSelection>(
  emails: T[]
): T[] {
  const agencyMap = new Map<string, T>();

  for (const email of emails) {
    const existing = agencyMap.get(email.agency_id);
    if (!existing) {
      agencyMap.set(email.agency_id, email);
    } else {
      if (compareEmailPriority(email, existing) > 0) {
        agencyMap.set(email.agency_id, email);
      }
    }
  }

  return Array.from(agencyMap.values());
}
