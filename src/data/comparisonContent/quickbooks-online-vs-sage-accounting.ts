import type { ToolComparisonContent } from './types';

const quickbooksOnlineVsSageAccountingContent: ToolComparisonContent = {
  "verdict": "QuickBooks Online and Sage Accounting both serve small businesses that need invoicing, bank reconciliation, and financial reporting, but they are built around different priorities. QuickBooks Online leans into breadth: a large app marketplace, an open API, and a four-tier plan structure that scales up to inventory, project tracking, and advanced reporting for growing US-centric businesses. Its ecosystem size also means it is easier to find bookkeepers and accountants already trained on the platform. Sage Accounting starts at a lower entry price and bundles an AI assistant, Sage Copilot, even on its base plan, alongside built-in cash flow forecasting and UK-specific VAT and Construction Industry Scheme filing that QuickBooks Online's documented feature set does not address. Sage's ceiling is lower, though: multi-currency, inventory, and budgeting are all locked to its top Plus plan, and its third-party integration ecosystem is narrower than QuickBooks Online's. A business that is US-based, expects to add employees or apps over time, and wants deep reporting will likely find QuickBooks Online's tiers a better long-term fit. A leaner business, a UK-based one with VAT and CIS obligations, or one that wants forecasting and AI assistance from day one at a lower starting cost may prefer Sage Accounting. Neither tool's documented facts show a clear across-the-board winner; the right choice depends on region, growth plans, and which specific features matter most.",
  "bestForToolA": "QuickBooks Online fits small and growing US businesses that want a wide app marketplace, API access, payroll add-ons, and a four-tier plan path from basic invoicing up to advanced multi-user reporting.",
  "bestForToolB": "Sage Accounting fits cost-conscious small businesses, especially UK-based ones needing VAT and CIS submission, that want built-in cash flow forecasting and an AI assistant included from the entry-level plan.",
  "whoNeedsBoth": "An accounting firm or bookkeeper serving a mixed client base, some needing QuickBooks Online's payroll and app ecosystem and others needing Sage Accounting's UK compliance tools, would reasonably end up supporting both platforms.",
  "keyDifferences": [
    {
      "title": "Starting price",
      "toolA": "QuickBooks Online starts at approximately 35 dollars per month for the Simple Start plan, US pricing before promotions.",
      "toolB": "Sage Accounting starts at 20 dollars per month for the Accounting Start plan, US pricing.",
      "whyItMatters": "Entry cost matters most to very small businesses and solo operators evaluating monthly software spend before committing.",
      "benefitsWho": "Budget-sensitive small businesses and freelancers benefit from Sage Accounting's lower entry price."
    },
    {
      "title": "Plan tier structure",
      "toolA": "QuickBooks Online offers four tiers: Simple Start, Essentials, Plus, and Advanced, topping out at approximately 235 dollars per month with expanded user limits and dedicated account support.",
      "toolB": "Sage Accounting offers three tiers: Accounting Start, Standard, and Plus, topping out at 50 dollars per month.",
      "whyItMatters": "More tiers and a higher ceiling let a business scale user counts, permissions, and reporting depth further without switching platforms.",
      "benefitsWho": "Growing businesses that expect to add many users or need advanced dashboards benefit from QuickBooks Online's wider tier range."
    },
    {
      "title": "AI assistant",
      "toolA": "QuickBooks Online's documented feature set does not include a named AI assistant.",
      "toolB": "Sage Accounting includes Sage Copilot, an AI-assisted feature for answering finance questions and automating routine bookkeeping tasks, starting on the base Accounting Start plan.",
      "whyItMatters": "Built-in AI assistance can reduce time spent on routine data entry and answering basic finance questions without added software.",
      "benefitsWho": "Small business owners without dedicated bookkeeping staff benefit from Sage Accounting's included AI assistant."
    },
    {
      "title": "Cash flow forecasting",
      "toolA": "Not documented as a named feature in QuickBooks Online's provided facts.",
      "toolB": "Sage Accounting includes cash flow forecasting starting on the Accounting Standard plan, projecting future cash position from historical transaction data.",
      "whyItMatters": "Forward-looking cash visibility helps businesses plan for shortfalls or surpluses rather than only reviewing historical reports.",
      "benefitsWho": "Businesses managing tight or seasonal cash flow benefit from Sage Accounting's built-in forecasting."
    },
    {
      "title": "Payroll",
      "toolA": "QuickBooks Online offers payroll as a separate Intuit Payroll add-on subscription that integrates with the core accounting data.",
      "toolB": "Not documented as an available feature in Sage Accounting's provided facts.",
      "whyItMatters": "Having a payroll add-on from the same vendor as the accounting software simplifies employee payment and tax filing workflows.",
      "benefitsWho": "US small businesses with employees benefit from QuickBooks Online's integrated payroll add-on path."
    },
    {
      "title": "Regional compliance filing",
      "toolA": "Not documented as an available feature in QuickBooks Online's provided facts.",
      "toolB": "Sage Accounting supports direct submission of VAT returns and Construction Industry Scheme filings for UK-based businesses, starting on the Accounting Standard plan.",
      "whyItMatters": "Built-in regional tax filing removes a manual or third-party step for businesses operating under UK tax rules.",
      "benefitsWho": "UK-based businesses and contractors under the Construction Industry Scheme benefit from Sage Accounting's built-in filing tools."
    },
    {
      "title": "Integration ecosystem and API",
      "toolA": "QuickBooks Online integrates with e-commerce, point-of-sale, and CRM apps through a large app marketplace and Intuit's developer API.",
      "toolB": "Sage Accounting's third-party integration ecosystem is documented as narrower than competitors that emphasize open APIs and app marketplaces.",
      "whyItMatters": "A larger integration ecosystem lets a business connect existing tools without custom development work.",
      "benefitsWho": "Businesses already using e-commerce, point-of-sale, or CRM tools benefit from QuickBooks Online's broader app marketplace."
    },
    {
      "title": "Inventory management access",
      "toolA": "QuickBooks Online includes inventory tracking with quantities on hand, cost of goods sold, and reorder points, available starting on the Plus plan.",
      "toolB": "Sage Accounting includes inventory management for tracking stock levels and costs, available only on the top Accounting Plus plan.",
      "whyItMatters": "Product-based businesses need quantity and cost tracking, and the plan tier at which this unlocks affects the realistic monthly cost.",
      "benefitsWho": "Product-based small businesses on either platform need to budget for the mid-to-top tier where inventory tools appear."
    },
    {
      "title": "Multi-currency support",
      "toolA": "QuickBooks Online includes multi-currency support starting on the Essentials plan.",
      "toolB": "Sage Accounting includes multi-currency invoicing, reporting, and exchange rate gain and loss tracking only on the top Accounting Plus plan.",
      "whyItMatters": "Businesses invoicing international customers need multi-currency support unlocked at a plan tier they can reasonably afford.",
      "benefitsWho": "Businesses with international customers benefit from QuickBooks Online offering multi-currency at a lower tier than Sage Accounting."
    },
    {
      "title": "Company history and headquarters",
      "toolA": "QuickBooks Online is made by Intuit, founded in 1983 and headquartered in Mountain View, California, USA.",
      "toolB": "Sage Accounting is made by Sage, founded in 1981 and headquartered in Newcastle upon Tyne, United Kingdom.",
      "whyItMatters": "Vendor origin often correlates with which region's tax rules, support hours, and accountant networks are most deeply supported.",
      "benefitsWho": "US-based businesses may lean toward QuickBooks Online's US roots, while UK-based businesses may lean toward Sage's UK roots."
    }
  ],
  "featureMatrix": [
    {
      "group": "Invoicing and Sales",
      "rows": [
        {
          "feature": "Invoicing and quotes",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Payment reminders for unpaid balances",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Banking and Expenses",
      "rows": [
        {
          "feature": "Bank feed reconciliation",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automatic receipt and expense capture",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Cash flow forecasting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sage: available starting on Accounting Standard plan"
        }
      ]
    },
    {
      "group": "Reporting",
      "rows": [
        {
          "feature": "Standard financial reports (profit and loss, balance sheet, cash flow)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Advanced reporting and dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "QuickBooks: Advanced plan; Sage: Standard and Plus plans"
        }
      ]
    },
    {
      "group": "Payroll and Team Access",
      "rows": [
        {
          "feature": "Payroll processing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "QuickBooks: separate Intuit Payroll add-on subscription"
        },
        {
          "feature": "Multi-user roles and accountant access",
          "toolA": "available",
          "toolB": "available",
          "note": "QuickBooks user counts vary by tier"
        }
      ]
    },
    {
      "group": "Inventory and Project Tracking",
      "rows": [
        {
          "feature": "Inventory management",
          "toolA": "available",
          "toolB": "limited",
          "note": "QuickBooks: Plus and Advanced plans; Sage: Plus plan only"
        },
        {
          "feature": "Project or class profitability tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "QuickBooks: Plus and Advanced plans"
        },
        {
          "feature": "Budgeting tools",
          "toolA": "available",
          "toolB": "limited",
          "note": "Sage: Plus plan only"
        }
      ]
    },
    {
      "group": "Currency and Compliance",
      "rows": [
        {
          "feature": "Multi-currency invoicing and reporting",
          "toolA": "available",
          "toolB": "limited",
          "note": "QuickBooks: Essentials plan and above; Sage: Plus plan only"
        },
        {
          "feature": "VAT and Construction Industry Scheme submission (UK)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sage: Standard and Plus plans"
        }
      ]
    },
    {
      "group": "Mobile, AI, and Integrations",
      "rows": [
        {
          "feature": "iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Mileage tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "AI assistant for finance questions and automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sage Copilot, included from the Start plan"
        },
        {
          "feature": "App marketplace and open developer API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Sage's integration ecosystem is documented as narrower"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, QuickBooks Online or Sage Accounting?",
      "answer": "Sage Accounting is cheaper at entry level, starting at 20 dollars per month versus approximately 35 dollars per month for QuickBooks Online Simple Start, though both prices are US figures before promotions and can change with plan tier and region."
    },
    {
      "question": "Is Sage Accounting or QuickBooks Online better for a beginner with no bookkeeping experience?",
      "answer": "Sage Accounting's included Sage Copilot AI assistant, available from its base plan, can help answer finance questions and automate routine tasks, while QuickBooks Online's provided facts note a learning curve for users without prior bookkeeping or accounting experience, so Sage Accounting may feel more approachable to a first-time user at the entry tier."
    },
    {
      "question": "Does Sage Accounting have payroll like QuickBooks Online?",
      "answer": "QuickBooks Online offers payroll through a separate Intuit Payroll add-on subscription that integrates with its accounting data, while Sage Accounting's provided facts do not document a payroll feature."
    },
    {
      "question": "Which tool is better for UK-based businesses with VAT obligations?",
      "answer": "Sage Accounting is the better documented fit for UK businesses, since it directly supports VAT return submission and Construction Industry Scheme filing, features not documented in QuickBooks Online's facts."
    },
    {
      "question": "Can QuickBooks Online and Sage Accounting both handle multi-currency invoicing?",
      "answer": "Yes, both support multi-currency invoicing, but QuickBooks Online includes it starting on its Essentials plan while Sage Accounting locks it to its top Accounting Plus plan."
    },
    {
      "question": "Which has a bigger app integration ecosystem, QuickBooks Online or Sage Accounting?",
      "answer": "QuickBooks Online has the larger documented integration ecosystem, with a wide app marketplace covering e-commerce, point-of-sale, and CRM tools plus a developer API, while Sage Accounting's third-party integration ecosystem is documented as narrower by comparison."
    }
  ]
};

export default quickbooksOnlineVsSageAccountingContent;
