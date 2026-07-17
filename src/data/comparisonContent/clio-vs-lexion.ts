import type { ToolComparisonContent } from './types';

const clioVsLexionContent: ToolComparisonContent = {
  "verdict": "Clio is cloud-based legal practice management software covering case management, time tracking, billing, trust accounting, and client intake, priced transparently from $39/user/month up to $129/user/month for its Complete plan. Lexion is an AI-powered contract lifecycle management platform for legal, sales, procurement, HR, and finance teams, now part of Docusign, with no published pricing. Clio runs the operational and financial side of running a law firm, while Lexion focuses narrowly on automating contract intake, approval, and AI-driven analysis — they overlap only at the edges.",
  "bestForToolA": "Law firms, from solo practitioners to full firms, that need integrated billing, trust accounting, time tracking, and client intake in one system fit Clio's tiered EasyStart-to-Complete plans best.",
  "bestForToolB": "Cross-functional operations teams — in legal, sales, procurement, HR, or finance — that need AI-driven contract intake, approval automation, and automatic key-term/date extraction fit Lexion best.",
  "whoNeedsBoth": "A law firm's practice group could run day-to-day matter management, billing, and trust accounting in Clio while using Lexion to automate high-volume contract intake and AI-driven term extraction for corporate/contracts work, since the two tools solve related but non-overlapping legal-ops problems.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Clio is full law firm practice management software: case/matter management, billing, trust accounting, and client intake in one platform.",
      "toolB": "Lexion is a focused AI contract lifecycle management tool: intake, approval automation, an AI-powered repository, and drafting assistance.",
      "whyItMatters": "A firm needing to run its entire practice operationally has very different needs than a team needing only contract automation.",
      "benefitsWho": "Law firms managing full practice operations benefit from Clio; teams needing only contract workflow automation benefit from Lexion."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Clio publishes tiered per-user pricing: EasyStart $39/user/month, Essentials $69/user/month, Advanced $99/user/month, Complete $129/user/month (all billed annually).",
      "toolB": "Lexion discloses no pricing tiers or costs on its site — pricing requires contacting the company directly.",
      "whyItMatters": "Published pricing lets buyers self-serve budget estimates; undisclosed pricing requires a sales conversation before any cost comparison is possible.",
      "benefitsWho": "Budget-conscious solo attorneys and small firms benefit from Clio's transparent tiers."
    },
    {
      "title": "Billing & Trust Accounting",
      "toolA": "Clio includes dedicated Trust Accounting (IOLTA-compliant retainer tracking) and Billing & Invoicing with online payments and automated reminders.",
      "toolB": "Billing and trust accounting features are not documented for Lexion — its feature set centers on contracts, not firm finances.",
      "whyItMatters": "Trust accounting compliance is a core, often mandatory, requirement for law firms handling client funds.",
      "benefitsWho": "Law firms with IOLTA/trust accounting obligations benefit from Clio's built-in compliance tooling."
    },
    {
      "title": "AI Contract Analysis",
      "toolA": "AI-driven contract drafting or term extraction is not documented among Clio's listed features.",
      "toolB": "Lexion's AI-powered repository automatically tracks key dates and terms extracted from contracts, and AI Contract Assist supports drafting and negotiation.",
      "whyItMatters": "Teams handling high contract volumes benefit specifically from automated extraction and drafting support that a general practice management tool doesn't provide.",
      "benefitsWho": "Teams processing large contract volumes benefit from Lexion's AI extraction and drafting capabilities."
    },
    {
      "title": "Target Buyer",
      "toolA": "Clio's plan structure (EasyStart through Complete, with Clio Grow client intake bundled at the top tier) is built specifically for law firms.",
      "toolB": "Lexion explicitly serves operations teams across legal, sales, procurement, HR, finance, and IT — not just law firms.",
      "whyItMatters": "The intended buyer shapes which features are prioritized and how the product is positioned and sold.",
      "benefitsWho": "Law firms benefit from Clio's firm-specific design; cross-departmental operations teams benefit from Lexion's broader applicability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Practice/Contract Management Core",
      "rows": [
        {
          "feature": "Matter/case management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Contract intake automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lexion: email-driven intake"
        },
        {
          "feature": "Client portal",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Document automation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clio Draft generates court forms and templated documents"
        },
        {
          "feature": "No-code approval automation",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published pricing tiers",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Clio: $39-$129/user/month; Lexion undisclosed"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Per-user pricing model",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Specialized Capabilities",
      "rows": [
        {
          "feature": "AI contract drafting/negotiation assist",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI key-term/date extraction",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Trust accounting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Billing & invoicing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clio has native iOS and Android apps"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Clio a contract management tool like Lexion?",
      "answer": "Not primarily. Clio is billing, case, and practice management software for law firms; AI-driven contract term extraction and drafting assistance are not among its documented features."
    },
    {
      "question": "Does Lexion handle billing and trust accounting?",
      "answer": "No, this is not documented as a Lexion feature. Lexion's feature set centers on contract intake, approval automation, and its AI-powered repository, not firm billing or IOLTA trust accounting."
    },
    {
      "question": "Which is cheaper to start with?",
      "answer": "Clio publishes its EasyStart plan at $39/user/month billed annually. Lexion has no published starting price — pricing requires contacting the company."
    },
    {
      "question": "Can non-law-firm teams use either tool?",
      "answer": "Lexion explicitly serves legal, sales, procurement, HR, and finance teams across industries. Clio's plans and features, like trust accounting, are built specifically for law firms."
    },
    {
      "question": "Does Clio include AI drafting features?",
      "answer": "This is not documented among Clio's listed features, unlike Lexion's AI Contract Assist for drafting and negotiation."
    },
    {
      "question": "Who owns or backs each company?",
      "answer": "Lexion is now part of Docusign following an acquisition. Clio was founded in 2008 and is headquartered in Vancouver, Canada; no acquisition or parent company is documented."
    }
  ]
};

export default clioVsLexionContent;
