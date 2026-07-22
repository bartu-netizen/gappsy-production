/*
  Fix check ordering in tool_user_reviews_spam_gate(): an email address like
  "spammer@example.com" also matches the bare domain+TLD pattern (the part
  after the @), so the domain check running first reported the wrong reason
  ("Reviews can't include website addresses.") for an email submission.
  Email check now runs before the domain/link checks so the error message
  matches what was actually found.
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

  IF combined_text ~* '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}' THEN
    RAISE EXCEPTION 'Reviews can''t include an email address.' USING ERRCODE = 'P0001';
  END IF;

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

  IF combined_text ~ '[0-9][0-9.() -]{7,}[0-9]' THEN
    RAISE EXCEPTION 'Reviews can''t include a phone number.' USING ERRCODE = 'P0001';
  END IF;

  NEW.status := 'approved';
  RETURN NEW;
END;
$$;
