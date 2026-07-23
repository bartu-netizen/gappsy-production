-- Widens tool_outbound_clicks.link_type to distinguish the two outcomes of
-- the new "Is this right for me?" fit-check widget (unclaimed tool pages
-- only): continuing to the original tool anyway, vs. clicking through to
-- the Featured alternative it suggested. Purely additive — existing values
-- keep working unchanged.
ALTER TABLE tool_outbound_clicks DROP CONSTRAINT tool_outbound_clicks_link_type_check;
ALTER TABLE tool_outbound_clicks ADD CONSTRAINT tool_outbound_clicks_link_type_check
  CHECK (link_type = ANY (ARRAY['visit_website', 'affiliate', 'other', 'claim_listing', 'get_featured', 'fit_check_continue', 'fit_check_alternative']::text[]));
