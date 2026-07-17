import type { ToolComparisonContent } from './types';

const litifyVsNextpointContent: ToolComparisonContent = {
  "verdict": "Litify is a Salesforce-built legal operations platform covering intake, matter management, billing, and spend management for law firms running their overall practice, with embedded AI (Litify AI) across workflows. Nextpoint is a specialized eDiscovery platform focused on document review, electronic production, and deposition management for litigation, with unlimited data hosting at no extra fee. They address different stages of legal work: firm-wide practice and matter management (Litify) versus litigation-specific document review and discovery (Nextpoint).",
  "bestForToolA": "Litify fits law firms wanting a full practice-management platform, covering intake, matter management, time and billing, and spend management, built on the Salesforce platform with embedded AI.",
  "bestForToolB": "Nextpoint fits litigation teams and firms handling eDiscovery who want unlimited document and data hosting with no per-GB fees, plus document review and deposition management tools, as used by firms like Morgan & Morgan and McDermott Will & Emery.",
  "whoNeedsBoth": "A litigation-heavy firm could run Litify as its firm-wide matter management and billing system while using Nextpoint specifically for eDiscovery document review and depositions on individual cases, since the two cover complementary stages of a legal matter's lifecycle.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Litify centers on intake, matter management, time & billing, and spend management for running a legal practice.",
      "toolB": "Nextpoint centers on document review, electronic production, and deposition management for litigation and eDiscovery.",
      "whyItMatters": "A firm needs to know whether it's buying a practice-management system or an eDiscovery tool.",
      "benefitsWho": "Firms running end-to-end case operations benefit from Litify; litigation teams processing discovery documents benefit from Nextpoint."
    },
    {
      "title": "Platform Foundation",
      "toolA": "Litify is built on the Salesforce platform, giving firms familiar CRM-style infrastructure.",
      "toolB": "Nextpoint's underlying platform architecture is not documented beyond being cloud-based.",
      "whyItMatters": "Building on Salesforce means firms inherit both its familiarity and its platform overhead.",
      "benefitsWho": "Firms already using Salesforce elsewhere benefit from Litify's shared platform."
    },
    {
      "title": "Data Hosting Costs",
      "toolA": "Litify's data and document hosting cost structure is not documented.",
      "toolB": "Nextpoint explicitly charges no case fees, upload fees, or data hosting fees on any of its three tiers (Essential, Advanced, Apex).",
      "whyItMatters": "eDiscovery data volumes can be large, so per-GB fees can be a major hidden cost.",
      "benefitsWho": "Firms handling large discovery datasets benefit from Nextpoint's fee-free hosting model."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Litify AI provides agentic AI workflows embedded across intake, documents, and reporting, plus AI-powered document generation and PDF editing.",
      "toolB": "Nextpoint's documented feature set does not mention AI capabilities.",
      "whyItMatters": "AI-assisted workflows can reduce manual drafting and analysis time.",
      "benefitsWho": "Firms wanting embedded AI across case operations benefit from Litify AI."
    },
    {
      "title": "Pricing Model",
      "toolA": "Litify pricing is not published and requires a demo request.",
      "toolB": "Nextpoint uses simple per-user pricing with no dollar figures published, also requiring a sales quote, but explicitly avoids per-document or per-GB charges.",
      "whyItMatters": "Neither publishes exact prices, but Nextpoint's stated pricing philosophy is more predictable as data volumes grow.",
      "benefitsWho": "Firms wanting predictable costs as case data grows benefit from Nextpoint's per-user-only pricing philosophy."
    }
  ],
  "featureMatrix": [
    {
      "group": "Case & Matter Operations",
      "rows": [
        {
          "feature": "Intake management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Matter/case management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Time & billing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Spend management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Document & Discovery",
      "rows": [
        {
          "feature": "Document review",
          "toolA": "available",
          "toolB": "available",
          "note": "Litify: AI-powered document generation/PDF editing"
        },
        {
          "feature": "Electronic production",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Deposition management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Expert witness discovery tools",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom data analytics/reporting",
          "toolA": "available",
          "toolB": "available",
          "note": "Nextpoint's advanced analytics limited to higher tiers"
        }
      ]
    },
    {
      "group": "AI, Platform & Pricing",
      "rows": [
        {
          "feature": "Embedded AI workflows",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Litify AI"
        },
        {
          "feature": "Built on Salesforce",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No data hosting fees",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "No case, upload, or hosting fees on any tier"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a sales/demo request for a quote"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What platform is Litify built on?",
      "answer": "Litify is built on the Salesforce platform."
    },
    {
      "question": "Does Nextpoint charge for data storage?",
      "answer": "No, all plans include zero data hosting charges regardless of case size."
    },
    {
      "question": "How much does Litify cost?",
      "answer": "Litify does not publish pricing; interested firms must request a demo for a quote."
    },
    {
      "question": "What plans does Nextpoint offer?",
      "answer": "Nextpoint offers three tiers: Essential, Advanced, and Apex, each adding more analytics and review features, all at custom quoted pricing."
    },
    {
      "question": "Does Litify include AI features?",
      "answer": "Yes, Litify AI provides agentic AI workflows spanning intake, document generation, and reporting."
    },
    {
      "question": "Who uses Nextpoint?",
      "answer": "Law firms and legal departments of varying sizes, including firms such as Morgan & Morgan and McDermott Will & Emery."
    }
  ]
};

export default litifyVsNextpointContent;
