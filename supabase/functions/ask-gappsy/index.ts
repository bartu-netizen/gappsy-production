import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

// "Ask Gappsy" — a GPT-style chat grounded in real site data. Three modes:
//   - tool_slug given: answers questions about that one tool, using its
//     actual DB content (description, pricing, features, pros/cons, FAQs)
//     as the only source of truth, so it never invents pricing or features.
//   - tool_slugs given (2-3 slugs, /compare pages): same grounding, but for
//     every tool in the comparison at once, so the assistant can answer
//     questions about any one of them or help the visitor decide between
//     them — still never inventing facts outside what's fetched per tool.
//   - neither given (homepage): a directory-wide assistant that can
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
       pricing_summary, features_summary, integrations_summary, company_summary, founded_year, company_size,
       headquarters, languages, rating, review_count, verified, featured`
    )
    .eq("slug", toolSlug)
    .eq("status", "published")
    .maybeSingle();
  if (!tool) return null;

  const [plansResult, featuresResult, prosResult, consResult, faqsResult, useCasesResult, integrationsResult, categoryResult, reviewsResult, contentBlocksResult, alternativesResult, comparisonLinksResult] = await Promise.all([
    supabase.from("tool_pricing_plans").select("plan_name, price, billing_cycle, features").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_features").select("title, description").eq("tool_id", tool.id).order("sort_order").limit(20),
    supabase.from("tool_pros").select("text").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_cons").select("text").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_faqs").select("question, answer").eq("tool_id", tool.id).eq("status", "published").order("sort_order"),
    supabase.from("tool_use_cases").select("title, description, audience").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_integrations").select("integration_name, description").eq("tool_id", tool.id).limit(20),
    supabase.from("tool_category_links").select("tool_categories(name)").eq("tool_id", tool.id),
    supabase.from("tool_user_reviews").select("reviewer_name, rating, title, body").eq("tool_id", tool.id).eq("status", "approved").order("created_at", { ascending: false }).limit(8),
    supabase.from("tool_content_blocks").select("heading, paragraphs").eq("tool_id", tool.id).order("sort_order"),
    supabase.from("tool_alternatives").select("alternative_name, description, pros, cons, pricing_summary").eq("tool_id", tool.id).not("description", "is", null).order("sort_order"),
    supabase.from("tool_comparison_links").select("label, href").eq("tool_id", tool.id).order("sort_order"),
  ]);

  const plans = (plansResult.data || []).map((p: { plan_name: string | null; price: string | null; billing_cycle: string | null }) =>
    `- ${p.plan_name || "Plan"}: ${p.price || "Custom"}${p.billing_cycle ? ` (${p.billing_cycle})` : ""}`
  ).join("\n") || "Not documented.";
  const features = (featuresResult.data || []).map((f: { title: string; description: string | null }) => `- ${f.title}${f.description ? `: ${f.description}` : ""}`).join("\n") || "Not documented.";
  const pros = (prosResult.data || []).map((p: { text: string }) => `- ${p.text}`).join("\n") || "Not documented.";
  const cons = (consResult.data || []).map((c: { text: string }) => `- ${c.text}`).join("\n") || "Not documented.";
  const faqs = (faqsResult.data || []).map((f: { question: string; answer: string }) => `Q: ${f.question}\nA: ${f.answer}`).join("\n\n") || "None yet.";
  const useCases = (useCasesResult.data || []).map((u: { title: string; description: string | null; audience: string | null }) =>
    `- ${u.title}${u.audience ? ` (for ${u.audience})` : ""}${u.description ? `: ${u.description}` : ""}`
  ).join("\n") || "Not documented.";
  const integrations = (integrationsResult.data || []).map((i: { integration_name: string; description: string | null }) => `- ${i.integration_name}${i.description ? `: ${i.description}` : ""}`).join("\n") || "Not documented.";
  // deno-lint-ignore no-explicit-any
  const categories = (categoryResult.data || []).map((c: any) => c.tool_categories?.name).filter(Boolean).join(", ") || "Not documented.";
  const reviews = (reviewsResult.data || []).map((r: { reviewer_name: string; rating: number; title: string | null; body: string }) =>
    `"${r.title ? `${r.title} — ` : ""}${r.body}" — ${r.reviewer_name}, ${r.rating}/5`
  ).join("\n\n") || "No real reviews yet.";
  const article = (contentBlocksResult.data || []).map((b: { heading: string; paragraphs: string[] }) =>
    `### ${b.heading}\n${(b.paragraphs || []).join("\n\n")}`
  ).join("\n\n") || tool.long_description || "Not documented.";
  const alternatives = (alternativesResult.data || []).map((a: { alternative_name: string | null; description: string | null; pros: string[]; cons: string[]; pricing_summary: string | null }) =>
    `- ${a.alternative_name}: ${a.description || ""}${a.pricing_summary ? ` Pricing: ${a.pricing_summary}.` : ""}${(a.pros || []).length ? ` Pros: ${a.pros.join("; ")}.` : ""}${(a.cons || []).length ? ` Cons: ${a.cons.join("; ")}.` : ""}`
  ).join("\n") || "Not documented.";
  const realComparisonPages = (comparisonLinksResult.data || []).filter((c: { href: string }) => c.href.startsWith("/compare/"));
  const comparisons = realComparisonPages.length > 0
    ? realComparisonPages.map((c: { label: string; href: string }) => `- ${c.label}: gappsy.com${c.href}`).join("\n")
    : "None published yet.";

  const prompt = `You are "Ask Gappsy", a helpful, honest assistant embedded on the Gappsy software directory's page for ${tool.name}. Answer questions using ONLY the information below, which is everything actually published on this page — never invent pricing, features, or facts that aren't here. If something isn't covered, say so plainly and suggest checking the official website or the "Visit Website" button on this page, rather than guessing.

${tool.name} — category: ${categories}
Short description: ${tool.short_description || "Not documented."}

Full article published on this page:
${article}

Best for: ${tool.best_for || "Not documented."}
Target audience: ${tool.target_audience || "Not documented."}
Company: founded ${tool.founded_year || "unknown"}, ${tool.company_size || "size not documented"}, headquartered in ${tool.headquarters || "an undocumented location"}.
Supported languages: ${Array.isArray(tool.languages) && tool.languages.length > 0 ? tool.languages.join(", ") : "Not documented."}
Pricing model: ${tool.pricing_model || "Not documented."}${tool.starting_price ? `, starting at ${tool.starting_price}` : ""}
Rating: ${tool.rating > 0 ? `${tool.rating}/5 from ${tool.review_count} reviews` : "No reviews yet."}
${tool.featured ? "This is one of Gappsy's Featured (paid, sponsored) listings." : "This is a standard, non-featured listing."}

Pricing plans:
${plans}

Key features:
${features}

Pros:
${pros}

Cons:
${cons}

Use cases:
${useCases}

Integrations:
${integrations}

FAQs:
${faqs}

Real user reviews published on this page:
${reviews}

Alternatives listed on this page:
${alternatives}

Dedicated head-to-head comparison pages that actually exist on Gappsy for ${tool.name} (only recommend one of these URLs if the visitor wants a full side-by-side comparison — never invent a /compare/ URL that isn't in this list):
${comparisons}

Disclosure rule: if you mention that ${tool.name} is a Featured/sponsored Gappsy listing, say so plainly (Gappsy already labels these visibly on the page) — never let featured status make you oversell it or hide a real weakness listed in its Cons above. Being featured means it paid for visibility, not that it's objectively the best fit for every visitor.

If the visitor asks whether a different tool might suit them better, recommend from the Alternatives list above when it's genuinely relevant, and only link to gappsy.com/tool-categories or a real /compare/ page from the list above — never fabricate a comparison page or competitor detail you don't actually know. Keep answers concise and conversational, a few sentences at a time, like a knowledgeable friend rather than a wall of text.`;

  return { prompt, toolName: tool.name };
}

// Trimmed sibling of buildToolSystemPrompt for /compare pages — pulls the
// same kind of data but skips the full article/reviews/alternatives text so
// a 3-tool combined prompt stays a reasonable size, while still being rich
// enough (pricing plans, features, pros/cons, FAQs) to answer real questions
// and to compare tools against each other without inventing anything.
// deno-lint-ignore no-explicit-any
async function buildMultiToolSystemPrompt(supabase: any, toolSlugs: string[]): Promise<{ prompt: string; toolNames: string[]; toolIds: string[] } | null> {
  const { data: tools } = await supabase
    .from("tools")
    .select(
      `id, name, slug, short_description, pricing_model, starting_price, best_for, target_audience,
       founded_year, company_size, headquarters, rating, review_count, featured`
    )
    .in("slug", toolSlugs)
    .eq("status", "published");
  if (!tools || tools.length === 0) return null;

  // deno-lint-ignore no-explicit-any
  const orderedTools = toolSlugs.map((slug) => tools.find((t: any) => t.slug === slug)).filter(Boolean);
  if (orderedTools.length === 0) return null;

  const sections = await Promise.all(
    // deno-lint-ignore no-explicit-any
    orderedTools.map(async (tool: any) => {
      const [plansResult, featuresResult, prosResult, consResult, faqsResult] = await Promise.all([
        supabase.from("tool_pricing_plans").select("plan_name, price, billing_cycle").eq("tool_id", tool.id).order("sort_order"),
        supabase.from("tool_features").select("title").eq("tool_id", tool.id).order("sort_order").limit(10),
        supabase.from("tool_pros").select("text").eq("tool_id", tool.id).order("sort_order").limit(6),
        supabase.from("tool_cons").select("text").eq("tool_id", tool.id).order("sort_order").limit(6),
        supabase.from("tool_faqs").select("question, answer").eq("tool_id", tool.id).eq("status", "published").order("sort_order").limit(5),
      ]);

      const plans = (plansResult.data || []).map((p: { plan_name: string | null; price: string | null; billing_cycle: string | null }) =>
        `- ${p.plan_name || "Plan"}: ${p.price || "Custom"}${p.billing_cycle ? ` (${p.billing_cycle})` : ""}`
      ).join("\n") || "Not documented.";
      const features = (featuresResult.data || []).map((f: { title: string }) => `- ${f.title}`).join("\n") || "Not documented.";
      const pros = (prosResult.data || []).map((p: { text: string }) => `- ${p.text}`).join("\n") || "Not documented.";
      const cons = (consResult.data || []).map((c: { text: string }) => `- ${c.text}`).join("\n") || "Not documented.";
      const faqs = (faqsResult.data || []).map((f: { question: string; answer: string }) => `Q: ${f.question}\nA: ${f.answer}`).join("\n\n") || "None yet.";

      return `## ${tool.name} (gappsy.com/tools/${tool.slug})
Short description: ${tool.short_description || "Not documented."}
Best for: ${tool.best_for || "Not documented."}
Target audience: ${tool.target_audience || "Not documented."}
Company: founded ${tool.founded_year || "unknown"}, ${tool.company_size || "size not documented"}, headquartered in ${tool.headquarters || "an undocumented location"}.
Pricing model: ${tool.pricing_model || "Not documented."}${tool.starting_price ? `, starting at ${tool.starting_price}` : ""}
Rating: ${tool.rating > 0 ? `${tool.rating}/5 from ${tool.review_count} reviews` : "No reviews yet."}
${tool.featured ? "This is one of Gappsy's Featured (paid, sponsored) listings." : "This is a standard, non-featured listing."}

Pricing plans:
${plans}

Key features:
${features}

Pros:
${pros}

Cons:
${cons}

FAQs:
${faqs}`;
    })
  );

  // deno-lint-ignore no-explicit-any
  const names = orderedTools.map((t: any) => t.name);
  const namesList = names.length === 2 ? `${names[0]} and ${names[1]}` : `${names.slice(0, -1).join(", ")}, and ${names[names.length - 1]}`;

  const prompt = `You are "Ask Gappsy", a helpful, honest assistant embedded on the Gappsy software directory's comparison page for ${namesList}. Answer questions about any of these tools individually, or help the visitor decide between them, using ONLY the information below for each tool — never invent pricing, features, or facts that aren't here. If something isn't covered for a given tool, say so plainly and suggest checking that tool's own page on gappsy.com or its official website, rather than guessing.

${sections.join("\n\n")}

Disclosure rule: if a tool above is marked as a Featured/sponsored Gappsy listing, say so plainly when it's relevant to the conversation — never let featured status make you oversell it or hide a real weakness listed in its Cons. Being featured means it paid for visibility, not that it's objectively the best fit for every visitor.

Keep answers concise and conversational, a few sentences at a time, like a knowledgeable friend rather than a wall of text. When comparing, be specific about which tool wins on which dimension rather than giving a vague "it depends."`;

  // deno-lint-ignore no-explicit-any
  return { prompt, toolNames: names, toolIds: orderedTools.map((t: any) => t.id) };
}

// deno-lint-ignore no-explicit-any
async function buildDirectorySystemPrompt(supabase: any): Promise<string> {
  const [toolsResult, comparisonsResult] = await Promise.all([
    supabase
      .from("tools")
      .select("name, slug, short_description, pricing_model, starting_price, rating, featured")
      .eq("status", "published")
      .order("featured", { ascending: false })
      .order("rating", { ascending: false })
      .limit(200),
    supabase
      .from("tool_comparisons")
      .select("slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(name), tool_b:tools!tool_comparisons_tool_b_id_fkey(name)")
      .eq("status", "published")
      .limit(200),
  ]);

  const catalog = (toolsResult.data || [])
    .map((t: { name: string; slug: string; short_description: string | null; pricing_model: string | null; starting_price: string | null; featured: boolean }) =>
      `- ${t.name} (/tools/${t.slug})${t.featured ? " [Featured/sponsored listing]" : ""}: ${t.short_description || "No description."}${t.pricing_model ? ` | ${t.pricing_model}` : ""}${t.starting_price ? ` from ${t.starting_price}` : ""}`
    )
    .join("\n");

  const comparisonPages = (comparisonsResult.data || [])
    // deno-lint-ignore no-explicit-any
    .map((c: any) => (c.tool_a?.name && c.tool_b?.name ? `- ${c.tool_a.name} vs ${c.tool_b.name}: gappsy.com/compare/${c.slug}` : null))
    .filter(Boolean)
    .join("\n") || "None published yet.";

  return `You are "Ask Gappsy", a helpful, honest assistant on Gappsy, a software tools directory. Help visitors find the right software tool for what they're trying to do, using ONLY the real catalog below — never invent tools or facts that aren't here. When you recommend a tool, mention its name and that they can find it at gappsy.com/tools/{slug}. If nothing in the catalog fits well, say so honestly rather than forcing a recommendation. Keep answers concise and conversational.

Some listings are marked [Featured/sponsored listing] — these tools paid Gappsy for visibility. You may recommend a featured tool when it's genuinely a good fit, but never let featured status override a better-fitting free or non-featured tool, and if it feels relevant, mention plainly that it's a featured/sponsored listing rather than letting the visitor assume it's an unbiased top pick. Prioritize being genuinely useful over favoring featured tools.

Catalog (name, page, description, pricing; [Featured/sponsored listing] tag shown where applicable):
${catalog}

Dedicated head-to-head comparison pages that actually exist on Gappsy (only ever link one of these — never invent a /compare/ URL that isn't in this list, and never claim one exists for a pair not listed here):
${comparisonPages}`;
}

// Static sibling of buildDirectorySystemPrompt for the Feature My Product
// marketing page — no DB content to ground this in (it's not about a
// tool listing), just the real, already-published facts from that page
// and its onboarding flow (fmpFaqData.ts / BenefitsSection.tsx /
// FeatureMyProductOnboardingPage.tsx), kept in sync by hand since the
// edge function (Deno) and the frontend (Vite) don't share a module.
function buildFeatureMyProductSystemPrompt(): string {
  return `You are "Ask Gappsy", a helpful, honest assistant on Gappsy's "Feature My Product" page, which lets a software vendor claim (or add) their listing on the Gappsy software directory. Answer using ONLY the real facts below — never invent pricing, steps, or policies that aren't here. If asked something not covered, say so plainly and suggest contacting support rather than guessing.

## Claim & Verify (the one-time offer sold on this page)
- A one-time $29 fee, charged once via Stripe. No subscription, nothing recurring, no card kept on file.
- Gappsy often doesn't know in advance whether a visitor's product is already listed in the directory — entering the product's website on this page is how that gets checked. If it's already listed, claiming it verifies ownership. If it isn't listed yet, the same flow adds it (a short editorial review follows, usually completing within a couple of business days).
- What it unlocks: a verified badge on the listing, self-serve editing (description, pricing, screenshots, and more — no waiting on Gappsy's editorial team for every change), the ability to reply to reviews from a dashboard, and a link from the Gappsy listing to the vendor's own website.
- Ownership verification is done via a meta tag, DNS record, or hosted file on the vendor's own site — checked automatically, usually instantly.
- Billing: charged once at checkout via Stripe. There's nothing to cancel since it isn't a subscription.

## Growth (an optional upgrade — NOT sold or detailed on this page; only offered after Claim & Verify is complete)
If asked about "featured placement", "Growth", or paid promotion beyond Claim & Verify: explain that Claim & Verify itself does not include featured placement. Growth is a separate, optional recurring upgrade (Monthly $89/mo or Yearly $699/yr, save $369/yr on Yearly) offered only inside the onboarding flow, right after the one-time fee is paid — it adds things like featured placement, listing analytics, and (Yearly only) a produced video review and newsletter feature. Don't go into full detail here since this page is deliberately scoped to Claim & Verify only; say the full Growth details appear immediately after claiming.

## What this page is not for
It is not a place to browse or search the software directory. If someone wants to find or compare tools rather than claim/list their own, point them to gappsy.com/tools or gappsy.com/tool-categories instead.

Keep answers concise and conversational, a few sentences at a time. If someone seems ready to act, point them to the "Claim or list your product — $29" button on this page.`;
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
    const toolSlugs = Array.isArray(payload.tool_slugs) ? (payload.tool_slugs as unknown[]).filter((s): s is string => typeof s === "string") : null;
    const page = typeof payload.page === "string" ? payload.page : null;
    const messages = Array.isArray(payload.messages) ? (payload.messages as ChatMessage[]) : [];
    if (!sessionId || messages.length === 0) return jsonResponse({ ok: false, error: "Invalid payload" }, 400);

    const withinLimit = await checkRateLimit(supabase, sessionId);
    if (!withinLimit) {
      return jsonResponse({ ok: false, error: "You've sent a lot of messages — please wait a few minutes and try again." }, 429);
    }

    // Multi-tool sessions (compare pages) aren't logged against a single
    // tool_id — that column is a single FK and no schema change is in
    // scope here, so it's left null for those rows (still fully covered by
    // session_id for rate limiting and admin review).
    let toolId: string | null = null;
    let systemPrompt: string;
    if (toolSlugs && toolSlugs.length > 0) {
      const context = await buildMultiToolSystemPrompt(supabase, toolSlugs);
      if (!context) return jsonResponse({ ok: false, error: "Tools not found" }, 404);
      systemPrompt = context.prompt;
    } else if (toolSlug) {
      const context = await buildToolSystemPrompt(supabase, toolSlug);
      if (!context) return jsonResponse({ ok: false, error: "Tool not found" }, 404);
      systemPrompt = context.prompt;
      const { data: toolRow } = await supabase.from("tools").select("id").eq("slug", toolSlug).maybeSingle();
      toolId = toolRow?.id || null;
    } else if (page === "feature_my_product") {
      systemPrompt = buildFeatureMyProductSystemPrompt();
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
