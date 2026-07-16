import type { ToolComparisonContent } from './types';

const copyAiVsWritesonicContent: ToolComparisonContent = {
  "verdict": "Copy.ai and Writesonic solve different jobs, even though both started as AI writing tools. Copy.ai has rebuilt itself into a GTM AI platform: Workflows, Actions, Agents, and Tables let sales, marketing, and ops teams automate multi-step processes like lead research and outreach drafting, backed by native integrations into Salesforce, HubSpot, Gong, Outreach, and Salesloft, and a model-agnostic setup spanning OpenAI, Anthropic, Gemini, and Perplexity. Writesonic has stayed closer to content and SEO, but has expanded into generative engine optimization (GEO): its AI Article Writer and template library produce long-form and short-form content, while its AI search visibility tracking, site audits, and Action Center monitor and improve how a brand is cited across ChatGPT, Gemini, and Google AI Overviews. Pricing reflects the divergence: Copy.ai has a permanent free plan and a $29/month Chat tier for pure writing, but jumps to $1,000/month for workflow automation at the Growth tier; Writesonic has no free plan, starting at $79/month, with tiers built around AI-platform tracking scope and site-audit volume. A team automating GTM processes across a CRM stack fits Copy.ai; a team focused on SEO content production and AI-search brand monitoring fits Writesonic. Neither is a strict upgrade of the other.",
  "bestForToolA": "Sales, marketing, and ops teams that want to automate multi-step GTM processes (lead research, outreach, data enrichment) across a CRM and sales-engagement stack, and that want flexibility to choose or mix AI model providers.",
  "bestForToolB": "Content and SEO teams that need to produce long-form, SEO-structured articles at volume and also want to monitor and improve how their brand is cited across ChatGPT, Gemini, and Google AI Overviews.",
  "whoNeedsBoth": "A marketing organization that automates outbound GTM workflows and CRM data enrichment with Copy.ai while separately relying on Writesonic to produce SEO content and track AI search visibility would reasonably run both tools rather than choosing one.",
  "keyDifferences": [
    {
      "title": "Core use case",
      "toolA": "GTM AI platform built around Workflows, Actions, Agents, and Tables for automating sales, marketing, and ops processes",
      "toolB": "AI writing and SEO platform centered on long-form article generation plus AI search visibility (GEO) tracking",
      "whyItMatters": "Buyers choosing based on 'AI writing tool' branding alone may miss that Copy.ai's real value is now workflow automation, not content drafting",
      "benefitsWho": "GTM/RevOps teams benefit from Copy.ai's automation focus; content/SEO teams benefit from Writesonic's writing-and-visibility focus"
    },
    {
      "title": "Free plan vs. free trial",
      "toolA": "Offers a permanent free plan with a limited monthly word allowance, template access, and no credit card required",
      "toolB": "No permanent free plan; offers only a free, no-credit-card trial with limited word and feature allowances",
      "whyItMatters": "Light or occasional users can use Copy.ai indefinitely at no cost, while Writesonic requires eventual payment to keep using core features",
      "benefitsWho": "Budget-conscious individuals and light users benefit from Copy.ai's ongoing free tier"
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Starting paid plan (Chat) is $29/month, or $24/month billed annually",
      "toolB": "Starting paid plan (Starter) is $79/month billed annually",
      "whyItMatters": "The entry price point is roughly 2.7x higher for Writesonic, which matters for solo users or small teams comparing initial cost",
      "benefitsWho": "Cost-sensitive individuals and small teams benefit from Copy.ai's lower entry price"
    },
    {
      "title": "AI model flexibility",
      "toolA": "Model-agnostic: connects to OpenAI, Anthropic, Google Gemini, and Perplexity rather than one provider",
      "toolB": "Not documented as offering a choice of underlying AI model providers",
      "whyItMatters": "Teams with a preferred or restricted AI vendor (for cost, compliance, or quality reasons) can route around a single provider with Copy.ai",
      "benefitsWho": "Teams with existing AI vendor preferences or procurement restrictions benefit from Copy.ai's model-agnostic design"
    },
    {
      "title": "Workflow automation depth",
      "toolA": "Dedicated Workflows, Actions, and Agents let non-experts assemble multi-step, branching automations without code",
      "toolB": "Action Center surfaces prioritized SEO/AI-visibility fixes on higher-tier plans, with only limited agentic workflow trial runs",
      "whyItMatters": "Copy.ai's automation is a core, deeply built platform layer; Writesonic's is a narrower feature aimed at SEO/GEO fixes and gated by plan tier",
      "benefitsWho": "Teams needing broad, general-purpose process automation benefit from Copy.ai; teams only needing SEO-specific fix suggestions benefit from Writesonic's Action Center"
    },
    {
      "title": "AI search visibility (GEO) tracking",
      "toolA": "Not documented as a Copy.ai capability",
      "toolB": "Dedicated feature tracking how a brand is cited across ChatGPT, Gemini, Google AI Overviews, and other AI platforms, with plan tiers scaling tracked platforms and daily prompts",
      "whyItMatters": "As AI answer engines increasingly mediate discovery, brands need visibility into how they're represented there, which is a purpose-built Writesonic feature absent from Copy.ai's documented set",
      "benefitsWho": "SEO and brand marketing teams focused on AI search presence benefit specifically from Writesonic"
    },
    {
      "title": "CRM and sales-tool integrations",
      "toolA": "Native and Zapier-style integrations with Salesforce, HubSpot, Gong, Outreach, and Salesloft",
      "toolB": "Only a WordPress publishing integration is documented; no CRM/sales-tool integrations are documented",
      "whyItMatters": "Teams whose workflows depend on syncing data with a CRM or sales-engagement platform need this connectivity to avoid manual data handoffs",
      "benefitsWho": "Sales and RevOps teams benefit from Copy.ai's CRM integration breadth"
    },
    {
      "title": "Direct content publishing",
      "toolA": "Not documented as offering direct CMS/website publishing",
      "toolB": "WordPress integration lets generated articles publish directly to connected sites without manual copy-pasting",
      "whyItMatters": "Content teams publishing frequently to a WordPress site save manual steps with Writesonic's direct publishing",
      "benefitsWho": "Bloggers and content teams on WordPress benefit from Writesonic's publishing integration"
    },
    {
      "title": "Growth-tier pricing and scope",
      "toolA": "Growth tier is $1,000/month (billed annually at $12,000/year) for up to 75 seats, workflow automation, Agents, and 20,000 monthly workflow credits",
      "toolB": "Growth tier is $399/month for 3 users, 2 projects, 50 AI articles/month, and Action Center trial access",
      "whyItMatters": "Copy.ai's mid-tier pricing reflects a much larger seat count and deeper automation scope, while Writesonic's mid-tier stays focused on content volume and limited seats",
      "benefitsWho": "Larger teams needing many seats and heavy automation benefit from Copy.ai's Growth tier; smaller content teams benefit from Writesonic's lower-cost Growth tier"
    },
    {
      "title": "Team seat scaling",
      "toolA": "Chat plan supports up to 5 seats; Growth plan supports up to 75 seats",
      "toolB": "Starter supports 1 user, Basic 2 users, Growth 3 users, with custom seats only at Enterprise",
      "whyItMatters": "Copy.ai scales to much larger teams before requiring a custom Enterprise contract, while Writesonic's paid tiers stay limited to a handful of users",
      "benefitsWho": "Larger marketing/ops teams benefit from Copy.ai's higher built-in seat caps"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core writing and content generation",
      "rows": [
        {
          "feature": "Long-form article/blog generation",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai via Chat and templates; Writesonic via a dedicated AI Article Writer with web research"
        },
        {
          "feature": "Short-form copy templates (ads, social, product descriptions)",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai's Templates library vs. Writesonic's Content template library"
        },
        {
          "feature": "SEO checker/optimizer for drafts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Plagiarism/AI-content checking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Workflow and process automation",
      "rows": [
        {
          "feature": "Multi-step workflow automation",
          "toolA": "available",
          "toolB": "limited",
          "note": "Writesonic's Action Center automation is on higher tiers and framed around SEO/AI-visibility fixes"
        },
        {
          "feature": "Agentic decision-making/branching",
          "toolA": "available",
          "toolB": "limited",
          "note": "Writesonic offers only limited agentic workflow trial runs on Starter/Basic plans"
        },
        {
          "feature": "Shared data table/spreadsheet layer",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI model and knowledge grounding",
      "rows": [
        {
          "feature": "Choice of underlying AI model provider",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copy.ai supports OpenAI, Anthropic, Google Gemini, and Perplexity"
        },
        {
          "feature": "Configurable brand voice/style",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Company knowledge base grounding for outputs",
          "toolA": "available",
          "toolB": "limited",
          "note": "Copy.ai's Infobase vs. Chatsonic being grounded in a site's own SEO/analytics data"
        }
      ]
    },
    {
      "group": "AI search visibility (GEO)",
      "rows": [
        {
          "feature": "AI platform citation/brand visibility tracking (ChatGPT, Gemini, AI Overviews)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Site technical and structured-data audits",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Prioritized AI/SEO fix recommendations",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Writesonic's Action Center fix recommendations scale with plan tier"
        }
      ]
    },
    {
      "group": "Integrations and publishing",
      "rows": [
        {
          "feature": "CRM/sales engagement integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copy.ai connects to Salesforce, HubSpot, Gong, Outreach, Salesloft"
        },
        {
          "feature": "Zapier-style connections",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Direct WordPress/CMS publishing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Team, security, and enterprise",
      "rows": [
        {
          "feature": "Multi-seat team plans",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai scales to 75 seats on Growth; Writesonic caps at 3 users on Growth"
        },
        {
          "feature": "SSO/SAML support",
          "toolA": "available",
          "toolB": "available",
          "note": "Both only on custom-priced Enterprise plans"
        },
        {
          "feature": "SOC 2 / GDPR / HIPAA compliance",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai Enterprise lists SOC 2 and GDPR; Writesonic Enterprise lists SOC 2 Type II, HIPAA, and GDPR"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copy.ai includes API access at the Enterprise tier"
        }
      ]
    },
    {
      "group": "Pricing and access model",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "No-credit-card free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Copy.ai's free plan itself requires no credit card, but is a permanent tier rather than a time-limited trial"
        },
        {
          "feature": "Published Enterprise pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales for Enterprise pricing"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Copy.ai or Writesonic?",
      "answer": "Copy.ai is cheaper to start with: it has a permanent free plan and a paid Chat tier from $29/month ($24/month billed annually), while Writesonic has no free plan and starts at $79/month billed annually for its Starter tier."
    },
    {
      "question": "Is Copy.ai or Writesonic better for SEO content?",
      "answer": "Writesonic is more purpose-built for SEO content, with an AI Article Writer, an SEO checker and optimizer, site audits, and AI search visibility tracking across platforms like ChatGPT and Google AI Overviews, none of which are documented Copy.ai features."
    },
    {
      "question": "Can Copy.ai track how my brand appears in ChatGPT or AI search results?",
      "answer": "This is not documented as a Copy.ai capability; that function is a dedicated Writesonic feature that monitors how a brand is cited and represented across ChatGPT, Gemini, Google AI Overviews, and other AI platforms."
    },
    {
      "question": "Does Writesonic integrate with CRM tools like Salesforce or HubSpot?",
      "answer": "This is not documented for Writesonic, which only lists a WordPress publishing integration; Copy.ai, by contrast, documents native and Zapier-based integrations with Salesforce, HubSpot, Gong, Outreach, and Salesloft."
    },
    {
      "question": "Does either tool have a free plan?",
      "answer": "Copy.ai has an ongoing free plan with a limited monthly word allowance and template access, while Writesonic offers only a free, no-credit-card trial rather than a permanent free tier."
    },
    {
      "question": "Is Copy.ai a good fit for a solo blogger who just wants to write articles?",
      "answer": "Not ideally: Copy.ai can handle light writing through its Chat, templates, or free plan, but its deeper value and pricing are built around teams automating GTM workflows, so a dedicated writing tool like Writesonic's AI Article Writer may be a simpler fit for purely individual content work."
    }
  ]
};

export default copyAiVsWritesonicContent;
