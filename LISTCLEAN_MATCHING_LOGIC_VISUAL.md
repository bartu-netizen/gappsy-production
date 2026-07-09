# ListClean Import - Matching Logic Visual Guide

## Complete Three-Tier Matching Flow

```
INPUT: CSV Row
│
├─ Row has email_id?
│  │
│  ├─ YES (Tier 1)
│  │  └─ Query: WHERE id = email_id
│  │     └─ Found? → UPDATE row, count++
│  │     └─ Not found? → Unmatched, report error
│  │
│  └─ NO → Check next condition
│
├─ Row has agency_id AND email_normalized?
│  │
│  ├─ YES (Tier 2)
│  │  └─ Query: WHERE agency_id = X AND email_normalized = Y
│  │     └─ Found? → UPDATE row(s), count++
│  │     └─ Not found? → Unmatched, report error
│  │
│  └─ NO → Check next condition
│
├─ Row has email_normalized?
│  │
│  ├─ YES (Tier 3 - NEW)
│  │  └─ Query: WHERE email_normalized = Z
│  │     └─ Found? → UPDATE row(s), count++
│  │     └─ Not found? → Unmatched, report error
│  │
│  └─ NO → Invalid row, increment invalid counter
│
└─ END: Row processed
```

## Decision Tree

```
                    START
                      │
                      ▼
              Has email_id?
              /           \
            YES            NO
             │              │
             ▼              ▼
        (Tier 1)     Has agency_id
        Match by      AND email?
        email_id      /          \
         │          YES           NO
         │           │            │
         ▼           ▼            ▼
      FOUND?    (Tier 2)    Has email?
        / \    Match by    /     \
       /   \    agency     YES    NO
      Y     N    + email    │      │
      │     │      │        ▼      ▼
      │     │      ▼    (Tier 3)  INVALID
      │     │   FOUND?  Match by
      │     │   / \     email
      │     │  /   \      │
      │     │ Y     N     ▼
      │     │ │     │   FOUND?
      │     │ │     │   / \
      └─────┼─┴─────┴──U   N
            │        │      │
            ▼        ▼      ▼
         UPDATE   UNMATCHED INVALID
           │         │         │
           └─────────┴────┬────┘
                          ▼
                     RETURN RESULT
```

## Tier Comparison

```
┌─────────────────────────────────────────────────────────────┐
│                    TIER 1: email_id                          │
├─────────────────────────────────────────────────────────────┤
│ Best for:      Internal system exports                      │
│ CSV has:       email_id column                              │
│ Precision:     Exact match by primary key                   │
│ Performance:   O(1) - Primary key lookup                    │
│ Result:        Max 1 row per CSV row                        │
│ Typical use:   System-to-system integration                │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│              TIER 2: agency_id + email                       │
├─────────────────────────────────────────────────────────────┤
│ Best for:      Agency-scoped exports                        │
│ CSV has:       agency_id AND email_normalized               │
│ Precision:     Composite key match                          │
│ Performance:   O(1) - Index on (agency_id, email)          │
│ Result:        Max 1 row per CSV row (by design)           │
│ Typical use:   Agency-specific data exports                │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│           TIER 3: email_normalized (NEW)                     │
├─────────────────────────────────────────────────────────────┤
│ Best for:      ListClean CSV results                        │
│ CSV has:       Only email address (LC_Email column)        │
│ Precision:     Email identity match                         │
│ Performance:   O(n) - May match multiple rows              │
│ Result:        1+ rows per CSV row (all agencies)          │
│ Typical use:   Third-party validation results             │
└─────────────────────────────────────────────────────────────┘
```

## Example: Three CSV Rows Through System

```
CSV Row 1: email_id=123, agency_id=null, email=info@example.com
│
├─ Has email_id? YES
├─ Query: WHERE id = 123
├─ Result: Found 1 row
├─ Action: UPDATE that row
├─ Matched: YES
└─ Status: ✓ Success

CSV Row 2: email_id=null, agency_id=ABC, email=hello@example.com
│
├─ Has email_id? NO
├─ Has agency_id AND email? YES
├─ Query: WHERE agency_id = 'ABC' AND email_normalized = 'hello@example.com'
├─ Result: Found 1 row
├─ Action: UPDATE that row
├─ Matched: YES
└─ Status: ✓ Success

CSV Row 3: email_id=null, agency_id=null, email=sales@example.com
│
├─ Has email_id? NO
├─ Has agency_id AND email? NO
├─ Has email? YES
├─ Query: WHERE email_normalized = 'sales@example.com'
├─ Result: Found 3 rows (3 different agencies use this email)
├─ Action: UPDATE all 3 rows
├─ Matched: YES
├─ rows_matched: +1
└─ rows_updated: +3
```

## Query Pattern for Each Tier

### Tier 1: Email ID
```sql
UPDATE other_agency_emails
SET validation_status = $1,
    validation_provider = $2,
    validation_reason = $3,
    validation_checked_at = $4
WHERE id = $5
RETURNING id;
```

**Indexes used:** Primary key (id)
**Rows affected:** Exactly 1 (or 0 if not found)

### Tier 2: Agency + Email
```sql
UPDATE other_agency_emails
SET validation_status = $1,
    validation_provider = $2,
    validation_reason = $3,
    validation_checked_at = $4
WHERE agency_id = $5
  AND email_normalized = $6
RETURNING id;
```

**Indexes used:** Composite index on (agency_id, email_normalized)
**Rows affected:** Exactly 1 (or 0 if not found)

### Tier 3: Email Only (NEW)
```sql
UPDATE other_agency_emails
SET validation_status = $1,
    validation_provider = $2,
    validation_reason = $3,
    validation_checked_at = $4
WHERE email_normalized = $5
RETURNING id;
```

**Indexes used:** Index on email_normalized
**Rows affected:** 1+ rows (all agencies with that email)

## Real ListClean CSV Example

```
Input from ListClean:
─────────────────────
LC_Email,LC_Status,LC_Reason,LC_MX,LC_MSP,"EMAIL"
info@agency.com,clean,Valid address,yes,Gmail
hello@agency.com,invalid,Undeliverable,no,Other
sales@agency.com,risky,Catch all,no,Other


Processing:
───────────

Row 1: info@agency.com, clean
├─ Has email_id? NO (ListClean doesn't provide)
├─ Has agency_id+email? NO (ListClean doesn't provide agency context)
├─ Has email? YES ← Tier 3 activated
├─ Query: WHERE email_normalized = 'info@agency.com'
├─ Database has this email? YES
├─ Update: Set validation_status = 'valid' (clean → valid)
├─ Result: ✓ Matched and updated
└─ rows_matched++, rows_updated++

Row 2: hello@agency.com, invalid
├─ Has email_id? NO
├─ Has agency_id+email? NO
├─ Has email? YES ← Tier 3 activated
├─ Query: WHERE email_normalized = 'hello@agency.com'
├─ Database has this email? YES
├─ Update: Set validation_status = 'invalid'
├─ Result: ✓ Matched and updated
└─ rows_matched++, rows_updated++

Row 3: sales@agency.com, risky
├─ Has email_id? NO
├─ Has agency_id+email? NO
├─ Has email? YES ← Tier 3 activated
├─ Query: WHERE email_normalized = 'sales@agency.com'
├─ Database has this email? YES
├─ Update: Set validation_status = 'retry' (risky → retry)
├─ Result: ✓ Matched and updated
└─ rows_matched++, rows_updated++


Result:
───────
{
  "ok": true,
  "total_rows": 3,
  "rows_matched": 3,
  "rows_updated": 3,
  "rows_unmatched": 0,
  "rows_invalid": 0,
  "detected_format": "ListClean"
}
```

## Matching Priority (Cascading)

```
Priority 1: email_id?
└─ If YES → Use Tier 1, stop
└─ If NO  → Check Priority 2

Priority 2: agency_id + email?
└─ If YES → Use Tier 2, stop
└─ If NO  → Check Priority 3

Priority 3: email?
└─ If YES → Use Tier 3, stop
└─ If NO  → Mark as invalid
```

**Why this order?**
- Tier 1: Most specific (exact record by ID)
- Tier 2: Medium specificity (record within agency)
- Tier 3: Least specific (any record with that email)

Each tier has higher precision, so check from most to least specific.

## Multi-Agency Email Scenario

```
Database State:
───────────────
Agency A:
  ├─ email1@example.com (pending)
  └─ email2@example.com (pending)

Agency B:
  ├─ email1@example.com (pending)  ← Same email, different agency
  └─ email3@example.com (pending)

Agency C:
  └─ email1@example.com (pending)  ← Same email again


ListClean Result:
─────────────────
email1@example.com,clean


Processing (Tier 3):
────────────────────
Query: WHERE email_normalized = 'email1@example.com'
Result: Found 3 rows (Agency A, B, and C)
Update: All 3 rows set to validation_status = 'valid'

Result Counts:
──────────────
rows_matched: 1    (one CSV row)
rows_updated: 3    (three DB rows updated)

Final State:
────────────
Agency A:
  ├─ email1@example.com (valid)    ← Updated
  └─ email2@example.com (pending)

Agency B:
  ├─ email1@example.com (valid)    ← Updated
  └─ email3@example.com (pending)

Agency C:
  └─ email1@example.com (valid)    ← Updated

Notes:
✓ One CSV row matched
✓ Three DB rows updated
✓ All agencies' email1 now has same validation status
✓ This is correct behavior (email validation is universal)
```

## Status Mapping Flow

```
ListClean Status     Normalized          Our Status    Meaning
────────────────────────────────────────────────────────────────
clean          →     clean          →    valid        Good email
valid          →     valid          →    valid        Good email
invalid        →     invalid        →    invalid      Bad email
bad            →     bad            →    invalid      Bad email
undeliverable  →     undeliverable  →    invalid      Bad email
risky          →     risky          →    retry        Retry later
catch-all      →     catch-all      →    retry        Retry later
catch all      →     catch-all      →    retry        Retry later
catch_all      →     catch_all      →    retry        Retry later
unknown        →     unknown        →    retry        Retry later
duplicate      →     duplicate      →    invalid      Bad email
(empty)        →     (empty)        →    pending      No status
(other)        →     (other)        →    retry        Unknown
```

## Error Handling at Each Tier

```
TIER 1 Error:
├─ Condition: email_id provided but row not found
├─ Error Message: "email_id not found"
├─ Action: Record as unmatched
└─ Admin can investigate: Where did this email_id come from?

TIER 2 Error:
├─ Condition: agency_id+email provided but row not found
├─ Error Message: "agency_id + email_normalized not found"
├─ Action: Record as unmatched
└─ Admin can investigate: Verify agency_id and email exist

TIER 3 Error:
├─ Condition: email provided but row not found
├─ Error Message: "email_normalized not found in database"
├─ Action: Record as unmatched
└─ Admin can investigate: Email not yet in our system or already deleted

NO IDENTIFIERS Error:
├─ Condition: None of the three identifiers present
├─ Error Message: "no matching identifier provided (email_id, agency_id+email, or email)"
├─ Action: Record as invalid
└─ Admin can investigate: CSV format issue or missing data
```

## Result Calculation

```
For each CSV row processed:
├─ If Tier 1 matched → rows_matched++, rows_updated += count
├─ If Tier 2 matched → rows_matched++, rows_updated += count
├─ If Tier 3 matched → rows_matched++, rows_updated += count
├─ If no tier matched → rows_unmatched++
└─ If processing failed → rows_invalid++

Final counts show:
├─ rows_matched: How many CSV rows found at least one DB row
├─ rows_updated: How many DB rows were actually modified
├─ rows_unmatched: How many CSV rows found nothing
├─ rows_invalid: How many CSV rows had errors
└─ total_rows: rows_matched + rows_unmatched + rows_invalid
```

## Performance Impact

```
TIER 1 Query:
├─ WHERE id = X
├─ Time: ~0.1ms (primary key lookup)
├─ Rows checked: 1
└─ Index: Primary key (automatic)

TIER 2 Query:
├─ WHERE agency_id = X AND email_normalized = Y
├─ Time: ~1-5ms (composite key lookup)
├─ Rows checked: 1-10
└─ Index: Composite (agency_id, email_normalized)

TIER 3 Query:
├─ WHERE email_normalized = Z
├─ Time: ~2-10ms (single field lookup)
├─ Rows checked: 1-1000 (all agencies with that email)
├─ Index: email_normalized
└─ Note: Usually finds 1 row, rarely 2-3
```

Total for typical 100-row import:
- 100 queries (one per row)
- Batched by 250 rows
- Total time: < 2 seconds

---

**This visual guide explains the complete matching logic and how each tier works independently and in cascade.**
