# Your Agency Feature

**Status:** Production-ready
**Build:** Verified clean — 52 state pages prerendered, zero forbidden keywords

---

## Overview

The "Your Agency" funnel lets agencies discover, verify, and experience the value of their Gappsy listing in seconds. It provides three entry modes, contextual upgrade CTAs, a real-time visibility snapshot, full funnel tracking, and state page deep-linking with scroll + highlight.

---

## Routes

| Route | Description | SEO |
|-------|-------------|-----|
| `/your-agency` | Search landing page | Indexable, canonical to itself |
| `/your-agency/:agencySlug` | Agency profile page | noindex by default (`INDEX_AGENCY_PAGES = false`) |
| `/your-agency/t/:token` | Direct outreach token link | noindex |
| `/your-agency/not-found` | Not listed / submit fallback | noindex |

### SEO Config

Toggle in `src/lib/yourAgencyApi.ts`:

```typescript
export const INDEX_AGENCY_PAGES = false;
```

Set to `true` to make slug and token pages indexable.

---

## Architecture

### Database Tables

**`agency_listings_index`** — O(1) source of truth for all agency listings
- `UNIQUE(agency_id, state_slug, section)` — no duplicate rows
- GIN trigram index on `agency_name` for fast fuzzy search
- `is_active` flag for soft deletes (history preserved)

**`agency_claim_tokens`** — URL-safe tokens for outreach campaigns
- 12+ char random tokens (unambiguous character set)
- `uses` counter + `last_used_at` tracking
- Optional `expires_at` and `campaign` tag

**`your_agency_funnel_events`** — Full funnel event log
- Records all 7 event types (see Tracking section)

### Edge Functions

| Function | Purpose |
|----------|---------|
| `search-agencies` | Fuzzy agency name search, groups by agency, prefix-first ranking |
| `get-agency-listings` | Resolve agency via slug, token, or ID → listings + best_listing |
| `track-your-agency-event` | Write funnel events (allowlist-validated) |
| `agency-value-snapshot` | Public availability check counts (no PII) for value panel |

### Frontend Files

| File | Purpose |
|------|---------|
| `src/lib/yourAgencyApi.ts` | Shared API utility + 60s client-side cache |
| `src/components/YourAgencySEO.tsx` | Lightweight SEO head manager (supports noindex) |
| `src/pages/YourAgencySearchPage.tsx` | Hero search + trust elements + how it works |
| `src/pages/YourAgencyProfilePage.tsx` | Agency profile + value snapshot + upgrade CTAs |
| `src/pages/YourAgencyTokenPage.tsx` | Token resolution + auto-redirect (single listing) |
| `src/pages/YourAgencyNotFoundPage.tsx` | Friendly fallback + agency submission form |
| `src/pages/WpAdminClaimLinksPage.tsx` | Admin tool to generate token links |

---

## Features Implemented

### Search Page (`/your-agency`)
- Premium dark hero with subtle grid overlay
- Debounced search at 250ms with 60s client-side cache
- Keyboard navigation (arrow keys, enter, escape)
- Dropdown items show: name, domain/state count, Top 25 badge, "View in {State}" quick link
- Trust pills: "Agencies in 50+ states", "Updated daily", "Privacy-safe", "1,300+ agencies listed"
- How it works: 3-step cards with large step numbers
- Social proof stats bar: 52 states, 1,300+ agencies, Daily refresh
- Footer CTA: "Get listed for free" + "Upgrade listing"
- Tracks `your_agency_page_view` on mount

### Profile Page (`/your-agency/:slug`)
- Agency header card: name, domain link, state count pill, Top-25 pill
- **Value snapshot panel**: availability checks 7d / 30d / unique companies 30d
  - Pulls from `agency-value-snapshot` edge function (no PII)
  - Urgency callout: "X companies checked your availability" → upgrade CTA
- **"Where you appear" table**: state, section badge (Top-25 #rank or Other), "View my listing" CTA
- **Proof panel**: "What clients see" with mock listing preview
- **Contextual upgrade CTA**:
  - If Top-25: amber "Upgrade to a higher rank" + "Sponsor Spotlight"
  - If Other: blue "Get into the Top 25" + "Activate Standard ($97)"
- Claim ownership teaser at bottom
- Tracks `your_agency_result_view` on load

### Token Page (`/your-agency/t/:token`)
- Welcome banner: "This link was generated for you / Welcome, {AgencyName}"
- **Auto-redirect countdown** (4s): if exactly 1 listing, shows countdown bar with "Go now" + "Stay on this page" cancel
- Multiple listings: shows all with "Best" badge on best_listing
- Contextual upgrade CTA (same logic as profile page)
- Tracks `your_agency_token_open` once per page load (ref-guarded)

### Not Found Page (`/your-agency/not-found`)
- Clear empty state with icon
- "Try searching again" shortcut back to `/your-agency`
- Inline submission form: agency name (required) + website (optional)
- Post-submit success state with confirmation and next-step CTAs

### State Page Deep Link + Highlight
URL format: `/marketing-agencies-in-{state}-united-states/?agency={id}&section={top25|other}&from=your-agency`

Behavior (client-side only, SEO-safe):
- Parses `?agency`, `?section`, `?from` query params
- `scrollIntoView({ behavior: 'smooth', block: 'center' })` after 400ms
- CSS highlight: `ring-2 ring-blue-400 ring-offset-2 bg-blue-50/60 shadow-lg` for 6 seconds
- If `section=other`: pins target agency to first position in the list (session only)
- If agency not found: subtle toast notification
- Runs once per page load (ref guard prevents double-run)
- Implemented in `OtherAgenciesSection.tsx` + `OtherAgencyCard.tsx`

---

## Tracking Events

All stored in `your_agency_funnel_events` table:

| Event | When fired | Key fields |
|-------|-----------|------------|
| `your_agency_page_view` | `/your-agency` mount | — |
| `your_agency_search` | Debounced search completes | `q_length`, `results_count` |
| `your_agency_select` | User clicks a search result | `agency_id`, `agency_slug` |
| `your_agency_result_view` | Profile page loads | `agency_id`, `agency_slug` |
| `your_agency_view_listing_click` | "View my listing" CTA clicked | `agency_id`, `state_slug`, `section` |
| `your_agency_token_open` | Token page resolves | `agency_id`, `token` |
| `state_page_highlight_shown` | State page scrolls + highlights | `agency_id`, `state_slug`, `section` |

---

## Performance

- **60s client-side cache** for search results, listings, and value snapshots (Map-based)
- **React.lazy()** for all three pages (included in `admin` chunk)
- **Debounce 250ms** on search input
- **Edge functions** run at Supabase edge (low latency)
- Value snapshot fetched in parallel after listings load (non-blocking)

---

## Admin Tools

**`/wp-admin/claim-links`** — Generate token deep-links for outreach campaigns:
1. Search agency by name
2. Optionally add a campaign note
3. Click "Generate token" → saves to `agency_claim_tokens`
4. Copy generated URL (`/your-agency/t/{token}`) or preview in new tab
5. View `last_used_at` and `uses` count

---

## SEO Safety

- State page content and prerender output are NOT modified
- All highlight/pin behavior is triggered only by query params (client-side only)
- Prerendered HTML is identical with or without `?from=your-agency` params
- `/your-agency` is indexable with proper canonical
- Slug and token pages are noindex by default (configurable)
- Zero impact on 52-state prerender pipeline (confirmed via build)

---

## Acceptance Criteria Status

| Criterion | Status |
|-----------|--------|
| `/your-agency` is premium + mobile responsive + indexable | ✅ |
| Search finds agencies fast and reliably | ✅ 60s cache + 250ms debounce |
| Slug and token versions reuse same backend/index | ✅ Both call `get-agency-listings` |
| Result page shows accurate state listings and section/rank | ✅ |
| CTA deep-links to state page and highlights + scrolls correctly | ✅ |
| Other section pin works only when param present | ✅ |
| Value snapshot shows counts (no PII), excludes demo | ✅ `is_demo=false` filter |
| Full funnel tracking works (7 events) | ✅ |
| No SEO regression on state pages | ✅ Confirmed via seo-regression-check.mjs |
