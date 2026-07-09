/*
  # Drop Unused Indexes - Batch 2

  Remove 40 more unused indexes
*/

DROP INDEX IF EXISTS public.idx_owner_demo_events_owner_user_id;
DROP INDEX IF EXISTS public.idx_funnel_sessions_visitor;
DROP INDEX IF EXISTS public.idx_funnel_sessions_checkout;
DROP INDEX IF EXISTS public.idx_funnel_events_session;
DROP INDEX IF EXISTS public.idx_funnel_events_email;
DROP INDEX IF EXISTS public.idx_funnel_events_visitor;
DROP INDEX IF EXISTS public.idx_order_items_session;
DROP INDEX IF EXISTS public.idx_order_items_pi;
DROP INDEX IF EXISTS public.idx_order_items_customer;
DROP INDEX IF EXISTS public.idx_invoices_customer;
DROP INDEX IF EXISTS public.idx_invoices_pi;
DROP INDEX IF EXISTS public.idx_invoices_status;
DROP INDEX IF EXISTS public.idx_events_raw_type;
DROP INDEX IF EXISTS public.idx_events_raw_created;
DROP INDEX IF EXISTS public.idx_em_contacts_source_type;
DROP INDEX IF EXISTS public.idx_stripe_orders_status;
DROP INDEX IF EXISTS public.idx_stripe_orders_created;
DROP INDEX IF EXISTS public.idx_stripe_orders_customer;
DROP INDEX IF EXISTS public.idx_stripe_orders_state;
DROP INDEX IF EXISTS public.idx_em_contacts_lead_status;
DROP INDEX IF EXISTS public.idx_admin_audit_log_action;
DROP INDEX IF EXISTS public.idx_admin_audit_log_state_slug;
DROP INDEX IF EXISTS public.idx_admin_audit_log_status;
DROP INDEX IF EXISTS public.idx_em_contacts_payment_status;
DROP INDEX IF EXISTS public.idx_em_contacts_last_action_at;
DROP INDEX IF EXISTS public.idx_em_contacts_created_at;
DROP INDEX IF EXISTS public.idx_em_contacts_state_name;
DROP INDEX IF EXISTS public.idx_import_job_rows_job;
DROP INDEX IF EXISTS public.idx_em_segments_name;
DROP INDEX IF EXISTS public.idx_em_templates_name;
DROP INDEX IF EXISTS public.idx_em_template_versions_template_id;
DROP INDEX IF EXISTS public.idx_ali_agency_slug;
DROP INDEX IF EXISTS public.idx_em_campaigns_status;
DROP INDEX IF EXISTS public.idx_em_campaigns_created_at;
DROP INDEX IF EXISTS public.idx_em_automations_status;
DROP INDEX IF EXISTS public.idx_agency_reviews_published;
DROP INDEX IF EXISTS public.idx_agency_reviews_score;
DROP INDEX IF EXISTS public.idx_em_enrollments_automation_id;
DROP INDEX IF EXISTS public.idx_em_enrollments_status;
DROP INDEX IF EXISTS public.idx_em_enrollments_next_step_at;
