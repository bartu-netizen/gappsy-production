# Quick Sends "Failed to Fetch" — Root Cause Analysis & Fix

**Date**: 2026-02-20
**Build ID**: `os67yyei`
**Status**: FIXED

---

## Root Cause Found

There were two compounding causes that together produced the "Failed to fetch" error on every attempt:

---

### Root Cause 1: Cross-Origin Fetch to Supabase URL (Primary)

**What was happening:**

The modal was calling `adminFetch('quick-send-create', ...)` which resolves to:
```
POST https://jczdgzhnsyzvbpfqueyy.supabase.co/functions/v1/quick-send-create
```

This is a **cross-origin** request from `https://www.gappsy.com` to `https://jczdgzhnsyzvbpfqueyy.supabase.co`.

Cross-origin requests trigger a CORS **preflight OPTIONS** request. If the preflight fails for any reason (network blip, TLS issue, JWT validation rejecting the anon key, Supabase cold start) the browser throws:

```
TypeError: Failed to fetch
```

This error has **no status code**, **no body** — it is a complete network-level failure that appears identical whether the host is unreachable, the CORS headers are wrong, or the preflight timed out.

**Why this caused persistent failures (4+ retries):**

Even with `verifyJWT=false` set on the edge functions, any network-level interruption on the Supabase origin produces the same generic browser error. The browser gives no diagnostic information to the application.

---

### Root Cause 2: Trailing Slash Redirect Intercepting /api Routes (Secondary)

**What was happening:**

The `_redirects` file had this rule near the top:
```
/([^.?]+[^/])  /$1/  301!
```

This regex matches ANY path without a trailing slash — including API routes like `/api/admin/email/quick-sends/send`.

**Result:** A POST to `/api/admin/email/quick-sends/send` would:
1. Be intercepted by the trailing-slash rule
2. Receive a `301 Moved Permanently` redirect to `/api/admin/email/quick-sends/send/`
3. The browser follows the redirect as a GET (per HTTP spec for 301)
4. The GET hits the SPA fallback `/* → /index.html`
5. Browser receives HTML when it expected JSON
6. `res.json()` throws — or the fetch itself fails because the redirect changed POST to GET

This was a **silent failure** because the 301 was a redirect, not an error.

---

## Fix Applied

### Fix 1: Same-Origin Netlify Function Proxy

Created a **same-origin** endpoint that lives under `gappsy.com`:

**New endpoint**: `POST /api/admin/email/quick-sends/send`
**Implementation**: `netlify/functions/quick-send-proxy.ts`

This function:
1. Validates admin token (reads `x-admin-token` header)
2. Validates payload fields (toEmail, subject, htmlBody)
3. Calls `quick-send-create` edge function server-side (from Netlify runtime, not browser)
4. Calls `quick-send-send` edge function server-side (from Netlify runtime, not browser)
5. Returns combined `{ ok, id, status }` response

**Why this eliminates "Failed to fetch":**
- The browser makes a same-origin request to `https://www.gappsy.com/api/...`
- No CORS, no preflight
- If the Netlify function itself fails to reach Supabase, it returns a `502` JSON response with details
- The browser always gets either JSON or an HTTP error code — never a silent network failure

**New ping endpoint**: `GET /api/admin/email/ping`
**Implementation**: `netlify/functions/quick-send-ping.ts`

Returns `{ ok: true, time: "..." }` to verify `/api` routing works before attempting a send.

---

### Fix 2: _redirects Rules at Top (Before Trailing-Slash Rule)

Added `/api/*` routes with `200!` force-override **before** the trailing-slash regex:

```
# SAME-ORIGIN API ROUTES (must be FIRST — before any redirect rules)
/api/admin/email/ping                  /.netlify/functions/quick-send-ping   200!
/api/admin/email/quick-sends/send      /.netlify/functions/quick-send-proxy  200!
```

The `200!` flag means "force rewrite — do not let any other rule override this". This prevents:
- The trailing-slash rule from intercepting the paths
- The SPA fallback from returning HTML for API calls

---

### Fix 3: Frontend Modal Rewritten

**File**: `src/components/em/QuickSendOneToOneModal.tsx`

**Changes:**
1. Now calls `POST /api/admin/email/quick-sends/send` (relative, same-origin) instead of Supabase directly
2. Sends `x-admin-token` header (no Authorization/anon key needed for same-origin)
3. Reads response as text first, then parses JSON — avoids crash when response is non-JSON
4. `[QS_SEND_DEBUG]` console prefix on all log lines
5. Debug panel at `?debug=1` now shows:
   - Resolved URL (`/api/admin/email/quick-sends/send`)
   - Method + headers summary (token masked)
   - Credentials mode (`same-origin`)
   - Ping result (green = `/api` routing works, red = routing broken)
   - HTTP status code
   - Response body snippet (first 500 chars)
   - Exception name + message + stack trace
   - "Copy Debug" button for sharing diagnostics

---

## Files Changed

| File | Change |
|------|--------|
| `public/_redirects` | Added `/api/*` rules at top with `200!` before trailing-slash rule |
| `netlify/functions/quick-send-proxy.ts` | NEW — same-origin proxy that calls create+send edge functions server-side |
| `netlify/functions/quick-send-ping.ts` | NEW — health check endpoint for `/api` routing verification |
| `src/components/em/QuickSendOneToOneModal.tsx` | Rewritten to use `/api/...` relative URL with full instrumentation |

---

## How to Test

### Test 1: Ping (verify /api routing works)

Open browser console on any page:
```js
fetch('/api/admin/email/ping').then(r => r.json()).then(console.log)
// Expected: { ok: true, time: "2026-..." }
```

If this returns HTML or 404, the `_redirects` rule is not deployed.

### Test 2: Debug Mode Send

1. Go to: `https://www.gappsy.com/wp-admin/email/quick-sends?debug=1`
2. Click "New Quick Send"
3. Fill in any email, subject, body
4. Click "Send Now"
5. If there's an error, the amber debug panel appears showing:
   - `Ping: ✓ reachable` or `✗ UNREACHABLE`
   - HTTP Status
   - Response body (exact JSON from Netlify function)

### Test 3: Normal Send

1. Go to: `https://www.gappsy.com/wp-admin/email/quick-sends`
2. Click "New Quick Send"
3. Complete all 3 steps and click "Send Now"
4. Expected: Modal closes, email delivered, row in `email_messages` with `status='sent'`

### Test 4: Console Logs

Open DevTools → Console, filter by `QS_SEND_DEBUG`:
```
[QS_SEND_DEBUG] === Quick Send started at 2026-02-20T...
[QS_SEND_DEBUG] url: /api/admin/email/quick-sends/send
[QS_SEND_DEBUG] admin_token_present: true
[QS_SEND_DEBUG] ping /api/admin/email/ping → 200 ok=true
[QS_SEND_DEBUG] calling /api/admin/email/quick-sends/send
[QS_SEND_DEBUG] response status: 200
[QS_SEND_DEBUG] response body: {"ok":true,"id":"...","status":"sent"}
[QS_SEND_DEBUG] SUCCESS — messageId: ...
```

---

## Security Notes

- Admin token validated by the Netlify function (reads `x-admin-token` header)
- If token is missing or empty, returns `401 Unauthorized` JSON (never HTML, never redirect)
- Supabase service role key is only in Netlify/Supabase runtime — never in browser bundle
- Debug mode only activates with `?debug=1` query parameter

---

## Architecture After Fix

```
Browser (www.gappsy.com)
    │
    │  POST /api/admin/email/quick-sends/send  (same-origin, no CORS)
    ↓
Netlify Function: quick-send-proxy.ts
    │  validates admin token
    │  validates payload
    │
    ├──→ POST supabase.co/functions/v1/quick-send-create   (server-to-server)
    │       inserts email_messages row (status='queued')
    │       returns { id }
    │
    └──→ POST supabase.co/functions/v1/quick-send-send     (server-to-server)
            reads SMTP config from env
            sends email via SMTP
            updates row status='sent'
            returns { success, messageId }
    │
    ↓
Browser receives: { ok: true, id: "...", status: "sent" }
```

**Before**: Browser → cross-origin → Supabase (CORS + JWT issues → silent failure)
**After**: Browser → same-origin → Netlify → Supabase (no CORS, always returns JSON)
