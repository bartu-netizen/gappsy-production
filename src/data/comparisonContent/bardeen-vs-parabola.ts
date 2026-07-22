import type { ToolComparisonContent } from './types';

const bardeenVsParabolaContent: ToolComparisonContent = {
  "verdict": "Bardeen and Parabola are both AI-driven, credit-based automation platforms, but they're built for different functions inside a company: Bardeen automates go-to-market work — scraping, researching, qualifying, and enriching leads — while Parabola turns natural-language descriptions of ops and finance processes into auditable, governed workflows. The choice isn't which is 'better' but which department is doing the automating.",
  "bestForToolA": "Sales and go-to-market teams that need to scrape web data, research and qualify leads with AI, and sync enriched records directly into Google Sheets, Airtable, or Notion.",
  "bestForToolB": "Ops and finance teams that want to describe a process — inventory reconciliation, invoice auditing, PO matching, variance analysis — in plain language and get an editable, audited workflow, especially teams that can operate within the free Basic plan's 1,000 monthly credits.",
  "whoNeedsBoth": "A company where a GTM team owns pipeline/lead automation and a separate finance or ops team owns process automation would naturally run both tools in parallel, each serving its own department rather than one replacing the other.",
  "keyDifferences": [
    {
      "title": "Primary use case",
      "toolA": "Built for go-to-market teams: web scraping, AI-powered lead research, enrichment, and AI qualification/scoring against custom criteria.",
      "toolB": "Built for ops/finance teams: a natural-language process builder that drafts workflows for tasks like invoice auditing and PO matching, with pre-built prompt templates.",
      "whyItMatters": "The tools solve fundamentally different jobs, so the right choice depends on which team and process you're automating.",
      "benefitsWho": "Sales/GTM operators benefit from Bardeen's lead-focused tooling; ops/finance analysts benefit from Parabola's process-focused tooling."
    },
    {
      "title": "Workflow creation method",
      "toolA": "Automations are largely pre-configured around scraping, research, and enrichment steps rather than a described process.",
      "toolB": "Users describe a process in plain language; Parabola drafts a workflow and asks clarifying questions, with each step's logic visible and editable.",
      "whyItMatters": "A natural-language builder lowers the bar for non-technical users to create and adjust workflows without rebuilding from scratch.",
      "benefitsWho": "Non-technical ops/finance staff benefit most from Parabola's conversational workflow-building approach."
    },
    {
      "title": "Free plan availability",
      "toolA": "No standalone free plan — the cheapest tier (Basic) costs $10/month, and credits expire at the end of each billing period without rolling over.",
      "toolB": "Offers a free Basic plan with 1,000 credits/month for a single user, no seat cost, plus pay-as-you-go credits.",
      "whyItMatters": "A genuinely free tier lets individuals or small teams evaluate and use the tool indefinitely at no cost, rather than committing to a paid plan immediately.",
      "benefitsWho": "Budget-conscious individuals or small ops teams benefit from Parabola's free Basic tier; Bardeen requires payment from day one."
    },
    {
      "title": "Governance and audit tooling",
      "toolA": "Holds SOC 2 Type II, GDPR, and CASA Tier 2/3 certifications, but doesn't document role-based access, version history, or audit-log features.",
      "toolB": "Includes a named audit trail & governance feature — role-based access, version history, and full audit logs for compliance.",
      "whyItMatters": "Formal certifications cover data-handling security, while in-product audit trails and versioning support process-level compliance reviews.",
      "benefitsWho": "Finance and compliance-sensitive teams benefit from Parabola's built-in audit trail and governance features."
    },
    {
      "title": "Integration breadth",
      "toolA": "Syncs enriched data to Google Sheets, Airtable, and Notion.",
      "toolB": "Connects to 1,000+ systems, including ERPs, data warehouses, email, and file storage systems.",
      "whyItMatters": "The number and type of supported integrations determines how easily a tool fits into an existing tech stack.",
      "benefitsWho": "Teams already living in Sheets/Airtable/Notion fit Bardeen's narrower integration set; teams needing ERP or data-warehouse connections need Parabola's broader reach."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "Natural-language workflow builder",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Web scraping for lead lists",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI lead qualification/scoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Pre-built process templates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Parabola: inventory reconciliation, invoice auditing, PO matching, variance analysis."
        },
        {
          "feature": "Scheduled recurring execution",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Parabola runs hourly, daily, or weekly with retry logic and failure alerts."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Parabola's Basic plan is free with 1,000 credits/month."
        },
        {
          "feature": "Credits roll over between billing periods",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Bardeen credits expire at end of billing period."
        },
        {
          "feature": "Custom/quote-only enterprise tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Both have a top-tier custom-priced plan (Bardeen Enterprise; Parabola Business)."
        }
      ]
    },
    {
      "group": "Compliance & Governance",
      "rows": [
        {
          "feature": "SOC 2 Type II certification",
          "toolA": "available",
          "toolB": "available",
          "note": "Parabola lists SOC 2 Type II as part of the Business plan."
        },
        {
          "feature": "GDPR certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Audit logs / version history",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Parabola's Business plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Bardeen have a free plan?",
      "answer": "No, there's no $0 tier; the Basic plan starts at $10/month, though every plan includes 100 free credits monthly."
    },
    {
      "question": "Does Parabola have a free plan?",
      "answer": "Yes, the Basic plan is free and includes 1,000 credits per month for one user."
    },
    {
      "question": "What kinds of processes is each tool built for?",
      "answer": "Bardeen automates go-to-market work — scraping, researching, qualifying, and enriching leads. Parabola automates ops/finance processes like inventory reconciliation, invoice auditing, and PO matching from a natural-language description."
    },
    {
      "question": "Where does each tool send its output data?",
      "answer": "Bardeen syncs enriched leads to Google Sheets, Airtable, and Notion. Parabola connects to 1,000+ systems including ERPs, data warehouses, email, and file storage."
    },
    {
      "question": "Which tool has stronger audit and compliance features documented?",
      "answer": "Parabola documents a specific audit trail & governance feature (role-based access, version history, full audit logs). Bardeen documents SOC 2 Type II, GDPR, and CASA Tier 2/3 certifications but not an in-product audit trail."
    },
    {
      "question": "Do unused credits carry over on either platform?",
      "answer": "On Bardeen, credits expire at the end of each billing period and don't roll over. This isn't documented for Parabola."
    }
  ]
};

export default bardeenVsParabolaContent;
