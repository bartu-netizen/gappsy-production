# Top25Header Component - Usage Examples

## Basic Usage

### New Jersey Page (Dark variant - default)
```tsx
import Top25Header from './components/Top25Header';

function NewJerseyPage() {
  return (
    <div>
      <Top25Header stateSlug="new-jersey" />
      {/* Rest of your page content */}
    </div>
  );
}
```

### Texas Page (Light variant)
```tsx
import Top25Header from './components/Top25Header';

function TexasPage() {
  return (
    <div>
      <Top25Header stateSlug="texas" variant="light" />
      {/* Rest of your page content */}
    </div>
  );
}
```

### California Page (Scroll Switch enabled)
```tsx
import Top25Header from './components/Top25Header';

function CaliforniaPage() {
  return (
    <div>
      <Top25Header stateSlug="california" useScrollSwitch={true} />
      {/* Rest of your page content */}
    </div>
  );
}
```

## Props Reference

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `stateSlug` | `string` | *required* | URL-friendly state identifier (e.g., "new-jersey", "texas") |
| `variant` | `"dark" \| "light"` | `"dark"` | Visual style variant |
| `useScrollSwitch` | `boolean` | `false` | If true, starts dark and switches to light after scrolling 24px |

## How It Works

### State Name Conversion
- `"new-jersey"` → `"New Jersey"`
- `"new-york"` → `"New York"`
- `"rhode-island"` → `"Rhode Island"`
- `"texas"` → `"Texas"`

### Dynamic URLs
For each state, the component builds URLs from the `stateSlug`:

- **Find agency button** → `/{stateSlug}/get-matched`
- **List agency button** → `/{stateSlug}/submit-agency`

Examples:
- New Jersey: `/new-jersey/get-matched` and `/new-jersey/submit-agency`
- Texas: `/texas/get-matched` and `/texas/submit-agency`
- California: `/california/get-matched` and `/california/submit-agency`

## Visual Variants

### Dark Variant (default)
- Blue background (#4A5DFF)
- White Gappsy logo
- White text
- Primary button: white with blue text
- Secondary button: transparent with white border

### Light Variant
- White background
- Blue Gappsy logo (#4A5DFF)
- Dark text
- Primary button: blue with white text
- Secondary button: white with blue border

## Responsive Behavior

### Desktop (md and above)
```
[ Logo ] Top 25 State Name          [ Find agency ] [ List agency ]
```
- Single row layout
- Logo and title on the left
- Buttons on the right
- Max width: 1200px, centered

### Mobile (below md)
```
[ Logo ] Top 25 State Name

[ Find agency ] [ List agency ]
```
- Two row layout
- Logo and title on first row
- Buttons on second row (may wrap if very narrow)
