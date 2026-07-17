-- Fixes forbidden-keyword build failures (literal "slots" match, banned
-- site-wide by scripts/scan-forbidden-keywords.js regardless of context).
-- 2 found directly by the build (Doctolib, from the batch-3 import, and
-- pre-existing Sorted 3); 3 more found by a follow-up broad scan of the
-- same content tables (pre-existing: Microsoft Azure, NexHealth, Zoho
-- Social). All rewords around the word without changing meaning.
UPDATE tool_features
SET description = 'Patients can search for healthcare providers and book available appointment times directly online.'
WHERE id = '815b5b86-8a70-4dea-8b0c-a88df8d09027';

UPDATE tool_features
SET description = 'Automatically places tasks into available time windows on the timeline.'
WHERE id = 'a081e77a-3b8d-4e06-975e-deb9f9425785';

-- paragraphs are stored as whole multi-sentence blocks, not one sentence
-- per array element, so a substring replace (not array_replace) is needed.
UPDATE tool_content_blocks
SET paragraphs = (
  SELECT array_agg(replace(p, 'deployment slots for staged rollouts', 'deployment staging environments for staged rollouts') ORDER BY ord)
  FROM unnest(paragraphs) WITH ORDINALITY AS t(p, ord)
)
WHERE id = 'b3e92e93-d723-4a8e-ac5f-660b86c942c6';

UPDATE tool_content_blocks
SET paragraphs = (
  SELECT array_agg(replace(p, 'appointment slots, patient records', 'appointment availability, patient records') ORDER BY ord)
  FROM unnest(paragraphs) WITH ORDINALITY AS t(p, ord)
)
WHERE id = '2c099057-5166-41c5-9d12-9220182009d5';

UPDATE tool_content_blocks
SET paragraphs = (
  SELECT array_agg(replace(p, 'recurring time slots for each day', 'recurring posting windows for each day') ORDER BY ord)
  FROM unnest(paragraphs) WITH ORDINALITY AS t(p, ord)
)
WHERE id = 'fcc61746-c556-4d5b-8ab8-4e5cb1890ba5';
