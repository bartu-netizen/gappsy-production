# Showcase System Quick Reference

## What It Does

Controls which 12 agencies appear in the "Other Agencies" section on each state page, using a priority algorithm that respects both paid status and manual pinning.

## How to Use

### Pin an Agency to Showcase Position

1. Go to `/wp-admin/other-agencies-manager`
2. Select state (e.g., "new-jersey")
3. Find agency in table
4. Click "Edit" button
5. Click "Showcase" tab
6. Toggle "Pin to Showcase" ON
7. Select position 1-12 (or leave blank for auto-fill)
8. Click "Save Changes"

### Unpin an Agency

1. Open agency in expanded panel
2. Go to "Showcase" tab
3. Toggle "Pin to Showcase" OFF
4. Click "Save Changes"

### View Showcase Status

**In Table**: Look at "Showcase" column
- 🔵 **#3** = Pinned at position 3
- **—** = Not pinned

**In Expanded Panel**: "Showcase" tab shows:
- Current paid status (effective)
- Whether pinned
- Current position
- Last updated info

## Priority Algorithm

The showcase fills 12 slots in this order:

1. **Pinned Paid** (by position)
2. **Other Paid** (by created_at)
3. **Pinned Non-Paid** (by position)
4. **Other Non-Paid** (by created_at)

### Examples

**Scenario 1**: 3 paid agencies, all pinned
- Position 1: Paid Agency A (pinned #1)
- Position 2: Paid Agency B (pinned #2)
- Position 3: Paid Agency C (pinned #5)
- Position 4-12: Non-paid agencies (auto-fill)

**Scenario 2**: 5 paid agencies, 2 pinned
- Position 1: Paid Agency A (pinned #1)
- Position 2: Paid Agency B (pinned #3)
- Position 3: Paid Agency C (not pinned, newest)
- Position 4: Paid Agency D (not pinned, 2nd newest)
- Position 5: Paid Agency E (not pinned, 3rd newest)
- Position 6-12: Non-paid agencies

**Scenario 3**: No paid agencies, 8 pinned non-paid
- Position 1-8: Pinned non-paid agencies (by position)
- Position 9-12: Other non-paid agencies (auto-fill)

## Tips

### Auto-Fill vs Manual Position
- **Auto-Fill** (leave blank): Agency appears in order based on priority algorithm
- **Manual Position**: Lock agency to specific position (1-12)

### Best Practices
- Pin high-value agencies to top positions (1-3)
- Use manual positions for agencies that paid for specific placement
- Let most agencies auto-fill (easier management)

### Position Conflicts
- Multiple agencies can have same position number
- They'll be sorted by priority algorithm within that position
- Generally avoid conflicts by using unique positions

## Technical Notes

### Effective Paid Status
The system uses "effective paid" which is:
- `paid_override_value` if override is active
- Otherwise `standard_paid_active` (from agency_listings)

This means admin overrides take precedence.

### Database Fields
- `showcase_pinned`: boolean
- `showcase_position`: integer 1-12 or null
- `showcase_updated_at`: timestamp
- `showcase_updated_by`: string

### Edge Function
`other-agencies-list` applies showcase sorting server-side before pagination, ensuring accurate results.

## Troubleshooting

**Issue**: Changes not showing on state page
- **Solution**: Wait 30 seconds for cache, or hard refresh

**Issue**: Agency not appearing in showcase despite being pinned
- **Solution**: Check if 12 higher-priority agencies exist (e.g., all paid, all pinned)

**Issue**: Position not saving
- **Solution**: Ensure "Pin to Showcase" toggle is ON first

**Issue**: Can't see showcase column
- **Solution**: Table has horizontal scroll, scroll right to see

---

**Quick Actions**:
- `/wp-admin/other-agencies-manager` - Admin interface
- Select state → Edit agency → Showcase tab
- Toggle + Position + Save
