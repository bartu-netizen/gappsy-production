# Internal Linking — Explore Other States Fix

## Root Cause

The "Explore Marketing Agencies in Other States" chips were rendered with React Router `<Link to="...">` pointing to URLs with a trailing slash (e.g. `/marketing-agencies-in-texas-united-states/`).

The `App.tsx` router only had a route WITHOUT a trailing slash:
```
/marketing-agencies-in-:stateSlug-united-states
```

Clicks on the chips therefore fell through to the `*` catch-all route → `DatabaseRoutedPage` → an **async Supabase DB lookup** that shows "Resolving route..." while it runs. From the user's perspective the click appeared to do nothing (blank flash, then eventual load).

Secondary issues compounding the problem:
- `<Link>` renders an `<a>` in the DOM at runtime, but view-source shows no static hrefs in the prerendered HTML shell (the section is rendered entirely client-side).
- No explicit `pointer-events: auto` on `.state-pill`, leaving it vulnerable to any parent overlay.

## Fixes Applied

### 1. `src/App.tsx` — Added trailing-slash route
```tsx
<Route path="/marketing-agencies-in-:stateSlug-united-states" element={<StatePageTemplate />} />
<Route path="/marketing-agencies-in-:stateSlug-united-states/" element={<StatePageTemplate />} />
```
Both with and without trailing slash now route **directly** to `StatePageTemplate`, bypassing the async DB dance entirely.

### 2. `src/components/ExploreOtherStates.tsx` — Native `<a href>` elements
Replaced React Router `<Link to={url}>` with native `<a href={url}>`.

Benefits:
- Right-click "Open in new tab" works natively
- Keyboard Tab + Enter works natively
- SEO crawlers see real `href` attributes in the rendered DOM
- No dependency on client-side router for navigation
- `aria-label` added for accessibility

```tsx
<a
  href={url}
  className={`state-pill${isCurrentState ? ' state-pill-current' : ''}`}
  title={`Top 25 Marketing Agencies in ${state.name}`}
  aria-label={`Marketing agencies in ${state.name}`}
  aria-current={isCurrentState ? 'page' : undefined}
>
  {state.name}
</a>
```

### 3. `src/index.css` — CSS pointer-events safeguard
Added to `.state-pill`:
```css
pointer-events: auto;
position: relative;
z-index: 1;
display: inline-block;
```
This ensures no parent overlay can block clicks, regardless of future layout changes.

## Verification

### Regression guard script
`scripts/verify-explore-state-links.js` (run with `node scripts/verify-explore-state-links.js`)

Checks:
1. US_STATES has exactly 52 entries
2. No duplicate slugs
3. All 52 generated URLs match `/marketing-agencies-in-[a-z0-9-]+-united-states/`
4. All 52 slugs have a region assignment
5. Component uses native `<a href>` (not `<Link>`)
6. App.tsx has trailing-slash route
7. JS bundle contains state URL pattern

All 10 checks pass after fix.

### Manual verification checklist

On any of these pages (confirm chips navigate correctly):
- `/marketing-agencies-in-new-jersey-united-states/`
- `/marketing-agencies-in-california-united-states/`
- `/marketing-agencies-in-texas-united-states/`
- `/marketing-agencies-in-delaware-united-states/`
- `/marketing-agencies-in-alaska-united-states/`

For each page:
- [ ] Click a state chip → navigates immediately (no "Resolving route..." flash)
- [ ] Right-click → "Open Link in New Tab" is available
- [ ] Tab to a chip + Enter → navigates
- [ ] View page source (Ctrl+U) → search for `href="/marketing-agencies-in-` → **present in rendered DOM** (client-side; not in SSR shell but visible after React hydration)

## Files Changed

| File | Change |
|---|---|
| `src/App.tsx` | Added trailing-slash route for state pages |
| `src/components/ExploreOtherStates.tsx` | `<Link>` → `<a href>`, removed react-router-dom import |
| `src/index.css` | Added `pointer-events: auto`, `z-index: 1`, `position: relative`, `display: inline-block` to `.state-pill` |
| `scripts/verify-explore-state-links.js` | New regression guard (10 assertions) |

## What Was NOT Changed

- `src/lib/usStates.ts` — already correct, 52 states
- `src/lib/stateUrls.ts` — `top25StateUrl()` already correct
- `.state-pill-current` styling — unchanged
- All other pages and flows — unaffected
