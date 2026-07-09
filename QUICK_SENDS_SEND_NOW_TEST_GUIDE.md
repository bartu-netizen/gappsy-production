# Quick Sends - "Send Now" Testing Guide

## Quick Start Test (2 minutes)

### Test 1: Basic Send
```
1. Go to: https://www.gappsy.com/wp-admin/email/quick-sends
2. Click "New Quick Send" button
3. Fill in:
   - To Email: test@example.com (or your email)
   - Recipient Name: Test User
   - Subject: Test Email
4. Click "Next"
5. Paste any HTML or keep default
6. Click "Review"
7. Click "Send Now"
```

**Expected Result:** Modal closes, page redirects to tracking detail

**If fails:** See Debug Mode section below

### Test 2: Validation Test
```
1. Go to: https://www.gappsy.com/wp-admin/email/quick-sends
2. Click "New Quick Send"
3. Leave email BLANK
4. Click "Send Now"
```

**Expected Result:** Error: "Please fill in all required fields"

## Debug Mode Test (5 minutes)

Enable admin-only debug mode to see request/response details:

### Enable Debug Mode
```
1. Go to: https://www.gappsy.com/wp-admin/email/quick-sends?debug=1
```

Note the `?debug=1` at the end of URL.

### Send with Debug
```
1. Click "New Quick Send"
2. Fill in:
   - To Email: debug@test.com
   - Subject: Debug Test
   - Body: Test
3. Click through to Review
4. Click "Send Now"
```

**Expected if SUCCEEDS:**
- Modal closes normally
- No error shown

**Expected if FAILS:**
- Error message shows
- Below error: "Debug Info (admin only):" section
- Shows:
  - URL: `https://[...]/functions/v1/quick-send-create`
  - Method: `POST`
  - Status: `200` (success) or error code
  - Response: JSON response from server

### Example Debug Output

**Success Case:**
```
Debug Info (admin only):
URL: https://supabase-url/functions/v1/quick-send-create
Method: POST
Status: 200
Response: {"id": "abc-123", "status": "queued", ...}
```

**Error Case:**
```
Debug Info (admin only):
URL: https://supabase-url/functions/v1/quick-send-create
Method: POST
Status: 400
Response: {"error": "Invalid email address"}
```

## Full End-to-End Test (10 minutes)

### Setup
- Verify SMTP is configured
- Have a test email address ready

### Test Flow
```
1. Open: https://www.gappsy.com/wp-admin/email/quick-sends?debug=1
2. Click "New Quick Send"
3. Fill in:
   - To Email: your@email.com
   - Recipient Name: Your Name
   - Subject: Quick Send Test
4. Click "Next"
5. Keep default HTML or customize
6. Click "Review"
7. Review the preview
8. Click "Send Now"
```

### Verify Success
1. Modal should close
2. Should redirect to tracking detail page
3. Subject should match what you entered
4. Recipients should match what you entered
5. Status should be "sent"
6. Page should show "0 Opens, 0 Clicks"

### Verify Email Received
1. Check your email inbox for the message
2. Subject should match
3. Body should contain your HTML
4. Email should be from configured sender
5. Click a link in the email
6. Go back to tracking page
7. Check if click is recorded

## Error Scenarios & Fixes

### Scenario 1: "Failed to fetch" (Still Getting)
**Steps:**
1. Enable debug mode: add `?debug=1` to URL
2. Try sending again
3. Look at debug panel - what's the status code?

**If status is 401:**
- Edge function JWT setting wrong
- Solution: Functions need `verify_jwt=false`
- Status: Should be fixed by deployment

**If status is 404:**
- URL doesn't exist
- Check browser console for exact URL
- Verify function is deployed

**If status is 500:**
- Server error in function
- Check Supabase edge function logs
- See error details in debug panel

### Scenario 2: "Invalid email address"
**Steps:**
1. Check email format
2. Should be: `name@domain.com`
3. Not valid: `name@domain` (missing TLD)
4. Not valid: `@domain.com` (missing name)

**Fix:** Enter valid email format

### Scenario 3: "SMTP not configured"
**Steps:**
1. Go to `/wp-admin/email/settings`
2. Check if SMTP credentials filled in
3. Enter: Host, Port, Username, Password
4. Test connection
5. Return to Quick Sends
6. Try again

### Scenario 4: Modal doesn't close after "Send Now"
**Steps:**
1. Check browser console for errors
2. Enable debug mode
3. Look at Status code in debug panel
4. If 200: should be success, check page reload
5. If error: see error code section below

## Status Code Reference

### 200 - Success
Email created and sent successfully. Modal should close.

### 400 - Bad Request
Invalid input. Debug panel shows which field is wrong.
- Possible: Invalid email, missing fields, invalid HTML

### 401 - Unauthorized
Admin authentication failed.
- Check: Are you logged in?
- Check: Is admin token valid?

### 500 - Server Error
Error in edge function or SMTP provider.
- Check: Is SMTP configured?
- Check: Can database be accessed?
- Check: Supabase edge function logs

## Browser DevTools Tips

### View Network Request
1. Open DevTools (F12)
2. Go to Network tab
3. Click "Send Now"
4. Look for request to `quick-send-create`
5. Click it to see:
   - Request headers (including Authorization)
   - Request body (email, subject, etc)
   - Response headers (status, content-type)
   - Response body (JSON)

### View Console
1. Open DevTools (F12)
2. Go to Console tab
3. Try sending
4. Look for error messages
5. Copy full error for debugging

### Simulate Slow Network
1. DevTools → Network tab
2. Dropdown "Online" → select "Slow 3G"
3. Try sending
4. Should show loading state
5. Should eventually succeed or fail
6. Note the timeout behavior

## Smoke Test Checklist

- [ ] Can access /wp-admin/email/quick-sends
- [ ] "New Quick Send" button opens modal
- [ ] Modal has 3 steps: Form, Builder, Review
- [ ] Can fill form fields
- [ ] Can navigate between steps
- [ ] Can send with valid data
- [ ] Modal closes on success
- [ ] Redirected to tracking page
- [ ] Email appears in list
- [ ] Status shows "sent"
- [ ] Can view tracking page
- [ ] Opens/clicks show 0 initially
- [ ] Error banner shows on invalid data
- [ ] Debug mode shows details

## Performance Checks

### Check Send Speed
1. Enable DevTools Network
2. Disable throttling
3. Send test email
4. Check duration:
   - Expected: < 2 seconds
   - Good: < 1 second
   - Bad: > 5 seconds

### Check List Load Speed
1. Go to Quick Sends list
2. Note load time
3. Expected: Immediate
4. Should show previous emails instantly

## Production Readiness Checklist

- [ ] No "Failed to fetch" errors
- [ ] All errors show clear messages
- [ ] Debug mode works correctly
- [ ] Debug panel only shows when ?debug=1
- [ ] Emails send successfully
- [ ] Status updates correctly
- [ ] Tracking page loads
- [ ] No console errors
- [ ] No network errors (404, 401, 500)
- [ ] Build succeeds
- [ ] All tests pass

## Next Steps

1. Run smoke tests above
2. Fix any issues found
3. Test with real SMTP
4. Test with real email addresses
5. Monitor for a day
6. Production ready!

## Support

**Still seeing "Failed to fetch"?**
1. Enable debug mode: `?debug=1`
2. Try sending again
3. Check debug panel status code
4. See "Error Scenarios" section above
5. Check edge function logs in Supabase dashboard

**Email not sending?**
1. Check SMTP configured
2. Check email format valid
3. Enable debug mode
4. Look at status code (200 = sent, 500 = SMTP error)

**Need help?**
Check browser DevTools:
1. Network tab: What status code?
2. Console tab: What errors?
3. Response body: What error message?
