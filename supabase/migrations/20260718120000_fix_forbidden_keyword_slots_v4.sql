-- Fixes a forbidden-keyword build failure (literal "slots" match, banned
-- site-wide by scripts/scan-forbidden-keywords.js regardless of context)
-- found in Bootstrap Studio's content from the batch-4 import. Rewords
-- around the word without changing meaning.
UPDATE tool_features
SET description = 'Publish directly via SFTP, with free hosting space on Bootstrap Studio''s platform.'
WHERE id = '04223423-0a79-4db9-8060-728fd170e486';
