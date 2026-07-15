/*
  Tool reviews: instant publish instead of admin moderation queue, gated by
  a server-side spam filter — additive, no destructive change to existing
  rows or the admin moderation UI (admin-tool-reviews / WpAdminToolReviewsPage
  keep working exactly as before for anything that still ends up pending,
  e.g. rows inserted before this migration).

  Previously every submission was forced to status='pending' by the INSERT
  policy's WITH CHECK clause, requiring an admin to approve it before it
  showed publicly. Now: a BEFORE INSERT trigger inspects the submitted
  content server-side (client-side checks alone are trivially bypassed) and
  either sets status='approved' (clean review, published immediately) or
  raises an exception that aborts the insert entirely (spam signal found —
  the submitter gets an error back and can edit + resubmit, rather than the
  review silently vanishing into a queue nobody looks at promptly).

  Spam signals checked: a URL/www, a bare domain+TLD (including "sly" sly
  obfuscation like "example . com", "example (dot) com", "example[.]com"),
  an email address, or a phone-number-shaped run of digits.
*/

CREATE OR REPLACE FUNCTION tool_user_reviews_spam_gate()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  combined_text text;
  normalized_text text;
BEGIN
  combined_text := coalesce(NEW.reviewer_name, '') || ' ' || coalesce(NEW.title, '') || ' ' || coalesce(NEW.body, '');
  normalized_text := lower(combined_text);

  -- Collapse common ways of writing out a domain to dodge a naive link
  -- filter: spaced-out dots, "(dot)", "[.]", the word "dot" as a separator.
  normalized_text := regexp_replace(normalized_text, '\s*\(\s*dot\s*\)\s*', '.', 'g');
  normalized_text := regexp_replace(normalized_text, '\s*\[\s*\.\s*\]\s*', '.', 'g');
  normalized_text := regexp_replace(normalized_text, '\s+dot\s+', '.', 'g');
  normalized_text := regexp_replace(normalized_text, '\s*\.\s*', '.', 'g');

  IF normalized_text ~ '(https?://|www\.)' THEN
    RAISE EXCEPTION 'Reviews can''t include links.' USING ERRCODE = 'P0001';
  END IF;

  IF normalized_text ~ '[a-z0-9][a-z0-9-]*\.(com|net|org|io|co|biz|info|xyz|shop|store|online|app|dev|me|us|uk|ca|de|nl|au|eu)\M' THEN
    RAISE EXCEPTION 'Reviews can''t include website addresses.' USING ERRCODE = 'P0001';
  END IF;

  IF combined_text ~* '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}' THEN
    RAISE EXCEPTION 'Reviews can''t include an email address.' USING ERRCODE = 'P0001';
  END IF;

  IF combined_text ~ '[0-9][0-9.() -]{7,}[0-9]' THEN
    RAISE EXCEPTION 'Reviews can''t include a phone number.' USING ERRCODE = 'P0001';
  END IF;

  NEW.status := 'approved';
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_tool_user_reviews_spam_gate ON tool_user_reviews;
CREATE TRIGGER trg_tool_user_reviews_spam_gate
  BEFORE INSERT ON tool_user_reviews
  FOR EACH ROW
  EXECUTE FUNCTION tool_user_reviews_spam_gate();

-- The trigger now owns `status` for public submissions (it always sets it
-- to 'approved' or aborts the insert), so the WITH CHECK clause no longer
-- needs to force 'pending' — it just needs to make sure nobody can forge
-- reviewed_by/reviewed_at (admin-only fields) or submit against an
-- unpublished tool.
DROP POLICY IF EXISTS "tool_user_reviews_public_insert" ON tool_user_reviews;
CREATE POLICY "tool_user_reviews_public_insert"
  ON tool_user_reviews FOR INSERT
  TO anon, authenticated
  WITH CHECK (
    reviewed_by IS NULL
    AND reviewed_at IS NULL
    AND EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_user_reviews.tool_id AND t.status = 'published')
  );
