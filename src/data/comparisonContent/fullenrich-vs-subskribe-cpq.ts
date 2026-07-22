import type { ToolComparisonContent } from './types';

const fullenrichVsSubskribeCpqContent: ToolComparisonContent = {
  "verdict": "FullEnrich is a top-of-funnel B2B contact enrichment tool that waterfalls 20+ data providers to find verified emails and phone numbers; Subskribe CPQ is a quote-to-revenue platform combining CPQ, subscription billing, and revenue recognition for closing and managing deals. They sit at opposite ends of the revenue process: FullEnrich helps sales teams find who to contact, while Subskribe helps finance and deal-desk teams quote, bill, and recognize revenue once a deal is won.",
  "bestForToolA": "Sales and go-to-market teams that need to find verified emails and phone numbers for outbound prospecting, with tiered self-serve pricing starting at a free 50-lead trial and a €55/month Pro plan for 1,000 credits.",
  "bestForToolB": "Mid-market and enterprise SaaS companies that need to unify CPQ, subscription billing, and revenue recognition, particularly those with complex deal structures like subscription ramps and multi-product NetSuite/QuickBooks accounting integrations.",
  "whoNeedsBoth": "A B2B SaaS company could use FullEnrich to enrich and verify contact data for outbound prospecting, then use Subskribe CPQ to generate quotes, manage subscription billing, and recognize revenue once those enriched leads convert into paying customers, covering the funnel from prospecting through revenue recognition.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "FullEnrich is a B2B contact enrichment tool focused on finding and verifying emails and phone numbers at the top of the sales funnel.",
      "toolB": "Subskribe CPQ is a quote-to-revenue platform covering CPQ, subscription billing, and revenue recognition at the deal-closing and post-sale stage.",
      "whyItMatters": "Buyers need to know these tools solve entirely different problems in the revenue process, not competing alternatives.",
      "benefitsWho": "Revenue operations teams mapping their tech stack across the full funnel, from prospecting to billing."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "FullEnrich publishes tiered pricing: a free trial with 50 leads, and a Pro plan at €55/month for 1,000 credits.",
      "toolB": "Subskribe publishes no plan pricing; an online estimate calculator suggests roughly $140,000/year for a mid-market company, but actual pricing requires contacting sales.",
      "whyItMatters": "Published, self-serve pricing versus custom enterprise pricing changes how quickly a team can evaluate and adopt a tool.",
      "benefitsWho": "Smaller teams and self-serve buyers benefit from FullEnrich's transparency; enterprise finance buyers expect Subskribe's custom quoting process."
    },
    {
      "title": "Target Customer Size",
      "toolA": "FullEnrich's credit-based, self-serve pricing (starting free, then €55/month) suggests it targets SMB-to-mid-market sales teams.",
      "toolB": "Subskribe's estimated $140,000/year cost and its integrations with enterprise systems like NetSuite, Avalara, and Anrok point to mid-market and enterprise SaaS finance teams.",
      "whyItMatters": "A tool priced and integrated for enterprise finance stacks isn't a fit for a small sales team's budget, and vice versa.",
      "benefitsWho": "Small sales teams evaluating FullEnrich; enterprise revenue/finance teams evaluating Subskribe."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "FullEnrich's AI integrations connect to Claude via MCP and OpenAI-based workflows, plus Zapier, Make, n8n, and Clay, for building automated enrichment workflows.",
      "toolB": "Subskribe's DealDesk AI focuses on guided selling, deal summarization, and conversational support for deal desks working on quotes.",
      "whyItMatters": "The AI in each tool is tailored to a different job: automating data workflows versus assisting deal negotiation.",
      "benefitsWho": "RevOps teams building automated enrichment pipelines (FullEnrich) versus deal desk teams handling complex quotes (Subskribe)."
    },
    {
      "title": "Corporate Ownership",
      "toolA": "FullEnrich's facts don't document any acquisition or funding events.",
      "toolB": "Subskribe was acquired by DealHub in 2024 as part of a $100 million funding round, which may bring future product-direction changes.",
      "whyItMatters": "Recent acquisitions can affect product roadmap, support continuity, and pricing over time.",
      "benefitsWho": "Enterprise buyers doing vendor due diligence on long-term product stability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Contact/lead data enrichment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "FullEnrich: waterfall across 20+ sources"
        },
        {
          "feature": "Quote generation (CPQ)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Subscription billing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Revenue recognition",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Phone number validation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "FullEnrich: US/Canada ownership matching"
        }
      ]
    },
    {
      "group": "Integrations & AI",
      "rows": [
        {
          "feature": "CRM sync",
          "toolA": "available",
          "toolB": "available",
          "note": "FullEnrich: HubSpot, Salesforce; Subskribe: Salesforce, HubSpot, NetSuite"
        },
        {
          "feature": "E-signature",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Subskribe: built-in signing"
        },
        {
          "feature": "AI agent/assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "FullEnrich: Claude MCP; Subskribe: DealDesk AI"
        },
        {
          "feature": "Tax/accounting integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Avalara, Anrok, QuickBooks"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published tier pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "FullEnrich Pro: €55/month"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "FullEnrich: 50 leads, no credit card"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the actual difference between FullEnrich and Subskribe CPQ?",
      "answer": "FullEnrich finds and verifies contact data (emails and phone numbers) for outbound prospecting, while Subskribe CPQ handles quoting, subscription billing, and revenue recognition after a deal is being closed. They belong to different categories of the revenue stack."
    },
    {
      "question": "How much does FullEnrich cost?",
      "answer": "FullEnrich offers a free trial with 50 credits and no credit card required, then a Pro plan at €55/month for 1,000 credits; higher-volume Scale/Enterprise pricing is custom."
    },
    {
      "question": "How much does Subskribe cost?",
      "answer": "Subskribe doesn't publish plan pricing; it requires contacting sales, though an online estimate calculator suggests roughly $140,000/year for a mid-market company."
    },
    {
      "question": "Does FullEnrich integrate with AI tools like Claude?",
      "answer": "Yes, FullEnrich connects to Claude via MCP and to OpenAI-based workflows, in addition to Zapier, Make, n8n, and Clay."
    },
    {
      "question": "Is Subskribe still an independent company?",
      "answer": "No, Subskribe was acquired by DealHub in 2024 as part of a $100 million funding round."
    },
    {
      "question": "Can I buy just part of Subskribe's platform instead of the whole thing?",
      "answer": "Yes, Subskribe states customers may purchase the CPQ module or the Billing module individually, in addition to the full Quote-to-Revenue platform."
    }
  ]
};

export default fullenrichVsSubskribeCpqContent;
