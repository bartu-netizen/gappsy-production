import { writeFileSync, mkdirSync, existsSync, readFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import {
  generateCompareHubSEOData,
  generateCompareHubJSONLD,
  generateCompareHubStaticBodyHTML,
  injectSEOTags,
} from './compare-hub-seo-generator.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');

// Writes dist/compare/index.html from the {slug, title, canonical} summaries
// prerenderComparisons/prerenderGroupComparisons already produced — no new
// Supabase query needed. Must run AFTER both of those (vite.config.ts wires
// this in right after), since it only has real content once every
// individual /compare/:slug page already exists on disk.
export async function prerenderCompareHub({ pairwise, group, distDir: customDistDir } = {}) {
  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');
  if (!existsSync(baseHtmlPath)) {
    throw new Error('dist/index.html not found. Run Vite build first.');
  }
  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');

  const pairwiseList = pairwise || [];
  const groupList = group || [];

  const seoData = generateCompareHubSEOData();
  const jsonLd = generateCompareHubJSONLD({ pairwise: pairwiseList, group: groupList });
  const staticBodyHTML = generateCompareHubStaticBodyHTML({ pairwise: pairwiseList, group: groupList });
  const html = injectSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);

  const hubDir = join(distDir, 'compare');
  mkdirSync(hubDir, { recursive: true });
  writeFileSync(join(hubDir, 'index.html'), html, 'utf-8');
  console.log(`✅ Compare hub page → dist/compare/index.html (${pairwiseList.length} pairwise + ${groupList.length} group comparisons linked)`);

  return { success: true, total: pairwiseList.length + groupList.length };
}
