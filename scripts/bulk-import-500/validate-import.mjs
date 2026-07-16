#!/usr/bin/env node
// Re-verifies the 500-target bulk import (see supabase/migrations/
// 20260716120000_* and 20260716130000_*). Safe to re-run at any time —
// read-only, no writes. Usage: node scripts/bulk-import-500/validate-import.mjs
import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..', '..');

function loadEnv() {
  const envText = readFileSync(join(projectRoot, '.env.local'), 'utf-8');
  for (const line of envText.split('\n')) {
    const m = line.match(/^([A-Z0-9_]+)=(.*)$/);
    if (m) process.env[m[1]] = m[2];
  }
}
loadEnv();

const supabase = createClient(process.env.VITE_SUPABASE_URL, process.env.VITE_SUPABASE_ANON_KEY);

async function main() {
  console.log('Validating bulk-500 import (anon-key, i.e. same access the public site has)...\n');

  // 1. None of the imported (needs_review) tools should be visible via the
  //    public anon key — RLS must be filtering them out.
  const { data: publicBulkTools, error: publicErr } = await supabase
    .from('tools').select('slug').eq('source', 'bulk');
  if (publicErr) throw publicErr;
  console.log(`Bulk-imported tools visible via public anon key: ${publicBulkTools.length} (expected: 0)`);
  if (publicBulkTools.length > 0) {
    console.error('FAIL: draft/needs_review bulk tools are leaking through RLS to the public API.');
    process.exitCode = 1;
  }

  // 2. New categories should be publicly visible (they're real taxonomy,
  //    just currently empty of published tools).
  const NEW_CATEGORY_SLUGS = ['documents-esignature', 'healthcare', 'field-service', 'retail-pos'];
  const { data: cats, error: catErr } = await supabase
    .from('tool_categories').select('slug, name').in('slug', NEW_CATEGORY_SLUGS);
  if (catErr) throw catErr;
  console.log(`New categories found: ${cats.length} / ${NEW_CATEGORY_SLUGS.length}`);
  for (const slug of NEW_CATEGORY_SLUGS) {
    if (!cats.some((c) => c.slug === slug)) console.error(`  MISSING category: ${slug}`);
  }

  console.log('\nNote: tools.status/source and tool_strategic_metadata are admin/service-role-only');
  console.log('(no public SELECT policy) by design, so full row-level validation of counts and');
  console.log('duplicate-vs-new classification requires an admin session or `supabase db query`');
  console.log('— see scripts/bulk-import-500/README.md for the exact SQL used at import time.');
}

main().catch((err) => {
  console.error('Validation script error:', err);
  process.exitCode = 1;
});
