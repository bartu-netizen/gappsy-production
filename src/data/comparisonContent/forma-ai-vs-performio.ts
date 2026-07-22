import type { ToolComparisonContent } from './types';

const formaAiVsPerformioContent: ToolComparisonContent = {
  "verdict": "Forma.ai is built as a broader compensation planning suite that bundles incentive compensation management (Forma Operator) with territory planning and quota setting (Forma Architect) and ML-backed planning advisory (Forma Prophet), while Performio focuses more narrowly on calculating complex commission plans accurately for organizations with 70+ commissionable employees. Both hide pricing behind a sales conversation and neither offers a free trial, so the real differentiator is scope: one platform for compensation strategy end-to-end versus a deep, no-code commission calculation engine for larger commissionable populations.",
  "bestForToolA": "RevOps and finance teams that want territory planning, quota setting, and incentive compensation unified in one platform, especially those needing 600+ pre-built integrations to sync CRM and ERP data.",
  "bestForToolB": "Organizations with 70 or more commissionable employees running complex commission plans who want a no-code plan builder so comp changes don't require IT involvement.",
  "whoNeedsBoth": "The facts don't support a realistic dual-use scenario since both platforms cover overlapping incentive compensation management ground; a company would typically pick one as its system of record for commissions rather than running both in parallel.",
  "keyDifferences": [
    {
      "title": "Territory and Quota Planning Scope",
      "toolA": "Forma.ai includes Forma Architect for territory and quota planning as part of the core platform, alongside Forma Prophet for ML-backed sales planning advisory.",
      "toolB": "Performio's documented feature set centers on incentive compensation management, Analytics Studio, and a no-code plan builder, with no dedicated territory-planning module listed.",
      "whyItMatters": "Buyers who need territory and quota planning alongside commission calculation may need a separate tool if they choose Performio.",
      "benefitsWho": "RevOps teams consolidating compensation planning and territory design into a single system."
    },
    {
      "title": "Target Company Size",
      "toolA": "Forma.ai's pros cite enterprises managing billions in commission spend, but no minimum employee count is published.",
      "toolB": "Performio explicitly targets organizations with 70+ commissionable employees running complex plans.",
      "whyItMatters": "Performio publishes a concrete sizing threshold that helps buyers self-qualify, while Forma.ai's fit is less explicit.",
      "benefitsWho": "Mid-market companies checking whether their commissionable headcount matches the vendor's stated sweet spot."
    },
    {
      "title": "Plan Configuration Method",
      "toolA": "Forma.ai offers AI-enabled plan configuration with guided templates and natural-language input for building incentive structures.",
      "toolB": "Performio offers a no-code plan builder that lets teams update compensation plans without IT support.",
      "whyItMatters": "Both remove IT dependency but through different mechanisms: conversational AI input versus a no-code interface.",
      "benefitsWho": "Non-technical compensation administrators who need to make plan changes without engineering tickets."
    },
    {
      "title": "Integration Breadth",
      "toolA": "Forma.ai advertises over 600 pre-built integrations syncing CRM, ERP, and other source systems.",
      "toolB": "Performio pulls data from CRM, ERP, HRIS, and finance systems but doesn't publish a specific integration count.",
      "whyItMatters": "A larger published integration count signals lower implementation effort for companies with many disparate data sources.",
      "benefitsWho": "Companies with fragmented data stacks across CRM, ERP, and finance systems."
    },
    {
      "title": "Third-Party Validation Type",
      "toolA": "Forma.ai was featured positively in the Forrester Wave Report Q1 2025.",
      "toolB": "Performio is recognized as a Momentum Leader and Enterprise Leader on G2 (Summer 2026).",
      "whyItMatters": "Forrester Wave placement and G2 leadership badges represent different kinds of due-diligence evidence for buyers.",
      "benefitsWho": "Procurement teams that weigh analyst reports differently from peer-review platform badges."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compensation & Planning",
      "rows": [
        {
          "feature": "Incentive Compensation Management",
          "toolA": "available",
          "toolB": "available",
          "note": "Forma Operator vs. Performio's core ICM engine"
        },
        {
          "feature": "Territory Planning",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Forma Architect"
        },
        {
          "feature": "Quota Setting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Forma Architect"
        },
        {
          "feature": "No-Code / AI Plan Configuration",
          "toolA": "available",
          "toolB": "available",
          "note": "AI-enabled templates vs. no-code plan builder"
        },
        {
          "feature": "ML-Backed Planning Advisory",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Forma Prophet"
        }
      ]
    },
    {
      "group": "Data & Reporting",
      "rows": [
        {
          "feature": "Pre-built Integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Forma.ai claims 600+; Performio's count is unstated"
        },
        {
          "feature": "Real-time Modeling / Analytics",
          "toolA": "available",
          "toolB": "available",
          "note": "Real-time modeling engine vs. Analytics Studio"
        },
        {
          "feature": "Seller/Rep Dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated Approval Workflows",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Buying Experience",
      "rows": [
        {
          "feature": "Published Pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales"
        },
        {
          "feature": "Free Trial",
          "toolA": "unavailable",
          "toolB": "not-documented"
        },
        {
          "feature": "Minimum Company Size Stated",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "70+ commissionable employees"
        },
        {
          "feature": "Analyst Recognition",
          "toolA": "available",
          "toolB": "available",
          "note": "Forrester Wave Q1 2025 vs. G2 Momentum/Enterprise Leader"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either Forma.ai or Performio publish pricing?",
      "answer": "No, both require contacting sales for a quote; neither company publishes commission platform pricing on its website."
    },
    {
      "question": "Which tool is better suited to smaller commissionable teams?",
      "answer": "Neither publishes a small-team tier. Performio explicitly states it's built for organizations with 70+ commissionable employees, while Forma.ai doesn't publish a minimum but emphasizes enterprises managing billions in commission spend."
    },
    {
      "question": "Does Forma.ai include territory and quota planning like Performio?",
      "answer": "Forma.ai includes a dedicated Forma Architect module for territory and quota planning. Performio's documented features focus on commission calculation, analytics, and plan building, with no territory-planning module listed."
    },
    {
      "question": "Can non-technical teams update compensation plans in either tool?",
      "answer": "Yes. Forma.ai offers AI-enabled plan configuration with guided templates and natural-language input, while Performio offers a no-code plan builder that removes the need for IT support."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Forma.ai explicitly states it does not advertise a free trial or freemium tier. Performio's trial availability isn't documented in its facts."
    },
    {
      "question": "How many integrations does each platform support?",
      "answer": "Forma.ai advertises more than 600 pre-built integrations across CRM, ERP, and other source systems. Performio integrates with CRM, ERP, HRIS, and finance systems but doesn't publish an exact integration count."
    }
  ]
};

export default formaAiVsPerformioContent;
