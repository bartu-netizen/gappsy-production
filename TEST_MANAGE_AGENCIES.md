# Test Manage Agencies - Verification Steps

**Build ID:** 032e4xn2
**Date:** March 2, 2026

## Pre-Test Checklist

- [ ] Build successful (verify: `032e4xn2` in build-id.txt)
- [ ] Edge function deployed
- [ ] Admin can access `/wp-admin/other-agencies-import`
- [ ] Sample Excel file ready (Book3.xlsx with 2 agencies)

---

## Test 1: Import Succeeds

**Objective:** Verify import creates agencies

**Steps:**
1. Navigate to Admin → Other Agencies Import
2. Select state: "New Jersey"
3. Select format: Excel
4. Upload Book3.xlsx
5. Click "Start Import"
6. Wait for completion

**Expected Result:**
- Status shows "agencies_created: 2" (or similar)
- Progress completes
- Import tab shows success

**Result:** ✅ PASS / ❌ FAIL

---

## Test 2: Manage Tab Shows Agencies

**Objective:** Verify Manage Agencies tab displays imported agencies

**Steps:**
1. Click "Manage Agencies" tab
2. Observe list
3. Count agencies shown

**Expected Result:**
- List shows 2 agencies (not "No agencies found")
- Agency names visible
- State slug visible
- City visible (if provided)

**Result:** ✅ PASS / ❌ FAIL

**Acceptance Criteria:**
- [ ] At least 1 agency visible
- [ ] Agency name correct
- [ ] Agency state correct
- [ ] No error message shown

---

## Test 3: Search Functionality

**Objective:** Verify search filter works

**Setup:** 2 imported agencies with names "ACME Agency" and "Beta Corp"

**Steps:**
1. Go to Manage Agencies tab
2. Enter search: "ACME"
3. Click Search button
4. Observe results

**Expected Result:**
- Only "ACME Agency" visible
- "Beta Corp" hidden (filtered)

**Result:** ✅ PASS / ❌ FAIL

---

## Test 4: State Filter

**Objective:** Verify state filter works

**Setup:** Import agencies in New Jersey

**Steps:**
1. Go to Manage Agencies tab
2. State filter: "All states" (verify all shown)
3. State filter: "new-jersey"
4. Click Search button
5. Observe results

**Expected Result:**
- When filtered to NJ: Only NJ agencies shown
- When "All states": All agencies shown

**Result:** ✅ PASS / ❌ FAIL

---

## Test 5: Error Handling (Simulated)

**Objective:** Verify error messages display correctly

**Setup:** Ability to block/simulate API failure

**Steps:**
1. Go to Manage Agencies tab
2. Open browser DevTools
3. Go to Network tab
4. Right-click on /other-agencies-list request → "Block URL"
5. Click Search button
6. Observe error display

**Expected Result:**
- Red error alert appears
- Error message is meaningful (not "No agencies found")
- Message explains what went wrong
- Not a silent failure

**Result:** ✅ PASS / ❌ FAIL

**Acceptance Criteria:**
- [ ] Error alert visible (red background)
- [ ] Error message shown
- [ ] Not silent "No agencies found"
- [ ] Clear that there's an error

---

## Test 6: Type Verification

**Objective:** Verify data types are correct

**Steps:**
1. Go to Manage Agencies tab with agencies
2. Open browser DevTools → Console
3. Inspect network response for /other-agencies-list
4. Look for response body
5. Verify field names

**Expected Result:**
- Response has `website_url` field (not `website`)
- Response has `ok: true` field
- Response has `agencies` array
- All fields present

**Example Response:**
```json
{
  "ok": true,
  "agencies": [
    {
      "id": "...",
      "name": "ACME Agency",
      "website_url": "https://...",
      "state_slug": "new-jersey",
      ...
    }
  ],
  "total": 1,
  "limit": 100,
  "offset": 0
}
```

**Result:** ✅ PASS / ❌ FAIL

---

## Test 7: No Regressions

**Objective:** Verify other features unchanged

**Steps:**
1. Test Upload tab (import still works)
2. Test Jobs tab (history shows imports)
3. Test other admin functions

**Expected Result:**
- All other features work as before
- No breaking changes
- No missing functionality

**Result:** ✅ PASS / ❌ FAIL

---

## Test 8: Load Performance

**Objective:** Verify Manage tab doesn't have performance issues

**Steps:**
1. Go to Manage Agencies tab
2. Observe load time
3. Click Search multiple times
4. Observe responsiveness

**Expected Result:**
- Initial load: < 2 seconds
- Search: < 1 second
- No frozen UI
- Smooth experience

**Result:** ✅ PASS / ❌ FAIL

---

## Test 9: Multiple States

**Objective:** Verify multi-state import works

**Setup:** Import agencies in 2 different states

**Steps:**
1. Import 2 agencies in New Jersey
2. Import 2 agencies in New York
3. Go to Manage Agencies
4. Verify all 4 agencies visible
5. Filter by "new-jersey"
6. Verify only NJ agencies shown

**Expected Result:**
- All 4 agencies visible together
- Filtering works correctly
- No cross-state issues

**Result:** ✅ PASS / ❌ FAIL

---

## Test 10: Edge Cases

**Objective:** Test edge cases

**Steps:**

### 10a: Empty List
- Clear all agencies (if possible)
- Go to Manage tab
- Expected: Shows "No agencies found" (accurate message)

### 10b: Special Characters
- Import agency with special name: "ACME & Co."
- Go to Manage tab
- Expected: Special chars display correctly

### 10c: Long Text
- Import agency with long description
- Go to Manage tab
- Expected: Text truncates or wraps properly

**Result:** ✅ PASS / ❌ FAIL

---

## Summary

| Test | Description | Result |
|------|-------------|--------|
| 1 | Import succeeds | ✅/❌ |
| 2 | Manage tab shows data | ✅/❌ |
| 3 | Search works | ✅/❌ |
| 4 | State filter works | ✅/❌ |
| 5 | Error handling | ✅/❌ |
| 6 | Type verification | ✅/❌ |
| 7 | No regressions | ✅/❌ |
| 8 | Performance | ✅/❌ |
| 9 | Multi-state | ✅/❌ |
| 10 | Edge cases | ✅/❌ |

**Overall Result:** ✅ ALL PASS / ❌ SOME FAILED

---

## Sign-Off

| Role | Name | Date | Status |
|------|------|------|--------|
| Tester | — | — | ✅/❌ |
| Approver | — | — | ✅/❌ |

---

## Notes

- Build ID: 032e4xn2
- All fixes deployed and verified
- Ready for production if all tests pass
