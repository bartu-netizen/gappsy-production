-- VERIFY_IMPORTED_STATE.sql
-- SQL queries to verify state content after import

-- ========================================
-- 1. CHECK STATE CONTENT EXISTS
-- ========================================

-- Verify state_content row exists and has required fields
SELECT
  state_slug,
  LEFT(hero_intro, 80) as hero_preview,
  CASE
    WHEN hero_intro IS NULL OR hero_intro = '' THEN '❌ Missing'
    ELSE '✅ Present'
  END as hero_status,
  CASE
    WHEN state_intro_full IS NULL OR state_intro_full = '' THEN '❌ Missing'
    ELSE '✅ Present'
  END as intro_full_status,
  raw_json_hash,
  updated_at
FROM state_content
WHERE state_slug = 'alaska';
-- Expected: 1 row with hero_status = '✅ Present'


-- ========================================
-- 2. CHECK FAQs IMPORTED
-- ========================================

-- Count FAQs for state
SELECT
  state_slug,
  COUNT(*) as faq_count
FROM state_faqs
WHERE state_slug = 'alaska'
GROUP BY state_slug;
-- Expected: 3-10 FAQs


-- List all FAQ questions
SELECT
  state_slug,
  position,
  question,
  LENGTH(answer) as answer_length
FROM state_faqs
WHERE state_slug = 'alaska'
ORDER BY position;
-- Expected: Questions mention "Alaska", answers >50 chars


-- ========================================
-- 3. CHECK NO PLACEHOLDER FAQs
-- ========================================

-- CRITICAL: No "click to expand" placeholders
SELECT
  state_slug,
  question,
  answer
FROM state_faqs
WHERE question ILIKE '%click to expand%'
   OR answer ILIKE '%click to expand%';
-- Expected: 0 rows (all filtered during import)


-- ========================================
-- 4. CHECK NO NJ CONTENT LEAKAGE
-- ========================================

-- CRITICAL: No New Jersey mentions in Alaska FAQs
SELECT
  state_slug,
  question,
  LEFT(answer, 100) as answer_preview
FROM state_faqs
WHERE state_slug = 'alaska'
  AND (question LIKE '%New Jersey%'
       OR question LIKE '%NJ%'
       OR answer LIKE '%New Jersey%'
       OR answer LIKE '%NJ%');
-- Expected: 0 rows


-- Check all states (except NJ) for NJ mentions
SELECT
  state_slug,
  COUNT(*) as nj_mentions
FROM state_faqs
WHERE state_slug != 'new-jersey'
  AND (question LIKE '%New Jersey%' OR answer LIKE '%New Jersey%')
GROUP BY state_slug;
-- Expected: 0 rows


-- ========================================
-- 5. CHECK NO LINK LIST FAQs
-- ========================================

-- Check for FAQs with multiple "Marketing Agencies in" lines (link lists)
SELECT
  state_slug,
  question,
  LENGTH(answer) - LENGTH(REPLACE(answer, 'Marketing Agencies in', '')) as occurrence_count,
  LENGTH(answer) as total_length
FROM state_faqs
WHERE answer LIKE '%Marketing Agencies in%'
  AND (LENGTH(answer) - LENGTH(REPLACE(answer, 'Marketing Agencies in', ''))) > 3
ORDER BY occurrence_count DESC;
-- Expected: 0 rows (all link lists filtered during import)


-- ========================================
-- 6. CHECK FAQ ANSWER LENGTH
-- ========================================

-- CRITICAL: No suspiciously short answers (< 50 chars)
SELECT
  state_slug,
  position,
  question,
  LENGTH(answer) as answer_length
FROM state_faqs
WHERE state_slug = 'alaska'
  AND LENGTH(answer) < 50
ORDER BY answer_length;
-- Expected: 0 rows (short answers filtered during import)


-- ========================================
-- 7. CHECK AGENCY DESCRIPTIONS
-- ========================================

-- Verify Top 25 slots have full descriptions (not truncated)
SELECT
  state_slug,
  rank,
  agency_name,
  LENGTH(description) as desc_length,
  CASE
    WHEN description IS NULL OR description = '' THEN '❌ Missing'
    WHEN LENGTH(description) < 50 THEN '⚠️ Too Short'
    ELSE '✅ Good'
  END as desc_status,
  LEFT(description, 80) as desc_preview
FROM top25_slots
WHERE state_slug = 'alaska'
  AND rank <= 25
ORDER BY rank;
-- Expected: All descriptions >100 chars (full text, not truncated)


-- Count agencies with long descriptions
SELECT
  state_slug,
  COUNT(*) as total_agencies,
  SUM(CASE WHEN LENGTH(description) > 100 THEN 1 ELSE 0 END) as with_long_desc,
  SUM(CASE WHEN LENGTH(description) <= 100 THEN 1 ELSE 0 END) as with_short_desc
FROM top25_slots
WHERE state_slug = 'alaska'
  AND rank <= 25
GROUP BY state_slug;
-- Expected: Most agencies have long descriptions (>100 chars)


-- ========================================
-- 8. CHECK DUPLICATE FAQs ACROSS STATES
-- ========================================

-- Identify if any FAQ questions are duplicated across states
SELECT
  question,
  COUNT(DISTINCT state_slug) as state_count,
  STRING_AGG(DISTINCT state_slug, ', ') as states_using_this_question,
  COUNT(*) as total_occurrences
FROM state_faqs
GROUP BY question
HAVING COUNT(DISTINCT state_slug) > 1
ORDER BY state_count DESC;
-- Expected: 0 rows (each state should have unique FAQs)
-- If rows found: States are sharing generic FAQ content (bad)


-- ========================================
-- 9. SUMMARY STATS
-- ========================================

-- Overall statistics
SELECT
  (SELECT COUNT(*) FROM state_content) as states_with_content,
  (SELECT COUNT(*) FROM state_pages) as total_states,
  (SELECT COUNT(DISTINCT state_slug) FROM state_faqs) as states_with_faqs,
  (SELECT COUNT(DISTINCT state_slug) FROM top25_slots) as states_with_agencies;


-- Per-state summary
SELECT
  sp.state_slug,
  sp.state_name,
  CASE WHEN sc.state_slug IS NOT NULL THEN '✅' ELSE '❌' END as has_content,
  COALESCE(faq_counts.faq_count, 0) as faq_count,
  COALESCE(agency_counts.agency_count, 0) as agency_count,
  sp.is_active
FROM state_pages sp
LEFT JOIN state_content sc ON sp.state_slug = sc.state_slug
LEFT JOIN (
  SELECT state_slug, COUNT(*) as faq_count
  FROM state_faqs
  GROUP BY state_slug
) faq_counts ON sp.state_slug = faq_counts.state_slug
LEFT JOIN (
  SELECT state_slug, COUNT(*) as agency_count
  FROM top25_slots
  WHERE rank <= 25
  GROUP BY state_slug
) agency_counts ON sp.state_slug = agency_counts.state_slug
WHERE sp.state_slug IN ('alaska', 'alabama', 'new-jersey')
ORDER BY sp.state_name;


-- ========================================
-- 10. IMPORT VERSION TRACKING
-- ========================================

-- Check content hash history (to see if content changed)
SELECT
  state_slug,
  raw_json_hash,
  updated_at,
  created_at
FROM state_content
WHERE state_slug = 'alaska'
ORDER BY updated_at DESC;
-- Expected: Consistent hash after re-import = same content


-- ========================================
-- ALASKA-SPECIFIC VERIFICATION CHECKLIST
-- ========================================

/*
Run these queries after importing Alaska:

1. ✅ state_content exists for 'alaska'
   → SELECT * FROM state_content WHERE state_slug = 'alaska';

2. ✅ hero_intro is NOT blank
   → Should start with "Discover Alaska's..." (or similar Alaska-specific text)

3. ✅ FAQs mention "Alaska" (NOT "New Jersey")
   → SELECT question FROM state_faqs WHERE state_slug = 'alaska';

4. ✅ No "click to expand" FAQs
   → SELECT * FROM state_faqs WHERE state_slug = 'alaska' AND question ILIKE '%click to expand%';
   → Must return 0 rows

5. ✅ FAQ answers are substantial (>50 chars)
   → SELECT question, LENGTH(answer) FROM state_faqs WHERE state_slug = 'alaska';

6. ✅ Agencies have full descriptions
   → SELECT rank, LENGTH(description) FROM top25_slots WHERE state_slug = 'alaska' ORDER BY rank;

7. ✅ No link list FAQs
   → Check for multiple "Marketing Agencies in" lines in answers

8. ✅ Content hash stored
   → SELECT raw_json_hash FROM state_content WHERE state_slug = 'alaska';
   → Should be 64-char hex string

9. ✅ Updated timestamp recent
   → SELECT updated_at FROM state_content WHERE state_slug = 'alaska';
   → Should be within last few minutes

10. ✅ All ranks 1-25 filled
    → SELECT COUNT(*) FROM top25_slots WHERE state_slug = 'alaska' AND rank BETWEEN 1 AND 25;
    → Should be 25
*/


-- ========================================
-- QUICK TEST SUITE
-- ========================================

-- Run this after Alaska import:
DO $$
DECLARE
  v_has_content boolean;
  v_faq_count integer;
  v_placeholder_count integer;
  v_nj_mention_count integer;
  v_agency_count integer;
BEGIN
  -- Check state_content
  SELECT EXISTS(SELECT 1 FROM state_content WHERE state_slug = 'alaska') INTO v_has_content;

  -- Count FAQs
  SELECT COUNT(*) INTO v_faq_count FROM state_faqs WHERE state_slug = 'alaska';

  -- Count placeholders
  SELECT COUNT(*) INTO v_placeholder_count
  FROM state_faqs
  WHERE state_slug = 'alaska'
    AND (question ILIKE '%click to expand%' OR answer ILIKE '%click to expand%');

  -- Count NJ mentions
  SELECT COUNT(*) INTO v_nj_mention_count
  FROM state_faqs
  WHERE state_slug = 'alaska'
    AND (question LIKE '%New Jersey%' OR answer LIKE '%New Jersey%');

  -- Count agencies
  SELECT COUNT(*) INTO v_agency_count
  FROM top25_slots
  WHERE state_slug = 'alaska' AND rank BETWEEN 1 AND 25;

  -- Output results
  RAISE NOTICE '===== ALASKA IMPORT VERIFICATION =====';
  RAISE NOTICE 'Has state_content: %', CASE WHEN v_has_content THEN '✅ YES' ELSE '❌ NO' END;
  RAISE NOTICE 'FAQ count: % (expected: 3-10)', v_faq_count;
  RAISE NOTICE 'Placeholder FAQs: % (expected: 0)', v_placeholder_count;
  RAISE NOTICE 'NJ mentions: % (expected: 0)', v_nj_mention_count;
  RAISE NOTICE 'Agency count: % (expected: 25)', v_agency_count;

  -- Assertions
  IF NOT v_has_content THEN
    RAISE WARNING '❌ FAIL: state_content missing for alaska';
  END IF;

  IF v_faq_count = 0 THEN
    RAISE WARNING '❌ FAIL: No FAQs found for alaska';
  END IF;

  IF v_placeholder_count > 0 THEN
    RAISE WARNING '❌ FAIL: Found % placeholder FAQ(s) - should be 0', v_placeholder_count;
  END IF;

  IF v_nj_mention_count > 0 THEN
    RAISE WARNING '❌ FAIL: Found % NJ mention(s) - should be 0', v_nj_mention_count;
  END IF;

  IF v_agency_count != 25 THEN
    RAISE WARNING '❌ FAIL: Expected 25 agencies, found %', v_agency_count;
  END IF;

  IF v_has_content AND v_faq_count > 0 AND v_placeholder_count = 0
     AND v_nj_mention_count = 0 AND v_agency_count = 25 THEN
    RAISE NOTICE '✅ ALL CHECKS PASSED';
  ELSE
    RAISE NOTICE '⚠️ SOME CHECKS FAILED - Review above warnings';
  END IF;
END $$;
