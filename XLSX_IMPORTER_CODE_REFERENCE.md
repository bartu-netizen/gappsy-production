# XLSX Importer - Code Reference

## Email Extraction Code Block

**File:** `supabase/functions/_shared/xlsxParser.ts` (lines 67-102)

```typescript
export function extractEmails(emailField: string | null | undefined): {
  emails: string[];
  rawValue: string | null;
} {
  if (!emailField || String(emailField).trim().length === 0) {
    return { emails: [], rawValue: null };
  }

  const rawValue = String(emailField).trim();

  const parts = rawValue
    .split(/[,;|\n]/)
    .map((e) => e.trim())
    .filter((e) => e.length > 0);

  const emailsSet = new Set<string>();
  const validEmails: string[] = [];

  for (const part of parts) {
    const normalized = part.toLowerCase().trim();

    if (!normalized.includes("@") || normalized.length < 5) {
      continue;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(normalized)) {
      continue;
    }

    if (!emailsSet.has(normalized)) {
      emailsSet.add(normalized);
      validEmails.push(normalized);
    }
  }

  return { emails: validEmails, rawValue };
}
```

**What it does:**
1. Returns empty if email field is null/empty
2. Splits by comma, semicolon, pipe, or newline
3. Trims each part and filters empty strings
4. Validates each email:
   - Must contain `@`
   - At least 5 characters
   - Matches email regex pattern
5. Deduplicates using Set
6. Returns normalized emails and raw value

---

## XLSX Parser Code Block

**File:** `supabase/functions/_shared/xlsxParser.ts` (lines 22-62)

```typescript
export function parseXlsxData(buffer: ArrayBuffer): XlsxParseResult {
  try {
    const workbook = XLSX.read(buffer, { type: "array" });

    if (!workbook.SheetNames || workbook.SheetNames.length === 0) {
      return { ok: false, sheet: null, error: "No sheets found in workbook" };
    }

    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];

    if (!worksheet) {
      return { ok: false, sheet: null, error: `Sheet "${sheetName}" not found` };
    }

    const jsonData = XLSX.utils.sheet_to_json(worksheet, {
      header: 1,
      blankrows: false,
    }) as any[];

    if (jsonData.length < 2) {
      return { ok: false, sheet: null, error: "Sheet has no header row or data rows" };
    }

    const headerRow = jsonData[0];
    if (!Array.isArray(headerRow) || headerRow.length === 0) {
      return { ok: false, sheet: null, error: "Invalid header row" };
    }

    const headers: string[] = headerRow.map((h) =>
      String(h || "").trim().toLowerCase()
    );

    const headerMapping = new Map<string, string>();
    headerRow.forEach((originalHeader, index) => {
      const normalized = String(originalHeader || "").trim().toLowerCase();
      if (normalized) {
        headerMapping.set(normalized, String(originalHeader || "").trim());
      }
    });

    const rows: Record<string, any>[] = [];
    for (let i = 1; i < jsonData.length; i++) {
      const row = jsonData[i];
      if (!Array.isArray(row)) continue;

      const record: Record<string, any> = {};
      headers.forEach((header, index) => {
        const value = row[index];
        record[header] = value === null || value === undefined ? "" : String(value).trim();
      });

      if (record.name) {
        rows.push(record);
      }
    }

    return {
      ok: true,
      sheet: {
        sheetName,
        headers,
        rows,
        headerMapping,
      },
    };
  } catch (error) {
    return {
      ok: false,
      sheet: null,
      error: error instanceof Error ? error.message : "Unknown error parsing XLSX",
    };
  }
}
```

**What it does:**
1. Reads ArrayBuffer as XLSX workbook
2. Gets first sheet (or returns error if none)
3. Converts sheet to JSON array (header: 1 mode)
4. Extracts and normalizes header row (lowercase for matching)
5. Creates header mapping (normalized → original)
6. Builds record array (one per data row)
7. Filters rows with empty name
8. Returns sheet with headers, rows, and mapping

---

## Import-v2 XLSX Integration Code Block

**File:** `supabase/functions/other-agencies-import-v2/index.ts` (lines 499-588)

```typescript
} else if (mode === "xlsx") {
  try {
    const buffer = data instanceof ArrayBuffer ? data : new TextEncoder().encode(data as string).buffer;
    const parseResult = parseXlsxData(buffer);

    if (!parseResult.ok || !parseResult.sheet) {
      return new Response(
        JSON.stringify({
          error: `XLSX parse error: ${parseResult.error}`,
        }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const sheet = parseResult.sheet;
    const headerMapping: Record<string, string> = {};

    sheet.headerMapping.forEach((original, normalized) => {
      headerMapping[normalized] = original;
    });

    let rowsWithEmailCell = 0;
    let rowsWithExtractedEmails = 0;
    let totalEmailsExtractedBeforeDedupe = 0;

    records = sheet.rows.map((row) => {
      const record: AgencyRecord = {};

      record.state_slug = row.state_slug || state_slug;
      record.name = row.name || "";
      record.website_url = row.website || row.website_url || "";
      record.city = row.city || "";
      record.description = row.description || "";
      record.services = [];
      record.primary_service = "";
      record.logo_url = "";
      record.phone = row.phone || row.phone_number || row.contact_number || row.tel || row.mobile || "";
      record.zip_code = row.zip || row.zip_code || "";
      record.full_address = row.full_address || row.address || "";
      record.maps_url = row.url || row.maps || row.maps_url || "";
      record.latitude = row.latitude || row.lat ? parseFloat(row.latitude || row.lat) : undefined;
      record.longitude = row.longitude || row.lng ? parseFloat(row.longitude || row.lng) : undefined;
      record.maps_position = row.maps_position || row.position ? parseInt(row.maps_position || row.position) : undefined;
      record.keyword = row.keyword || "";
      record.facebook_url = row.facebook || row.facebook_url || "";
      record.instagram_url = row.instagram || row.instagram_url || "";
      record.twitter_url = row.twitter || row.twitter_url || row.x_url || "";
      record.youtube_url = row.youtube || row.youtube_url || "";
      record.linkedin_url = row.linkedin || row.linkedin_url || "";

      const emailRaw = row.email || "";
      if (emailRaw) {
        rowsWithEmailCell++;
        const { emails: extracted } = extractEmails(emailRaw);
        if (extracted.length > 0) {
          rowsWithExtractedEmails++;
          totalEmailsExtractedBeforeDedupe += extracted.length;
        }
      }
      record.email = emailRaw;

      return record;
    });

    const debugSamples = debugEmailExtraction(sheet.rows, 5);

    parserDiagnostics = {
      detected_sheet_name: sheet.sheetName,
      detected_headers: sheet.headers,
      header_mapping_used: headerMapping,
      rows_total: sheet.rows.length,
      rows_with_email_cell_present: rowsWithEmailCell,
      rows_with_extracted_emails: rowsWithExtractedEmails,
      total_emails_extracted_before_dedupe: totalEmailsExtractedBeforeDedupe,
      sample_email_extraction_debug: debugSamples.map((d) => ({
        row_index: d.rowIndex,
        raw_email_cell_value: d.rawEmailCellValue,
        extracted_emails: d.extractedEmails,
        reason: d.reason,
      })),
    };
  } catch (e) {
    return new Response(
      JSON.stringify({
        error: `XLSX parse error: ${e instanceof Error ? e.message : "Unknown error"}`,
      }),
      { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
}
```

**What it does:**
1. Converts data to ArrayBuffer if needed
2. Calls parseXlsxData to parse XLSX
3. Returns error if parse fails
4. Maps headers to agency record fields (case-insensitive)
5. For each row:
   - Maps all fields with fallback aliases
   - Extracts email cell value
   - Calls extractEmails() to get normalized emails
   - Tracks diagnostic counters
6. Generates debug samples for UI
7. Stores diagnostics for response

---

## UI File Handling Code Block

**File:** `src/pages/AdminOtherAgenciesImportAsyncPage.tsx` (lines 112-160)

```typescript
const handleStartImport = async () => {
  if (!file) {
    setError('Please select a file');
    return;
  }

  setImporting(true);
  setError('');
  setSuccessMessage('');

  try {
    let importData: any = null;
    let mode: 'csv' | 'json' | 'xlsx' = 'csv';

    if (file.name.endsWith('.csv')) {
      const fileContent = await file.text();
      importData = fileContent;
      mode = 'csv';
    } else if (file.name.endsWith('.json')) {
      const fileContent = await file.text();
      importData = fileContent;
      mode = 'json';
    } else if (file.name.endsWith('.xlsx') || file.name.endsWith('.xls')) {
      const arrayBuffer = await file.arrayBuffer();
      importData = arrayBuffer;
      mode = 'xlsx';
    } else {
      throw new Error('Unsupported file format. Use CSV, JSON, or XLSX.');
    }

    if (!importData) {
      throw new Error('File is empty');
    }

    const response = await fetch(`${SUPABASE_URL}/functions/v1/other-agencies-import-orchestrator`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
        'x-admin-token': token,
        'x-admin-secret': localStorage.getItem('admin_secret') || '',
      },
      body: JSON.stringify({
        action: 'start_job',
        state_slug: selectedState,
        source_filename: file.name,
        source_data: importData,
        import_mode: mode,  // Pass mode to orchestrator
      }),
    });

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.error || 'Failed to start import');
    }

    const data = await response.json();
    if (data.ok) {
      setCurrentJob(data);
      setPollingActive(true);
      setSuccessMessage(`Import job started. Processing ${sourceData.length} rows in ${data.chunks_total} chunks.`);
      setFile(null);
    }
  } catch (err) {
    setError(err instanceof Error ? err.message : 'Import failed');
  } finally {
    setImporting(false);
  }
};
```

**What it does:**
1. Validates file exists
2. Detects file type by extension (.csv, .json, .xlsx, .xls)
3. For XLSX: reads as ArrayBuffer (not text)
4. For CSV/JSON: reads as text
5. Sends to orchestrator with mode parameter
6. Passes along state, filename, data, and mode
7. Handles responses and errors

---

## Diagnostics Display Code Block

**File:** `src/pages/AdminOtherAgenciesImportAsyncPage.tsx` (lines 330-387)

Shows metrics grid:
- Sheet name
- Total rows
- Rows with email cell
- Rows with extracted emails
- Total emails before dedupe
- Total emails inserted (success count)

Shows headers section:
- First 8 detected headers as tags
- Count of remaining headers

---

## Integration Points

### Backend Flow
1. UI sends XLSX file as ArrayBuffer + mode="xlsx"
2. Orchestrator receives ArrayBuffer
3. Passes to import-v2 function with mode
4. import-v2 calls parseXlsxData(buffer)
5. Parser extracts headers and rows
6. import-v2 maps fields case-insensitively
7. Calls extractEmails() for each Email cell
8. Tracks diagnostics
9. Returns diagnostics in response

### Frontend Flow
1. User selects .xlsx/.xls file
2. File read as ArrayBuffer
3. API call includes import_mode="xlsx"
4. Import completes
5. UI displays diagnostics panel
6. Shows email extraction success metrics

---

## Testing the Fix

**Manual Test Command:**
```javascript
// In browser console on import page
const formData = {
  state_slug: 'new-jersey',
  source_filename: 'agencies.xlsx',
  source_data: arrayBuffer,  // from file.arrayBuffer()
  import_mode: 'xlsx'
};

fetch('/functions/v1/other-agencies-import-orchestrator', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${token}`,
    'x-admin-token': adminToken
  },
  body: JSON.stringify({
    action: 'start_job',
    ...formData
  })
}).then(r => r.json()).then(d => console.log(d.parser_diagnostics));
```

**Expected diagnostics output:**
```javascript
{
  detected_sheet_name: "Sheet1",
  detected_headers: ["id", "keyword", "name", ..., "email", ...],
  rows_total: 150,
  rows_with_email_cell_present: 145,
  rows_with_extracted_emails: 143,
  total_emails_extracted_before_dedupe: 187,
  total_emails_inserted: 187,
  sample_email_extraction_debug: [...]
}
```

---

## Summary of Changes

| File | Change | Lines |
|---|---|---|
| `_shared/xlsxParser.ts` | NEW | ~140 |
| `other-agencies-import-v2/index.ts` | UPDATED | ~100 |
| `AdminOtherAgenciesImportAsyncPage.tsx` | UPDATED | ~80 |

**Total new/modified code:** ~220 lines
**Build ID:** xvc6zmy4
