import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-secret, x-admin-token",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  if (req.method !== "POST") {
    return new Response(
      JSON.stringify({ error: "Method not allowed" }),
      {
        status: 405,
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
      }
    );
  }

  try {
    const auth = await authenticateAdmin(req);
    if (!auth.success) return createAuthErrorResponse(auth, corsHeaders);

    const formData = await req.formData();
    const file = formData.get("file") as File;

    console.log("Upload request received", {
      hasFile: !!file,
      fileType: file?.type,
      fileSize: file?.size,
    });

    if (!file) {
      console.error("No file provided");
      return new Response(
        JSON.stringify({ error: "No file uploaded" }),
        {
          status: 400,
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
        }
      );
    }

    // Validate file type
    if (!file.type.startsWith("image/")) {
      console.error("Invalid file type:", file.type);
      return new Response(
        JSON.stringify({ error: "File must be an image" }),
        {
          status: 400,
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
        }
      );
    }

    // Validate file size (max 2MB)
    const maxSize = 2 * 1024 * 1024;
    if (file.size > maxSize) {
      console.error("File too large:", file.size);
      return new Response(
        JSON.stringify({ error: "File too large (max 2MB)" }),
        {
          status: 400,
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
        }
      );
    }

    // Generate unique filename
    const timestamp = Date.now();
    const extension = file.name.split(".").pop() || "png";
    const sanitizedName = file.name
      .replace(/\.[^/.]+$/, "")
      .replace(/[^a-zA-Z0-9-_]/g, "-")
      .toLowerCase()
      .substring(0, 50);
    const filename = `sidebar/${sanitizedName}-${timestamp}.${extension}`;

    // Read file as array buffer
    const arrayBuffer = await file.arrayBuffer();
    const uint8Array = new Uint8Array(arrayBuffer);

    // Initialize Supabase client
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseKey) {
      console.error("Missing Supabase credentials");
      return new Response(
        JSON.stringify({ error: "Server configuration error" }),
        {
          status: 500,
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
        }
      );
    }

    console.log("Initializing Supabase client...");
    const supabase = createClient(supabaseUrl, supabaseKey);

    console.log(`Uploading file: ${filename} (${uint8Array.length} bytes)`);

    // Upload to Supabase Storage
    const { data: uploadData, error: uploadError } = await supabase.storage
      .from("agency-logos")
      .upload(filename, uint8Array, {
        contentType: file.type,
        upsert: true,
      });

    if (uploadError) {
      console.error("Storage upload error:", uploadError);
      return new Response(
        JSON.stringify({
          error: `Upload failed: ${uploadError.message}`,
          details: uploadError
        }),
        {
          status: 500,
          headers: {
            ...corsHeaders,
            "Content-Type": "application/json",
          },
        }
      );
    }

    console.log("Upload successful:", uploadData);

    // Get public URL
    const { data: urlData } = supabase.storage
      .from("agency-logos")
      .getPublicUrl(filename);

    console.log("Public URL:", urlData.publicUrl);

    return new Response(
      JSON.stringify({
        url: urlData.publicUrl,
        filename: filename,
      }),
      {
        status: 200,
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
      }
    );
  } catch (error: any) {
    console.error("Logo upload error:", error);
    return new Response(
      JSON.stringify({
        error: error?.message || "Upload failed on server",
        stack: error?.stack
      }),
      {
        status: 500,
        headers: {
          ...corsHeaders,
          "Content-Type": "application/json",
        },
      }
    );
  }
});