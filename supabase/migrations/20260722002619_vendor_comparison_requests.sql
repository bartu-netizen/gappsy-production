-- Growth-exclusive perk: a Growth vendor can request to be compared against
-- a specific competitor. This only queues the request for admin review —
-- the actual tool_comparisons row is still created by hand via the existing
-- admin-tool-comparisons editor (including its open-source-pair guard), so
-- this table never writes to tool_comparisons directly.
CREATE TABLE IF NOT EXISTS vendor_comparison_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  requested_tool_id uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  admin_notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CHECK (tool_id != requested_tool_id)
);

CREATE INDEX IF NOT EXISTS idx_vendor_comparison_requests_tool_id ON vendor_comparison_requests (tool_id);
CREATE INDEX IF NOT EXISTS idx_vendor_comparison_requests_status ON vendor_comparison_requests (status);
