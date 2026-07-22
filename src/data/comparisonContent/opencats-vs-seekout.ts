import type { ToolComparisonContent } from './types';

const opencatsVsSeekoutContent: ToolComparisonContent = {
  "verdict": "OpenCATS and SeekOut occupy opposite ends of the recruiting software spectrum. OpenCATS is a free, open-source, self-hosted applicant tracking system and recruiting CRM maintained by a community of contributors on GitHub. SeekOut is a paid, AI-driven sourcing and screening platform starting at $149/month (annual) that searches over 1 billion candidate profiles, runs AI screening interviews, and connects to AI assistants like Claude and ChatGPT through SeekOut MCP. One is a free system of record you host yourself; the other is a paid sourcing and evaluation layer designed to plug into an existing ATS.",
  "bestForToolA": "Organizations that want a completely free, self-hosted applicant tracking system and recruiting CRM, are comfortable managing their own infrastructure, and value inspecting the open-source code and controlling their own data.",
  "bestForToolB": "Recruiting teams that need AI-powered candidate search across 1B+ profiles, automated screening, and outreach campaigns, and want direct integration with existing ATS platforms like Workday, Greenhouse, iCIMS, Lever, and Ashby -- SeekOut reports 750+ customers including DocuSign, Sony, and Microsoft.",
  "whoNeedsBoth": "A staffing agency could self-host OpenCATS as its free system-of-record ATS/CRM for tracking candidates, requisitions, and submissions, while paying for SeekOut to source and AI-screen candidates from its 1B+ profile database -- SeekOut is built to integrate with named ATS platforms rather than replace them, so pairing it with a free ATS like OpenCATS is a realistic combination.",
  "keyDifferences": [
    {
      "title": "Cost and Licensing",
      "toolA": "OpenCATS is completely free and open-source, with no published pricing tiers.",
      "toolB": "SeekOut's self-serve Recruit Core plan starts at $149/month billed annually ($179/month billed monthly), with higher sourcing, integration, and full-funnel tiers requiring a custom quote.",
      "whyItMatters": "Budget-constrained teams and staffing agencies can adopt OpenCATS at zero licensing cost, while SeekOut requires ongoing subscription spend that scales with plan tier.",
      "benefitsWho": "Cash-constrained agencies and internal recruiting teams (OpenCATS) versus funded recruiting organizations wanting AI sourcing at scale (SeekOut)."
    },
    {
      "title": "Deployment Model",
      "toolA": "OpenCATS is self-hosted -- you install and run it on your own infrastructure, keeping data under your own control.",
      "toolB": "SeekOut is not documented as self-hosted; its 14-day free trial (no credit card) on the Core plan implies a standard cloud SaaS deployment.",
      "whyItMatters": "Self-hosting gives full data control and inspection of the source code but requires technical setup; SaaS deployment trades that control for zero infrastructure maintenance.",
      "benefitsWho": "Organizations with in-house IT capacity that prioritize data control (OpenCATS) versus teams that want to start sourcing immediately without server setup (SeekOut)."
    },
    {
      "title": "AI Sourcing and Screening",
      "toolA": "OpenCATS does not document any AI features on its official site.",
      "toolB": "SeekOut offers context-aware AI search across 1B+ profiles, automated AI video screening interviews against custom criteria, and AI-crafted multi-touch outreach campaigns.",
      "whyItMatters": "Teams needing to source and pre-screen at scale need AI capability that OpenCATS simply does not offer as a candidate database and tracking tool.",
      "benefitsWho": "High-volume recruiting teams that need AI to filter and engage large candidate pools."
    },
    {
      "title": "AI Assistant Integration",
      "toolA": "OpenCATS does not document integration with AI assistants.",
      "toolB": "SeekOut MCP integrates SeekOut's candidate data with AI assistants including Claude, ChatGPT, Gemini, and Microsoft Copilot.",
      "whyItMatters": "Recruiters already working inside AI chat assistants can query SeekOut's data without switching tools, a capability unique to SeekOut here.",
      "benefitsWho": "Recruiters who want to access sourcing data through the AI assistants they already use daily."
    },
    {
      "title": "Support Model",
      "toolA": "OpenCATS is maintained in the open by users and contributors, with support via GitHub Security Advisories and a Reddit community (r/openCATS).",
      "toolB": "SeekOut provides vendor-backed support as a commercial product, with dedicated customer success included on its higher Sourcing tier.",
      "whyItMatters": "Community support means no guaranteed response times, while a paid vendor typically offers formal support channels and accountability.",
      "benefitsWho": "Technical teams comfortable troubleshooting via community resources (OpenCATS) versus organizations that need vendor-backed support SLAs (SeekOut)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core ATS/CRM Functions",
      "rows": [
        {
          "feature": "Candidate management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Job requisition tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Company and contact management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Submission management against open requisitions",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Sourcing",
      "rows": [
        {
          "feature": "AI-powered candidate search across large profile database",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SeekOut: 1B+ profiles"
        },
        {
          "feature": "AI screening / video interviews",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Automated multi-touch outreach campaigns",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI assistant integration (Claude, ChatGPT, etc.)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SeekOut MCP"
        },
        {
          "feature": "Talent rediscovery from existing ATS",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment, Support & Pricing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SeekOut starts at $149/month"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SeekOut: 14 days, no credit card, Core plan"
        },
        {
          "feature": "Named ATS integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SeekOut: Workday, Greenhouse, iCIMS, Lever, Ashby, and more"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is OpenCATS really free?",
      "answer": "Yes, OpenCATS is free and open-source with no published pricing tiers, though it requires self-hosting on your own infrastructure."
    },
    {
      "question": "How much does SeekOut cost?",
      "answer": "SeekOut's Recruit Core plan starts at $149/month billed annually, or $179/month billed monthly. Higher-tier Sourcing, Integration, and Full Recruiting Funnel plans require a custom quote."
    },
    {
      "question": "Does OpenCATS have AI sourcing features?",
      "answer": "No, no AI features are documented on OpenCATS's official site. SeekOut, by contrast, is built around AI search, screening, and outreach across 1B+ candidate profiles."
    },
    {
      "question": "Can SeekOut replace an ATS like OpenCATS?",
      "answer": "This is not documented. SeekOut's feature set and integration list (Workday, Greenhouse, iCIMS, Lever, Ashby, and others) suggest it is designed to connect with an existing ATS rather than replace core ATS functions like requisition tracking."
    },
    {
      "question": "Does OpenCATS require technical setup?",
      "answer": "Yes, OpenCATS uses a self-hosted deployment model, meaning you install and run it on your own infrastructure rather than using a managed SaaS option."
    },
    {
      "question": "What is SeekOut MCP?",
      "answer": "SeekOut MCP integrates SeekOut's sourcing data with AI assistants including Claude, ChatGPT, Gemini, and Microsoft Copilot, letting recruiters access candidate data through those tools. OpenCATS has no documented equivalent."
    }
  ]
};

export default opencatsVsSeekoutContent;
