# STEP 5 VISUAL REFERENCE

## DESKTOP VIEW

```
┌──────────────────────────────────────────────────────────────────┐
│                                                                  │
│  ┌─────────────────────┐  ┌──────────────────────────────────┐ │
│  │        12           │  │         $10,000                  │ │
│  │                     │  │                                  │ │
│  │  You missed 12      │  │  You already lost in potential   │ │
│  │  client requests    │  │  revenue                         │ │
│  └─────────────────────┘  └──────────────────────────────────┘ │
│                                                                  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  18 hours ago, a client request for your agency was       │ │
│  │  routed to another agency in New Jersey.                  │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                                                            │ │
│  │  You are currently receiving 0 of these requests          │ │
│  │                                                            │ │
│  │  New requests are being redirected right now              │ │
│  │                                                            │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                                                            │ │
│  │            ⚡ Start receiving clients now                  │ │
│  │                                                            │ │
│  │   Start receiving all client requests directly to your    │ │
│  │   agency                                                   │ │
│  │                                                            │ │
│  │   This gets unlocked instantly after activation           │ │
│  │                                                            │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
└──────────────────────────────────────────────────────────────────┘
```

## MOBILE VIEW

```
┌──────────────────────────────┐
│                              │
│  12          $10,000         │
│  You missed  You already     │
│  12 client   lost in         │
│  requests    potential       │
│              revenue         │
│                              │
│  ┌────────────────────────┐ │
│  │  18 hours ago, a       │ │
│  │  client request for    │ │
│  │  your agency was       │ │
│  │  routed to another     │ │
│  │  agency in New Jersey. │ │
│  └────────────────────────┘ │
│                              │
│  ┌────────────────────────┐ │
│  │  You are currently     │ │
│  │  receiving 0 of these  │ │
│  │  requests              │ │
│  │                        │ │
│  │  New requests are      │ │
│  │  being redirected...   │ │
│  └────────────────────────┘ │
│                              │
│  ┌────────────────────────┐ │
│  │                        │ │
│  │  ⚡ Start receiving    │ │
│  │  clients now           │ │
│  │                        │ │
│  │  Start receiving all   │ │
│  │  client requests...    │ │
│  │                        │ │
│  │  This gets unlocked    │ │
│  │  instantly...          │ │
│  │                        │ │
│  └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

## TIMER EXAMPLES OVER TIME

### Agency: VazAgency
### State: New Jersey

**First Visit (Monday 10:00 AM):**
```
18 hours ago, a client request for your agency was routed to another agency in New Jersey.
```

**Return Visit (Monday 2:00 PM - 4 hours later):**
```
22 hours ago, a client request for your agency was routed to another agency in New Jersey.
```

**Return Visit (Tuesday 10:00 AM - 24 hours later):**
```
42 hours ago → RESET → 3 hours ago, a client request for your agency was routed to another agency in New Jersey.
```

## COMPONENT HIERARCHY

```
OwnerUpsellDashboard
├─ Stat Cards Container
│  ├─ Missed Requests Card
│  └─ Lost Revenue Card
├─ [NEW] Activity Timer Text ⭐
├─ Warning Block (Critical/High/Info)
└─ CTA Container
   ├─ Button: "⚡ Start receiving clients now"
   └─ Subtext:
      ├─ "Start receiving all client requests..."
      └─ "This gets unlocked instantly..."
```

## KEY CHANGES

### 1. Timer Text (NEW)
- **Position:** Between stats and warning
- **Format:** "{X} hours ago, a client request for your agency was routed to another agency in {State}."
- **Dynamic:** Updates based on real elapsed time
- **Per-Agency:** Each agency has independent timer
- **Reset:** Resets after 36 hours

### 2. Button Text (UPDATED)
- **Old:** "Stop losing clients — activate now"
- **New:** "Start receiving clients now"
- **Benefit:** More positive, action-oriented

### 3. Subtext (UPDATED)
- **Old Line 1:** "Activation takes less than 30 seconds"
- **New Line 1:** "Start receiving all client requests directly to your agency"
- **Old Line 2:** "New client requests are coming in right now"
- **New Line 2:** "This gets unlocked instantly after activation"
- **Benefit:** Focuses on outcome, not process

## COLOR SCHEME

### Timer Text
- Background: `bg-slate-50`
- Border: `border-slate-200`
- Text: `text-slate-700`
- Hours (bold): `text-slate-900`

### CTA Button
- Background: `bg-white`
- Text: `text-slate-900`
- Container: `bg-gradient-to-br from-slate-800 to-slate-900`

### Subtext
- Line 1: `text-slate-300` (lighter)
- Line 2: `text-slate-400` (lightest)

## RESPONSIVE DESIGN

### Timer Text
- **Mobile:** `text-xs` (12px)
- **Desktop:** `text-sm` (14px)

### Stat Cards
- **Mobile:** Grid 2 columns, compact spacing
- **Desktop:** Grid 2 columns, more padding

### CTA Section
- **Mobile:** Full width, centered
- **Desktop:** Full width, centered

## VERIFICATION

✅ Timer appears between stats and warning
✅ Timer text format matches specification
✅ Timer increases over time
✅ Timer is per-agency
✅ CTA text updated
✅ Subtext updated
✅ Old text removed
✅ Layout preserved
✅ Responsive on mobile + desktop
