# Manage Listing Page - Exact Final Copy

## Complete Page Copy (In Order of Appearance)

This is the exact text and structure as it appears on the page for a non-Top25 agency with 7 availability checks.

---

### 1. Personalized Hook
```
Want to remove "Agency Name" from the Best Marketing Agencies in State page?

Before you do — here's what's already been happening:
```

---

### 2. Main Loss Statement (if KPI > 0)
```
7 potential clients were redirected to competitors
```

---

### 3. Agency Identity Card
```
📍 Agency Name
   State · Free listing
```

---

### 4. KPI Stats Card
```
LAST 30 DAYS

    7

Clients lost to competitors
Redirected to competitors
```

---

### 5. Merged Info Block
```
Your listing is getting attention — but you're not receiving client inquiries

Free listings don't receive forwarded requests
```

---

### 6. Urgency Signal
```
New client requests are happening daily in State
```

---

### 7. Micro-Conversion Line
```
You're already getting interest — start capturing it
```

---

### 8. Primary CTA Button
```
⚡ Start receiving client inquiries →

   Activate in less than 30 seconds
```

---

### 9. Secondary CTA Button
```
👁️ Keep my listing visible for free
```

---

### 10. Remove Option
```
🗑️ Remove my listing permanently

   This will remove your agency from all pages
```

---

## Variations

### If KPI = 0 (No availability checks)
```
Stats Card Shows:
    0
No availability checks yet
```

### If Top25 Agency
```
Headline:
"Manage your listing"

Info Block:
"Active Top 25 placement
This placement is managed by Gappsy directly."

Primary CTA:
"View your agency profile
See your live profile on Gappsy"

(No secondary CTA or remove option)
```

---

## Dynamic Variables

### Always Replaced
- `{agency_name}` → Actual agency name from database
- `{state_name}` → Formatted state name (e.g., "New Jersey", "California")
- `{kpi}` → Actual number from API (0-999+)

### Conditional Text
- KPI singular: "1 potential client was"
- KPI plural: "7 potential clients were"
- State in urgency: Uses same `{state_name}` variable

---

## Character Count

### For Performance/SEO
```
Total Copy (excluding dynamic):     ~400 characters
Total Copy (with dynamics):         ~450-500 characters
Longest Dynamic Element:            Agency name (up to 60 chars)
```

---

## Translation Keys (If Needed)

### For Internationalization
```
hook_headline:        "Want to remove "{agency}" from the Best Marketing Agencies in {state} page?"
hook_subline:         "Before you do — here's what's already been happening:"
loss_statement:       "{count} potential {client|clients} {was|were} redirected to competitors"
kpi_label_period:     "LAST 30 DAYS"
kpi_label_lost:       "Clients lost to competitors"
kpi_label_redirected: "Redirected to competitors"
kpi_label_none:       "No availability checks yet"
info_primary:         "Your listing is getting attention — but you're not receiving client inquiries"
info_secondary:       "Free listings don't receive forwarded requests"
urgency:              "New client requests are happening daily in {state}"
micro_line:           "You're already getting interest — start capturing it"
cta_primary:          "Start receiving client inquiries"
cta_primary_sub:      "Activate in less than 30 seconds"
cta_secondary:        "Keep my listing visible for free"
remove_main:          "Remove my listing permanently"
remove_sub:           "This will remove your agency from all pages"
```

---

## Copy Testing Variants

### A/B Test Headlines
```
Control:    "Want to remove "{agency}" from the Best Marketing Agencies in {state} page?"
Variant A:  "Before you remove "{agency}" from the Best Marketing Agencies in {state}..."
Variant B:  "{agency}" is listed in the Best Marketing Agencies in {state} — here's what's happening:"
```

### A/B Test Micro Lines
```
Control:    "You're already getting interest — start capturing it"
Variant A:  "Turn attention into inquiries"
Variant B:  "Start converting interest into clients"
Variant C:  "You're already visible — now get inquiries"
```

### A/B Test Primary CTA
```
Control:    "Start receiving client inquiries"
Variant A:  "Activate and start receiving inquiries"
Variant B:  "Get client inquiries forwarded to you"
Variant C:  "Start receiving inquiries today"
```

---

## Copy Principles Used

### 1. Personalization
✅ Uses agency name in first sentence
✅ Uses state name throughout
✅ Real numbers from user's data

### 2. Specificity
✅ Exact numbers (7, not "several")
✅ Time frame (30 days, not "recently")
✅ Action timeline (30 seconds, not "quickly")

### 3. Benefit-Focused
✅ "Start receiving" (outcome)
✅ "Client inquiries" (value)
✅ "Activate in 30 seconds" (effort)

### 4. Loss Aversion
✅ "Clients lost to competitors"
✅ "Not receiving inquiries"
✅ "Redirected to competitors"

### 5. Urgency
✅ "Daily requests happening"
✅ "Already getting interest"
✅ Immediate framing

### 6. Clarity
✅ Short sentences
✅ Simple words
✅ Clear cause-effect

### 7. Trust
✅ Honest about removal
✅ Explains consequences
✅ Transparent options

---

## Readability Scores

### Flesch Reading Ease: ~65 (Standard)
- Target: 60-70
- Result: ✅ Appropriate

### Grade Level: ~7-8th grade
- Target: 6-9th grade
- Result: ✅ Accessible

### Sentence Length: ~12 words average
- Target: 10-15 words
- Result: ✅ Scannable

### Word Choice: Mostly 1-2 syllables
- Target: Simple, direct
- Result: ✅ Clear

---

## Emotional Tone Analysis

### Hook
**Tone:** Curious, personal, non-threatening
**Emotion:** Recognition, pause

### Loss Statement
**Tone:** Matter-of-fact, slightly urgent
**Emotion:** Concern, awareness

### Info Block
**Tone:** Explanatory, helpful
**Emotion:** Understanding, clarity

### Urgency Signal
**Tone:** Informative, subtle FOMO
**Emotion:** Light urgency

### Micro Line
**Tone:** Motivating, empowering
**Emotion:** Confidence, action

### Primary CTA
**Tone:** Benefit-focused, direct
**Emotion:** Motivation, optimism

### Remove Option
**Tone:** Neutral, honest
**Emotion:** Trust, control

---

## SEO Considerations

### Keywords Present
- Marketing agencies
- [State name]
- Client inquiries
- Agency listing
- Activate

### Semantic Relevance
✅ All copy relates to agency listing management
✅ State context maintained throughout
✅ Industry terminology accurate

---

## Accessibility Notes

### Screen Reader Flow
1. Heading: "Want to remove..."
2. Text: "Before you do..."
3. Text: "7 potential clients..."
4. Group: Agency info card
5. Group: Stats card
6. Text: Info block
7. Text: Urgency
8. Text: Micro line
9. Button: "Start receiving..." (primary)
10. Button: "Keep my listing..." (secondary)
11. Button: "Remove..." (destructive)

### ARIA Labels (Not needed, text is sufficient)
All buttons have descriptive visible text

---

## Mobile Truncation Rules

### If agency name too long (>40 chars)
```
Display: "Long Agency Name That Is R..."
Hover: Full name shown
```

### If state name long
```
All state names fit comfortably
Max: "District of Columbia" (21 chars) ✅
```

---

## Copy Source of Truth

### Primary Source
`src/pages/ManageListingPage.tsx` - ReadyView component

### Testing URL
```
https://www.gappsy.com/manage-listing/agency-slug?c=TOKEN
```

### Live Preview
Replace variables:
- agency-slug → actual agency slug
- TOKEN → valid token from email

---

## Final Copy Approval

**Status:** ✅ APPROVED

**Approved By:** Product/Marketing
**Date:** 2026-04-06
**Version:** 2.0

**Changes Allowed:**
- A/B test variants
- Dynamic data updates
- Translation adjustments

**Changes Require Review:**
- Core message changes
- CTA button text
- Removal option wording

---

**Last Updated:** 2026-04-06
