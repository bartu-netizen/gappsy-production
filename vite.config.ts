import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react-swc';
import { prerenderHomepage } from './scripts/prerender-homepage.js';
import { prerender } from './scripts/prerender.js';
import { prerenderTools } from './scripts/prerender-tools.js';
import { prerenderToolsHub } from './scripts/prerender-tools-hub.js';
import { prerenderCategories } from './scripts/prerender-categories.js';
import { prerenderComparisons } from './scripts/prerender-comparisons.js';
import { prerenderGroupComparisons } from './scripts/prerender-group-comparisons.js';
import { prerenderCompareHub } from './scripts/prerender-compare-hub.js';

/**
 * Vite plugin that automatically runs prerender after build
 * This ensures ALL state pages are fully crawlable in initial HTML
 * CRITICAL: Build will FAIL if any state lacks full content
 */
function prerenderPlugin() {
  return {
    name: 'vite-plugin-prerender',
    apply: 'build' as const,
    async writeBundle() {
      console.log('\n🔄 Running automatic prerender with Supabase data...\n');

      try {
        // Load environment variables for Supabase access
        const env = loadEnv('production', process.cwd(), '');
        process.env.VITE_SUPABASE_URL = env.VITE_SUPABASE_URL;
        process.env.VITE_SUPABASE_ANON_KEY = env.VITE_SUPABASE_ANON_KEY;

        // Run prerender with hard failure enabled
        const result = await prerender({ failOnError: true });

        if (!result.success) {
          throw new Error(`Prerender failed for ${result.errorCount} states`);
        }

        console.log('✅ Prerender completed successfully - All states have full content\n');

        // Extend the same prerender step to published tool pages. Same
        // failure path, same plugin — state-page prerendering above is
        // untouched either way.
        console.log('\n🔄 Running tool-page prerender with Supabase data...\n');
        const toolResult = await prerenderTools({ failOnError: true });

        if (!toolResult.success) {
          throw new Error(`Tool prerender failed for ${toolResult.errorCount} tool(s)`);
        }

        console.log('✅ Tool prerender completed successfully - All published tools have crawlable HTML\n');

        // /tools hub: had ZERO prerendered HTML at all (the directory index
        // itself, not the individual tool pages above) — crawlers that
        // don't execute JS saw an empty SPA shell with no links to any
        // tool. Reuses the summary the step above already produced.
        console.log('\n🔄 Running /tools hub prerender...\n');
        await prerenderToolsHub({ tools: toolResult.toolsSummary });
        console.log('✅ /tools hub prerender completed successfully\n');

        // Extend the same prerender step to the categories hub + every
        // published category page. Same failure path, same plugin — tool
        // and state prerendering above are untouched either way.
        console.log('\n🔄 Running category-page prerender with Supabase data...\n');
        const categoryResult = await prerenderCategories({ failOnError: true });

        if (!categoryResult.success) {
          throw new Error(`Category prerender failed for ${categoryResult.errorCount} categor${categoryResult.errorCount === 1 ? 'y' : 'ies'}`);
        }

        console.log('✅ Category prerender completed successfully - All published categories have crawlable HTML\n');

        // Extend the same prerender step to approved /compare pages. Same
        // failure path, same plugin — tool, category, and state prerendering
        // above are untouched either way. An empty approved-comparisons set
        // is valid (not a failure) — see prerenderComparisons.
        console.log('\n🔄 Running comparison-page prerender with Supabase data...\n');
        const comparisonResult = await prerenderComparisons({ failOnError: true });

        if (!comparisonResult.success) {
          throw new Error(`Comparison prerender failed for ${comparisonResult.errorCount} comparison(s)`);
        }

        console.log('✅ Comparison prerender completed successfully - All published comparisons have crawlable HTML\n');

        // Extend the same prerender step to approved /compare/roundup pages
        // (3+ tool group comparisons). Same failure path, same plugin —
        // everything above is untouched either way. An empty approved set
        // is valid (not a failure) — see prerenderGroupComparisons.
        console.log('\n🔄 Running group comparison page prerender with Supabase data...\n');
        const groupComparisonResult = await prerenderGroupComparisons({ failOnError: true });

        if (!groupComparisonResult.success) {
          throw new Error(`Group comparison prerender failed for ${groupComparisonResult.errorCount} group comparison(s)`);
        }

        console.log('✅ Group comparison prerender completed successfully - All published group comparisons have crawlable HTML\n');

        // /compare hub: every individual comparison page above had ZERO
        // prerendered inbound links from anywhere on the site (not the
        // homepage, not tool pages, not category pages) — reachable only
        // via sitemap.xml. This gives all of them a real crawlable link,
        // reusing the summaries already produced above (no new DB query).
        console.log('\n🔄 Running /compare hub prerender...\n');
        await prerenderCompareHub({
          pairwise: comparisonResult.comparisonsSummary,
          group: groupComparisonResult.groupComparisonsSummary,
        });
        console.log('✅ /compare hub prerender completed successfully\n');

        // Prerender "/" LAST. dist/index.html doubles as the pristine SPA
        // shell every step above reads as its injection template (state/tool/
        // category/comparison pages all inject into a copy of it, writing to
        // their own subdirectory) — only this step overwrites dist/index.html
        // itself. Running it first previously poisoned that shared template
        // (double canonical tags, stripped <ol> agency list on every state
        // page) because later steps read the already-homepage-rewritten file.
        console.log('\n🔄 Running homepage prerender with Supabase data...\n');
        const homepageResult = await prerenderHomepage({ failOnError: true });

        if (!homepageResult.success) {
          throw new Error('Homepage prerender failed');
        }

        console.log('✅ Homepage prerender completed successfully - / has crawlable content\n');
      } catch (error) {
        console.error('\n❌ PRERENDER FAILED - Build cannot continue\n');
        console.error('Error:', error.message);
        console.error('\nHomepage (/) must have:');
        console.error('  • At least 1 published tool (refuses to prerender degenerate data)');
        console.error('  • Real category/tool stats injected into static HTML + JSON-LD\n');
        console.error('All 52 states must have:');
        console.error('  • Multi-paragraph intro (200+ chars)');
        console.error('  • Exactly 25 agencies with descriptions');
        console.error('  • FAQ section');
        console.error('  • FAQPage JSON-LD schema\n');
        console.error('Every published tool must have:');
        console.error('  • A real short or long description (no generic fallback)');
        console.error('  • A title, canonical, and non-noindex robots meta\n');
        console.error('Every published category must have:');
        console.error('  • A real seo_description or description (no generic fallback)');
        console.error('  • A title and canonical\n');
        console.error('Every published comparison must have:');
        console.error('  • A slug matching the canonical alphabetical ordering of its two tools\n');

        // HARD FAIL the build
        throw error;
      }
    }
  };
}

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), prerenderPlugin()],
  optimizeDeps: {
    exclude: ['lucide-react'],
  },
  build: {
    rollupOptions: {
      output: {
        manualChunks: (id) => {
          // Core React runtime — smallest critical path
          if (id.includes('/react/') || id.includes('/react-dom/')) {
            return 'react-vendor';
          }
          // React Router
          if (id.includes('react-router')) {
            return 'router';
          }
          // Supabase — only loaded when needed but shared across many pages
          if (id.includes('@supabase/')) {
            return 'supabase';
          }
          // Lucide icons — keep separate so tree-shaking works per-chunk
          if (id.includes('lucide-react')) {
            return 'icons';
          }
          // Admin-only pages → separate chunk (not loaded on public pages)
          if (
            id.includes('/pages/WpAdmin') ||
            id.includes('/pages/Admin') ||
            id.includes('/pages/em/') ||
            id.includes('/pages/BulkLogo') ||
            id.includes('/components/wpadmin/')
          ) {
            return 'admin';
          }
          // Availability funnel → separate chunk
          if (id.includes('/pages/Availability')) {
            return 'availability';
          }
          // All other node_modules
          if (id.includes('node_modules')) {
            return 'vendor';
          }
        },
      },
    },
    minify: 'oxc',
    cssMinify: true,
    reportCompressedSize: true,
    chunkSizeWarningLimit: 500,
    sourcemap: false,
    // Improve tree-shaking
    modulePreload: {
      polyfill: false,
    },
  },
});
