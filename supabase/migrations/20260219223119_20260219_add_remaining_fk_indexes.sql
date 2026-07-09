/*
  # Add Remaining Missing Foreign Key Indexes

  Add covering indexes for 11 remaining unindexed foreign keys to improve
  JOIN performance and prevent N+1 query problems.
*/

-- em_contact_tags.tag_id
CREATE INDEX IF NOT EXISTS idx_em_contact_tags_tag_id_fk 
  ON public.em_contact_tags(tag_id);

-- em_events.contact_id
CREATE INDEX IF NOT EXISTS idx_em_events_contact_id_fk 
  ON public.em_events(contact_id);

-- em_events.message_id
CREATE INDEX IF NOT EXISTS idx_em_events_message_id_fk 
  ON public.em_events(message_id) 
  WHERE message_id IS NOT NULL;

-- em_funnel_events.contact_id
CREATE INDEX IF NOT EXISTS idx_em_funnel_events_contact_id_fk 
  ON public.em_funnel_events(contact_id);

-- em_funnel_events.message_id
CREATE INDEX IF NOT EXISTS idx_em_funnel_events_message_id_fk 
  ON public.em_funnel_events(message_id) 
  WHERE message_id IS NOT NULL;

-- em_messages.campaign_id
CREATE INDEX IF NOT EXISTS idx_em_messages_campaign_id_fk 
  ON public.em_messages(campaign_id) 
  WHERE campaign_id IS NOT NULL;

-- em_messages.contact_id
CREATE INDEX IF NOT EXISTS idx_em_messages_contact_id_fk 
  ON public.em_messages(contact_id);

-- em_template_versions.template_id
CREATE INDEX IF NOT EXISTS idx_em_template_versions_template_id_fk 
  ON public.em_template_versions(template_id);

-- funnel_events.session_id
CREATE INDEX IF NOT EXISTS idx_funnel_events_session_id_fk 
  ON public.funnel_events(session_id);

-- other_agency_import_job_rows.job_id
CREATE INDEX IF NOT EXISTS idx_oaijr_job_id_fk 
  ON public.other_agency_import_job_rows(job_id);

-- owner_demo_events.owner_user_id
CREATE INDEX IF NOT EXISTS idx_owner_demo_events_owner_user_id_fk 
  ON public.owner_demo_events(owner_user_id);
