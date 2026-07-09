/*
  # Contact Inbox helper SQL function

  Creates an atomic increment RPC used by the contact-inbox-reply edge function
  to safely increment the outbound_reply_count column without a read-modify-write race.
*/

CREATE OR REPLACE FUNCTION increment_contact_reply_count(p_id uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
AS $$
  UPDATE contact_messages
  SET outbound_reply_count = outbound_reply_count + 1
  WHERE id = p_id;
$$;
