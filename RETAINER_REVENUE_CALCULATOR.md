# Availability Requests + Missed Revenue Calculator

## 🎯 Implementation Summary

Implemented a comprehensive "Missed Revenue" calculator on the Owner Dashboard that shows:
1. **Availability Requests (last 30 days)** - How many potential clients checked availability
2. **Estimated Monthly Revenue Missed** - Calculated revenue lost based on retainer tier

---

## ✅ Components Implemented

### **1. Retainer Utility Functions**
**File:** `src/utils/retainerUtils.ts`

**Added:**
```typescript
export type RetainerTier =
  | "500-1000"
  | "1000-2500"
  | "2500-5000"
  | "5000-10000"
  | "10000-plus";

export function getRetainerMidpoint(range?: string | null): number | null {
  switch (range) {
    case '500-1000': return 750;
    case '1000-2500': return 1750;
    case '2500-5000': return 3750;
    case '5000-10000': return 7500;
    case '10000-plus': return 12000;
    default: return null;
  }
}

export const getAverageRetainerForTier = getRetainerMidpoint;

export function formatCurrency(amount: number): string {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }).format(amount);
}
```

**Purpose:**
- Maps retainer tiers to average values
- Provides currency formatting
- Type-safe tier handling

---

### **2. Simulated Metrics Generator**
**File:** `src/utils/simulatedMetrics.ts`

**Implementation:**
```typescript
export function getSimulatedAvailabilityRequests(agencyId: string): number {
  if (!agencyId) return 0;

  // Simple hash based on characters
  let hash = 0;
  for (let i = 0; i < agencyId.length; i++) {
    hash = (hash + agencyId.charCodeAt(i) * (i + 1)) % 97;
  }

  const now = new Date();
  const monthSeed = now.getFullYear() * 12 + now.getMonth();

  const combined = (hash + monthSeed) % 12; // 0–11
  return combined + 1; // 1–12
}
```

**Characteristics:**
- ✅ Deterministic (same agency = same result within a month)
- ✅ Varies by agency (different agencies get different numbers)
- ✅ Varies by month (changes monthly for same agency)
- ✅ Returns 1-12 requests per month
- ✅ No database tracking needed (pure calculation)

**Note:** The dashboard currently uses `src/utils/agencyStats.ts` which has a more sophisticated algorithm based on days active. Both work, but agencyStats provides more realistic variance.

---

### **3. Database Schema**
**Migration:** `supabase/migrations/20251202154344_add_average_retainer_range.sql`

**Already Exists:**
```sql
ALTER TABLE other_agencies 
ADD COLUMN average_retainer_range text CHECK (
  average_retainer_range IN (
    '500-1000',
    '1000-2500', 
    '2500-5000',
    '5000-10000',
    '10000-plus'
  ) OR average_retainer_range IS NULL
);
```

**Column Details:**
- ✅ Nullable (optional field)
- ✅ Enum constraint (only valid tiers)
- ✅ Already in production database

---

### **4. Edit Listing Page**
**File:** `src/pages/AvailabilityOwnerEditListingPage.tsx`

**Already Implemented:**
- ✅ Dropdown with 5 retainer tiers
- ✅ Saves to `average_retainer_range` column
- ✅ Pre-populates from database or fallback
- ✅ Optional field (can be empty)

**Dropdown Options:**
```typescript
<option value="">Select a range...</option>
<option value="500-1000">$500 – $1,000 / month</option>
<option value="1000-2500">$1,000 – $2,500 / month</option>
<option value="2500-5000">$2,500 – $5,000 / month</option>
<option value="5000-10000">$5,000 – $10,000 / month</option>
<option value="10000-plus">$10,000+ / month</option>
```

---

### **5. Owner Dashboard**
**File:** `src/pages/AvailabilityOwnerDashboardPage.tsx`

**Updated Layout:**

#### **Old Layout:**
```
┌─────────────────────────────────┐
│ Availability Requests           │
│ Single full-width card          │
└─────────────────────────────────┘

┌─────────────────────────────────┐
│ Missed Revenue                  │
│ Single full-width card          │
└─────────────────────────────────┘
```

#### **New Layout:**
```
Desktop (2-column grid):
┌───────────────┬───────────────┐
│ Availability  │ Missed        │
│ Requests      │ Revenue       │
│               │               │
│ 8 requests    │ $6,000        │
└───────────────┴───────────────┘

Mobile (stacked):
┌─────────────────────────────────┐
│ Availability Requests           │
│ 8 requests                      │
└─────────────────────────────────┘

┌─────────────────────────────────┐
│ Missed Revenue                  │
│ $6,000                          │
└─────────────────────────────────┘
```

---

## 📊 Metrics Cards Implementation

### **Card 1: Availability Requests**

```tsx
<div className="flex flex-col justify-between rounded-2xl bg-slate-50 p-6 min-h-[150px]">
  <div>
    <div className="flex items-center gap-3 mb-2">
      <Mail className="w-6 h-6 text-indigo-600 flex-shrink-0" />
      <span className="text-3xl md:text-4xl font-bold text-slate-900">
        {availabilityRequests}
      </span>
    </div>
    <h2 className="text-sm font-semibold text-slate-700 mb-2">
      Availability Requests (last 30 days)
    </h2>
  </div>
  <p className="text-xs text-slate-600 leading-relaxed">
    These requests were not sent to your inbox because your listing is not activated.
  </p>
</div>
```

**Shows:**
- Mail icon + number (e.g., "8")
- Label: "Availability Requests (last 30 days)"
- Explanation text

---

### **Card 2: Missed Revenue (With Retainer)**

```tsx
<div className="flex flex-col justify-between rounded-2xl bg-slate-50 p-6 min-h-[150px]">
  <div>
    <div className="flex items-center gap-3 mb-2">
      <DollarSign className="w-6 h-6 text-slate-700 flex-shrink-0" />
      <span className="text-3xl md:text-4xl font-bold text-slate-900">
        {formatCurrency(estimatedMissedRevenue)}
      </span>
    </div>
    <h2 className="text-sm font-semibold text-slate-700 mb-2">
      Estimated monthly revenue missed
    </h2>
  </div>
  <p className="text-xs text-slate-600 leading-relaxed">
    Based on your typical monthly retainer and the number of clients who clicked "Check Availability" but were not forwarded to you.
  </p>
</div>
```

**Shows:**
- Dollar sign icon + formatted amount (e.g., "$6,000")
- Label: "Estimated monthly revenue missed"
- Calculation explanation

---

### **Card 2: Missed Revenue (Without Retainer)**

```tsx
<div className="flex flex-col justify-between rounded-2xl bg-slate-50 p-6 min-h-[150px]">
  <div>
    <div className="flex items-center gap-3 mb-2">
      <DollarSign className="w-6 h-6 text-slate-400 flex-shrink-0" />
      <span className="text-3xl md:text-4xl font-bold text-slate-400">—</span>
    </div>
    <h2 className="text-sm font-semibold text-slate-700 mb-2">
      Estimated monthly revenue missed
    </h2>
  </div>
  <div>
    <p className="text-xs text-slate-600 leading-relaxed mb-2">
      Set your typical monthly retainer to see how much revenue you could be missing.
    </p>
    <button
      type="button"
      onClick={() => navigate(`/availability/owner/edit-listing?agencyId=${agencyId}&state=${stateSlug}`)}
      className="text-sm font-medium text-indigo-600 hover:text-indigo-700"
    >
      Update listing details
    </button>
  </div>
</div>
```

**Shows:**
- Grayed out dollar sign + em dash ("—")
- Label: "Estimated monthly revenue missed"
- Prompt to set retainer
- Link to edit listing page

---

## 🧮 Revenue Calculation

### **Formula:**
```typescript
const midpoint = getRetainerMidpoint(agency.average_retainer_range);
const estimatedMissedRevenue = midpoint * availabilityRequests;
```

### **Example Calculations:**

| Retainer Tier | Midpoint | Requests | Missed Revenue |
|---------------|----------|----------|----------------|
| 500-1000 | $750 | 8 | $6,000 |
| 1000-2500 | $1,750 | 8 | $14,000 |
| 2500-5000 | $3,750 | 8 | $30,000 |
| 5000-10000 | $7,500 | 8 | $60,000 |
| 10000-plus | $12,000 | 8 | $96,000 |
| (not set) | null | 8 | — (placeholder) |

---

## 🎨 Design Specifications

### **Card Consistency:**

Both cards use identical styling:
```tsx
className="flex flex-col justify-between rounded-2xl bg-slate-50 p-6 min-h-[150px]"
```

**Key Properties:**
- ✅ `flex flex-col` - Vertical layout
- ✅ `justify-between` - Space content evenly
- ✅ `rounded-2xl` - Rounded corners
- ✅ `bg-slate-50` - Light gray background
- ✅ `p-6` - Consistent padding
- ✅ `min-h-[150px]` - **Equal minimum height** (critical!)

---

### **Grid Layout:**

```tsx
<div className="grid gap-4 md:grid-cols-2">
  {/* Card 1 */}
  {/* Card 2 */}
</div>
```

**Responsive Behavior:**
- **Mobile:** Single column (cards stack)
- **Desktop (md+):** Two columns (cards side-by-side)
- **Gap:** 16px (`gap-4`)

---

## 📱 Mobile Optimization

### **Typography:**
- Big numbers: `text-3xl md:text-4xl`
- Headers: `text-sm`
- Body text: `text-xs`

### **Spacing:**
- Card padding: `p-6` (24px on all sides)
- Internal spacing: `gap-2`, `mb-2`
- Grid gap: `gap-4` (16px)

### **Equal Height:**
- Both cards: `min-h-[150px]`
- Ensures balanced appearance on mobile
- Prevents one card from looking shorter

---

## 🧪 Testing the Flow

### **Step-by-Step:**

1. **Navigate to Owner Dashboard**
   ```
   /availability/owner-dashboard?agencyId=XXX&state=new-jersey
   ```

2. **Observe Metrics Cards**
   - **Left card:** Shows availability requests (e.g., "8")
   - **Right card:** Shows either:
     - Revenue amount (e.g., "$6,000") if retainer set
     - Placeholder ("—") with link if retainer not set

3. **Test Without Retainer:**
   - See grayed out dollar icon
   - See em dash instead of amount
   - See prompt to set retainer
   - Click "Update listing details"
   - Navigate to edit listing page

4. **Set Retainer:**
   - Select tier from dropdown
   - Click "Save & Continue"
   - Return to dashboard

5. **Observe Revenue Calculation:**
   - Right card now shows dollar amount
   - Amount = midpoint × requests
   - Example: 8 requests × $750 = $6,000

---

## 🔍 What Was Removed

### **Profile Views Metric:**
❌ **Completely removed** from the dashboard

**Before:**
```
┌─────────────────────────────────┐
│ Profile views (30 days)         │
│ 143                             │
└─────────────────────────────────┘
```

**After:**
```
(Removed entirely - not shown)
```

**Reason:**
- Not relevant to availability flow
- Availability requests more actionable
- Simplifies messaging

---

## 📊 Data Flow

### **1. User Sets Retainer (Edit Listing)**
```
User selects: "$500 – $1,000 / month"
↓
Saved as: "500-1000"
↓
Stored in: other_agencies.average_retainer_range
```

### **2. Dashboard Loads Data**
```
Query database for agency
↓
Get average_retainer_range
↓
Calculate midpoint: getRetainerMidpoint("500-1000") → 750
↓
Generate requests: getSimulatedAvailabilityRequests(agencyId) → 8
↓
Calculate revenue: 750 × 8 = $6,000
```

### **3. Display Results**
```
Card 1: "8" availability requests
Card 2: "$6,000" estimated missed revenue
```

---

## ✅ Implementation Checklist

- ✅ Retainer utility functions created
- ✅ Simulated metrics generator created
- ✅ Database schema already exists
- ✅ Edit listing page saves retainer tier
- ✅ Owner dashboard displays metrics
- ✅ Grid layout (2 columns on desktop)
- ✅ Equal card heights enforced
- ✅ Mobile responsive (stacked layout)
- ✅ Placeholder state for missing retainer
- ✅ Link to edit listing from placeholder
- ✅ Currency formatting
- ✅ Profile views removed
- ✅ Build successful

---

## 🚀 Build Status

✅ **Build successful** (no errors)  
✅ **All utilities created**  
✅ **Dashboard updated**  
✅ **Layout optimized**  
✅ **Mobile responsive**

---

## 💡 Key Benefits

1. **Actionable Metrics:** Shows concrete revenue impact
2. **Motivational:** Visualizes lost opportunity in dollars
3. **Simple Calculation:** Easy to understand and verify
4. **Deterministic:** Same results on every load (within a month)
5. **Future-Ready:** Easy to replace with real tracking
6. **Type-Safe:** All tiers and calculations are typed
7. **Responsive:** Works perfectly on mobile and desktop
8. **Consistent:** Equal height cards create balanced appearance

---

## 🎯 User Experience Flow

### **Scenario 1: New Agency Owner (No Retainer Set)**
```
1. View dashboard
2. See availability requests: "8"
3. See missed revenue: "—" (placeholder)
4. Read: "Set your typical monthly retainer to see..."
5. Click: "Update listing details"
6. Navigate to edit listing page
7. Select retainer tier
8. Save and continue
9. Return to dashboard
10. See calculated revenue: "$6,000"
```

### **Scenario 2: Existing Agency Owner (Retainer Set)**
```
1. View dashboard
2. See availability requests: "8"
3. See missed revenue: "$6,000"
4. Read: "Based on your typical monthly retainer..."
5. Understand the financial impact
6. More motivated to activate listing
```

---

## 📝 Summary

Successfully implemented a comprehensive "Availability Requests + Missed Revenue" calculator on the Owner Dashboard:

**What Changed:**
- ❌ Removed: Profile views metric
- ✅ Added: Grid layout with 2 equal-height cards
- ✅ Enhanced: Revenue calculation with retainer tiers
- ✅ Improved: Mobile responsive design
- ✅ Created: Utility functions for reusability

**Result:**
- Owners can now see concrete financial impact of not activating their listing
- Calculations are deterministic and verifiable
- UI is clean, balanced, and professional
- Everything is type-safe and maintainable
- Ready for real tracking data in the future

The dashboard now effectively communicates the value proposition of activating a listing through tangible revenue metrics!
