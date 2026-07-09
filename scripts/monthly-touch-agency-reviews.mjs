#!/usr/bin/env node

/**
 * Monthly Agency Reviews Last Updated Touch Script
 *
 * Updates the `last_updated` field for all agency reviews to the current timestamp.
 * This ensures the frontend displays accurate "Last Updated: Month Year" information
 * and keeps schema.org dateModified current.
 *
 * Usage:
 *   SUPABASE_URL=xxx SUPABASE_SERVICE_ROLE_KEY=xxx node scripts/monthly-touch-agency-reviews.mjs
 *
 * Environment Variables Required:
 *   - SUPABASE_URL: Your Supabase project URL
 *   - SUPABASE_SERVICE_ROLE_KEY: Service role key (not anon key)
 */

import { createClient } from '@supabase/supabase-js';

// Validate environment variables
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
  console.error('❌ Error: Missing required environment variables');
  console.error('   Required: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

// Create Supabase client with service role key
const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
});

async function updateAgencyReviews() {
  try {
    console.log('🚀 Starting monthly agency reviews update...');
    console.log(`📅 Current timestamp: ${new Date().toISOString()}`);

    // Update all agency reviews where agency_slug is not null
    // This ensures we only touch valid, published reviews
    // Only updates last_updated (not updated_at which is for actual content changes)
    const { data, error, count } = await supabase
      .from('agency_reviews')
      .update({
        last_updated: new Date().toISOString()
      })
      .not('agency_slug', 'is', null)
      .select('id', { count: 'exact', head: false });

    if (error) {
      console.error('❌ Database error:', error.message);
      console.error('   Details:', error);
      process.exit(1);
    }

    // Log results
    const affectedRows = count || data?.length || 0;
    console.log(`✅ Success: Updated ${affectedRows} agency review(s)`);

    if (affectedRows === 0) {
      console.warn('⚠️  Warning: No rows were updated. Check if agency_reviews table has data.');
    }

    console.log('✨ Monthly update complete!');
    process.exit(0);

  } catch (err) {
    console.error('❌ Unexpected error:', err.message);
    console.error('   Stack:', err.stack);
    process.exit(1);
  }
}

// Run the update
updateAgencyReviews();
