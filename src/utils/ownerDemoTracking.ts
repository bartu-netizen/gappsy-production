import { supabase } from '../lib/supabase';

export type DemoEventName = 'demo_opened' | 'demo_submitted' | 'demo_completed';

export interface DemoEventPayload {
  agencyId?: string | null;
  stateSlug?: string;
  agencyName?: string;
  service?: string;
  budget?: string;
  timeline?: string;
  mode?: string;
  openInstanceId?: string;
}

export async function logOwnerDemoEvent(
  eventName: DemoEventName,
  payload: DemoEventPayload = {}
): Promise<void> {
  try {
    const { agencyId, stateSlug, agencyName, service, budget, timeline, mode, openInstanceId } = payload;

    const currentUser = (await supabase.auth.getUser()).data.user;

    const metadata: Record<string, string> = {};
    if (service) metadata.service = service;
    if (budget) metadata.budget = budget;
    if (timeline) metadata.timeline = timeline;
    if (mode) metadata.mode = mode;
    if (openInstanceId) metadata.open_instance_id = openInstanceId;

    if (openInstanceId) {
      const { data: existing } = await supabase
        .from('owner_demo_events')
        .select('id')
        .eq('event_name', eventName)
        .filter('metadata->>open_instance_id', 'eq', openInstanceId)
        .maybeSingle();

      if (existing) return;
    } else {
      const windowStart = new Date(Date.now() - 30_000).toISOString();
      const { data: existing } = await supabase
        .from('owner_demo_events')
        .select('id')
        .eq('event_name', eventName)
        .eq('agency_id', agencyId || '')
        .eq('owner_user_id', currentUser?.id || '')
        .gte('created_at', windowStart)
        .maybeSingle();

      if (existing) return;
    }

    const eventData = {
      event_name: eventName,
      agency_id: agencyId || null,
      state_slug: stateSlug || null,
      agency_name: agencyName || null,
      source_page: window.location.pathname,
      owner_user_id: currentUser?.id || null,
      metadata: Object.keys(metadata).length > 0 ? metadata : null,
    };

    const { error } = await supabase
      .from('owner_demo_events')
      .insert(eventData);

    if (error) {
      console.warn('[Demo Tracking] Failed to log event:', eventName, error);
    }
  } catch (err) {
    console.warn('[Demo Tracking] Error logging event:', eventName, err);
  }
}
