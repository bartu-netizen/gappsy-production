# SEO Regression Check

## How to Run

```bash
# Save baseline (run BEFORE making changes)
node scripts/seo-regression-check.mjs --save baseline

# Save after (run AFTER making changes)
node scripts/seo-regression-check.mjs --save after

# Diff the two snapshots
diff docs/SEO_BASELINE.txt docs/SEO_AFTER.txt
```

## URLs Tested

| Page | URL |
|------|-----|
| Homepage | https://www.gappsy.com/ |
| New Jersey state page | https://www.gappsy.com/marketing-agencies-in-new-jersey-united-states/ |
| California state page | https://www.gappsy.com/marketing-agencies-in-california-united-states/ |
| Texas state page | https://www.gappsy.com/marketing-agencies-in-texas-united-states/ |
| /your-agency funnel | https://www.gappsy.com/your-agency |

## What the Script Checks

For each URL (Normal UA and Googlebot UA):
- HTTP status code
- `<title>` presence and content
- `<meta name="description">` presence
- `<link rel="canonical">` presence
- `<meta name="robots">` value
- JSON-LD structured data count
- `<h1>` presence
- Loading placeholder detection (flags unfinished SPA render)
- Googlebot HTML parity (warns if >15% size difference vs Normal UA)

## 2026-02-19 Baseline Results

Captured before performance optimization work.

```
✅ New Jersey state page  — All SEO checks passed
✅ California state page  — All SEO checks passed
✅ Texas state page       — All SEO checks passed
❌ Homepage               — CANONICAL missing, H1 missing (pre-existing SPA condition)
❌ /your-agency           — CANONICAL missing, H1 missing (pre-existing SPA condition)
```

Note: Homepage and /your-agency are client-side rendered SPA pages. They do not have a canonical or H1 in their initial HTML — this has always been the case and is not a regression.

## 2026-02-19 Post-Optimization Results

Captured after all performance optimization changes.

```
✅ New Jersey state page  — All SEO checks passed
✅ California state page  — All SEO checks passed
✅ Texas state page       — All SEO checks passed
❌ Homepage               — CANONICAL missing, H1 missing (unchanged pre-existing condition)
❌ /your-agency           — CANONICAL missing, H1 missing (unchanged pre-existing condition)
```

## Diff Output

```diff
2c2
< Date: 2026-02-19T17:54:43.291Z
---
> Date: 2026-02-19T18:01:50.155Z
70c70
< Googlebot length: N/A
---
> Googlebot length: 122
```

Only the timestamp changed. The Googlebot HTML length for `/your-agency` changed from N/A (not fetched in baseline) to 122 chars (Netlify's redirect shell HTML — expected for a client-side route).

**Result: ZERO SEO REGRESSIONS**

## Snapshot Files

- `docs/SEO_BASELINE.txt` — snapshot before optimization
- `docs/SEO_AFTER.txt` — snapshot after optimization
