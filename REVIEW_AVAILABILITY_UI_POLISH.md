# Review Page Availability UI Polish

## Change: Hide logo placeholder on positive review pages

### Problem
On positive agency review pages (e.g. `/agency-reviews/calta-marketing-new-york/`), the
availability result card showed a generic placeholder icon/SVG when the recommended agency
had no valid logo URL. This looked unprofessional.

### Solution

**`src/components/RecommendationCard.tsx`**
- Added `hideLogoPlaceholder?: boolean` prop (default `false`).
- When `true`:
  - If all logo candidates fail to load → logo container is not rendered at all.
  - If the only remaining candidate is the default placeholder SVG
    (`/images/agencies/default-agency-logo.svg`) → logo container is omitted.
  - Text-name fallback badge is also suppressed (no agency-name pill).
  - If a real logo URL exists and loads successfully → logo renders normally.
- `onError` chains through all candidates as before; on full exhaustion sets
  `logoFailed = true` which, combined with the flag, hides the container entirely.
- No layout shift: the logo container (`min-h-[48px]`) is conditionally rendered
  only when there is something to show.

**`src/AvailabilityModal.tsx`**
- Passes `hideLogoPlaceholder={reviewContext?.sentiment === 'positive'}` to
  `RecommendationCard`.
- Negative review pages (which always route to Vazagency, which has a logo) are
  unaffected — `sentiment !== 'positive'` → prop is `false`.
- Non-review pages (`reviewContext` is undefined) → prop is `false` → existing
  placeholder behavior unchanged.

### Behavior matrix

| Context | Logo present & loads | Logo missing / 404 |
|---|---|---|
| Positive review page | Shows logo | Shows nothing (no space reserved) |
| Negative review page | Shows logo (Vazagency always has one) | Shows text fallback pill |
| State page / other | Shows logo | Shows text fallback pill |

### Files changed
- `src/components/RecommendationCard.tsx`
- `src/AvailabilityModal.tsx`
