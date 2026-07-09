import { writeFileSync, readFileSync, existsSync, mkdirSync, readdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import { execSync } from 'child_process';
import { getAllStatesFromDatabase } from './seo-generator.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const projectRoot = join(__dirname, '..');
const dataDir = join(projectRoot, 'public', 'data');
const outputDir = join(projectRoot, 'public', 'og');

const WIDTH = 1200;
const HEIGHT = 630;

function generateOGImage(stateName, stateSlug) {
  const year = new Date().getFullYear();

  const svg = `<?xml version="1.0" encoding="UTF-8"?>
<svg width="1200" height="630" viewBox="0 0 1200 630" xmlns="http://www.w3.org/2000/svg">
  <rect width="1200" height="630" fill="#0A1735"/>
  <rect x="120" y="75" width="960" height="480" rx="32" fill="rgba(255,255,255,0.06)" stroke="rgba(255,255,255,0.12)" stroke-width="1.5"/>
  <text x="600" y="260" font-family="Arial, Helvetica, sans-serif" font-size="54" font-weight="800" fill="#F8FAFC" text-anchor="middle">Top 25 Marketing Agencies in</text>
  <text x="600" y="360" font-family="Arial, Helvetica, sans-serif" font-size="84" font-weight="900" fill="#4F46E5" text-anchor="middle">${stateName}</text>
  <text x="600" y="410" font-family="Arial, Helvetica, sans-serif" font-size="22" font-weight="600" fill="rgba(248,250,252,0.70)" text-anchor="middle">United States • ${year} Rankings</text>
  <text x="600" y="525" font-family="Arial, Helvetica, sans-serif" font-size="22" font-weight="600" fill="rgba(248,250,252,0.70)" text-anchor="middle">By Gappsy.com</text>
</svg>`;

  return svg;
}

function convertSvgToPng(svgPath, pngPath) {
  try {
    execSync(`convert -background none -density 150 "${svgPath}" -resize 1200x630! "${pngPath}"`, {
      stdio: 'pipe'
    });
    return true;
  } catch (error) {
    console.error(`⚠️  PNG conversion failed: ${error.message}`);
    return false;
  }
}

async function main() {
  console.log('🚀 Starting OG image generation...\n');

  if (!existsSync(outputDir)) {
    mkdirSync(outputDir, { recursive: true });
    console.log('📁 Created output directory:', outputDir);
  }

  console.log('📡 Fetching all active states from database...\n');
  let statesToGenerate = await getAllStatesFromDatabase();

  if (statesToGenerate.length === 0) {
    console.log('⚠️  No states found in database, falling back to JSON files...\n');

    try {
      const jsonFiles = readdirSync(dataDir).filter(file => file.endsWith('.json') && !file.includes('backup') && !file.includes('copy'));

      statesToGenerate = jsonFiles.map(file => {
        const jsonPath = join(dataDir, file);
        const jsonContent = JSON.parse(readFileSync(jsonPath, 'utf-8'));
        return {
          state_slug: jsonContent.state || jsonContent.state_slug,
          state_name: jsonContent.stateName || jsonContent.state_name
        };
      }).filter(s => s.state_slug && s.state_name);

    } catch (error) {
      console.error('❌ Error reading JSON fallback:', error.message);
      process.exit(1);
    }
  }

  console.log(`📄 Generating OG images for ${statesToGenerate.length} states\n`);

  let successCount = 0;
  let errorCount = 0;
  let pngSuccessCount = 0;

  for (const state of statesToGenerate) {
    try {
      const stateSlug = state.state_slug;
      const stateName = state.state_name;

      if (!stateSlug || !stateName) {
        console.warn(`⚠️  Skipping state: Missing slug or name`);
        errorCount++;
        continue;
      }

      const svgOutputPath = join(outputDir, `marketing-agencies-in-${stateSlug}-united-states.svg`);
      const pngOutputPath = join(outputDir, `marketing-agencies-in-${stateSlug}-united-states.png`);

      const svgContent = generateOGImage(stateName, stateSlug);
      writeFileSync(svgOutputPath, svgContent, 'utf-8');

      // Convert SVG to PNG for better platform compatibility
      const pngConverted = convertSvgToPng(svgOutputPath, pngOutputPath);
      if (pngConverted) {
        pngSuccessCount++;
      }

      console.log(`✅ ${stateName.padEnd(20)} → /og/marketing-agencies-in-${stateSlug}-united-states.{svg,png}`);
      successCount++;
    } catch (error) {
      console.error(`❌ Error processing ${state.state_name || 'unknown'}:`, error.message);
      errorCount++;
    }
  }

  console.log(`\n📊 OG image generation complete:`);
  console.log(`   ✅ SVG images: ${successCount}`);
  console.log(`   ✅ PNG images: ${pngSuccessCount}`);
  if (errorCount > 0) {
    console.log(`   ❌ Errors: ${errorCount} images`);
  }
}

try {
  await main();
} catch (error) {
  console.error('❌ Fatal error:', error);
  process.exit(1);
}
