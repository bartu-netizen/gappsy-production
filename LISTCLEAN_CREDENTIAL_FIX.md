# ListClean Permanent Fix: Host Normalization & Safe JSON Parsing

**Status:** ✅ IN DEVELOPMENT | **Priority:** CRITICAL | **Root Cause:** api.listclean.io returns HTML instead of JSON

---

## Problem Statement

Production errors show ListClean requests returning HTML (200 text/html) instead of JSON:

```
Error: ListClean batch submit failed (200) [content-type=text/html] from https://api.listclean.io/v1/verify/email/batch: <html><head>...
```

**Root Cause:** The `.io` domain is misconfigured or deprecated. ListClean's actual API endpoint is `api.listclean.xyz/v1`.

---

## Solution Summary

Updated `supabase/functions/_shared/listcleanClient.ts` with:

1. **Default base URL changed** from `https://api.listclean.io/v1` to `https://api.listclean.xyz/v1`
2. **Auto-rewrite deprecated .io URLs** to .xyz with warning logs
3. **Strict host validation** - only `api.listclean.xyz` allowed
4. **Safe JSON parsing helper** - detects HTML responses, non-JSON content-types, and parse errors with clear diagnostics
5. **Dual auth headers** - `X-Auth-Token` + `Bearer` token for compatibility
6. **Comprehensive error context** - shows status, content-type, and response preview

---

## Code Changes

### 1. Safe JSON Parser (NEW)

```typescript
async function parseJsonOrThrow(
  response: Response,
  context: string,
  requestUrl: string
): Promise<unknown>
```

**Behavior:**
- Reads content-type header
- Reads response body once (text)
- If status not OK → throw with status, content-type, body preview
- If response OK but content-type is not JSON → throw with content-type detail
- If JSON.parse fails → throw with preview
- Never exposes token in error messages

**Example Error Messages:**
```
ListClean batch submit returned non-JSON (200) [content-type=text/html] from https://api.listclean.io/v1/verify/email/batch: <html><head><title>Error</title>...
```

### 2. Base URL Normalization (NEW)

```typescript
function normalizeListCleanBaseUrl(baseUrl: string): string
```

**Behavior:**
- Trims whitespace
- Removes trailing slashes
- Detects `*.listclean.io` hosts and rewrites to `api.listclean.xyz/v1`
- Auto-appends `/v1` if missing for `api.listclean.xyz`
- Logs warning: `[ListClean] Rewriting deprecated .io base URL to .xyz: https://api.listclean.xyz/v1`

**Examples:**
```
https://api.listclean.io/v1      → https://api.listclean.xyz/v1
https://api.listclean.io         → https://api.listclean.xyz/v1
https://listclean.io             → https://api.listclean.xyz/v1
https://api.listclean.xyz        → https://api.listclean.xyz/v1
```

### 3. Enhanced getListCleanConfig (UPDATED)

```typescript
function getListCleanConfig()
```

**New Behavior:**
- Default: `https://api.listclean.xyz/v1` (was `.io`)
- Normalizes base URL if provided
- Validates URL format (malformed URLs fail early)
- **NEW:** Strict host check - only allows `api.listclean.xyz`
  - Rejects any other host with clear error: `ListClean base URL host is not allowed: {host}. Expected api.listclean.xyz`
- Trims whitespace from token and URL
- Clear error if token missing after trim

### 4. Updated All API Calls (CRITICAL)

All ListClean fetch functions now use:
- Safe JSON parser (`parseJsonOrThrow`)
- Dual auth headers: `X-Auth-Token` + `Authorization: Bearer`
- `Accept: application/json` header

**Functions Updated:**
- `listcleanVerifyBatch`
- `listcleanGetList`
- `listcleanDownloadListJson`
- `listcleanGetCredits`

### 5. Token Security

- Token is NEVER logged or exposed in error messages
- Both auth headers included for ListClean compatibility
- Token trimmed to catch whitespace issues early

---

## Expected Outcomes

### Before (OLD)
```
Request to: https://api.listclean.io/v1/verify/email/batch
Response: 200 text/html
Error: Unexpected token '<', "<html><he"... is not valid JSON
(Generic, unhelpful error)
```

### After (NEW)
```
Request to: https://api.listclean.xyz/v1/verify/email/batch (auto-rewritten from .io)
Response: 200 application/json { "list_id": 12345, ... }
Result: ✅ Success

OR if still receives HTML:

Response: 200 text/html <html>...
Error: ListClean batch submit returned non-JSON (200) [content-type=text/html] from https://api.listclean.xyz/v1/verify/email/batch: <html><head><title>Error</title>...
(Crystal clear - you can see it's returning HTML!)
```

---

## Security & Robustness

- ✅ Fails early with malformed URLs
- ✅ Rejects hosts other than `api.listclean.xyz` (prevents typos)
- ✅ Auto-rewrites deprecated `.io` to `.xyz`
- ✅ Token never exposed in logs or errors
- ✅ All responses validated for JSON before parsing
- ✅ Content-type header checked before JSON.parse
- ✅ Response preview limited to 250 chars (safe logging)

---

## Deployment Checklist

### BEFORE DEPLOYING

**In Supabase/Bolt Secrets Dashboard:**
- [ ] Delete `LISTCLEAN_API_BASE_URL` entirely **OR** set to `https://api.listclean.xyz/v1`
- [ ] Keep `Gappsy_Bolt_ListClean` (token) unchanged
- [ ] Delete any `api.listclean.io` references from secrets

### FUNCTIONS TO REDEPLOY

All functions importing `_shared/listcleanClient.ts`:
- [ ] `other-agencies-listclean-process-queue`
- [ ] `listclean-credits-status`
- [ ] `listclean-credits-monitor`
- [ ] `listclean-unknown-reprocess`

### VERIFICATION

After deployment:
1. Monitor logs for `[ListClean] Rewriting deprecated .io base URL` warnings
2. Verify batch submissions to `api.listclean.xyz` succeed
3. Verify error messages show clear content-type/parse diagnostics
4. Verify no more "is not valid JSON" errors on HTML responses

---

## Backward Compatibility

- ✅ Auto-rewrites `.io` URLs (zero configuration needed)
- ✅ Both auth headers sent (compatible with ListClean variants)
- ✅ Fallback JSON parsing handles different response formats
- ✅ No breaking changes to queue retry logic

---

**Status:** ✅ IMPLEMENTATION COMPLETE | **Ready for Testing:** YES

