/*
  # Admin Manage Funnel Summary Function

  ## Overview
  Creates a SECURITY DEFINER function for the admin removals dashboard.
  Aggregates manage_funnel_events per agency with listing status, primary email,
  and computed outcome labels.

  ## New Function
  - `admin_get_manage_funnel_rows` — Aggregated manage funnel data per agency
    - Joins: manage_funnel_events + other_agencies + other_agency_emails
    - Computed outcome: removed / recovered / remove_intent / opened
    - Supports filters: state, outcome, search, date range
    - Supports pagination: limit / offset
    - Default sort: newest last event first

  ## Security
  - SECURITY DEFINER so it bypasses RLS (admin-only, called from service_role edge function)
  - No public exposure — called only from manage-removals-admin edge function
*/

CREATE OR REPLACE FUNCTION admin_get_manage_funnel_rows(
  p_state      text        DEFAULT NULL,
  p_outcome    text        DEFAULT NULL,
  p_search     text        DEFAULT NULL,
  p_date_from  timestamptz DEFAULT NULL,
  p_date_to    timestamptz DEFAULT NULL,
  p_limit      int         DEFAULT 100,
  p_offset     int         DEFAULT 0
)
RETURNS TABLE (
  agency_id                    text,
  agency_name                  text,
  agency_slug                  text,
  state_slug                   text,
  primary_email                text,
  listing_management_status    text,
  is_active                    boolean,
  agency_created_at            timestamptz,
  manage_event_count           bigint,
  manage_opened_count          bigint,
  manage_remove_started_count  bigint,
  manage_recovered_count       bigint,
  manage_remove_confirmed_count bigint,
  last_manage_event_type       text,
  last_manage_event_at         timestamptz,
  first_manage_opened_at       timestamptz,
  last_manage_recovery_type    text,
  manage_current_outcome       text,
  manage_listing_url           text
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  RETURN QUERY
  WITH mfe_agg AS (
    SELECT
      mfe.agency_id                                                                            AS agg_agency_id,
      COUNT(*)                                                                                 AS evt_count,
      MAX(mfe.created_at)                                                                      AS last_evt_at,
      MIN(mfe.created_at) FILTER (WHERE mfe.event_type = 'manage_funnel_opened')              AS first_opened_at,
      COUNT(*) FILTER (WHERE mfe.event_type = 'manage_funnel_opened')                        AS opened_cnt,
      COUNT(*) FILTER (WHERE mfe.event_type = 'manage_remove_started')                       AS remove_started_cnt,
      COUNT(*) FILTER (WHERE mfe.event_type = 'manage_recovered')                            AS recovered_cnt,
      COUNT(*) FILTER (WHERE mfe.event_type = 'manage_remove_confirmed')                     AS remove_confirmed_cnt,
      (array_agg(mfe.event_type ORDER BY mfe.created_at DESC))[1]                            AS last_evt_type,
      (array_agg(mfe.recovery_type ORDER BY mfe.created_at DESC)
        FILTER (WHERE mfe.recovery_type IS NOT NULL))[1]                                      AS last_recovery_type,
      (array_agg(mfe.token ORDER BY mfe.created_at DESC)
        FILTER (WHERE mfe.token IS NOT NULL))[1]                                              AS last_token,
      (array_agg(mfe.agency_slug ORDER BY mfe.created_at DESC)
        FILTER (WHERE mfe.agency_slug IS NOT NULL))[1]                                        AS last_aslug,
      (array_agg(mfe.state_slug ORDER BY mfe.created_at DESC)
        FILTER (WHERE mfe.state_slug IS NOT NULL))[1]                                         AS last_state
    FROM manage_funnel_events mfe
    WHERE (p_date_from IS NULL OR mfe.created_at >= p_date_from)
      AND (p_date_to   IS NULL OR mfe.created_at <= p_date_to)
    GROUP BY mfe.agency_id
  ),
  primary_emails AS (
    SELECT DISTINCT ON (oae.agency_id::text)
      oae.agency_id::text  AS pe_agency_id,
      oae.email_normalized AS pe_email
    FROM other_agency_emails oae
    WHERE oae.is_primary = TRUE
    ORDER BY oae.agency_id::text, oae.created_at ASC
  ),
  combined AS (
    SELECT
      agg.agg_agency_id,
      COALESCE(oa.name,         agg.agg_agency_id)             AS c_name,
      COALESCE(oa.slug,         agg.last_aslug, '')             AS c_slug,
      COALESCE(oa.state_slug,   agg.last_state, '')             AS c_state,
      COALESCE(pe.pe_email,     '')                              AS c_email,
      COALESCE(oa.listing_management_status, '')                 AS c_mgmt_status,
      COALESCE(oa.is_active,    TRUE)                            AS c_is_active,
      oa.created_at                                              AS c_created_at,
      agg.evt_count,
      agg.opened_cnt,
      agg.remove_started_cnt,
      agg.recovered_cnt,
      agg.remove_confirmed_cnt,
      agg.last_evt_type,
      agg.last_evt_at,
      agg.first_opened_at,
      agg.last_recovery_type,
      CASE
        WHEN agg.remove_confirmed_cnt > 0                            THEN 'removed'
        WHEN agg.recovered_cnt        > 0                            THEN 'recovered'
        WHEN agg.remove_started_cnt   > 0                            THEN 'remove_intent'
        WHEN agg.opened_cnt           > 0                            THEN 'opened'
        ELSE 'unknown'
      END                                                            AS c_outcome,
      CASE
        WHEN agg.last_token IS NOT NULL AND agg.last_aslug IS NOT NULL
          THEN 'https://www.gappsy.com/manage-listing/' || agg.last_aslug || '?c=' || agg.last_token
        ELSE NULL
      END                                                            AS c_url
    FROM mfe_agg agg
    LEFT JOIN other_agencies oa ON oa.id::text = agg.agg_agency_id
    LEFT JOIN primary_emails  pe ON pe.pe_agency_id = agg.agg_agency_id
  )
  SELECT
    c.agg_agency_id,
    c.c_name,
    c.c_slug,
    c.c_state,
    c.c_email,
    c.c_mgmt_status,
    c.c_is_active,
    c.c_created_at,
    c.evt_count,
    c.opened_cnt,
    c.remove_started_cnt,
    c.recovered_cnt,
    c.remove_confirmed_cnt,
    c.last_evt_type,
    c.last_evt_at,
    c.first_opened_at,
    c.last_recovery_type,
    c.c_outcome,
    c.c_url
  FROM combined c
  WHERE
    (p_state   IS NULL OR p_state   = '' OR c.c_state ILIKE p_state)
    AND (
      p_outcome IS NULL OR p_outcome = ''
      OR c.c_outcome = p_outcome
      OR (p_outcome = 'hidden_self_removed'
          AND (c.c_outcome = 'removed' OR c.c_mgmt_status = 'removal_pending'))
    )
    AND (
      p_search IS NULL OR p_search = ''
      OR c.c_name     ILIKE '%' || p_search || '%'
      OR c.c_slug     ILIKE '%' || p_search || '%'
      OR c.c_email    ILIKE '%' || p_search || '%'
      OR c.agg_agency_id ILIKE '%' || p_search || '%'
    )
  ORDER BY c.last_evt_at DESC NULLS LAST
  LIMIT  GREATEST(1, LEAST(p_limit, 500))
  OFFSET GREATEST(0, p_offset);
END;
$$;
