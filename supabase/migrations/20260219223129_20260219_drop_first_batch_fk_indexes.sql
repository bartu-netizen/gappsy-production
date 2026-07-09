/*
  # Drop First Batch FK Indexes

  Remove FK indexes from first batch that are unused, as they may have been
  replaced with more efficient alternatives or the query patterns changed.
*/

DROP INDEX IF EXISTS public.idx_aar_agency_id_fk;
DROP INDEX IF EXISTS public.idx_agency_views_agency_id_fk;
DROP INDEX IF EXISTS public.idx_em_auto_enroll_contact_id_fk;
DROP INDEX IF EXISTS public.idx_em_campaigns_segment_id_fk;
DROP INDEX IF EXISTS public.idx_em_campaigns_template_id_fk;
DROP INDEX IF EXISTS public.idx_em_messages_automation_id_fk;
DROP INDEX IF EXISTS public.idx_em_messages_template_id_fk;
DROP INDEX IF EXISTS public.idx_spotlight_apps_reviewed_by_fk;
DROP INDEX IF EXISTS public.idx_top25_apps_reviewed_by_fk;
