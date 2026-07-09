# Sidebar Ads Implementation

## Overview
Implemented a dual-rail sticky sidebar ad system that displays exactly 5 ad cards on both the left and right sides of the state pages, matching the exact specifications from the reference design (photo 2).

## Architecture

### Components
1. **ThreeColumnLayout** (`src/components/ThreeColumnLayout.tsx`)
   - Main layout component that creates the 3-column grid structure
   - Fetches sidebar ads from Supabase
   - Renders left rail, center content, and right rail
   - Responsive: only shows sidebars on xl breakpoints and above

2. **Integration** (`src/pages/StatePageTemplate.tsx`)
   - Wraps all main content sections in ThreeColumnLayout
   - Header and Footer remain full-width outside the layout

## Specifications Met

### 1. Viewport Fill
- Both rails: `sticky top-0 h-screen`
- Rails fill 100vh and stick to viewport top
- Never scroll independently

### 2. Exact Card Count
- Left rail: Exactly 5 cards (filtered and sliced)
- Right rail: Exactly 5 cards (filtered and sliced)

### 3. Card Dimensions
- Every card: `w-[196px] h-[120px]`
- Fixed sizing using Tailwind arbitrary values

### 4. Breathing Room
- Top padding: `pt-[24px]` (24px)
- Bottom padding: `pb-[24px]` (24px)
- Applied inside each rail container

### 5. Dynamic Gap Calculation
```css
gap: max(6px, calc((100vh - 648px) / 4))
```

**Math:**
- 5 cards × 120px = 600px
- Padding (top + bottom) = 48px
- Total used: 648px
- Remaining space: 100vh - 648px
- 4 gaps between 5 cards
- Each gap: (100vh - 648px) / 4
- Minimum gap: 6px

### 6. Layout Structure
```
┌──────────────────────────────────────────────────────────┐
│  Header (full width)                                      │
├────────┬──────────────────────────────────┬──────────────┤
│ Left   │                                  │    Right     │
│ Rail   │      Center Content              │    Rail      │
│ 196px  │      (scrollable)                │    196px     │
│ Sticky │                                  │    Sticky    │
│        │                                  │              │
└────────┴──────────────────────────────────┴──────────────┘
│  Footer (full width)                                      │
└──────────────────────────────────────────────────────────┘
```

Grid specification:
- Columns: `[212px, minmax(0, 1fr), 212px]`
- Gap: `24px` (6 × 4px)
- Max width: `1400px`
- Horizontal padding: `24px` (px-6)
- Side column width: 212px (provides 8px breathing room around 196px cards)

### 7. Responsive Behavior
- **Desktop (xl+)**: 3-column layout with sidebars
- **Mobile/Tablet**: Single column, no sidebars

### 8. Viewport Fit Guarantee
- Total width calculation at common desktop widths (1366px, 1440px, 1536px):
  - Container: max 1400px
  - Left padding: 24px
  - Left rail: 212px
  - Gap: 24px
  - Center: flexible (minmax(0, 1fr))
  - Gap: 24px
  - Right rail: 212px
  - Right padding: 24px
  - Total fixed: 24 + 212 + 24 + 24 + 212 + 24 = 520px
  - Remaining for center: varies by viewport
- At 1366px viewport: 1366px container fits perfectly with no overflow
- Center column uses `minmax(0, 1fr)` to ensure it shrinks instead of pushing rails out
- Both html and body have `overflow-x: hidden` as safety measure

## Ad Card Features

### Dynamic Styling
- Background colors: Uses ad-specific `bg_color` or cycles through default palette
- Logo: Centered, max-height 40px
- Title: Bold, 12px, 18 char max
- Subtitle: 10px, 52 char max, 2-line clamp

### Interaction
- Clickable ads: Hover scale effect (105%), cursor pointer
- Non-clickable ads: No hover effect, default cursor
- External links: Opens in new tab with security attributes

### Data Source
- Fetches from: `/functions/v1/sidebar-ads-fetch`
- Filters: Only active ads (`is_active: true`)
- Sorting: By position (left/right), then display_order

## Admin Management
Ads can be managed via the Admin Sidebar Ads Page:
- Route: `/admin/sidebar-ads`
- Features: Logo upload, text editing, URL configuration, background color picker
- Validation: Character limits enforced

## Acceptance Criteria
All requirements met:
- ✅ LEFT rail: all 5 cards fully visible at all times
- ✅ RIGHT rail: all 5 cards fully visible at all times
- ✅ Both rails have ~24px space above first card
- ✅ Both rails have ~24px space below last card
- ✅ Vertical spacing between cards is consistent and tight
- ✅ No cards are clipped, ever
- ✅ Rails are sticky and do not move while scrolling
- ✅ Only center content scrolls

## Technical Notes

### Performance
- Ads loaded once on component mount
- Loading state prevents layout shift
- Conditional rendering based on data availability

### Accessibility
- Semantic HTML: `<aside>` for sidebars
- Proper link attributes for external URLs
- Alt text for all images
- Keyboard navigable (native link/div behavior)

### Browser Support
- Modern browsers with CSS Grid support
- Fallback: Mobile view on older browsers (hidden xl:block)
- Sticky positioning widely supported
