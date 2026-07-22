import type { ToolComparisonContent } from './types';

const cosmolexVsLitifyContent: ToolComparisonContent = {
  "verdict": "CosmoLex is a matter-centric practice-management platform built around native trust and business accounting for small-to-midsize firms, while Litify is a Salesforce-native legal operations platform with embedded agentic AI (Litify AI) and no-code reporting, aimed at firms wanting CRM-grade infrastructure and enterprise-scale case and spend management. Neither publishes pricing, but they differ significantly in underlying platform and accounting depth.",
  "bestForToolA": "Small to midsize firms that want built-in three-way trust reconciliation and 100+ real-time financial reports without separate accounting software, and that value a 10-day free trial before buying.",
  "bestForToolB": "Firms already comfortable with the Salesforce ecosystem that want a no-code reporting engine and agentic AI (Litify AI) spanning intake, documents, and reporting, backed by a company with 170+ employees across two US offices.",
  "whoNeedsBoth": "Not realistic in most cases, since both are matter-management systems of record for legal practice and a firm would typically standardize on one; a firm already running Salesforce elsewhere in the business might evaluate Litify specifically for platform continuity rather than pairing it with CosmoLex.",
  "keyDifferences": [
    {
      "title": "Underlying Platform",
      "toolA": "CosmoLex is a standalone cloud practice-management application.",
      "toolB": "Litify is built on the Salesforce platform, giving firms CRM-style infrastructure.",
      "whyItMatters": "Building on Salesforce brings enterprise CRM capabilities but also platform overhead for firms unfamiliar with Salesforce.",
      "benefitsWho": "Benefits larger firms already using Salesforce elsewhere versus smaller firms wanting a purpose-built, standalone tool."
    },
    {
      "title": "Trust & Business Accounting",
      "toolA": "CosmoLex includes built-in trust and business accounting with three-way reconciliation as a core, named feature.",
      "toolB": "Litify documents Time & Billing and Spend Management, but does not name a dedicated trust-accounting or three-way-reconciliation feature.",
      "whyItMatters": "Trust accounting compliance is a core requirement for law firms holding client funds, so native support avoids needing a bolt-on accounting tool.",
      "benefitsWho": "Benefits firms that want compliance-grade trust accounting built directly into their practice-management system."
    },
    {
      "title": "Free Trial",
      "toolA": "CosmoLex offers a free 10-day trial with functionality matching the paid subscription, aside from a bank-feed limitation.",
      "toolB": "No public free trial is mentioned for Litify; interested firms must request a demo.",
      "whyItMatters": "A self-serve trial lets a firm test software directly, while a demo-only model requires a sales conversation before hands-on evaluation.",
      "benefitsWho": "Benefits firms that prefer to evaluate software independently before engaging sales."
    },
    {
      "title": "AI Capabilities",
      "toolA": "No named AI feature is documented for CosmoLex.",
      "toolB": "Litify includes Litify AI, described as agentic AI workflows embedded across intake, document generation, and reporting.",
      "whyItMatters": "Embedded agentic AI can automate multi-step workflows rather than just single tasks.",
      "benefitsWho": "Benefits firms looking to automate multi-step intake, document, and reporting workflows with AI."
    },
    {
      "title": "Company Scale & Transparency",
      "toolA": "CosmoLex is part of ProfitSolv, headquartered in West Palm Beach, FL; its founding year is not disclosed.",
      "toolB": "Litify was founded in 2016, headquartered in New York, NY with a second office in New Orleans, and reports 170+ employees.",
      "whyItMatters": "Company scale and tenure can signal stability and support capacity when evaluating a long-term software vendor.",
      "benefitsWho": "Benefits firms doing vendor-risk due diligence as part of procurement."
    }
  ],
  "featureMatrix": [
    {
      "group": "Case & Matter Management",
      "rows": [
        {
          "feature": "Matter / case management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Client intake automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Litify: dynamic questionnaires and client portals"
        },
        {
          "feature": "Document management",
          "toolA": "available",
          "toolB": "available",
          "note": "Litify adds AI-powered document generation"
        },
        {
          "feature": "Client portal",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Financial & Accounting",
      "rows": [
        {
          "feature": "Trust accounting (three-way reconciliation)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Time & billing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Spend / expense management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Litify's Spend Management"
        },
        {
          "feature": "Financial reporting",
          "toolA": "available",
          "toolB": "available",
          "note": "CosmoLex: 100+ reports; Litify: no-code reporting engine"
        }
      ]
    },
    {
      "group": "AI & Access",
      "rows": [
        {
          "feature": "Named AI feature",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Litify AI"
        },
        {
          "feature": "AI document generation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "CosmoLex: 10 days"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales or a demo"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either tool publish its pricing?",
      "answer": "No, both CosmoLex and Litify require contacting sales or requesting a demo for pricing."
    },
    {
      "question": "Which platform is built on Salesforce?",
      "answer": "Litify is built on the Salesforce platform; CosmoLex is a standalone application."
    },
    {
      "question": "Which tool includes native trust accounting?",
      "answer": "CosmoLex includes built-in trust and business accounting with three-way reconciliation; this isn't documented as a Litify feature."
    },
    {
      "question": "Does CosmoLex offer a free trial?",
      "answer": "Yes, a 10-day free trial with functionality matching the paid subscription aside from a bank-feed limitation; Litify does not mention a free trial."
    },
    {
      "question": "What AI capabilities does Litify offer?",
      "answer": "Litify AI provides agentic AI workflows across intake, AI-powered document generation, and reporting."
    },
    {
      "question": "When was each company founded and where is it based?",
      "answer": "Litify was founded in 2016 and is headquartered in New York, NY, with a second office in New Orleans. CosmoLex's founding year is not disclosed, and it is based in West Palm Beach, FL as part of ProfitSolv."
    }
  ]
};

export default cosmolexVsLitifyContent;
