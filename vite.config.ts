import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react-swc';
import { prerender } from './scripts/prerender.js';
import { prerenderTools } from './scripts/prerender-tools.js';

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
      } catch (error) {
        console.error('\n❌ PRERENDER FAILED - Build cannot continue\n');
        console.error('Error:', error.message);
        console.error('\nAll 52 states must have:');
        console.error('  • Multi-paragraph intro (200+ chars)');
        console.error('  • Exactly 25 agencies with descriptions');
        console.error('  • FAQ section');
        console.error('  • FAQPage JSON-LD schema\n');
        console.error('Every published tool must have:');
        console.error('  • A real short or long description (no generic fallback)');
        console.error('  • A title, canonical, and non-noindex robots meta\n');

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
