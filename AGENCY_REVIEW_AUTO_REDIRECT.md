# Agency Review Auto-Redirect Feature

## Overview

Enhanced the Agency Review page (`src/pages/AgencyReviewPage.tsx`) with:
1. Secondary CTA to view top-rated alternatives
2. Optional 8-second auto-redirect to the state's Top 25 page (desktop only)
3. Countdown timer with Cancel option

---

## Features Implemented

### 1. Secondary CTA Button
- Added below the primary CTA in all four persona conclusions
- Text: "See top-rated alternatives in {StateName}"
- Styled as outline/secondary button
- Links to the same state's Top 25 page

### 2. Auto-Redirect Timer
- **Duration**: 8 seconds
- **Trigger**: When user selects a situation/persona
- **Desktop Only**: No redirect on mobile devices (≤768px)
- **Countdown Display**: Shows remaining seconds
- **Cancel Button**: User can stop the redirect
- **Auto-Reset**: Timer resets when user changes persona selection

### 3. UX Safeguards
- ✅ Timer resets when switching between personas
- ✅ Timer cancels when user clicks any CTA button
- ✅ No redirect on mobile devices
- ✅ Clean timer cleanup on unmount (prevents memory leaks)
- ✅ Clear visual feedback with countdown

---

## Implementation Details

### State Variables Added
```typescript
const [redirectCountdown, setRedirectCountdown] = useState<number | null>(null);
const [cancelRedirect, setCancelRedirect] = useState(false);
```

### Key Functions
- `handleCancelRedirect()`: Stops the redirect timer
- `handleCtaClick()`: Cancels redirect when user manually clicks a CTA

### Mobile Detection
Uses `window.matchMedia('(max-width: 768px)')` to detect mobile devices

---

## User Flow

1. **User selects a persona** (Startup, Local Business, Ecommerce, Growing Company)
2. **Conclusion panel appears** with:
   - Primary CTA (existing)
   - Secondary CTA (new)
   - Countdown message (desktop only)
3. **Desktop users** see:
   - "Redirecting to the Top 25 in 8 seconds... Cancel"
   - Countdown ticks down each second
   - Can click Cancel to stop
4. **At 0 seconds**: Auto-navigates to Top 25 page for the state
5. **Mobile users**: See both CTAs but no auto-redirect

---

## Technical Implementation

### Countdown Effect (lines 82-108)
- Checks for mobile device
- Starts 8-second timer when persona is selected
- Cleans up timer on unmount
- Navigates using `useNavigate()` when countdown reaches 0

### Conclusion Panels (4 sections updated)
Each persona section now includes:
```tsx
<div className="flex flex-col gap-3">
  {/* Primary CTA */}
  <Link onClick={handleCtaClick}>...</Link>

  {/* Secondary CTA */}
  <Link onClick={handleCtaClick}>...</Link>
</div>

{/* Countdown (desktop only) */}
{redirectCountdown !== null && !cancelRedirect && (
  <div className="mt-4">
    Redirecting in {redirectCountdown} seconds... [Cancel]
  </div>
)}
```

---

## State Routing

Uses dynamic state routing - no hardcoded states:
```tsx
to={`/top-25-marketing-agencies-${agency.state_slug}`}
```

Works for all review pages across all states.

---

## Styling

### Primary CTA
- `bg-gray-100` background
- `text-gray-900` text
- Maintains existing style

### Secondary CTA
- `border-2 border-gray-300` outline
- `text-gray-700` text
- Hover states for feedback

### Countdown Message
- Small gray text
- Centered alignment
- Indigo underlined Cancel button

---

## Testing Checklist

- [ ] Select each persona and verify countdown starts (desktop)
- [ ] Verify countdown ticks down from 8 to 1
- [ ] Verify redirect works at 0 seconds
- [ ] Click Cancel and verify redirect stops
- [ ] Switch personas and verify timer resets
- [ ] Click primary CTA and verify redirect cancels
- [ ] Click secondary CTA and verify redirect cancels
- [ ] Test on mobile and verify NO auto-redirect
- [ ] Verify both CTAs work on mobile
- [ ] Check all four personas have both CTAs

---

## Files Modified

- `src/pages/AgencyReviewPage.tsx` - Main implementation

---

## Future Enhancements (Optional)

- Add analytics tracking for redirect cancellations
- A/B test optimal countdown duration
- Add visual progress bar instead of text countdown
- Track conversion rates for auto-redirect vs manual clicks
