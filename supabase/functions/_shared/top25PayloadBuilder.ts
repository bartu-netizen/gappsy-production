/**
 * Top 25 Slots Payload Builder
 *
 * Ensures only valid columns are written to top25_slots table.
 * Includes all content fields that are written on payment finalization.
 */

interface Top25SlotPayload {
  id?: string;
  state_slug?: string;
  rank?: number;
  is_paid?: boolean;
  is_available?: boolean;
  claimed_at?: string;
  created_at?: string;
  updated_at?: string;
  agency_id?: string;
  agency_name?: string;
  website?: string;
  description?: string;
  short_description?: string;
  services?: string[];
  logo_url?: string;
  slot_status?: string;
  billing_status?: string;
  sale_source?: string;
  status_updated_by?: string;
  status_updated_at?: string;
  status_reason?: string;
  purchased_at?: string;
  stripe_checkout_session_id?: string;
  stripe_subscription_id?: string;
  stripe_customer_id?: string;
  lock_started_at?: string;
  lock_expires_at?: string;
  last_billing_sync_at?: string;
  cancel_at_period_end?: boolean;
  claimed_by_entitlement_id?: string;
}

const ALLOWED_COLUMNS = new Set([
  'id', 'state_slug', 'rank', 'is_paid', 'is_available',
  'claimed_at', 'created_at', 'updated_at',
  'agency_id', 'agency_name', 'website', 'description', 'short_description',
  'services', 'logo_url',
  'slot_status', 'billing_status', 'sale_source',
  'status_updated_by', 'status_updated_at', 'status_reason',
  'purchased_at', 'stripe_checkout_session_id', 'stripe_subscription_id',
  'stripe_customer_id', 'lock_started_at', 'lock_expires_at',
  'last_billing_sync_at', 'cancel_at_period_end', 'claimed_by_entitlement_id',
]);

/**
 * Build a strict allowlist payload for top25_slots
 *
 * @param data - Input object that may contain extra fields
 * @param isDev - If true, logs warnings about unknown keys
 * @returns Clean payload with only allowed columns
 */
export function buildTop25SlotPayload(
  data: Record<string, unknown>,
  isDev: boolean = false
): Top25SlotPayload {
  const payload: Top25SlotPayload = {};
  const unknownKeys: string[] = [];

  for (const [key, value] of Object.entries(data)) {
    if (ALLOWED_COLUMNS.has(key)) {
      payload[key as keyof Top25SlotPayload] = value;
    } else if (value !== undefined && value !== null) {
      unknownKeys.push(key);
    }
  }

  // Log unknown keys in dev/admin mode
  if (isDev && unknownKeys.length > 0) {
    console.warn('[top25PayloadBuilder] Unknown keys filtered out:', {
      unknownKeys,
      allowedColumns: Array.from(ALLOWED_COLUMNS),
      inputKeys: Object.keys(data),
    });
  }

  return payload;
}

/**
 * Get list of allowed column names for validation
 */
export function getAllowedColumns(): string[] {
  return Array.from(ALLOWED_COLUMNS);
}

/**
 * Check if a key is allowed in top25_slots
 */
export function isAllowedColumn(key: string): boolean {
  return ALLOWED_COLUMNS.has(key);
}

/**
 * Find unknown columns in a payload (for logging/debugging)
 */
export function findUnknownColumns(data: Record<string, unknown>): string[] {
  return Object.keys(data).filter(key => !ALLOWED_COLUMNS.has(key));
}
