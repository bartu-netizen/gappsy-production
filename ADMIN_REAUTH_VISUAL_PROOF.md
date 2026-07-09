# Admin Re-Auth Flow - Visual Proof

## What the User Sees Now

### BEFORE (Dead-End State) ❌
```
┌─────────────────────────────────────────────────┐
│  Other Agencies Import                          │
│  Bulk import agencies per state from CSV...     │
├─────────────────────────────────────────────────┤
│  Upload | Import History | Manage Agencies      │
├─────────────────────────────────────────────────┤
│                                                  │
│  ⚠️  Error                                       │
│     Your session has expired.                   │
│     Please log in again.                        │
│                                                  │
│  [State Dropdown ▼]                             │
│  [Format Selection]                             │
│  [Choose File...]                               │
│  [Import Now] ← DOES NOTHING                    │
│                                                  │
│  User is STUCK - no way to log in!              │
└─────────────────────────────────────────────────┘
```

### AFTER (Recovery Flow) ✅
```
┌─────────────────────────────────────────────────┐
│  Other Agencies Import                          │
│  Bulk import agencies per state from CSV...     │
├─────────────────────────────────────────────────┤
│  Upload | Import History | Manage Agencies      │
├─────────────────────────────────────────────────┤
│                                                  │
│  ⚠️  Session Expired                            │
│     Your admin session has expired.             │
│     Please log in again to continue using       │
│     the import tools.                           │
│                                                  │
│     [🔒  Enter admin secret______] [Log In]     │
│                                                  │
│     User can LOG IN RIGHT HERE!                 │
│                                                  │
├─────────────────────────────────────────────────┤
│                                                  │
│  After successful login:                        │
│                                                  │
│  ℹ️  File Needs Re-selection                    │
│     For security reasons, please re-select      │
│     your file after logging in again.           │
│     [Dismiss]                                   │
│                                                  │
│  [State Dropdown ▼] ← PRESERVED                 │
│  [Format Selection] ← PRESERVED                 │
│  [Choose File...] ← Ready to reselect           │
│  [Import Now] ← WORKS AGAIN                     │
│                                                  │
└─────────────────────────────────────────────────┘
```

## Exact Code That Shows Re-Auth Card

### In `src/pages/AdminOtherAgenciesImportPage.tsx`:

```tsx
{needsReAuth && (
  <div className="mb-6">
    <AdminReAuthCard
      onSuccess={handleReAuthSuccess}
      message="Your admin session has expired. Please log in again to continue using the import tools."
    />
  </div>
)}
```

### The `AdminReAuthCard` Component:

```tsx
export default function AdminReAuthCard({ onSuccess, message }: AdminReAuthCardProps) {
  const { login } = useAdminSession();
  const [secret, setSecret] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!secret.trim()) {
      setError('Please enter the admin secret');
      return;
    }

    setIsLoading(true);
    setError('');

    const result = await login(secret.trim());

    if (result.ok) {
      setSecret('');
      onSuccess?.();
    } else {
      setError(result.error || 'Invalid secret');
    }

    setIsLoading(false);
  };

  return (
    <div className="bg-amber-50 border border-amber-200 rounded-lg p-6">
      <div className="flex gap-3 mb-4">
        <AlertTriangle className="w-6 h-6 text-amber-600 shrink-0" />
        <div>
          <h3 className="font-semibold text-amber-900">Session Expired</h3>
          <p className="text-sm text-amber-800 mt-1">
            {message || 'Your admin session has expired. Please log in again to continue.'}
          </p>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="mt-4">
        <div className="flex gap-2">
          <div className="relative flex-1">
            <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="password"
              value={secret}
              onChange={(e) => setSecret(e.target.value)}
              placeholder="Enter admin secret"
              className="w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent"
              disabled={isLoading}
              autoFocus
            />
          </div>
          <button
            type="submit"
            disabled={isLoading || !secret.trim()}
            className="px-4 py-2 bg-amber-600 text-white rounded-lg font-medium hover:bg-amber-700 disabled:bg-gray-400 disabled:cursor-not-allowed flex items-center gap-2 whitespace-nowrap"
          >
            {isLoading ? (
              <>
                <Loader className="w-4 h-4 animate-spin" />
                Logging in...
              </>
            ) : (
              'Log In'
            )}
          </button>
        </div>

        {error && (
          <p className="mt-2 text-sm text-red-600">{error}</p>
        )}
      </form>
    </div>
  );
}
```

## When Re-Auth Mode Triggers

### 1. Session Status Check
```typescript
useEffect(() => {
  if (status === 'invalid' && !needsReAuth) {
    setNeedsReAuth(true);  // ← Shows re-auth card
  } else if (status === 'valid' && needsReAuth) {
    setNeedsReAuth(false);  // ← Hides re-auth card
    setError('');
  }
}, [status, needsReAuth]);
```

### 2. Before Every Protected Action
```typescript
const handleImport = async () => {
  if (!token || status === 'invalid') {
    setNeedsReAuth(true);  // ← Shows re-auth card
    return;
  }

  const valid = await ensureValid();
  if (!valid) {
    setNeedsReAuth(true);  // ← Shows re-auth card
    return;
  }

  // ... proceed with import
};
```

### 3. On API Auth Errors
```typescript
if (!uploadResponse.ok) {
  const errorMsg = await parseApiError(uploadResponse);
  if (isAuthError(errorMsg, uploadResponse.status)) {
    setNeedsReAuth(true);  // ← Shows re-auth card
    setIsImporting(false);
    return;
  }
  throw new Error(`Upload failed: ${errorMsg}`);
}
```

## State Preservation Logic

```typescript
const handleReAuthSuccess = () => {
  setNeedsReAuth(false);  // Hide re-auth card
  setError('');           // Clear errors

  // File security handling
  if (file) {
    setFileNeedsReselect(true);  // Show info banner
    setFile(null);               // Clear file for security
    if (fileInputRef.current) {
      fileInputRef.current.value = '';
    }
  }

  // selectedState: PRESERVED ✅
  // mode: PRESERVED ✅
  // activeTab: PRESERVED ✅
  // filterState: PRESERVED ✅
  // searchQuery: PRESERVED ✅
  // statusFilter: PRESERVED ✅
};
```

## Testing the Flow

### Manual Test Steps:

1. **Navigate to page:**
   ```
   https://www.gappsy.com/wp-admin/other-agencies-import
   ```

2. **Login with admin secret**

3. **Force session expiry:**
   ```javascript
   // In browser console
   localStorage.removeItem('gappsy_admin_token');
   localStorage.removeItem('gappsy_admin_expiresAt');
   ```

4. **Try to import:**
   - Click on Upload tab
   - Select a state
   - Choose a file
   - Click "Import Now"

5. **Expected result:**
   - ✅ Amber re-auth card appears immediately
   - ✅ Password input field is auto-focused
   - ✅ Selected state is still visible
   - ✅ Selected format is still checked
   - ✅ No navigation required

6. **Enter admin secret and submit**

7. **Expected after login:**
   - ✅ Re-auth card disappears
   - ✅ Blue "file needs reselection" banner appears
   - ✅ State dropdown still shows selected value
   - ✅ Format radio still selected
   - ✅ Can select new file and import

## Coverage Across All Tabs

### Upload Tab
- `handleImport()` triggers re-auth on auth failure ✅
- File upload errors trigger re-auth on 401/403 ✅
- Polling errors trigger re-auth on 401/403 ✅

### Import History Tab
- Tab switch triggers `fetchJobs()` ✅
- `fetchJobs()` checks session before API call ✅
- 401/403 responses trigger re-auth ✅

### Manage Agencies Tab
- Tab switch triggers `fetchAgencies()` ✅
- `fetchAgencies()` checks session before API call ✅
- View/Edit/Delete all check session ✅
- All API errors trigger re-auth on 401/403 ✅

## Proof of No Dead-End State

**OLD CODE (Dead-End):**
```typescript
const valid = await ensureValid();
if (!valid) {
  setError('Your session has expired. Please log in again.');
  logout();  // Clears everything
  return;    // User is stuck
}
```

**NEW CODE (Recovery Path):**
```typescript
const valid = await ensureValid();
if (!valid) {
  setNeedsReAuth(true);  // Shows inline login form
  return;                // User can log in immediately
}
```

## Summary

The re-auth flow is now complete and production-ready:

✅ **Inline recovery UI** - Password input appears on the page
✅ **No navigation needed** - User stays on import page
✅ **State preservation** - Selections maintained across re-auth
✅ **Clear messaging** - Explains file reselection requirement
✅ **Comprehensive coverage** - All actions trigger re-auth mode
✅ **No dead-end states** - Always a path to recovery

The user will NEVER be stuck on "session expired" anymore.
