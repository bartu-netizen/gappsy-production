import type { ToolComparisonContent } from './types';

const clioVsCloudlexContent: ToolComparisonContent = {
  "verdict": "Clio, founded in 2008 and based in Vancouver, is a general-purpose cloud legal practice management platform used across practice areas, with published per-user pricing from $39 to $129/month and built-in trust accounting for IOLTA compliance. CloudLex, based in New York City, is purpose-built specifically for personal injury law firms, covering intake through settlement with a built-in AI assistant (Lexee AI) for demand drafting and medical record summaries, but its pricing is not published. The choice largely comes down to whether a firm needs general-purpose case management or personal-injury-specific workflows and AI tooling.",
  "bestForToolA": "Solo attorneys and general practice or multi-specialty firms that want an all-in-one platform for case management, time tracking, billing, and IOLTA-compliant trust accounting, with published pricing starting at $39/user/month.",
  "bestForToolB": "Personal injury law firms specifically, who want intake-to-settlement case tracking plus Lexee AI for demand drafting, medical record summaries, and case Q&A, along with optional paralegal support services.",
  "whoNeedsBoth": "A firm with a dedicated personal injury department alongside general practice work might run CloudLex for its PI caseload while using Clio firm-wide for other matters and billing, though the facts don't indicate any native integration between the two systems.",
  "keyDifferences": [
    {
      "title": "Practice Area Focus",
      "toolA": "Clio is built as general legal practice management software usable across practice areas, from solo attorneys to larger firms.",
      "toolB": "CloudLex is purpose-built specifically for personal injury law firms, with dedicated intake, medical records tracking, and settlement management for that practice area.",
      "whyItMatters": "Specialization changes which workflows come pre-built versus which a firm has to configure itself.",
      "benefitsWho": "Personal injury firms that want features already tailored to their caseload, versus general firms needing broader flexibility."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Clio publishes four tiers on its website: EasyStart at $39/user/month, Essentials at $69, Advanced at $99, and Complete at $129 (all billed annually).",
      "toolB": "CloudLex's pricing is not published; the pricing model itself is undocumented and firms must contact sales for a quote.",
      "whyItMatters": "Published pricing lets firms budget and compare costs without a sales cycle.",
      "benefitsWho": "Smaller firms and solo practitioners who want to self-serve a cost estimate."
    },
    {
      "title": "Built-in Generative AI",
      "toolA": "No AI feature is documented for Clio in the available facts.",
      "toolB": "CloudLex includes Lexee AI, which handles demand drafting, medical record summaries, intake chatbots, and case Q&A.",
      "whyItMatters": "AI-assisted drafting can materially cut the time spent preparing demand letters and reviewing medical records in personal injury cases.",
      "benefitsWho": "Personal injury attorneys and paralegals handling high case volumes with heavy documentation."
    },
    {
      "title": "Trust Accounting",
      "toolA": "Clio Manage includes dedicated trust accounting tools to help firms track client retainer funds in line with IOLTA and similar compliance rules.",
      "toolB": "No trust accounting feature is documented for CloudLex.",
      "whyItMatters": "Trust accounting compliance is a core regulatory requirement for firms handling client funds, and built-in support avoids a separate accounting tool.",
      "benefitsWho": "Firms that need IOLTA-compliant trust accounting as part of their day-to-day billing."
    },
    {
      "title": "Add-on Services",
      "toolA": "Clio offers an app marketplace with 200+ integrations (Essentials tier and up), including Outlook, Gmail, and QuickBooks.",
      "toolB": "CloudLex offers optional paralegal services -- records retrieval, chronologies, document indexing, and a 24/7 bilingual call center -- as add-ons beyond the software itself.",
      "whyItMatters": "The type of add-on reveals a different growth strategy: software integrations versus outsourced staffing support.",
      "benefitsWho": "Firms wanting either more software connectivity (Clio) or more hands-on case support services (CloudLex)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Case & Matter Management",
      "rows": [
        {
          "feature": "Matter/case management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Client intake",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio via Clio Grow; CloudLex has native intake management"
        },
        {
          "feature": "Medical records tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Settlement / demand tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Document automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio Draft generates court forms/templates; CloudLex offers AI-driven document search"
        }
      ]
    },
    {
      "group": "Billing & Financials",
      "rows": [
        {
          "feature": "Time & expense tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Trust accounting (IOLTA)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Billing & invoicing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Clio: $39-$129/user/month annual"
        }
      ]
    },
    {
      "group": "Integrations & Specialization",
      "rows": [
        {
          "feature": "Personal injury specialization",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Built-in generative AI",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lexee AI"
        },
        {
          "feature": "Named third-party integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio: Outlook, Gmail, QuickBooks; CloudLex: Microsoft 365, Gmail, Google Calendar, DocuSign, Adobe Sign"
        },
        {
          "feature": "Optional paralegal/staffing services",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is CloudLex only for personal injury firms?",
      "answer": "Yes -- CloudLex is described as case management software focused specifically on personal injury law firms, covering the workflow from intake through settlement."
    },
    {
      "question": "Does Clio support trust accounting?",
      "answer": "Yes, Clio Manage includes trust accounting tools built to help firms track client retainer funds in line with IOLTA and similar rules."
    },
    {
      "question": "How much does Clio cost?",
      "answer": "Clio's published annual pricing runs from $39/user/month on EasyStart up to $129/user/month on Complete, which bundles in Clio Grow client intake and CRM."
    },
    {
      "question": "Is CloudLex's pricing public?",
      "answer": "No, pricing is not listed on CloudLex's website; firms need to contact the company directly for a quote."
    },
    {
      "question": "Does CloudLex include AI features?",
      "answer": "Yes -- its Lexee AI component handles demand drafting, medical record summaries, intake chatbots, and case Q&A."
    },
    {
      "question": "What's the difference between Clio Manage and Clio Grow?",
      "answer": "Clio Manage handles case management, billing, and trust accounting after a matter is opened, while Clio Grow handles client intake and CRM before and during the intake process; Clio Grow is included starting on the Complete plan."
    }
  ]
};

export default clioVsCloudlexContent;
