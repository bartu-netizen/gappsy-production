# Content Scanner - Quick Start Guide

## Overview

The Content Scanner is a read-only admin tool that scans for casino/gambling-related keywords in both database content and code files.

## What It Does

**Scans for these keywords:**
- High-confidence: casino, gambling, poker, roulette, sportsbook, blackjack, jackpot, betting, wager, bonus
- Slot-specific (optional): slots, slot machine, free spins

**Scan Locations:**

**Database Tables:**
- `state_content` - State intro/description fields
- `state_faqs` - FAQ questions and answers
- `top25_slots` - Agency names, descriptions, services
- `other_agencies` - Agency descriptions and services
- `spotlight_placements` - Spotlight content
- `sidebar_ads` - Ad content

**Files:**
- `/public/data/*.json` - State JSON files

## Access the Scanner

**URL:** `/admin/content-scan`

## How to Use

### 1. Deploy the Edge Function

The edge function needs to be deployed before first use:

```bash
# Deploy using Supabase CLI or the deployment tool
```

### 2. Run a Scan

1. Go to `/admin/content-scan`
2. Enter your **Admin Import Secret** (same secret used for logo upload and JSON import)
3. Optional: Check "Include slot-specific keywords" to also scan for "slots", "slot machine", "free spins"
4. Click **"Run Content Scan"**

### 3. Review Results

The scanner shows:

**Summary Cards:**
- Total matches found
- Database matches
- File matches
- Matches by keyword

**Results Table:**
- **Source**: DB or FILE
- **Location**: Table.column or file path
- **Identifier**: Row ID or line number
- **Keyword**: Which keyword matched
- **Context**: ~120 character snippet around the match
- **State/Rank**: State slug and rank (if available)

**Filters:**
- Search within results
- Filter by source type (All, DB only, Files only)

## What the Scanner Does NOT Do

- Does **NOT** modify or delete any content
- Does **NOT** automatically sanitize data
- Does **NOT** change existing pages or routes
- Is **READ-ONLY** for reporting purposes only

## Authentication

Uses the same authentication as other admin tools:
- Header: `x-admin-secret`
- Value: Your `ADMIN_IMPORT_SECRET` from Bolt Backend Secret Keys

## Example Results

```
Source: DB
Location: state_content.hero_intro
Identifier: new-jersey
Keyword: casino
Context: ...marketing agencies in New Jersey, including casino marketing specialists...
State: new-jersey
```

```
Source: FILE
Location: public/data/alabama.json
Identifier: line 45
Keyword: gambling
Context: ..."services": ["SEO", "gambling advertising", "PPC"]...
```

## Next Steps After Finding Matches

1. Review each match manually
2. Determine if content is appropriate or needs editing
3. Use existing admin tools to update content if needed
4. Re-run scanner to verify fixes

## Troubleshooting

**"ADMIN_IMPORT_SECRET_NOT_CONFIGURED"**
- Make sure `ADMIN_IMPORT_SECRET` is set in Bolt Backend Secret Keys

**"UNAUTHORIZED"**
- Verify you're using the correct admin secret
- Check that the secret matches what's in Bolt Backend

**"0 matches found"**
- Good news! Content appears clean
- Try checking "Include slot-specific keywords" if you want a more thorough scan

## File Location

- **Edge Function:** `supabase/functions/content-scan/index.ts`
- **Admin Page:** `src/pages/AdminContentScanPage.tsx`
- **Route:** `/admin/content-scan` (configured in `src/App.tsx`)
