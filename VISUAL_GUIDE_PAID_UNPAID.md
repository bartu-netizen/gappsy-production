# 🎨 Visual Guide: Paid vs Unpaid Agencies

## Side-by-Side Comparison

### Paid Agency (Normal Display)
```
┌───────────────────────────────────────┐
│                                       │
│    [1]         [Agency Logo]          │
│                                       │
│    Agency Name Here                   │
│                                       │
│    This is a description of the       │
│    agency and what they offer...      │
│                                       │
│    [SEO] [PPC] [Web Dev] [Design]     │
│                                       │
│    [Check Availability →]             │
│                                       │
└───────────────────────────────────────┘
```

**Characteristics:**
- No badge
- Normal description
- Blue "Check Availability" button
- Professional appearance

---

### Unpaid Agency (Placeholder Display)
```
┌───────────────────────────────────────┐
│                          [Placeholder]│ ← Amber badge
│    [5]         [Agency Logo]          │
│                                       │
│    Agency Name Here                   │
│                                       │
│    This is a description of the       │
│    agency and what they offer...      │
│                                       │
│    [SEO] [PPC] [Web Dev] [Design]     │
│                                       │
│    [Claim This Spot]                  │ ← Green button
│                                       │
└───────────────────────────────────────┘
```

**Characteristics:**
- Amber "Placeholder" badge (top-right)
- Same description format
- Green "Claim This Spot" button
- Call-to-action emphasis

---

## Color Coding

### Badge Colors
- **Placeholder badge:** Amber/Yellow (#fef3c7 background, #92400e text)
- **Border:** Amber (#fde68a)

### Button Colors
- **Paid agencies:** Standard blue/indigo theme
- **Unpaid agencies:** Green gradient (#10b981 → #059669)

---

## State Page Examples

### Example 1: New Jersey (All Paid)
```
Top 25 Marketing Agencies in New Jersey

[Spotlight Section]

[Agency 1 - No badge] ← Paid
[Agency 2 - No badge] ← Paid
[Agency 3 - No badge] ← Paid
...
[Agency 25 - No badge] ← Paid

Debug: Paid: 25, Unpaid: 0
```

### Example 2: Alabama (All Placeholders)
```
Top 25 Marketing Agencies in Alabama

[Spotlight Section]

[Agency 1 - Placeholder badge] ← Unpaid
[Agency 2 - Placeholder badge] ← Unpaid
[Agency 3 - Placeholder badge] ← Unpaid
...
[Agency 25 - Placeholder badge] ← Unpaid

Debug: Paid: 0, Unpaid: 25
```

### Example 3: Mixed State
```
Top 25 Marketing Agencies in California

[Spotlight Section]

[Agency 1 - No badge] ← Paid
[Agency 2 - No badge] ← Paid
[Agency 3 - Placeholder badge] ← Unpaid
[Agency 4 - Placeholder badge] ← Unpaid
[Agency 5 - No badge] ← Paid
...

Debug: Paid: 12, Unpaid: 13
```

---

## User Flow

### For Paid Agencies (Rank 2-25)
1. User sees agency card (no badge)
2. Clicks "Check Availability"
3. Availability modal opens
4. User submits inquiry

### For Unpaid Placeholders
1. User sees agency card with "Placeholder" badge
2. Clicks "Claim This Spot" (green button)
3. Submit agency modal opens
4. User submits application to claim that rank

### For Rank #1 Paid
1. User sees agency card (no badge)
2. Clicks "Visit Website →"
3. Opens agency website in new tab

---

## Debug Panel Visualization

### All Placeholders (Imported but Not Paid)
```
🐛 DEBUG INFO
──────────────────────────────────────
State Slug:   alabama
State Name:   Alabama
DB Rows:      25
Total Shown:  25
Paid:         0  ← Green text (no paid yet)
Unpaid:       25 ← Amber text (all placeholders)
First Agency: ABC Marketing
JSON Meta:    loaded
```

### Mixed (Some Paid, Some Unpaid)
```
🐛 DEBUG INFO
──────────────────────────────────────
State Slug:   california
State Name:   California
DB Rows:      25
Total Shown:  25
Paid:         12 ← Green text (12 paid)
Unpaid:       13 ← Amber text (13 placeholders)
First Agency: XYZ Digital
JSON Meta:    loaded
```

### All Paid (Fully Monetized)
```
🐛 DEBUG INFO
──────────────────────────────────────
State Slug:   new-york
State Name:   New York
DB Rows:      25
Total Shown:  25
Paid:         25 ← Green text (all paid)
Unpaid:       0  ← Amber text (none unpaid)
First Agency: TopAgency NYC
JSON Meta:    loaded
```

---

## Mobile vs Desktop

### Mobile View
```
┌─────────────────┐
│   [Placeholder] │ ← Badge top-right
│                 │
│  [1]   [Logo]   │
│                 │
│  Agency Name    │
│                 │
│  Description... │
│                 │
│  [Services]     │
│                 │
│  [Claim Spot]   │ ← Full width button
└─────────────────┘
```

### Desktop View
```
┌────────────────────────────────┐
│                   [Placeholder] │ ← Badge top-right
│  [1]        [Logo]              │
│                                 │
│  Agency Name                    │
│                                 │
│  Description text here spans    │
│  multiple lines on desktop...   │
│                                 │
│  [SEO] [PPC] [Web] [Design]     │
│                                 │
│         [Claim This Spot]       │ ← Centered button
└────────────────────────────────┘
```

---

## Accessibility

### Screen Reader Announcements

**Paid Agency:**
```
"Agency card, rank 1
Agency Name: ABC Marketing
Description: Full service marketing...
Button: Check Availability"
```

**Unpaid Agency:**
```
"Agency card, rank 5
Badge: Placeholder
Agency Name: XYZ Digital  
Description: Digital marketing...
Button: Claim This Spot"
```

---

## CSS Classes Reference

### Badge
```css
.placeholder-badge {
  background: #fef3c7;
  color: #92400e;
  border: 1px solid #fde68a;
  padding: 0.25rem 0.75rem;
  border-radius: 9999px;
  font-size: 0.75rem;
  font-weight: 600;
}
```

### Claim Button
```css
.claim-spot-button {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
  /* inherits other styles from .agency-website-link */
}
```

---

## Business Logic

### When to Show Placeholder Badge
```javascript
if (!agency.isPaid) {
  // Show amber "Placeholder" badge
  // Show green "Claim This Spot" button
}
```

### When to Show Normal Display
```javascript
if (agency.isPaid) {
  // No badge
  // Show normal buttons ("Check Availability" or "Visit Website")
}
```

---

## Testing Checklist

### Visual Tests
- [ ] Placeholder badge appears on unpaid agencies
- [ ] Badge is amber/yellow colored
- [ ] Badge is positioned top-right
- [ ] "Claim This Spot" button is green
- [ ] Paid agencies have no badge
- [ ] Paid agencies have normal blue buttons

### Functional Tests
- [ ] Clicking "Claim This Spot" opens submit modal
- [ ] Clicking "Check Availability" opens availability modal
- [ ] Badge doesn't interfere with logo/rank
- [ ] Responsive on mobile and desktop

### Debug Panel Tests
- [ ] Paid count matches visual count
- [ ] Unpaid count matches visual count
- [ ] Total count = Paid + Unpaid

---

## Status

**Visual Design:** ✅ COMPLETE

**Color Coding:** ✅ AMBER + GREEN

**Responsive:** ✅ MOBILE + DESKTOP

**Accessibility:** ✅ SCREEN READER FRIENDLY

**Testing:** ✅ READY

All agencies now display with clear visual distinction between paid and unpaid status.
