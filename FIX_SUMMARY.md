# White Screen Fix - Runtime Error Resolution

## Problem
Site at https://new-jersey-marketing-3cac.bolt.host showed completely white page.

## Root Cause
**Field name mismatch in SEOSchemas component**

StatePageTemplate normalized agencies with `website` field, but SEOSchemas expected `websiteUrl`:
- Line 6: Interface had `websiteUrl: string | null`
- Lines 49, 54, 59: Accessed `agency.websiteUrl` (undefined)
- Runtime error prevented page rendering

## Fix Applied
**File:** `src/components/SEOSchemas.tsx`

Changed 4 instances of `websiteUrl` to `website`:
1. Line 6: Interface field name
2. Line 49: URL mapping
3. Line 54: Filter condition
4. Line 59: Schema URL field

## Changes Made
- ✅ Fixed field name mismatch
- ✅ No design changes
- ✅ No layout changes
- ✅ No copy/text changes
- ✅ No business logic changes
- ✅ No CSS modifications

## Build Status
✅ Success - All assets generated correctly

## Expected Result
Page now renders with all content:
- Top 25 header
- Agency cards (1-25)
- Logos, descriptions, services
- FAQ section
- Footer
- Working SEO schemas
