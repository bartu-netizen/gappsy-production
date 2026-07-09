# Quick Send Tracking Dashboard

## Root Cause of "Failed to load tracking data"

`QuickSendTrackingPage` was making direct `supabase.from('email_messages').select(...)` calls from the browser using the anon key. The RLS policies on `email_messages` block these reads — so the query returned an error and the page showed "Failed to load tracking data".

Same issue affected `QuickSendsPage` (list view) which also used direct Supabase queries.

---

## Architecture After Fix

All admin data access now goes through same-origin Netlify functions that use the service role key (bypasses RLS safely, with admin token validation before any query runs):

```
Browser → GET /api/admin/email/messages/:id        → quick-send-detail.ts (service role)
Browser → GET /api/admin/email/messages/:id/events → quick-send-detail.ts (service role)
Browser → GET /api/admin/email/messages/:id/stats  → quick-send-detail.ts (service role)
Browser → GET /api/admin/email/quick-sends         → quick-send-list.ts   (service role)
```

---

## Endpoints

### GET /api/admin/email/messages/:id

Returns message record.

**Auth:** `x-admin-token` header required.

**Response (200):**
```json
{
  "id": "uuid",
  "kind": "quick_send",
  "to_email": "...",
  "to_name": "...",
  "subject": "...",
  "from_name": "...",
  "from_email": "...",
  "status": "sent|queued|failed",
  "provider_message_id": "...",
  "sent_at": "ISO",
  "created_at": "ISO",
  "html_body": "...",
  "text_body": "...",
  "body_preview": "first 200 chars stripped of HTML"
}
```

**Response (404):** `{ "error": "Message not found", "id": "..." }`

---

### GET /api/admin/email/messages/:id/events

Returns all tracking events for the message.

**Response (200):**
```json
{
  "events": [
    {
      "id": "uuid",
      "event_type": "open|click",
      "occurred_at": "ISO",
      "url": "https://... (for clicks)",
      "user_agent": "...",
      "ip_hash": "..."
    }
  ]
}
```

Returns `{ "events": [] }` when no events exist (never fails on empty).

---

### GET /api/admin/email/messages/:id/stats

Returns computed aggregates.

**Response (200):**
```json
{
  "delivered_count": 1,
  "open_total": 3,
  "open_unique": 2,
  "click_total": 5,
  "click_unique": 3,
  "last_open_at": "ISO or null",
  "last_click_at": "ISO or null",
  "clicks_by_url": [
    { "url": "https://...", "count": 3, "last_clicked_at": "ISO" }
  ],
  "opens_by_hour": [
    { "hour": 14, "count": 2 }
  ],
  "clicks_by_hour": [
    { "hour": 14, "count": 3 }
  ]
}
```

Returns zeros/empty arrays when no events. Never fails.

---

### GET /api/admin/email/quick-sends

Returns list of quick send messages with open/click counts.

**Response (200):**
```json
{
  "messages": [
    {
      "id": "uuid",
      "to_email": "...",
      "to_name": "...",
      "subject": "...",
      "status": "sent",
      "sent_at": "ISO",
      "created_at": "ISO",
      "opens_count": 2,
      "clicks_count": 1
    }
  ]
}
```

---

## Netlify Functions

| File | Route | Description |
|------|-------|-------------|
| `netlify/functions/quick-send-detail.ts` | `/api/admin/email/messages/:id[/events|/stats]` | Reads message, events, stats via service role |
| `netlify/functions/quick-send-list.ts` | `/api/admin/email/quick-sends` | Lists messages with event counts |
| `netlify/functions/quick-send-proxy.ts` | `/api/admin/email/quick-sends/send` | Sends emails (calls create+send edge fns) |
| `netlify/functions/quick-send-ping.ts` | `/api/admin/email/ping` | Health check for /api routing |

---

## _redirects Rules

Located at top of `public/_redirects` (before trailing-slash rule):

```
/api/admin/email/ping                  /.netlify/functions/quick-send-ping   200!
/api/admin/email/quick-sends/send      /.netlify/functions/quick-send-proxy  200!
/api/admin/email/quick-sends           /.netlify/functions/quick-send-list   200!
/api/admin/email/messages/:id/events   /.netlify/functions/quick-send-detail 200!
/api/admin/email/messages/:id/stats    /.netlify/functions/quick-send-detail 200!
/api/admin/email/messages/:id          /.netlify/functions/quick-send-detail 200!
```

The `200!` flag forces these rules to take priority over the trailing-slash `301!` rule that would otherwise intercept them.

---

## Database Schema

Tables used (already existed):

```sql
email_messages (
  id uuid PRIMARY KEY,
  kind text,
  to_email text,
  to_name text,
  subject text,
  from_name text,
  from_email text,
  html_body text,
  text_body text,
  status text,  -- queued | sent | failed
  provider_message_id text,
  sent_at timestamptz,
  created_at timestamptz
)

email_events (
  id uuid PRIMARY KEY,
  email_message_id uuid REFERENCES email_messages(id),
  event_type text,  -- open | click
  occurred_at timestamptz,
  url text,
  user_agent text,
  ip_hash text
)
```

---

## Tracking: Opens and Clicks

The `quick-send-send` edge function already injects:
- **Open pixel:** `<img src=".../email-track-open?mid=..." />` appended to HTML
- **Link rewrites:** all `href="..."` rewritten to `.../email-track-click?mid=...&u=encoded_url`

These tracking endpoints (`email-track-open`, `email-track-click`) insert rows into `email_events`.

---

## Testing Steps

### 1. Verify /api routing

```js
// In browser console on gappsy.com:
fetch('/api/admin/email/ping').then(r => r.json()).then(console.log)
// Expected: { ok: true, time: "2026-..." }
```

### 2. Verify tracking detail loads

Navigate to:
`https://www.gappsy.com/wp-admin/email/quick-send/bee34271-416d-46d3-bedd-17c260ecd737`

Should load message header + 4 KPI cards + tabbed content panel.
Even with zero events → shows "No tracking events yet" (not an error).

### 3. Debug mode

Append `?debug=1` to URL. Console will show `[QS_TRACKING_DEBUG]` prefixed logs with exact API URLs and status codes.

### 4. Verify quick sends list loads

`https://www.gappsy.com/wp-admin/email/quick-sends`

Table should load. Each row shows opens + clicks count. "View" button navigates to tracking detail.

### 5. End-to-end send + track

1. Click "New Quick Send"
2. Fill in your email, subject, HTML body with at least one link
3. Click "Send Now" → should succeed (no "Failed to fetch")
4. Navigate to the tracking detail page (auto-redirect after send)
5. Open the email → open pixel fires → opens counter increments
6. Click a link → click redirect fires → clicks counter increments

---

## Security

- All admin endpoints validate `x-admin-token` header before any DB query
- Service role key is in Netlify's environment — never in browser bundle
- RLS is never disabled; it is bypassed only at the server layer with proper auth checking
- No email addresses or message content exposed in public URLs
