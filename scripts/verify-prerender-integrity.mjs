#!/usr/bin/env node
/**
 * Build-time regression guard for the prerender root-div injection bug:
 * a string-replacement `.replace(/(<div id="root"><\/div>)/, ...)` call
 * interprets "$1"-style sequences inside the replacement content as
 * regex backreferences, silently corrupting any injected pricing text
 * that starts with "$1" (e.g. "$10.99" -> "<div id="root"></div>0.99").
 *
 * The injector itself is fixed (function-based replacer), but this check
 * stays in the pipeline so any future regression fails the build loudly
 * instead of shipping broken, crawler-visible pricing text.
 */

import { readFileSync, readdirSync, statSync } from 'fs';
import { join } from 'path';

const SCAN_DIRS = ['dist/tools', 'dist/compare'];
const CORRUPTION_PATTERN = /<div id="root"><\/div>[0-9]/;

let violations = 0;

function scanFile(filePath) {
  try {
    const content = readFileSync(filePath, 'utf8');
    const match = content.match(CORRUPTION_PATTERN);
    if (match) {
      const lineIndex = content.slice(0, match.index).split('\n').length;
      console.error(`\n  PRERENDER CORRUPTION FOUND`);
      console.error(`  File: ${filePath}`);
      console.error(`  Line: ${lineIndex}`);
      violations++;
    }
  } catch {
    // Skip unreadable files
  }
}

function scanDir(dirPath) {
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
        scanDir(fullPath);
      } else if (entry === 'index.html') {
        scanFile(fullPath);
      }
    } catch {
      // Skip
    }
  }
}

console.log('\nVerifying prerender root-div injection integrity...');
for (const dir of SCAN_DIRS) {
  console.log(`  Scanning: ${dir}/`);
  scanDir(dir);
}

if (violations > 0) {
  console.error(`\nBUILD FAILED: ${violations} corrupted prerendered page(s) found.`);
  console.error('This is the "$1 backreference" root-div injection bug — see comment at top of this script.\n');
  process.exit(1);
} else {
  console.log(`  No corruption found. Prerendered pricing/content is intact.\n`);
}
