// Maps approved enrichment field suggestions onto the existing Tool CMS
// ownership path — always via the admin-tools edge function (server-to-
// server, same pattern admin-crawl-extraction uses for create-draft), never
// a direct `tools` table write. Scalar fields that already have a non-empty,
// different value are held back as a "conflict" requiring the reviewer's
// explicit confirm_overwrite before they're applied. Repeatable fields
// (pros/cons/use_cases/faqs/categories/tags) are always additive merges —
// nothing existing is ever removed.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped Supabase rows throughout this file */
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { FIELD_REGISTRY } from "./enrichmentSchema.ts";

export interface ApprovedSuggestion {
  field_key: string;
  value: unknown; // approved_value if edited, else generated_value
}

export interface ApplyConflict {
  field_key: string;
  current_value: unknown;
  new_value: unknown;
}

export interface ApplyOutcome {
  applied_field_keys: string[];
  conflicts: ApplyConflict[];
  skipped: { field_key: string; reason: string }[];
  tool: any | null;
}

function valuesEqual(a: unknown, b: unknown): boolean {
  if (a === b) return true;
  try {
    return JSON.stringify(a) === JSON.stringify(b);
  } catch {
    return false;
  }
}

export async function applyApprovedSuggestions(
  supabase: SupabaseClient,
  supabaseUrl: string,
  anonKey: string,
  adminToken: string,
  toolId: string,
  suggestions: ApprovedSuggestion[],
  confirmOverwriteFieldKeys: string[],
): Promise<ApplyOutcome> {
  const conflicts: ApplyConflict[] = [];
  const skipped: { field_key: string; reason: string }[] = [];
  const confirmSet = new Set(confirmOverwriteFieldKeys);

  const { data: tool, error: toolError } = await supabase.from("tools").select("*").eq("id", toolId).single();
  if (toolError || !tool) throw new Error(`Tool ${toolId} not found`);

  const payload: Record<string, unknown> = {};
  const appliedFieldKeys: string[] = [];

  // Scalar tools_column fields — hold back on unconfirmed conflicts.
  const scalarSuggestions = suggestions.filter((s) => FIELD_REGISTRY[s.field_key]?.applyTarget.kind === "tools_column");
  for (const s of scalarSuggestions) {
    const def = FIELD_REGISTRY[s.field_key];
    if (def.applyTarget.kind !== "tools_column") continue;
    const column = def.applyTarget.column;
    const current = (tool as any)[column];
    const hasCurrent = current !== null && current !== undefined && current !== "";
    if (hasCurrent && !valuesEqual(current, s.value) && !confirmSet.has(s.field_key)) {
      conflicts.push({ field_key: s.field_key, current_value: current, new_value: s.value });
      continue;
    }
    payload[column] = s.value;
    appliedFieldKeys.push(s.field_key);
  }

  // tool_pros / tool_cons — merge-append, dedupe by exact text.
  for (const table of ["tool_pros", "tool_cons"] as const) {
    const fieldKey = table === "tool_pros" ? "pros" : "cons";
    const items = suggestions.filter((s) => s.field_key === fieldKey);
    if (items.length === 0) continue;
    const { data: existingRows } = await supabase.from(table).select("text").eq("tool_id", toolId);
    const existingTexts = new Set((existingRows || []).map((r: any) => r.text));
    const merged = [...existingTexts];
    for (const item of items) {
      const text = typeof item.value === "string" ? item.value.trim() : "";
      if (text && !existingTexts.has(text)) {
        merged.push(text);
        existingTexts.add(text);
      }
    }
    if (merged.length > (existingRows || []).length) {
      payload[fieldKey] = merged;
      appliedFieldKeys.push(fieldKey);
    } else {
      skipped.push({ field_key: fieldKey, reason: "No new values to merge" });
    }
  }

  // tool_use_cases — merge-append, dedupe by title.
  const useCaseItems = suggestions.filter((s) => s.field_key === "use_cases");
  if (useCaseItems.length > 0) {
    const { data: existingRows } = await supabase.from("tool_use_cases").select("title, description, audience").eq("tool_id", toolId);
    const existing = existingRows || [];
    const existingTitles = new Set(existing.map((r: any) => r.title.toLowerCase()));
    const merged = [...existing];
    for (const item of useCaseItems) {
      const v = item.value as any;
      const candidates = Array.isArray(v) ? v : [v];
      for (const c of candidates) {
        const title = typeof c?.title === "string" ? c.title.trim() : "";
        if (title && !existingTitles.has(title.toLowerCase())) {
          merged.push({ title, description: c.description ?? null, audience: c.audience ?? null });
          existingTitles.add(title.toLowerCase());
        }
      }
    }
    if (merged.length > existing.length) {
      payload.use_cases = merged;
      appliedFieldKeys.push("use_cases");
    } else {
      skipped.push({ field_key: "use_cases", reason: "No new values to merge" });
    }
  }

  // tool_faqs — merge-append, dedupe by question. New AI-sourced FAQs start
  // as drafts so nothing new goes live without a separate editorial pass.
  const faqItems = suggestions.filter((s) => s.field_key === "faqs");
  if (faqItems.length > 0) {
    const { data: existingRows } = await supabase.from("tool_faqs").select("question, answer, status").eq("tool_id", toolId);
    const existing = existingRows || [];
    const existingQuestions = new Set(existing.map((r: any) => r.question.toLowerCase()));
    const merged = [...existing];
    for (const item of faqItems) {
      const v = item.value as any;
      const candidates = Array.isArray(v) ? v : [v];
      for (const c of candidates) {
        const question = typeof c?.question === "string" ? c.question.trim() : "";
        const answer = typeof c?.answer === "string" ? c.answer.trim() : "";
        if (question && answer && !existingQuestions.has(question.toLowerCase())) {
          merged.push({ question, answer, status: "draft" });
          existingQuestions.add(question.toLowerCase());
        }
      }
    }
    if (merged.length > existing.length) {
      payload.faqs = merged;
      appliedFieldKeys.push("faqs");
    } else {
      skipped.push({ field_key: "faqs", reason: "No new values to merge" });
    }
  }

  // tool_features — merge-append, dedupe by title.
  const featureItems = suggestions.filter((s) => s.field_key === "features");
  if (featureItems.length > 0) {
    const { data: existingRows } = await supabase.from("tool_features").select("group_name, title, description, sort_order").eq("tool_id", toolId);
    const existing = existingRows || [];
    const existingTitles = new Set(existing.map((r: any) => r.title.toLowerCase()));
    const merged = [...existing];
    for (const item of featureItems) {
      const v = item.value as any;
      const candidates = Array.isArray(v) ? v : [v];
      for (const c of candidates) {
        const title = typeof c?.title === "string" ? c.title.trim() : "";
        if (title && !existingTitles.has(title.toLowerCase())) {
          merged.push({ group_name: c.group_name ?? null, title, description: c.description ?? null, sort_order: merged.length });
          existingTitles.add(title.toLowerCase());
        }
      }
    }
    if (merged.length > existing.length) {
      payload.features = merged;
      appliedFieldKeys.push("features");
    } else {
      skipped.push({ field_key: "features", reason: "No new values to merge" });
    }
  }

  // tool_integrations — merge-append, dedupe by integration_name.
  const integrationItems = suggestions.filter((s) => s.field_key === "integrations");
  if (integrationItems.length > 0) {
    const { data: existingRows } = await supabase.from("tool_integrations").select("integration_name, integration_slug, integration_logo, description").eq("tool_id", toolId);
    const existing = existingRows || [];
    const existingNames = new Set(existing.map((r: any) => r.integration_name.toLowerCase()));
    const merged = [...existing];
    for (const item of integrationItems) {
      const v = item.value as any;
      const candidates = Array.isArray(v) ? v : [v];
      for (const c of candidates) {
        const name = typeof c?.integration_name === "string" ? c.integration_name.trim() : typeof c?.name === "string" ? c.name.trim() : "";
        if (name && !existingNames.has(name.toLowerCase())) {
          merged.push({ integration_name: name, integration_slug: c.integration_slug ?? null, integration_logo: c.integration_logo ?? null, description: c.description ?? null });
          existingNames.add(name.toLowerCase());
        }
      }
    }
    if (merged.length > existing.length) {
      payload.integrations = merged;
      appliedFieldKeys.push("integrations");
    } else {
      skipped.push({ field_key: "integrations", reason: "No new values to merge" });
    }
  }

  // category / tag suggestions — resolve against EXISTING taxonomy only
  // (never auto-create), union with current links.
  const categorySuggestion = suggestions.find((s) => s.field_key === "category_suggestions");
  if (categorySuggestion) {
    const suggested = Array.isArray(categorySuggestion.value) ? categorySuggestion.value : [categorySuggestion.value];
    const { data: allCategories } = await supabase.from("tool_categories").select("id, slug, name");
    const resolved = new Set<string>();
    for (const s of suggested) {
      const needle = typeof s === "string" ? s.toLowerCase() : "";
      const match = (allCategories || []).find((c: any) => c.id === s || c.slug.toLowerCase() === needle || c.name.toLowerCase() === needle);
      if (match) resolved.add(match.id);
      else skipped.push({ field_key: "category_suggestions", reason: `"${s}" is not an existing category — not applied` });
    }
    const { data: existingLinks } = await supabase.from("tool_category_links").select("category_id, primary_category").eq("tool_id", toolId);
    const existingIds = (existingLinks || []).map((r: any) => r.category_id);
    const merged = [...new Set([...existingIds, ...resolved])];
    if (merged.length > existingIds.length) {
      payload.category_ids = merged;
      const existingPrimary = (existingLinks || []).find((r: any) => r.primary_category)?.category_id;
      payload.primary_category_id = existingPrimary || merged[0];
      appliedFieldKeys.push("category_suggestions");
    }
  }

  const tagSuggestion = suggestions.find((s) => s.field_key === "tag_suggestions");
  if (tagSuggestion) {
    const suggested = Array.isArray(tagSuggestion.value) ? tagSuggestion.value : [tagSuggestion.value];
    const { data: allTags } = await supabase.from("tool_tags").select("id, slug, name");
    const resolved = new Set<string>();
    for (const s of suggested) {
      const needle = typeof s === "string" ? s.toLowerCase() : "";
      const match = (allTags || []).find((t: any) => t.id === s || t.slug.toLowerCase() === needle || t.name.toLowerCase() === needle);
      if (match) resolved.add(match.id);
      else skipped.push({ field_key: "tag_suggestions", reason: `"${s}" is not an existing tag — not applied` });
    }
    const { data: existingLinks } = await supabase.from("tool_tag_links").select("tag_id").eq("tool_id", toolId);
    const existingIds = (existingLinks || []).map((r: any) => r.tag_id);
    const merged = [...new Set([...existingIds, ...resolved])];
    if (merged.length > existingIds.length) {
      payload.tag_ids = merged;
      appliedFieldKeys.push("tag_suggestions");
    }
  }

  if (Object.keys(payload).length === 0) {
    return { applied_field_keys: [], conflicts, skipped, tool: null };
  }

  const res = await fetch(`${supabaseUrl}/functions/v1/admin-tools?id=${toolId}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${anonKey}`,
      "apikey": anonKey,
      "x-admin-token": adminToken,
    },
    body: JSON.stringify(payload),
  });
  const body = await res.json().catch(() => null);
  if (!res.ok || !body?.ok) {
    throw new Error(body?.error || "Failed to apply enrichment fields via admin-tools");
  }

  return { applied_field_keys: appliedFieldKeys, conflicts, skipped, tool: body.data };
}
