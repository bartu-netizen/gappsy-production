import type { ToolComparisonContent } from './types';

const foundVsSoldoContent: ToolComparisonContent = {
  "verdict": "Found and Soldo both handle business money movement but serve very different businesses: Found is a US-focused, freemium banking app built for the self-employed and freelancers, combining bookkeeping, tax estimates, and unlimited free contractor payments, while Soldo is a UK/European, paid-from-day-one spend-management platform for teams needing multi-user card controls and approval workflows. Geography and company structure matter more than raw feature overlap.",
  "bestForToolA": "US-based solo founders, freelancers, or self-employed individuals who want a free Core plan ($0/month) checking account bundled with automatic bookkeeping, tax write-off tracking, and unlimited contractor payments with free 1099-NEC generation.",
  "bestForToolB": "UK or European teams of three or more that need company cards with proactive spend limits and approval workflows, multi-entity wallet hierarchies, and FCA-regulated custody of funds, starting at £21/month + VAT.",
  "whoNeedsBoth": "There's little realistic overlap since Found targets US solo operators while Soldo serves multi-user European teams; a business would need to be both US-based for Found's banking and tax tools and running a UK/EU entity with multiple cardholders for Soldo, a narrow edge case rather than a common pattern.",
  "keyDifferences": [
    {
      "title": "Target Geography",
      "toolA": "Found is US business banking, with services provided through Lead Bank.",
      "toolB": "Soldo is UK-based, an FCA-regulated Electronic Money Institution serving 25,000+ businesses across 31 European countries.",
      "whyItMatters": "Banking regulation and currency handling differ by region, so the right tool depends on where the business is incorporated.",
      "benefitsWho": "US solo operators need Found; UK/EU multi-person teams need Soldo."
    },
    {
      "title": "Pricing Model",
      "toolA": "Found is freemium: Core is free ($0/month), Found Plus is $35/month, and Found Pro is $80/month.",
      "toolB": "Soldo is paid from the start: Standard is £21/month + VAT (capped at 3 users/3 cards), Plus is £33/month + VAT.",
      "whyItMatters": "The cost of entry differs sharply between a free-forever plan and a paid-from-day-one model.",
      "benefitsWho": "Solo users wanting a free tier favor Found; teams needing multi-card control from day one accept Soldo's paid entry tier."
    },
    {
      "title": "Built-in Bookkeeping & Tax",
      "toolA": "Found includes automatic bookkeeping, tax write-off tracking, tax estimates, and 1099-NEC generation in its core product.",
      "toolB": "No bookkeeping or tax-estimate feature is documented for Soldo, which instead integrates with external accounting software.",
      "whyItMatters": "Handling tax prep in-app versus exporting to an accountant is a meaningful workflow difference.",
      "benefitsWho": "Self-employed users wanting tax prep handled in-app need Found."
    },
    {
      "title": "Contractor Payments",
      "toolA": "Found offers unlimited contractor payments with no per-contractor fees and automatic W-9 collection.",
      "toolB": "No contractor-payment feature is documented for Soldo.",
      "whyItMatters": "Businesses paying many contractors need this built into their banking tool.",
      "benefitsWho": "Freelance-heavy or gig-economy businesses paying many contractors need Found."
    },
    {
      "title": "Team Size & Card Limits",
      "toolA": "Found offers team cards for up to 10 physical and 20 virtual cards with spend controls, built around a single self-employed user's business.",
      "toolB": "Soldo's Standard plan explicitly caps at 3 users/3 cards, with role-based multi-entity hierarchy available on higher tiers.",
      "whyItMatters": "Growing teams need entity-level card structures that a single-owner banking app isn't built for.",
      "benefitsWho": "Growing teams needing entity-level card hierarchies fit Soldo; solo operators occasionally adding a few team cards fit Found."
    }
  ],
  "featureMatrix": [
    {
      "group": "Banking & Fees",
      "rows": [
        {
          "feature": "Free plan available",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Found Core is $0/month"
        },
        {
          "feature": "Monthly account fee on entry tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "£21/month + VAT"
        },
        {
          "feature": "Regulatory coverage disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Lead Bank/FDIC vs FCA EMI"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Soldo offers a 30-day trial"
        }
      ]
    },
    {
      "group": "Bookkeeping, Tax & Contractors",
      "rows": [
        {
          "feature": "Automatic bookkeeping",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Tax estimates & write-off tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "1099-NEC generation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Unlimited contractor payments",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Cards & Spend Control",
      "rows": [
        {
          "feature": "Physical & virtual cards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Named team card limits",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Found: 10 physical/20 virtual; Soldo scales by plan tier"
        },
        {
          "feature": "Proactive spend limits & approvals",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-entity / wallet hierarchy",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Accounting software integrations",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Found available outside the US?",
      "answer": "Not documented. Found is a US business banking platform; Soldo serves 31 European countries."
    },
    {
      "question": "Does Found charge a monthly fee?",
      "answer": "The Core plan is free; Found Plus ($35/month) and Found Pro ($80/month) add features like higher APY and cash back."
    },
    {
      "question": "Does Soldo help with bookkeeping and taxes?",
      "answer": "Not documented. Soldo focuses on spend management and integrates with accounting software rather than performing bookkeeping itself."
    },
    {
      "question": "Which tool is better for paying contractors?",
      "answer": "Found, with unlimited contractor payments, no per-contractor fees, and automatic 1099-NEC generation."
    },
    {
      "question": "Is Soldo regulated?",
      "answer": "Yes, Soldo is regulated as an Electronic Money Institution by the UK's Financial Conduct Authority."
    },
    {
      "question": "Does Found offer a free trial?",
      "answer": "Not documented; Found instead offers a free-forever Core plan rather than a time-limited trial."
    }
  ]
};

export default foundVsSoldoContent;
