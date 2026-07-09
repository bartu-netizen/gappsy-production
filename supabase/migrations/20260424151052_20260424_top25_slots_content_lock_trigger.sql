/*
  # Protect paid locked Top 25 slots from content overwrite

  Adds a BEFORE UPDATE trigger on top25_slots that blocks any update which
  would overwrite listing content (description, short_description, services,
  website, logo_url, agency_name) while the slot is_content_locked=true,
  UNLESS the updater sets the session variable `app.force_update=on`.

  1. Trigger behavior
    - If OLD.is_content_locked = true AND any protected column is changing
      AND current_setting('app.force_update', true) IS DISTINCT FROM 'on',
      raise exception.
    - Admin editors / listing-save-and-activate can call
      `SET LOCAL app.force_update = 'on'` inside their transaction to bypass.
  2. Security
    - Enforced at the database layer — no import script can bypass it
      without the explicit force flag.
*/

CREATE OR REPLACE FUNCTION public.protect_locked_top25_slot_content()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_force text;
BEGIN
  IF COALESCE(OLD.is_content_locked, false) = false THEN
    RETURN NEW;
  END IF;

  v_force := current_setting('app.force_update', true);
  IF v_force = 'on' THEN
    RETURN NEW;
  END IF;

  IF (NEW.description IS DISTINCT FROM OLD.description)
     OR (NEW.short_description IS DISTINCT FROM OLD.short_description)
     OR (NEW.services IS DISTINCT FROM OLD.services)
     OR (NEW.website IS DISTINCT FROM OLD.website)
     OR (NEW.logo_url IS DISTINCT FROM OLD.logo_url)
     OR (NEW.agency_name IS DISTINCT FROM OLD.agency_name)
     OR (NEW.agency_id IS DISTINCT FROM OLD.agency_id) THEN
    RAISE EXCEPTION
      'top25_slots % is content-locked (paid sale). Set app.force_update=on to override.',
      OLD.id
      USING ERRCODE = 'check_violation';
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_protect_locked_top25_slot_content ON public.top25_slots;

CREATE TRIGGER trg_protect_locked_top25_slot_content
BEFORE UPDATE ON public.top25_slots
FOR EACH ROW
EXECUTE FUNCTION public.protect_locked_top25_slot_content();
