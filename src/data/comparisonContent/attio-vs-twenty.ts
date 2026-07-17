import type { ToolComparisonContent } from './types';

const attioVsTwentyContent: ToolComparisonContent = {
  "verdict": "Attio and Twenty are both modern, AI-connected CRMs, but they diverge on openness and hosting. Attio is a closed-source hosted SaaS with a free plan for up to 3 seats and native AI search (Ask Attio) plus Call Intelligence; Twenty is fully open source, free to self-host, and built around custom objects and a native MCP server connecting to Claude, ChatGPT, and Cursor, with cloud plans starting at $9/user/month but no documented permanent free cloud tier.",
  "bestForToolA": "Teams that want a hosted, ready-to-use CRM with a free plan out of the box, native AI search, and Call Intelligence for recording and analyzing meetings, without managing infrastructure.",
  "bestForToolB": "Technical teams that want to self-host for free, need heavily customizable data models (custom objects) without vendor lock-in, and want native MCP-based connections to Claude, ChatGPT, and Cursor plus custom AI agent skills.",
  "whoNeedsBoth": "An organization with both a business-facing revenue team (better served by Attio's hosted, ready-to-use experience) and an engineering team wanting a customizable, self-hosted internal CRM (Twenty) could reasonably run both for different purposes.",
  "keyDifferences": [
    {
      "title": "Open source and self-hosting",
      "toolA": "No self-hosting or open-source option is documented; Attio is a hosted SaaS product.",
      "toolB": "Fully open source and free to self-host on your own infrastructure, in addition to a cloud offering.",
      "whyItMatters": "Teams wanting full control over data and hosting, or avoiding recurring per-seat SaaS costs, can self-host with Twenty but not Attio.",
      "benefitsWho": "Technical teams with infrastructure resources who want data control or to avoid vendor lock-in."
    },
    {
      "title": "Free tier model",
      "toolA": "Provides a hosted free plan for up to 3 seats with real-time syncing and automatic enrichment.",
      "toolB": "Is free to self-host (unlimited, but requires technical setup and maintenance); cloud plans start at $9/user/month with a 30-day free trial rather than a permanent free cloud tier.",
      "whyItMatters": "Non-technical teams get a no-cost hosted option only with Attio; technical teams can get Twenty for free by self-hosting instead.",
      "benefitsWho": "Non-technical small teams (Attio) vs. technical teams willing to self-host (Twenty)."
    },
    {
      "title": "Custom data modeling",
      "toolA": "Enterprise plan includes 'unlimited objects,' but custom data modeling is not emphasized as a core, lower-tier feature.",
      "toolB": "Built around custom objects and data modeling as a headline feature, available on the entry Pro plan, explicitly marketed as avoiding vendor lock-in.",
      "whyItMatters": "Teams needing to model unusual data structures without hitting a rigid schema get that flexibility earlier in Twenty's plan lineup.",
      "benefitsWho": "Teams with non-standard data models or engineering-led CRM customization needs."
    },
    {
      "title": "AI assistant integration",
      "toolA": "Ask Attio provides native in-app AI search and record creation; integrates with Claude, Slack, Notion, Linear, and Stripe via API, SDK, and MCP.",
      "toolB": "Provides a native MCP server connecting specifically to Claude, ChatGPT, and Cursor via OAuth, plus AI chat and custom AI agents/skills via a developer framework.",
      "whyItMatters": "Attio's AI is built into the CRM's own search experience; Twenty's AI leans on connecting external assistants and building custom agent skills. Teams should match this to whether they want AI inside the CRM or the CRM exposed to their AI tools.",
      "benefitsWho": "Attio: teams wanting in-app AI search. Twenty: teams building custom AI agent workflows on top of CRM data."
    },
    {
      "title": "Call Intelligence",
      "toolA": "Includes Call Intelligence for recording and analyzing meetings, available on the Pro plan and above.",
      "toolB": "Does not document a meeting/call recording or analysis feature.",
      "whyItMatters": "Sales teams wanting automated call analysis get that natively from Attio.",
      "benefitsWho": "Sales teams that rely on call review and coaching."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Open-source / self-hosting option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom objects & data modeling",
          "toolA": "limited",
          "toolB": "available",
          "note": "Attio's 'unlimited objects' is an Enterprise-plan feature; Twenty offers this from the Pro plan."
        },
        {
          "feature": "Call Intelligence (meeting recording/analysis)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Attio Pro plan and above."
        },
        {
          "feature": "No-code workflow automation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Extensibility",
      "rows": [
        {
          "feature": "Native in-app AI search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Attio's Ask Attio."
        },
        {
          "feature": "MCP server connecting to external AI assistants",
          "toolA": "available",
          "toolB": "available",
          "note": "Attio integrates with Claude via API/SDK/MCP; Twenty's native MCP server connects to Claude, ChatGPT, and Cursor via OAuth."
        },
        {
          "feature": "AI chat and custom agent skills via developer framework",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Documented REST/GraphQL API rate limits",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Twenty: 50 calls/min (Pro), 100 calls/min (Organization)."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free hosted plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Attio: up to 3 seats. Twenty's free tier is limited to self-hosting; cloud has a 30-day trial instead."
        },
        {
          "feature": "Free self-hosting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Entry cloud paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Attio Plus: €36/user/mo (€29 annual). Twenty Pro: $9/user/mo (25% off annual)."
        },
        {
          "feature": "SSO",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Twenty's SAML/OIDC SSO is limited to the Organization plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Attio have a free plan?",
      "answer": "Yes, free for up to 3 seats with real-time contact syncing and automatic data enrichment."
    },
    {
      "question": "Is Twenty free?",
      "answer": "Yes, it's open source and free to self-host; cloud plans start at $9/user/month."
    },
    {
      "question": "Can Twenty connect to AI assistants?",
      "answer": "Yes, via a native MCP server with Claude, ChatGPT, and Cursor."
    },
    {
      "question": "What does Attio integrate with?",
      "answer": "Claude, Slack, Notion, Linear, Stripe, Granola, Lemlist, and others via API, SDK, and MCP."
    },
    {
      "question": "What's the difference between Twenty's Pro and Organization plans?",
      "answer": "Organization adds row-level permissions, SAML/OIDC SSO, a custom domain, and a higher API rate limit (100 vs. 50 calls/minute)."
    },
    {
      "question": "Does Attio offer self-hosting?",
      "answer": "No self-hosting or open-source option is documented for Attio; it is offered as a hosted SaaS product."
    }
  ]
};

export default attioVsTwentyContent;
