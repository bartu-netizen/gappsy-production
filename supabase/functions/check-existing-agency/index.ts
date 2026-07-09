import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function normalizeAgencyName(name: string): string {
  return name
    .trim()
    .toLowerCase()
    .replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g, '')
    .replace(/\s+/g, ' ');
}

function normalizeWebsiteUrl(url: string): string {
  let normalized = url.trim().toLowerCase();

  normalized = normalized.replace(/^(https?:\/\/)?(www\.)?/, '');

  normalized = normalized.replace(/\/.*$/, '');

  normalized = normalized.replace(/\?.*$/, '');

  return normalized;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    const { stateSlug, agencyName, websiteUrl } = await req.json();

    console.log('🔍 API - Received check request:', {
      stateSlug,
      agencyName,
      websiteUrl
    });

    if (!stateSlug || !agencyName || !websiteUrl) {
      console.error('🔍 API - Missing required fields');
      return new Response(
        JSON.stringify({
          exists: false,
          error: 'Missing required fields'
        }),
        {
          status: 400,
          headers: {
            ...corsHeaders,
            'Content-Type': 'application/json',
          },
        }
      );
    }

    const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
    const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    const normalizedName = normalizeAgencyName(agencyName);
    const normalizedUrl = normalizeWebsiteUrl(websiteUrl);

    console.log('🔍 API - Normalized values:', {
      normalizedName,
      normalizedUrl
    });

    const { data: agencies, error } = await supabase
      .from('other_agencies')
      .select('id, name, state_name, state_slug, website_url')
      .eq('state_slug', stateSlug);

    if (error) {
      console.error('🔍 API - Database query error:', error);
      return new Response(
        JSON.stringify({ exists: false, error: error.message }),
        {
          status: 500,
          headers: {
            ...corsHeaders,
            'Content-Type': 'application/json',
          },
        }
      );
    }

    console.log('🔍 API - Found', agencies?.length || 0, 'agencies in state');

    if (!agencies || agencies.length === 0) {
      console.log('🔍 API - No agencies found for state:', stateSlug);
      return new Response(
        JSON.stringify({ exists: false }),
        {
          headers: {
            ...corsHeaders,
            'Content-Type': 'application/json',
          },
        }
      );
    }

    const matchedAgency = agencies.find(agency => {
      const agencyNormalizedName = normalizeAgencyName(agency.name || '');
      const nameMatch = agencyNormalizedName === normalizedName;

      if (!nameMatch) {
        return false;
      }

      if (!agency.website_url) {
        console.log('🔍 API - Name match found (no URL stored):', agency.name);
        return true;
      }

      const agencyNormalizedUrl = normalizeWebsiteUrl(agency.website_url);
      const urlMatch = agencyNormalizedUrl === normalizedUrl;

      console.log('🔍 API - Comparing with:', {
        storedName: agency.name,
        normalizedStoredName: agencyNormalizedName,
        normalizedInputName: normalizedName,
        nameMatch,
        storedUrl: agency.website_url,
        normalizedStoredUrl: agencyNormalizedUrl,
        normalizedInputUrl: normalizedUrl,
        urlMatch
      });

      return nameMatch && urlMatch;
    });

    if (matchedAgency) {
      console.log('✅ API - MATCH FOUND:', matchedAgency.name);
      return new Response(
        JSON.stringify({
          exists: true,
          agencyId: matchedAgency.id,
          agencyName: matchedAgency.name,
          stateName: matchedAgency.state_name,
        }),
        {
          headers: {
            ...corsHeaders,
            'Content-Type': 'application/json',
          },
        }
      );
    }

    console.log('❌ API - No match found');
    return new Response(
      JSON.stringify({ exists: false }),
      {
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json',
        },
      }
    );
  } catch (error) {
    console.error('🔍 API - Error in check-existing-agency:', error);
    return new Response(
      JSON.stringify({ exists: false, error: error.message }),
      {
        status: 500,
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json',
        },
      }
    );
  }
});