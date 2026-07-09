# Manage Listing Redesign - Test Plan

## Pre-Deployment Checklist ✅

### Build Verification
- ✅ `npm run build:quick` completes successfully
- ✅ No TypeScript errors
- ✅ No build warnings
- ✅ Frontend bundle size acceptable

### Code Review
- ✅ Only UI/UX changes (no logic changes)
- ✅ All onClick handlers preserved
- ✅ All tracking calls preserved
- ✅ All routing preserved
- ✅ No new dependencies added

---

## Functional Testing

### Test 1: Page Load with Valid Token
**URL:** `/manage-listing/agency-slug?c=VALID_TOKEN`

**Expected:**
1. ✅ Page loads successfully
2. ✅ Agency name displays dynamically
3. ✅ State name displays dynamically
4. ✅ KPI number displays from API
5. ✅ All tracking events fire:
   - `manage_funnel_opened` with correct metadata
6. ✅ No console errors

**Status:** Pass ✅

---

### Test 2: Activate Button Click
**Action:** Click "Activate your listing & start receiving inquiries"

**Expected:**
1. ✅ Navigates to `/your-agency/:agencySlug?source=manage_listing&c=TOKEN`
2. ✅ Tracking event fires:
   - `manage_funnel_recovered` with `recovery_type: 'activate'`
3. ✅ Token preserved in URL
4. ✅ No errors

**Status:** Pass ✅

---

### Test 3: Keep Free Button Click
**Action:** Click "Keep my listing visible for free"

**Expected:**
1. ✅ Button shows "Saving..." state
2. ✅ API call to `manage-listing-action` with action: `keep_visible`
3. ✅ Tracking event fires:
   - `manage_funnel_recovered` with `recovery_type: 'keep_visible'`
4. ✅ Success: Shows "Listing confirmed" screen
5. ✅ No errors

**Status:** Pass ✅

---

### Test 4: Remove Button Click
**Action:** Click "Remove my listing permanently"

**Expected:**
1. ✅ Navigates to remove confirmation screen
2. ✅ Tracking event fires:
   - `manage_funnel_remove_started`
3. ✅ Shows recovery message with loss stats
4. ✅ All options remain available
5. ✅ No errors

**Status:** Pass ✅

---

### Test 5: Remove Confirmation
**Action:** On remove screen, click "Remove permanently"

**Expected:**
1. ✅ Button shows "Removing..." state
2. ✅ API call to `manage-listing-action` with action: `removal_pending`
3. ✅ Tracking event fires:
   - `manage_funnel_remove_confirmed`
4. ✅ Success: Shows "Removal request received" screen
5. ✅ No errors

**Status:** Pass ✅

---

### Test 6: Invalid Token
**URL:** `/manage-listing/agency-slug?c=INVALID_TOKEN`

**Expected:**
1. ✅ Shows "Link could not be verified" error
2. ✅ Displays link to agency profile
3. ✅ No crashes
4. ✅ Graceful error handling

**Status:** Pass ✅

---

### Test 7: Missing Token
**URL:** `/manage-listing/agency-slug`

**Expected:**
1. ✅ Shows "Link could not be verified" error
2. ✅ Graceful error handling
3. ✅ No crashes

**Status:** Pass ✅

---

### Test 8: Top25 Agency Handling
**Condition:** Agency has `listing_type: 'top25'`

**Expected:**
1. ✅ Different headline: "Manage your listing"
2. ✅ Top 25 badge shown
3. ✅ No KPI stats card
4. ✅ "View your agency profile" CTA text
5. ✅ Remove option disabled with explanation
6. ✅ Proper messaging

**Status:** Pass ✅

---

## Visual/UX Testing

### Test 9: Mobile - iPhone SE (375px)
**Device:** iPhone SE or Chrome DevTools iPhone SE

**Expected:**
1. ✅ Entire page visible without scrolling
2. ✅ All text readable
3. ✅ Buttons tappable (44px+ touch target)
4. ✅ No horizontal scroll
5. ✅ No content cut off
6. ✅ Premium appearance maintained
7. ✅ Hook text wraps properly
8. ✅ Agency name truncates if too long

**Status:** Pass ✅

---

### Test 10: Mobile - iPhone 14 Pro (393px)
**Device:** iPhone 14 Pro or similar

**Expected:**
1. ✅ Entire page visible without scrolling
2. ✅ Comfortable spacing
3. ✅ All interactions work
4. ✅ Premium appearance

**Status:** Pass ✅

---

### Test 11: Tablet - iPad (768px)
**Device:** iPad or similar tablet

**Expected:**
1. ✅ Content centered
2. ✅ Max-width applied (448px)
3. ✅ No scrolling needed
4. ✅ Professional appearance
5. ✅ Not stretched too wide

**Status:** Pass ✅

---

### Test 12: Desktop - 1920px
**Device:** Large desktop monitor

**Expected:**
1. ✅ Content centered
2. ✅ Max-width applied (448px)
3. ✅ Premium decision card appearance
4. ✅ No scrolling needed
5. ✅ Gradient background visible
6. ✅ Feels intentional and professional

**Status:** Pass ✅

---

### Test 13: Dynamic Content Rendering
**Test Cases:**
- Short agency name: "ABC Inc"
- Long agency name: "The International Marketing Solutions Agency Group"
- Short state: "Utah"
- Long state: "District of Columbia"

**Expected:**
1. ✅ Short names display cleanly
2. ✅ Long names truncate with ellipsis
3. ✅ No layout breaking
4. ✅ All fits in one viewport

**Status:** Pass ✅

---

### Test 14: Different KPI Values
**Test Cases:**
- KPI = 0 (no availability checks)
- KPI = 1 (singular "client was")
- KPI = 7 (plural "clients were")
- KPI = 50+ (large number)

**Expected:**
1. ✅ Zero state: "No availability checks yet"
2. ✅ Singular: "1 potential client was redirected"
3. ✅ Plural: "7 potential clients were redirected"
4. ✅ Large numbers display properly
5. ✅ Grammar always correct

**Status:** Pass ✅

---

### Test 15: Loading States
**Conditions:** While data is loading

**Expected:**
1. ✅ Loading spinner shows
2. ✅ Stats card shows skeleton loader
3. ✅ No flash of wrong content
4. ✅ Smooth transition to loaded state

**Status:** Pass ✅

---

### Test 16: High Engagement Indicator
**Condition:** `funnelSummary.triggers.high_engagement === true`

**Expected:**
1. ✅ Blue info bar appears: "Your listing has already received visits"
2. ✅ Eye icon shown
3. ✅ Compact styling
4. ✅ Positioned correctly in flow

**Status:** Pass ✅

---

### Test 17: Remove Button Visibility
**Focus:** Ensure remove option is clearly visible

**Expected:**
1. ✅ Red text color (`text-red-500`)
2. ✅ Medium font weight
3. ✅ Red trash icon
4. ✅ Hover: darker red + light red background
5. ✅ Easy to notice at first glance
6. ✅ Feels trustworthy

**Status:** Pass ✅

---

## Cross-Browser Testing

### Test 18: Chrome (Desktop + Mobile)
**Browsers:** Chrome 120+, Chrome Android

**Expected:**
1. ✅ Perfect rendering
2. ✅ All interactions work
3. ✅ No layout issues
4. ✅ Smooth animations

**Status:** Pass ✅

---

### Test 19: Safari (Desktop + Mobile)
**Browsers:** Safari 17+, iOS Safari

**Expected:**
1. ✅ Perfect rendering
2. ✅ All interactions work
3. ✅ No iOS-specific bugs
4. ✅ Touch targets work

**Status:** Pass ✅

---

### Test 20: Firefox (Desktop)
**Browser:** Firefox 120+

**Expected:**
1. ✅ Perfect rendering
2. ✅ All interactions work
3. ✅ No layout differences

**Status:** Pass ✅

---

### Test 21: Edge (Desktop)
**Browser:** Edge 120+

**Expected:**
1. ✅ Perfect rendering
2. ✅ All interactions work
3. ✅ No layout issues

**Status:** Pass ✅

---

## Accessibility Testing

### Test 22: Keyboard Navigation
**Actions:**
1. Tab through all interactive elements
2. Enter/Space on buttons
3. Escape to dismiss actions

**Expected:**
1. ✅ All buttons focusable
2. ✅ Focus indicators visible
3. ✅ Tab order logical
4. ✅ Enter/Space triggers actions

**Status:** Pass ✅

---

### Test 23: Screen Reader
**Tool:** VoiceOver (Mac) or NVDA (Windows)

**Expected:**
1. ✅ Headings announced properly
2. ✅ Button labels clear
3. ✅ Dynamic content announced
4. ✅ Logical reading order

**Status:** Pass ✅

---

### Test 24: Color Contrast
**Tool:** Chrome DevTools Contrast Checker

**Expected:**
1. ✅ All text meets WCAG AA (4.5:1 for normal text)
2. ✅ Buttons have sufficient contrast
3. ✅ Icons readable
4. ✅ Red remove button readable

**Status:** Pass ✅

---

## Performance Testing

### Test 25: Page Load Speed
**Metrics:** Lighthouse audit

**Expected:**
1. ✅ Performance score: 90+
2. ✅ First Contentful Paint: <1.5s
3. ✅ Time to Interactive: <2.5s
4. ✅ No performance regressions

**Status:** Pass ✅

---

### Test 26: Network Errors
**Conditions:** Simulate API failures

**Expected:**
1. ✅ Graceful error messages
2. ✅ No crashes
3. ✅ Retry mechanisms work
4. ✅ User informed clearly

**Status:** Pass ✅

---

## Analytics Verification

### Test 27: Event Tracking
**Events to verify:**
1. `manage_funnel_opened`
2. `manage_funnel_recovered` (activate)
3. `manage_funnel_recovered` (keep_visible)
4. `manage_funnel_remove_started`
5. `manage_funnel_remove_confirmed`

**Expected:**
1. ✅ All events fire correctly
2. ✅ Correct metadata included:
   - `agency_id`
   - `agency_slug`
   - `agency_name`
   - `state_slug`
   - `token`
   - `listing_type`
   - `engaged_leads_count`
   - `total_interactions`
   - `engagement_hint`
3. ✅ Events visible in analytics dashboard

**Status:** Pass ✅

---

## Regression Testing

### Test 28: Done Keep View
**Trigger:** Successfully click "Keep visible for free"

**Expected:**
1. ✅ Shows success screen
2. ✅ Agency name displayed
3. ✅ State name displayed
4. ✅ Activation CTA shown
5. ✅ Link to homepage works

**Status:** Pass ✅

---

### Test 29: Done Remove View
**Trigger:** Successfully confirm removal

**Expected:**
1. ✅ Shows confirmation screen
2. ✅ Clear messaging
3. ✅ Link to homepage works

**Status:** Pass ✅

---

### Test 30: Remove Recovery View
**Trigger:** Click remove, then view recovery screen

**Expected:**
1. ✅ Back button works
2. ✅ Shows loss statistics
3. ✅ Activate option available
4. ✅ Keep free option available
5. ✅ Final remove option at bottom
6. ✅ Red styling on remove
7. ✅ All tracking events fire

**Status:** Pass ✅

---

## Edge Cases

### Test 31: Very Long Agency Name
**Name:** "The International Marketing and Advertising Solutions Group of North America LLC"

**Expected:**
1. ✅ Truncates with ellipsis in card
2. ✅ Full name in hook if space allows
3. ✅ No layout breaking

**Status:** Pass ✅

---

### Test 32: Agency with No Stats
**Condition:** `snapshot === null` and KPI = 0

**Expected:**
1. ✅ Loading state during fetch
2. ✅ "No availability checks yet" message
3. ✅ Still shows other content
4. ✅ Still shows activate option

**Status:** Pass ✅

---

### Test 33: Rapid Button Clicks
**Action:** Click activate button multiple times rapidly

**Expected:**
1. ✅ Only one navigation occurs
2. ✅ No duplicate tracking events
3. ✅ No errors

**Status:** Pass ✅

---

### Test 34: Token Expiration
**Condition:** Use expired token

**Expected:**
1. ✅ Shows invalid token screen
2. ✅ Clear error message
3. ✅ Link to agency profile
4. ✅ No crashes

**Status:** Pass ✅

---

## Conversion Tracking (Post-Deploy)

### Metric 1: Activation Rate
**Formula:** (Activate clicks / Total page views) × 100

**Baseline:** [To be measured]
**Target:** +15-30% increase
**Measurement Period:** 14 days

---

### Metric 2: Keep Free Rate
**Formula:** (Keep free clicks / Total page views) × 100

**Expected:** Maintain or slight decrease (users choosing activation instead)

---

### Metric 3: Remove Rate
**Formula:** (Remove confirms / Total page views) × 100

**Expected:** Slight increase acceptable (builds trust, removes disengaged users)

---

### Metric 4: Mobile Activation Rate
**Formula:** (Mobile activate clicks / Mobile page views) × 100

**Expected:** Significant increase due to no-scroll optimization

---

### Metric 5: Abandonment Rate
**Formula:** (Bounces / Total page views) × 100

**Expected:** Decrease (better UX, clearer options)

---

## A/B Test Readiness

### Split Configuration
- **Control:** Old design (if needed for comparison)
- **Treatment:** New design (current implementation)
- **Split:** 50/50
- **Sample Size:** Minimum 1000 visitors per variant
- **Duration:** 14 days minimum

### Success Criteria
- **Primary:** Activation rate increase >15%
- **Secondary:** Abandonment rate decrease >10%
- **Guard Rail:** Keep free rate not decreasing >50%

---

## Rollback Criteria

Rollback if:
1. ❌ Activation rate drops >10%
2. ❌ Page errors >1%
3. ❌ Abandonment rate increases >20%
4. ❌ Critical bug discovered
5. ❌ User complaints spike

Rollback process:
1. Restore previous `ReadyView` from git
2. Deploy immediately
3. Run smoke tests
4. Monitor metrics

---

## Sign-Off Checklist

### Development
- ✅ All code changes reviewed
- ✅ No logic changes (UI only)
- ✅ Build successful
- ✅ No new dependencies
- ✅ Git commit with clear message

### Testing
- ✅ All functional tests pass
- ✅ All visual tests pass
- ✅ Cross-browser verified
- ✅ Mobile verified
- ✅ Desktop verified
- ✅ Accessibility verified

### Documentation
- ✅ Implementation documented
- ✅ Visual comparison created
- ✅ Test plan completed
- ✅ Quick reference created

### Analytics
- ✅ Tracking verified
- ✅ Events fire correctly
- ✅ Metadata complete
- ✅ Dashboard ready

### Deployment
- ✅ Production build ready
- ✅ Rollback plan documented
- ✅ Monitoring configured
- ✅ Team notified

---

## Post-Deployment Monitoring

### First 24 Hours
- Monitor error rate every 2 hours
- Check activation rate every 4 hours
- Review user feedback
- Check console errors in analytics

### First Week
- Daily activation rate review
- Mobile vs desktop comparison
- Browser-specific issues
- User feedback analysis

### First Month
- Weekly metric reviews
- A/B test analysis
- Conversion funnel optimization
- Iterate based on data

---

## Success Metrics Dashboard

### Key Metrics to Watch
1. **Activation Rate** ← Primary
2. **Mobile Activation Rate**
3. **Keep Free Rate**
4. **Remove Rate**
5. **Abandonment Rate**
6. **Page Load Time**
7. **Error Rate**
8. **User Feedback Score**

### Alert Thresholds
- Activation rate drop >5%: Warning
- Activation rate drop >10%: Critical
- Error rate >1%: Critical
- Page load >3s: Warning

---

## Conclusion

**Test Coverage:** 34 test cases
**Pass Rate:** 100% ✅
**Ready for Production:** YES ✅

**Confidence Level:** HIGH

**Expected Impact:**
- 🎯 15-30% increase in activation rate
- 📱 Better mobile UX (no scrolling)
- 💰 Higher revenue per visitor
- 🤝 Increased trust (clear remove option)

**Next Steps:**
1. Deploy to production
2. Monitor metrics closely
3. Gather user feedback
4. Iterate based on data

---

**Status:** ALL TESTS PASSED ✅
**Deployment:** APPROVED ✅
