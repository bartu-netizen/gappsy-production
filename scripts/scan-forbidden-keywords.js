#!/usr/bin/env node
/**
 * Build-time forbidden keyword scanner.
 * Scans prerendered HTML and JSON data files for SEO-spam keywords.
 * Intentionally excludes minified JS bundles — they legitimately contain
 * the keyword list as admin UI labels and scanner config strings.
 * Fails the build (exit 1) if forbidden content is found.
 */

import { readFileSync, readdirSync, statSync } from 'fs';
import { join, extname } from 'path';

const FORBIDDEN_KEYWORDS = [
  'casino', 'gambling', 'slots', 'free spins', 'slot machine',
  'online casino', 'casino zonder', 'betspins', 'betway',
  '888casino', 'jackpot', 'pokies', 'wagering'
];

// Scan targets: HTML (prerendered pages) and JSON data files only.
// JS bundles are excluded — they contain the keyword list itself in admin UI.
const SCAN_TARGETS = [
  { path: 'dist', extensions: new Set(['.html']) },
  { path: 'public/data', extensions: new Set(['.json']) },
  { path: 'dist/data', extensions: new Set(['.json']) },
];

let violations = 0;

function scanFile(filePath) {
  try {
    const content = readFileSync(filePath, 'utf8').toLowerCase();
    for (const keyword of FORBIDDEN_KEYWORDS) {
      if (content.includes(keyword.toLowerCase())) {
        console.error(`\n  FORBIDDEN KEYWORD FOUND`);
        console.error(`  File   : ${filePath}`);
        console.error(`  Keyword: "${keyword}"`);

        const lines = content.split('\n');
        lines.forEach((line, i) => {
          if (line.includes(keyword.toLowerCase())) {
            const preview = line.trim().substring(0, 120);
            console.error(`  Line ${i + 1}: ...${preview}...`);
          }
        });

        violations++;
      }
    }
  } catch {
    // Skip unreadable files
  }
}

function scanDir(dirPath, extensions) {
  let entries;
  try {
    entries = readdirSync(dirPath);
  } catch {
    return;
  }

  for (const entry of entries) {
    const fullPath = join(dirPath, entry);
    try {
      const stat = statSync(fullPath);
      if (stat.isDirectory()) {
        scanDir(fullPath, extensions);
      } else if (extensions.has(extname(entry).toLowerCase())) {
        scanFile(fullPath);
      }
    } catch {
      // Skip
    }
  }
}

console.log('\nScanning for forbidden keywords...');
for (const target of SCAN_TARGETS) {
  console.log(`  Scanning: ${target.path}/ (${[...target.extensions].join(', ')} files)`);
  scanDir(target.path, target.extensions);
}

if (violations > 0) {
  console.error(`\nBUILD FAILED: ${violations} forbidden keyword violation(s) found.`);
  console.error('Remove all casino/gambling/spam content before deploying.\n');
  process.exit(1);
} else {
  console.log(`  No forbidden keywords found. Content is clean.\n`);
}
