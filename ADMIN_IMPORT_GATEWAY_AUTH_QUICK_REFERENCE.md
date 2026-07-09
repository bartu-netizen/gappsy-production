# Import Gateway Auth Fix - Quick Reference

**Problem:** Import button appeared to do nothing
**Root Cause:** Internal function calls missing gateway auth headers
**Status:** ✅ FIXED AND DEPLOYED

---

## What Was Wrong

```typescript
// ❌ BROKEN - Missing gateway auth
fetch(url, {
  headers: {
    "x-admin-token": "internal-server",
    "x-admin-secret": secret,
  }
});

// Gateway returns: 401 Missing authorization header
```

## What's Fixed

```typescript
// ✅ FIXED - Includes gateway auth
import { getInternalFunctionHeaders } from "../_shared/adminSession.ts";

const headers = getInternalFunctionHeaders();
// Returns:
// {
//   'Authorization': 'Bearer <service_role_key>',
//   'apikey': '<service_role_key>',
//   'x-admin-token': 'internal-server',
//   'x-admin-secret': '<secret>',
//   'Content-Type': 'application/json'
// }

fetch(url, { headers });
```

---

## The Shared Helper

**Location:** `supabase/functions/_shared/adminSession.ts`

```typescript
export function getInternalFunctionHeaders(): Record<string, string> {
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
  const internalSecret = getInternalAdminSecret();

  return {
    'Authorization': `Bearer ${serviceRoleKey}`,  // Gateway auth
    'apikey': serviceRoleKey,                      // Gateway auth
    'x-admin-token': 'internal-server',            // Internal auth
    'x-admin-secret': internalSecret,              // Internal auth
    'Content-Type': 'application/json',
  };
}
```

---

## Fixed Internal Calls

1. **Upload → Parse**
   - `other-agencies-import-upload` → `other-agencies-import-parse`

2. **Parse → Worker**
   - `other-agencies-import-parse` → `other-agencies-import-worker`

3. **Orchestrator → Processor**
   - `other-agencies-import-orchestrator-v2` → `other-agencies-import-processor-v2`

4. **Worker → Processor**
   - `other-agencies-import-worker` → `other-agencies-import-processor-v2`

5. **Finalize → ListClean**
   - `other-agencies-import-orchestrator-v2` → `other-agencies-listclean-process-queue`

---

## Test It Now

1. Go to `/wp-admin/other-agencies-import`
2. Upload a CSV file
3. Click "Start Import"
4. Watch diagnostics show real progress (no more "button goes blue" failure)

---

## Key Takeaway

**ALWAYS use `getInternalFunctionHeaders()` for ALL internal function-to-function calls.**

Never use raw `x-admin-token`/`x-admin-secret` headers alone for Supabase Function calls.
The gateway requires `Authorization` and `apikey` headers FIRST.
