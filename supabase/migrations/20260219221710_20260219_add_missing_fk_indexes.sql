/*
  # Add Missing Foreign Key Indexes

  Add covering indexes for 9 unindexed foreign keys to improve JOIN performance
  and prevent N+1 query problems.
*/

-- agency_availability_requests.agency_id
CREATE INDEX IF NOT EXISTS idx_aar_agency_id_fk 
  ON public.agency_availability_requests(agency_id) 
  WHERE agency_id IS NOT NULL;

-- agency_views.agency_id
CREATE INDEX IF NOT EXISTS idx_agency_views_agency_id_fk 
  ON public.agency_views(agency_id) 
  WHERE agency_id IS NOT NULL;

-- em_automation_enrollments.contact_id
CREATE INDEX IF NOT EXISTS idx_em_auto_enroll_contact_id_fk 
  ON public.em_automation_enrollments(contact_id);

-- em_campaigns.segment_id
CREATE INDEX IF NOT EXISTS idx_em_campaigns_segment_id_fk 
  ON public.em_campaigns(segment_id) 
  WHERE segment_id IS NOT NULL;

-- em_campaigns.template_id
CREATE INDEX IF NOT EXISTS idx_em_campaigns_template_id_fk 
  ON public.em_campaigns(template_id) 
  WHERE template_id IS NOT NULL;

-- em_messages.automation_id
CREATE INDEX IF NOT EXISTS idx_em_messages_automation_id_fk 
  ON public.em_messages(automation_id) 
  WHERE automation_id IS NOT NULL;

-- em_messages.template_id
CREATE INDEX IF NOT EXISTS idx_em_messages_template_id_fk 
  ON public.em_messages(template_id) 
  WHERE template_id IS NOT NULL;

-- spotlight_applications.reviewed_by
CREATE INDEX IF NOT EXISTS idx_spotlight_apps_reviewed_by_fk 
  ON public.spotlight_applications(reviewed_by) 
  WHERE reviewed_by IS NOT NULL;

-- top25_applications.reviewed_by
CREATE INDEX IF NOT EXISTS idx_top25_apps_reviewed_by_fk 
  ON public.top25_applications(reviewed_by) 
  WHERE reviewed_by IS NOT NULL;
