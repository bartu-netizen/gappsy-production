/*
  # Drop Unused Indexes - Batch 1

  Remove 40 unused indexes that are no longer serving query optimization
*/

DROP INDEX IF EXISTS public.idx_em_funnel_events_message_id;
DROP INDEX IF EXISTS public.idx_em_contacts_unsubscribed_at;
DROP INDEX IF EXISTS public.idx_em_events_url;
DROP INDEX IF EXISTS public.idx_em_messages_error_code;
DROP INDEX IF EXISTS public.idx_matched_leads_email;
DROP INDEX IF EXISTS public.idx_email_notifications_log_form_type;
DROP INDEX IF EXISTS public.idx_email_notifications_log_row_id;
DROP INDEX IF EXISTS public.idx_email_notifications_log_status;
DROP INDEX IF EXISTS public.idx_email_notifications_log_created_at;
DROP INDEX IF EXISTS public.idx_agency_connection_confirms_agency_id;
DROP INDEX IF EXISTS public.idx_agency_connection_confirms_contact_email;
DROP INDEX IF EXISTS public.idx_agency_connection_confirms_created_at;
DROP INDEX IF EXISTS public.idx_matched_leads_state_created;
DROP INDEX IF EXISTS public.idx_agency_reviews_is_published;
DROP INDEX IF EXISTS public.idx_agency_reviews_uniqueness_score;
DROP INDEX IF EXISTS public.idx_agency_reviews_state_slug;
DROP INDEX IF EXISTS public.idx_agency_reviews_review_type;
DROP INDEX IF EXISTS public.idx_yafe_event_name;
DROP INDEX IF EXISTS public.idx_yafe_agency_id;
DROP INDEX IF EXISTS public.idx_yafe_created_at;
DROP INDEX IF EXISTS public.idx_agency_listings_state;
DROP INDEX IF EXISTS public.idx_agency_listings_tier;
DROP INDEX IF EXISTS public.idx_agency_email_preferences_email;
DROP INDEX IF EXISTS public.idx_agency_email_events_agency_id;
DROP INDEX IF EXISTS public.idx_agency_email_events_request_id;
DROP INDEX IF EXISTS public.idx_agency_email_events_event_type;
DROP INDEX IF EXISTS public.idx_agency_email_events_created_at;
DROP INDEX IF EXISTS public.idx_agency_email_events_status;
DROP INDEX IF EXISTS public.idx_agency_listings_name_gin;
DROP INDEX IF EXISTS public.idx_aar_agency_id_demo_created;
DROP INDEX IF EXISTS public.idx_availability_requests_routing_decision;
DROP INDEX IF EXISTS public.idx_availability_requests_email_status;
DROP INDEX IF EXISTS public.idx_availability_requests_target_agency;
DROP INDEX IF EXISTS public.idx_aar_agency_name_demo_created;
DROP INDEX IF EXISTS public.idx_aar_state_demo_created;
DROP INDEX IF EXISTS public.idx_agency_listings_domain;
DROP INDEX IF EXISTS public.idx_other_agencies_state_active;
DROP INDEX IF EXISTS public.idx_import_jobs_state;
DROP INDEX IF EXISTS public.idx_import_jobs_status;
DROP INDEX IF EXISTS public.idx_funnel_sessions_last_event;
