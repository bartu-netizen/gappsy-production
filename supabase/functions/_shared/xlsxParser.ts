import * as XLSX from "npm:xlsx@0.18.5";

export interface ParsedSheet {
  sheetName: string;
  headers: string[];
  rows: Record<string, any>[];
  headerMapping: Map<string, string>;
}

export interface EmailExtractionDebug {
  rowIndex: number;
  agencyName: string;
  rawEmailCellValue: string | null;
  extractedEmails: string[];
  deduplicatedEmails: string[];
  reason?: string;
}

export interface XlsxParseResult {
  ok: boolean;
  sheet: ParsedSheet | null;
  error?: string;
}

export function parseXlsxData(buffer: ArrayBuffer): XlsxParseResult {
  try {
    const uint8 = new Uint8Array(buffer);
    const workbook = XLSX.read(uint8, { type: "array" });

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

export interface NormalizedRowsResult {
  ok: boolean;
  rows: Record<string, string>[];
  error?: string;
  meta?: {
    sheetName: string;
    rawRowCount: number;
    headerRowIndex: number;
    detectedHeaders: string[];
    hasNameColumn: boolean;
  };
}

const NAME_LIKE_HEADERS = ["name", "agency name", "company name", "company", "business name", "organization"];

export function parseXlsxToNormalizedRows(
  buffer: ArrayBuffer,
  headerAliases: Record<string, string>
): NormalizedRowsResult {
  let sheetName = "";
  try {
    const uint8 = new Uint8Array(buffer);
    console.log(`[xlsxParser] XLSX.read starting — ${uint8.byteLength} bytes`);

    let workbook;
    try {
      workbook = XLSX.read(uint8, { type: "array" });
    } catch (readErr) {
      const msg = readErr instanceof Error ? readErr.message : String(readErr);
      return { ok: false, rows: [], error: `XLSX.read failed: ${msg}` };
    }

    if (!workbook.SheetNames || workbook.SheetNames.length === 0) {
      return { ok: false, rows: [], error: "Workbook has no sheets" };
    }

    sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    if (!sheet) {
      return { ok: false, rows: [], error: `Sheet "${sheetName}" is empty or missing` };
    }

    console.log(`[xlsxParser] Workbook loaded — sheet: "${sheetName}"`);

    let raw: any[][];
    try {
      raw = XLSX.utils.sheet_to_json(sheet, { header: 1, blankrows: false, defval: "" }) as any[][];
    } catch (sheetErr) {
      const msg = sheetErr instanceof Error ? sheetErr.message : String(sheetErr);
      return { ok: false, rows: [], error: `sheet_to_json failed for "${sheetName}": ${msg}` };
    }

    console.log(`[xlsxParser] Sheet "${sheetName}" — ${raw.length} raw rows`);

    if (raw.length < 2) {
      return { ok: false, rows: [], error: `Sheet has ${raw.length} rows — need at least a header + 1 data row` };
    }

    let headerIdx = 0;
    for (let i = 0; i < Math.min(5, raw.length); i++) {
      const cells = (raw[i] as any[]).map(c => String(c ?? "").toLowerCase().trim());
      if (cells.some(c => NAME_LIKE_HEADERS.includes(c))) {
        headerIdx = i;
        break;
      }
    }

    const rawHeaderRow = raw[headerIdx] as any[];
    if (!rawHeaderRow || rawHeaderRow.length === 0) {
      return { ok: false, rows: [], error: `Header row ${headerIdx} is empty` };
    }

    function normalizeHeader(h: string): string {
      const lower = h.trim().toLowerCase();
      return headerAliases[lower] ?? lower;
    }

    const headers = rawHeaderRow.map(h => normalizeHeader(String(h ?? "")));
    const hasNameCol = headers.includes("name");

    console.log(`[xlsxParser] Headers (row ${headerIdx}): [${headers.slice(0, 10).join(", ")}${headers.length > 10 ? "..." : ""}] — name col: ${hasNameCol}`);

    if (!hasNameCol) {
      return {
        ok: false,
        rows: [],
        error: `No "Name" column found. Detected headers: ${headers.slice(0, 15).join(", ")}`,
        meta: { sheetName, rawRowCount: raw.length, headerRowIndex: headerIdx, detectedHeaders: headers, hasNameColumn: false },
      };
    }

    const rows: Record<string, string>[] = [];
    for (let i = headerIdx + 1; i < raw.length; i++) {
      const row = raw[i] as any[];
      if (!row || row.length === 0) continue;
      const record: Record<string, string> = {};
      headers.forEach((h, idx) => {
        const val = String(row[idx] ?? "").trim();
        if (!(h in record) || !record[h]) {
          record[h] = val;
        }
      });
      if (record.name) rows.push(record);
    }

    console.log(`[xlsxParser] Extracted ${rows.length} valid rows from ${raw.length - headerIdx - 1} data rows`);

    return {
      ok: true,
      rows,
      meta: { sheetName, rawRowCount: raw.length, headerRowIndex: headerIdx, detectedHeaders: headers, hasNameColumn: true },
    };
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    return { ok: false, rows: [], error: `Unexpected XLSX error: ${msg}` };
  }
}

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

export function debugEmailExtraction(
  rows: Record<string, any>[],
  limit: number = 5
): EmailExtractionDebug[] {
  const debug: EmailExtractionDebug[] = [];

  for (let i = 0; i < Math.min(rows.length, limit); i++) {
    const row = rows[i];
    const rawEmailValue = row.email || null;
    const { emails: extracted } = extractEmails(rawEmailValue);

    debug.push({
      rowIndex: i + 2,
      agencyName: row.name || "Unknown",
      rawEmailCellValue: rawEmailValue ? String(rawEmailValue) : null,
      extractedEmails: extracted,
      deduplicatedEmails: extracted,
      reason: !rawEmailValue
        ? "No email value in cell"
        : extracted.length === 0
        ? "No valid emails extracted"
        : "Success",
    });
  }

  return debug;
}
