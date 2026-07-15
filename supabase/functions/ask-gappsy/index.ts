import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

// "Ask Gappsy" — a GPT-style chat grounded in real site data. Two modes:
//   - tool_slug given: answers questions about that one tool, using its
//     actual DB content (description, pricing, features, pros/cons, FAQs)
//     as the only source of truth, so it never invents pricing or features.
//   - no tool_slug (homepage): a directory-wide assistant that can
//     recommend across the catalog. Given the catalog is small enough
//     (~140 published tools), the full list is injected as static context
//     rather than using OpenAI function-calling — much simpler to stream
//     correctly, and avoids a second round-trip to the model mid-stream.
//
// Streams the response back as plain UTF-8 text chunks (not OpenAI's raw
// SSE format) so the frontend never has to parse SSE — it just reads the
// stream and appends. The full exchange is logged to tool_chat_messages
// for admin oversight + the sliding-window rate limit, via
// EdgeRuntime.waitUntil so logging never delays the response.

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, apikey",
};

const MODEL = "gpt-4o-mini";
const RATE_LIMIT_WINDOW_MINUTES = 5;
const RATE_LIMIT_MAX_MESSAGES = 20;
const MAX_HISTORY_MESSAGES = 12;

function jsonResponse(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } });
}

interface ChatMessage {
  role: "user" | "assistant";
  content: string;
}

// deno-lint-ignore no-explicit-any
async function buildToolSystemPrompt(supabase: any, toolSlug: string): Promise<{ prompt: string; toolName: string } | null> {
  const { data: tool } = await supabase
    .from("tools")
    .select(
      `id, name, slug, short_description, long_description, pricing_model, starting_price, best_for, target_audience,
       pricing_summary, features_summary, integrations_summary, company_summary, rating, review_count, verified, featured`
    )
    .eq("slug", toolSlug)
    .eq("status", "published")
    .maybeSingle();
  if (!tool) return null;

  const [plansResult, featuresResult, prosResult, consResult, faqsResult] = await Promise.all([
    supabase.from("tool_pricing_plans").select("plan_name, price, billing_cycle, features").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_features").select("title, description").eq("tool_id", tool.id).order("sort_order").limit(15),
    supabase.from("tool_pros").select("text").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_cons").select("text").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_faqs").select("question, answer").eq("tool_id", tool.id).eq("status", "published").order("sort_order"),
  ]);

  const plans = (plansResult.data || []).map((p: { plan_name: string | null; price: string | null; billing_cycle: string | null }) =>
    `- ${p.plan_name || "Plan"}: ${p.price || "Custom"}${p.billing_cycle ? ` (${p.billing_cycle})` : ""}`
  ).join("\n") || "Not documented.";
  const features = (featuresResult.data || []).map((f: { title: string; description: string | null }) => `- ${f.title}${f.description ? `: ${f.description}` : ""}`).join("\n") || "Not documented.";
  const pros = (prosResult.data || []).map((p: { text: string }) => `- ${p.text}`).join("\n") || "Not documented.";
  const cons = (consResult.data || []).map((c: { text: string }) => `- ${c.text}`).join("\n") || "Not documented.";
  const faqs = (faqsResult.data || []).map((f: { question: string; answer: string }) => `Q: ${f.question}\nA: ${f.answer}`).join("\n\n") || "None yet.";

  const prompt = `You are "Ask Gappsy", a helpful, honest assistant embedded on the Gappsy software directory's page for ${tool.name}. Answer questions about ${tool.name} using ONLY the information below — never invent pricing, features, or facts that aren't here. If something isn't covered, say so plainly and suggest checking the official website or the "Visit Website" button on this page, rather than guessing.

${tool.name} — overview:
${tool.short_description || tool.long_description || "No description available."}

Best for: ${tool.best_for || "Not documented."}
Target audience: ${tool.target_audience || "Not documented."}
Pricing model: ${tool.pricing_model || "Not documented."}${tool.starting_price ? `, starting at ${tool.starting_price}` : ""}
Rating: ${tool.rating > 0 ? `${tool.rating}/5 from ${tool.review_count} reviews` : "No reviews yet."}

Pricing plans:
${plans}

Key features:
${features}

Pros:
${pros}

Cons:
${cons}

FAQs:
${faqs}

If the visitor asks whether a different tool might suit them better, you may mention that Gappsy has other options in the same category and suggest they browse gappsy.com/tool-categories — but don't fabricate specific competitor details you don't actually know. Keep answers concise and conversational, a few sentences at a time, like a knowledgeable friend rather than a wall of text.`;

  return { prompt, toolName: tool.name };
}

// deno-lint-ignore no-explicit-any
async function buildDirectorySystemPrompt(supabase: any): Promise<string> {
  const { data: tools } = await supabase
    .from("tools")
    .select("name, slug, short_description, pricing_model, starting_price, rating")
    .eq("status", "published")
    .order("featured", { ascending: false })
    .order("rating", { ascending: false })
    .limit(200);

  const catalog = (tools || [])
    .map((t: { name: string; slug: string; short_description: string | null; pricing_model: string | null; starting_price: string | null }) =>
      `- ${t.name} (/tools/${t.slug}): ${t.short_description || "No description."}${t.pricing_model ? ` | ${t.pricing_model}` : ""}${t.starting_price ? ` from ${t.starting_price}` : ""}`
    )
    .join("\n");

  return `You are "Ask Gappsy", a helpful, honest assistant on Gappsy, a software tools directory. Help visitors find the right software tool for what they're trying to do, using ONLY the real catalog below — never invent tools or facts that aren't here. When you recommend a tool, mention its name and that they can find it at gappsy.com/tools/{slug}. If nothing in the catalog fits well, say so honestly rather than forcing a recommendation. Keep answers concise and conversational.

Catalog (name, page, description, pricing):
${catalog}`;
}

async function checkRateLimit(
  // deno-lint-ignore no-explicit-any
  supabase: any,
  sessionId: string
): Promise<boolean> {
  const since = new Date(Date.now() - RATE_LIMIT_WINDOW_MINUTES * 60 * 1000).toISOString();
  const { count } = await supabase
    .from("tool_chat_messages")
    .select("id", { count: "exact", head: true })
    .eq("session_id", sessionId)
    .eq("role", "user")
    .gte("created_at", since);
  return (count ?? 0) < RATE_LIMIT_MAX_MESSAGES;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: CORS_HEADERS });
  if (req.method !== "POST") return jsonResponse({ ok: false, error: "Method not allowed" }, 405);

  try {
    const openaiKey = Deno.env.get("OPENAI_API_KEY");
    if (!openaiKey) return jsonResponse({ ok: false, error: "AI chat isn't configured yet." }, 503);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
    const supabase = createClient(supabaseUrl, serviceRoleKey);

    const payload = await req.json();
    const sessionId = typeof payload.session_id === "string" ? payload.session_id : null;
    const toolSlug = typeof payload.tool_slug === "string" ? payload.tool_slug : null;
    const messages = Array.isArray(payload.messages) ? (payload.messages as ChatMessage[]) : [];
    if (!sessionId || messages.length === 0) return jsonResponse({ ok: false, error: "Invalid payload" }, 400);

    const withinLimit = await checkRateLimit(supabase, sessionId);
    if (!withinLimit) {
      return jsonResponse({ ok: false, error: "You've sent a lot of messages — please wait a few minutes and try again." }, 429);
    }

    let toolId: string | null = null;
    let systemPrompt: string;
    if (toolSlug) {
      const context = await buildToolSystemPrompt(supabase, toolSlug);
      if (!context) return jsonResponse({ ok: false, error: "Tool not found" }, 404);
      systemPrompt = context.prompt;
      const { data: toolRow } = await supabase.from("tools").select("id").eq("slug", toolSlug).maybeSingle();
      toolId = toolRow?.id || null;
    } else {
      systemPrompt = await buildDirectorySystemPrompt(supabase);
    }

    const trimmedHistory = messages.slice(-MAX_HISTORY_MESSAGES);
    const lastUserMessage = [...trimmedHistory].reverse().find((m) => m.role === "user");
    const ip = req.headers.get("x-forwarded-for")?.split(",")[0]?.trim() || null;

    if (lastUserMessage) {
      supabase.from("tool_chat_messages").insert({
        session_id: sessionId,
        tool_id: toolId,
        role: "user",
        content: lastUserMessage.content.slice(0, 4000),
        ip_address: ip,
      }).then(() => {});
    }

    const openaiResponse = await fetch("https://api.openai.com/v1/chat/completions", {
      method: "POST",
      headers: { "Content-Type": "application/json", Authorization: `Bearer ${openaiKey}` },
      body: JSON.stringify({
        model: MODEL,
        stream: true,
        temperature: 0.4,
        messages: [{ role: "system", content: systemPrompt }, ...trimmedHistory],
      }),
    });

    if (!openaiResponse.ok || !openaiResponse.body) {
      const errText = await openaiResponse.text().catch(() => "");
      console.error("[ask-gappsy] OpenAI error:", openaiResponse.status, errText);
      return jsonResponse({ ok: false, error: "The assistant is temporarily unavailable. Please try again." }, 502);
    }

    let fullReply = "";
    const decoder = new TextDecoder();
    const encoder = new TextEncoder();

    const stream = new ReadableStream({
      async start(controller) {
        const reader = openaiResponse.body!.getReader();
        let buffer = "";
        try {
          while (true) {
            const { done, value } = await reader.read();
            if (done) break;
            buffer += decoder.decode(value, { stream: true });
            const lines = buffer.split("\n");
            buffer = lines.pop() || "";
            for (const line of lines) {
              const trimmed = line.trim();
              if (!trimmed.startsWith("data:")) continue;
              const data = trimmed.slice(5).trim();
              if (data === "[DONE]") continue;
              try {
                const parsed = JSON.parse(data);
                const delta = parsed.choices?.[0]?.delta?.content;
                if (typeof delta === "string" && delta.length > 0) {
                  fullReply += delta;
                  controller.enqueue(encoder.encode(delta));
                }
              } catch {
                // ignore malformed SSE fragments
              }
            }
          }
        } catch (streamError) {
          console.error("[ask-gappsy] stream read error:", streamError);
        } finally {
          controller.close();
          if (fullReply.trim()) {
            supabase.from("tool_chat_messages").insert({
              session_id: sessionId,
              tool_id: toolId,
              role: "assistant",
              content: fullReply.slice(0, 8000),
              ip_address: ip,
            }).then(() => {});
          }
        }
      },
    });

    return new Response(stream, {
      status: 200,
      headers: { ...CORS_HEADERS, "Content-Type": "text/plain; charset=utf-8" },
    });
  } catch (error) {
    console.error("[ask-gappsy] error:", error);
    return jsonResponse({ ok: false, error: "Something went wrong. Please try again." }, 500);
  }
});
