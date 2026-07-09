-- ============================================
-- State Content & FAQ System Verification
-- ============================================
-- Run these queries to verify the fix is working

-- 1. Check table existence and row counts
SELECT
  'state_content' as table_name,
  COUNT(*) as row_count,
  CASE WHEN COUNT(*) > 0 THEN '✅ Has data' ELSE '⚠️ Empty - needs import' END as status
FROM state_content
UNION ALL
SELECT
  'state_faqs',
  COUNT(*),
  CASE WHEN COUNT(*) > 0 THEN '✅ Has data' ELSE '⚠️ Empty - needs import' END
FROM state_faqs
UNION ALL
SELECT
  'state_pages',
  COUNT(*),
  CASE WHEN COUNT(*) > 0 THEN '✅ Has data' ELSE '❌ ERROR' END
FROM state_pages;

-- 2. Check state content for specific states
SELECT
  state_slug,
  LEFT(hero_intro, 80) || '...' as hero_preview,
  LEFT(state_intro_short, 60) || '...' as intro_preview,
  last_updated,
  created_at
FROM state_content
WHERE state_slug IN ('alabama', 'alaska', 'new-jersey')
ORDER BY state_slug;

-- 3. Check FAQs per state (with state-specific content verification)
SELECT
  state_slug,
  COUNT(*) as faq_count,
  STRING_AGG(LEFT(question, 50), '; ' ORDER BY position) as questions_preview
FROM state_faqs
WHERE state_slug IN ('alabama', 'alaska', 'new-jersey')
GROUP BY state_slug
ORDER BY state_slug;

-- 4. Check first FAQ for each state (to verify state-specific content)
WITH first_faqs AS (
  SELECT
    state_slug,
    question,
    ROW_NUMBER() OVER (PARTITION BY state_slug ORDER BY position) as rn
  FROM state_faqs
)
SELECT
  state_slug,
  question,
  CASE
    WHEN state_slug = 'alabama' AND question LIKE '%Alabama%' THEN '✅ Alabama-specific'
    WHEN state_slug = 'alaska' AND question LIKE '%Alaska%' THEN '✅ Alaska-specific'
    WHEN state_slug = 'new-jersey' AND (question LIKE '%New Jersey%' OR question LIKE '%NJ%') THEN '✅ NJ-specific'
    WHEN question LIKE '%New Jersey%' OR question LIKE '%NJ%' THEN '❌ WRONG - Shows NJ content!'
    ELSE '⚠️ Check manually'
  END as validation
FROM first_faqs
WHERE rn = 1;

-- 5. Check agency descriptions (full vs short)
SELECT
  state_slug,
  rank,
  agency_name,
  LENGTH(description) as full_desc_length,
  LENGTH(short_description) as short_desc_length,
  CASE
    WHEN description IS NULL THEN '❌ NULL description'
    WHEN LENGTH(description) < 50 THEN '⚠️ Too short (< 50 chars)'
    WHEN LENGTH(description) < 150 THEN '⚠️ Short (< 150 chars)'
    WHEN LENGTH(description) >= 150 THEN '✅ Good length'
    ELSE '?'
  END as desc_status,
  LEFT(description, 60) || '...' as desc_preview
FROM top25_slots
WHERE state_slug IN ('alabama', 'alaska', 'new-jersey')
  AND rank <= 5
ORDER BY state_slug, rank;

-- 6. CRITICAL: Verify no "click to expand" placeholders
SELECT state_slug, question, answer
FROM state_faqs
WHERE question ILIKE '%click to expand%'
   OR answer ILIKE '%click to expand%';
-- Expected: 0 rows (all placeholders should be filtered out)

-- 7. CRITICAL: Verify no New Jersey content leakage
SELECT state_slug, question
FROM state_faqs
WHERE state_slug != 'new-jersey'
  AND (question LIKE '%New Jersey%' OR question LIKE '%NJ%'
       OR answer LIKE '%New Jersey%' OR answer LIKE '%NJ%');
-- Expected: 0 rows (no NJ mentions in other states)

-- 8. Verify NO duplicate FAQs across states
SELECT
  question,
  COUNT(DISTINCT state_slug) as state_count,
  STRING_AGG(DISTINCT state_slug, ', ') as states_using_this_question,
  CASE
    WHEN COUNT(DISTINCT state_slug) > 1 THEN '⚠️ Shared across states'
    ELSE '✅ Unique to state'
  END as uniqueness_status
FROM state_faqs
GROUP BY question
HAVING COUNT(DISTINCT state_slug) > 1
ORDER BY state_count DESC;

-- 9. Summary stats
SELECT
  (SELECT COUNT(*) FROM state_content) as states_with_content,
  (SELECT COUNT(*) FROM state_pages) as total_states,
  (SELECT COUNT(DISTINCT state_slug) FROM state_faqs) as states_with_faqs,
  (SELECT AVG(faq_count) FROM (
    SELECT state_slug, COUNT(*) as faq_count
    FROM state_faqs
    GROUP BY state_slug
  ) sub) as avg_faqs_per_state,
  (SELECT COUNT(*) FROM top25_slots WHERE description IS NOT NULL AND LENGTH(description) > 150) as agencies_with_full_desc;

-- ============================================
-- Expected Results After Import
-- ============================================

-- state_content: Should have 1 row per imported state
-- state_faqs: Should have 5 rows per imported state (position 1-5)
-- top25_slots.description: Should be 150+ characters (full description)
-- top25_slots.short_description: Should be < 200 characters (card preview)

-- ============================================
-- How to Import Alabama
-- ============================================

-- 1. Navigate to: /admin/bulk-state-import
-- 2. Upload: /public/data/alabama.json
-- 3. Check "Override Existing Data"
-- 4. Enter admin secret
-- 5. Click "Import State"
-- 6. Run these queries again to verify

-- ============================================
-- Verification Checklist
-- ============================================

-- ✅ state_content has Alabama row
-- ✅ state_faqs has 5 Alabama rows
-- ✅ Alabama FAQs mention "Alabama" (not "New Jersey")
-- ✅ Agency descriptions are 150+ chars (not truncated)
-- ✅ State page shows Alabama hero intro (not blank)
-- ✅ State page shows Alabama FAQs (not NJ FAQs)
