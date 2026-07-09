# Sidebar Ads Admin Login

## Login Credentials

**URL:** `/admin/sidebar-ads`

**Default Password:** `gappsy-ads-2024`

## How It Works

The admin login uses a centralized password system:

1. **Primary:** Checks environment variable `SIDEBAR_ADS_ADMIN_PASSWORD`
2. **Fallback:** If env var is not set, uses default password `gappsy-ads-2024`

## Edge Function

The login is validated server-side via the edge function:
- **Endpoint:** `/functions/v1/sidebar-ads-update`
- **Method:** POST
- **Body:** `{ password: "your-password", ads: [] }`

Empty ads array = login validation only
Non-empty ads array = actual update operation

## Setting Custom Password

To use a custom password, set the environment variable:

```bash
SIDEBAR_ADS_ADMIN_PASSWORD=your-custom-password
```

## Login Flow

1. User enters password on `/admin/sidebar-ads`
2. Frontend sends POST request with password and empty ads array
3. Edge function validates password
4. If valid: stores session in `sessionStorage` and shows admin panel
5. If invalid: displays "Invalid password" error

## Session Management

- Session is stored in browser `sessionStorage` as `sidebar_ads_admin_auth`
- Session persists during browser session
- Closing tab/browser clears session
- No server-side session tracking needed

## Testing

To test the login:

1. Navigate to `/admin/sidebar-ads`
2. Enter password: `gappsy-ads-2024`
3. Click "Login"
4. Should see the admin panel with all 10 ads

To test invalid password:
1. Enter wrong password
2. Should see "Invalid password" error
3. Should not gain access to admin panel
