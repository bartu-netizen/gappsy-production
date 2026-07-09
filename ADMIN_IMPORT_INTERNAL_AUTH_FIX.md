# Admin Import Pipeline - Internal Auth Fixed

## ROOT CAUSE IDENTIFIED

The diagnostics panel revealed the exact failure:
```
Phase: UPLOADING
Upload Status: 500
Last Error: Parse trigger failed: 401 - {"error":"INVALID_TOKEN","message":"malformed"}
```

**The problem:** Internal server-to-server auth used inconsistent secret sources.

## THE FIX

### Canonical Secret Resolver
Created ONE function that all import pipeline functions use:

```typescript
export function getInternalAdminSecret(): string {
  const key = Deno.env.get('ADMIN_IMPORT_SECRET')
    || Deno.env.get('ADMIN_SESSION_SIGNING_KEY')
    || Deno.env.get('ADMIN_SECRET')
    || '';
  if (!key) throw new Error('No internal admin secret configured');
  return key;
}
```

## FUNCTIONS UPDATED

1. **adminSession.ts** - Added canonical resolver
2. **upload** - Uses `getInternalAdminSecret()`
3. **parse** - Uses `getInternalAdminSecret()`
4. **worker** - Uses shared validation + resolver
5. **processor-v2** - Uses shared validation
6. **orchestrator-v2** - Uses `getInternalAdminSecret()`

## DEPLOYMENT

All functions deployed successfully:
```
✅ other-agencies-import-upload
✅ other-agencies-import-parse
✅ other-agencies-import-worker
✅ other-agencies-import-processor-v2
✅ other-agencies-import-orchestrator-v2
```

Build ID: ggbpl568
Timestamp: 2026-03-13T21:41:34.299Z

## EXPECTED RESULT

Parse trigger should now return 200 instead of 401.
Jobs should progress: staged → parsing → processing → completed.
Diagnostics panel should show no auth errors.
