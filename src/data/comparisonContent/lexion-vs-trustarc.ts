import type { ToolComparisonContent } from './types';

const lexionVsTrustarcContent: ToolComparisonContent = {
  "verdict": "Lexion is an AI-powered contract lifecycle management platform — intake, approval automation, an AI-driven contract repository, and drafting assistance — now operating under Docusign after its acquisition. TrustArc is an enterprise privacy management platform covering cookie consent, data mapping, privacy impact assessments, vendor risk, and data subject access request (DSAR) automation, tracing its roots to TRUSTe (founded 1997). Both are legal/compliance-adjacent operations software, but they automate different workflows entirely: contracts versus privacy/data compliance.",
  "bestForToolA": "Legal, sales, procurement, HR, and finance teams that need to automate contract intake, approval routing, AI-driven term/date extraction, and drafting/negotiation assistance fit Lexion best.",
  "bestForToolB": "Privacy, legal, and compliance teams that need to manage cookie consent banners, maintain a data inventory, run privacy impact assessments, manage vendor risk, and automate DSAR fulfillment across jurisdictions fit TrustArc best.",
  "whoNeedsBoth": "A legal operations team could use Lexion to manage the full contract lifecycle (intake, approval, signature, repository) while using TrustArc in parallel to handle unrelated privacy-compliance obligations like cookie consent and DSAR fulfillment — the two address adjacent but non-overlapping legal-ops functions.",
  "keyDifferences": [
    {
      "title": "Core Workflow Focus",
      "toolA": "Lexion centers on contract lifecycle management: email-driven intake, no-code approval automation, an AI-powered contract repository, and contract signature support.",
      "toolB": "TrustArc centers on privacy compliance: a Cookie Consent Manager, a Data Inventory Hub for mapping personal data flows, a Privacy Impact Assessment Manager, and DSAR automation.",
      "whyItMatters": "These are fundamentally different compliance domains, so the right choice depends entirely on which workflow a team needs to automate.",
      "benefitsWho": "Contracts/legal ops teams benefit from Lexion; privacy/data protection teams benefit from TrustArc."
    },
    {
      "title": "AI Assistant Purpose",
      "toolA": "Lexion's AI Contract Assist, built on AI developed at the Allen Institute for AI (AI2), supports contract drafting and negotiation and auto-extracts key terms and dates.",
      "toolB": "TrustArc's Ask Arc AI Assistant provides cited, context-aware answers to privacy questions inside the platform, aimed at reducing reliance on outside counsel.",
      "whyItMatters": "One AI assistant helps produce and negotiate documents; the other helps interpret privacy law and internal policy.",
      "benefitsWho": "Teams drafting/negotiating contracts benefit from Lexion's AI Contract Assist; privacy teams answering compliance questions benefit from TrustArc's Ask Arc."
    },
    {
      "title": "API & Integration Access",
      "toolA": "Lexion documents integrations with Salesforce, HubSpot, Microsoft Word, Coupa, Slack, Microsoft Teams, and DocuSign, plus API access.",
      "toolB": "TrustArc does not offer a public API, according to user reviews, which limits programmatic integration of its consent and privacy workflows into custom applications.",
      "whyItMatters": "API access determines whether engineering teams can embed the tool's workflows into their own products and processes.",
      "benefitsWho": "Teams needing to embed contract workflows into existing business tools benefit from Lexion's documented integrations and API."
    },
    {
      "title": "Company Structure & History",
      "toolA": "Lexion was founded in 2019 and now operates under Docusign following its acquisition.",
      "toolB": "TrustArc began in 1997 as TRUSTe, an online privacy certification organization, and rebranded to TrustArc in 2017 as it expanded into full privacy management software.",
      "whyItMatters": "Company history and ownership affect product roadmap stability, resource backing, and long-term vendor risk.",
      "benefitsWho": "Buyers weighing vendor stability and roadmap direction should factor in Lexion's recent Docusign acquisition versus TrustArc's longer independent operating history."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Lexion publishes no pricing tiers, costs, or free trial information — pricing requires contacting the company directly.",
      "toolB": "TrustArc also does not publish standard pricing, selling modules through custom enterprise contracts; third-party marketplace data suggests typical annual contracts range from roughly ten thousand to well over a hundred thousand dollars depending on modules and volume.",
      "whyItMatters": "Neither tool allows self-service budgeting, so buyers should expect a sales-led enterprise purchasing process for both.",
      "benefitsWho": "Procurement teams evaluating either tool should budget time for a custom quote process rather than expecting published pricing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Workflow Automation",
      "rows": [
        {
          "feature": "Contract intake automation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Lexion: email-driven intake"
        },
        {
          "feature": "Cookie consent management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Data mapping / inventory",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "TrustArc: Data Inventory Hub"
        },
        {
          "feature": "DSAR (data subject request) automation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Approval workflow automation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Lexion: no-code approval routing"
        },
        {
          "feature": "Contract signature support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI drafting/negotiation assistant",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Lexion AI Contract Assist"
        },
        {
          "feature": "AI Q&A assistant for compliance questions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TrustArc Ask Arc"
        },
        {
          "feature": "AI-powered key term/date extraction",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations & Enterprise Readiness",
      "rows": [
        {
          "feature": "Public API",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "TrustArc has no public API per user reviews"
        },
        {
          "feature": "Named third-party integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Lexion: Salesforce, HubSpot, MS Word, Coupa, Slack, Teams, DocuSign"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales"
        },
        {
          "feature": "Vendor/third-party risk management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Lexion and TrustArc do the same thing?",
      "answer": "No. Lexion manages the contract lifecycle — intake, approvals, AI-driven repository, and signature — while TrustArc manages privacy compliance, including cookie consent, data mapping, and DSAR automation."
    },
    {
      "question": "Does either tool have a public API?",
      "answer": "Lexion documents API access alongside integrations like Salesforce and DocuSign. TrustArc, according to user reviews, does not offer a public API."
    },
    {
      "question": "Is pricing published for either tool?",
      "answer": "No. Lexion is listed as Custom/Enterprise with no published pricing, and TrustArc is 'Contact for pricing,' sold through custom enterprise contracts."
    },
    {
      "question": "Who owns Lexion now?",
      "answer": "Lexion is now part of Docusign, following its acquisition, while continuing to operate under the Lexion name."
    },
    {
      "question": "Does TrustArc's history predate its current name?",
      "answer": "Yes. TrustArc was founded in 1997 as TRUSTe, an online privacy certification organization, and rebranded to TrustArc in 2017."
    },
    {
      "question": "Which tool has an AI assistant for drafting contracts?",
      "answer": "Lexion's AI Contract Assist supports contract drafting and negotiation. TrustArc's Ask Arc AI Assistant answers privacy questions with citations rather than drafting documents."
    }
  ]
};

export default lexionVsTrustarcContent;
