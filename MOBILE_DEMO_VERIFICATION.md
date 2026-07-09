# Mobile Demo Step 3/5 - Verification Checklist

## Pre-Test Setup
- [ ] Use Chrome DevTools with iPhone 12 emulation (390×844)
- [ ] Open browser console (F12)
- [ ] Clear localStorage to start fresh demo
- [ ] Disable cache (DevTools → Network → "Disable cache" checkbox)

## Step-by-Step Test

### Phase 1: Modal Opening (T=0-250ms)
1. [ ] Navigate to `/marketing-agencies-in-new-jersey`
2. [ ] Scroll to see owner preview demo option (if applicable)
3. [ ] Click to enter owner preview mode
4. [ ] Proceed through Step 1 and Step 2
5. [ ] Click "Check Availability" button
6. **Expected:** Modal opens with form

### Phase 2: Demo UI Activation (T=250-500ms)
- [ ] **Wait 250ms** (watch carefully)
- [ ] ✓ Green bouncing arrow appears BELOW the button
- [ ] ✓ "Auto-clicking in 10…" text appears
- [ ] ✓ Arrow animation bounces continuously (up/down 12px)
- [ ] ✓ Ring around button is green (ring-[#34d399])

**Console Check:**
```
[Step3Manual] Forcing visibility check on mobile
[Step3 Countdown] 10
```

### Phase 3: Countdown Progression (T=1s-10s)
- [ ] Watch countdown decrement each second
- [ ] [ ] "Auto-clicking in 9…"
- [ ] "Auto-clicking in 8…"
- [ ] "Auto-clicking in 7…"
- [ ] "Auto-clicking in 6…"
- [ ] "Auto-clicking in 5…"
- [ ] "Auto-clicking in 4…"
- [ ] "Auto-clicking in 3…"
- [ ] "Auto-clicking in 2…"
- [ ] "Auto-clicking in 1…"

**Console Check:**
```
[Step3 Countdown] 10
[Step3 Countdown] 9
[Step3 Countdown] 8
...
[Step3 Countdown] 1
```

### Phase 4: Auto-Click at Zero (T=10s)
- [ ] Countdown reaches 0
- [ ] ✓ Form auto-submits (no manual click needed)
- [ ] ✓ Modal transitions to "animating" state (spinner appears)
- [ ] ✓ After animation completes, shows Step 4/5 result

**Console Check:**
```
[Step3 Countdown] 0
[Step3 Countdown] Countdown reached 0, triggering auto-click
```

### Phase 5: Step 4/5 Result Screen
- [ ] ✓ Shows recommended agency (routing result)
- [ ] ✓ Can close modal and navigate forward
- [ ] ✓ Sticky bar shows "Step 4/5 — Here's what happens if..."

## Repeat Test (Consistency Check)
1. [ ] Close modal
2. [ ] Go back to Step 1 or refresh
3. [ ] Repeat entire demo flow 2 more times
4. [ ] ✓ Countdown starts at ≤250ms every time
5. [ ] ✓ Auto-click triggers at 0 every time
6. [ ] ✓ No errors or visual glitches

## Responsive Breakpoint Tests

### iPhone SE (375px)
- [ ] Arrow visible and bouncing
- [ ] Countdown text not truncated
- [ ] Button full width
- [ ] No horizontal scrolling

### iPhone 12 (390px)
- [ ] Arrow visible and bouncing
- [ ] Countdown text properly centered
- [ ] Button full width
- [ ] All UI properly spaced

### iPhone 14 Pro (393px)
- [ ] Same as iPhone 12
- [ ] Larger notch doesn't interfere

### iPad Mini (768px)
- [ ] Scales to larger layout
- [ ] Arrow and countdown still visible
- [ ] Form centered with appropriate width

## Accessibility Tests

### Reduced Motion Test
1. [ ] Go to System Preferences → Accessibility → Display → Reduce motion (ON)
2. [ ] Reopen modal
3. [ ] ✓ Arrow animation disabled (no bouncing)
4. [ ] ✓ Countdown still works (text updates)
5. [ ] ✓ Auto-click still triggers at 0

### Screen Reader Test (VoiceOver on iOS)
1. [ ] Enable VoiceOver (Settings → Accessibility → VoiceOver → ON)
2. [ ] Reopen modal
3. [ ] ✓ Screen reader announces button
4. [ ] ✓ Screen reader announces countdown text
5. [ ] ✓ Button remains accessible with VoiceOver gestures

### Keyboard Navigation (Tab through form)
1. [ ] Open modal
2. [ ] Press Tab repeatedly
3. [ ] ✓ Focus ring visible on button
4. [ ] ✓ Can press Enter/Space to manually click (overrides auto-click)
5. [ ] ✓ Focus moves through all form fields logically

## Network Conditions Test

### Slow 3G (DevTools → Throttle)
1. [ ] Set throttle to "Slow 3G"
2. [ ] Reopen modal
3. [ ] ✓ Countdown still starts at ≤250ms
4. [ ] ✓ No timeout or loading errors
5. [ ] ✓ Form eventually submits successfully

### Offline (DevTools → Offline)
1. [ ] Set to "Offline"
2. [ ] Reopen modal
3. [ ] ✓ Countdown starts normally
4. [ ] ✓ Form submission fails gracefully
5. [ ] ✓ Error message appears (or user can retry)

## Edge Cases

### Rapid Re-open
1. [ ] Open modal
2. [ ] Close immediately (before countdown starts)
3. [ ] Reopen immediately
4. [ ] ✓ Countdown resets
5. [ ] ✓ No duplicate intervals or observers
6. [ ] ✓ Clean state each time

### Manual Click During Countdown
1. [ ] Open modal
2. [ ] Wait 5 seconds (countdown at "5…")
3. [ ] Manually click "Check Availability" button
4. [ ] ✓ Form submits immediately
5. [ ] ✓ No errors or double-submissions

### Safari vs Chrome
- [ ] **Chrome Mobile:** ✓ All features work
- [ ] **Safari iOS:** ✓ All features work
- [ ] **Firefox Mobile:** ✓ All features work
- [ ] **Samsung Internet:** ✓ All features work

## Visual Inspection Checklist

- [ ] Arrow color is emerald-500 (green)
- [ ] Arrow size is proportional (w-6 h-6)
- [ ] Arrow shadow is subtle (not too dark)
- [ ] Countdown text is readable (gray text on white background)
- [ ] Countdown text has padding (px-2 py-1)
- [ ] Countdown has rounded corners (rounded-md)
- [ ] No text overflow or truncation
- [ ] Button ring is visible and bright green
- [ ] Button pulse animation is smooth
- [ ] No layout shift when arrow appears
- [ ] No scrolling needed to see arrow/countdown

## Performance Checks

### Time Measurements (via Console)
```javascript
// Paste this in console on modal open
console.time('demo-ready');
// Wait for arrow to appear
console.timeEnd('demo-ready');
// Should be ≤250ms
```

- [ ] Demo UI visible in ≤250ms
- [ ] No jank or stuttering during bounce
- [ ] Countdown updates smoothly every second
- [ ] No memory leaks after repeated opens

## Final Sign-Off

### Desktop Still Works?
- [ ] Open same page in desktop viewport (1024px+)
- [ ] Click owner preview
- [ ] ✓ Arrow appears ABOVE button (not below)
- [ ] ✓ Countdown works
- [ ] ✓ Auto-click works
- [ ] ✓ No change from previous behavior

### Build Status
```bash
npm run build
# Should complete successfully with:
# ✓ built in X seconds
# ✅ No forbidden keywords found
```

- [ ] Build passes without errors
- [ ] No TypeScript errors
- [ ] No console warnings
- [ ] dist/ folder generated correctly

## Final Confirmation

```
Mobile Demo Step 3/5 Fixes Verified: ___________  Date: ___________

Tester Initials: _________

All tests passed and ready for production:
[ ] Arrow appears within 250ms
[ ] Countdown starts and decrements
[ ] Auto-click triggers at 0
[ ] Desktop still works unchanged
[ ] No errors in console
[ ] Build successful
```

## Rollback Plan (If Issues Found)

If any test fails:
1. Check console for error messages
2. Compare behavior to this guide
3. Review changes in `src/AvailabilityModal.tsx`
4. If critical: revert changes and re-test

Key changes to revert:
- Lines 726-729: IntersectionObserver with `root: container`
- Lines 747-755: 250ms manual check fallback
- Lines 1471-1495: Mobile arrow/countdown repositioning
