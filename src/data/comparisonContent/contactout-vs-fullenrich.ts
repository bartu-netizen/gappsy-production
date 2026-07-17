import type { ToolComparisonContent } from './types';

const contactoutVsFullenrichContent: ToolComparisonContent = {
  "verdict": "ContactOut and FullEnrich are both contact-finding tools, but they take different approaches to sourcing data. ContactOut searches its own database of 350 million professionals directly, plus a Chrome extension and API. FullEnrich is a waterfall enrichment tool that aggregates 20+ third-party providers, including Clearbit, Hunter, Wiza, Snov, and even ContactOut itself, to maximize find rates rather than relying on a single proprietary database.",
  "bestForToolA": "ContactOut fits teams that want a single large first-party database (350 million professionals, 40 million companies) with a Chrome extension, cloud dialer, and API, and that want a recurring free tier (5 credits/day) rather than a paid subscription from day one.",
  "bestForToolB": "FullEnrich fits teams that want to maximize find and verification rates by waterfalling across 20+ data providers at once, with catch-all email verification claimed at up to 80% accuracy and native AI agent integrations including Claude via MCP.",
  "whoNeedsBoth": "Since FullEnrich's own waterfall explicitly includes ContactOut as one of its 20+ underlying data sources, a team using FullEnrich is already indirectly drawing on ContactOut's data; a team wanting more control could instead query ContactOut directly for its Chrome extension and dialer while relying on FullEnrich for harder-to-find catch-all or phone-verified contacts.",
  "keyDifferences": [
    {
      "title": "Data Sourcing Model",
      "toolA": "ContactOut searches its own proprietary database of 350 million professionals and 40 million companies.",
      "toolB": "FullEnrich waterfalls across 20+ premium third-party providers (including Clearbit, Hunter, Wiza, Snov, ContactOut, Anymail Finder, and Crunchbase) to maximize find rates rather than relying on one source.",
      "whyItMatters": "A single-database tool and a multi-provider waterfall behave differently on hard-to-find contacts; waterfalling generally raises find rates but adds provider dependency.",
      "benefitsWho": "Teams enriching hard-to-reach or niche contacts benefit from FullEnrich's multi-source waterfall approach."
    },
    {
      "title": "Pricing Structure",
      "toolA": "ContactOut's public pricing page does not clearly break out full tiers beyond the Free plan (5 credits/day, no credit card required), per its documented cons.",
      "toolB": "FullEnrich publishes a Pro plan at €55/month for 1,000 credits, plus a free trial of 50 credits with no credit card required, and a custom Scale/Enterprise tier.",
      "whyItMatters": "Published, credit-based pricing lets buyers estimate monthly cost before signing up, while an unclear tier structure requires more discovery.",
      "benefitsWho": "Budget-conscious buyers who want to model costs upfront benefit from FullEnrich's published €55/month Pro pricing."
    },
    {
      "title": "Phone Number Validation",
      "toolA": "ContactOut's documented features include phone numbers in its search results and a built-in cloud phone dialer, without a specifically named validation method.",
      "toolB": "FullEnrich offers advanced phone validation that compares number ownership with lead names, specifically for US and Canada contacts.",
      "whyItMatters": "Validated phone-to-name matching reduces wasted outreach on disconnected or mismatched numbers.",
      "benefitsWho": "Outbound SDR teams doing cold calling in the US or Canada benefit from FullEnrich's phone validation."
    },
    {
      "title": "AI Agent and Workflow Integrations",
      "toolA": "ContactOut offers an AI Personalizer for generating outreach emails and API access, but its documented facts do not mention MCP or dedicated AI agent tooling integrations.",
      "toolB": "FullEnrich connects to Claude via MCP and to OpenAI-based workflows, as well as Zapier, Make, n8n, and Clay, in addition to standard API access.",
      "whyItMatters": "MCP support lets a team wire enrichment directly into an AI agent's tool calls rather than building custom API glue code.",
      "benefitsWho": "Teams building AI-agent-driven enrichment or outbound workflows benefit from FullEnrich's Claude MCP support."
    },
    {
      "title": "CRM Integrations",
      "toolA": "ContactOut's documented feature set does not list native CRM sync.",
      "toolB": "FullEnrich syncs enrichment data with HubSpot and Salesforce.",
      "whyItMatters": "Native CRM sync removes manual export/import steps when pushing enriched contact data into a sales pipeline.",
      "benefitsWho": "HubSpot or Salesforce users benefit from FullEnrich's native CRM sync."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Coverage",
      "rows": [
        {
          "feature": "Database size",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ContactOut: 350M professionals, 40M companies"
        },
        {
          "feature": "Multi-provider waterfall enrichment",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "FullEnrich aggregates 20+ providers, including ContactOut"
        },
        {
          "feature": "Catch-all email verification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "FullEnrich claims up to 80% accuracy"
        },
        {
          "feature": "Phone number ownership validation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "FullEnrich: US/Canada"
        },
        {
          "feature": "Data enrichment (job title, revenue, tech stack, etc.)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ContactOut: 20+ searchable data points"
        }
      ]
    },
    {
      "group": "Access & Integrations",
      "rows": [
        {
          "feature": "Chrome extension",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Claude / MCP integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Native CRM sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "FullEnrich: HubSpot, Salesforce"
        },
        {
          "feature": "Zapier / Make / n8n / Clay integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Cloud phone dialer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Trust",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "FullEnrich: €55/month Pro plan"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "ContactOut: 5 credits/day ongoing; FullEnrich: 50-credit free trial"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "available",
          "note": "Both state SOC 2 compliance"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does FullEnrich actually use ContactOut's data?",
      "answer": "Yes. FullEnrich's documented waterfall enrichment aggregates 20+ premium providers, and ContactOut is explicitly named as one of those underlying data sources, alongside Clearbit, Hunter, Wiza, Snov, Anymail Finder, and Crunchbase."
    },
    {
      "question": "How much does FullEnrich cost compared to ContactOut?",
      "answer": "FullEnrich publishes a Pro plan at €55/month for 1,000 credits, with a free trial of 50 credits and no credit card required. ContactOut's public pricing page does not clearly break out paid tiers beyond its Free plan of 5 credits per day."
    },
    {
      "question": "Which tool has better phone number data?",
      "answer": "FullEnrich documents advanced phone validation that compares number ownership with lead names for US and Canada contacts. ContactOut also returns phone numbers and includes a built-in cloud dialer, but does not document a specific validation method."
    },
    {
      "question": "Does either tool integrate with Claude or other AI agents?",
      "answer": "FullEnrich connects to Claude via MCP and to OpenAI-based workflows, plus Zapier, Make, n8n, and Clay. ContactOut's documented features do not mention MCP or AI agent integrations."
    },
    {
      "question": "Which tool syncs with a CRM?",
      "answer": "FullEnrich syncs enrichment data with HubSpot and Salesforce. ContactOut's documented feature set does not list native CRM sync."
    },
    {
      "question": "Is there a free way to try either tool?",
      "answer": "ContactOut offers 5 free credits daily on an ongoing basis with no credit card required. FullEnrich offers a one-time free trial of 50 credits, also with no credit card required."
    }
  ]
};

export default contactoutVsFullenrichContent;
