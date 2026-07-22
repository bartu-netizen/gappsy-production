-- tool_roundups_public_select previously checked "no unpublished member" by
-- querying tool_roundup_members, whose own policy queries tool_roundups back
-- — a mutual-reference cycle that Postgres RLS evaluates as infinite
-- recursion. Break the cycle by having tool_roundups' policy depend only on
-- its own status column; tool_roundup_members' policy (which already checks
-- both the tool and the roundup are published) still keeps member rows of a
-- draft roundup hidden, and app code additionally filters incomplete
-- member sets client-side.
DROP POLICY IF EXISTS tool_roundups_public_select ON tool_roundups;

CREATE POLICY tool_roundups_public_select ON tool_roundups
  FOR SELECT
  USING (status = 'published');
