/*
  # Drop Unused Indexes - Batch 3

  Remove remaining 38 unused indexes
*/

DROP INDEX IF EXISTS public.idx_agency_availability_requests_page_type;
DROP INDEX IF EXISTS public.idx_em_messages_status;
DROP INDEX IF EXISTS public.idx_em_messages_scheduled_for;
DROP INDEX IF EXISTS public.idx_em_messages_contact_id;
DROP INDEX IF EXISTS public.idx_em_messages_campaign_id;
DROP INDEX IF EXISTS public.idx_em_messages_created_at;
DROP INDEX IF EXISTS public.idx_agency_availability_requests_sentiment;
DROP INDEX IF EXISTS public.idx_act_agency_id;
DROP INDEX IF EXISTS public.idx_em_events_message_id;
DROP INDEX IF EXISTS public.idx_em_events_contact_id;
DROP INDEX IF EXISTS public.idx_em_events_event_type;
DROP INDEX IF EXISTS public.idx_em_events_created_at;
DROP INDEX IF EXISTS public.idx_em_suppression_email;
DROP INDEX IF EXISTS public.idx_em_funnel_events_contact_id;
DROP INDEX IF EXISTS public.idx_em_funnel_events_event_type;
DROP INDEX IF EXISTS public.idx_em_funnel_events_created_at;
DROP INDEX IF EXISTS public.idx_email_send_logs_created_at;
DROP INDEX IF EXISTS public.idx_email_send_logs_status;
DROP INDEX IF EXISTS public.idx_email_import_jobs_created_at;
DROP INDEX IF EXISTS public.idx_em_contacts_tags;
DROP INDEX IF EXISTS public.idx_em_events_msg_type;
DROP INDEX IF EXISTS public.idx_agency_availability_requests_state_demo;
DROP INDEX IF EXISTS public.em_contact_events_contact_time_idx;
DROP INDEX IF EXISTS public.em_contact_events_name_idx;
DROP INDEX IF EXISTS public.em_contact_tags_tag_idx;
DROP INDEX IF EXISTS public.idx_enl_type_created;
DROP INDEX IF EXISTS public.idx_enl_is_test;
DROP INDEX IF EXISTS public.idx_enl_status;
DROP INDEX IF EXISTS public.em_email_events_message_type_idx;
DROP INDEX IF EXISTS public.em_email_events_campaign_type_idx;
DROP INDEX IF EXISTS public.em_email_events_contact_idx;
DROP INDEX IF EXISTS public.em_automation_runs_automation_idx;
DROP INDEX IF EXISTS public.em_automation_runs_contact_idx;
DROP INDEX IF EXISTS public.em_automation_jobs_execute_idx;
DROP INDEX IF EXISTS public.em_automation_jobs_run_idx;
DROP INDEX IF EXISTS public.idx_slot_status_audit_state_rank;
DROP INDEX IF EXISTS public.idx_slot_status_audit_created;
DROP INDEX IF EXISTS public.idx_stripe_prices_stripe_price_id;
