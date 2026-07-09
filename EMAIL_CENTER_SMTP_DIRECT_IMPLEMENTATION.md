# Email Center - Direct SMTP Implementation

## Overview

Complete redesign of Email Center to use direct SMTP testing via Netlify Functions with nodemailer. **No Supabase edge functions required.**

## What Changed

### Architecture Shift

**BEFORE (Old System):**
```
Browser → /wp-admin/api/email-center (Netlify proxy)
        → Supabase Edge Function (email-center)
        → SMTP via Resend/Nodemailer
```

**AFTER (New System):**
```
Browser → /wp-admin/api/smtp-test (Netlify function)
        → Direct SMTP via Nodemailer
```

**Benefits:**
- ✅ No Supabase edge function dependency
- ✅ No upstream connectivity issues
- ✅ Simpler architecture
- ✅ Direct SMTP control
- ✅ Works entirely on gappsy.com domain

## Files Created/Modified

### 1. New Netlify Function: `netlify/functions/smtp-test.ts`

**Actions:**
- `status` - Check which SMTP environment variables are configured
- `sendTest` - Send a test email via SMTP

**Environment Variables Required:**
```
SMTP_HOST=your-smtp-server.com
SMTP_PORT=587
SMTP_USERNAME=your-username
SMTP_PASSWORD=your-password
SMTP_FROM_SUPPORT=support@gappsy.com
SMTP_INTERNAL_EMAIL=bartu@gappsy.com
```

**Example Request (Status Check):**
```bash
curl -X POST https://gappsy.com/wp-admin/api/smtp-test \
  -H "Content-Type: application/json" \
  -d '{"action":"status"}'
```

**Example Response:**
```json
{
  "ok": true,
  "action": "status",
  "smtp": {
    "host": true,
    "port": true,
    "username": true,
    "password": true,
    "fromSupport": true,
    "internalEmail": true
  },
  "allConfigured": true
}
```

**Example Request (Send Test):**
```bash
curl -X POST https://gappsy.com/wp-admin/api/smtp-test \
  -H "Content-Type: application/json" \
  -d '{
    "action": "sendTest",
    "to": "test@example.com",
    "subject": "Test Email",
    "text": "Plain text body",
    "html": "<h1>HTML body</h1>"
  }'
```

**Example Response:**
```json
{
  "ok": true,
  "action": "sendTest",
  "messageId": "<abc123@smtp.server>",
  "accepted": ["test@example.com"],
  "to": "test@example.com",
  "subject": "Test Email"
}
```

### 2. Updated: `src/pages/WpAdminEmailCenterPage.tsx`

**Complete Redesign:**
- Removed all Supabase edge function calls
- Removed proxy/upstream check logic
- Removed backend template fetching
- Added local template definitions
- Simplified to status check + send test
- Clean, minimal UI

**Local Templates:**
```typescript
const LOCAL_TEMPLATES = [
  { key: 'basic', label: 'Basic Test Email', description: 'Simple test message' },
  { key: 'welcome', label: 'Welcome Email', description: 'Welcome message for new users' },
  { key: 'notification', label: 'Notification', description: 'Generic notification template' },
];
```

**UI Features:**
1. **SMTP Status Section**
   - Shows which environment variables are configured
   - Green/red indicators for each variable
   - Overall status (Fully Configured / Incomplete)
   - Refresh button to re-check status

2. **Send Test Email Section**
   - Template selector (local templates)
   - Email recipient field
   - Send button (disabled if SMTP not fully configured)
   - Success/error alerts

3. **Configuration Instructions**
   - Step-by-step guide to configure SMTP in Bolt Secrets
   - Example values for each environment variable

### 3. Updated: `public/_redirects`

Added routing for SMTP test endpoint:
```
/wp-admin/api/smtp-test  /.netlify/functions/smtp-test  200
```

### 4. Updated: `package.json`

Added nodemailer dependencies:
```json
{
  "dependencies": {
    "nodemailer": "^6.9.x"
  },
  "devDependencies": {
    "@types/nodemailer": "^6.4.x"
  }
}
```

## Configuration Guide

### Step 1: Add SMTP Credentials to Bolt Secrets

Go to Bolt Dashboard and add these environment variables:

```
SMTP_HOST=smtp.your-provider.com
SMTP_PORT=587
SMTP_USERNAME=your-smtp-username
SMTP_PASSWORD=your-smtp-password
SMTP_FROM_SUPPORT=support@gappsy.com
SMTP_INTERNAL_EMAIL=bartu@gappsy.com
```

**Common SMTP Providers:**

| Provider | Host | Port | Security |
|----------|------|------|----------|
| Gmail | smtp.gmail.com | 587 | STARTTLS |
| SendGrid | smtp.sendgrid.net | 587 | STARTTLS |
| Mailgun | smtp.mailgun.org | 587 | STARTTLS |
| AWS SES | email-smtp.region.amazonaws.com | 587 | STARTTLS |
| Outlook | smtp-mail.outlook.com | 587 | STARTTLS |

### Step 2: Deploy

After adding secrets, deploy the project. The build will include the new SMTP function.

### Step 3: Test

1. Visit: `https://gappsy.com/wp-admin/email-center`
2. Login with admin secret
3. Check SMTP status - should show all green
4. Enter test email address
5. Click "Send Test Email"
6. Check inbox for test email

## Build Information

**Build ID:** `4odqk219`
**Timestamp:** `2026-01-17T23:37:23.896Z`
**Status:** ✅ Successful

**Changes:**
- Added nodemailer package
- Created smtp-test Netlify function
- Completely rewrote Email Center page
- Updated redirects

## API Reference

### POST /wp-admin/api/smtp-test

**Action: status**

Check which SMTP environment variables are configured.

**Request:**
```json
{
  "action": "status"
}
```

**Response:**
```json
{
  "ok": true,
  "action": "status",
  "smtp": {
    "host": boolean,
    "port": boolean,
    "username": boolean,
    "password": boolean,
    "fromSupport": boolean,
    "internalEmail": boolean
  },
  "allConfigured": boolean
}
```

**Action: sendTest**

Send a test email via SMTP.

**Request:**
```json
{
  "action": "sendTest",
  "to": "recipient@example.com",
  "subject": "Email subject",
  "text": "Plain text body",
  "html": "<p>HTML body</p>"
}
```

**Response (Success):**
```json
{
  "ok": true,
  "action": "sendTest",
  "messageId": "<message-id@smtp>",
  "accepted": ["recipient@example.com"],
  "to": "recipient@example.com",
  "subject": "Email subject"
}
```

**Response (Error):**
```json
{
  "ok": false,
  "error": "Error message",
  "details": "Detailed error information"
}
```

## Testing After Deploy

### 1. Quick Status Check
```bash
curl -X POST https://gappsy.com/wp-admin/api/smtp-test \
  -H "Content-Type: application/json" \
  -d '{"action":"status"}'
```

Expected: `"allConfigured": true` if all SMTP vars are set

### 2. Send Test Email
```bash
curl -X POST https://gappsy.com/wp-admin/api/smtp-test \
  -H "Content-Type: application/json" \
  -d '{
    "action":"sendTest",
    "to":"bartu@gappsy.com",
    "subject":"SMTP Test",
    "text":"Test email",
    "html":"<p>Test email</p>"
  }'
```

Expected: `"ok": true` and email delivery

### 3. Test via UI
1. Go to: https://gappsy.com/wp-admin/email-center
2. Should see green status indicators (if SMTP configured)
3. Select template, enter email, click Send
4. Should see success message
5. Check inbox for test email

## Troubleshooting

### Issue: Status shows "SMTP Incomplete"

**Solution:** Add missing environment variables in Bolt Secrets and redeploy.

### Issue: Send fails with "SMTP not configured"

**Solution:** Not all required SMTP variables are set. Check status response to see which are missing.

### Issue: Send fails with SMTP error

**Possible causes:**
- Wrong SMTP credentials
- Wrong host/port
- Firewall blocking SMTP traffic
- Authentication method not supported

**Debug steps:**
1. Verify credentials with your SMTP provider
2. Try port 465 (SSL) or 587 (STARTTLS)
3. Check Netlify function logs for detailed error
4. Test SMTP credentials with a mail client first

### Issue: Email sent but not received

**Check:**
1. Spam folder
2. SMTP provider dashboard for delivery status
3. From address might be flagged as spam
4. Check messageId in response and track in SMTP logs

## Security Notes

**Safe Practices:**
- ✅ SMTP credentials stored as environment variables (not in code)
- ✅ CORS restricted to gappsy.com origin
- ✅ No credentials returned in status response (only booleans)
- ✅ Admin secret check on frontend page access

**What's Public:**
- Email templates (basic, welcome, notification)
- SMTP configuration status (which vars exist, not values)
- Test email functionality (sends to user-specified address)

**What's Private:**
- SMTP credentials (never exposed)
- Admin access (requires localStorage secret)

## Removed Dependencies

These are no longer needed:
- ❌ Supabase edge function: `email-center`
- ❌ Email center proxy functions
- ❌ Upstream connectivity checks
- ❌ Backend template management
- ❌ Template preview from backend
- ❌ Events matrix from backend

## Migration Notes

**Old URLs (Deprecated):**
- `/wp-admin/api/email-center` (now unused)
- `/wp-admin/api/email-center-upstream-check` (now unused)
- `/wp-admin/api/email-center-probe` (now unused)

**New URL:**
- `/wp-admin/api/smtp-test` (replaces all of above)

**Frontend Changes:**
- No more proxy wrapper responses
- Direct function responses
- Simpler error handling
- No Supabase client needed

## What Works Now

After deploy with SMTP configured:

1. ✅ Visit /wp-admin/email-center
2. ✅ See SMTP status (all green if configured)
3. ✅ Select email template
4. ✅ Enter recipient email
5. ✅ Click "Send Test Email"
6. ✅ Email delivers successfully
7. ✅ Beautiful HTML email template
8. ✅ No external dependencies
9. ✅ No upstream errors
10. ✅ Works entirely on gappsy.com

## Summary

**What Changed:**
- Complete redesign from Supabase edge functions to direct Netlify functions
- Removed all upstream connectivity complexity
- Simplified to 2 actions: status check + send test
- Local template definitions (no backend needed)
- Clean, focused UI

**Result:**
- Simple, reliable SMTP testing tool
- No Supabase edge function required
- Works immediately after SMTP configuration
- Zero external dependencies for email center
- Clean separation of concerns

**Next Steps:**
1. Deploy this build
2. Add SMTP credentials to Bolt Secrets
3. Test at /wp-admin/email-center
4. Send test emails successfully

The Email Center is now a standalone, self-contained SMTP testing tool that works entirely within the Netlify/Bolt infrastructure.
