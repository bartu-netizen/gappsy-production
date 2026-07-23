/*
  # Allow one auth account to own more than one tool

  idx_tools_owner_user_id_unique (20260716010000) was a deliberate
  single-tool-per-account design choice ("keeps the dashboard's 'single
  listing' UX simple; revisit with a join table if multi-tool vendors
  become real"). That happened: a real vendor claiming a second product
  under the same email hit this constraint and got permanently stuck unable
  to manage the second listing (vendor-claim-account's claim update failed
  with a unique-violation, even though its own guard — .is("owner_user_id",
  null) — correctly prevented stealing an already-claimed tool).

  Dropping the UNIQUE constraint while keeping the plain (non-unique) index
  for lookup performance. requireVendorSession()/listVendorTools() in
  _shared/vendorAuth.ts now handle the multi-tool case explicitly (an
  optional tool_id disambiguates; omitting it still "just works" for the
  overwhelmingly common single-tool case, and returns a distinct
  multiple_tools error with the real owned-tools list otherwise).
*/
DROP INDEX IF EXISTS idx_tools_owner_user_id_unique;
