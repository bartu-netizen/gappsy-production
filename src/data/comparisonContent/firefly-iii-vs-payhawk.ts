import type { ToolComparisonContent } from './types';

const fireflyIiiVsPayhawkContent: ToolComparisonContent = {
  "verdict": "Firefly III and Payhawk both handle finances but at opposite ends of the spectrum: Firefly III is a free, self-hosted, open-source personal finance manager for individuals who want double-entry bookkeeping and full data control, while Payhawk is an enterprise spend management platform issuing corporate cards and automating expenses, accounts payable, travel, and procurement for companies with real payroll and ERP systems. Firefly III is a tracking and budgeting tool; Payhawk is operational financial infrastructure with actual card issuance.",
  "bestForToolA": "Firefly III fits individuals or households who want a free, self-hosted, AGPLv3-licensed tool for double-entry bookkeeping, budgets, recurring transactions, and multi-currency tracking, with a REST API for personal automation.",
  "bestForToolB": "Payhawk fits companies — its Growth Program is aimed at UK/EEA small businesses up to 20 employees at £149/month — that need to issue corporate cards, automate expense reports and accounts payable, and integrate with ERPs like NetSuite, Microsoft Dynamics 365, Sage Intacct, or Workday.",
  "whoNeedsBoth": "A founder could use Firefly III to track personal household finances on their own server while their company separately uses Payhawk to manage corporate cards and business expense reporting — distinct financial lives handled by purpose-built tools.",
  "keyDifferences": [
    {
      "title": "Target User",
      "toolA": "Firefly III is built for individual/household personal finance management.",
      "toolB": "Payhawk is built for companies, used by 6,000+ businesses including Vinted and MAN Truck and Bus.",
      "whyItMatters": "Applying an individual budgeting tool to corporate spend, or an enterprise card platform to personal budgeting, would be the wrong fit for both.",
      "benefitsWho": "Both individual users and finance teams need to match the tool's intended scale to their actual use case."
    },
    {
      "title": "Pricing Model",
      "toolA": "Firefly III is completely free under AGPLv3, with no paid tiers or usage limits at all.",
      "toolB": "Payhawk is custom/enterprise priced, mostly quote-based, with only its Growth Program publicly listed at £149/month (fixed 24-month term, up to 20 employees, 10 cards/10 seats, up to 15 invoices or reimbursements monthly, 7-day free trial).",
      "whyItMatters": "Firefly III has zero cost of entry, while Payhawk requires either a long-term contract commitment or a sales conversation for most plans.",
      "benefitsWho": "Cost-sensitive individuals (Firefly III) versus companies ready to commit to a contracted spend-management platform (Payhawk)."
    },
    {
      "title": "Corporate Card Issuance",
      "toolA": "Firefly III does not issue cards; it tracks transactions you enter or import into its double-entry system.",
      "toolB": "Payhawk issues actual corporate cards with built-in spend controls as a core feature.",
      "whyItMatters": "Only Payhawk can actually replace a company's card program; Firefly III is purely a record-keeping and budgeting layer.",
      "benefitsWho": "Finance and operations teams that need employees to have spendable company cards, not just expense tracking."
    },
    {
      "title": "Deployment",
      "toolA": "Firefly III is self-hosted only, with no official first-party hosted cloud version, deployable via Docker, Kubernetes, Softaculous, Cloudron, Lando, or Yunohost.",
      "toolB": "Payhawk is a cloud SaaS platform with native iOS and Android apps.",
      "whyItMatters": "Firefly III requires server administration skills and takes on backup/uptime responsibility; Payhawk is managed for the customer.",
      "benefitsWho": "Technically inclined individuals comfortable self-hosting versus companies wanting a fully managed platform."
    },
    {
      "title": "System Integrations",
      "toolA": "Firefly III exposes a REST JSON API covering almost every part of the application, useful for personal automation and scripting.",
      "toolB": "Payhawk natively integrates with major ERPs — NetSuite, Microsoft Dynamics 365, Sage Intacct, and Workday — and uses AI for receipt chasing, approval routing, and policy enforcement.",
      "whyItMatters": "Companies with existing ERP stacks need native integrations that Firefly III's personal-scale API doesn't target.",
      "benefitsWho": "Corporate finance teams running month-end close through an existing ERP system."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Bookkeeping",
      "rows": [
        {
          "feature": "Double-entry bookkeeping",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Budgets, categories, and tags",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-currency support",
          "toolA": "available",
          "toolB": "available",
          "note": "Payhawk: multi-currency Business Accounts."
        },
        {
          "feature": "Recurring transactions / automation rules",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Corporate Spend Infrastructure",
      "rows": [
        {
          "feature": "Corporate card issuance",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Accounts payable / invoice automation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Business travel booking",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Procurement / pre-spend approvals",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI-driven receipt chasing and policy enforcement",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Integration",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Payhawk's only public price is £149/month for its Growth Program."
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "ERP integrations (NetSuite, Dynamics 365, Sage Intacct, Workday)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Payhawk: iOS and Android apps."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Firefly III free?",
      "answer": "Yes, Firefly III is completely free and open source under the AGPLv3 license, with no paid tiers or usage limits."
    },
    {
      "question": "How much does Payhawk cost?",
      "answer": "Pricing is modular and mostly quote-based. The only publicly listed price is the Growth Program for small UK/EEA businesses at £149/month, which includes a 7-day free trial and requires a fixed 24-month contract."
    },
    {
      "question": "Does Firefly III issue corporate cards like Payhawk?",
      "answer": "No. Firefly III is a personal finance tracker with double-entry bookkeeping; it does not issue cards. Payhawk issues actual corporate cards with built-in spend controls."
    },
    {
      "question": "Can Firefly III be used by a business instead of Payhawk?",
      "answer": "Firefly III has no ERP integrations, card issuance, or accounts-payable automation documented, so it is not built as a corporate spend-management substitute for a platform like Payhawk."
    },
    {
      "question": "Does Payhawk offer a free plan like Firefly III?",
      "answer": "No. Payhawk's pricing is custom/enterprise, and even its cheapest publicly listed option, the Growth Program at £149/month, requires a 24-month contract; there is no free tier documented."
    },
    {
      "question": "Does Firefly III have an API?",
      "answer": "Yes, it has a REST JSON API covering almost every part of the application, aimed at personal integrations and automation rather than enterprise ERP connections."
    }
  ]
};

export default fireflyIiiVsPayhawkContent;
