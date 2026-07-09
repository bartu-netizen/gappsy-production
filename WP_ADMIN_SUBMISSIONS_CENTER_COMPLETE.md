# WP Admin Submissions Center

## What Was Added

### Edge Function: `wpadmin-submissions`
- Path: `supabase/functions/wpadmin-submissions/index.ts`
- Authenticated via `x-admin-secret` header (same as all other wp-admin edge functions)
- Uses service role key to bypass RLS on all 5 submission tables
- Supports two modes:
  - **LIST**: `GET ?type=...&q=...&state=...&from=...&to=...&limit=...&offset=...`
  - **DETAIL**: `GET /detail?kind=...&id=...`

### Page: `WpAdminSubmissionsPage`
- Path: `src/pages/WpAdminSubmissionsPage.tsx`
- Route: `/wp-admin/submissions`

### Route added to `src/App.tsx`
```tsx
<Route path="/wp-admin/submissions" element={<WpAdminSubmissionsPage />} />
```

### Dashboard card added to `WpAdminDashboardPage`
New "Submissions Center" card in the admin tools grid linking to `/wp-admin/submissions`.

## How to Use

1. Go to `/wp-admin` and log in with your admin secret
2. Click **Submissions Center** on the dashboard, or navigate to `/wp-admin/submissions`
3. Use the tabs to switch between form types:
   - All Recent
   - Get Matched (`matched_leads`)
   - Sponsored Spotlight (`spotlight_applications`)
   - Top 25 Submissions (`top25_applications`)
   - Availability Checks (`agency_availability_requests`)
   - Confirm Connection / Demo (`owner_demo_events`)
4. Filter by search query, state slug, date range, or page size
5. Click any row to open the detail drawer — use **Overview** for formatted fields or **Raw JSON** for the full row with a copy button
6. Click **Export CSV** to download the current visible rows as a CSV file

## Tables Queried

| Tab | Table |
|-----|-------|
| Get Matched | `matched_leads` |
| Sponsored Spotlight | `spotlight_applications` |
| Top 25 Submissions | `top25_applications` |
| Availability Checks | `agency_availability_requests` |
| Confirm Connection / Demo | `owner_demo_events` |
