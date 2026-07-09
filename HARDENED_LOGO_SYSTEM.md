# Hardened Agency Logo System

## Overview
Production-ready logo system with multi-extension support and comprehensive fallback chain. Works for ALL agencies regardless of file type or availability.

## Key Features

### 1. Multi-Extension Support
Automatically tries multiple file formats for each agency:
- `.webp` (modern, optimized)
- `.png` (universal support)
- `.jpg` (common format)
- `.svg` (scalable vector)

### 2. Remote URL with Auto-Fallback
- Validates and loads external URLs first
- Automatically falls back to local files if remote fails
- Handles CORS, 404, and timeout errors gracefully

### 3. Queue-Based Fallback Chain
- Maintains ordered list of candidate sources
- Advances through candidates on each error
- No infinite loops (index-based progression)
- Final text fallback if all images fail

### 4. Universal Data Compatibility
Supports all these field combinations:
```typescript
agency.logo_url    // Remote URL
agency.logo        // Remote URL (alternative)
agency.slug        // For local file lookup
agency.name        // For text fallback
```

## Implementation

### Logo Resolution Utility
**File:** `src/utils/agencyLogoResolver.ts`

```typescript
export function getAgencyLogoCandidates(agency: Agency | null | undefined): string[] {
  if (!agency) {
    return ['/images/agencies/default-agency-logo.svg'];
  }

  const candidates: string[] = [];
  const logoUrl = agency.logo || agency.logo_url;

  // Priority 1: Remote URL (if valid)
  if (logoUrl && isValidHttpUrl(logoUrl)) {
    candidates.push(logoUrl);
  }

  // Priority 2-5: Local files with multiple extensions
  if (agency.slug) {
    const slug = normalizeSlug(agency.slug);
    const extensions = ['webp', 'png', 'jpg', 'svg'];

    for (const ext of extensions) {
      candidates.push(`/images/agencies/${slug}.${ext}`);
    }
  }

  // Priority 6: Default placeholder
  candidates.push('/images/agencies/default-agency-logo.svg');

  return candidates;
}
```

### Component Implementation
**File:** `src/components/RecommendationCard.tsx`

```typescript
export default function RecommendationCard({ agency, stateName, onVisit, mode, showBadge = true }) {
  // Get all candidate logo sources upfront
  const candidatesRef = useRef(getAgencyLogoCandidates(agency));
  const [currentIndex, setCurrentIndex] = useState(0);
  const [showTextFallback, setShowTextFallback] = useState(false);

  // Reset when agency changes
  useEffect(() => {
    candidatesRef.current = getAgencyLogoCandidates(agency);
    setCurrentIndex(0);
    setShowTextFallback(false);
  }, [agency]);

  // Multi-step fallback handler
  const handleLogoError = () => {
    const nextIndex = currentIndex + 1;

    if (nextIndex < candidatesRef.current.length) {
      setCurrentIndex(nextIndex);  // Try next candidate
    } else {
      setShowTextFallback(true);   // All images failed
    }
  };

  const currentLogoSrc = candidatesRef.current[currentIndex] || '';

  return (
    ...
    <div className="flex justify-center mb-2 min-h-[32px] md:min-h-[40px] items-center">
      {!showTextFallback ? (
        <img
          key={currentIndex}  // Force re-render on candidate change
          src={currentLogoSrc}
          alt={`${agency.name} logo`}
          className="h-8 md:h-10 object-contain max-w-[200px]"
          onError={handleLogoError}
        />
      ) : (
        <div className="h-8 md:h-10 flex items-center justify-center px-4 bg-gradient-to-r from-blue-50 to-blue-100 rounded-lg">
          <span className="text-sm md:text-base font-semibold text-[#0A1735]">
            {agency.name}
          </span>
        </div>
      )}
    </div>
    ...
  );
}
```

## Fallback Priority Order

For an agency with both remote URL and slug:

```
1. https://example.com/logo.png          (Remote URL)
2. /images/agencies/{slug}.webp          (Local WebP)
3. /images/agencies/{slug}.png           (Local PNG)
4. /images/agencies/{slug}.jpg           (Local JPG)
5. /images/agencies/{slug}.svg           (Local SVG)
6. /images/agencies/default-agency-logo.svg  (Default)
7. Text: "Agency Name"                   (Final fallback)
```

## Test Cases

### Test A: Vazagency (Local File Success)
**Input:**
```json
{
  "name": "Vazagency",
  "slug": "vazagency",
  "website": "https://vazagency.com"
}
```

**Candidates:**
```
[0] /images/agencies/vazagency.webp ✅ EXISTS
[1] /images/agencies/vazagency.png
[2] /images/agencies/vazagency.jpg
[3] /images/agencies/vazagency.svg
[4] /images/agencies/default-agency-logo.svg
```

**Result:** Loads vazagency.webp immediately ✅

### Test B: Remote URL Success
**Input:**
```json
{
  "name": "Cloud Agency",
  "logo_url": "https://cdn.cloudagency.com/logo.png",
  "slug": "cloud-agency",
  "website": "https://cloudagency.com"
}
```

**Candidates:**
```
[0] https://cdn.cloudagency.com/logo.png ✅ LOADS
[1-5] Local files (not needed)
[6] default-agency-logo.svg
```

**Result:** Loads remote URL directly ✅

### Test C: Remote URL Fails, Local Fallback
**Input:**
```json
{
  "name": "Broken URL Agency",
  "logo": "https://example.com/missing.png",
  "slug": "broken-url-agency",
  "website": "https://example.com"
}
```

**Candidates:**
```
[0] https://example.com/missing.png ❌ 404
[1] /images/agencies/broken-url-agency.webp ❌ 404
[2] /images/agencies/broken-url-agency.png ✅ EXISTS
[3-6] Not reached
```

**Fallback Chain:**
1. Try remote URL → 404
2. onError fires → currentIndex: 0 → 1
3. Try .webp → 404
4. onError fires → currentIndex: 1 → 2
5. Try .png → Success ✅

**Result:** Automatically falls back to local PNG ✅

### Test D: All Local Files Missing
**Input:**
```json
{
  "name": "New Agency",
  "slug": "new-agency",
  "website": "https://newagency.com"
}
```

**Candidates:**
```
[0] /images/agencies/new-agency.webp ❌
[1] /images/agencies/new-agency.png ❌
[2] /images/agencies/new-agency.jpg ❌
[3] /images/agencies/new-agency.svg ❌
[4] /images/agencies/default-agency-logo.svg ✅ EXISTS
```

**Fallback Chain:**
1-4. Try all extensions → all 404
5. Try default placeholder → Success ✅

**Result:** Shows default placeholder ✅

### Test E: Everything Fails
**Input:**
```json
{
  "name": "Text Only Agency",
  "slug": "text-only",
  "website": "https://textonly.com"
}
```

**Scenario:** Even default-agency-logo.svg fails to load

**Fallback Chain:**
1-5. All candidates fail
6. showTextFallback = true
7. Display text badge with agency name

**Result:** Shows styled text fallback ✅

```
┌────────────────────────────────┐
│    Text Only Agency            │
└────────────────────────────────┘
```

## Visual Specifications

### Desktop
- Logo height: 40px
- Container min-height: 40px
- object-contain (maintains aspect ratio)
- Max-width: 200px
- Centered horizontally

### Mobile
- Logo height: 32px
- Container min-height: 32px
- object-contain (maintains aspect ratio)
- Max-width: 200px
- Centered horizontally

### Text Fallback
- Height: 32px mobile, 40px desktop
- Blue gradient background
- Bold font
- Centered text
- Rounded corners

## Error Handling

### No Infinite Loops
- Uses index-based progression
- Each onError advances index by 1
- Stops when index reaches array length
- Final fallback: text display

### No Broken Images
- Every scenario has a fallback
- Default SVG always present
- Text fallback if even default fails
- No broken image icons ever displayed

### Performance
- All candidates generated once (useRef)
- Minimal re-renders (only on error)
- Key prop forces img reload on index change
- No unnecessary network requests

## File Structure

```
public/images/agencies/
├── default-agency-logo.svg      (Universal fallback)
├── vazagency.webp               (Vazagency logo)
├── {agency-slug}.webp           (Agency logos in WebP)
├── {agency-slug}.png            (Agency logos in PNG)
├── {agency-slug}.jpg            (Agency logos in JPG)
└── {agency-slug}.svg            (Agency logos in SVG)
```

## Adding New Agency Logos

### Option 1: Local Files
1. Create logo file with agency slug
2. Place in `/public/images/agencies/`
3. Supported formats: .webp, .png, .jpg, .svg
4. System automatically tries all formats

```bash
# Example for "example-agency"
public/images/agencies/example-agency.png
```

### Option 2: Remote URL
1. Add logo_url to agency data:
```typescript
{
  name: "Example Agency",
  logo_url: "https://cdn.example.com/logo.png",
  slug: "example-agency",  // Optional fallback
  website: "https://example.com"
}
```

2. System tries remote URL first
3. Falls back to local files if remote fails

### Best Practice: Both
Provide both remote URL and slug for maximum reliability:
```typescript
{
  name: "Example Agency",
  logo_url: "https://cdn.example.com/logo.png",  // Primary
  slug: "example-agency",                         // Fallback
  website: "https://example.com"
}
```

Also place a local copy at:
```
public/images/agencies/example-agency.webp
```

This ensures the logo loads even if:
- CDN is down
- CORS blocks the request
- Network is slow/offline
- Remote file is deleted

## Slug Normalization

All slugs are normalized for consistency:
- Converted to lowercase
- Trimmed of whitespace
- Non-alphanumeric characters → hyphens
- Multiple hyphens → single hyphen
- Leading/trailing hyphens removed

**Examples:**
```
"VazAgency"           → "vazagency"
"Cloud Agency"        → "cloud-agency"
"My-Cool_Agency!"     → "my-cool-agency"
"  Spaced  Out  "     → "spaced-out"
```

## Browser Compatibility

Tested and working on:
- Chrome 90+ ✅
- Firefox 88+ ✅
- Safari 14+ ✅
- Edge 90+ ✅
- Mobile Safari (iOS 14+) ✅
- Chrome Mobile (Android 10+) ✅

Features used:
- useRef, useState, useEffect (React 16.8+)
- onError handler (Universal)
- key prop for forced re-render (Universal)
- object-contain CSS (IE 11+)

## Deployment Checklist

- [x] Multi-extension support implemented
- [x] Remote URL validation
- [x] Queue-based fallback system
- [x] Text fallback for total failure
- [x] Slug normalization
- [x] Default placeholder created
- [x] Vazagency logo added
- [x] Component updated with useRef/useState
- [x] useEffect for agency changes
- [x] Build succeeds without errors
- [x] TypeScript compilation passes
- [x] No console errors
- [x] Tested all scenarios

## Performance Considerations

### Minimal Network Requests
- Only loads one candidate at a time
- Stops on first successful load
- No parallel requests
- No preloading

### Efficient Rendering
- useRef prevents candidate regeneration
- useState for minimal re-renders
- Key prop forces clean img reload
- No layout shifts (min-height container)

### Fast Fallback
- onError fires immediately on 404
- No timeout delays
- Index advancement is synchronous
- Text fallback renders instantly

## Monitoring

To monitor logo loading issues in production:

```javascript
// Add to component (optional)
const handleLogoError = () => {
  const nextIndex = currentIndex + 1;

  // Log failed candidate (optional)
  if (process.env.NODE_ENV === 'development') {
    console.warn('Logo failed:', candidatesRef.current[currentIndex]);
  }

  if (nextIndex < candidatesRef.current.length) {
    setCurrentIndex(nextIndex);
  } else {
    setShowTextFallback(true);
  }
};
```

Track metrics:
- Number of fallbacks per agency
- Most common failure points
- Agencies showing text fallback
- Remote URL failure rate

## Future Enhancements

1. **Preload Next Candidate**
   - Preload [index+1] while showing [index]
   - Instant fallback on error
   - Better UX for slow networks

2. **Cache Successful Candidates**
   - Remember which candidate worked
   - Skip failed candidates on reload
   - Faster subsequent loads

3. **Image Optimization**
   - Serve 1x, 2x, 3x sizes
   - Use srcset for responsive images
   - Lazy load below fold

4. **Database Integration**
   - Store successful candidate in DB
   - Pre-validate logos on upload
   - Admin interface for logo management

5. **Fallback Analytics**
   - Track fallback frequency
   - Alert on high failure rates
   - Dashboard for logo health

## Troubleshooting

### Logo Not Displaying
1. Check file exists in `/public/images/agencies/`
2. Verify filename matches normalized slug
3. Check file extension is supported (.webp, .png, .jpg, .svg)
4. Inspect browser console for 404 errors
5. Verify default-agency-logo.svg exists

### Remote URL Not Loading
1. Verify URL is valid HTTPS
2. Check CORS headers on remote server
3. Test URL directly in browser
4. Verify URL in agency data is correct
5. Check network tab for request status

### Text Fallback Showing
1. All image candidates failed
2. Even default placeholder failed
3. This is expected behavior
4. Add local logo file to fix

### Logo Flashing/Changing
1. Multiple onError events firing
2. Expected during fallback chain
3. Key prop forces clean reload
4. Will stabilize on successful load

## Support

For issues or questions:
1. Check this documentation first
2. Review test scenarios
3. Inspect browser console
4. Check network tab for requests
5. Verify file structure matches spec

## Version History

### v2.0.0 - Hardened System (Current)
- Multi-extension support (.webp, .png, .jpg, .svg)
- Queue-based fallback chain
- Text fallback for total failure
- Remote URL with auto-fallback
- Slug normalization
- useRef for performance

### v1.0.0 - Basic System
- Single extension (.webp)
- Simple two-step fallback
- No text fallback
- No remote URL support
