import type { ToolComparisonContent } from './types';

const dealhubCpqVsQobraContent: ToolComparisonContent = {
  "verdict": "DealHub CPQ manages the front-end quote-to-revenue workflow — configuring quotes, contracts, and buyer collaboration — while Qobra is purpose-built for calculating and managing the sales commissions that result from closed deals. They sit at different stages of the same revenue lifecycle rather than competing for the same budget.",
  "bestForToolA": "Sales organizations needing to automate quote generation, contract lifecycle management, and buyer-facing DealRooms, especially those already using Salesforce, HubSpot, or Microsoft Dynamics 365 alongside NetSuite ERP.",
  "bestForToolB": "RevOps and Finance teams needing to automate commission plan calculations and give reps real-time visibility into their payouts, particularly teams wanting AI agents (QobrAI's Architect, Analyst, and Sales Coach) to build plans and eliminate shadow accounting.",
  "whoNeedsBoth": "A sales organization could use DealHub CPQ to generate and close quotes and contracts through its CRM, then use Qobra — which also offers a native Salesforce embed — to automatically calculate the resulting rep commissions from those same closed deals, covering sequential stages of deal creation and commission payout.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "DealHub CPQ is a quote-to-revenue platform covering CPQ, contract lifecycle management, and buyer collaboration.",
      "toolB": "Qobra is sales commission management software that automates commission plan calculations.",
      "whyItMatters": "They solve different problems in the sales-to-payout chain — deal creation versus compensation.",
      "benefitsWho": "Sales ops teams need DealHub for deal creation; finance/RevOps teams need Qobra for compensation."
    },
    {
      "title": "AI Features",
      "toolA": "DealHub AI uses governed execution with conditional logic to automate deal-flow decisions.",
      "toolB": "QobrAI includes three named agents — the Architect for plan building, the Analyst for data insights, and the Sales Coach for eliminating shadow accounting.",
      "whyItMatters": "AI is applied to different jobs — deal workflow automation versus commission plan building and coaching.",
      "benefitsWho": "Deal desk teams benefit from DealHub AI; compensation teams benefit from QobrAI's plan-building and coaching agents."
    },
    {
      "title": "Third-Party Validation",
      "toolA": "DealHub's facts cite named enterprise customers (Intuit, HP, Braze, Zapier) rather than review-site ratings.",
      "toolB": "Qobra reports 4.8/5 on G2 and 4.9/5 on Capterra, plus a named customer result (GoCardless reducing commission processing from 3-4 days to a maximum of 1 day).",
      "whyItMatters": "Buyers weigh peer-review scores and named case studies differently during procurement.",
      "benefitsWho": "Buyers wanting quantified peer-review scores may lean on Qobra's documented ratings; those wanting recognizable enterprise references may lean on DealHub's customer list."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "DealHub holds a broad certification set — ISO 27001, ISO 27701, ISO 22301, ISO 42001, SOC 1 Type II, SOC 2 Type II, GDPR, and CCPA.",
      "toolB": "Qobra's facts document security/governance features (validation workflows, audit trails, custom roles, SSO) but no specific named certifications.",
      "whyItMatters": "Highly regulated buyers often require documented certifications during vendor security review.",
      "benefitsWho": "Enterprises in regulated industries needing documented certifications may weigh DealHub's compliance list more heavily."
    },
    {
      "title": "Integration Specifics",
      "toolA": "DealHub names integrations with Salesforce, HubSpot, Microsoft Dynamics 365, NetSuite ERP, DocuSign, Gong, and Slack.",
      "toolB": "Qobra documents a native Salesforce embed plus data warehouse, API, HRIS, and Slack integrations, with multi-currency support for global teams.",
      "whyItMatters": "Which CRMs and ERPs each plugs into directly determines fit for a given tech stack.",
      "benefitsWho": "Microsoft Dynamics 365 shops need DealHub, since Qobra doesn't document Dynamics support; teams needing HRIS integration for commission data need Qobra."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deal and Quote Management",
      "rows": [
        {
          "feature": "CPQ / quote generation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Contract lifecycle management and eSign",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Buyer collaboration (DealRoom)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Guided selling workflows",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Commission and Compensation",
      "rows": [
        {
          "feature": "Commission plan automation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "No-code commission plan builder",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Real-time rep commission visibility",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Mobile app for reps",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Trust, Integrations and Access",
      "rows": [
        {
          "feature": "Salesforce integration",
          "toolA": "available",
          "toolB": "available",
          "note": "DealHub via CRM integration; Qobra via native embed"
        },
        {
          "feature": "Microsoft Dynamics 365 integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Named security certifications (SOC 2, ISO 27001)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do DealHub and Qobra do the same job?",
      "answer": "No. DealHub CPQ handles quote-to-revenue — quoting, contracts, and billing — while Qobra handles sales commission calculation and management."
    },
    {
      "question": "Does DealHub calculate sales commissions?",
      "answer": "This isn't documented among its listed features. DealHub's revenue intelligence reporting aligns CRO and CFO teams on revenue data, but it isn't described as a commission calculation engine."
    },
    {
      "question": "Does Qobra generate sales quotes or contracts?",
      "answer": "This isn't documented; Qobra's features center on commission automation, no-code plan design, and rep visibility, not quote or contract generation."
    },
    {
      "question": "Which has published pricing?",
      "answer": "Neither. Both DealHub and Qobra require contacting sales or booking a demo for pricing."
    },
    {
      "question": "Which has stronger documented third-party review scores?",
      "answer": "Qobra documents 4.8/5 on G2 and 4.9/5 on Capterra. DealHub's facts don't include comparable review-site ratings, instead citing named enterprise customers like Intuit, HP, Braze, and Zapier."
    },
    {
      "question": "Can they share data through a common CRM?",
      "answer": "Both integrate with Salesforce — DealHub via CRM integration and Qobra via a native Salesforce embed — making Salesforce the most likely shared connection point for a workflow that spans deal creation and commission calculation."
    }
  ]
};

export default dealhubCpqVsQobraContent;
