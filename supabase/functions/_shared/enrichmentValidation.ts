// Validates a pasted-back enrichment result. Strict schema validation,
// per-field — when one field is malformed we drop only that field (with a
// recorded warning) and keep every other valid field/tool, per the "preserve
// valid fields where safe" requirement. A payload that isn't even valid JSON
// or has no usable structure fails the whole import.

import { FIELD_REGISTRY, FORBIDDEN_FIELD_KEYS, ImportFieldResult, ImportPayload, ImportToolResult, isKnownFieldKey } from "./enrichmentSchema.ts";

export interface FieldValidationIssue {
  tool_id: string | null;
  field_key: string | null;
  reason: string;
}

export interface ValidatedImport {
  results: { tool_id: string; fields: ImportFieldResult[] }[];
  issues: FieldValidationIssue[];
}

function validateOneField(toolId: string, raw: unknown, requestedFields: string[], issues: FieldValidationIssue[]): ImportFieldResult | null {
  if (!raw || typeof raw !== "object") {
    issues.push({ tool_id: toolId, field_key: null, reason: "Field entry is not an object" });
    return null;
  }
  const f = raw as Record<string, unknown>;
  const fieldKey = typeof f.field_key === "string" ? f.field_key : null;
  if (!fieldKey) {
    issues.push({ tool_id: toolId, field_key: null, reason: "Missing field_key" });
    return null;
  }
  if (FORBIDDEN_FIELD_KEYS.has(fieldKey)) {
    issues.push({ tool_id: toolId, field_key: fieldKey, reason: "field_key is on the forbidden list (ratings/popularity/etc.) and was dropped" });
    return null;
  }
  if (!isKnownFieldKey(fieldKey)) {
    issues.push({ tool_id: toolId, field_key: fieldKey, reason: "Unknown field_key — not in the enrichment field registry" });
    return null;
  }
  if (requestedFields.length > 0 && !requestedFields.includes(fieldKey)) {
    issues.push({ tool_id: toolId, field_key: fieldKey, reason: "field_key was not requested for this batch — dropped" });
    return null;
  }
  const confidence = typeof f.confidence === "number" && Number.isFinite(f.confidence) ? Math.max(0, Math.min(100, Math.round(f.confidence))) : null;
  if (confidence === null) {
    issues.push({ tool_id: toolId, field_key: fieldKey, reason: "confidence must be a number 0-100" });
    return null;
  }
  const classification = f.classification === "factual" || f.classification === "editorial" ? f.classification : null;
  if (!classification) {
    issues.push({ tool_id: toolId, field_key: fieldKey, reason: 'classification must be "factual" or "editorial"' });
    return null;
  }
  const unsupported = f.unsupported === true;
  const def = FIELD_REGISTRY[fieldKey];
  let value = f.value ?? null;
  if (!unsupported && (value === null || value === undefined || value === "")) {
    // No evidence and no explicit unsupported flag — treat as unsupported
    // rather than silently accepting an empty factual claim.
    issues.push({ tool_id: toolId, field_key: fieldKey, reason: "value was empty but unsupported was not set — treated as unsupported" });
  }
  if (typeof value === "string" && def.maxValueLength && value.length > def.maxValueLength) {
    value = value.slice(0, def.maxValueLength);
    issues.push({ tool_id: toolId, field_key: fieldKey, reason: `value exceeded max length (${def.maxValueLength}) and was truncated` });
  }
  const sourceUrls = Array.isArray(f.source_urls) ? f.source_urls.filter((u): u is string => typeof u === "string").slice(0, 10) : [];
  const warnings = Array.isArray(f.warnings) ? f.warnings.filter((w): w is string => typeof w === "string") : [];

  return {
    field_key: fieldKey,
    value: unsupported || value === "" ? null : value,
    confidence,
    reason: typeof f.reason === "string" ? f.reason.slice(0, 1000) : undefined,
    source_urls: sourceUrls,
    evidence: typeof f.evidence === "string" ? f.evidence.slice(0, 500) : undefined,
    classification,
    unsupported: unsupported || value === null || value === undefined,
    warnings,
  };
}

export function validateImportPayload(raw: unknown, expectedToolIds: Set<string>, requestedFieldsByTool: Map<string, string[]>): ValidatedImport {
  const issues: FieldValidationIssue[] = [];

  let parsed: unknown = raw;
  if (typeof raw === "string") {
    try {
      parsed = JSON.parse(raw);
    } catch {
      return { results: [], issues: [{ tool_id: null, field_key: null, reason: "Pasted text is not valid JSON" }] };
    }
  }

  if (!parsed || typeof parsed !== "object" || !Array.isArray((parsed as ImportPayload).results)) {
    return { results: [], issues: [{ tool_id: null, field_key: null, reason: 'Top-level JSON must be an object with a "results" array' }] };
  }

  const results: { tool_id: string; fields: ImportFieldResult[] }[] = [];
  for (const rawResult of (parsed as ImportPayload).results as unknown[]) {
    if (!rawResult || typeof rawResult !== "object") {
      issues.push({ tool_id: null, field_key: null, reason: "results[] entry is not an object" });
      continue;
    }
    const r = rawResult as ImportToolResult;
    const toolId = typeof r.tool_id === "string" ? r.tool_id : null;
    if (!toolId) {
      issues.push({ tool_id: null, field_key: null, reason: "results[] entry missing tool_id" });
      continue;
    }
    if (!expectedToolIds.has(toolId)) {
      issues.push({ tool_id: toolId, field_key: null, reason: "tool_id is not part of this batch — ignored" });
      continue;
    }
    if (!Array.isArray(r.fields)) {
      issues.push({ tool_id: toolId, field_key: null, reason: "fields must be an array" });
      continue;
    }
    const requestedFields = requestedFieldsByTool.get(toolId) || [];
    const validFields: ImportFieldResult[] = [];
    for (const rawField of r.fields) {
      const validated = validateOneField(toolId, rawField, requestedFields, issues);
      if (validated) validFields.push(validated);
    }
    results.push({ tool_id: toolId, fields: validFields });
  }

  return { results, issues };
}
