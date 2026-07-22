-- Renames the "roundup" (3+ tool comparison) feature to "group comparison"
-- for terminology consistency with the pairwise tool_comparisons feature —
-- explicitly requested after launching the first 15-page pilot, while the
-- surface area was still small. Postgres tracks foreign keys, RLS policy
-- expressions, and constraints by OID internally, so renaming the tables
-- and the FK column below automatically keeps every dependent object
-- correctly wired — no data migration needed, no downtime.

ALTER TABLE tool_roundups RENAME TO tool_group_comparisons;
ALTER TABLE tool_roundup_members RENAME TO tool_group_comparison_members;

ALTER TABLE tool_group_comparison_members RENAME COLUMN roundup_id TO group_comparison_id;

-- Cosmetic renames so \d output and error messages read consistently too.
ALTER TABLE tool_group_comparisons RENAME CONSTRAINT tool_roundups_pkey TO tool_group_comparisons_pkey;
ALTER TABLE tool_group_comparisons RENAME CONSTRAINT tool_roundups_slug_key TO tool_group_comparisons_slug_key;
ALTER TABLE tool_group_comparisons RENAME CONSTRAINT tool_roundups_status_check TO tool_group_comparisons_status_check;

ALTER TABLE tool_group_comparison_members RENAME CONSTRAINT tool_roundup_members_pkey TO tool_group_comparison_members_pkey;
ALTER TABLE tool_group_comparison_members RENAME CONSTRAINT tool_roundup_members_roundup_id_fkey TO tool_group_comparison_members_group_comparison_id_fkey;
ALTER TABLE tool_group_comparison_members RENAME CONSTRAINT tool_roundup_members_tool_id_fkey TO tool_group_comparison_members_tool_id_fkey;

ALTER POLICY tool_roundups_public_select ON tool_group_comparisons RENAME TO tool_group_comparisons_public_select;
ALTER POLICY tool_roundup_members_public_select ON tool_group_comparison_members RENAME TO tool_group_comparison_members_public_select;
