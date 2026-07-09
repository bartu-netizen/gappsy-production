# CSV Download Fixes - Code Reference

## File: `src/pages/AdminEmailCleaningExportPage.tsx`

### Change 1: handleExport() - Fix Regular Export Downloads

**Location:** Lines 226-290

**Issue:** Regular CSV download handler revokes blob URL immediately, causing download failures.

**Before:**
```typescript
const handleExport = async () => {
  if (!exportState) {
    setExportError('Please select a state');
    return;
  }

  if (!token) {
    setExportError('Authentication required - please login first');
    return;
  }

  setExporting(true);
  setExportError('');
  setExportResult(null);

  try {
    const params = new URLSearchParams({
      state: exportState,
      validation_status: exportStatus,
      format: 'csv',
    });

    const response = await fetch(
      `${SUPABASE_URL}/functions/v1/other-agencies-export-for-cleaning?${params}`,
      {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.error || errorData.message || 'Export failed');
    }

    const csv = await response.text();
    const blob = new Blob([csv], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `agencies-emails-${exportState}-${exportStatus}-${new Date().toISOString().split('T')[0]}.csv`;
    a.click();
    window.URL.revokeObjectURL(url);  // PROBLEM: Revokes too early

    const lines = csv.split('\n').length - 1;
    setExportResult({
      rows: lines,
      filename: a.download,
      timestamp: new Date().toISOString(),
    });
  } catch (err) {
    setExportError(err instanceof Error ? err.message : 'Export failed');
  } finally {
    setExporting(false);
  }
};
```

**After:**
```typescript
const handleExport = async () => {
  if (!exportState) {
    setExportError('Please select a state');
    return;
  }

  if (!token) {
    setExportError('Authentication required - please login first');
    return;
  }

  setExporting(true);
  setExportError('');
  setExportResult(null);

  try {
    const params = new URLSearchParams({
      state: exportState,
      validation_status: exportStatus,
      format: 'csv',
    });

    const response = await fetch(
      `${SUPABASE_URL}/functions/v1/other-agencies-export-for-cleaning?${params}`,
      {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.error || errorData.message || 'Export failed');
    }

    const csv = await response.text();
    const blob = new Blob([csv], { type: 'text/csv; charset=utf-8' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `agencies-emails-${exportState}-${exportStatus}-${new Date().toISOString().split('T')[0]}.csv`;
    document.body.appendChild(a);
    a.click();
    a.remove();

    // Delay revocation to ensure download completes
    setTimeout(() => {
      window.URL.revokeObjectURL(url);
    }, 5000);

    const lines = csv.split('\n').length - 1;
    setExportResult({
      rows: lines,
      filename: a.download,
      timestamp: new Date().toISOString(),
    });
  } catch (err) {
    setExportError(err instanceof Error ? err.message : 'Export failed');
  } finally {
    setExporting(false);
  }
};
```

**Key Changes:**
- Line 265: Changed MIME type to `'text/csv; charset=utf-8'`
- Line 270: Added `document.body.appendChild(a)`
- Line 272: Added `a.remove()`
- Lines 274-277: Added delayed revocation with 5s timeout

---

### Change 2: handleListcleanExport() - Fix ListClean Export Downloads

**Location:** Lines 293-366

**Issue:** ListClean CSV download handler revokes blob URL immediately, causing download failures.

**Before:**
```typescript
const handleListcleanExport = async () => {
  if (!exportState) {
    setListcleanError('Please select a state');
    return;
  }

  if (!token) {
    setListcleanError('Authentication required - please login first');
    return;
  }

  setListcleanExporting(true);
  setListcleanError('');
  setListcleanResult(null);

  try {
    const params = new URLSearchParams({
      state: exportState,
    });

    const response = await fetch(
      `${SUPABASE_URL}/functions/v1/other-agencies-export-listclean-csv?${params}`,
      {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.error || errorData.message || 'Export failed');
    }

    const csv = await response.text();
    const statsHeader = response.headers.get('X-Export-Stats');
    const stats = statsHeader ? JSON.parse(statsHeader) : null;

    const blob = new Blob([csv], { type: 'text/csv; charset=utf-8' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    const dateStr = new Date().toISOString().split('T')[0];
    a.download = `listclean-export-${exportState}-${dateStr}.csv`;
    a.click();
    window.URL.revokeObjectURL(url);  // PROBLEM: Revokes too early

    const lines = csv.split('\n').length - 1;
    setListcleanResult({
      rows: lines,
      filename: a.download,
      stats: stats || {
        total_emails: 0,
        invalid_emails: 0,
        duplicates_removed: 0,
        already_verified: 0,
        risky_patterns: 0,
        final_export: lines,
      },
    });
  } catch (err) {
    setListcleanError(err instanceof Error ? err.message : 'Export failed');
  } finally {
    setListcleanExporting(false);
  }
};
```

**After:**
```typescript
const handleListcleanExport = async () => {
  if (!exportState) {
    setListcleanError('Please select a state');
    return;
  }

  if (!token) {
    setListcleanError('Authentication required - please login first');
    return;
  }

  setListcleanExporting(true);
  setListcleanError('');
  setListcleanResult(null);

  try {
    const params = new URLSearchParams({
      state: exportState,
    });

    const response = await fetch(
      `${SUPABASE_URL}/functions/v1/other-agencies-export-listclean-csv?${params}`,
      {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'x-admin-token': token,
        },
      }
    );

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.error || errorData.message || 'Export failed');
    }

    const csv = await response.text();
    const statsHeader = response.headers.get('X-Export-Stats');
    const stats = statsHeader ? JSON.parse(statsHeader) : null;

    const blob = new Blob([csv], { type: 'text/csv; charset=utf-8' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    const dateStr = new Date().toISOString().split('T')[0];
    a.download = `listclean-export-${exportState}-${dateStr}.csv`;
    document.body.appendChild(a);
    a.click();
    a.remove();

    // Delay revocation to ensure download completes
    setTimeout(() => {
      window.URL.revokeObjectURL(url);
    }, 5000);

    const lines = csv.split('\n').length - 1;
    setListcleanResult({
      rows: lines,
      filename: a.download,
      stats: stats || {
        total_emails: 0,
        invalid_emails: 0,
        duplicates_removed: 0,
        already_verified: 0,
        risky_patterns: 0,
        final_export: lines,
      },
    });
  } catch (err) {
    setListcleanError(err instanceof Error ? err.message : 'Export failed');
  } finally {
    setListcleanExporting(false);
  }
};
```

**Key Changes:**
- Line 339: Added `document.body.appendChild(a)`
- Line 341: Added `a.remove()`
- Lines 343-346: Added delayed revocation with 5s timeout

---

### Change 3: Import Result UI - Clarify CSV vs DB Rows

**Location:** Lines 1175-1190

**Issue:** UI shows "58 of 57 rows updated" when rows_updated > total_rows (one CSV email matched multiple DB rows).

**Before:**
```tsx
) : (
  <>
    <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
    <div className="flex-1">
      <p className="font-medium text-green-900">Import successful!</p>
      <p className="text-sm text-green-700">
        {importResult.rows_updated} of {importResult.total_rows} rows updated
      </p>
    </div>
  </>
)}
```

**After:**
```tsx
) : (
  <>
    <CheckCircle className="w-5 h-5 text-green-600 shrink-0 mt-0.5" />
    <div className="flex-1">
      <p className="font-medium text-green-900">Import successful!</p>
      <p className="text-sm text-green-700">
        {importResult.rows_matched} of {importResult.total_rows} CSV rows matched
      </p>
      {importResult.rows_updated > importResult.rows_matched && (
        <p className="text-xs text-green-600 mt-1">
          {importResult.rows_updated} database rows updated
        </p>
      )}
    </div>
  </>
)}
```

**Key Changes:**
- Line 1181: Show `rows_matched` (CSV rows matched) instead of `rows_updated`
- Line 1181: Changed label to "CSV rows matched"
- Lines 1183-1187: Conditionally show database rows line if different from CSV rows

---

## Summary of All Changes

| Change | File | Lines | Type | Impact |
|--------|------|-------|------|--------|
| Download fix v1 | AdminEmailCleaningExportPage.tsx | 226-290 | Fix | Regular exports now work |
| Download fix v2 | AdminEmailCleaningExportPage.tsx | 293-366 | Fix | ListClean exports now work |
| UI clarification | AdminEmailCleaningExportPage.tsx | 1175-1190 | UX | Users understand results |

---

## Download Fix Pattern

This pattern should be used for ALL future CSV/file downloads:

```typescript
const blob = new Blob([content], { type: 'text/csv; charset=utf-8' });
const url = window.URL.createObjectURL(blob);
const a = document.createElement('a');
a.href = url;
a.download = filename;
document.body.appendChild(a);  // Append to DOM
a.click();
a.remove();  // Remove from DOM

setTimeout(() => {
  window.URL.revokeObjectURL(url);
}, 5000);  // Delay revocation
```

---

## Deployment Status

- Backend: No changes
- Frontend: ✓ UPDATED
- Build: ✓ PASSING (1m 4s)
- Build ID: qsdokz9a
- Timestamp: 2026-03-10T13:29:41.735Z
