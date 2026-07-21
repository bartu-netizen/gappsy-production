import { writeFileSync, mkdirSync, existsSync, readFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import {
  generateToolsHubSEOData,
  generateToolsHubJSONLD,
  generateToolsHubStaticBodyHTML,
  injectSEOTags,
} from './tools-hub-seo-generator.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const projectRoot = join(__dirname, '..');

// Writes dist/tools/index.html from the {slug, name, title, canonical}
// summary prerenderTools already produced — no new Supabase query needed.
// Must run AFTER prerenderTools (vite.config.ts wires this in right after),
// since it only has real content once every individual /tools/:slug page
// already exists on disk.
export async function prerenderToolsHub({ tools, distDir: customDistDir } = {}) {
  const distDir = customDistDir || join(projectRoot, 'dist');
  const baseHtmlPath = join(distDir, 'index.html');
  if (!existsSync(baseHtmlPath)) {
    throw new Error('dist/index.html not found. Run Vite build first.');
  }
  const baseHtml = readFileSync(baseHtmlPath, 'utf-8');

  const toolsList = tools || [];

  const seoData = generateToolsHubSEOData();
  const jsonLd = generateToolsHubJSONLD(toolsList);
  const staticBodyHTML = generateToolsHubStaticBodyHTML(toolsList);
  const html = injectSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML);

  const hubDir = join(distDir, 'tools');
  mkdirSync(hubDir, { recursive: true });
  writeFileSync(join(hubDir, 'index.html'), html, 'utf-8');
  console.log(`✅ Tools hub page → dist/tools/index.html (${toolsList.length} tools linked)`);

  return { success: true, total: toolsList.length };
}
