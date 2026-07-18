-- Follow-up fix (same pattern as prior bulk-500 batches): the prerender
-- category-page build hard-fails without a description/seo_description on
-- every category row, so the 2 new categories from the companion migration
-- need one before the next build runs.
UPDATE tool_categories SET description = $q$Game engines, dedicated game servers, and admin/control panels for hosting, managing, and playing multiplayer and self-hosted games.$q$, seo_description = $q$Compare the best game servers, game engines, and hosting panels for multiplayer gaming.$q$ WHERE slug = $q$gaming$q$ AND description IS NULL;
UPDATE tool_categories SET description = $q$Internet of Things and home automation platforms for controlling smart devices, sensors, and connected hardware.$q$, seo_description = $q$Compare the best IoT and home automation platforms for controlling smart devices and sensors.$q$ WHERE slug = $q$iot$q$ AND description IS NULL;
