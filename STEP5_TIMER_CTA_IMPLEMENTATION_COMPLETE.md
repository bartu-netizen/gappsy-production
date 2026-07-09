# ✅ STEP 5 TIMER + CTA UPDATE — COMPLETE

**Build ID:** hwiz64x2
**Timestamp:** 2026-04-05T00:56:17.069Z
**File Modified:** `src/components/OwnerUpsellDashboard.tsx`
**Status:** ✅ Production-Ready

---

## TARGET CONFIRMATION ✅

**EXACT LOCATION MODIFIED:**
Step 5 screen inside `/your-agency/{agencySlug}` owner funnel flow

**IDENTIFIED BY:**
- Shows "missed clients" stat cards
- Shows "potential revenue" stat cards
- Shows red warning block
- Shows main activation CTA button
- Renders in OwnerUpsellDashboard component

**NO OTHER PAGES AFFECTED:**
- State pages: Unchanged ✓
- Other Agencies section: Unchanged ✓
- Top 25 cards: Unchanged ✓
- Availability modals: Unchanged ✓
- /wp-admin pages: Unchanged ✓
- Other funnel steps (1-4): Unchanged ✓

---

## PART 1: DYNAMIC TIMER IMPLEMENTATION ✅

### Timer Text Added
```
{X} hours ago, a client request for your agency was routed to another agency in {state_name}.
```

### Exact Placement
**Line 363-368 in OwnerUpsellDashboard.tsx**

```tsx
{/* Activity Timer - shows between stats and warning block */}
<div className="bg-slate-50 border border-slate-200 rounded-lg px-2.5 py-2">
  <p className="text-xs md:text-sm text-slate-700 leading-snug">
    <span className="font-semibold text-slate-900">{activityTimerHours} hours ago</span>,
    a client request for your agency was routed to another agency in {displayStateName}.
  </p>
</div>
```

**Position:** Directly BELOW stat cards, directly ABOVE red warning block

---

## TIMER BEHAVIOR ✅

### Storage Key (Per-Agency)
```typescript
// Priority order:
1. activity_timer_{agencySlug}_step5
2. activity_timer_{normalizedAgencyName}_step5
3. activity_timer_{agencyId}_step5
```

### Initialization Logic (Lines 98-148)
```typescript
useEffect(() => {
  const normalizeSlug = (name: string) => {
    return name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
  };

  const storageKey = agencySlug
    ? `activity_timer_${agencySlug}_step5`
    : agencyName
    ? `activity_timer_${normalizeSlug(agencyName)}_step5`
    : `activity_timer_${agencyId}_step5`;

  try {
    const stored = localStorage.getItem(storageKey);
    const now = Date.now();

    if (stored) {
      // EXISTING VISITOR
      const baseline = parseInt(stored, 10);
      if (!isNaN(baseline) && baseline > 0) {
        const elapsed = now - baseline;
        const elapsedHours = Math.max(1, Math.floor(elapsed / (1000 * 60 * 60)));

        // RESET AT 36 HOURS
        if (elapsedHours >= 36) {
          const randomHours = Math.floor(Math.random() * 6) + 1; // 1-6 hours
          const newBaseline = now - (randomHours * 60 * 60 * 1000);
          localStorage.setItem(storageKey, newBaseline.toString());
          setActivityTimerHours(randomHours);
        } else {
          setActivityTimerHours(elapsedHours);
        }
      } else {
        // INVALID DATA - REGENERATE
        const randomHours = Math.floor(Math.random() * 13) + 12; // 12-24 hours
        const newBaseline = now - (randomHours * 60 * 60 * 1000);
        localStorage.setItem(storageKey, newBaseline.toString());
        setActivityTimerHours(randomHours);
      }
    } else {
      // FIRST VISIT
      const randomHours = Math.floor(Math.random() * 13) + 12; // 12-24 hours
      const baseline = now - (randomHours * 60 * 60 * 1000);
      localStorage.setItem(storageKey, baseline.toString());
      setActivityTimerHours(randomHours);
    }
  } catch (err) {
    // LOCALSTORAGE NOT AVAILABLE - FALLBACK
    const randomHours = Math.floor(Math.random() * 13) + 12;
    setActivityTimerHours(randomHours);
  }
}, [agencyId, agencyName, agencySlug]);
```

### Timer Behavior Examples

**First Visit (Day 1, 10:00 AM):**
```
Random: 18 hours
Baseline: 10:00 AM - 18h = Yesterday 4:00 PM
Display: "18 hours ago"
```

**Return Visit (Day 1, 12:00 PM):**
```
Elapsed: 12:00 PM - Yesterday 4:00 PM = 20 hours
Display: "20 hours ago"
```

**Return Visit (Day 2, 10:00 AM):**
```
Elapsed: 10:00 AM - Yesterday 4:00 PM = 42 hours
Reset triggered (>= 36 hours)
New random: 3 hours
New baseline: 10:00 AM - 3h = Today 7:00 AM
Display: "3 hours ago"
```

### Safety Features ✅
- Handles missing localStorage ✓
- Handles invalid timestamps ✓
- Handles missing slug/name ✓
- Regenerates safely if needed ✓
- Fallback to agencyId if slug unavailable ✓
- Never breaks the page ✓

---

## PART 2: CTA UPDATE ✅

### Button Text Changed
**Line 416 in OwnerUpsellDashboard.tsx**

**OLD:**
```tsx
<span>Stop losing clients — activate now</span>
```

**NEW:**
```tsx
<span>Start receiving clients now</span>
```

### Subtext Updated
**Lines 421-422 in OwnerUpsellDashboard.tsx**

**REMOVED:**
```tsx
<p className="text-xs text-slate-300 font-medium">Activation takes less than 30 seconds</p>
<p className="text-[11px] text-slate-400">New client requests are coming in right now</p>
```

**REPLACED WITH:**
```tsx
<p className="text-xs text-slate-300 font-medium">Start receiving all client requests directly to your agency</p>
<p className="text-[11px] text-slate-400">This gets unlocked instantly after activation</p>
```

---

## BEFORE vs AFTER COMPARISON

### Before Step 5
```
┌─────────────────────────────────────────┐
│ Stat Cards                              │
│ ├─ 12 missed client requests            │
│ └─ $10,000 lost potential revenue       │
├─────────────────────────────────────────┤
│ [RED WARNING BLOCK]                     │
│ You are currently receiving 0 requests  │
├─────────────────────────────────────────┤
│ CTA BUTTON                              │
│ ⚡ Stop losing clients — activate now   │
│                                         │
│ Activation takes less than 30 seconds   │
│ New client requests are coming in...    │
└─────────────────────────────────────────┘
```

### After Step 5
```
┌─────────────────────────────────────────┐
│ Stat Cards                              │
│ ├─ 12 missed client requests            │
│ └─ $10,000 lost potential revenue       │
├─────────────────────────────────────────┤
│ [TIMER TEXT - NEW!]                     │
│ 18 hours ago, a client request for      │
│ your agency was routed to another       │
│ agency in New Jersey.                   │
├─────────────────────────────────────────┤
│ [RED WARNING BLOCK]                     │
│ You are currently receiving 0 requests  │
├─────────────────────────────────────────┤
│ CTA BUTTON                              │
│ ⚡ Start receiving clients now          │
│                                         │
│ Start receiving all client requests     │
│ directly to your agency                 │
│ This gets unlocked instantly after...   │
└─────────────────────────────────────────┘
```

---

## PER-AGENCY TIMER VERIFICATION ✅

### Test Scenario

**Agency A (VazAgency):**
- First visit: 15 hours ago
- Storage key: `activity_timer_vazagency_step5`
- Display: "15 hours ago, a client request..."

**Agency B (Digital Boost):**
- First visit: 22 hours ago
- Storage key: `activity_timer_digital-boost_step5`
- Display: "22 hours ago, a client request..."

**Agency A (Return 3 hours later):**
- Elapsed: 18 hours
- Display: "18 hours ago, a client request..."

**Agency B (Return 10 hours later):**
- Elapsed: 32 hours
- Display: "32 hours ago, a client request..."

**Agency A (Return 20 hours later - total 38h):**
- Reset triggered (>= 36h)
- New random: 4 hours
- Display: "4 hours ago, a client request..."

✅ **Each agency has independent timer**
✅ **Timers increase correctly over time**
✅ **Reset works at 36 hours**

---

## VERIFICATION CHECKLIST ✅

### Changes Applied
- [x] Timer text added between stats and warning block
- [x] Timer uses exact text format specified
- [x] Timer shows dynamic hours based on elapsed time
- [x] Timer is per-agency (unique localStorage key)
- [x] Timer increases on each visit
- [x] Timer resets at 36 hours
- [x] CTA button text updated
- [x] CTA subtext updated (both lines)
- [x] Old text completely removed

### Safety Checks
- [x] Changes only in OwnerUpsellDashboard.tsx
- [x] No other pages affected
- [x] No layout changes
- [x] No stat card changes
- [x] No warning block changes
- [x] localStorage handles errors gracefully
- [x] Fallback for missing localStorage
- [x] Build successful (0 errors)

### Behavior Verification
- [x] Timer initializes 12-24 hours on first visit
- [x] Timer increases by real elapsed time
- [x] Timer minimum is 1 hour
- [x] Timer resets to 1-6 hours at 36h elapsed
- [x] Each agency has separate timer
- [x] Timer survives page refresh
- [x] Timer works without agencySlug (fallback to name/id)

---

## CODE CHANGES SUMMARY

### File Modified
`src/components/OwnerUpsellDashboard.tsx`

### Lines Changed
- **46-55:** Added `agencySlug` to interface
- **57-66:** Added `agencySlug` to component params
- **69:** Added `activityTimerHours` state
- **98-148:** Added timer initialization useEffect
- **363-368:** Added timer text JSX
- **416:** Updated button text
- **421-422:** Updated subtext

### Total Changes
- +58 lines (timer logic + display)
- -2 lines (old subtext removed)
- Net: +56 lines

---

## PRODUCTION READINESS ✅

**Build Status:** Clean (Build ID: hwiz64x2)
**TypeScript:** 0 errors
**SEO Checks:** All passed (52 states)
**Prerender:** Successful
**Risk Level:** Very Low
**Rollback Time:** <5 minutes
**Confidence:** Very High

---

## USAGE

### Where This Appears
1. `/your-agency/{agencySlug}` → Step 5 (after checking availability)
2. Owner preview demo on state pages → Step 5
3. Placeholder agency preview → Step 5

### When Timer Updates
- First visit: Shows random 12-24 hours
- Each subsequent visit: Shows actual elapsed time
- After 36 hours: Resets to random 1-6 hours

### localStorage Keys
```javascript
// Examples:
activity_timer_vazagency_step5
activity_timer_digital-boost-marketing_step5
activity_timer_garden-state-digital_step5
```

---

## TESTING INSTRUCTIONS

### Test Timer Initialization
1. Clear localStorage
2. Visit agency Step 5
3. Check timer shows 12-24 hours
4. Check localStorage has baseline timestamp

### Test Timer Increment
1. Note current timer value (e.g., 18 hours)
2. Manually adjust localStorage baseline back 2 hours
3. Refresh page
4. Timer should show 20 hours

### Test Timer Reset
1. Manually set localStorage baseline 40 hours ago
2. Refresh page
3. Timer should reset to 1-6 hours

### Test Per-Agency Independence
1. Visit Agency A Step 5 → note timer (e.g., 15h)
2. Visit Agency B Step 5 → note timer (e.g., 22h)
3. Return to Agency A → should still show 15h (or slightly more)

---

## CONFIRMATION ✅

✅ Timer text added with exact format
✅ Timer placed between stats and warning block
✅ Timer increases based on real elapsed time
✅ Timer is per-agency (unique storage keys)
✅ Timer resets at 36 hours
✅ CTA button text updated to "Start receiving clients now"
✅ CTA subtext updated with benefit-focused copy
✅ Old text removed completely
✅ Only Step 5 affected
✅ No other pages modified
✅ Build successful
✅ Production-ready

---

**Status:** Implementation complete. Step 5 now has dynamic per-agency timer and improved CTA messaging.
