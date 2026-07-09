# Availability Request Email Notifications

## Overview

Professional email notification system for Check Availability leads. Currently sends internal notifications to `SMTP_INTERNAL_EMAIL` for every availability request. Designed to be easily extended for agency owner notifications.

---

## Architecture

### 1. Shared Email Infrastructure

**Location:** `supabase/functions/_shared/`

#### emailClient.ts
Reusable SMTP email client using nodemailer:
- Uses existing SMTP environment variables
- Supports HTML and plain text emails
- Comprehensive error handling
- Returns success/failure status

```typescript
sendEmail({
  to: 'email@example.com',
  subject: 'Subject line',
  html: '<p>HTML content</p>',
  text: 'Plain text fallback'
})
```

#### emailTemplates.ts
SaaS-style email templates:
- `buildAvailabilityRequestInternalEmail()` - Internal notification template
- Professional design with proper typography and spacing
- Clean, structured layout
- Shows listing type (paid/free), client details, project info

**Template structure:**
```typescript
{
  agencyName: string;
  stateName: string;
  clientName: string;
  clientEmail: string;
  service: string;
  budget: string;
  timeline: string;
  submittedAtIso: string;
  isPaidListing: boolean;
}
```

---

## 2. Edge Function: availability-notify

**Location:** `supabase/functions/availability-notify/index.ts`

**Purpose:** Sends email notifications for availability requests

**Accepts:**
1. Full data payload (direct from frontend):
   ```json
   {
     "agencyId": "uuid",
     "stateSlug": "new-jersey",
     "clientName": "John Doe",
     "clientEmail": "john@example.com",
     "service": "SEO",
     "budget": "$5,000-$10,000",
     "timeline": "1-3 months"
   }
   ```

2. Request ID (fetch from DB):
   ```json
   {
     "availabilityRequestId": "uuid"
   }
   ```

**Flow:**
1. Receives POST request
2. Validates required data
3. Fetches agency data from `other_agencies` table
4. Checks for `SMTP_INTERNAL_EMAIL` env var
5. Builds email using template
6. Sends to internal email
7. Returns success/failure (never blocks UI)

**Error Handling:**
- Missing agency: Returns 404
- Missing SMTP config: Returns success but skipped
- Email send failure: Returns 500 with error details
- All errors are logged but don't break client flow

---

## 3. Frontend Integration

**Location:** `src/AvailabilityModal.tsx`

**Integration point:** `saveAvailabilityRequest()` function

**Flow:**
1. Insert availability request into database
2. Non-blocking call to `availability-notify` edge function
3. Passes all form data directly
4. Catches and logs errors silently
5. UI continues normally regardless of email status

```typescript
fetch(`${supabaseUrl}/functions/v1/availability-notify`, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${supabaseAnonKey}`,
  },
  body: JSON.stringify({
    agencyId,
    stateSlug,
    clientName: formData.name,
    clientEmail: formData.email,
    service: formData.service,
    budget: formData.budget,
    timeline: formData.timeline,
  }),
}).catch((e) => {
  console.error('[AvailabilityModal] Failed to trigger email notification:', e);
});
```

---

## Environment Variables Required

All SMTP variables should already be configured. The new variable needed:

```env
SMTP_INTERNAL_EMAIL=bartu@gappsy.com
```

**Existing SMTP variables (no changes needed):**
- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`
- `SMTP_FROM_SUPPORT`

---

## Testing

### Test 1: Manual Function Call

```bash
curl -X POST \
  https://your-project.supabase.co/functions/v1/availability-notify \
  -H "Authorization: Bearer YOUR_ANON_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "agencyId": "existing-agency-uuid",
    "stateSlug": "new-jersey",
    "clientName": "Test Client",
    "clientEmail": "test@example.com",
    "service": "SEO",
    "budget": "$5,000-$10,000",
    "timeline": "1-3 months"
  }'
```

**Expected:**
- Email arrives at `SMTP_INTERNAL_EMAIL`
- Subject: "New availability request – [Agency Name] (New Jersey)"
- Clean, professional HTML layout
- All form data displayed

### Test 2: Complete Flow

1. Go to any state page (e.g., New Jersey)
2. Click "Check Availability" on any agency
3. Fill out the form:
   - Service: SEO
   - Budget: $5,000-$10,000
   - Timeline: 1-3 months
   - Email: test@example.com
   - Name: Test User
4. Submit the form

**Expected:**
- Form submission completes normally
- Animation and result modal show as usual
- Email arrives at `SMTP_INTERNAL_EMAIL`
- Database record created in `agency_availability_requests`

### Test 3: Error Scenarios

**Test missing SMTP config:**
- Temporarily unset `SMTP_INTERNAL_EMAIL`
- Submit availability request
- Check function logs: should show "SMTP_INTERNAL_EMAIL not set; skipping email"
- Frontend should continue normally

**Test invalid agency ID:**
- Call function with non-existent agency ID
- Should return 404 but not break
- Frontend continues normally

---

## Future Enhancements

### Ready for Agency Owner Emails

The structure is already in place to add agency owner notifications:

1. **Add owner email template:**
   ```typescript
   export function buildAvailabilityRequestOwnerEmail(
     data: AvailabilityRequestEmailData
   ): { subject: string; html: string; text: string } {
     // More client-friendly language
     // Less internal labels
   }
   ```

2. **Extend availability-notify function:**
   ```typescript
   // Fetch agency owner email
   if (agency.is_paid_listing && agency.owner_email) {
     const ownerTemplate = buildAvailabilityRequestOwnerEmail(emailData);
     await sendEmail({
       to: agency.owner_email,
       subject: ownerTemplate.subject,
       html: ownerTemplate.html,
       text: ownerTemplate.text,
     });
   }

   // Keep internal notification as CC or separate
   const internalTemplate = buildAvailabilityRequestInternalEmail(emailData);
   await sendEmail({
     to: internalTo,
     subject: internalTemplate.subject,
     html: internalTemplate.html,
     text: internalTemplate.text,
   });
   ```

3. **Add owner email field to database:**
   ```sql
   ALTER TABLE other_agencies
   ADD COLUMN owner_email TEXT;
   ```

### Possible Additional Features

- **Email preferences:** Let agency owners opt in/out of notifications
- **Digest emails:** Daily/weekly summary instead of instant notifications
- **Email templates:** Allow customization per agency
- **Lead scoring:** Highlight high-quality leads in emails
- **Auto-reply:** Send confirmation email to clients
- **CRM integration:** Forward leads to external systems

---

## Files Created/Modified

### New Files

1. `supabase/functions/_shared/emailClient.ts` - Reusable email client
2. `supabase/functions/_shared/emailTemplates.ts` - Email templates
3. `supabase/functions/availability-notify/index.ts` - Email notification edge function

### Modified Files

1. `src/AvailabilityModal.tsx` - Added email notification call

---

## Design Principles

1. **Non-blocking:** Email failures never block user experience
2. **Template-driven:** Easy to add new email types
3. **Reusable:** Shared email client for all functions
4. **Professional:** SaaS-quality email design
5. **Future-proof:** Ready for agency owner notifications
6. **Error-tolerant:** Graceful handling of all failure scenarios

---

## Build Status

✅ Build completed successfully with no errors

---

## Next Steps

1. **Configure environment variable:**
   ```
   SMTP_INTERNAL_EMAIL=bartu@gappsy.com
   ```

2. **Test the flow:**
   - Submit a real availability request
   - Verify email arrives

3. **Monitor logs:**
   - Check Supabase function logs for errors
   - Verify emails are being sent

4. **When ready to add owner emails:**
   - Follow "Future Enhancements" section
   - Test with a few agencies first
   - Gradually roll out to all paid listings
