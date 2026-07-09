# STEP 5 QUICK TEST GUIDE

## HOW TO TEST THE CHANGES

### 1. TEST TIMER INITIALIZATION

**Steps:**
1. Open browser DevTools (F12)
2. Go to Application/Storage → Local Storage
3. Clear all `activity_timer_*` keys
4. Navigate to any agency Step 5
5. Check timer shows 12-24 hours

**Expected:**
```
"18 hours ago, a client request for your agency was routed to another agency in New Jersey."
```

**Verify localStorage:**
```javascript
// Key format:
activity_timer_{slug}_step5

// Value format:
1743811200000  // Timestamp baseline
```

---

### 2. TEST TIMER INCREMENT

**Steps:**
1. Note current timer value (e.g., 18 hours)
2. Open DevTools → Local Storage
3. Find the `activity_timer_*` key
4. Copy the timestamp value
5. Subtract 2 hours in milliseconds: `value - 7200000`
6. Save new value
7. Refresh page
8. Timer should show 20 hours

**Expected:**
```
Before: 18 hours ago
After:  20 hours ago
```

---

### 3. TEST TIMER RESET (36 HOUR LIMIT)

**Steps:**
1. Open DevTools → Local Storage
2. Find the `activity_timer_*` key
3. Calculate 40 hours ago: `Date.now() - (40 * 60 * 60 * 1000)`
4. Set that value
5. Refresh page
6. Timer should reset to 1-6 hours

**Expected:**
```
Before: 40 hours ago (manually set)
After:  3 hours ago (reset)
```

---

### 4. TEST PER-AGENCY INDEPENDENCE

**Steps:**
1. Visit Agency A Step 5
2. Note timer value (e.g., 15 hours)
3. Note localStorage key: `activity_timer_agency-a_step5`
4. Visit Agency B Step 5
5. Note timer value (e.g., 22 hours)
6. Note localStorage key: `activity_timer_agency-b_step5`
7. Return to Agency A
8. Should still show 15 hours (or slightly more)

**Expected:**
```
Agency A: 15 hours ago → 15 hours ago (unchanged)
Agency B: 22 hours ago (different timer)
```

---

### 5. TEST CTA TEXT UPDATE

**Steps:**
1. Navigate to Step 5
2. Check button text
3. Check subtext lines

**Expected:**
```
Button: "⚡ Start receiving clients now"

Subtext Line 1: "Start receiving all client requests directly to your agency"
Subtext Line 2: "This gets unlocked instantly after activation"
```

**NOT Present:**
```
❌ "Stop losing clients — activate now"
❌ "Activation takes less than 30 seconds"
❌ "New client requests are coming in right now"
```

---

### 6. TEST MOBILE RESPONSIVENESS

**Steps:**
1. Open DevTools
2. Toggle device toolbar (Ctrl+Shift+M)
3. Select iPhone 12 Pro
4. Navigate to Step 5
5. Verify timer text is readable
6. Verify CTA is accessible

**Expected:**
- Timer text: 12px font, wraps nicely
- Stat cards: 2 columns, compact
- CTA button: Full width, visible
- All text readable without zooming

---

### 7. TEST LOCALSTORAGE FALLBACK

**Steps:**
1. Disable localStorage (DevTools → Application → Local Storage → Right-click → Clear)
2. Navigate to Step 5
3. Page should still work
4. Timer should show fallback value (12-24 hours)

**Expected:**
- No errors in console
- Timer displays correctly
- Timer doesn't persist (resets on refresh)

---

## QUICK CONSOLE TESTS

### Check Current Timer Value
```javascript
// Replace with your agency slug
const key = 'activity_timer_vazagency_step5';
const baseline = parseInt(localStorage.getItem(key), 10);
const elapsed = Date.now() - baseline;
const hours = Math.floor(elapsed / (1000 * 60 * 60));
console.log(`Timer should show: ${hours} hours ago`);
```

### Manually Set Timer to Specific Hours
```javascript
// Set timer to show "20 hours ago"
const key = 'activity_timer_vazagency_step5';
const hoursAgo = 20;
const baseline = Date.now() - (hoursAgo * 60 * 60 * 1000);
localStorage.setItem(key, baseline.toString());
console.log('Timer set to 20 hours ago. Refresh to see.');
```

### Force Timer Reset
```javascript
// Set timer to 40 hours ago (will trigger reset)
const key = 'activity_timer_vazagency_step5';
const baseline = Date.now() - (40 * 60 * 60 * 1000);
localStorage.setItem(key, baseline.toString());
console.log('Timer set to 40h. Refresh to trigger reset (1-6h).');
```

### Check All Timer Keys
```javascript
// List all activity timers
Object.keys(localStorage)
  .filter(k => k.startsWith('activity_timer_'))
  .forEach(key => {
    const baseline = parseInt(localStorage.getItem(key), 10);
    const elapsed = Date.now() - baseline;
    const hours = Math.floor(elapsed / (1000 * 60 * 60));
    console.log(`${key}: ${hours} hours`);
  });
```

---

## VISUAL VERIFICATION CHECKLIST

### Desktop View
- [ ] Timer text appears between stat cards and warning block
- [ ] Timer shows "{X} hours ago, a client request..."
- [ ] Timer text is gray with bold hours number
- [ ] Button shows "⚡ Start receiving clients now"
- [ ] Subtext shows benefit-focused copy
- [ ] No old text visible

### Mobile View
- [ ] Timer text wraps properly (no overflow)
- [ ] Stat cards display side-by-side
- [ ] Button is full-width and accessible
- [ ] All text is readable without zooming
- [ ] Timer updates on refresh

### Behavior
- [ ] Timer increases by 1 hour after 1 hour
- [ ] Timer resets after 36 hours
- [ ] Each agency has independent timer
- [ ] Timer survives page refresh
- [ ] Timer works without localStorage

---

## COMMON ISSUES & FIXES

### Issue: Timer always shows same number
**Fix:** Clear localStorage and refresh

### Issue: Timer doesn't increase
**Fix:** Check localStorage baseline is stored correctly

### Issue: Timer shows negative hours
**Fix:** Clear localStorage key, will regenerate on refresh

### Issue: Old CTA text still showing
**Fix:** Hard refresh (Ctrl+Shift+R)

### Issue: Timer not showing at all
**Fix:** Verify you're on Step 5 (OwnerUpsellDashboard component)

---

## WHERE TO FIND STEP 5

### State Page Owner Preview
1. Go to any state page (e.g., `/marketing-agencies-in-new-jersey-united-states/`)
2. Scroll to any agency listing
3. Click "Check Availability"
4. Click through Steps 1-4
5. Step 5 shows the upsell dashboard

### Direct /your-agency Funnel
1. Go to `/your-agency/search`
2. Search for an agency
3. Select agency
4. Click through availability flow
5. Step 5 shows the upsell dashboard

---

## SUCCESS CRITERIA

✅ Timer shows between stats and warning
✅ Timer format: "{X} hours ago, a client request..."
✅ Timer increases over time (real elapsed)
✅ Timer resets at 36 hours
✅ Timer is per-agency (different for each)
✅ Button text: "Start receiving clients now"
✅ Subtext: Benefit-focused (2 lines)
✅ Old text completely removed
✅ Works on mobile and desktop
✅ No console errors
