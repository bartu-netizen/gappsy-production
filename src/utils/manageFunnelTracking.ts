import { reliablePost } from './trackingTransport';

export type ManageListingType = 'top25' | 'other' | 'free' | null;

export function normalizeManageListingType(
  raw: string | null | undefined
): ManageListingType {
  if (!raw) return null;
  const lower = raw.toLowerCase();
  if (lower === 'top25') return 'top25';
  if (lower === 'other_agency' || lower === 'other') return 'other';
  if (lower === 'free') return 'free';
  return null;
}

export type ManageFunnelEventType =
  | 'manage_funnel_opened'
  | 'manage_remove_started'
  | 'manage_recovered'
  | 'manage_remove_confirmed';

export interface ManageFunnelEventParams {
  event_type: ManageFunnelEventType;
  agency_id: string;
  agency_slug: string | null;
  agency_name: string;
  state_slug: string | null;
  token: string | null;
  lead_key?: string | null;
  source?: 'smartlead' | 'direct' | 'unknown';
  listing_type?: 'top25' | 'other' | 'free' | null;
  engaged_leads_count?: number;
  total_interactions?: number;
  engagement_hint?: string | null;
  recovery_type?: 'keep_visible' | 'activate';
  entry_reason?: 'not_interested' | 'remove_me' | 'unsubscribe' | 'unknown';
  metadata?: Record<string, unknown>;
}

export interface ManageFunnelTrackResult {
  ok: boolean;
  eventId?: string;
  notificationSent?: boolean;
  emailStatus?: string;
  notificationLogStatus?: string;
  emailNotificationLogStatus?: string;
  reason?: string;
  stage?: string;
  error?: string;
  details?: unknown;
  code?: string;
  hint?: string;
  emailNotificationLogId?: string;
  manageNotificationLogId?: string;
  settingsFound?: boolean;
  settingsEnabled?: boolean;
  recipientsAttempted?: string[];
  recipientSource?: string;
  queued?: boolean;
}

/**
 * Track a manage funnel event and trigger admin email notifications.
 *
 * Uses reliablePost() so every event is automatically enriched with:
 *   intent_level, confidence_score, scanner_signals, human_signals,
 *   timing_signals, confidence_reasoning
 * This ensures manage-funnel-track participates in the same scanner/human
 * confidence gating as all other funnel trackers.
 */
export async function trackManageFunnelEvent(
  params: ManageFunnelEventParams,
): Promise<ManageFunnelTrackResult> {
  const payload: Record<string, unknown> = {
    event_type: params.event_type,
    agency_id: params.agency_id,
    agency_slug: params.agency_slug,
    agency_name: params.agency_name,
    state_slug: params.state_slug,
    token: params.token,
    lead_key: params.lead_key ?? null,
    source: params.source ?? 'unknown',
    listing_type: params.listing_type ?? null,
    engaged_leads_count: params.engaged_leads_count ?? 0,
    total_interactions: params.total_interactions ?? 0,
    engagement_hint: params.engagement_hint ?? null,
    recovery_type: params.recovery_type ?? null,
    entry_reason: params.entry_reason ?? null,
    flow: 'manage',
    page_path: typeof window !== 'undefined' ? window.location.pathname : undefined,
    referrer: typeof document !== 'undefined' ? document.referrer || undefined : undefined,
    metadata: params.metadata ?? {},
  };

  console.log(
    `[manageFunnelTracking] Sending ${params.event_type} for agency ${params.agency_id}`,
    { source: params.source ?? 'unknown', lead_key: params.lead_key ?? null },
  );

  reliablePost('manage-funnel-track', payload, params.event_type);

  return { ok: true };
}

export const MANAGE_FUNNEL_EVENTS = {
  OPENED: 'manage_funnel_opened' as const,
  REMOVE_STARTED: 'manage_remove_started' as const,
  RECOVERED: 'manage_recovered' as const,
  REMOVE_CONFIRMED: 'manage_remove_confirmed' as const,
} as const;
