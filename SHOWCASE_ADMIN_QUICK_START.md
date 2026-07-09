# Showcase Admin Quick Start Guide

## Access the Showcase Manager

1. Navigate to `/wp-admin/other-agencies-manager`
2. Select a state from the dropdown
3. Wait for agencies to load

## Understanding the UI

### Current Top 12 Preview Panel
At the top of the page (blue gradient background):
- Shows the **exact** showcase order used on the public state page
- Position 1-12 with agency names
- **📌** = Pinned agency
- **$** = Paid agency
- Click "Refresh Preview" to update manually (auto-refreshes after changes)

### Agency Table - Showcase Column
Each row has inline controls:
- **Toggle Switch**: Pin/unpin to showcase
- **Position Input**: Set position 1-12 (only visible when pinned)
- **📌 Badge**: Shows when agency is pinned
- **"Top 12" Badge**: Blue badge on agency name if in current showcase

### Filter Buttons
- **📌 Pinned**: Show only pinned agencies
- **Not Pinned**: Show only non-pinned agencies

## Common Tasks

### Pin an Agency to Showcase

**Quick Method**:
1. Find agency in table
2. Click toggle switch in "Showcase" column → ON
3. Done! Agency is now in showcase with auto-filled position

**With Specific Position**:
1. Find agency in table
2. Click toggle switch → ON
3. Enter position 1-12 in the input box that appears
4. Changes save automatically

### Unpin an Agency

1. Find pinned agency in table
2. Click toggle switch → OFF
3. Agency removed from showcase immediately

### Change Position

1. Find pinned agency
2. Change number in position input
3. Changes save automatically on blur/enter

### Pin to First Position

1. Toggle agency ON
2. Enter "1" in position input
3. Agency moves to #1 in showcase (if paid, otherwise after paid agencies)

### See All Pinned Agencies

1. Click **📌 Pinned** filter button
2. Table shows only pinned agencies
3. Click **All** to reset filter

## Understanding Priority

The showcase fills 12 slots in this order:

1. **Pinned Paid** (by position 1→12)
2. **Other Paid** (by created_at)
3. **Pinned Non-Paid** (by position 1→12)
4. **Other Non-Paid** (by created_at)

**Example**:
- 2 paid agencies, both pinned at positions #3 and #5
- Result: They appear at positions #1 and #2 in showcase
- Their manual positions (#3, #5) only matter relative to **other pinned paid agencies**

## Tips

### Auto-Fill vs Manual Position
- **Leave blank**: Agency gets auto-filled position based on priority
- **Enter 1-12**: Lock agency to specific position within its priority tier

### Quick Showcase Setup
1. Filter by **Standard Paid ($97)** to see paid agencies
2. Pin the top ones you want featured
3. Set positions if needed (1, 2, 3 for top spots)
4. Check "Current Top 12 Preview" to verify order

### Finding Showcased Agencies
- Look for blue **"Top 12"** badge next to agency names
- Or filter by **📌 Pinned**

### Refresh Preview
The preview updates automatically after changes, but you can:
- Click "Refresh Preview" button to see latest live data
- Useful if making changes on multiple tabs

## Troubleshooting

**Issue**: Agency pinned but not in top 12
- **Cause**: 12+ higher-priority agencies exist (e.g., all paid, all pinned)
- **Solution**: Unpin lower-priority agencies or increase this agency's priority

**Issue**: Position number not saving
- **Cause**: Toggle must be ON first
- **Solution**: Toggle ON, then set position

**Issue**: Changes not showing on state page
- **Cause**: Cache delay
- **Solution**: Wait 30 seconds or hard refresh

**Issue**: Can't see "Showcase" column
- **Cause**: Table has horizontal scroll
- **Solution**: Scroll right in table

## Keyboard Shortcuts

- **Tab**: Navigate between toggle and position input
- **Enter**: Save position input
- **Escape**: Blur position input (saves)
- **Space**: Toggle switch (when focused)

## Best Practices

1. **Pin paid agencies first** - They have higher priority
2. **Use positions 1-3 for top agencies** - Most visible on state page
3. **Let most agencies auto-fill** - Easier to manage
4. **Check preview after changes** - Verify showcase order
5. **Pin strategically** - Only pin agencies that should always be visible

---

**Quick Reference**:
- `/wp-admin/other-agencies-manager` - Admin interface
- Select state → Toggle pin → Set position (optional)
- Preview panel shows live showcase order
- Changes save automatically
