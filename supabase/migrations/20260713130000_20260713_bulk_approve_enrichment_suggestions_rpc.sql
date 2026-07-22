/*
  # Batch-approve RPC for enrichment_field_suggestions

  admin-enrichment-review's bulk-approve and approve-all-eligible actions
  each looped one sequential UPDATE per suggestion (unlike bulk-reject,
  which already does a single batched UPDATE) because approving requires
  copying each row's own generated_value into its own approved_value —
  not expressible as a single supabase-js .update() call, which only sets
  a fixed literal per column.

  This RPC does that copy in one SQL statement instead of N sequential
  round trips, and returns exactly which ids were updated so partial
  failures (e.g. a row whose status changed concurrently) are no longer
  silently swallowed.
*/

CREATE OR REPLACE FUNCTION approve_enrichment_suggestions(p_ids uuid[], p_reviewer text)
RETURNS TABLE(id uuid)
LANGUAGE sql
AS $$
  UPDATE enrichment_field_suggestions
  SET review_status = 'approved',
      approved_value = generated_value,
      reviewer = p_reviewer,
      reviewed_at = now()
  WHERE enrichment_field_suggestions.id = ANY(p_ids)
    AND review_status = 'pending'
  RETURNING enrichment_field_suggestions.id;
$$;
