# WP Admin Premium Shell — Complete

## Summary

All /wp-admin pages now share a premium SaaS layout shell (Linear/Stripe-style), with a persistent sidebar, sticky topbar, global command palette, and full mobile responsiveness.

---

## Components Added

### `src/components/wpadmin/adminTools.ts`
Central registry of all admin tools. Each entry has: `id`, `label`, `description`, `href`, `keywords`, `group`, `iconName`. Used by sidebar nav, dashboard grid, and command palette — single source of truth.

**Groups:** Content / Monetization / Ops

### `src/components/wpadmin/WpAdminLayout.tsx`
Shared layout shell wrapping all /wp-admin pages.

- **Desktop:** Fixed 240px left sidebar with logo, grouped nav items, active-state highlight, logout button
- **Mobile:** Sidebar becomes a drawer (hamburger → Sheet overlay)
- **Topbar:** Page title + subtitle, search trigger (opens palette), logout
- **Auth guard:** Redirects to /wp-admin if no secret in localStorage
- **Keyboard shortcut:** Ctrl/Cmd+K opens command palette globally on all pages
- **Content area:** max-w-6xl, centered, consistent padding

### `src/components/wpadmin/AdminCommandPalette.tsx`
Global search/command palette.

- **Open:** Ctrl/Cmd+K anywhere in /wp-admin, or clicking the search bar
- **Search:** Filters by label, description, and keywords array
- **Navigation:** Arrow keys to move, Enter to navigate, Escape to close
- **Display:** Icon + label + description + group badge; grouped sections when no query
- **Keyboard hint footer:** Shows ↑↓ / ↵ / esc hints

### `src/components/wpadmin/AdminToolCard.tsx`
Premium card component for the dashboard tool grid. Shows icon, label, description, group badge, hover arrow animation.

---

## Pages Updated

All pages now use `<WpAdminLayout>` with a `title` and `subtitle` prop. Auth guards and all functional logic are unchanged.

| Page | Title in layout |
|---|---|
| `WpAdminDashboardPage` | "Dashboard" |
| `WpAdminTop25EditorPage` | "Edit Top-25 Pages" |
| `WpAdminSettingsPage` | "Settings & Secrets" |
| `WpAdminEmailCenterPage` | "Email Center" |
| `WpAdminSubmissionsPage` | "Submissions Center" |
| `WpAdminStripePage` | "Revenue" |

---

## Dashboard Redesign

`WpAdminDashboardPage` is fully rebuilt:

- Search bar at top (opens command palette on click)
- Tool grid grouped by Content / Monetization / Ops
- 1 col (mobile) → 2 col (tablet) → 3 col (desktop)
- Uses `AdminToolCard` for each tool

---

## Routes (Unchanged)

All routes remain identical:

```
/wp-admin              → Login page
/wp-admin/dashboard    → Dashboard
/wp-admin/top25-editor → Edit Top-25 Pages
/wp-admin/settings     → Settings & Secrets
/wp-admin/email-center → Email Center
/wp-admin/submissions  → Submissions Center
/wp-admin/stripe       → Revenue (Stripe)
```

Note: The Revenue page is labelled "Revenue" in the UI but the route stays `/wp-admin/stripe`.

---

## Future: Revenue Route Alias

When needed, add to App.tsx:
```tsx
<Route path="/wp-admin/revenue" element={<Navigate to="/wp-admin/stripe" replace />} />
```
No breaking changes required.
