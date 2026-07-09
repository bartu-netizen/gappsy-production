# 🚀 Admin Import - Quick Reference Card

## For System Admin (Setup - 1 minute)

### Configure Bolt Secret
```
Bolt → Settings → Secrets → Add Secret

Name:  ADMIN_IMPORT_SECRET
Value: gappsy-admin-2025
```

### Share Secret
Give `gappsy-admin-2025` to import admin.

---

## For Import Admin (Daily Use - 30 seconds)

### First Time
1. Open `/admin/json-import`
2. Paste secret in password field
3. Done (saves automatically)

### Every Time After
1. Open `/admin/json-import`
2. Upload JSON files
3. Click Import

---

## Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| Yellow warning shows | Paste admin secret |
| Import button disabled | Enter secret + upload files |
| "Invalid admin secret" | Check secret is correct |
| Validation fails | Fix JSON file per error message |
| Import succeeds but no page | Check database or wait for cache |

---

## JSON Requirements

- **state_name**: Required
- **state_slug**: Required (must match valid US state)
- **agencies**: Array, exactly 25 with ranks 1-25
- **rank**: Numbers 1-25, no duplicates
- **name**: Required per agency
- **websiteUrl**: Required per agency

---

## Import Options

- ✅ **Import to database** - Required
- ✅ **Save JSON** - Recommended  
- ⬜ **Download JSON** - Optional
- ✅ **Mark as placeholders** - Default
- ⬜ **Override existing** - Dangerous

---

## Success Indicators

✅ No yellow warning
✅ Files show green checkmarks
✅ Import button enabled
✅ "25/25 imported" message
✅ State page accessible

---

## Security Notes

- Secret saved in your browser only
- Click "Clear" on shared computers
- Contact admin if compromised
- Server validates all imports

---

## Getting Help

**Import Admins:** See ADMIN_IMPORT_QUICK_START.md

**System Admins:** See ADMIN_SECRET_AUTH_IMPLEMENTATION.md

**Developers:** See BULK_IMPORT_FINAL_FIX_SUMMARY.md

---

## Key URLs

- Import page: `/admin/json-import`
- State pages: `/marketing-agencies-in-{state}-united-states`

---

**Status: Production Ready ✅**
