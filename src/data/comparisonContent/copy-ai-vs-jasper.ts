import type { ToolComparisonContent } from './types';

const copyAiVsJasperContent: ToolComparisonContent = {
  "verdict": "Copy.ai and Jasper both descend from AI copywriting tools but have split into different products. Copy.ai has repositioned itself as a GTM AI platform: its Workflows, Agents, and Tables let sales, marketing, and ops teams automate multi-step processes like lead research and outreach drafting, backed by native CRM integrations (Salesforce, HubSpot, Gong, Outreach, Salesloft) and a choice of underlying AI models (OpenAI, Anthropic, Gemini, Perplexity). Jasper has stayed closer to its roots as an enterprise content platform: Brand Voice, a Knowledge Base, a long-form Document Editor, Campaigns & Workflows, and dedicated add-ons like Jasper Art (images) and SEO Mode are all built around producing and coordinating on-brand marketing content at scale. Neither tool is simply \"better\" — Copy.ai is the stronger fit for teams trying to automate GTM processes across tools and data, while Jasper is the stronger fit for marketing teams and agencies producing consistent, multi-format content campaigns. Budget-conscious individuals may lean toward Copy.ai for its permanent free plan and lower entry price, while content-heavy marketing orgs may find Jasper's campaign tooling and image generation worth its trial-only, subscription-first model. The right choice depends on whether the job to be done is workflow automation or content production.",
  "bestForToolA": "Sales, marketing, and ops teams that want to automate multi-step GTM processes (lead research, outreach, data enrichment) across their existing CRM and sales stack, or budget-conscious users who want an ongoing free plan.",
  "bestForToolB": "Marketing teams and agencies that need consistent, on-brand content across many formats and writers, plus built-in extras like image generation and SEO guidance, and don't need workflow automation into a CRM.",
  "whoNeedsBoth": "A marketing team that produces high volumes of on-brand content in Jasper but also needs to automate downstream GTM tasks like CRM data enrichment or sales outreach sequencing may reasonably run both tools side by side.",
  "keyDifferences": [
    {
      "title": "Core use case",
      "toolA": "Positioned as a GTM AI platform automating sales, marketing, and ops workflows, with content generation as one part of a broader system",
      "toolB": "Positioned as an enterprise AI content platform focused on producing and coordinating marketing content and campaigns",
      "whyItMatters": "Buyers looking to automate cross-tool processes need a different product than buyers who just need consistent content output",
      "benefitsWho": "Ops-minded GTM teams benefit from Copy.ai's framing; content-focused marketing teams benefit from Jasper's framing"
    },
    {
      "title": "Automation depth",
      "toolA": "Workflows, Agents, and Tables allow branching, decision-making automation and a shared data layer across a process",
      "toolB": "Campaigns & Workflows coordinate multi-asset content output from a single brief, but no documented branching agent logic or data tables",
      "whyItMatters": "Teams needing conditional logic or a shared operational data layer require more than campaign coordination",
      "benefitsWho": "Technical/ops-savvy marketing and RevOps teams benefit from Copy.ai's deeper automation"
    },
    {
      "title": "Free access model",
      "toolA": "Offers a permanent free plan with a limited word allowance and template access, no credit card required",
      "toolB": "No permanent free plan; only a time-limited free trial before requiring a paid subscription",
      "whyItMatters": "Users wanting to try core features indefinitely at no cost versus those needing to evaluate quickly within a trial window have different needs",
      "benefitsWho": "Occasional or budget-limited users benefit from Copy.ai's free tier; Jasper's trial suits buyers ready to commit to a paid plan soon"
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Chat plan starts at $29/month ($24/month billed annually)",
      "toolB": "Creator plan starts from $39/month billed annually",
      "whyItMatters": "Entry price affects accessibility for individuals and small teams testing paid features",
      "benefitsWho": "Cost-sensitive individual users and small teams benefit from Copy.ai's lower starting price"
    },
    {
      "title": "AI model choice",
      "toolA": "Explicitly model-agnostic, supporting OpenAI, Anthropic, Google Gemini, and Perplexity",
      "toolB": "Not documented which specific underlying AI models power generation",
      "whyItMatters": "Teams with a preferred AI provider or that want to mix models for different tasks care about this flexibility",
      "benefitsWho": "Technical buyers and teams with existing AI provider preferences benefit from Copy.ai's model choice"
    },
    {
      "title": "Image generation",
      "toolA": "Not documented as offering AI image generation",
      "toolB": "Includes Jasper Art for generating visuals and graphics alongside written content",
      "whyItMatters": "Teams needing visuals alongside copy in one workspace avoid a separate image tool",
      "benefitsWho": "Marketing teams producing multi-asset campaigns (ads, social visuals) benefit from Jasper's built-in image generation"
    },
    {
      "title": "SEO content guidance",
      "toolA": "Not documented as offering dedicated SEO optimization guidance",
      "toolB": "Includes a dedicated SEO Mode with keyword and on-page optimization guidance",
      "whyItMatters": "Teams writing for organic search rankings benefit from built-in optimization signals rather than a separate SEO tool",
      "benefitsWho": "Content marketers and SEO-focused writers benefit from Jasper's SEO Mode"
    },
    {
      "title": "CRM and sales tool integrations",
      "toolA": "Documented native and Zapier-based integrations with Salesforce, HubSpot, Gong, Outreach, and Salesloft",
      "toolB": "Not documented as having specific CRM/sales tool integrations beyond a browser extension and general API access",
      "whyItMatters": "Teams that need workflows to read/write data in their existing sales stack require direct CRM connectivity",
      "benefitsWho": "Sales and RevOps teams benefit from Copy.ai's documented CRM integration coverage"
    },
    {
      "title": "Scaling to team/enterprise pricing",
      "toolA": "Jumps from a self-serve Chat plan to a Growth tier at $1,000/month (billed annually) for workflow automation and up to 75 seats, then custom Enterprise pricing",
      "toolB": "Scales more incrementally from Creator ($39/mo) to Pro ($59/mo) to custom Business pricing",
      "whyItMatters": "A steep jump to unlock automation features can be a budgeting hurdle compared to gradual tier increases",
      "benefitsWho": "Growing teams wanting predictable, incremental cost increases may prefer Jasper's tier structure; larger GTM teams ready to invest in automation may accept Copy.ai's Growth tier"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Writing & Content Creation",
      "rows": [
        {
          "feature": "Long-form document editor",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jasper's Document Editor supports inline AI commands for editing and rewriting"
        },
        {
          "feature": "Conversational chat interface",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai Chat and Jasper Chat Assistant both support one-off writing and brainstorming"
        },
        {
          "feature": "Pre-built content templates",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer libraries for blog outlines, ads, and social captions"
        }
      ]
    },
    {
      "group": "Workflow Automation",
      "rows": [
        {
          "feature": "Multi-step automated workflows",
          "toolA": "available",
          "toolB": "limited",
          "note": "Jasper's Campaigns & Workflows coordinate multi-asset content but not documented as branching automation"
        },
        {
          "feature": "Decision-making autonomous agents",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Structured, queryable data tables",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Brand & Knowledge Consistency",
      "rows": [
        {
          "feature": "Brand voice configuration",
          "toolA": "available",
          "toolB": "available",
          "note": "Jasper supports multiple Brand Voices on its Pro tier"
        },
        {
          "feature": "Centralized company knowledge base",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai's Infobase vs. Jasper's Knowledge Base"
        }
      ]
    },
    {
      "group": "AI Model & Media Capabilities",
      "rows": [
        {
          "feature": "Choice of multiple AI model providers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copy.ai supports OpenAI, Anthropic, Gemini, and Perplexity"
        },
        {
          "feature": "AI image generation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jasper Art"
        },
        {
          "feature": "SEO optimization guidance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jasper's SEO Mode"
        }
      ]
    },
    {
      "group": "Integrations & Extensibility",
      "rows": [
        {
          "feature": "CRM and sales tool integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copy.ai connects to Salesforce, HubSpot, Gong, Outreach, Salesloft"
        },
        {
          "feature": "API access for custom integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai's API access is part of its Enterprise tier"
        },
        {
          "feature": "Browser extension",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Ongoing free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Jasper offers only a time-limited free trial"
        },
        {
          "feature": "Seat-based team plans",
          "toolA": "available",
          "toolB": "available",
          "note": "Copy.ai Growth supports up to 75 seats; Jasper Pro/Business support team collaboration"
        },
        {
          "feature": "Custom enterprise pricing tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Both list custom, contact-sales pricing at their top tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Copy.ai or Jasper?",
      "answer": "Copy.ai is cheaper to start with: its Chat plan begins at $29/month ($24/month billed annually) versus Jasper's Creator plan starting from $39/month billed annually, and Copy.ai also offers a permanent free plan while Jasper only provides a free trial."
    },
    {
      "question": "Does Jasper have a free plan like Copy.ai?",
      "answer": "No, Jasper does not offer a permanent free plan; it provides only a time-limited free trial, whereas Copy.ai has an ongoing free plan with a limited monthly word allowance and template access."
    },
    {
      "question": "Which tool is better for automating sales and marketing workflows?",
      "answer": "Copy.ai is built for this use case, with Workflows, Agents, and Tables that chain prompts, data lookups, and CRM actions into repeatable, decision-making automations, while Jasper's Campaigns & Workflows are focused on coordinating content assets rather than broader process automation."
    },
    {
      "question": "Can Jasper generate images as well as text?",
      "answer": "Yes, Jasper includes an image generation feature called Jasper Art alongside its text-generation and campaign tools; Copy.ai's provided feature set does not document an image generation capability."
    },
    {
      "question": "Which tool integrates with CRM systems like Salesforce or HubSpot?",
      "answer": "Copy.ai documents native and Zapier-based integrations with Salesforce, HubSpot, Gong, Outreach, and Salesloft, while Jasper's provided facts do not document specific CRM integrations beyond a browser extension and general API access."
    },
    {
      "question": "Is Jasper or Copy.ai better for a solo blogger or independent writer?",
      "answer": "Jasper's Document Editor and Chat Assistant are more straightforward for individual long-form writing, while Copy.ai's own stated cons note that solo writers may find its automation-focused Workflows and Agents unnecessary for purely individual content work."
    }
  ]
};

export default copyAiVsJasperContent;
