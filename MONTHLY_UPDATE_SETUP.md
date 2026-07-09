# Monthly Agency Reviews Update - Setup Guide

## Overview

This automated workflow updates the `last_updated` field for all agency reviews on the 1st of every month. This keeps the "Last Updated: Month Year" display and schema.org dateModified current.

---

## Files Created

1. **Script:** `scripts/monthly-touch-agency-reviews.mjs`
   - Node.js script that updates `agency_reviews.last_updated`
   - Uses Supabase service role key for database access
   - Logs number of affected rows

2. **Workflow:** `.github/workflows/monthly-touch-agency-reviews.yml`
   - GitHub Actions workflow
   - Runs monthly: 1st day at 03:00 UTC
   - Also supports manual triggering

---

## GitHub Secrets Setup

The workflow requires two secrets to be configured in your GitHub repository:

### Steps:

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add the following secrets:

#### Secret 1: `SUPABASE_URL`
- **Name:** `SUPABASE_URL`
- **Value:** Your Supabase project URL
- **Example:** `https://abcdefghijklmnop.supabase.co`
- **Where to find:** Supabase Dashboard → Project Settings → API

#### Secret 2: `SUPABASE_SERVICE_ROLE_KEY`
- **Name:** `SUPABASE_SERVICE_ROLE_KEY`
- **Value:** Your Supabase service role key (NOT the anon key)
- **Example:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`
- **Where to find:** Supabase Dashboard → Project Settings → API → Service Role Key
- **⚠️ Important:** Keep this secret safe! It has full database access.

---

## How It Works

### Automatic Monthly Run
- Triggers: **1st day of every month at 03:00 UTC**
- Updates: All rows in `agency_reviews` where `agency_slug IS NOT NULL`
- Sets: `last_updated = NOW()` (does NOT modify `updated_at`)

### Manual Run
1. Go to **Actions** tab in GitHub
2. Select **"Monthly Agency Reviews Update"** workflow
3. Click **"Run workflow"** button
4. Select branch and click **"Run workflow"**

---

## Testing Locally

You can test the script locally before deployment:

```bash
# Set environment variables
export SUPABASE_URL="https://your-project.supabase.co"
export SUPABASE_SERVICE_ROLE_KEY="your-service-role-key"

# Run the script
node scripts/monthly-touch-agency-reviews.mjs
```

**Expected output:**
```
🚀 Starting monthly agency reviews update...
📅 Current timestamp: 2025-12-27T16:30:00.000Z
✅ Success: Updated 7 agency review(s)
✨ Monthly update complete!
```

---

## Monitoring

### Check Workflow Status
1. Go to **Actions** tab in GitHub
2. Look for **"Monthly Agency Reviews Update"** runs
3. Green checkmark = success
4. Red X = failure (check logs)

### View Logs
1. Click on any workflow run
2. Click on **"Update Agency Reviews Last Updated"** job
3. Expand steps to see detailed logs

---

## What Gets Updated

**Table:** `agency_reviews`

**Fields Updated:**
- `last_updated` → Current timestamp (ISO 8601)
- `updated_at` → **NOT modified** (reserved for actual content changes)

**Rows Updated:**
- Only rows where `agency_slug IS NOT NULL`
- This ensures only valid, published reviews are touched

---

## Frontend Impact

After the monthly update runs:

**UI Display:**
- "Last Updated: December 2025" → "Last Updated: January 2026"

**Schema.org:**
- `"dateModified": "2025-12-01T03:00:00Z"` → `"dateModified": "2026-01-01T03:00:00Z"`

**No code changes needed** - the frontend automatically formats the database timestamp.

---

## Troubleshooting

### Workflow fails with "Missing required environment variables"
- **Solution:** Add `SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY` secrets in GitHub

### Workflow runs but updates 0 rows
- **Solution:** Check if `agency_reviews` table has data with non-null `agency_slug`

### Script fails with "Database error"
- **Solution:** Verify service role key has permission to update `agency_reviews` table

---

## Security Notes

✅ **DO:**
- Use GitHub Secrets for credentials (never commit them)
- Use service role key (required for updates)
- Monitor workflow logs for errors

❌ **DON'T:**
- Commit secrets to repository
- Share service role key publicly
- Use anon key (insufficient permissions)

---

## Maintenance

**No ongoing maintenance required.** The workflow will run automatically every month.

**Optional:** Review logs quarterly to ensure smooth operation.
