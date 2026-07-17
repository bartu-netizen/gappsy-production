import type { ToolComparisonContent } from './types';

const anrokVsOrdwayContent: ToolComparisonContent = {
  "verdict": "Anrok and Ordway both serve SaaS finance teams, but they automate different back-office functions. Anrok is a global sales tax and VAT compliance platform covering nexus monitoring, registration, calculation, filing, and remittance, with published Starter pricing at $100/market/month for SaaS and $50/market/month for ecommerce. Ordway, headquartered in Washington, DC, is a subscription billing and revenue automation platform handling invoicing, payment collection, revenue recognition (ASC 606/IFRS 15), and SaaS metrics reporting, with pricing available only through sales. One handles sales tax compliance; the other handles the billing and revenue recognition workflow itself.",
  "bestForToolA": "Anrok fits SaaS and ecommerce companies expanding into new tax jurisdictions that need real-time nexus monitoring across 100+ countries and 13,000+ US jurisdictions, automated registration and filing, and can start on a published Starter plan ($100/market/month for SaaS, $50/market/month for ecommerce).",
  "bestForToolB": "Ordway fits SaaS, AI, and fintech companies that need to automate the full quote-to-cash workflow — flexible billing models, automated invoicing, ASC 606/IFRS 15 revenue recognition, dunning, and SaaS metrics reporting — and are prepared to go through a sales process since pricing is not published.",
  "whoNeedsBoth": "A growing SaaS company would plausibly run both together: Ordway to handle subscription billing, invoicing, and revenue recognition, while Anrok monitors nexus and calculates, files, and remits sales tax across the jurisdictions that billing activity creates exposure in — tax compliance and billing automation are adjacent but distinct back-office systems that many finance teams run side by side. Anrok's own integrations list includes Zuora and Chargebee-style billing platforms, indicating it's built to plug into a separate billing system like Ordway.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Anrok automates sales tax and VAT compliance: nexus monitoring, registration, real-time tax calculation, filing, and remittance.",
      "toolB": "Ordway automates subscription billing and revenue operations: flexible billing models, automated invoicing and payment collection, revenue recognition, and accounts receivable.",
      "whyItMatters": "These are complementary but distinct back-office systems; a company evaluating one is not necessarily deciding against the other.",
      "benefitsWho": "Finance/tax teams need Anrok specifically for compliance; RevOps/billing teams need Ordway specifically for quote-to-cash."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Anrok publishes Starter pricing: $100/market/month for SaaS companies and $50/market/month for ecommerce, with a Custom tier for advanced features.",
      "toolB": "Ordway's pricing is not publicly disclosed and requires contacting sales, per its documented cons.",
      "whyItMatters": "Published per-market pricing lets a company estimate tax compliance costs as it expands into new jurisdictions, while billing platform costs remain opaque until a sales conversation.",
      "benefitsWho": "Early-stage companies wanting to self-estimate costs benefit from Anrok's published Starter pricing."
    },
    {
      "title": "AI Features",
      "toolA": "Anrok includes Anrok Atlas, an AI assistant that answers sales tax questions reasoned over a company's own account data and Anrok's tax knowledge base, plus AI-powered real-time tax calculation.",
      "toolB": "Ordway offers AI agentic workflows and a natural language interface for billing and metrics reporting.",
      "whyItMatters": "Both apply AI within their domain, but Anrok's AI is tax-question-answering while Ordway's is billing/reporting-workflow automation.",
      "benefitsWho": "Finance teams wanting natural-language answers to tax questions benefit from Anrok Atlas; teams wanting conversational access to billing/metrics data benefit from Ordway's AI interface."
    },
    {
      "title": "Compliance Scope",
      "toolA": "Anrok covers real-time tax monitoring and filing across 100+ countries and 13,000+ US jurisdictions, with reconciliation across a company's financial systems.",
      "toolB": "Ordway automates revenue recognition specifically in compliance with ASC 606 and IFRS 15 accounting standards.",
      "whyItMatters": "Sales tax jurisdictional compliance and revenue recognition accounting compliance are two separate regulatory requirements that growing SaaS companies must both satisfy.",
      "benefitsWho": "Tax/compliance teams need Anrok's jurisdictional coverage; accounting/finance teams need Ordway's ASC 606/IFRS 15 automation."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "Anrok offers 40+ native integrations across billing, ERP, ecommerce, and HRIS platforms including Stripe, NetSuite, Salesforce, Zuora, Chargebee, QuickBooks, Workday, Shopify, and WooCommerce.",
      "toolB": "Ordway's documented facts state that specific third-party integrations are not detailed on its homepage.",
      "whyItMatters": "A wide, named integration list makes it easier to evaluate fit with an existing finance stack before a sales call.",
      "benefitsWho": "Companies wanting to verify integration compatibility upfront benefit from Anrok's documented 40+ integrations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Tax Compliance",
      "rows": [
        {
          "feature": "Nexus monitoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Automated tax registration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Real-time tax calculation at checkout",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Automated filing and remittance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Billing & Revenue Operations",
      "rows": [
        {
          "feature": "Subscription/usage-based billing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated invoicing and payment collection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Revenue recognition (ASC 606/IFRS 15)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Dunning / accounts receivable automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Customer self-service portal",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SaaS metrics reporting (MRR/ARR, churn)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI & Integrations",
      "rows": [
        {
          "feature": "AI assistant for domain-specific questions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Anrok Atlas"
        },
        {
          "feature": "AI agentic workflows / natural language interface",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Anrok: $50-$100/market/month"
        },
        {
          "feature": "40+ named integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Anrok and Ordway do the same thing?",
      "answer": "No. Anrok automates sales tax and VAT compliance (nexus monitoring, registration, calculation, filing, remittance), while Ordway automates subscription billing, invoicing, and revenue recognition. They address adjacent but different finance functions."
    },
    {
      "question": "How much does Anrok cost compared to Ordway?",
      "answer": "Anrok publishes Starter pricing at $100/market/month for SaaS companies and $50/market/month for ecommerce. Ordway's pricing is not publicly disclosed and requires contacting sales."
    },
    {
      "question": "Does Ordway handle sales tax like Anrok does?",
      "answer": "Ordway's documented feature set covers billing, invoicing, and revenue recognition, but does not include nexus monitoring, tax calculation, or filing — the functions Anrok specializes in."
    },
    {
      "question": "Does Anrok integrate with billing platforms like Ordway?",
      "answer": "Anrok lists 40+ native integrations including Stripe, NetSuite, Salesforce, Zuora, Chargebee, QuickBooks, Workday, Shopify, and WooCommerce, indicating it is designed to plug into a separate billing system. Ordway itself is not named specifically among Anrok's documented integrations."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "Both do, in different ways. Anrok includes Anrok Atlas, an AI assistant for answering tax questions using a company's account data. Ordway offers AI agentic workflows and a natural language interface for billing and metrics reporting."
    },
    {
      "question": "Would a SaaS company need both Anrok and Ordway?",
      "answer": "Plausibly yes. A SaaS company could use Ordway to run its billing, invoicing, and ASC 606/IFRS 15 revenue recognition, while using Anrok separately to monitor nexus and handle sales tax calculation, filing, and remittance across the jurisdictions that billing activity creates exposure in."
    }
  ]
};

export default anrokVsOrdwayContent;
