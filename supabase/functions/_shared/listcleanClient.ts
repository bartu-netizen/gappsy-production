export interface ListCleanBatchResponse {
  list_id: number;
  list_name?: string;
  email_count?: number;
  request_id?: string;
}

export interface ListCleanListStatus {
  id: number;
  name?: string;
  filename?: string;
  email_count?: number;
  clean_count?: number;
  dirty_count?: number;
  unknown_count?: number;
  status?: string;
  created_at?: string;
  updated_at?: string;
  raw_download_candidates?: string[];
}

export interface ListCleanEmailResult {
  email: string;
  status: string;
  sub_status?: string;
  reason?: string;
  is_free_email?: boolean;
  is_smtp_valid?: boolean;
  is_catchall?: boolean;
  risk_level?: string;
}

export interface ListCleanDownloadResult {
  list_id: number;
  type: "clean" | "dirty" | "unknown";
  data: ListCleanEmailResult[];
}

export interface ListCleanCreditsResponse {
  credits: number;
  raw: unknown;
}

function compactPreview(value: unknown, maxLen = 300): string {
  let str: string;
  if (typeof value === "string") {
    str = value;
  } else if (typeof value === "object" && value !== null) {
    try {
      str = JSON.stringify(value);
    } catch {
      str = String(value);
    }
  } else {
    str = String(value);
  }
  if (str.length > maxLen) {
    return str.substring(0, maxLen - 3) + "...";
  }
  return str;
}

async function parseJsonOrThrow(
  response: Response,
  context: string,
  requestUrl: string
): Promise<unknown> {
  const contentType = response.headers.get("content-type") || "unknown";
  const rawText = await response.text();
  const preview = rawText.substring(0, 250).replace(/\s+/g, " ").trim();

  if (!response.ok) {
    throw new Error(
      `${context} failed (${response.status}) [content-type=${contentType}] from ${requestUrl}: ${preview}`
    );
  }

  if (!contentType.includes("application/json")) {
    throw new Error(
      `${context} returned non-JSON (${response.status}) [content-type=${contentType}] from ${requestUrl}: ${preview}`
    );
  }

  try {
    return JSON.parse(rawText);
  } catch {
    throw new Error(
      `${context} invalid JSON (${response.status}) from ${requestUrl}: ${preview}`
    );
  }
}

function extractListCleanListId(raw: unknown): number {
  if (!raw || typeof raw !== "object") {
    throw new Error(
      `ListClean submit response missing list_id/batch id. Response is not an object: ${compactPreview(raw)}`
    );
  }

  const obj = raw as Record<string, unknown>;

  const paths = [
    obj.list_id,
    obj.id,
    obj.batch_id,
    (obj.data as any)?.list_id,
    (obj.data as any)?.id,
    (obj.data as any)?.batch_id,
    (obj.result as any)?.list_id,
    (obj.result as any)?.id,
    (obj.result as any)?.batch_id,
    (obj.list as any)?.id,
    (obj.payload as any)?.list_id,
    (obj.payload as any)?.id,
  ];

  for (const candidate of paths) {
    if (candidate !== null && candidate !== undefined && candidate !== "") {
      const num = Number(candidate);
      if (!isNaN(num) && num > 0) {
        return num;
      }
    }
  }

  const topLevelKeys = Object.keys(obj).slice(0, 20).join(", ");
  throw new Error(
    `ListClean submit response missing valid list_id/batch id. Top-level keys=[${topLevelKeys}] preview=${compactPreview(obj)}`
  );
}

function assertValidListId(listId: unknown, context: string): string {
  if (listId === null || listId === undefined || listId === "" || listId === "undefined" || listId === "null") {
    throw new Error(`${context} received invalid listId: ${listId}`);
  }

  const num = Number(listId);
  if (isNaN(num) || num <= 0) {
    throw new Error(`${context} received invalid listId: ${listId}`);
  }

  return String(num);
}

function toOptionalNumber(value: unknown): number | undefined {
  if (value === null || value === undefined || value === "") {
    return undefined;
  }
  const num = Number(value);
  return isNaN(num) ? undefined : num;
}

function normalizeListCleanListStatusPayload(raw: unknown, requestedListId: string): ListCleanListStatus {
  if (!raw || typeof raw !== "object") {
    throw new Error(
      `ListClean get list returned unexpected payload for listId ${requestedListId}: ${compactPreview(raw)}`
    );
  }

  const obj = raw as Record<string, unknown>;

  console.log("[ListClean] get list root keys:", Object.keys(obj).slice(0, 20));
  if (obj.data && typeof obj.data === "object") {
    console.log("[ListClean] get list data keys:", Object.keys(obj.data as object).slice(0, 20));
  }

  const source = (obj.data && typeof obj.data === "object") ? (obj.data as Record<string, unknown>) : obj;

  // The real API response nests counts under data.analytics.summary
  // (e.g. { analytics: { summary: { total: "198", clean: { count: 75 },
  // dirty: { count: 37 }, unknown: { count: 86 } } } }) — confirmed via a
  // direct raw-response probe on 2026-07-22 after tool_contact_emails rows
  // kept ending up "failed" with listclean_external_status always null.
  // Neither this shape nor a download URL for the actual per-email results
  // is present at data.clean_count/data.clean/etc, which is all the code
  // below originally checked — so isComplete/hasAnyCount detection was
  // silently always false via those fields alone.
  const analyticsSummary = ((source.analytics as Record<string, unknown> | undefined)?.summary ?? {}) as Record<string, unknown>;
  const summaryCount = (bucket: unknown): number | undefined => {
    if (bucket && typeof bucket === "object") return toOptionalNumber((bucket as Record<string, unknown>).count);
    return toOptionalNumber(bucket);
  };

  const id = source.id ?? source.list_id;
  if (id === null || id === undefined) {
    throw new Error(
      `ListClean get list returned unexpected payload (missing id field) for listId ${requestedListId}: ${compactPreview(raw)}`
    );
  }

  const numId = Number(id);
  if (isNaN(numId) || numId <= 0) {
    throw new Error(
      `ListClean get list returned invalid id for listId ${requestedListId}: ${compactPreview(raw)}`
    );
  }

  const filename = (source.filename ?? source.file_name ?? source.list_name ?? source.name) as string | undefined;

  const downloadCandidates: string[] = [];
  const urlKeys = ["download_url", "clean_download_url", "dirty_download_url", "unknown_download_url", "json_url", "csv_url"];
  for (const key of urlKeys) {
    const val = source[key];
    if (typeof val === "string" && val.startsWith("http")) {
      downloadCandidates.push(val);
    }
  }
  if (source.links && typeof source.links === "object") {
    const links = source.links as Record<string, unknown>;
    for (const val of Object.values(links)) {
      if (typeof val === "string" && val.startsWith("http")) {
        downloadCandidates.push(val);
      }
    }
  }

  return {
    id: numId,
    name: (source.name ?? source.list_name ?? source.filename) as string | undefined,
    filename,
    email_count: toOptionalNumber(source.email_count ?? source.total_count ?? source.total ?? source.total_emails) ?? summaryCount(analyticsSummary.total),
    clean_count: toOptionalNumber(source.clean_count ?? source.valid_count) ?? summaryCount(source.clean) ?? summaryCount(analyticsSummary.clean),
    dirty_count: toOptionalNumber(source.dirty_count ?? source.invalid_count) ?? summaryCount(source.dirty) ?? summaryCount(analyticsSummary.dirty),
    unknown_count: toOptionalNumber(source.unknown_count) ?? summaryCount(source.unknown) ?? summaryCount(analyticsSummary.unknown),
    status: (source.status ?? source.state ?? source.processing_status ?? source.list_status) as string | undefined,
    created_at: (source.created_at ?? source.created) as string | undefined,
    updated_at: (source.updated_at ?? source.updated) as string | undefined,
    raw_download_candidates: downloadCandidates.length > 0 ? downloadCandidates : undefined,
  };
}

function normalizeListCleanBaseUrl(baseUrl: string): string {
  let url = baseUrl.trim();

  url = url.replace(/\/$/, "");

  const urlObj = new URL(url);
  const host = urlObj.hostname;

  if (host.includes("listclean.io")) {
    const normalized = "https://api.listclean.xyz/v1";
    console.warn(
      `[ListClean] Rewriting deprecated .io base URL to .xyz: ${normalized}`
    );
    return normalized;
  }

  if (!url.endsWith("/v1")) {
    if (host === "api.listclean.xyz") {
      url = url + "/v1";
    }
  }

  return url;
}

function getListCleanConfig() {
  let token = Deno.env.get("LISTCLEAN_API_TOKEN");
  if (!token) {
    token = Deno.env.get("Gappsy_Bolt_ListClean");
  }

  token = token ? token.trim() : "";
  if (!token) {
    throw new Error(
      "ListClean API token not configured. " +
        "Expected one of: LISTCLEAN_API_TOKEN (canonical) or Gappsy_Bolt_ListClean (Bolt secret)"
    );
  }

  const LISTCLEAN_API_DEFAULT = "https://api.listclean.xyz/v1";
  let baseUrl = Deno.env.get("LISTCLEAN_API_BASE_URL");

  if (!baseUrl) {
    baseUrl = LISTCLEAN_API_DEFAULT;
  } else {
    baseUrl = baseUrl.trim();
    baseUrl = normalizeListCleanBaseUrl(baseUrl);
  }

  try {
    new URL(baseUrl);
  } catch {
    throw new Error(`ListClean base URL is malformed: ${baseUrl}`);
  }

  const urlObj = new URL(baseUrl);
  const host = urlObj.hostname;

  if (host !== "api.listclean.xyz") {
    throw new Error(
      `ListClean base URL host is not allowed: ${host}. Expected api.listclean.xyz`
    );
  }

  return { baseUrl, token };
}

export async function listcleanVerifyBatch(emails: string[]): Promise<ListCleanBatchResponse> {
  const { baseUrl, token } = getListCleanConfig();

  if (emails.length === 0) {
    throw new Error("Cannot submit empty email batch");
  }

  const url = `${baseUrl}/verify/email/batch`;
  const response = await fetch(url, {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "X-Auth-Token": token,
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ emails }),
  });

  const rawResult = await parseJsonOrThrow(response, "ListClean batch submit", url);

  console.log("[ListClean] submit response keys:", Object.keys(rawResult as any).slice(0, 20));
  if ((rawResult as any)?.data && typeof (rawResult as any).data === "object") {
    console.log("[ListClean] submit response data keys:", Object.keys((rawResult as any).data).slice(0, 20));
  }

  const listId = extractListCleanListId(rawResult);

  return {
    list_id: listId,
    list_name: (rawResult as any)?.list_name || (rawResult as any)?.data?.list_name,
    email_count: (rawResult as any)?.email_count || (rawResult as any)?.data?.email_count,
    request_id: (rawResult as any)?.request_id || (rawResult as any)?.data?.request_id,
  };
}

function inspectAndLogResponseShape(raw: unknown, context: string): void {
  if (!raw || typeof raw !== "object") {
    console.log(`[ListClean] ${context}: Response is not an object, type=${typeof raw}`);
    return;
  }

  const obj = raw as Record<string, unknown>;
  const topLevelKeys = Object.keys(obj);
  console.log(`[ListClean] ${context} - Top-level keys (${topLevelKeys.length}):`, topLevelKeys.slice(0, 30));

  const urlLikeStrings: string[] = [];
  const nestedObjects: string[] = [];

  for (const [key, value] of Object.entries(obj)) {
    if (typeof value === "string" && (value.includes("http") || value.includes("/"))) {
      urlLikeStrings.push(`${key}: ${value.substring(0, 80)}`);
    }
    if (value && typeof value === "object" && !Array.isArray(value)) {
      const nestedKeys = Object.keys(value as any);
      if (nestedKeys.length > 0) {
        nestedObjects.push(`${key}: [${nestedKeys.slice(0, 10).join(", ")}${nestedKeys.length > 10 ? "..." : ""}]`);
      }
    }
  }

  if (urlLikeStrings.length > 0) {
    console.log(`[ListClean] ${context} - URL-like strings found:`, urlLikeStrings.slice(0, 10));
  }

  if (nestedObjects.length > 0) {
    console.log(`[ListClean] ${context} - Nested objects found:`, nestedObjects);
  }

  // Deep inspect specific common keys
  const keysToInspect = ["data", "result", "links", "downloads", "exports", "files", "results", "buckets", "resources"];
  for (const key of keysToInspect) {
    if (key in obj && obj[key] && typeof obj[key] === "object") {
      const nested = obj[key] as Record<string, unknown>;
      const nestedKeys = Object.keys(nested);
      if (nestedKeys.length > 0) {
        console.log(`[ListClean] ${context}.${key} keys (${nestedKeys.length}):`, nestedKeys.slice(0, 20));
      }
    }
  }
}

export async function listcleanGetList(listId: number | string): Promise<ListCleanListStatus> {
  const { baseUrl, token } = getListCleanConfig();

  const validatedId = assertValidListId(listId, "ListClean get list");
  const url = `${baseUrl}/lists/${validatedId}`;

  console.log(`[ListClean] === Fetching list details ===`);
  console.log(`[ListClean] Endpoint: GET ${url}`);

  const response = await fetch(url, {
    method: "GET",
    headers: {
      "Accept": "application/json",
      "X-Auth-Token": token,
      "Authorization": `Bearer ${token}`,
    },
  });

  const result = await parseJsonOrThrow(response, "ListClean get list", url);

  console.log(`[ListClean] Response received, status: 200`);
  inspectAndLogResponseShape(result, "ListClean GET /lists/{id}");

  return normalizeListCleanListStatusPayload(result, validatedId);
}

function tryParseJsonString(value: unknown): unknown {
  if (typeof value !== "string") {
    return value;
  }
  const trimmed = value.trim();
  if ((trimmed.startsWith("{") && trimmed.endsWith("}")) || (trimmed.startsWith("[") && trimmed.endsWith("]"))) {
    try {
      return JSON.parse(trimmed);
    } catch {
      return value;
    }
  }
  return value;
}

function looksLikeEmailString(value: unknown): boolean {
  return typeof value === "string" && value.includes("@") && value.includes(".");
}

function looksLikeRowObject(value: unknown): boolean {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    return false;
  }
  const obj = value as Record<string, unknown>;
  const emailKeys = ["email", "email_address", "address", "emailAddress", "mail", "value", "input", "original", "original_email"];
  const statusKeys = ["status", "result", "verdict", "state", "validation_status", "email_status", "final_status"];
  for (const key of emailKeys) {
    if (typeof obj[key] === "string" && obj[key]) return true;
  }
  for (const key of statusKeys) {
    if (typeof obj[key] === "string" && obj[key]) return true;
  }
  return false;
}

function scoreCandidateArray(arr: unknown[], bucketType: "clean" | "dirty" | "unknown", parentKey: string): number {
  if (arr.length === 0) return 0;
  let score = 0;
  const keyLower = parentKey.toLowerCase();
  const bucketAliases: Record<string, string[]> = {
    clean: ["clean", "valid", "deliverable", "good"],
    dirty: ["dirty", "invalid", "undeliverable", "bad", "bounce"],
    unknown: ["unknown", "risky", "catchall", "disposable"],
  };
  const genericKeys = ["emails", "results", "rows", "data", "list", "records", "items"];
  if (bucketAliases[bucketType].some((alias) => keyLower.includes(alias))) {
    score += 100;
  }
  if (genericKeys.some((gk) => keyLower === gk)) {
    score += 50;
  }
  const sampleSize = Math.min(arr.length, 10);
  let emailStrings = 0;
  let rowObjects = 0;
  for (let i = 0; i < sampleSize; i++) {
    if (looksLikeEmailString(arr[i])) emailStrings++;
    if (looksLikeRowObject(arr[i])) rowObjects++;
  }
  score += emailStrings * 10;
  score += rowObjects * 10;
  score += Math.min(arr.length, 100);
  return score;
}

function findBestRowsArrayDeep(
  raw: unknown,
  bucketType: "clean" | "dirty" | "unknown",
  depth: number = 0,
  visited: WeakSet<object> = new WeakSet()
): { arr: unknown[]; score: number } | null {
  if (depth > 5) return null;

  const parsed = tryParseJsonString(raw);

  if (Array.isArray(parsed)) {
    if (parsed.length > 0 && (looksLikeEmailString(parsed[0]) || looksLikeRowObject(parsed[0]))) {
      return { arr: parsed, score: scoreCandidateArray(parsed, bucketType, "root") };
    }
  }

  if (!parsed || typeof parsed !== "object") {
    return null;
  }

  if (visited.has(parsed as object)) {
    return null;
  }
  visited.add(parsed as object);

  const obj = parsed as Record<string, unknown>;
  let best: { arr: unknown[]; score: number } | null = null;

  const priorityKeys = [bucketType, "valid", "invalid", "unknown", "clean", "dirty", "emails", "results", "rows", "data", "list", "records", "items", "result", "payload", "response", "body"];

  for (const key of priorityKeys) {
    if (!(key in obj)) continue;
    const val = tryParseJsonString(obj[key]);
    if (Array.isArray(val) && val.length > 0) {
      const score = scoreCandidateArray(val, bucketType, key);
      if (score > 0 && (!best || score > best.score)) {
        best = { arr: val, score };
      }
    } else if (val && typeof val === "object") {
      const nested = findBestRowsArrayDeep(val, bucketType, depth + 1, visited);
      if (nested && (!best || nested.score > best.score)) {
        best = nested;
      }
    }
  }

  for (const [key, val] of Object.entries(obj)) {
    if (priorityKeys.includes(key)) continue;
    const parsedVal = tryParseJsonString(val);
    if (Array.isArray(parsedVal) && parsedVal.length > 0) {
      const score = scoreCandidateArray(parsedVal, bucketType, key);
      if (score > 0 && (!best || score > best.score)) {
        best = { arr: parsedVal, score };
      }
    } else if (parsedVal && typeof parsedVal === "object" && !Array.isArray(parsedVal)) {
      const nested = findBestRowsArrayDeep(parsedVal, bucketType, depth + 1, visited);
      if (nested && (!best || nested.score > best.score)) {
        best = nested;
      }
    }
  }

  return best;
}

function extractRowsArray(raw: unknown, bucketType: "clean" | "dirty" | "unknown"): unknown[] | null {
  const parsed = tryParseJsonString(raw);

  if (Array.isArray(parsed)) {
    return parsed;
  }
  if (!parsed || typeof parsed !== "object") {
    return null;
  }
  const obj = parsed as Record<string, unknown>;

  if (Array.isArray(obj[bucketType])) {
    return obj[bucketType] as unknown[];
  }
  if (bucketType === "clean" && Array.isArray(obj.valid)) {
    return obj.valid as unknown[];
  }
  if (bucketType === "dirty" && Array.isArray(obj.invalid)) {
    return obj.invalid as unknown[];
  }

  const dataVal = tryParseJsonString(obj.data);
  if (Array.isArray(dataVal)) {
    return dataVal;
  }
  if (dataVal && typeof dataVal === "object") {
    const nested = dataVal as Record<string, unknown>;
    if (Array.isArray(nested[bucketType])) {
      return nested[bucketType] as unknown[];
    }
    if (bucketType === "clean" && Array.isArray(nested.valid)) {
      return nested.valid as unknown[];
    }
    if (bucketType === "dirty" && Array.isArray(nested.invalid)) {
      return nested.invalid as unknown[];
    }
    if (Array.isArray(nested.rows)) return nested.rows;
    if (Array.isArray(nested.results)) return nested.results;
    if (Array.isArray(nested.emails)) return nested.emails;
  }
  if (Array.isArray(obj.rows)) return obj.rows;
  if (Array.isArray(obj.results)) return obj.results;
  if (Array.isArray(obj.emails)) return obj.emails;

  const deepResult = findBestRowsArrayDeep(parsed, bucketType);
  if (deepResult && deepResult.arr.length > 0) {
    console.log(`[ListClean] extractRowsArray used deep finder, score=${deepResult.score}, length=${deepResult.arr.length}`);
    return deepResult.arr;
  }

  return null;
}

function buildCaseInsensitiveKeyMap(obj: Record<string, unknown>): Map<string, string> {
  const keyMap = new Map<string, string>();
  for (const key of Object.keys(obj)) {
    keyMap.set(key.toLowerCase(), key);
  }
  return keyMap;
}

function getCaseInsensitiveValue(
  obj: Record<string, unknown>,
  keyMap: Map<string, string>,
  possibleKeys: string[]
): unknown {
  for (const key of possibleKeys) {
    const lowerKey = key.toLowerCase();
    const actualKey = keyMap.get(lowerKey);
    if (actualKey && obj[actualKey] !== undefined && obj[actualKey] !== null && obj[actualKey] !== "") {
      return obj[actualKey];
    }
  }
  return undefined;
}

const EMAIL_FIELD_CANDIDATES = [
  "email",
  "email_address",
  "emailAddress",
  "Email",
  "EMAIL",
  "address",
  "mail",
  "value",
  "input",
  "original",
  "original_email",
  "LC_Email",
  "lc_email",
  "e_mail",
  "E_Mail",
  "emailaddress",
  "EMAILADDRESS",
];

const STATUS_FIELD_CANDIDATES = [
  "status",
  "result",
  "Status",
  "STATUS",
  "LC_Status",
  "lc_status",
  "final_status",
  "verification_status",
  "verdict",
  "state",
  "validation_status",
  "email_status",
  "RESULT",
  "VERDICT",
];

const SUBSTATUS_FIELD_CANDIDATES = [
  "sub_status",
  "substatus",
  "reason_code",
  "Sub_Status",
  "SUBSTATUS",
  "subStatus",
];

const REASON_FIELD_CANDIDATES = [
  "reason",
  "message",
  "description",
  "details",
  "remark",
  "note",
  "Reason",
  "REASON",
  "error_message",
];

function parseCSVToRows(csvText: string): Record<string, string>[] {
  const lines = csvText.split(/\r?\n/).filter(line => line.trim());
  if (lines.length < 2) {
    return [];
  }

  const headerLine = lines[0];
  const headers = parseCSVLine(headerLine);

  console.log(`[ListClean] CSV headers detected:`, headers.slice(0, 10));

  const rows: Record<string, string>[] = [];
  for (let i = 1; i < lines.length; i++) {
    const values = parseCSVLine(lines[i]);
    if (values.length === 0) continue;

    const row: Record<string, string> = {};
    for (let j = 0; j < headers.length && j < values.length; j++) {
      row[headers[j]] = values[j];
    }
    rows.push(row);
  }

  return rows;
}

function parseCSVLine(line: string): string[] {
  const result: string[] = [];
  let current = '';
  let inQuotes = false;

  for (let i = 0; i < line.length; i++) {
    const char = line[i];
    const nextChar = line[i + 1];

    if (inQuotes) {
      if (char === '"' && nextChar === '"') {
        current += '"';
        i++;
      } else if (char === '"') {
        inQuotes = false;
      } else {
        current += char;
      }
    } else {
      if (char === '"') {
        inQuotes = true;
      } else if (char === ',') {
        result.push(current.trim());
        current = '';
      } else {
        current += char;
      }
    }
  }

  result.push(current.trim());
  return result;
}

function isCSVContent(text: string): boolean {
  const trimmed = text.trim();
  if (trimmed.startsWith('{') || trimmed.startsWith('[')) {
    return false;
  }
  const firstLine = trimmed.split(/\r?\n/)[0] || '';
  const hasCommas = firstLine.includes(',');
  const looksLikeHeader = /email|status|result|address/i.test(firstLine);
  return hasCommas && looksLikeHeader;
}

function normalizeCSVRowsToEmailResults(
  csvRows: Record<string, string>[],
  bucketType: "clean" | "dirty" | "unknown"
): ListCleanEmailResult[] {
  const seen = new Set<string>();
  const normalized: ListCleanEmailResult[] = [];

  for (const row of csvRows) {
    const keyMap = buildCaseInsensitiveKeyMap(row as Record<string, unknown>);

    const emailRaw = getCaseInsensitiveValue(row as Record<string, unknown>, keyMap, EMAIL_FIELD_CANDIDATES);
    if (typeof emailRaw !== "string" || !emailRaw.trim() || !emailRaw.includes("@")) {
      continue;
    }

    const emailNormalized = emailRaw.trim().toLowerCase();
    if (seen.has(emailNormalized)) {
      continue;
    }
    seen.add(emailNormalized);

    const statusRaw = getCaseInsensitiveValue(row as Record<string, unknown>, keyMap, STATUS_FIELD_CANDIDATES);
    const status = typeof statusRaw === "string" && statusRaw.trim() ? statusRaw.trim() : bucketType;

    const subStatusRaw = getCaseInsensitiveValue(row as Record<string, unknown>, keyMap, SUBSTATUS_FIELD_CANDIDATES);
    const reasonRaw = getCaseInsensitiveValue(row as Record<string, unknown>, keyMap, REASON_FIELD_CANDIDATES);

    normalized.push({
      email: emailNormalized,
      status,
      sub_status: typeof subStatusRaw === "string" ? subStatusRaw : undefined,
      reason: typeof reasonRaw === "string" ? reasonRaw : undefined,
    });
  }

  console.log(`[ListClean] CSV normalized ${normalized.length} rows from ${csvRows.length} CSV rows`);
  return normalized;
}

function normalizeListCleanDownloadRows(
  raw: unknown,
  bucketType: "clean" | "dirty" | "unknown"
): ListCleanEmailResult[] {
  const rows = extractRowsArray(raw, bucketType);
  if (!rows) {
    console.log(`[ListClean] normalizeRows: extractRowsArray returned null for ${bucketType}`);
    return [];
  }

  console.log(`[ListClean] normalizeRows: processing ${rows.length} rows for ${bucketType}`);

  const seen = new Set<string>();
  const normalized: ListCleanEmailResult[] = [];
  let stringRowCount = 0;
  let objectRowCount = 0;
  let skippedNoEmail = 0;
  let skippedDuplicate = 0;

  for (const row of rows) {
    if (typeof row === "string") {
      stringRowCount++;
      const trimmed = row.trim();
      if (trimmed && trimmed.includes("@")) {
        const emailKey = trimmed.toLowerCase();
        if (!seen.has(emailKey)) {
          seen.add(emailKey);
          normalized.push({
            email: emailKey,
            status: bucketType,
          });
        } else {
          skippedDuplicate++;
        }
      }
      continue;
    }

    if (!row || typeof row !== "object") {
      continue;
    }

    objectRowCount++;
    const r = row as Record<string, unknown>;
    const keyMap = buildCaseInsensitiveKeyMap(r);

    const emailRaw = getCaseInsensitiveValue(r, keyMap, EMAIL_FIELD_CANDIDATES);
    if (typeof emailRaw !== "string" || !emailRaw.trim()) {
      skippedNoEmail++;
      if (skippedNoEmail <= 3) {
        console.log(`[ListClean] normalizeRows: skipped row with no email, keys: ${Array.from(keyMap.keys()).slice(0, 10).join(",")}`);
      }
      continue;
    }

    const emailNormalized = emailRaw.trim().toLowerCase();
    if (seen.has(emailNormalized)) {
      skippedDuplicate++;
      continue;
    }
    seen.add(emailNormalized);

    const statusRaw = getCaseInsensitiveValue(r, keyMap, STATUS_FIELD_CANDIDATES);
    const status = typeof statusRaw === "string" && statusRaw.trim() ? statusRaw.trim() : bucketType;

    const subStatusRaw = getCaseInsensitiveValue(r, keyMap, SUBSTATUS_FIELD_CANDIDATES);
    const reasonRaw = getCaseInsensitiveValue(r, keyMap, REASON_FIELD_CANDIDATES);

    normalized.push({
      email: emailNormalized,
      status,
      sub_status: typeof subStatusRaw === "string" ? subStatusRaw : undefined,
      reason: typeof reasonRaw === "string" ? reasonRaw : undefined,
      is_free_email: (r.is_free_email ?? r.free_email) as boolean | undefined,
      is_smtp_valid: (r.is_smtp_valid ?? r.smtp_valid) as boolean | undefined,
      is_catchall: (r.is_catchall ?? r.catchall) as boolean | undefined,
      risk_level: (r.risk_level ?? r.risk) as string | undefined,
    });
  }

  console.log(`[ListClean] normalizeRows stats for ${bucketType}:`, {
    inputRows: rows.length,
    stringRows: stringRowCount,
    objectRows: objectRowCount,
    skippedNoEmail,
    skippedDuplicate,
    normalized: normalized.length,
  });

  if (normalized.length > 0) {
    console.log(`[ListClean] normalizeRows first normalized email sample:`, normalized[0].email);
  }

  return normalized;
}

export interface ListCleanDownloadOptions {
  filename?: string;
}

export async function listcleanDownloadListJson(
  listId: number | string,
  type: "clean" | "dirty" | "unknown",
  options?: ListCleanDownloadOptions
): Promise<ListCleanEmailResult[]> {
  const { baseUrl, token } = getListCleanConfig();
  const validatedId = assertValidListId(listId, "ListClean download");

  console.log(`[ListClean] === Download ${type} results for list ${validatedId} ===`);

  // GET /downloads/json/{list_id}/{type} — confirmed directly against
  // ListClean's real OpenAPI spec (api.listclean.xyz/v1/spec.json) on
  // 2026-07-22. Previously this guessed that a download URL would be
  // embedded somewhere in the /lists/{id} details response (there never
  // was one — that response only ever contains id/name/filename/status/
  // analytics, confirmed via a raw-response probe), so every single
  // download call failed and got silently swallowed by the caller's
  // `.catch(() => [])`, which is why every scraped email eventually ended
  // up "failed" with listclean_external_status always null.
  const downloadUrl = `${baseUrl}/downloads/json/${validatedId}/${type}`;

  console.log(`[ListClean] Step 1: Download ${type} results from ${downloadUrl}`);
  let response = await fetch(downloadUrl, {
    method: "GET",
    headers: {
      "Accept": "text/csv, application/json, */*",
      "api_key": token,
      "X-Auth-Token": token,
      "Authorization": `Bearer ${token}`,
    },
  });

  const contentType = response.headers.get("content-type") || "unknown";
  const status = response.status;

  console.log(`[ListClean] Step 3: Download response received: status=${status}, content-type=${contentType}`);

  if (status === 401 || status === 403) {
    const bodyPreview = await response.text().catch(() => "");
    console.error(`[ListClean] Step 3 FAILED: Authentication error (${status})`);
    throw new Error(
      `ListClean result retrieval failed: Authentication error (${status}) downloading ${type} results from ${downloadUrl.substring(0, 100)}...`
    );
  }

  if (status === 404) {
    const bodyPreview = await response.text().catch(() => "");
    console.error(`[ListClean] Step 3 FAILED: URL returned 404`);
    throw new Error(
      `ListClean result retrieval failed: Official result URL returned 404 for ${type}. URL: ${downloadUrl.substring(0, 100)}... This should not happen if the list details returned this URL.`
    );
  }

  if (status === 429 || status >= 500) {
    const bodyPreview = await response.text().catch(() => "");
    console.error(`[ListClean] Step 3 FAILED: Server error (${status})`);
    throw new Error(
      `ListClean result retrieval failed: Server error (${status}) downloading ${type} results`
    );
  }

  if (!response.ok) {
    const bodyPreview = await response.text().catch(() => "");
    console.error(`[ListClean] Step 3 FAILED: HTTP ${status}`);
    throw new Error(
      `ListClean result retrieval failed: HTTP ${status} downloading ${type} results`
    );
  }

  const rawText = await response.text();
  const isResponseJson = contentType.includes("application/json") ||
    rawText.trim().startsWith("{") || rawText.trim().startsWith("[");
  const isResponseCsv = contentType.includes("text/csv") || isCSVContent(rawText);

  console.log(`[ListClean] Step 3: Response format detected: ${isResponseJson ? "JSON" : isResponseCsv ? "CSV" : "other"}, size=${rawText.length} bytes`);

  console.log(`[ListClean] Step 4: Parse ${type} results`);

  if (isResponseCsv) {
    const csvRows = parseCSVToRows(rawText);
    console.log(`[ListClean] Step 4: CSV parsed: ${csvRows.length} rows`);

    if (csvRows.length === 0) {
      console.warn(`[ListClean] Step 4: Empty CSV returned (0 data rows)`);
      return [];
    }

    if (csvRows.length > 0) {
      console.log(`[ListClean] Step 4: CSV header keys:`, Object.keys(csvRows[0]).slice(0, 10));
    }

    const normalized = normalizeCSVRowsToEmailResults(csvRows, type);
    console.log(`[ListClean] Step 5: Normalized: ${normalized.length} email results from ${csvRows.length} CSV rows`);

    return normalized;
  }

  if (isResponseJson) {
    try {
      const parsed = JSON.parse(rawText);
      console.log(`[ListClean] Step 4: JSON parsed, type: ${Array.isArray(parsed) ? "array" : typeof parsed}`);

      if (parsed && typeof parsed === "object" && !Array.isArray(parsed)) {
        console.log(`[ListClean] Step 4: JSON root keys:`, Object.keys(parsed).slice(0, 15));
      }

      const normalized = normalizeListCleanDownloadRows(parsed, type);
      console.log(`[ListClean] Step 5: Normalized: ${normalized.length} rows from JSON`);

      return normalized;
    } catch (parseErr) {
      console.error(`[ListClean] Step 4 FAILED: JSON parse error:`, parseErr);
      throw new Error(
        `ListClean result retrieval failed: Could not parse JSON in ${type} results. Error: ${parseErr instanceof Error ? parseErr.message : String(parseErr)}`
      );
    }
  }

  console.warn(`[ListClean] Step 4: Unexpected content-type: ${contentType}. Attempting CSV parse as fallback.`);
  const fallbackCsvRows = parseCSVToRows(rawText);
  if (fallbackCsvRows.length > 0) {
    const normalized = normalizeCSVRowsToEmailResults(fallbackCsvRows, type);
    console.log(`[ListClean] Step 5: Fallback CSV parsed: ${normalized.length} rows`);
    return normalized;
  }

  console.error(`[ListClean] Step 4 FAILED: Could not parse response. Content-type: ${contentType}`);
  throw new Error(
    `ListClean result retrieval failed: Could not parse ${type} results. Response content-type was ${contentType}, expected CSV or JSON.`
  );
}

export function mapListCleanStatusToInternal(externalStatus: string): string {
  if (!externalStatus) {
    return "retry";
  }

  const normalized = externalStatus.toLowerCase().trim();

  const statusMap: { [key: string]: string } = {
    "clean": "valid",
    "all clean": "valid",
    "all_clean": "valid",
    "high quality": "valid",
    "high_quality": "valid",
    "valid": "valid",
    "deliverable": "valid",
    "good": "valid",
    "dirty": "invalid",
    "invalid": "invalid",
    "undeliverable": "invalid",
    "bad": "invalid",
    "bounce": "invalid",
    "unknown": "retry",
    "risky": "retry",
    "catchall": "retry",
    "catch-all": "retry",
    "catch_all": "retry",
    "disposable": "retry",
    "role-based": "retry",
    "role_based": "retry",
    "error": "retry",
    "": "retry",
  };

  return statusMap[normalized] || "retry";
}

export async function pollListCleanCompletion(
  listId: number | string,
  maxAttempts: number = 30,
  delayMs: number = 2000
): Promise<ListCleanListStatus> {
  let lastStatus: ListCleanListStatus | null = null;

  for (let attempt = 0; attempt < maxAttempts; attempt++) {
    try {
      const status = await listcleanGetList(listId);
      lastStatus = status;

      const statusStr = (status.status ?? "").toLowerCase();
      const hasAnyCount =
        typeof status.clean_count === "number" ||
        typeof status.dirty_count === "number" ||
        typeof status.unknown_count === "number";

      const isComplete =
        statusStr === "completed" ||
        statusStr === "ready" ||
        statusStr === "complete" ||
        statusStr === "done" ||
        hasAnyCount;

      if (isComplete) {
        return status;
      }

      if (attempt < maxAttempts - 1) {
        await new Promise((resolve) => setTimeout(resolve, delayMs));
      }
    } catch (error) {
      if (attempt === maxAttempts - 1) {
        throw error;
      }
      await new Promise((resolve) => setTimeout(resolve, delayMs));
    }
  }

  if (lastStatus) {
    return lastStatus;
  }

  throw new Error(`ListClean list ${listId} did not complete after ${maxAttempts} attempts`);
}

export async function listcleanGetCredits(): Promise<ListCleanCreditsResponse> {
  const { baseUrl, token } = getListCleanConfig();

  try {
    const url = `${baseUrl}/credits`;
    const response = await fetch(url, {
      method: "GET",
      headers: {
        "Accept": "application/json",
        "X-Auth-Token": token,
        "Authorization": `Bearer ${token}`,
      },
    });

    const rawData = await parseJsonOrThrow(response, "ListClean credits fetch", url);

    if (typeof rawData !== "object" || rawData === null) {
      throw new Error("ListClean credits response is not an object");
    }

    if ((rawData as any).success !== 1) {
      throw new Error(`ListClean credits response indicates failure: ${JSON.stringify(rawData)}`);
    }

    const credits = (rawData as any).data?.credits;
    if (credits === undefined || credits === null) {
      throw new Error("ListClean response missing data.credits field");
    }

    const creditsNum = Number(credits);
    if (isNaN(creditsNum)) {
      throw new Error(`ListClean credits value is not a number: ${credits}`);
    }

    return {
      credits: creditsNum,
      raw: rawData,
    };
  } catch (error) {
    if (error instanceof Error) {
      throw new Error(`listcleanGetCredits failed: ${error.message}`);
    }
    throw new Error(`listcleanGetCredits failed with unknown error`);
  }
}
