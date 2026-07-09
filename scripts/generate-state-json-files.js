import { writeFileSync, mkdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const projectRoot = join(__dirname, '..');

const states = [
  { slug: 'alabama', name: 'Alabama' },
  { slug: 'alaska', name: 'Alaska' },
  { slug: 'arizona', name: 'Arizona' },
  { slug: 'arkansas', name: 'Arkansas' },
  { slug: 'california', name: 'California' },
  { slug: 'colorado', name: 'Colorado' },
  { slug: 'connecticut', name: 'Connecticut' },
  { slug: 'delaware', name: 'Delaware' },
  { slug: 'district-of-columbia', name: 'District Of Columbia' },
  { slug: 'florida', name: 'Florida' },
  { slug: 'georgia', name: 'Georgia' },
  { slug: 'hawaii', name: 'Hawaii' },
  { slug: 'idaho', name: 'Idaho' },
  { slug: 'illinois', name: 'Illinois' },
  { slug: 'indiana', name: 'Indiana' },
  { slug: 'iowa', name: 'Iowa' },
  { slug: 'kansas', name: 'Kansas' },
  { slug: 'kentucky', name: 'Kentucky' },
  { slug: 'louisiana', name: 'Louisiana' },
  { slug: 'maine', name: 'Maine' },
  { slug: 'maryland', name: 'Maryland' },
  { slug: 'massachusetts', name: 'Massachusetts' },
  { slug: 'michigan', name: 'Michigan' },
  { slug: 'minnesota', name: 'Minnesota' },
  { slug: 'mississippi', name: 'Mississippi' },
  { slug: 'missouri', name: 'Missouri' },
  { slug: 'montana', name: 'Montana' },
  { slug: 'nebraska', name: 'Nebraska' },
  { slug: 'nevada', name: 'Nevada' },
  { slug: 'new-hampshire', name: 'New Hampshire' },
  { slug: 'new-jersey', name: 'New Jersey' },
  { slug: 'new-mexico', name: 'New Mexico' },
  { slug: 'new-york', name: 'New York' },
  { slug: 'north-carolina', name: 'North Carolina' },
  { slug: 'north-dakota', name: 'North Dakota' },
  { slug: 'ohio', name: 'Ohio' },
  { slug: 'oklahoma', name: 'Oklahoma' },
  { slug: 'oregon', name: 'Oregon' },
  { slug: 'pennsylvania', name: 'Pennsylvania' },
  { slug: 'puerto-rico', name: 'Puerto Rico' },
  { slug: 'rhode-island', name: 'Rhode Island' },
  { slug: 'south-carolina', name: 'South Carolina' },
  { slug: 'south-dakota', name: 'South Dakota' },
  { slug: 'tennessee', name: 'Tennessee' },
  { slug: 'texas', name: 'Texas' },
  { slug: 'utah', name: 'Utah' },
  { slug: 'vermont', name: 'Vermont' },
  { slug: 'virginia', name: 'Virginia' },
  { slug: 'washington', name: 'Washington' },
  { slug: 'west-virginia', name: 'West Virginia' },
  { slug: 'wisconsin', name: 'Wisconsin' },
  { slug: 'wyoming', name: 'Wyoming' }
];

const dataDir = join(projectRoot, 'public', 'data');
mkdirSync(dataDir, { recursive: true });

console.log('\n🚀 Generating JSON files for all 52 states...\n');

let count = 0;

for (const state of states) {
  const jsonData = {
    state: state.slug,
    stateName: state.name,
    lastUpdated: new Date().toISOString().split('T')[0],
    seo: {
      title: `Top 25 Marketing Agencies in ${state.name} (2025) | Gappsy`,
      meta_description: `Discover ${state.name}'s best marketing agencies. Comprehensive rankings of top-rated firms serving local businesses across ${state.name}.`,
      canonical_url: `https://gappsy.bolt.host/marketing-agencies-in-${state.slug}-united-states/`,
      og_title: `Top 25 Marketing Agencies in ${state.name} (2025)`,
      og_description: `Discover ${state.name}'s best marketing agencies serving businesses across the state.`,
      focus_keyword: `marketing agencies in ${state.name}`
    }
  };

  const filePath = join(dataDir, `${state.slug}.json`);
  writeFileSync(filePath, JSON.stringify(jsonData, null, 2), 'utf-8');

  console.log(`✅ ${state.name.padEnd(22)} → ${state.slug}.json`);
  count++;
}

console.log(`\n📊 Generated ${count} JSON files\n`);
