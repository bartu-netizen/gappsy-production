# ListClean Import - Code Changes Reference

## File: `supabase/functions/other-agencies-import-cleaned-results/index.ts`

### Change 1: Early Format Detection + Email Column Priority

**Location:** Lines 89-109

**Purpose:** Detect ListClean format first, then prioritize LC_Email over generic columns

**Before:**
```typescript
const emailIdx = findHeaderIndex(rawHeaders, ["email", "email_normalized", "lc_email"]);
const statusIdx = findHeaderIndex(rawHeaders, ["lc_status", "validation_status", "status"]);
const hasListCleanFields = findHeaderIndex(rawHeaders, ["lc_status", "lc_email", "lc_reason"]) >= 0;
const detectedFormat = hasListCleanFields ? "ListClean" : "Standard";
```

**After:**
```typescript
// Check if this is ListClean format first
const hasListCleanFields = findHeaderIndex(rawHeaders, ["lc_status", "lc_email", "lc_reason"]) >= 0;
const detectedFormat = hasListCleanFields ? "ListClean" : "Standard";

// For ListClean format, prioritize lc_email first
const emailIdx = hasListCleanFields
  ? findHeaderIndex(rawHeaders, ["lc_email", "email", "email_normalized"])
  : findHeaderIndex(rawHeaders, ["email", "email_normalized", "lc_email"]);
const statusIdx = findHeaderIndex(rawHeaders, ["lc_status", "validation_status", "status"]);
```

---

### Change 2-4: Match Detection (All 3 Paths)

**Paths affected:**
- Path 1: Match by email_id (Lines 250-272)
- Path 2: Match by agency_id + email_normalized (Lines 273-297)
- Path 3: Match by email_normalized only (Lines 298-321)

**Before (all paths):**
```typescript
const { error: updateError, count } = await supabase
  .from("other_agency_emails")
  .update({...})
  .eq("field", value)
  .select("id", { count: "exact" });

if (count && count > 0) {
  rowMatched = true;
  rowUpdatedCount = count;
}
```

**After (all paths):**
```typescript
const { error: updateError, data } = await supabase
  .from("other_agency_emails")
  .update({...})
  .eq("field", value)
  .select("id");

const matchedRows = data?.length || 0;
if (matchedRows > 0) {
  rowMatched = true;
  rowUpdatedCount = matchedRows;
}
```

**Key changes:**
- Destructure `data` instead of `count`
- Remove `{ count: "exact" }` option
- Use `data?.length || 0` for reliable detection

---

## File: `src/pages/AdminEmailCleaningExportPage.tsx`

### Change: Import Result Rendering

**Location:** Lines 1146-1213

**Before:**
```tsx
{importResult && (
  <div className="bg-green-50 border border-green-200 rounded-lg p-4">
    <CheckCircle className="w-5 h-5 text-green-600" />
    <p className="font-medium text-green-900">Import successful!</p>
    {/* Always green, even if 0 rows matched */}
  </div>
)}
```

**After:**
```tsx
{importResult && (
  <div className={`rounded-lg p-4 ${
    importResult.rows_updated === 0 && importResult.rows_unmatched > 0
      ? 'bg-red-50 border border-red-200'
      : 'bg-green-50 border border-green-200'
  }`}>
    {importResult.rows_updated === 0 && importResult.rows_unmatched > 0 ? (
      <>
        <AlertTriangle className="w-5 h-5 text-red-600" />
        <p className="font-medium text-red-900">Import failed - No rows matched</p>
      </>
    ) : (
      <>
        <CheckCircle className="w-5 h-5 text-green-600" />
        <p className="font-medium text-green-900">Import successful!</p>
      </>
    )}
    {/* Red when 0 matched, green when > 0 matched */}
  </div>
)}
```

**Key changes:**
- Conditional card background (red vs green)
- Conditional icon (AlertTriangle vs CheckCircle)
- Conditional title and message
- Conditional warning color (red if failed, yellow if partial)

---

## Summary of All Changes

| Component | Change | Result |
|-----------|--------|--------|
| Match Detection (Path 1) | count → data | Reliable email_id matching |
| Match Detection (Path 2) | count → data | Reliable agency+email matching |
| Match Detection (Path 3) | count → data | Reliable email-only matching (ListClean) |
| Column Detection | LC_Email first | Correct CSV parsing |
| Error Display | Red card on 0% | Clear failure indication |

---

## Deployment Status

- Backend: ✓ DEPLOYED (2026-03-10T13:15:31.098Z)
- Frontend: ✓ BUILD PASSING
- Build ID: 4hg5gp9x
