# JSON Description System Implementation

## Overview
The New Jersey Top 25 page (and all state pages) now use JSON data as the single source of truth for agency descriptions, with no text generation or modification.

## What Was Changed

### 1. StatePageTemplate.tsx
- **Updated description mapping**: Now uses `agency.fullDescription` from JSON as the primary source
- **Updated logo mapping**: Now uses `agency.logo.localPath` structure from JSON
- **Fallback support**: Falls back to `agency.description` and `agency.logoUrl` for backward compatibility

```typescript
description: agency.fullDescription || agency.description || '',
logoUrl: agency.logo?.localPath ? `/${agency.logo.localPath}` : agency.logoUrl || '',
```

### 2. ExpandableText.tsx
- **Word-based truncation**: Changed from CSS line-clamp to word-based preview
- **Default preview**: Shows first 30 words of the full text
- **Configurable**: `maxWords` prop can be adjusted per use case
- **No text modification**: Only slices existing text, never generates or rewrites

```typescript
function makePreview(text: string, maxWords: number): string {
  const words = text.trim().split(/\s+/);
  if (words.length <= maxWords) return text.trim();
  return words.slice(0, maxWords).join(' ') + '...';
}
```

## How It Works

### Collapsed Card (Default)
- Shows first 30 words of `fullDescription`
- Adds "..." ellipsis if text is truncated
- Shows "Read more" button if text exceeds 30 words

### Expanded Card
- Shows complete `fullDescription` from JSON
- Character-for-character match with JSON data
- Shows "Read less" button to collapse

## JSON Structure Expected

```json
{
  "agencies": [
    {
      "rank": 1,
      "name": "Agency Name",
      "fullDescription": "Complete agency description text here...",
      "logo": {
        "localPath": "logos/new-jersey/agency-name.webp"
      },
      "websiteUrl": "https://example.com",
      "city": "City Name",
      "state": "New Jersey"
    }
  ]
}
```

## Key Features

1. **Single Source of Truth**: All text comes from `fullDescription` in JSON
2. **No Text Generation**: System only slices/displays - never generates or modifies
3. **SEO-Safe**: Full content is always available in expanded view
4. **Reusable**: Works for any state using the same JSON structure
5. **Backward Compatible**: Falls back to old field names if new ones aren't present

## Testing

Build verified successfully:
- ✅ No TypeScript errors
- ✅ All modals compile correctly
- ✅ JSON structure properly typed

## Future State Support

To add a new state:
1. Create `/public/data/{state-slug}.json` following the structure
2. Include `fullDescription` for each agency
3. Include `logo.localPath` for logos
4. System will automatically use this data - no code changes needed
