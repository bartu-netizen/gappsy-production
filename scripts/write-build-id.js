import { writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const timestamp = new Date().toISOString();
const randomId = Math.random().toString(36).substring(2, 10);
const content = `DEPLOY: ${timestamp} | id=${randomId}\n`;

const outputPath = join(__dirname, '..', 'dist', 'build-id.txt');

writeFileSync(outputPath, content, 'utf-8');

console.log(`✅ Build ID written to dist/build-id.txt`);
console.log(`   ${content.trim()}`);
