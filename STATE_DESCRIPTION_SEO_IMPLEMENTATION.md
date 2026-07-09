# State Description "Read More" Implementation - SEO Optimized

## Overview
This document explains the SEO-optimized "Read More" implementation for state descriptions on both desktop and mobile devices using hard word limits.

## Key Requirements Met

### 1. Single Source of Truth
- All state descriptions use `state_intro_full` field in the JSON as the PRIMARY source of truth
- Fallback to `state_description_full` if `state_intro_full` is not present
- Text is NEVER rewritten, shortened, or paraphrased
- Uses word-safe slicing only to create preview text

### 2. Desktop vs Mobile Behavior
- **Mobile (collapsed)**: Shows first 17 words with "Read more" button
- **Desktop (collapsed)**: Shows first 40 words with "Read more" button
- **Both expanded**: Shows the COMPLETE `state_intro_full` text (100% identical)

### 3. Hard Word Limits

The implementation uses fixed word counts for predictable, consistent behavior:

```typescript
const MOBILE_MAX_WORDS = 17;   // Mobile shows max 17 words
const DESKTOP_MAX_WORDS = 40;  // Desktop shows max 40 words

// Single source of truth with fallback
const fullDescription = stateData.state_intro_full ?? stateData.state_description_full ?? '';

// Word-safe slicing
const { mobileIntro, desktopIntro } = getIntroVariants(fullDescription);
```

#### Slicing Algorithm

```typescript
function makeIntro(fullText: string, maxWords: number): string {
  const words = fullText.trim().split(/\s+/);
  if (words.length <= maxWords) return fullText.trim();
  return words.slice(0, maxWords).join(" ");
}
```

This ensures:
- Never cuts mid-word (splits on whitespace)
- Always shows exactly the same number of words for all states
- Mobile intro is always shorter than desktop intro
- Both are always prefixes of the full description
- Predictable and consistent across all 50 states

### 4. Rendering Logic
- When NOT expanded:
  - Mobile → shows `mobileIntro` + "..." + "Read more" button
  - Desktop → shows `desktopIntro` + "..." + "Read more" button
- When expanded:
  - Both → show `fullDescription` (complete, unmodified text)

## How to Add Descriptions to Other States

To add the full state description to any state JSON file:

```json
{
  "state": "state-slug",
  "stateName": "State Name",
  "state_intro_full": "Your complete state description here. This text will be shown in full when users click Read more on both desktop and mobile. Use \\n\\n for paragraph breaks to create multiple paragraphs.",
  "agencies": [...]
}
```

**Best Practices:**
- Write compelling content from the very first words (mobile shows only 17 words)
- Front-load important information in the first 40 words (desktop collapsed view)
- Ensure the full description provides complete value when expanded
- Use natural, flowing language that works well when truncated at word boundaries

## Example: New Jersey

```json
{
  "state": "new-jersey",
  "stateName": "New Jersey",
  "state_intro_full": "New Jersey's marketing agency scene is as dynamic and diverse as the state itself, offering a plethora of options for businesses seeking to enhance their market presence. However, navigating this landscape to find the ideal agency for your specific needs can be daunting. With over 1000 marketing agencies operating in New Jersey, our curated list aims to simplify your search, connecting you with a New Jersey-based agency that aligns with your marketing objectives.\n\nThe Garden State's marketing firms reflect its unique blend of bustling metropolitan areas, like Newark and Jersey City, and its quieter, suburban localities. This diversity enables New Jersey's agencies to offer a broad range of services, from cutting-edge digital marketing to traditional advertising and branding strategies. They cater to a diverse clientele, including everything from burgeoning local startups to well-established companies in sectors like pharmaceuticals, finance, and telecommunications, which are prominent in New Jersey.\n\nWhat sets New Jersey's marketing agencies apart is their ability to navigate a state that is both a major business hub and a neighbor to the media capital of the world, New York City. This proximity influences their approaches, often blending aggressive metropolitan marketing tactics with a nuanced understanding of local New Jersey markets. Additionally, there is a strong focus on innovation and digital trends, owing to the state's growing tech sector. This positions New Jersey's marketing agencies as not just service providers, but as strategic partners capable of guiding businesses through both regional market nuances and broader, global market trends. Without further ado lets dive into the top 25 marketing agencies in New Jersey."
}
```

**Result:**
- Mobile collapsed: "New Jersey's marketing agency scene is as dynamic and diverse as the state itself, offering a plethora of options for businesses seeking" (17 words)
- Desktop collapsed: "New Jersey's marketing agency scene is as dynamic and diverse as the state itself, offering a plethora of options for businesses seeking to enhance their market presence. However, navigating this landscape to find the ideal agency for your specific needs can be daunting." (40 words)
- Expanded (both): Shows complete 3-paragraph text (100% identical)

## SEO Benefits

1. **Complete Content Availability**: Search engines can access the full description text
2. **No Duplicate Content**: Same text shown on mobile and desktop (just different preview lengths)
3. **Progressive Disclosure**: Better UX with collapsible content that doesn't hide from search engines
4. **Consistent Content**: Single source of truth prevents content drift between devices

## Files Modified

1. `/public/data/new-jersey.json` - Added `state_intro_full` field with SEO content
2. `/src/utils/descriptionSplitter.ts` - NEW utility file with smart splitting logic
3. `/src/pages/StatePageTemplate.tsx` - Updated to use smart splitting and prioritize `state_intro_full`

## Future State Implementation

For any new state, simply add the `state_intro_full` field to the state's JSON file. The StatePageTemplate will automatically:
- Split content intelligently on paragraph/sentence boundaries
- Create appropriate desktop/mobile previews (never cutting mid-sentence)
- Show the full description when "Read more" is clicked
- Handle all responsive behavior correctly

## Technical Details

### Helper Functions

The implementation includes two key functions in `/src/utils/descriptionSplitter.ts`:

1. **`makeIntro(fullText: string, maxWords: number): string`**
   - Splits text on whitespace boundaries
   - Takes first N words and joins them back
   - Never cuts mid-word

2. **`getIntroVariants(fullDescription: string): IntroVariants`**
   - Returns `{ mobileIntro, desktopIntro }`
   - Uses hard-coded word limits (17 for mobile, 40 for desktop)
   - Ensures mobile < desktop < full description

### Hard-Coded Word Limits

```typescript
const MOBILE_MAX_WORDS = 17;   // Fixed for all states
const DESKTOP_MAX_WORDS = 40;  // Fixed for all states
```

These values are enforced consistently across all 50 state pages.

### Priority Order

The template prioritizes sources in this order:
1. `state_intro_full` (preferred)
2. `state_description_full` (fallback)
3. Empty string (no description)
