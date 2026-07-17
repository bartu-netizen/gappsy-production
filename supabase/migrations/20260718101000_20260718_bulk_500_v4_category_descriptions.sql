-- Follow-up fix (same pattern as prior bulk-500 batches): the prerender
-- category-page build hard-fails without a description/seo_description on
-- every category row, so the 3 new categories from the companion migration
-- need one before the next build runs.
UPDATE tool_categories SET description = $q$Time-tracking software for logging hours, monitoring productivity, and billing clients accurately.$q$, seo_description = $q$Compare the best time-tracking software for logging hours and monitoring team productivity.$q$ WHERE slug = $q$time-tracking$q$ AND description IS NULL;
UPDATE tool_categories SET description = $q$Self-hosted media servers and audio/video production tools for streaming, editing, and managing photos, music, and video.$q$, seo_description = $q$Compare the best self-hosted media servers and audio/video tools for streaming and production.$q$ WHERE slug = $q$media-tools$q$ AND description IS NULL;
UPDATE tool_categories SET description = $q$AI infrastructure, MLOps, and observability tooling for training, deploying, monitoring, and serving machine learning and LLM applications.$q$, seo_description = $q$Compare the best AI infrastructure and MLOps tools for training, deploying, and monitoring ML models.$q$ WHERE slug = $q$ai-infrastructure$q$ AND description IS NULL;
