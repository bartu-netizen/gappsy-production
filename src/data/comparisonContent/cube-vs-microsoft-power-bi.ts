import type { ToolComparisonContent } from './types';

const cubeVsMicrosoftPowerBiContent: ToolComparisonContent = {
  "verdict": "Cube is an open source semantic layer and agentic analytics platform built to power both governed internal BI and embedded, multi-tenant analytics inside customer-facing products; Microsoft Power BI is a full BI and data visualization platform for building interactive reports and dashboards with deep Power Query/DAX modeling and native Microsoft 365/Azure integration. They can even be complementary, since Cube explicitly connects to Power BI via a DAX API.",
  "bestForToolA": "Engineering teams building embedded, multi-tenant, AI-powered analytics into their own SaaS product, or teams wanting an open source (18,000+ GitHub stars) semantic layer that centralizes metric definitions across multiple BI and AI tools.",
  "bestForToolB": "Organizations already using Microsoft 365, Excel, Teams, and Azure that need drag-and-drop interactive report building, natural-language Q&A, Copilot-assisted report creation, and enterprise governance like row-level security and certified datasets.",
  "whoNeedsBoth": "A company could model its metrics once in Cube's semantic layer and connect Power BI to that governed layer via Cube's documented DAX API for Power BI, letting Power BI report authors query consistent, pre-defined metrics instead of redefining them in DAX.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "A semantic layer and agentic analytics platform focused on governed metrics and embedding analytics into products.",
      "toolB": "A full BI and reporting/dashboarding platform with its own visualization engine and DAX modeling language.",
      "whyItMatters": "Cube centralizes metric definitions across tools while Power BI is an end-user reporting tool.",
      "benefitsWho": "Platform and data engineering teams (Cube) versus business analysts building reports (Power BI)."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Free-forever tier, then Starter at $40/developer/month, Premium at $80/developer/month, and custom Enterprise.",
      "toolB": "Free Power BI Desktop for authoring only (no sharing), Pro at $10/user/month, Premium Per User at $20/user/month, and Premium Capacity starting from $4,995.",
      "whyItMatters": "Cube's entry paid tier ($40/developer) is priced well above Power BI Pro's $10/user entry point, though Power BI's org-wide Premium Capacity tier starts near $5,000.",
      "benefitsWho": "Small analyst teams needing cheap per-seat licensing (Power BI Pro) versus platform teams embedding analytics for many end customers (Cube)."
    },
    {
      "title": "Embedded / Multi-Tenant Analytics",
      "toolA": "Premium and Enterprise tiers explicitly support multi-tenant, AI-powered embedded analytics and embedded analytics chat for customer-facing products.",
      "toolB": "Documented embedding is via Power Platform (Teams, SharePoint, Power Apps) for internal use, rather than named multi-tenant customer-facing embedding.",
      "whyItMatters": "Matters for SaaS companies wanting to expose analytics to their own external customers.",
      "benefitsWho": "Product and engineering teams building analytics-as-a-feature into a SaaS product (Cube)."
    },
    {
      "title": "Open Source Availability",
      "toolA": "Maintains an open source repository with 18,000+ GitHub stars and 350+ contributors, plus a free-forever tier for hobbyist and small projects.",
      "toolB": "Not open source, though Power BI Desktop is free to download for authoring.",
      "whyItMatters": "Relevant for teams wanting to self-host or inspect and modify the underlying semantic layer code.",
      "benefitsWho": "Engineering teams wanting an auditable, community-driven open source foundation (Cube)."
    },
    {
      "title": "Platform Ecosystem Lock-In",
      "toolA": "Integrates with Claude, ChatGPT, Slack, and Power BI via a DAX API, positioning it as a layer that can sit underneath multiple BI/AI tools.",
      "toolB": "Deeply integrated with Excel, Teams, SharePoint, and Azure, lowering friction for organizations already on Microsoft 365.",
      "whyItMatters": "Determines whether the tool locks you into one vendor's stack or federates across several.",
      "benefitsWho": "Microsoft-centric organizations (Power BI) versus teams using a mix of AI assistants and BI tools that want one governed metrics layer underneath them all (Cube)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Semantic Modeling & Reporting",
      "rows": [
        {
          "feature": "Semantic/data modeling layer",
          "toolA": "available",
          "toolB": "available",
          "note": "Core product vs. DAX & Data Modeling"
        },
        {
          "feature": "Drag-and-drop dashboard builder",
          "toolA": "available",
          "toolB": "available",
          "note": "Workbooks/dashboards vs. Interactive Reports & Dashboards"
        },
        {
          "feature": "Natural language querying",
          "toolA": "available",
          "toolB": "available",
          "note": "Analytics Chat vs. Natural Language Q&A"
        },
        {
          "feature": "Paginated/pixel-perfect reports",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Embedded & AI Analytics",
      "rows": [
        {
          "feature": "Multi-tenant embedded analytics",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cube Premium/Enterprise"
        },
        {
          "feature": "AI-assisted report creation / Copilot",
          "toolA": "available",
          "toolB": "available",
          "note": "Analytics Chat vs. AI Visuals & Copilot"
        },
        {
          "feature": "Bring Your Own LLM",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cube Enterprise"
        }
      ]
    },
    {
      "group": "Pricing & Platform",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Free-forever vs. Power BI Desktop (authoring only)"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "$40/developer/month vs. $10/user/month"
        },
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "18,000+ GitHub stars"
        },
        {
          "feature": "SSO with SAML 2.0",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cube Enterprise"
        },
        {
          "feature": "Published uptime SLA",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "99.950% Premium, 99.990% Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Cube free?",
      "answer": "Yes, a free-forever tier is available for small projects, plus paid Starter ($40/developer/month), Premium ($80/developer/month), and custom Enterprise tiers."
    },
    {
      "question": "Is Power BI free?",
      "answer": "Power BI Desktop, the authoring app, is free; sharing and collaboration generally require a paid Pro ($10/user/month) or Premium license."
    },
    {
      "question": "Can Cube and Power BI be used together?",
      "answer": "Yes, Cube documents ecosystem integrations with Power BI via a DAX API, letting Power BI query Cube's governed semantic layer."
    },
    {
      "question": "Is Cube open source?",
      "answer": "Yes, with 18,000+ GitHub stars and 350+ contributors."
    },
    {
      "question": "Which tool is better for embedding analytics into a customer-facing product?",
      "answer": "Cube's Premium and Enterprise tiers are explicitly built for multi-tenant embedded analytics and embedded analytics chat, while Power BI's documented embedding is via Power Platform (Teams, SharePoint, Power Apps) for internal use rather than customer-facing multi-tenant embedding."
    },
    {
      "question": "Does Power BI work on Mac?",
      "answer": "Power BI Desktop is Windows-only; Mac users access reports via a browser or run Desktop in a Windows virtual machine."
    }
  ]
};

export default cubeVsMicrosoftPowerBiContent;
