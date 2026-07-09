/*
  # Remove SECURITY DEFINER from Views - V3

  Recreate views without SECURITY DEFINER using correct column definitions
*/

-- Drop and recreate top25_slot_status_view without SECURITY DEFINER using original definition
DROP VIEW IF EXISTS public.top25_slot_status_view;

CREATE VIEW public.top25_slot_status_view AS
  SELECT 
    id,
    state_slug,
    rank,
    is_paid,
    is_available,
    slot_status,
    locked_by_admin,
    agency_name,
    website,
    logo_url,
    CASE
      WHEN rank = 1 THEN 'SOLD'::text
      WHEN is_paid = true THEN 'SOLD'::text
      WHEN (is_available = true AND slot_status = 'available'::text) THEN 'AVAILABLE'::text
      WHEN locked_by_admin = true THEN 'LOCKED'::text
      ELSE 'LOCKED'::text
    END AS canonical_status,
    created_at,
    updated_at
  FROM public.top25_slots;

-- Drop and recreate em_campaign_stats without SECURITY DEFINER
DROP VIEW IF EXISTS public.em_campaign_stats;

CREATE VIEW public.em_campaign_stats AS
  SELECT 
    c.id AS campaign_id,
    c.name,
    c.status,
    c.sent_count,
    c.total_recipients,
    c.created_at,
    c.started_at,
    c.completed_at,
    COALESCE(opens.unique_opens, 0) AS unique_opens,
    COALESCE(clicks.unique_clicks, 0) AS unique_clicks,
    COALESCE(bounces.bounce_count, 0) AS bounce_count,
    COALESCE(unsubs.unsub_count, 0) AS unsubscribe_count,
    CASE 
      WHEN c.sent_count > 0 
      THEN ROUND((COALESCE(opens.unique_opens, 0)::numeric / c.sent_count::numeric) * 100, 1)
      ELSE 0
    END AS open_rate_pct,
    CASE 
      WHEN c.sent_count > 0 
      THEN ROUND((COALESCE(clicks.unique_clicks, 0)::numeric / c.sent_count::numeric) * 100, 1)
      ELSE 0
    END AS ctr_pct,
    CASE 
      WHEN COALESCE(opens.unique_opens, 0) > 0 
      THEN ROUND((COALESCE(clicks.unique_clicks, 0)::numeric / opens.unique_opens::numeric) * 100, 1)
      ELSE 0
    END AS ctor_pct
  FROM public.em_campaigns c
  LEFT JOIN (
    SELECT campaign_id, COUNT(DISTINCT message_id) AS unique_opens
    FROM public.em_email_events
    WHERE event_type = 'open'
    GROUP BY campaign_id
  ) opens ON opens.campaign_id = c.id
  LEFT JOIN (
    SELECT campaign_id, COUNT(DISTINCT message_id) AS unique_clicks
    FROM public.em_email_events
    WHERE event_type = 'click'
    GROUP BY campaign_id
  ) clicks ON clicks.campaign_id = c.id
  LEFT JOIN (
    SELECT campaign_id, COUNT(*) AS bounce_count
    FROM public.em_email_events
    WHERE event_type = 'bounce'
    GROUP BY campaign_id
  ) bounces ON bounces.campaign_id = c.id
  LEFT JOIN (
    SELECT campaign_id, COUNT(DISTINCT message_id) AS unsub_count
    FROM public.em_email_events
    WHERE event_type = 'unsubscribe'
    GROUP BY campaign_id
  ) unsubs ON unsubs.campaign_id = c.id;
