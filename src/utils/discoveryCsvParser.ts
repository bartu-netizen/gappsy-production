import * as XLSX from 'xlsx';

// CSV/XLSX parser for the Discovery Engine's CSV Import provider. Same
// xlsx library and FileReader pattern as excelImportParser.ts (the agency
// import parser) but a distinct, much smaller header map — Discovery rows
// have a different shape (name/website/category/description) than agency
// rows, so this isn't a case of duplicating that parser's logic.

export interface ParsedDiscoveryRow {
  name: string;
  official_website: string;
  category?: string;
  short_description?: string;
  logo_url?: string;
  source_url?: string;
}

const COLUMN_ALIASES: Record<string, keyof ParsedDiscoveryRow> = {
  name: 'name', tool_name: 'name', product: 'name', product_name: 'name', title: 'name',
  official_website: 'official_website', website: 'official_website', url: 'official_website', homepage: 'official_website',
  category: 'category',
  short_description: 'short_description', description: 'short_description', summary: 'short_description',
  logo_url: 'logo_url', logo: 'logo_url',
  source_url: 'source_url', source: 'source_url',
};

function normalizeHeader(header: string): string {
  return header.trim().toLowerCase().replace(/\s+/g, '_');
}

export function parseDiscoveryCsvFile(file: File): Promise<ParsedDiscoveryRow[]> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();

    reader.onload = (e) => {
      try {
        const data = e.target?.result;
        if (!data) return reject(new Error('Failed to read file'));

        const workbook = XLSX.read(data, { type: 'array' });
        if (!workbook.SheetNames || workbook.SheetNames.length === 0) return reject(new Error('File has no sheets'));

        const sheet = workbook.Sheets[workbook.SheetNames[0]];
        const rows = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: '' }) as unknown[][];
        if (rows.length < 2) return reject(new Error('File has no data rows'));

        const headers = (rows[0] as string[]).map(normalizeHeader);
        const fieldIndex: Partial<Record<keyof ParsedDiscoveryRow, number>> = {};
        headers.forEach((header, index) => {
          const field = COLUMN_ALIASES[header];
          if (field && fieldIndex[field] === undefined) fieldIndex[field] = index;
        });

        if (fieldIndex.name === undefined || fieldIndex.official_website === undefined) {
          return reject(new Error('File must have a "name" column and a "website"/"official_website" column'));
        }

        const parsed: ParsedDiscoveryRow[] = [];
        for (let i = 1; i < rows.length; i++) {
          const row = rows[i] as string[];
          const name = String(row[fieldIndex.name!] ?? '').trim();
          const officialWebsite = String(row[fieldIndex.official_website!] ?? '').trim();
          if (!name && !officialWebsite) continue; // skip fully blank rows
          parsed.push({
            name,
            official_website: officialWebsite,
            category: fieldIndex.category !== undefined ? String(row[fieldIndex.category] ?? '').trim() || undefined : undefined,
            short_description: fieldIndex.short_description !== undefined ? String(row[fieldIndex.short_description] ?? '').trim() || undefined : undefined,
            logo_url: fieldIndex.logo_url !== undefined ? String(row[fieldIndex.logo_url] ?? '').trim() || undefined : undefined,
            source_url: fieldIndex.source_url !== undefined ? String(row[fieldIndex.source_url] ?? '').trim() || undefined : undefined,
          });
        }

        resolve(parsed);
      } catch (err) {
        reject(err instanceof Error ? err : new Error('Failed to parse file'));
      }
    };

    reader.onerror = () => reject(new Error('Failed to read file'));
    reader.readAsArrayBuffer(file);
  });
}
