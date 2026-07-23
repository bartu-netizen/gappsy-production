-- Raises the lead-magnet comparison generator's daily batch size now that
-- findComparisonCandidate (schedulerRegistry.ts) gates on real tag-overlap
-- relevance (2+ shared tags via tool_tags/tool_tag_links) instead of bare
-- same-category matching. The original 10/day cap was a caution against
-- low-quality pairs (confirmed live: "Compare JSON" vs "Webflow" — same
-- category, nothing else in common); with the relevance gate in place there
-- is no quality reason to stay small, so this raises it to 25/day.
UPDATE scheduled_jobs
SET config = jsonb_set(config, '{batch_size}', '25'::jsonb)
WHERE job_key = 'lead_magnet_comparison_generator';
