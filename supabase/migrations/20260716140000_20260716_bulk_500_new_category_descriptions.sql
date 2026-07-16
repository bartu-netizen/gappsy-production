-- The 4 new categories created for the 500-target bulk import
-- (20260716120000) had no description/seo_description — the category-page
-- build-time prerender hard-fails without one (verified by a real
-- `npm run build` failure: "missing seo_description and description —
-- cannot generate a real (non-generic) meta description"). Filling these
-- in with real, generic category-level descriptions (matching the exact
-- style of every other tool_categories row, e.g. "Security", "Legal",
-- "Forms") — this describes what the category IS, not any specific
-- company, so it's not the kind of tool-level fact the import task
-- was told never to fabricate.
UPDATE tool_categories SET
  description = 'Software for creating, editing, converting, and electronically signing documents and PDFs.',
  seo_description = 'Compare top document and e-signature software. Find the best tools for PDFs, contracts, and digital signing.'
WHERE slug = 'documents-esignature';

UPDATE tool_categories SET
  description = 'Healthcare software for managing patient records, scheduling, billing, and clinical workflows for practices and providers.',
  seo_description = 'Browse top healthcare and wellness software. Compare EHR, practice management, and patient care platforms.'
WHERE slug = 'healthcare';

UPDATE tool_categories SET
  description = 'Software for managing construction projects, field service teams, and real estate operations, from scheduling to job tracking.',
  seo_description = 'Compare top construction and field service management software. Find the best tools by features and pricing.'
WHERE slug = 'field-service';

UPDATE tool_categories SET
  description = 'Point-of-sale and retail management software for processing payments, tracking inventory, and running restaurants and stores.',
  seo_description = 'Browse top POS and retail management software. Compare payment processing and inventory tools for restaurants and retailers.'
WHERE slug = 'retail-pos';
