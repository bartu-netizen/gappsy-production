/*
  # Fix Function Search Path Mutability - V2

  Recreate functions with immutable search_path.
  Drop dependent triggers first, then recreate them.
*/

-- Fix is_agency_paid_in_state
DROP FUNCTION IF EXISTS public.is_agency_paid_in_state(text, text);

CREATE FUNCTION public.is_agency_paid_in_state(
  p_agency_slug text,
  p_state_slug text
)
RETURNS boolean
LANGUAGE plpgsql
STABLE
SECURITY INVOKER
SET search_path = 'public'
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.top25_slots
    WHERE agency_slug = p_agency_slug
      AND state_slug = p_state_slug
      AND is_active = true
  );
END;
$$;

-- Fix get_services_for_state
DROP FUNCTION IF EXISTS public.get_services_for_state(text, integer);

CREATE FUNCTION public.get_services_for_state(
  p_state_slug text,
  p_rank integer
)
RETURNS TABLE(service text)
LANGUAGE plpgsql
STABLE
SECURITY INVOKER
SET search_path = 'public'
AS $$
BEGIN
  RETURN QUERY
  SELECT DISTINCT unnest(services)::text
  FROM public.top25_slots
  WHERE state_slug = p_state_slug
    AND rank = p_rank
    AND is_active = true
  ORDER BY 1;
END;
$$;

-- Fix normalize_agency_name
DROP FUNCTION IF EXISTS public.normalize_agency_name(text);

CREATE FUNCTION public.normalize_agency_name(p_name text)
RETURNS text
LANGUAGE plpgsql
IMMUTABLE
SECURITY INVOKER
SET search_path = 'public'
AS $$
BEGIN
  RETURN LOWER(
    REGEXP_REPLACE(
      REGEXP_REPLACE(p_name, '[^a-zA-Z0-9\s]', '', 'g'),
      '\s+', ' ', 'g'
    )
  );
END;
$$;

-- Drop and recreate check_forbidden_keywords with its trigger
DROP TRIGGER IF EXISTS trg_state_content_forbidden_keywords ON public.state_content;
DROP FUNCTION IF EXISTS public.check_forbidden_keywords();

CREATE FUNCTION public.check_forbidden_keywords()
RETURNS trigger
LANGUAGE plpgsql
VOLATILE
SECURITY INVOKER
SET search_path = 'public'
AS $$
DECLARE
  forbidden_keywords text[] := ARRAY[
    'gambling', 'casino', 'bet', 'sportsbook', 'lottery'
  ];
  content_to_check text;
  keyword text;
BEGIN
  content_to_check := COALESCE(NEW.description_full, '') || ' ' || 
                      COALESCE(NEW.description_short, '') || ' ' ||
                      COALESCE(NEW.intro, '');
  
  FOREACH keyword IN ARRAY forbidden_keywords LOOP
    IF content_to_check ILIKE '%' || keyword || '%' THEN
      RAISE EXCEPTION 'Content contains forbidden keyword: %', keyword;
    END IF;
  END LOOP;
  
  RETURN NEW;
END;
$$;

-- Recreate the trigger
CREATE TRIGGER trg_state_content_forbidden_keywords
  BEFORE INSERT OR UPDATE ON public.state_content
  FOR EACH ROW
  EXECUTE FUNCTION public.check_forbidden_keywords();
