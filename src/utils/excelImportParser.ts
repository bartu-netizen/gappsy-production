import * as XLSX from 'xlsx';

export interface ParsedAgencyRow {
  name: string;
  website_url?: string;
  phone?: string;
  email?: string;
  city?: string;
  zip_code?: string;
  description?: string;
  services?: string;
  full_address?: string;
  maps_url?: string;
  latitude?: number;
  longitude?: number;
  maps_position?: number;
  keyword?: string;
  facebook_url?: string;
  instagram_url?: string;
  twitter_url?: string;
  youtube_url?: string;
  linkedin_url?: string;
  [key: string]: string | number | undefined;
}

interface ScraperHeaders {
  [key: string]: string;
}

const SCRAPER_COLUMN_MAP: ScraperHeaders = {
  'name': 'name',
  'agency_name': 'name',
  'company_name': 'name',
  'company': 'name',
  'business_name': 'name',
  'business': 'name',
  'agency': 'name',
  'agency_title': 'name',
  'listing_name': 'name',
  'title': 'name',
  'website': 'website_url',
  'website_url': 'website_url',
  'url': 'website_url',
  'domain': 'website_url',
  'company_website': 'website_url',
  'site': 'website_url',
  'web': 'website_url',
  'phone': 'phone',
  'phone_number': 'phone',
  'phone_numbers': 'phone',
  'phones': 'phone',
  'contact_number': 'phone',
  'telephone': 'phone',
  'tel': 'phone',
  'mobile': 'phone',
  'business_phone': 'phone',
  'email': 'email',
  'emails': 'email',
  'email_address': 'email',
  'company_email': 'email',
  'contact_email': 'email',
  'city': 'city',
  'town': 'city',
  'location_city': 'city',
  'zip': 'zip_code',
  'zip_code': 'zip_code',
  'postal_code': 'zip_code',
  'postcode': 'zip_code',
  'description': 'description',
  'intro': 'description',
  'about': 'description',
  'bio': 'description',
  'summary': 'description',
  'services': 'services',
  'service': 'services',
  'offerings': 'services',
  'service_list': 'services',
  'full_address': 'full_address',
  'address': 'full_address',
  'street_address': 'full_address',
  'maps_url': 'maps_url',
  'maps': 'maps_url',
  'latitude': 'latitude',
  'lat': 'latitude',
  'longitude': 'longitude',
  'lng': 'longitude',
  'maps_position': 'maps_position',
  'position': 'maps_position',
  'keyword': 'keyword',
  'facebook': 'facebook_url',
  'facebook_url': 'facebook_url',
  'instagram': 'instagram_url',
  'instagram_url': 'instagram_url',
  'twitter': 'twitter_url',
  'twitter_url': 'twitter_url',
  'x_url': 'twitter_url',
  'youtube': 'youtube_url',
  'youtube_url': 'youtube_url',
  'linkedin': 'linkedin_url',
  'linkedin_url': 'linkedin_url',
};

function normalizeColumnName(col: string): string {
  return col
    .toLowerCase()
    .trim()
    .replace(/[_\s]+/g, '_');
}

function findMappedColumn(headers: string[], targetKey: string): string | undefined {
  const normalized = normalizeColumnName(targetKey);

  for (const header of headers) {
    const normalizedHeader = normalizeColumnName(header);
    if (normalizedHeader === normalized) {
      return header;
    }
  }

  return undefined;
}

function isValidCity(city: string | undefined): boolean {
  if (!city || typeof city !== 'string') return false;
  const trimmed = city.trim();

  if (trimmed.length < 2 || trimmed.length > 50) return false;

  const hasDigitsOnly = /^\d+$/.test(trimmed);
  if (hasDigitsOnly) return false;

  const hasStateAbbrev = /\b(AL|AK|AZ|AR|CA|CO|CT|DE|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY|DC|PR)\b/.test(trimmed);
  if (hasStateAbbrev) return false;

  return /^[a-zA-Z\s\-']+$/.test(trimmed);
}

function isValidZipCode(zip: string | undefined): boolean {
  if (!zip || typeof zip !== 'string') return false;
  const trimmed = zip.trim();
  return /^\d{5}(-\d{4})?$/.test(trimmed);
}

function trimString(value: any): string | undefined {
  if (value === null || value === undefined) return undefined;
  const str = String(value).trim();
  return str.length > 0 ? str : undefined;
}

export function parseExcelFile(file: File): Promise<ParsedAgencyRow[]> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();

    reader.onload = (e) => {
      try {
        const data = e.target?.result;
        if (!data) {
          reject(new Error('Failed to read file'));
          return;
        }

        const workbook = XLSX.read(data, { type: 'array' });

        if (!workbook.SheetNames || workbook.SheetNames.length === 0) {
          reject(new Error('Excel file has no sheets'));
          return;
        }

        const sheet = workbook.Sheets[workbook.SheetNames[0]];
        if (!sheet) {
          reject(new Error('Failed to read first sheet'));
          return;
        }

        const rows = XLSX.utils.sheet_to_json(sheet, {
          header: 1,
          defval: '',
        }) as any[][];

        if (rows.length === 0) {
          reject(new Error('Excel sheet is empty'));
          return;
        }

        const headers = rows[0] as string[];
        if (headers.length === 0) {
          reject(new Error('No columns found in Excel sheet'));
          return;
        }

        const headerIndexMap: { [key: string]: number } = {};
        const mappedFields: { [key: string]: number } = {};

        headers.forEach((header, index) => {
          headerIndexMap[header] = index;
        });

        Object.keys(SCRAPER_COLUMN_MAP).forEach((scraperCol) => {
          const found = findMappedColumn(headers, scraperCol);
          if (found !== undefined) {
            mappedFields[SCRAPER_COLUMN_MAP[scraperCol]] = headerIndexMap[found];
          }
        });

        if (mappedFields['name'] === undefined) {
          const detectedHeaders = headers.map(h => normalizeColumnName(h)).join(', ');
          reject(new Error(`No agency/company name column found. Detected headers: [${detectedHeaders}]. Accepted name aliases: name, agency_name, company_name, company, business_name, business, agency, agency_title, listing_name, title`));
          return;
        }

        const parsedRows: ParsedAgencyRow[] = [];

        for (let i = 1; i < rows.length; i++) {
          const row = rows[i] as any[];

          const name = trimString(row[mappedFields['name']]);
          if (!name) continue;

          const parsedRow: ParsedAgencyRow = {
            name,
            website_url: trimString(row[mappedFields['website_url']]),
            phone: trimString(row[mappedFields['phone']]),
            email: trimString(row[mappedFields['email']]),
            description: trimString(row[mappedFields['description']]),
            services: trimString(row[mappedFields['services']]),
            full_address: trimString(row[mappedFields['full_address']]),
            maps_url: trimString(row[mappedFields['maps_url']]),
            keyword: trimString(row[mappedFields['keyword']]),
            facebook_url: trimString(row[mappedFields['facebook_url']]),
            instagram_url: trimString(row[mappedFields['instagram_url']]),
            twitter_url: trimString(row[mappedFields['twitter_url']]),
            youtube_url: trimString(row[mappedFields['youtube_url']]),
            linkedin_url: trimString(row[mappedFields['linkedin_url']]),
          };

          const city = trimString(row[mappedFields['city']]);
          if (city && isValidCity(city)) {
            parsedRow.city = city;
          }

          const zip = trimString(row[mappedFields['zip_code']]);
          if (zip && isValidZipCode(zip)) {
            parsedRow.zip_code = zip;
          }

          const latVal = row[mappedFields['latitude']];
          if (latVal !== null && latVal !== undefined && latVal !== '') {
            const lat = parseFloat(String(latVal));
            if (!isNaN(lat) && lat >= -90 && lat <= 90) {
              parsedRow.latitude = lat;
            }
          }

          const lngVal = row[mappedFields['longitude']];
          if (lngVal !== null && lngVal !== undefined && lngVal !== '') {
            const lng = parseFloat(String(lngVal));
            if (!isNaN(lng) && lng >= -180 && lng <= 180) {
              parsedRow.longitude = lng;
            }
          }

          const posVal = row[mappedFields['maps_position']];
          if (posVal !== null && posVal !== undefined && posVal !== '') {
            const pos = parseInt(String(posVal), 10);
            if (!isNaN(pos) && pos > 0) {
              parsedRow.maps_position = pos;
            }
          }

          parsedRows.push(parsedRow);
        }

        if (parsedRows.length === 0) {
          reject(new Error('No valid agency rows found in Excel sheet'));
          return;
        }

        resolve(parsedRows);
      } catch (err) {
        reject(err instanceof Error ? err : new Error(String(err)));
      }
    };

    reader.onerror = () => {
      reject(new Error('Failed to read file'));
    };

    reader.readAsArrayBuffer(file);
  });
}

export function convertParsedRowsToJSON(rows: ParsedAgencyRow[]): string {
  return JSON.stringify(rows);
}
