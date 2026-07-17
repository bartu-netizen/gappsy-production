import type { ToolComparisonContent } from './types';

const gainsightVsTotangoContent: ToolComparisonContent = {
  "verdict": "Gainsight and Totango are both enterprise customer success platforms built around health scoring, playbooks, and renewal tracking, and on paper their core capabilities overlap heavily. The real difference is less about a raw feature checklist and more about ecosystem depth and packaging. Gainsight has built out a broader connected suite, including Gainsight PX for in-product analytics, a dedicated Journey Orchestrator for lifecycle messaging, and Customer Communities for self-service support, aimed at teams that want one vendor covering customer success, product adoption, and community in a single contract. Totango leans on SuccessBLOCs, pre-packaged playbook frameworks, its Unison AI engine for surfacing churn and expansion signals, and account hierarchies purpose-built for complex parent-child customer structures. Both vendors are quote-only with no published pricing, both require real implementation effort, and both target mid-market and enterprise B2B SaaS companies rather than small teams. Reviewers describe Totango integration with Salesforce as especially strong but flag its interface and support consistency as rough edges; Gainsight reviewers cite a steeper admin learning curve but a more complete product ecosystem once configured. Choosing between them largely comes down to whether a team wants the wider Gainsight suite spanning PX, communities, and journey orchestration, or Totango's more focused AI-driven signal detection and complex-account hierarchy modeling.",
  "bestForToolA": "Gainsight fits B2B SaaS companies that want one connected platform spanning customer health scoring, in-product analytics through Gainsight PX, lifecycle messaging, and a branded customer community, rather than stitching several point tools together.",
  "bestForToolB": "Totango fits enterprise teams managing complex, hierarchical account structures who want AI-driven churn and expansion signals through Unison plus pre-built SuccessBLOCs playbook frameworks to get workflows running quickly.",
  "whoNeedsBoth": "Large organizations with different business units that each already standardized on one platform, or teams running a formal side-by-side evaluation before consolidating, may temporarily operate both, though the two products target the same core use case and are not typically run as complements.",
  "keyDifferences": [
    {
      "title": "Overall platform breadth",
      "toolA": "Gainsight bundles core customer success with Gainsight PX for product analytics, Journey Orchestrator for lifecycle messaging, and Customer Communities for self-service support",
      "toolB": "Totango's documented feature set centers on customer success workflows, SuccessBLOCs, and Unison AI, without a documented product analytics or community module",
      "whyItMatters": "Buyers wanting all-in-one coverage across customer success, product adoption, and community avoid extra vendor contracts",
      "benefitsWho": "Teams wanting fewer vendors benefit from Gainsight; teams wanting a leaner, more focused customer success tool benefit from Totango"
    },
    {
      "title": "AI-driven risk and opportunity signals",
      "toolA": "Gainsight's health scorecards are configurable but no dedicated AI signal-detection engine is documented in the provided facts",
      "toolB": "Totango explicitly documents a Unison AI engine that analyzes account signals to surface churn risk and expansion opportunity",
      "whyItMatters": "Automated signal detection can reduce the manual review time needed to spot at-risk or expansion-ready accounts",
      "benefitsWho": "Teams prioritizing AI-flagged risk and opportunity detection benefit from Totango's Unison engine"
    },
    {
      "title": "Complex account structure modeling",
      "toolA": "No explicit parent-child or multi-product account hierarchy feature is documented for Gainsight",
      "toolB": "Totango documents dedicated account hierarchies for modeling parent-child and multi-product relationships so health data rolls up accurately",
      "whyItMatters": "Enterprise customers with nested business units need accurate rollup reporting rather than flat account records",
      "benefitsWho": "Companies selling to large enterprise customers with nested account structures benefit from Totango"
    },
    {
      "title": "Playbook packaging",
      "toolA": "Gainsight offers Playbooks and Cockpit, automated task and workflow triggers tied to health, usage, or lifecycle changes",
      "toolB": "Totango offers SuccessBLOCs, explicitly described as pre-built frameworks bundling workflows, campaigns, and content for common motions",
      "whyItMatters": "Pre-packaged frameworks can speed time to value, while custom-built triggers offer more granular control",
      "benefitsWho": "Teams wanting turnkey templates benefit from Totango SuccessBLOCs; teams wanting granular custom automation benefit from Gainsight Playbooks"
    },
    {
      "title": "In-product usage analytics",
      "toolA": "Gainsight includes a dedicated Gainsight PX module for usage tracking, walkthroughs, and feature adoption reporting",
      "toolB": "No in-product analytics or walkthrough feature is documented for Totango",
      "whyItMatters": "Product-led growth teams often want usage analytics built into the same platform as customer success workflows",
      "benefitsWho": "Product-led growth SaaS teams benefit from Gainsight PX"
    },
    {
      "title": "Customer community and self-service",
      "toolA": "Gainsight documents Customer Communities, a branded space for peer questions, best practices, and self-service knowledge content",
      "toolB": "No community or self-service portal feature is documented for Totango",
      "whyItMatters": "A built-in community layer can reduce support ticket volume through peer-to-peer help",
      "benefitsWho": "Companies wanting a branded self-service community benefit from Gainsight"
    },
    {
      "title": "Feedback and survey collection",
      "toolA": "Gainsight includes a Surveys feature for NPS, CSAT, and other feedback that feeds directly into health scores",
      "toolB": "No dedicated survey or NPS collection feature is documented for Totango",
      "whyItMatters": "Structured feedback loops let health scores reflect direct customer sentiment, not only usage and support data",
      "benefitsWho": "Teams wanting sentiment data baked into health scoring benefit from Gainsight Surveys"
    },
    {
      "title": "Documented enterprise security certifications",
      "toolA": "No explicit SOC 2, GDPR, or SSO and SCIM statement appears in the provided Gainsight facts",
      "toolB": "Totango explicitly documents SOC 2 certification, GDPR compliance, and SSO and SCIM support for enterprise identity management",
      "whyItMatters": "Security and compliance reviewers during enterprise procurement often require documented certifications up front",
      "benefitsWho": "Enterprise IT and security reviewers get clearer documented assurance from Totango's stated certifications, though Gainsight may hold equivalent certifications not covered in these facts"
    },
    {
      "title": "Recent corporate consolidation",
      "toolA": "Gainsight is not documented as having undergone a recent merger in the provided facts",
      "toolB": "Totango merged with Catalyst in 2024 to form a combined customer growth platform, initially continuing under both original brand names",
      "whyItMatters": "Recent mergers and acquisitions can affect roadmap continuity, so buyers should understand where a combined product currently stands",
      "benefitsWho": "Buyers wanting a single, unmerged vendor lineage may lean Gainsight; those interested in the combined Totango and Catalyst roadmap should evaluate current integration status directly with Totango"
    },
    {
      "title": "Pricing transparency and packaging",
      "toolA": "Gainsight offers three named tiers, Essentials, Standard, and Premier or Enterprise, each custom-quoted with increasing feature scope",
      "toolB": "Totango publishes two named tiers, Enterprise and Premier, with documented seat counts and account limits but still a custom quote",
      "whyItMatters": "Named tier structures with documented feature or limit differences help buyers estimate where their needs land even without public prices",
      "benefitsWho": "Buyers who want a clearer sense of what changes between tiers can use either vendor's published tier breakdown as a starting point before a sales call"
    }
  ],
  "featureMatrix": [
    {
      "group": "Health scoring and account management",
      "rows": [
        {
          "feature": "Configurable customer health scoring",
          "toolA": "available",
          "toolB": "available",
          "note": "Gainsight calls this Customer Health Scorecards; Totango calls it configurable health scoring"
        },
        {
          "feature": "Parent-child or multi-product account hierarchy modeling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Totango's account hierarchies feature; no equivalent documented for Gainsight"
        },
        {
          "feature": "Per-account activity timeline or log",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gainsight's Timeline feature; not documented for Totango"
        }
      ]
    },
    {
      "group": "Automation and playbooks",
      "rows": [
        {
          "feature": "Automated task or workflow triggers tied to account changes",
          "toolA": "available",
          "toolB": "available",
          "note": "Gainsight Playbooks and Cockpit vs Totango SuccessBLOCs"
        },
        {
          "feature": "Pre-built playbook frameworks with bundled content",
          "toolA": "limited",
          "toolB": "available",
          "note": "Totango SuccessBLOCs are explicitly described as pre-built; Gainsight playbooks are documented as configurable triggers, not as ready-made frameworks"
        }
      ]
    },
    {
      "group": "AI and predictive intelligence",
      "rows": [
        {
          "feature": "AI engine for churn risk or expansion signal detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Totango's Unison AI; no comparable dedicated engine documented for Gainsight"
        },
        {
          "feature": "In-product usage analytics and adoption reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gainsight PX; not documented for Totango"
        }
      ]
    },
    {
      "group": "Engagement and communication",
      "rows": [
        {
          "feature": "Automated lifecycle email or in-app messaging campaigns",
          "toolA": "available",
          "toolB": "available",
          "note": "Gainsight Journey Orchestrator vs Totango campaign and outreach tools"
        },
        {
          "feature": "Customer community or self-service portal",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gainsight Customer Communities; not documented for Totango"
        },
        {
          "feature": "NPS, CSAT, or survey collection tied to health scores",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Gainsight Surveys feature; not documented for Totango"
        }
      ]
    },
    {
      "group": "Reporting and renewals",
      "rows": [
        {
          "feature": "Dedicated renewal tracking and forecasting module",
          "toolA": "available",
          "toolB": "limited",
          "note": "Gainsight's Renewal Center is a named module; Totango covers renewal forecasting within its executive dashboards feature rather than a standalone module"
        },
        {
          "feature": "Configurable reporting dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "Gainsight Reports and Dashboards vs Totango executive dashboards and reporting"
        }
      ]
    },
    {
      "group": "Integrations and platform",
      "rows": [
        {
          "feature": "Native CRM and support tool integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Both list Salesforce, HubSpot, Slack, and Zendesk among native integrations"
        },
        {
          "feature": "API access for custom integrations",
          "toolA": "limited",
          "toolB": "available",
          "note": "Totango documents a distinct API access feature; Gainsight is tagged as having an API but this is not detailed as a named feature"
        },
        {
          "feature": "SOC 2, GDPR, and SSO or SCIM enterprise security controls",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented explicitly for Totango; not covered in the provided Gainsight facts"
        }
      ]
    },
    {
      "group": "Pricing and trial access",
      "rows": [
        {
          "feature": "Published list pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both are custom quote only"
        },
        {
          "feature": "Public self-service free trial",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Totango has offered self-service trials in the past and is tagged free-trial, but current availability should be confirmed directly; Gainsight does not advertise a public trial"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Gainsight or Totango?",
      "answer": "Neither publishes list pricing, so there is no direct public price comparison; both are quote-based enterprise platforms where cost depends on account volume, seats, and which modules or tiers you select, so you need to request a quote from each to compare."
    },
    {
      "question": "Is Gainsight or Totango easier for beginners?",
      "answer": "Neither is designed as a beginner or self-serve tool; both are documented as having a learning curve during setup, Gainsight for configuring scorecards, playbooks, and reporting logic, and Totango for configuring SuccessBLOCs, fields, and integrations, so both expect a dedicated customer success operations resource."
    },
    {
      "question": "Does Totango have AI features like Gainsight?",
      "answer": "Totango's documented AI capability is its Unison engine, which analyzes account signals to surface churn risk and expansion opportunities; the provided Gainsight facts do not document a comparable dedicated AI signal-detection engine, even though Gainsight is tagged as an AI-related product on its listing."
    },
    {
      "question": "Can Gainsight do product usage analytics like Totango?",
      "answer": "Yes, Gainsight includes a dedicated Gainsight PX module for in-product usage tracking, walkthroughs, and feature adoption reporting; the provided Totango facts do not document an equivalent in-product analytics module."
    },
    {
      "question": "Does Totango replace Salesforce?",
      "answer": "No, Totango does not replace Salesforce; it integrates with Salesforce alongside HubSpot, Zendesk, Slack, Microsoft Outlook, and Gmail, syncing CRM and support data into its health scoring and workflows rather than acting as a CRM itself."
    },
    {
      "question": "What is the difference between Totango and Catalyst?",
      "answer": "Totango and Catalyst merged in 2024 to form a combined customer growth platform, with the two products initially continuing to operate under their original brand names while integrating Totango's enterprise governance strengths with Catalyst's ROI-based scoring and workflow capabilities, so current buyers should confirm how far that integration has progressed."
    }
  ]
};

export default gainsightVsTotangoContent;
