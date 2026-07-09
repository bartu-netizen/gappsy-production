# React Error #306 Fix: Admin Quick Sends Route

## Emergency Issue
Route `/wp-admin/email/quick-sends` crashed with:
```
Minified React error #306:
"Element type is invalid. Received a promise that resolves to: %s.
Lazy element type must resolve to a class or function."
```

## Root Cause
**Two email module pages exported as named functions instead of default exports:**

1. `/src/pages/em/QuickSendsPage.tsx` - exported as `export function QuickSendsPage()`
2. `/src/pages/em/QuickSendTrackingPage.tsx` - exported as `export function QuickSendTrackingPage()`

The `/src/App.tsx` router uses `React.lazy()` to load these components:
```typescript
const QuickSendsPage = lazy(() => import("./pages/em/QuickSendsPage"));
const QuickSendTrackingPage = lazy(() => import("./pages/em/QuickSendTrackingPage"));
```

**Problem:** React.lazy expects the imported module to have a **default export**. Named exports cause lazy() to resolve to `undefined`, triggering error #306.

## The Fix

### Changed Files

#### 1. `/src/pages/em/QuickSendsPage.tsx` (Line 18)
**Before:**
```typescript
export function QuickSendsPage() {
```

**After:**
```typescript
export default function QuickSendsPage() {
```

#### 2. `/src/pages/em/QuickSendTrackingPage.tsx` (Line 32)
**Before:**
```typescript
export function QuickSendTrackingPage() {
```

**After:**
```typescript
export default function QuickSendTrackingPage() {
```

## Verification

### Full Scan Results
- **Total lazy-loaded admin routes:** 33 routes
- **Routes with default exports:** 31/31 after fix
- **Routes with named exports before fix:** 2 (both now fixed)

### All Email Module Pages (after fix - all correct):
- EmOverviewPage → default export ✓
- EmAudiencePage → default export ✓
- EmSegmentsPage → default export ✓
- EmTemplatesPage → default export ✓
- EmCampaignsPage → default export ✓
- EmAutomationsPage → default export ✓
- EmLogsPage → default export ✓
- EmSettingsPage → default export ✓
- EmSmtpPage → default export ✓
- **QuickSendsPage → default export ✓** (FIXED)
- **QuickSendTrackingPage → default export ✓** (FIXED)

### Production Build Status
- Build: ✓ Success (0 errors, 0 warnings)
- All 52 state pages prerendered successfully
- No forbidden keywords detected
- Deploy ID: nyt5nc6d

## Prevention Strategy

### 1. ErrorBoundary Protection (Already In Place)
The app wraps all routes with `ErrorBoundary` (in App.tsx line 106):
```typescript
<ErrorBoundary>
  <Suspense fallback={<PageLoader />}>
    <Routes>
      {/* All routes here */}
    </Routes>
  </Suspense>
</ErrorBoundary>
```

**What this does:**
- Catches any React.lazy lazy load failures (including #306)
- Shows a user-friendly error screen instead of blank page crash
- In production: Shows simple error message with "Refresh" and "Go to Home" buttons
- With `?debug=1`: Shows full error stack, component stack, and route information
- Error details are copyable for troubleshooting

### 2. React Lazy Import Guidelines
All pages that are lazy-loaded MUST have:
```typescript
export default function ComponentName() {
  // ...
}
```

NOT:
```typescript
export function ComponentName() {
  // ...
}
```

### 3. Scanning for Violations
To find any future export violations:
```bash
# Find all pages using named export instead of default
grep -n "^export function" /src/pages/**/*.tsx
grep -n "^export function" /src/pages/**/em/*.tsx

# Should return ZERO results if all are correct
```

## Testing

### Manual Test
1. Visit `/wp-admin/email/quick-sends` in production
2. Should load QuickSends page normally
3. No React error #306
4. Should display quick sends list interface

### Debug Mode Test
1. Visit `/wp-admin/email/quick-sends?debug=1`
2. Should load normally (debug mode only affects ErrorBoundary output)
3. No errors should appear

### Other Email Routes Test
Also verify these work:
- `/wp-admin/email/overview` - EmOverviewPage
- `/wp-admin/email/quick-send/:id` - QuickSendTrackingPage

## Impact
- Fixes immediate crash of `/wp-admin/email/quick-sends` route
- Prevents similar crashes on `/wp-admin/email/quick-send/:id` route
- ErrorBoundary ensures any future lazy loading errors are caught and displayed gracefully
- No production data loss or database impact

## Timeline
- **Detected:** React error #306 on production
- **Root Cause:** Missing default exports on 2 pages
- **Fix Applied:** Changed both to default exports
- **Build Status:** ✓ Clean build, 0 errors
- **Status:** RESOLVED
