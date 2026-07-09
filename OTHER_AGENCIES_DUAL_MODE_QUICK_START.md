# Other Agencies Manager - Dual Mode Quick Start

## What's New?

You can now search agencies **globally** (across all states) or manage them **per state** (as before). Both workflows work on the same page.

## Two Modes

### 🌐 Global Mode
**When**: No state selected + Search entered
**Use for**: Finding specific agencies by email/name across all states

### 📍 State Mode
**When**: State selected
**Use for**: Managing all agencies in a specific state

---

## Common Tasks

### Find an Agency by Email

**Fastest way to locate any agency:**

1. Go to `/wp-admin/other-agencies-manager`
2. **Leave state dropdown empty**
3. Type email in search box: `example@agency.com`
4. Press enter
5. See all matches across all states

**Each row shows**:
- Agency name
- **State** (with "Open state view" button)
- Email, website, paid status
- Showcase pin status

### Pin Agency to Showcase from Global Search

**After finding agency**:

1. Click toggle in "Showcase" column → ON
2. Optionally enter position 1-12
3. Changes save automatically
4. Agency now in that state's showcase

### Open State View from Global Search

**To see full state context**:

1. Find agency in global search
2. Click **"Open state view"** button (ExternalLink icon) in State column
3. Page switches to that state
4. Auto-scrolls to top

### Browse State Agencies (Traditional)

**Unchanged workflow**:

1. Select state from dropdown
2. Browse all agencies in that state
3. Use filters (paid/unpaid/etc)
4. See summary cards
5. View "Current Top 12 Showcase" preview
6. Edit inline as before

### Search Within a State

**State + Search = Filter within state**:

1. Select state
2. Type search term
3. See matching agencies in that state only

---

## Mode Indicators

Look for the label above search box:

**🌐 Global search across all states**
- No state selected
- Searching all agencies everywhere

**📍 Search within [State Name]**
- State selected
- Searching only that state

---

## Table Differences

### Global Mode Table
| Agency | **State** | Email | Website | Status | Paid | Showcase | Actions |
|--------|-----------|-------|---------|--------|------|----------|---------|

**Note**: State column only shows in global mode

### State Mode Table
| Agency | Email | Website | Status | Paid | Showcase | Actions |
|--------|-------|---------|--------|------|----------|---------|

**Note**: No state column (all same state)

---

## Showcase Controls (Works in Both Modes)

**Every row has**:
- **Toggle**: Pin/unpin to showcase
- **Position input**: Set 1-12 (when pinned)
- **Pin badge**: 📌 shows when pinned

**In global mode**:
- Controls work across states
- Each state has separate showcase
- Preview panel only shows in state mode

**In state mode**:
- Controls work same as before
- Preview panel shows live top 12
- Auto-refreshes after changes

---

## Tips

### Finding Agencies
- **By email**: Most reliable (unique identifier)
- **By name**: May return multiple results
- **By website**: Partial match works

### Multi-State Agencies
- If agency exists in multiple states, you'll see multiple rows
- Each row is a separate state listing
- Edit showcase per state independently

### Switching Modes
- **Clear state** → Enter global mode
- **Select state** → Enter state mode
- **Changes persist** when switching modes

### Empty State
- No state + No search = Helpful instructions
- Not an error, just waiting for input

---

## Keyboard Shortcuts

- **Tab**: Navigate search and dropdowns
- **Enter**: Submit search
- **Esc**: Blur inputs

---

## Troubleshooting

**Issue**: Can't find agency
- **Try**: Search by email (most reliable)
- **Try**: Check spelling
- **Try**: Clear state dropdown (global search)

**Issue**: State column missing
- **Cause**: State is selected (state mode)
- **Solution**: Clear state dropdown for global mode

**Issue**: Showcase changes not showing
- **Cause**: Wrong state selected
- **Solution**: Use "Open state view" from global search

**Issue**: Can't see preview panel
- **Cause**: Global mode active
- **Solution**: Select state to see preview

---

## Best Practices

1. **Use global search for email lookups** - Fastest way to find specific agencies
2. **Use state mode for browsing** - Better for exploring all agencies in a state
3. **Pin from global mode** - Convenient when managing multiple states
4. **Verify in state mode** - Check preview panel after global edits
5. **Bookmark common states** - Browser bookmarks with state parameter

---

## Examples

### Example 1: Pin Agency in Multiple States

**Goal**: Pin "XYZ Agency" in California and Texas

1. Clear state dropdown
2. Search: `xyz@agency.com`
3. Find California row → Toggle ON → Position: 1
4. Find Texas row → Toggle ON → Position: 1
5. Done! Both states updated

### Example 2: Audit Showcase Across States

**Goal**: Check which states have "ABC Agency" pinned

1. Clear state dropdown
2. Search: `abc@agency.com`
3. Look at "Showcase" column
4. See pin badge 📌 on pinned states
5. Click "Open state view" to see full showcase

### Example 3: Quick State Switch

**Goal**: Review agencies in New Jersey, then California

1. Select "New Jersey"
2. Review agencies, edit as needed
3. Switch to "California" in dropdown
4. Page refreshes with California data

---

**Quick Reference**:
- `/wp-admin/other-agencies-manager` - Admin interface
- Clear state → Global search mode
- Select state → State browse mode
- "Open state view" → Jump to state from global results
