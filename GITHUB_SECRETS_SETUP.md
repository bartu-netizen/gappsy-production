# GitHub Secrets Setup - Quick Reference

## Required Secrets

To enable the monthly agency reviews update workflow, add these two secrets to your GitHub repository:

### 1. SUPABASE_URL
```
Name: SUPABASE_URL
Value: https://your-project-id.supabase.co
```

### 2. SUPABASE_SERVICE_ROLE_KEY
```
Name: SUPABASE_SERVICE_ROLE_KEY
Value: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9... (your service role key)
```

---

## How to Add Secrets

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **"New repository secret"**
4. Add each secret (name + value)
5. Click **"Add secret"**

---

## Where to Find Values

### Supabase URL:
- Supabase Dashboard → Project Settings → API → Project URL

### Service Role Key:
- Supabase Dashboard → Project Settings → API → Service Role Key (secret)
- ⚠️ **NOT** the anon key - use the service role key!

---

## Testing

After adding secrets, test the workflow:

1. Go to **Actions** tab
2. Click **"Monthly Agency Reviews Update"**
3. Click **"Run workflow"** → **"Run workflow"**
4. Wait for completion (green ✅ = success)

---

## Security

✅ Secrets are encrypted by GitHub
✅ Never logged or exposed in workflow output
✅ Only accessible to workflow runs

❌ Never commit secrets to code
❌ Never share service role key publicly
