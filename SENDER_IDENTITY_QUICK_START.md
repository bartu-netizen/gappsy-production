# Sender Identity - Quick Start Guide

## Get Started in 2 Minutes

### Step 1: Access Settings
Navigate to `/wp-admin/email/settings` in Gappsy admin

### Step 2: Find the Sender Identity Card
Look for the **"Sender Identity"** card with a mail icon at the top of the settings page

### Step 3: Configure Your Sender
Fill in these fields:

| Field | Example | Required | Notes |
|-------|---------|----------|-------|
| From Name | `Gappsy Team` | Yes | Shows in recipient's inbox |
| From Email | `support@gappsy.com` | Yes | Must be verified with SMTP |
| Reply-To Email | `support@gappsy.com` | No | Defaults to From Email if empty |

### Step 4: Review Preview
Below the inputs, you'll see a preview:
```
From: Gappsy Team <support@gappsy.com>
Reply-To: support@gappsy.com
```

This is exactly how it appears in email clients.

### Step 5: Save Changes
Click the blue **"Save Changes"** button. You'll see a success message.

### Step 6: Done!
All emails sent immediately use your new sender identity:
- Quick Sends
- Campaigns
- Automations
- Notifications
- Test emails

---

## Common Configurations

### Professional (Default)
```
From Name: Gappsy
From Email: noreply@gappsy.com
Reply-To: support@gappsy.com
```
→ Emails appear from "Gappsy" with support in reply-to

### Personal Touch
```
From Name: Gappsy Team
From Email: hello@gappsy.com
Reply-To: hello@gappsy.com
```
→ Friendly and welcoming

### Support-Focused
```
From Name: Gappsy Support
From Email: support@gappsy.com
Reply-To: support@gappsy.com
```
→ Clear that it's a support sender

---

## Troubleshooting

### Emails Still Show Old Sender
- **Solution**: Check you saved changes (green checkmark appears)
- Wait a few seconds before sending next email
- Send a new email (check happens at send time, not cached)

### Can't Save Settings
- **Check**: Is From Name filled in?
- **Check**: Is From Email a valid email address?
- **Check**: Is Reply-To email valid (if filled)?
- Check browser console for errors (F12)

### Emails Going to Spam
- **Check**: Is your From Email verified with your email provider?
- **Check**: Do you have SPF/DKIM/DMARC records configured?
- **Note**: Sender identity alone won't fix spam issues

### Recipients Replying to Wrong Address
- **Check**: Have you set Reply-To email?
- If Reply-To is empty, replies go to From Email
- Update Reply-To field if you want replies elsewhere

---

## What Happens to Old Senders?

Any hardcoded sender names (like "support") are replaced by your global configuration.

| Old | New |
|-----|-----|
| All emails from "support" | Emails from your configured From Name |
| No consistent reply-to | Emails go to your configured Reply-To |
| Hard to change centrally | Change once, affects everything |

---

## Which Emails Are Affected?

Your sender identity applies to:

✅ **Quick Send emails** (manual 1:1 sends via `/wp-admin/email/quick-sends`)
✅ **Campaign sends** (bulk emails from campaigns)
✅ **Automation emails** (drip sequences, triggers)
✅ **Test emails** (SMTP diagnostics)
✅ **Availability notifications** (internal alerts)
✅ **Submission notifications** (form submissions)
✅ **All future emails** automatically

❌ **External APIs** (only if they use the Gappsy system)

---

## Advanced: Testing It Works

1. **Configure sender**:
   - From Name: `Test Name`
   - From Email: `test@gappsy.com`
   - Reply-To: `test@gappsy.com`

2. **Send Quick Send to yourself**:
   - Go to `/wp-admin/email/quick-sends`
   - Click "New Quick Send"
   - Enter your email address
   - Add subject and body
   - Send

3. **Check the email**:
   - Open it in Gmail/Outlook
   - Look at the "From" line
   - Should say: `Test Name <test@gappsy.com>`

4. **Reply to test**:
   - Click Reply
   - Verify reply goes to `test@gappsy.com`

---

## When to Use Reply-To

**Leave empty** (uses From Email):
- Simple setup
- People reply to sender email

**Set different address** (e.g., support@):
- Replies go to support team
- From can be generic (noreply@)
- People see "From: Marketing <noreply@>" but replies go to support

**Example Use Case**:
```
From Name: Gappsy Alerts
From Email: alerts@gappsy.com (noreply, unmonitored)
Reply-To: support@gappsy.com (monitored, reads replies)
```
→ People see "Gappsy Alerts" but replying reaches support

---

## Settings Location

**Navigation Path**:
1. Log into admin
2. Click "Email Marketing" (left sidebar)
3. Click "Settings" (tab at top)
4. Scroll to "Sender Identity" card
5. Edit and save

**Direct URL**: `/wp-admin/email/settings`

---

## FAQ

**Q: Can I have multiple sender identities?**
A: Not yet. Currently one global default. Advanced per-type overrides planned for future.

**Q: Will changing sender break existing emails?**
A: No. Only affects emails sent after you save changes.

**Q: Who can edit sender settings?**
A: Only admin users (you).

**Q: Does sender identity affect deliverability?**
A: The From Name doesn't directly, but your From Email must be verified with your SMTP provider for emails to deliver.

**Q: How do I know my From Email is verified?**
A: Try sending a test email (SMTP Diagnostics section). If it works, it's verified.

**Q: Can I use any email address?**
A: No. Your From Email must be on an approved domain with your SMTP provider (usually configured in SMTP settings).

---

## Next Steps

- ✅ Configure sender identity
- ✅ Send test email to yourself
- ✅ Verify it appears correctly
- ✅ Tell your team about the change
- ✅ Monitor reply-to addresses if you changed them

**Questions?** Check `EMAIL_SENDER_IDENTITY.md` for detailed technical docs.

---

**Version**: 1.0 | **Updated**: 2026-02-19
