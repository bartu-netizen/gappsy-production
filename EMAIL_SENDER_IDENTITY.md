# Email Sender Identity Configuration

## Overview

The Email Sender Identity system provides centralized control over the "From" name and email address used in all outgoing emails from the Gappsy email marketing system. Instead of hardcoding sender information in individual email functions, all emails now pull from a global configuration that can be updated in one place.

## How It Works

### Central Configuration

All sender identity defaults are stored in the `email_sender_settings` table:

```sql
email_sender_settings
├── default_from_name     -- The display name (e.g., "Gappsy")
├── default_from_email    -- The sender email (e.g., "noreply@gappsy.com")
└── default_reply_to      -- Optional reply-to address
```

### Configuration Location

Navigate to: **/wp-admin/email/settings** → Scroll to "Sender Identity" card

Here you can set:
- **From Name** (required): Display name in recipients' inboxes
- **From Email** (required): Sender email address
- **Reply-To Email** (optional): Where replies are directed

### How Emails Use It

When any email is sent (Quick Send, Campaign, Automation, Notification, etc.):

1. The send function calls `getSenderIdentity()`
2. If no per-send overrides are provided, it loads the global defaults
3. The email is sent with the configured From and Reply-To headers

## Email Sending Paths

All of these now use the global sender identity:

- ✅ **Quick Send** (`/wp-admin/email/quick-sends`) - Manual 1:1 emails
- ✅ **Campaigns** (queued via email-marketing-api)
- ✅ **Automations** (automation engine sends)
- ✅ **Test Emails** (SMTP diagnostics)
- ✅ **Internal Notifications** (availability requests, submissions, etc.)
- ✅ **Future Sends** (any new email sending added later)

## Backend Implementation

### Database Tables

**email_sender_settings** (singleton):
```sql
CREATE TABLE email_sender_settings (
  id uuid PRIMARY KEY,
  default_from_name text NOT NULL DEFAULT 'Gappsy',
  default_from_email text NOT NULL DEFAULT 'noreply@gappsy.com',
  default_reply_to text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);
```

**email_notification_overrides** (future use):
```sql
CREATE TABLE email_notification_overrides (
  id uuid PRIMARY KEY,
  notification_type text NOT NULL UNIQUE,
  override_from_name text,
  override_from_email text,
  override_reply_to text,
  created_at timestamptz,
  updated_at timestamptz
);
```

### API Helpers

**Frontend** (`src/lib/senderIdentityApi.ts`):
```typescript
// Load current global settings
getSenderIdentitySettings(): Promise<SenderIdentity>

// Update global settings
updateSenderIdentitySettings(identity: SenderIdentity): Promise<void>
```

**Edge Functions** (`supabase/functions/_shared/getSenderIdentity.ts`):
```typescript
// Used in all send flows
getSenderIdentity(supabaseUrl, serviceRole, overrides?)
```

### Email Sending Functions Updated

1. **quick-send-send**: Calls `getSenderIdentity()` to get sender before SMTP send
2. **sendEmail** (emailClient.ts): Now accepts `replyTo` parameter
3. **Future functions**: Should all call `getSenderIdentity()` before sending

## Frontend UI

### Sender Identity Settings Component

Location: `src/components/em/SenderIdentitySettings.tsx`

Features:
- Real-time validation of email addresses
- Live preview showing how emails will appear
- Save button with loading/success states
- Helpful hints about each field
- Warning about global defaults applying everywhere

### Quick Send Modal

The Quick Send modal no longer asks for sender information. Instead, it displays:
```
ℹ️ Sender name and email are configured globally in Email Settings.
```

When a Quick Send email is sent, it uses the global identity automatically.

## Configuration Flow

1. **Admin navigates** to /wp-admin/email/settings
2. **Clicks** "Sender Identity" card
3. **Edits** From Name, From Email, Reply-To
4. **Clicks** "Save Changes"
5. **Confirmation** shows with success message
6. **All future emails** automatically use new sender identity

## Verification

To verify the sender identity is working:

1. Send a **Quick Send** email to yourself
2. Check Gmail/email client for the "From" display name
3. Should match exactly what you configured in Settings
4. Reply to the email
5. Verify it goes to the configured Reply-To address (or From Email if not set)

## Overrides (Future Feature)

The system supports per-notification-type overrides via `email_notification_overrides` table:

```typescript
// Example: override sender for availability notifications
const override = {
  notification_type: 'availability_request',
  override_from_name: 'Availability Team',
  override_from_email: 'availability@gappsy.com',
};
```

Currently not used in UI, but infrastructure is in place.

## Environment Variables

No new environment variables needed. The system uses:
- `SUPABASE_URL` - Already configured
- `SUPABASE_SERVICE_ROLE_KEY` - Already configured
- Existing SMTP configuration (host, port, username, password)

## Hardcoded Values Removed

The following hardcoded sender values have been replaced with global config lookups:

- ❌ `"support"` → ✅ `settings.default_from_name`
- ❌ `"Gappsy <noreply@gappsy.com>"` → ✅ Dynamic from settings
- ❌ `SMTP_FROM_SUPPORT` env var fallback → ✅ Database default

## Troubleshooting

### Emails still show wrong sender name

1. Check that you've saved changes in Email Settings
2. Wait a few seconds (cache may be active)
3. Send a new email (check is performed at send time)
4. Check the Sender Identity preview in Settings matches what you see in Gmail

### Reply-To not working

1. Verify Reply-To field is filled in Settings
2. If empty, replies go to From Email by default
3. Gmail may group replies differently than expected

### Settings won't save

1. Check both email addresses are valid
2. Check From Name is not empty
3. Check browser console for errors
4. Verify you have admin permissions

## Code Examples

### Frontend: Reading Settings

```typescript
import { getSenderIdentitySettings } from '@/lib/senderIdentityApi';

const identity = await getSenderIdentitySettings();
console.log(identity.fromName);      // "Gappsy"
console.log(identity.fromEmail);     // "noreply@gappsy.com"
console.log(identity.replyTo);       // "support@gappsy.com"
```

### Backend: Sending Email

```typescript
import { getSenderIdentity } from '../_shared/getSenderIdentity.ts';

const identity = await getSenderIdentity(supabaseUrl, serviceRole);

const mailOptions = {
  from: `${identity.fromName} <${identity.fromEmail}>`,
  to: 'recipient@example.com',
  subject: 'Hello',
  html: '<p>Body</p>',
  replyTo: identity.replyTo,
};

await transporter.sendMail(mailOptions);
```

## Best Practices

1. **Use a verified email address** - Your From Email must be verified with your SMTP provider
2. **Professional display name** - Use something like "Gappsy Team" instead of generic "noreply"
3. **Set Reply-To** - Makes it obvious where customer replies go
4. **Test after changes** - Send a quick test email before assuming settings are correct
5. **Document in your team** - Let team members know where sender settings are configured

## Future Enhancements

- Per-feature overrides (advanced users can configure sender per campaign type)
- A/B testing sender names and impact on open rates
- Audit log of who changed sender identity and when
- Multiple sender profiles for different business units
- Automatic validation with email provider

---

**Version**: 1.0
**Last Updated**: 2026-02-19
**Maintained By**: Email System Team
