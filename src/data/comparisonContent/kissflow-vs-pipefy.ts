import type { ToolComparisonContent } from './types';

const kissflowVsPipefyContent: ToolComparisonContent = {
  "verdict": "Kissflow and Pipefy both let teams build no-code workflows and apps with AI assistance, but they sit at different points of entry. Kissflow is enterprise-only — no free plan, no published pricing, and a sales consultation required — but backs that up with governance tooling (data policies, audit logs, role-based access), a documented history back to its 2003 founding as Orangescape, and G2/Capterra ratings. Pipefy offers a genuinely free Starter plan (10 users, 5 processes, no credit card) and a documented SMB discount, but its Business and Enterprise tiers are quote-only like Kissflow's entire pricing model.",
  "bestForToolA": "Enterprises that need governance tools (data policies, app/user monitoring, role-based access, audit logs) and are already prepared for a sales-led evaluation, and that value third-party validation like G2 (4.3/5) and Capterra (4.2/5) ratings and multi-language support (English, German, French, Spanish, Italian).",
  "bestForToolB": "Smaller teams or SMBs that want to start building AI-driven workflows for free before any sales conversation, that need named messaging-app integrations (WhatsApp, Teams, Slack), and that qualify for Pipefy's documented SMB discount (11-200 employees, up to 90% off).",
  "whoNeedsBoth": "Organizations that adopted Pipefy's free Starter plan in individual teams for lightweight process automation sometimes later evaluate Kissflow for enterprise-wide governance and compliance needs once they outgrow a self-serve tool — the two aren't typically run in parallel for the same workflows, but a Pipefy-then-Kissflow progression is plausible given their documented pricing structures.",
  "keyDifferences": [
    {
      "title": "Free plan vs. enterprise-only pricing",
      "toolA": "Kissflow has no self-serve or free plan advertised; pricing requires a sales consultation.",
      "toolB": "Pipefy offers a free Starter plan (up to 10 users, 5 processes, 50 cards/month) with no credit card required.",
      "whyItMatters": "A free tier lets a team validate the product before any procurement process, while an enterprise-only model requires committing to a sales cycle just to see cost.",
      "benefitsWho": "Small teams and individual departments that want to try the product before requesting budget."
    },
    {
      "title": "Documented company history",
      "toolA": "Kissflow began as Orangescape, founded in 2003, before launching the Kissflow SaaS product in 2012.",
      "toolB": "Pipefy's founding year is not documented in the facts available.",
      "whyItMatters": "A documented multi-decade history can be a trust signal for enterprise buyers doing vendor due diligence.",
      "benefitsWho": "Procurement and vendor-risk teams evaluating platform longevity."
    },
    {
      "title": "Governance tooling vs. pre-built AI Studios",
      "toolA": "Kissflow has a dedicated Governance Tools feature: data policies, app monitoring, user monitoring, role-based access, and audit logs.",
      "toolB": "Pipefy offers Pre-built AI Studios — specialized templates for use cases like SRM, CRM, quotation, and onboarding.",
      "whyItMatters": "Governance tooling targets IT/compliance oversight of many apps at scale, while pre-built studios target faster time-to-value for specific business processes.",
      "benefitsWho": "IT and compliance teams (Kissflow) versus operations teams wanting a working process quickly (Pipefy)."
    },
    {
      "title": "Messaging-app integrations",
      "toolA": "Kissflow's integration details are not documented beyond a general reference to its platform.",
      "toolB": "Pipefy explicitly integrates with WhatsApp, Microsoft Teams, and Slack via iPaaS and messaging connectors.",
      "whyItMatters": "Named messaging integrations indicate the workflow can be triggered or actioned from tools teams already use daily.",
      "benefitsWho": "Operations teams that run day-to-day communication through WhatsApp, Teams, or Slack."
    },
    {
      "title": "SMB pricing discount",
      "toolA": "Kissflow has no documented SMB discount; all pricing requires a sales conversation regardless of company size.",
      "toolB": "Pipefy's SMB Special Plan offers up to a 90% discount for companies with 11-200 employees.",
      "whyItMatters": "An explicit, sized discount tier gives smaller companies a predictable cost ceiling that Kissflow's enterprise-only model does not.",
      "benefitsWho": "Small and mid-sized businesses with defined headcount evaluating budget upfront."
    }
  ],
  "featureMatrix": [
    {
      "group": "App & Workflow Building",
      "rows": [
        {
          "feature": "AI-generated apps or workflows from a prompt",
          "toolA": "available",
          "toolB": "available",
          "note": "Kissflow AI vs. Pipefy AI Agent Builder."
        },
        {
          "feature": "Conditional / decision logic",
          "toolA": "available",
          "toolB": "available",
          "note": "Kissflow: Decision Tables; Pipefy: conditional logic on the Business plan."
        },
        {
          "feature": "Form builder",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "External / client-facing portals",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free self-serve plan",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Pipefy's Starter price (free) is published; Business/Enterprise are quote-only."
        },
        {
          "feature": "SMB-specific discount",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Governance & Access",
      "rows": [
        {
          "feature": "Role-based access / audit logs",
          "toolA": "available",
          "toolB": "available",
          "note": "Pipefy: role-based access listed on the Business plan."
        },
        {
          "feature": "SSO / two-factor authentication",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pipefy: Enterprise plan."
        },
        {
          "feature": "Electronic signature",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pipefy: Business plan."
        },
        {
          "feature": "Messaging-app integrations (WhatsApp/Teams/Slack)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Kissflow pricing public?",
      "answer": "No. Pricing is enterprise-focused and requires a consultation with the sales team."
    },
    {
      "question": "Does Pipefy have a free plan?",
      "answer": "Yes. The Starter plan is free for up to 10 users, 5 processes, and 50 cards per month, with no credit card required."
    },
    {
      "question": "When was Kissflow founded?",
      "answer": "It began as Orangescape in 2003, before launching the Kissflow SaaS product in 2012."
    },
    {
      "question": "Does Pipefy integrate with WhatsApp?",
      "answer": "Yes, along with Microsoft Teams and Slack, as part of its integrations and iPaaS connectors."
    },
    {
      "question": "What languages does Kissflow support?",
      "answer": "English, German, French, Spanish, and Italian."
    },
    {
      "question": "Is there a discount for small businesses on Pipefy?",
      "answer": "Yes. The SMB Special Plan offers up to a 90% discount for companies with 11-200 employees."
    }
  ]
};

export default kissflowVsPipefyContent;
