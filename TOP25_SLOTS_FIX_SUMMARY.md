# Top 25 Slots Schema Fix - Quick Summary

**Status:** ✅ FIXED, DEPLOYED, BUILT
**Timestamp:** 2026-02-28T23:27:37Z

---

## The Problem

Smoke test and live activation were failing with:
```
Error: Could not find the 'source' column of 'top25_slots' in the schema cache
```

**Why:** Functions were writing invalid columns to `top25_slots`:
- ❌ `intro`
- ❌ `source`
- ❌ `description`
- ❌ `services`
- ❌ `website`
- ❌ `agency_id`
- ❌ `slot_status`

---

## The Solution

Created a **strict allowlist payload builder** that only allows valid columns:

| Allowed | Blocked |
|---------|---------|
| ✅ id | ❌ intro |
| ✅ state_slug | ❌ source |
| ✅ rank | ❌ description |
| ✅ is_paid | ❌ services |
| ✅ claimed_at | ❌ website |
| ✅ created_at | ❌ agency_id |

---

## Files Changed

| File | What | Status |
|------|------|--------|
| `supabase/functions/_shared/top25PayloadBuilder.ts` | New utility - strict column allowlist | ✅ Created |
| `supabase/functions/listing-smoke-test/index.ts` | Use payload builder for top25_slots | ✅ Deployed |
| `supabase/functions/listing-save-and-activate/index.ts` | Use payload builder for top25_slots | ✅ Deployed |

---

## How It Works

```typescript
// Before (BROKEN)
await db.upsert({
  id: "x",
  source: "test",      // ❌ ERROR: doesn't exist
  intro: "text",       // ❌ ERROR: doesn't exist
  // ... other invalid fields
});

// After (FIXED)
const payload = buildTop25SlotPayload({
  id: "x",
  source: "test",      // Automatically filtered
  intro: "text",       // Automatically filtered
});

await db.upsert(payload); // ✅ Only valid columns sent
```

---

## What's Fixed

✅ Smoke test no longer fails with schema errors
✅ Live activation no longer fails with schema errors
✅ Only valid columns ever reach the database
✅ Debug logging shows what was filtered

---

## Testing

**Test 1: Smoke Test**
1. `/wp-admin/thank-you-page`
2. Mode: Live
3. Preset: Valid Top 25
4. Run Smoke Test
**Result:** ✅ Passes (was failing before)

**Test 2: Live Activation**
1. `/wp-admin/thank-you-page`
2. Show Preview
3. Save & Activate
**Result:** ✅ Succeeds (was failing before)

---

## Build Status

✅ All TypeScript compiles
✅ No errors
✅ Build ID: mflogkc6

