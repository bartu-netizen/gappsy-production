import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'jsr:@supabase/supabase-js@2';

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    // Get auth token from header
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: 'Authorization required' }),
        {
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          status: 401,
        }
      );
    }

    // Create Supabase client with the user's token
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: authHeader },
        },
      }
    );

    // Verify user is authenticated
    const { data: { user }, error: userError } = await supabaseClient.auth.getUser();
    if (userError || !user) {
      return new Response(
        JSON.stringify({ error: 'Unauthorized' }),
        {
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          status: 401,
        }
      );
    }

    // Get query parameters
    const url = new URL(req.url);
    const page = parseInt(url.searchParams.get('page') || '1');
    const limit = parseInt(url.searchParams.get('limit') || '50');
    const stateSlug = url.searchParams.get('state_slug');
    const service = url.searchParams.get('service');
    const budget = url.searchParams.get('budget');
    const timeline = url.searchParams.get('timeline');
    const startDate = url.searchParams.get('start_date');
    const endDate = url.searchParams.get('end_date');
    const search = url.searchParams.get('search');
    const exportCsv = url.searchParams.get('export') === 'csv';

    // Build query with filters
    let query = supabaseClient
      .from('agency_availability_requests')
      .select(`
        id,
        created_at,
        agency_id,
        state_slug,
        service,
        budget,
        timeline,
        client_email,
        client_name,
        additional_notes,
        other_agencies (
          name,
          website_url,
          state_name,
          location
        )
      `, { count: 'exact' });

    // Apply filters
    if (stateSlug && stateSlug !== 'all') {
      query = query.eq('state_slug', stateSlug);
    }

    if (service && service !== 'all') {
      query = query.eq('service', service);
    }

    if (budget && budget !== 'all') {
      query = query.eq('budget', budget);
    }

    if (timeline && timeline !== 'all') {
      query = query.eq('timeline', timeline);
    }

    if (startDate) {
      query = query.gte('created_at', startDate);
    }

    if (endDate) {
      // Add one day to include the end date fully
      const endDateTime = new Date(endDate);
      endDateTime.setDate(endDateTime.getDate() + 1);
      query = query.lt('created_at', endDateTime.toISOString());
    }

    if (search) {
      // Search in client name, email, or agency name
      query = query.or(`client_name.ilike.%${search}%,client_email.ilike.%${search}%`);
    }

    // Order by most recent first
    query = query.order('created_at', { ascending: false });

    // For CSV export, get all results; otherwise paginate
    if (!exportCsv) {
      const offset = (page - 1) * limit;
      query = query.range(offset, offset + limit - 1);
    }

    const { data: requests, error, count } = await query;

    if (error) {
      console.error('Error fetching availability requests:', error);
      return new Response(
        JSON.stringify({ error: error.message }),
        {
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
          status: 500,
        }
      );
    }

    // If CSV export requested
    if (exportCsv) {
      const csvRows = [
        // Header row
        ['Date', 'Agency Name', 'State', 'Client Name', 'Client Email', 'Service', 'Budget', 'Timeline', 'Notes'].join(',')
      ];

      // Data rows
      requests?.forEach(req => {
        const agencyName = req.other_agencies?.name || 'Unknown';
        const stateName = req.other_agencies?.state_name || req.state_slug;
        const date = new Date(req.created_at).toLocaleDateString();
        const notes = (req.additional_notes || '').replace(/,/g, ';').replace(/\n/g, ' ');

        csvRows.push([
          date,
          `"${agencyName}"`,
          stateName,
          `"${req.client_name || ''}"`,
          req.client_email || '',
          req.service || '',
          req.budget || '',
          req.timeline || '',
          `"${notes}"`
        ].join(','));
      });

      const csvContent = csvRows.join('\n');

      return new Response(csvContent, {
        headers: {
          ...corsHeaders,
          'Content-Type': 'text/csv',
          'Content-Disposition': `attachment; filename="availability-requests-${new Date().toISOString().split('T')[0]}.csv"`,
        },
        status: 200,
      });
    }

    // Get distinct filter values for dropdowns
    const adminClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    const [statesResult, servicesResult, budgetsResult, timelinesResult] = await Promise.all([
      adminClient.from('agency_availability_requests').select('state_slug').order('state_slug'),
      adminClient.from('agency_availability_requests').select('service').order('service'),
      adminClient.from('agency_availability_requests').select('budget').order('budget'),
      adminClient.from('agency_availability_requests').select('timeline').order('timeline')
    ]);

    // Get unique values
    const uniqueStates = [...new Set(statesResult.data?.map(r => r.state_slug).filter(Boolean))];
    const uniqueServices = [...new Set(servicesResult.data?.map(r => r.service).filter(Boolean))];
    const uniqueBudgets = [...new Set(budgetsResult.data?.map(r => r.budget).filter(Boolean))];
    const uniqueTimelines = [...new Set(timelinesResult.data?.map(r => r.timeline).filter(Boolean))];

    // Return JSON response
    return new Response(
      JSON.stringify({
        success: true,
        data: requests,
        pagination: {
          page,
          limit,
          total: count || 0,
          totalPages: Math.ceil((count || 0) / limit)
        },
        filters: {
          states: uniqueStates,
          services: uniqueServices,
          budgets: uniqueBudgets,
          timelines: uniqueTimelines
        }
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
      }
    );
  } catch (error) {
    console.error('Error in availability-requests-list:', error);
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';

    return new Response(
      JSON.stringify({ error: errorMessage }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 500,
      }
    );
  }
});