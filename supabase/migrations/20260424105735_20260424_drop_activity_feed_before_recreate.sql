/*
  # Drop get_admin_activity_feed to allow column-shape change
  Return type is being extended with identity_source + identity_debug.
*/
DROP FUNCTION IF EXISTS public.get_admin_activity_feed(integer, text, uuid, integer);
