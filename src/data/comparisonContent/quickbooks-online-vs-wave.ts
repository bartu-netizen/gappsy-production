import type { ToolComparisonContent } from './types';

const quickbooksOnlineVsWaveContent: ToolComparisonContent = {
  "verdict": "QuickBooks Online and Wave both start from a chart of accounts and invoicing, but they are built for different sized jobs. QuickBooks Online is a scalable, four-tier accounting platform from Intuit that adds inventory tracking, project profitability, multi-currency support, and an app marketplace as a business grows, backed by the largest network of bookkeepers and accountants already trained on it. Wave is a free, no-frills accounting and invoicing tool aimed at very small businesses and freelancers who need clean books and professional invoices without a monthly bill, with optional paid add-ons for payments, payroll, and bookkeeping support layered on top. A solo freelancer or a two-person service business with simple invoicing needs will likely find Wave's free Starter plan does everything required. A business that stocks inventory, tracks profitability by project or location, needs multiple user permission levels, or plans to integrate with e-commerce and CRM tools will outgrow Wave's documented feature set and is better served by QuickBooks Online. Neither tool is a strict upgrade of the other: QuickBooks Online trades a monthly subscription for depth and ecosystem, while Wave trades some depth for a genuinely free core product.",
  "bestForToolA": "QuickBooks Online fits growing small businesses that need inventory management, project or class tracking, multi-currency support, or integrations through an app marketplace and API, and that are willing to pay a monthly subscription for that depth.",
  "bestForToolB": "Wave fits freelancers, solopreneurs, and very small service businesses that mainly need unlimited invoicing and basic double-entry bookkeeping without any subscription cost.",
  "whoNeedsBoth": "An accountant or bookkeeper serving a mixed client base may work in both, using Wave for free-tier clients with simple invoicing needs and QuickBooks Online for clients that require inventory, project tracking, or multi-user permissions.",
  "keyDifferences": [
    {
      "title": "Base pricing model",
      "toolA": "Paid from the start, with a free trial and plans from approximately $35/month for Simple Start",
      "toolB": "Free Starter plan at $0/month, with an optional Pro plan from $19/month",
      "whyItMatters": "Ongoing subscription cost is often the deciding factor for early-stage businesses with tight budgets",
      "benefitsWho": "Cost-sensitive freelancers and very small businesses benefit from Wave; businesses that need advanced tools may accept QuickBooks Online's cost for the added depth"
    },
    {
      "title": "Company history and scale",
      "toolA": "Intuit product with roots dating to 1983, headquartered in Mountain View, California",
      "toolB": "Founded in 2009, headquartered in Toronto, Ontario, Canada",
      "whyItMatters": "A longer operating history and larger install base translates into more accountants and bookkeepers already trained on the platform",
      "benefitsWho": "Businesses that plan to hire outside bookkeepers or accountants benefit from QuickBooks Online's familiarity"
    },
    {
      "title": "Inventory and project tracking",
      "toolA": "Tracks quantities on hand, cost of goods sold, and reorder points, plus profitability tracking by project, location, or class on eligible plans",
      "toolB": "No inventory management, project tracking, or job costing features are offered",
      "whyItMatters": "Product-based or project-based businesses need to see profitability and stock levels beyond basic bookkeeping",
      "benefitsWho": "Retailers, product sellers, and project-based service firms benefit from QuickBooks Online; simple service businesses do not need this depth"
    },
    {
      "title": "Third-party integrations and API",
      "toolA": "Integrates with e-commerce, point-of-sale, and CRM apps, plus a developer API for custom connections",
      "toolB": "Limited third-party integrations compared to competitors",
      "whyItMatters": "Businesses running several other tools need their accounting software to connect cleanly to avoid manual data entry",
      "benefitsWho": "Businesses already using e-commerce or CRM platforms benefit from QuickBooks Online's connectivity"
    },
    {
      "title": "Payroll coverage",
      "toolA": "Payroll runs through an integrated Intuit payroll add-on subscription for tax calculation and direct deposit",
      "toolB": "Optional payroll add-on from around $25/month, but full-service tax filing is limited to select US states and Canadian provinces",
      "whyItMatters": "Businesses need to confirm payroll tax filing is actually supported in their state or province before committing",
      "benefitsWho": "Businesses outside Wave payroll's supported regions benefit from confirming QuickBooks Payroll coverage in their area instead"
    },
    {
      "title": "User limits and permissions",
      "toolA": "Tiered user limits from one user on Simple Start up to twenty-five on Advanced, with custom permissions and roles on the top tier",
      "toolB": "Unlimited collaborators included on the Pro plan, without a stated custom permissions system",
      "whyItMatters": "Teams that need granular, role-based access control need more than just seat count",
      "benefitsWho": "Larger teams needing precise permission control benefit from QuickBooks Online Advanced; small teams that just need everyone to see the books benefit from Wave Pro"
    },
    {
      "title": "Multi-currency support",
      "toolA": "Multi-currency support is included from the Essentials plan upward",
      "toolB": "Not documented as a feature",
      "whyItMatters": "Businesses billing or paying in more than one currency need native conversion and reporting support",
      "benefitsWho": "Businesses with international clients or vendors benefit from QuickBooks Online"
    },
    {
      "title": "Built-in online payment processing",
      "toolA": "Not documented in the available facts as a directly stated invoice payment feature",
      "toolB": "Wave Payments accepts credit card and bank transfer payments directly on invoices, with disclosed processing rates of 2.9 percent plus 0.60 dollars per credit card transaction on Starter",
      "whyItMatters": "Getting paid faster on invoices matters for cash flow, and knowing the exact fee structure avoids surprises",
      "benefitsWho": "Freelancers and small businesses that invoice clients directly benefit from Wave's transparent, built-in payment rates"
    },
    {
      "title": "Bookkeeping and advisory support",
      "toolA": "Advanced tier includes dedicated account support; accountant users can log in directly with their own credentials",
      "toolB": "Wave Advisors offers access to bookkeeping and tax support from in-house professionals as an add-on",
      "whyItMatters": "Businesses without in-house accounting expertise often need outside help interpreting the numbers",
      "benefitsWho": "Businesses wanting done-for-you bookkeeping help benefit from Wave Advisors; those with an existing accountant benefit from QuickBooks Online's accountant access"
    },
    {
      "title": "Overall feature depth versus simplicity",
      "toolA": "Four plan tiers add complexity and depth as the business grows, including budgeting tools and advanced reporting and dashboards on higher tiers",
      "toolB": "A single, simple free core product with fewer configuration options and a documented learning curve advantage for non-accountants",
      "whyItMatters": "More features add capability but also more setup and learning time",
      "benefitsWho": "Businesses anticipating growth benefit from QuickBooks Online's headroom; businesses wanting to get started immediately benefit from Wave's simplicity"
    }
  ],
  "featureMatrix": [
    {
      "group": "Invoicing and Payments",
      "rows": [
        {
          "feature": "Invoicing and estimates",
          "toolA": "available",
          "toolB": "available",
          "note": "Wave states unlimited invoices and estimates on every plan"
        },
        {
          "feature": "Automated payment reminders",
          "toolA": "available",
          "toolB": "available",
          "note": "Wave lists automated late payment reminders as a Pro plan feature"
        },
        {
          "feature": "Recurring billing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stated explicitly in Wave's Unlimited Invoicing feature description"
        },
        {
          "feature": "Online payment acceptance on invoices",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wave Payments supports credit card and bank transfer ACH or EFT payments"
        }
      ]
    },
    {
      "group": "Banking and Expense Tracking",
      "rows": [
        {
          "feature": "Bank feed automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Wave's automated bank and credit card feeds via Plaid require the Pro plan"
        },
        {
          "feature": "Receipt capture or scanning",
          "toolA": "available",
          "toolB": "available",
          "note": "Wave receipt scanning is unlimited on Pro"
        },
        {
          "feature": "Mileage tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Logged automatically via the QuickBooks Online mobile app"
        }
      ]
    },
    {
      "group": "Payroll",
      "rows": [
        {
          "feature": "Payroll add-on",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer payroll as a separate paid subscription"
        },
        {
          "feature": "Full-service payroll tax filing in all regions",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Wave full-service filing is limited to select US states and Canadian provinces; self-service payroll is available elsewhere"
        }
      ]
    },
    {
      "group": "Reporting and Financial Management",
      "rows": [
        {
          "feature": "Standard financial reports such as profit and loss, balance sheet, and cash flow",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Budgeting tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included from the QuickBooks Online Plus plan"
        },
        {
          "feature": "Multi-currency support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included from the QuickBooks Online Essentials plan"
        }
      ]
    },
    {
      "group": "Inventory and Project Tracking",
      "rows": [
        {
          "feature": "Inventory management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "QuickBooks Online offers this on eligible plans; Wave documentation states no inventory management"
        },
        {
          "feature": "Project or class profitability tracking",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Wave documentation states no project tracking or job costing"
        }
      ]
    },
    {
      "group": "Collaboration and User Access",
      "rows": [
        {
          "feature": "Multi-user access with tiered limits",
          "toolA": "available",
          "toolB": "available",
          "note": "QuickBooks Online scales from 1 to 25 users across tiers; Wave Pro allows unlimited collaborators"
        },
        {
          "feature": "Accountant or bookkeeper access",
          "toolA": "available",
          "toolB": "available",
          "note": "Wave offers this through Wave Advisors and collaborator invites"
        },
        {
          "feature": "Custom user permissions and roles",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included on the QuickBooks Online Advanced plan"
        }
      ]
    },
    {
      "group": "Platform and Integrations",
      "rows": [
        {
          "feature": "Mobile apps for iOS and Android",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Third-party app marketplace and API",
          "toolA": "available",
          "toolB": "limited",
          "note": "Wave documentation notes limited third-party integrations compared to competitors"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, QuickBooks Online or Wave?",
      "answer": "Wave is cheaper for most small businesses because its Starter plan is free with unlimited invoicing and basic bookkeeping, while QuickBooks Online starts at approximately 35 dollars per month for its entry-level Simple Start plan."
    },
    {
      "question": "Is Wave good enough to replace QuickBooks Online?",
      "answer": "For freelancers and very small businesses that only need invoicing, basic bookkeeping, and simple expense tracking, Wave can replace QuickBooks Online, but it lacks inventory management, project tracking, and multi-currency support that growing businesses on QuickBooks Online rely on."
    },
    {
      "question": "Does Wave have inventory management like QuickBooks Online?",
      "answer": "No, Wave's documentation confirms it has no inventory management, project tracking, or job costing features, while QuickBooks Online offers inventory tracking on eligible plans."
    },
    {
      "question": "Does Wave payroll work everywhere QuickBooks Payroll does?",
      "answer": "Not necessarily, since Wave's full-service payroll tax filing is only documented as available in select US states and Canadian provinces, with self-service payroll elsewhere, so businesses outside those regions should confirm coverage before choosing either payroll option."
    },
    {
      "question": "Which tool is better for a growing business with multiple employees?",
      "answer": "QuickBooks Online is generally the better fit for a growing business because it offers tiered user limits up to 25 users, custom permissions and roles, multi-currency support, and project profitability tracking that Wave does not document."
    },
    {
      "question": "Does Wave charge fees for accepting online payments?",
      "answer": "Yes, Wave charges 2.9 percent plus 0.60 dollars per credit card transaction on the free Starter plan, with a discounted rate on the first 10 transactions per month for Pro subscribers, plus lower rates for bank transfer ACH or EFT payments."
    }
  ]
};

export default quickbooksOnlineVsWaveContent;
