import { readFileSync, readdirSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const projectRoot = join(__dirname, '..');
const distDir = join(projectRoot, 'dist');

let totalErrors = 0;
let totalWarnings = 0;
let filesChecked = 0;

function checkStructuredData(htmlPath, stateName) {
  try {
    const html = readFileSync(htmlPath, 'utf-8');
    const errors = [];
    const warnings = [];

    // 1. Check for exactly ONE unified schema script
    const schemaMatches = html.match(/<script[^>]*type=["']application\/ld\+json["'][^>]*>/g) || [];
    if (schemaMatches.length === 0) {
      errors.push('No JSON-LD schema found');
    } else if (schemaMatches.length > 1) {
      errors.push(`Multiple JSON-LD scripts found (${schemaMatches.length}), expected 1`);
    }

    // 2. Check for unified-jsonld-schema ID
    if (!html.includes('id="unified-jsonld-schema"')) {
      errors.push('Missing unified-jsonld-schema ID');
    }

    // 3. Extract schema content
    const schemaMatch = html.match(/<script[^>]*id=["']unified-jsonld-schema["'][^>]*>([\s\S]*?)<\/script>/);
    if (schemaMatch) {
      try {
        const schemaJson = JSON.parse(schemaMatch[1]);

        // Check for @graph
        if (!schemaJson['@graph']) {
          errors.push('Schema missing @graph structure');
        } else {
          const graphItems = schemaJson['@graph'];

          // Check for required schema types
          const types = graphItems.map(item => item['@type']);
          const requiredTypes = ['Organization', 'WebSite', 'WebPage', 'BreadcrumbList'];

          for (const reqType of requiredTypes) {
            if (!types.includes(reqType)) {
              errors.push(`Missing required schema type: ${reqType}`);
            }
          }

          // Check ItemList
          const itemList = graphItems.find(item => item['@type'] === 'ItemList');
          if (itemList) {
            const numberOfItems = itemList.numberOfItems;
            const itemListLength = itemList.itemListElement?.length || 0;

            if (numberOfItems !== itemListLength) {
              errors.push(`ItemList numberOfItems mismatch: ${numberOfItems} vs ${itemListLength} items`);
            }

            // Check for placeholder URLs in ItemList
            const itemUrls = itemList.itemListElement
              .map(item => item.item?.url || item.url)
              .filter(url => url);

            for (const url of itemUrls) {
              if (url.includes('example.com')) {
                errors.push('ItemList contains example.com placeholder URL');
                break;
              }
            }

            // Verify items have Organization structure (not just flat url)
            const hasOrgStructure = itemList.itemListElement.some(item =>
              item.item && item.item['@type'] === 'Organization'
            );

            if (!hasOrgStructure && itemListLength > 0) {
              warnings.push('ItemList items should have Organization structure with name');
            }
          }

          // Check FAQPage
          const faqPage = graphItems.find(item => item['@type'] === 'FAQPage');
          if (faqPage) {
            const questions = faqPage.mainEntity.map(q => q.name);
            const uniqueQuestions = [...new Set(questions.map(q => q.toLowerCase().trim().replace(/\s+/g, ' ')))];

            if (questions.length !== uniqueQuestions.length) {
              errors.push(`FAQPage contains duplicate questions (${questions.length} total, ${uniqueQuestions.length} unique)`);
            }
          }
        }
      } catch (e) {
        errors.push(`Failed to parse JSON-LD: ${e.message}`);
      }
    }

    // 4. Check for placeholder content in HTML body
    if (html.includes('example.com">Visit Website</a>')) {
      warnings.push('Body HTML contains example.com links');
    }

    // 5. Check that FAQ answers are in DOM
    const faqMatch = html.match(/<details[^>]*>/g);
    if (faqMatch && faqMatch.length > 0) {
      // Good: FAQs rendered as details
    } else if (html.includes('FAQPage')) {
      warnings.push('FAQPage schema present but no <details> FAQ elements in HTML');
    }

    filesChecked++;

    if (errors.length > 0) {
      console.log(`\n❌ ${stateName}:`);
      errors.forEach(err => console.log(`   - ${err}`));
      totalErrors += errors.length;
    }

    if (warnings.length > 0 && errors.length === 0) {
      console.log(`\n⚠️  ${stateName}:`);
      warnings.forEach(warn => console.log(`   - ${warn}`));
      totalWarnings += warnings.length;
    }

    return errors.length === 0;
  } catch (e) {
    console.log(`\n❌ ${stateName}: Failed to read file - ${e.message}`);
    totalErrors++;
    return false;
  }
}

console.log('🔍 Verifying structured data in prerendered HTML...\n');

// Get all state directories
const stateFiles = [];

// Check directory-based prerenders
const files = readdirSync(distDir);
for (const file of files) {
  if (file.startsWith('marketing-agencies-in-') && file.endsWith('-united-states')) {
    const indexPath = join(distDir, file, 'index.html');
    if (existsSync(indexPath)) {
      const stateName = file.replace('marketing-agencies-in-', '').replace('-united-states', '').replace(/-/g, ' ');
      stateFiles.push({ path: indexPath, name: stateName });
    }
  }
}

if (stateFiles.length === 0) {
  console.log('❌ No prerendered state files found in dist/');
  process.exit(1);
}

console.log(`Found ${stateFiles.length} state pages to verify\n`);

// Check each state
let passedCount = 0;
for (const { path, name } of stateFiles) {
  if (checkStructuredData(path, name)) {
    passedCount++;
  }
}

// Summary
console.log('\n' + '='.repeat(60));
console.log(`📊 Verification Summary:`);
console.log(`   Files checked: ${filesChecked}`);
console.log(`   Passed: ${passedCount}`);
console.log(`   Failed: ${filesChecked - passedCount}`);
console.log(`   Total errors: ${totalErrors}`);
console.log(`   Total warnings: ${totalWarnings}`);
console.log('='.repeat(60));

if (totalErrors > 0) {
  console.log('\n❌ Structured data verification FAILED');
  process.exit(1);
} else if (totalWarnings > 0) {
  console.log('\n⚠️  Structured data verification PASSED with warnings');
  process.exit(0);
} else {
  console.log('\n✅ Structured data verification PASSED');
  process.exit(0);
}
