import "jsr:@supabase/functions-js/edge-runtime.d.ts";

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
    const data = await req.json();

    const emailBody = `
New Agency Submission

=================================
STATE: ${data.state}
=================================

AGENCY INFORMATION:
-------------------
Agency Name: ${data.agencyName}
Website URL: ${data.websiteUrl}

CONTACT INFORMATION:
-------------------
Primary Contact Name: ${data.primaryContactName}
Contact Email: ${data.contactEmail}
Location: ${data.location}

SERVICES & INDUSTRIES:
----------------------
Services Offered: ${data.servicesOffered.join(", ")}
Industries Served: ${data.industriesServed.length > 0 ? data.industriesServed.join(", ") : "Not specified"}

BUDGET INFORMATION:
-------------------
Monthly Marketing Budget Range: ${data.budgetRange || "Not specified"}

AGENCY DESCRIPTION:
-------------------
${data.agencyDescription}

NOTABLE CLIENTS / CASE STUDIES:
--------------------------------
${data.notableClients || "Not provided"}

LOGO:
-----
${data.logoFileName}

=================================
Submitted on: ${new Date().toISOString()}
=================================
    `;

    console.log("Agency Submission Received:");
    console.log(emailBody);

    const emailData = {
      to: "bartu@gappsy.com",
      subject: `New Agency Submission – ${data.state}`,
      body: emailBody,
      submissionData: data
    };

    console.log("Email would be sent to:", emailData.to);
    console.log("Subject:", emailData.subject);

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: "Agency submission received successfully",
        data: emailData
      }),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
        status: 200,
      }
    );
  } catch (error) {
    console.error("Error processing submission:", error);
    
    return new Response(
      JSON.stringify({ 
        success: false, 
        error: "Failed to process submission" 
      }),
      {
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
        status: 500,
      }
    );
  }
});