-- SECURITY DEFINER wrapper so the vendor-onboarding edge function can check
-- whether an email already has a Supabase Auth account, without exposing
-- auth.users directly (PostgREST doesn't expose the auth schema at all, and
-- shouldn't). EXECUTE is granted only to service_role, never anon/authenticated
-- — this must not become a public email-enumeration endpoint.
create or replace function public.check_email_registered(p_email text)
returns boolean
language sql
security definer
set search_path = public, auth
as $$
  select exists(
    select 1 from auth.users where lower(email) = lower(p_email)
  );
$$;

revoke all on function public.check_email_registered(text) from public;
revoke all on function public.check_email_registered(text) from anon;
revoke all on function public.check_email_registered(text) from authenticated;
grant execute on function public.check_email_registered(text) to service_role;
