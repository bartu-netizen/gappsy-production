import type { ToolComparisonContent } from './types';

const charliehrVsHumaansContent: ToolComparisonContent = {
  "verdict": "CharlieHR and Humaans both offer HR administration for growing companies but target different scales and buying motions: CharlieHR is a self-serve, transparently priced platform built for small UK businesses (1-250 employees), while Humaans is a custom-quoted, AI-driven HRIS built for companies operating across 300+ global locations with enterprise-grade SSO and compliance needs.",
  "bestForToolA": "CharlieHR fits small UK businesses that want transparent, low-commitment pricing starting at £20/month, a 7-day free trial, and an included perks/discounts marketplace, without needing a sales conversation to get started.",
  "bestForToolB": "Humaans fits growing or global companies that need a central employee database across 300+ locations, AI-driven self-service (AI Companion) and agentic automation (Athena) for admin work, compensation/headcount planning tools, and enterprise features like SSO -- accepting that pricing requires contacting sales.",
  "whoNeedsBoth": "The facts don't suggest a scenario needing both; a company would more likely graduate from a CharlieHR-style self-serve tool to a Humaans-style enterprise HRIS as it scales past small-UK-team HR admin, rather than running both concurrently.",
  "keyDifferences": [
    {
      "title": "Pricing transparency and buying motion",
      "toolA": "Publishes tiered self-serve pricing from £20/month (1-4 employees) to £735/month (250+ employees).",
      "toolB": "No public pricing; Growth, Enterprise, and Athena plan costs require contacting sales.",
      "whyItMatters": "Self-serve pricing suits small teams wanting to buy without a sales cycle; custom pricing suits larger deployments needing negotiated enterprise terms.",
      "benefitsWho": "Small UK teams want self-serve pricing; larger, multi-location companies expect a sales-assisted enterprise purchase."
    },
    {
      "title": "Geographic/organizational scale",
      "toolA": "Explicitly designed for UK businesses from 1-4 employees up to 250+.",
      "toolB": "Central employee database supports 300+ global locations.",
      "whyItMatters": "Multi-location global scale requires different data-model and compliance capabilities than a single-country small-business tool.",
      "benefitsWho": "Multinational or fast-scaling companies need Humaans' global location support; UK-only small teams are well served by CharlieHR's scope."
    },
    {
      "title": "AI-driven features",
      "toolA": "No AI features are documented.",
      "toolB": "Includes an AI Companion giving employees instant self-service answers to policy/document questions, plus an 'Agentic AI Workforce' (Athena) that handles admin work end-to-end.",
      "whyItMatters": "AI-driven self-service can reduce HR team workload on repetitive employee questions and admin tasks.",
      "benefitsWho": "HR teams at scale looking to deflect routine employee questions and automate admin work."
    },
    {
      "title": "Compensation and headcount planning",
      "toolA": "Not documented as offering compensation or headcount planning tools.",
      "toolB": "Includes tools for managing pay and planning team growth (Compensation & Headcount Planning).",
      "whyItMatters": "Formal compensation/headcount planning tools matter more once a company is managing pay bands and growth across many roles/locations.",
      "benefitsWho": "People-ops and finance teams planning headcount and compensation at scale."
    },
    {
      "title": "Security certifications",
      "toolA": "ISO 27001 certified and GDPR compliant.",
      "toolB": "SOC 2 Type II, ISO 27001:2022, and GDPR compliant, with an Enterprise plan adding SSO and audit log exports.",
      "whyItMatters": "SOC 2 Type II and SSO are frequently required by enterprise security-review processes that small-business tools aren't always asked to meet.",
      "benefitsWho": "Buyers at larger organizations with formal vendor security-review requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Features",
      "rows": [
        {
          "feature": "Onboarding",
          "toolA": "available",
          "toolB": "available",
          "note": "Humaans covers onboarding/offboarding via workflow automation."
        },
        {
          "feature": "Time off / absence management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Performance reviews",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Global multi-location employee database",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Humaans supports 300+ global locations."
        },
        {
          "feature": "Compensation & headcount planning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Perks & discounts marketplace",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CharlieHR includes 30,000+ discounts."
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI employee self-service assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Humaans' AI Companion."
        },
        {
          "feature": "Agentic AI for end-to-end admin tasks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Humaans' Athena ('Agentic AI Workforce')."
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "CharlieHR: £20/month for 1-4 employees. Humaans requires contacting sales."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CharlieHR: 7-day trial, no card required."
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SOC 2 Type II."
        },
        {
          "feature": "ISO 27001 certification",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SSO (Enterprise tier)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does pricing differ between CharlieHR and Humaans?",
      "answer": "CharlieHR publishes tiered pricing starting at £20/month for 1-4 employees. Humaans doesn't publish pricing -- Growth, Enterprise, and Athena plan costs require contacting sales."
    },
    {
      "question": "Does either platform include AI features?",
      "answer": "Humaans includes an AI Companion for instant employee self-service and an 'Agentic AI Workforce' called Athena for end-to-end admin work. CharlieHR does not document AI features."
    },
    {
      "question": "How many locations does Humaans support?",
      "answer": "Humaans supports a central employee database across 300+ global locations."
    },
    {
      "question": "Is there a free trial?",
      "answer": "CharlieHR offers a 7-day free trial with no credit card required. A free trial isn't documented for Humaans."
    },
    {
      "question": "What security certifications does each hold?",
      "answer": "CharlieHR is ISO 27001 certified and GDPR compliant. Humaans is SOC 2 Type II, ISO 27001:2022, and GDPR compliant, with Enterprise-tier SSO."
    },
    {
      "question": "Where is Humaans based?",
      "answer": "Humaans lists offices in London, New York City, and San Francisco."
    }
  ]
};

export default charliehrVsHumaansContent;
