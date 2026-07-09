# Email Center - Quick Test Guide

## Build Info
**Build ID:** `4odqk219`
**Timestamp:** `2026-01-17T23:37:23.896Z`
**Status:** ✅ Ready to Deploy

## What Was Done

### Complete Redesign
- ❌ Removed Supabase edge function dependency
- ✅ Created direct SMTP test via Netlify function
- ✅ Simplified UI to status check + send test
- ✅ Local template definitions (no backend)
- ✅ Works entirely on gappsy.com domain

### New Architecture
```
Browser → /wp-admin/api/smtp-test → Nodemailer → SMTP Server
```

## Before You Test

### Configure SMTP in Bolt Secrets

Add these environment variables in Bolt Dashboard:

```
SMTP_HOST=smtp.your-provider.com
SMTP_PORT=587
SMTP_USERNAME=your-username
SMTP_PASSWORD=your-password
SMTP_FROM_SUPPORT=support@gappsy.com
SMTP_INTERNAL_EMAIL=bartu@gappsy.com
```

**Then redeploy the site.**

## Quick Test (3 Steps)

### 1. Test API Status
```bash
curl -X POST https://gappsy.com/wp-admin/api/smtp-test \
  -H "Content-Type: application/json" \
  -d '{"action":"status"}'
```

**Expected:**
```json
{
  "ok": true,
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

If any are `false`, that environment variable is missing.

### 2. Test API Send
```bash
curl -X POST https://gappsy.com/wp-admin/api/smtp-test \
  -H "Content-Type: application/json" \
  -d '{
    "action":"sendTest",
    "to":"bartu@gappsy.com",
    "subject":"SMTP Test",
    "text":"This is a test",
    "html":"<h1>Test Email</h1><p>SMTP is working!</p>"
  }'
```

**Expected:**
```json
{
  "ok": true,
  "messageId": "<abc123@smtp>",
  "accepted": ["bartu@gappsy.com"]
}
```

Check inbox for test email.

### 3. Test UI
1. Go to: `https://gappsy.com/wp-admin/email-center`
2. Login with admin secret
3. Should see green checkmarks for all SMTP variables
4. Select template: "Basic Test Email"
5. Enter email: `bartu@gappsy.com`
6. Click "Send Test Email"
7. Should see: "Test email sent successfully"
8. Check inbox

## What You'll See

### SMTP Status Section
- 6 indicators (host, port, username, password, from, internal)
- Green = configured
- Red = missing
- Overall status banner

### Send Test Section
- Template dropdown (3 local templates)
- Email input field
- Send button (enabled only if SMTP fully configured)
- Success/error alerts

### Instructions Section
- Step-by-step SMTP configuration guide
- Example environment variables
- Deployment instructions

## If Something Fails

### Status Returns `false` for Some Variables
**Problem:** Environment variables not set
**Solution:** Add missing variables to Bolt Secrets and redeploy

### Send Fails with "SMTP not configured"
**Problem:** Not all required SMTP variables are set
**Solution:** Check status response, add missing variables

### Send Fails with SMTP Error
**Problem:** Wrong credentials or connection issue
**Solution:**
- Verify credentials with SMTP provider
- Try different port (465 for SSL, 587 for STARTTLS)
- Check Netlify function logs for detailed error

### Email Sent but Not Received
**Check:**
- Spam folder
- SMTP provider dashboard
- From address reputation
- Use messageId to track in SMTP logs

## Files Changed

### Created
- ✅ `netlify/functions/smtp-test.ts` - Direct SMTP test function
- ✅ `EMAIL_CENTER_SMTP_DIRECT_IMPLEMENTATION.md` - Full documentation

### Modified
- ✅ `src/pages/WpAdminEmailCenterPage.tsx` - Complete redesign
- ✅ `public/_redirects` - Added smtp-test route
- ✅ `package.json` - Added nodemailer

### Removed Dependencies
- ❌ Supabase edge function calls
- ❌ Proxy wrapper logic
- ❌ Upstream connectivity checks
- ❌ Backend template fetching
- ❌ Template preview from backend

## Success Criteria

After deploy with SMTP configured:

- ✅ Status API returns `allConfigured: true`
- ✅ Send API delivers email successfully
- ✅ UI shows all green indicators
- ✅ Send button works and email arrives
- ✅ Beautiful HTML email template renders
- ✅ No console errors
- ✅ No "upstream" errors

## Common SMTP Providers

| Provider | Host | Port | Notes |
|----------|------|------|-------|
| Gmail | smtp.gmail.com | 587 | Need app password if 2FA enabled |
| SendGrid | smtp.sendgrid.net | 587 | Use API key as password |
| Mailgun | smtp.mailgun.org | 587 | Use domain credentials |
| AWS SES | email-smtp.region.amazonaws.com | 587 | Generate SMTP credentials in console |

## Testing Email HTML

The test email includes:
- Gradient header with "Gappsy SMTP Test"
- Professional HTML layout
- Template name and timestamp
- Responsive design
- Plain text fallback

## Next Steps

1. **Deploy** this build
2. **Configure** SMTP in Bolt Secrets
3. **Test** via API (curl commands above)
4. **Test** via UI (/wp-admin/email-center)
5. **Verify** email delivery

## Summary

**What Works:**
- Direct SMTP testing without Supabase
- Clean, simple UI
- Local template definitions
- Status checking
- Test email sending
- Beautiful HTML emails

**What's Required:**
- SMTP credentials in Bolt Secrets
- Redeploy after adding secrets
- Admin secret for UI access

**Expected Result:**
A working email testing tool that shows SMTP status and sends beautiful test emails directly from gappsy.com without any external dependencies.
