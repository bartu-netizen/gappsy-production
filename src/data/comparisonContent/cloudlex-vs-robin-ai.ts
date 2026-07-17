import type { ToolComparisonContent } from './types';

const cloudlexVsRobinAiContent: ToolComparisonContent = {
  "verdict": "CloudLex and Robin AI are both AI-enabled legal software, but they target different practice areas and workflows: CloudLex is case management software purpose-built for personal injury law firms, covering intake through settlement with a built-in Lexee AI assistant, while Robin AI is a contract review and legal intelligence platform for enterprise legal teams that reviews, analyzes, and helps finalize contracts. One manages litigation cases; the other manages contracts.",
  "bestForToolA": "CloudLex fits personal injury law firms that need intake forms, matter management, medical records tracking, and settlement tracking in one system, with Lexee AI handling demand drafting and medical record summaries.",
  "bestForToolB": "Robin AI fits enterprise legal and contract teams that need to search, review, and negotiate high volumes of contracts, backed by ISO27001 and SOC2 certification and stated work with 13 Fortune 500 companies.",
  "whoNeedsBoth": "A personal injury firm with an in-house corporate/vendor contracts function could use CloudLex to run its litigation caseload from intake to settlement while using Robin AI separately to review and manage its own vendor and employment contracts, since CloudLex's document tools are scoped to case files, not general contract negotiation.",
  "keyDifferences": [
    {
      "title": "Practice Area Focus",
      "toolA": "CloudLex is explicitly built for personal injury law firms, covering intake, matter management, medical records, and settlement management.",
      "toolB": "Robin AI is built for enterprise legal teams generally, focused on contract review, analysis, and finalization rather than a specific litigation practice area.",
      "whyItMatters": "A tool optimized for personal injury litigation workflows will not serve a general contract-heavy legal department well, and vice versa.",
      "benefitsWho": "Law firms and legal departments narrowing tools to their actual practice area."
    },
    {
      "title": "Built-In AI Capability",
      "toolA": "CloudLex's Lexee AI handles demand drafting, medical record summaries, intake chatbots, and case Q&A.",
      "toolB": "Robin AI offers an AI document chat interface for discussing contracts, plus advanced contract search that auto-detects contract types, signatures, and key terms.",
      "whyItMatters": "The AI in each tool is scoped to its domain's paperwork — demand letters and medical summaries versus contract terms and obligations — so the value depends on which documents a team actually works with.",
      "benefitsWho": "Legal teams wanting AI assistance tailored to the specific documents they process daily."
    },
    {
      "title": "Add-On Services",
      "toolA": "CloudLex offers optional paralegal services including records retrieval, chronologies, document indexing, and a 24/7 bilingual call center.",
      "toolB": "Robin AI does not document any human paralegal or call-center add-on services.",
      "whyItMatters": "Firms that want outsourced case-support labor alongside software have that option with CloudLex but not documented with Robin AI.",
      "benefitsWho": "Smaller personal injury firms that need extra staffing capacity for records retrieval and intake calls."
    },
    {
      "title": "Obligation & Deadline Tracking",
      "toolA": "CloudLex tracks court dates and statute-of-limitations deadlines with shared firm-wide visibility.",
      "toolB": "Robin AI tracks contractual obligations with smart alerts to help prevent missed deadlines and breaches.",
      "whyItMatters": "Both tools track deadlines, but for entirely different risk types — litigation deadlines versus contractual obligation deadlines.",
      "benefitsWho": "Firms and legal departments that need automated alerts specific to their risk category."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "CloudLex pricing is not published and requires contacting sales, with no free trial or free plan listed.",
      "toolB": "Robin AI pricing is also not disclosed on its website, with no free trial or free plan mentioned.",
      "whyItMatters": "Both tools require a sales conversation before any pricing is known, which buyers should plan for regardless of which they evaluate.",
      "benefitsWho": "Procurement teams planning evaluation timelines that include a sales cycle."
    }
  ],
  "featureMatrix": [
    {
      "group": "Case & Contract Management",
      "rows": [
        {
          "feature": "Case intake management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Matter/case tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Contract search across documents",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Robin AI auto-detects contract types, signatures, and key terms."
        },
        {
          "feature": "Team workspaces for collaboration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI document chat / Q&A",
          "toolA": "available",
          "toolB": "available",
          "note": "CloudLex: case Q&A via Lexee AI. Robin AI: document chat interface."
        },
        {
          "feature": "Demand or contract drafting assistance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "CloudLex's Lexee AI drafts demands."
        },
        {
          "feature": "Obligation/deadline alerts",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Support & Trust",
      "rows": [
        {
          "feature": "24/7 support / call center",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "CloudLex offers this as an optional paralegal add-on."
        },
        {
          "feature": "Security certifications",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Robin AI states ISO27001 and SOC2 certification."
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do CloudLex and Robin AI serve the same type of legal work?",
      "answer": "No. CloudLex is case management software specifically for personal injury law firms, while Robin AI is a contract review and legal intelligence platform for enterprise legal teams generally."
    },
    {
      "question": "Does CloudLex handle contract review like Robin AI?",
      "answer": "Not in the same way. CloudLex's AI, Lexee, handles demand drafting, medical record summaries, and case Q&A for personal injury matters, while Robin AI is purpose-built for reviewing, analyzing, and finalizing contracts."
    },
    {
      "question": "Which tool has published pricing?",
      "answer": "Neither. CloudLex and Robin AI both require contacting sales for pricing, and neither publishes a free trial or free plan on its website."
    },
    {
      "question": "Does Robin AI offer paralegal or call-center services like CloudLex?",
      "answer": "No such services are documented for Robin AI. CloudLex offers optional paralegal add-ons including records retrieval, chronologies, document indexing, and a 24/7 bilingual call center."
    },
    {
      "question": "What security certifications does Robin AI have?",
      "answer": "Robin AI states it is ISO27001 and SOC2 certified and GDPR compliant. CloudLex does not list specific security certifications, though it notes hosting on Microsoft Azure with encryption and multi-factor authentication."
    },
    {
      "question": "Who built Robin AI's AI technology?",
      "answer": "Robin AI states its platform is built in partnership with Anthropic and AWS for its AI and infrastructure."
    }
  ]
};

export default cloudlexVsRobinAiContent;
