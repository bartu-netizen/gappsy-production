# Quick Sends - Quick Reference Guide

## URLs
- **List:** https://www.gappsy.com/wp-admin/email/quick-sends
- **Detail:** https://www.gappsy.com/wp-admin/email/quick-send/[MESSAGE_ID]
- **Health:** https://www.gappsy.com/functions/v1/quick-send-health
- **Health (Debug):** https://www.gappsy.com/functions/v1/quick-send-health?debug=1

## API Endpoints
```bash
# Create message (server-side insert)
POST /functions/v1/quick-send-create
Content-Type: application/json
{
  "toEmail": "recipient@example.com",
  "toName": "Recipient Name",
  "subject": "Email Subject",
  "htmlBody": "<h1>Hello</h1>",
  "textBody": "Plain text version"
}

# Send email
POST /functions/v1/quick-send-send
Content-Type: application/json
{
  "messageId": "uuid-from-create",
  "toEmail": "recipient@example.com",
  "subject": "Subject",
  "htmlBody": "<h1>Content</h1>"
}

# Track open (automatic, called by pixel)
GET /functions/v1/email-track-open?mid=MESSAGE_ID
# Returns: 1x1 transparent GIF

# Track click (automatic, called by rewritten link)
GET /functions/v1/email-track-click?mid=MESSAGE_ID&u=ENCODED_URL
# Returns: 302 redirect to ENCODED_URL

# Health check
GET /functions/v1/quick-send-health
# Returns: { "status": "healthy", "checks": [...] }
```

## Database Tables

### email_messages
| Column | Type | Purpose |
|--------|------|---------|
| id | uuid | Message ID (PK) |
| kind | text | 'quick_send' |
| to_email | text | Recipient email |
| to_name | text | Recipient name (optional) |
| subject | text | Email subject |
| from_name | text | Sender name |
| from_email | text | Sender email |
| html_body | text | Email HTML content |
| text_body | text | Email plain text (optional) |
| status | text | 'queued', 'sent', 'failed' |
| provider_message_id | text | SMTP provider message ID |
| sent_at | timestamptz | When sent |
| created_at | timestamptz | When created |

### email_events
| Column | Type | Purpose |
|--------|------|---------|
| id | uuid | Event ID (PK) |
| email_message_id | uuid | Link to message (FK) |
| event_type | text | 'open', 'click' |
| occurred_at | timestamptz | When event happened |
| url | text | URL clicked (null for opens) |
| user_agent | text | Browser info |
| ip_hash | text | Hashed IP address |
| created_at | timestamptz | When recorded |

## Component Files

### QuickSendsPage.tsx
- Location: `/src/pages/em/QuickSendsPage.tsx`
- Displays: List of sent emails
- Features: Filters, sorting, pagination
- Opens: Modal on "New Quick Send"
- Calls: loadQuickSends() on mount

### QuickSendTrackingPage.tsx
- Location: `/src/pages/em/QuickSendTrackingPage.tsx`
- Displays: Detail view of single email
- Features: Event timeline, click breakdown, metrics
- Loads: Message details + events
- Calls: loadData() on mount with message ID

### QuickSendOneToOneModal.tsx
- Location: `/src/components/em/QuickSendOneToOneModal.tsx`
- Type: Modal (fixed position overlay)
- Steps: Form → Builder → Review
- Calls: quick-send-create then quick-send-send

### EmailModuleLayout.tsx
- Location: `/src/components/wpadmin/EmailModuleLayout.tsx`
- Wraps: All email module pages
- Provides: Sidebar, navbar, tab navigation
- Tabs: 10 tabs including Quick Sends

## Edge Functions

### quick-send-create
- File: `/supabase/functions/quick-send-create/index.ts`
- Method: POST
- Auth: None (uses service role internally)
- Validates: Email format, required fields
- Returns: Message ID and basic info
- Status Code: 200 (success), 400 (invalid), 500 (error)

### quick-send-send
- File: `/supabase/functions/quick-send-send/index.ts`
- Method: POST
- Auth: None (uses service role internally)
- Handles: SMTP sending, link rewriting, pixel injection
- Updates: Message status to 'sent' or 'failed'
- Status Code: 200 (success), 500 (error)

### email-track-open
- File: `/supabase/functions/email-track-open/index.ts`
- Method: GET
- Auth: None (public endpoint)
- Response: 1x1 transparent GIF
- Side Effect: Inserts 'open' event into email_events

### email-track-click
- File: `/supabase/functions/email-track-click/index.ts`
- Method: GET
- Auth: None (public endpoint)
- Response: 302 redirect to original URL
- Side Effect: Inserts 'click' event into email_events

### quick-send-health
- File: `/supabase/functions/quick-send-health/index.ts`
- Method: GET
- Auth: None (public endpoint)
- Checks: Database, tables, SMTP, connectivity
- Response: Health status + array of checks
- Debug Mode: Add `?debug=1` for masked details

## Common Queries

### Get all sends for a user
```sql
SELECT * FROM email_messages 
WHERE kind = 'quick_send' 
ORDER BY created_at DESC;
```

### Get open count for a message
```sql
SELECT COUNT(*) as opens 
FROM email_events 
WHERE email_message_id = $1 
AND event_type = 'open';
```

### Get click count for a message
```sql
SELECT COUNT(*) as clicks 
FROM email_events 
WHERE email_message_id = $1 
AND event_type = 'click';
```

### Get all events for a message
```sql
SELECT * FROM email_events 
WHERE email_message_id = $1 
ORDER BY occurred_at DESC;
```

### Get click breakdown by URL
```sql
SELECT url, COUNT(*) as count 
FROM email_events 
WHERE email_message_id = $1 
AND event_type = 'click' 
GROUP BY url 
ORDER BY count DESC;
```

## Troubleshooting Commands

```bash
# Test health endpoint
curl https://www.gappsy.com/functions/v1/quick-send-health

# Test with debug
curl "https://www.gappsy.com/functions/v1/quick-send-health?debug=1"

# Test create endpoint
curl -X POST https://www.gappsy.com/functions/v1/quick-send-create \
  -H "Content-Type: application/json" \
  -d '{"toEmail":"test@example.com","subject":"Test","htmlBody":"<h1>Test</h1>"}'

# View edge function logs (in Supabase dashboard)
# Functions → [function-name] → Logs

# Check database from SQL Editor
SELECT COUNT(*) as total_messages FROM email_messages;
SELECT COUNT(*) as total_events FROM email_events;
```

## Monitoring

### Metrics to Track
- Messages sent per day
- Open rate (opens / sent)
- Click rate (clicks / sent)
- Average time to open
- Most clicked URLs
- SMTP error rate

### Alerts to Set
- Health check fails
- High SMTP error rate
- Database connection lost
- Message send failures > 5%

## Performance Tips

- Indexes are already on:
  - `email_messages(status, created_at)`
  - `email_events(email_message_id, event_type)`
- Lazy load detail page (don't load all events)
- Batch operations when possible
- Paginate results in UI

## Security Checklist

- [x] RLS enabled on all tables
- [x] Service role only in edge functions
- [x] Client cannot INSERT directly
- [x] Email validation on input
- [x] CORS headers configured
- [x] Tracking uses UUID (not email)
- [x] No secrets in logs

## Known Limitations

- No personalization tokens yet
- No batch sending
- No visual email builder
- No scheduled sends
- No A/B testing
- No bounce/complaint tracking
- No unsubscribe link injection

## Future Enhancements

1. Personalization tokens ({first_name}, etc)
2. Drag-and-drop email builder
3. Lead/agency picker
4. Batch CSV upload
5. Template library
6. Scheduled sends
7. Provider webhooks
8. Advanced analytics
9. Email list management
10. Compliance features

## Support

**Documentation:**
- QUICK_SENDS_COMPLETE_FIX.md - Full technical guide
- QUICK_SENDS_DEPLOYMENT_SUMMARY.md - What was fixed
- QUICK_SENDS_VERIFICATION_CHECKLIST.md - Testing checklist

**Debug:**
- Check health endpoint: /quick-send-health?debug=1
- View edge function logs in Supabase dashboard
- Check browser console for client errors
