import type { ToolComparisonContent } from './types';

const revolutBusinessVsWiseBusinessContent: ToolComparisonContent = {
  "verdict": "Revolut Business and Wise Business both help companies handle multi-currency money, but they are built around different core jobs. Revolut Business is a subscription-tiered business account and card platform: Basic through Enterprise plans bundle multi-currency accounts, corporate cards, bulk payments, expense management, and role-based team permissions, with API access unlocked on higher Scale and Enterprise tiers. It suits companies that want one dashboard for company cards, employee spend control, and payments together, and are willing to pay a monthly fee for a fuller feature set as they scale. Wise Business is built around low-cost, transparent cross-border money movement: no monthly subscription, a one-time setup fee, mid-market exchange rates with a small disclosed fee, local receiving account details in several currencies, and batch payments for up to 1,000 recipients. It suits companies whose main pain point is sending and receiving international payments cheaply and predictably, without paying for a card and expense management platform they may not need. Neither is a full bank: both lack lending, overdrafts, and physical branches. Buyers who mainly need corporate cards, team spend controls, and an all-in-one dashboard tend to fit Revolut Business better; buyers whose main need is cheap, transparent international transfers and local receiving details tend to fit Wise Business better. Many growing, internationally active companies end up using both side by side rather than picking one.",
  "bestForToolA": "Revolut Business fits teams that want an all-in-one dashboard for corporate cards, employee spend controls, expense management, and bulk payments, and that are willing to pay a monthly subscription for those bundled features as they grow.",
  "bestForToolB": "Wise Business fits companies whose main need is cheap, transparent cross-border payments and receiving money like a local business, without paying a recurring monthly fee for card and expense management tools they may not use.",
  "whoNeedsBoth": "A company that issues Revolut corporate cards and manages team expenses internally, but routes its lowest-cost cross-border payments and local currency receiving through Wise, would reasonably use both tools rather than choosing just one.",
  "keyDifferences": [
    {
      "title": "Pricing structure",
      "toolA": "Tiered monthly subscription plans from a free or low-cost Basic tier up to custom Enterprise pricing, with allowances and features scaling by plan.",
      "toolB": "No monthly subscription; a one-time setup fee around 31 dollars followed by per-transaction fees starting around 0.33 percent.",
      "whyItMatters": "Determines whether a business pays a predictable recurring fee for a feature bundle or pays only for the transactions it actually makes.",
      "benefitsWho": "Low-volume or occasional international senders benefit from Wise Business pay-as-you-go pricing, while teams that want predictable monthly costs for a full feature bundle benefit from Revolut Business plans."
    },
    {
      "title": "Core product focus",
      "toolA": "An all-in-one business account and card platform combining multi-currency accounts, corporate cards, expense management, and team permissions.",
      "toolB": "A cross-border payments and multi-currency receiving account built around mid-market exchange rates and local account details.",
      "whyItMatters": "Signals which tool is the primary system for spend management versus which is the primary tool for moving money internationally.",
      "benefitsWho": "Teams centralizing card issuing and spend approval benefit from Revolut Business, while teams focused on sending and receiving international payments benefit from Wise Business."
    },
    {
      "title": "Currency exchange fees",
      "toolA": "FX conversion at near-interbank rates within a fee-free monthly allowance that resets by plan, with charges once the allowance is exceeded.",
      "toolB": "FX conversion always priced at the real mid-market rate plus a small disclosed fee of around 0.33 percent, with no monthly allowance to track.",
      "whyItMatters": "Affects whether cost is predictable per transaction or dependent on staying under a monthly allowance.",
      "benefitsWho": "Businesses converting large or unpredictable volumes benefit from Wise Business transparent per-transaction pricing, while businesses with modest, steady FX needs can benefit from Revolut Business fee-free allowance."
    },
    {
      "title": "Local receiving account details",
      "toolA": "Not documented as offering local account details such as IBAN, routing number, or sort code in the provided facts.",
      "toolB": "Provides local account details, including IBAN, routing number, or sort code, in several major currencies such as USD, EUR, GBP, and AUD.",
      "whyItMatters": "Local receiving details let international clients pay a business as if it were a local company, avoiding wire fees on the sender side.",
      "benefitsWho": "Businesses invoicing clients across multiple countries benefit from Wise Business local account details."
    },
    {
      "title": "Batch and bulk payments",
      "toolA": "Offers bulk payments for paying multiple suppliers or running payroll in a single batch, without a documented recipient cap.",
      "toolB": "Offers batch payments via file upload for up to 1,000 recipients in one go.",
      "whyItMatters": "A documented, high recipient cap matters to businesses running large payroll or supplier payment runs.",
      "benefitsWho": "Larger payroll or contractor payout operations benefit from Wise Business documented 1,000 recipient batch capacity."
    },
    {
      "title": "API access availability",
      "toolA": "API access is restricted to higher-cost Scale and Enterprise plans.",
      "toolB": "API access is listed as a core feature without being tied to a specific higher-cost tier in the provided facts.",
      "whyItMatters": "Determines how much a business must spend before it can automate payments and reconciliation programmatically.",
      "benefitsWho": "Development teams building custom payment workflows may find Wise Business API access more accessible without upgrading to a top tier plan."
    },
    {
      "title": "Interest on balances",
      "toolA": "Not documented as offering interest on account balances.",
      "toolB": "Offers variable interest on eligible currency balances held in the account.",
      "whyItMatters": "Interest on idle balances can offset costs for businesses holding significant multi-currency cash reserves.",
      "benefitsWho": "Businesses holding larger cash balances across currencies benefit from Wise Business interest feature."
    },
    {
      "title": "Team permissions and expense management depth",
      "toolA": "Includes role-based team permissions plus expense management with receipt capture, spend limits, and approval workflows tied to company cards.",
      "toolB": "Offers real-time expense tracking tied to the Wise Business card, but role-based team permissions and receipt-capture approval workflows are not documented.",
      "whyItMatters": "Deeper permissioning and receipt-capture workflows matter to finance teams managing many cardholders and approval chains.",
      "benefitsWho": "Finance teams needing granular approval workflows benefit from Revolut Business documented permissions and expense tools."
    },
    {
      "title": "Company age and founding",
      "toolA": "Founded in 2015 and headquartered in London.",
      "toolB": "Founded in 2011 and headquartered in London.",
      "whyItMatters": "Longer operating history can factor into a buyer comfort level holding company funds with a financial technology provider.",
      "benefitsWho": "Risk-conscious buyers weighing track record may note Wise Business slightly longer operating history."
    }
  ],
  "featureMatrix": [
    {
      "group": "Accounts and currencies",
      "rows": [
        {
          "feature": "Multi-currency account",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Local receiving account details (IBAN, routing, sort code)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wise documents this in several currencies including USD, EUR, GBP, and AUD"
        },
        {
          "feature": "Interest on balances",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wise offers variable interest on eligible balances"
        }
      ]
    },
    {
      "group": "Currency exchange",
      "rows": [
        {
          "feature": "Near-interbank or mid-market FX rates",
          "toolA": "available",
          "toolB": "available",
          "note": "Revolut applies its rate within a fee-free monthly allowance; Wise applies the mid-market rate plus a small fee on every conversion"
        },
        {
          "feature": "Fee-free monthly FX allowance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Wise has no monthly allowance model since it charges per transaction instead"
        }
      ]
    },
    {
      "group": "Cards and spending controls",
      "rows": [
        {
          "feature": "Physical corporate cards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Virtual cards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Individual spending limits",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Payments",
      "rows": [
        {
          "feature": "International payments",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Domestic and local payments",
          "toolA": "available",
          "toolB": "available",
          "note": "Wise supports this via local receiving account details"
        },
        {
          "feature": "Bulk or batch payments",
          "toolA": "available",
          "toolB": "available",
          "note": "Wise documents a cap of up to 1,000 recipients per batch; Revolut does not document a specific cap"
        },
        {
          "feature": "Invoicing",
          "toolA": "available",
          "toolB": "available",
          "note": "Wise also includes shareable payment links alongside invoicing"
        }
      ]
    },
    {
      "group": "Integrations and API",
      "rows": [
        {
          "feature": "Accounting software integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Wise names Xero and QuickBooks specifically"
        },
        {
          "feature": "API access",
          "toolA": "limited",
          "toolB": "available",
          "note": "Revolut API access requires the Scale or Enterprise plan"
        }
      ]
    },
    {
      "group": "Team and expense management",
      "rows": [
        {
          "feature": "Role-based team permissions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Expense management with receipt capture and approvals",
          "toolA": "available",
          "toolB": "limited",
          "note": "Wise Business card offers real-time expense tracking but no documented receipt-capture approval workflow"
        }
      ]
    },
    {
      "group": "Platform and support",
      "rows": [
        {
          "feature": "Web dashboard",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "iOS and Android apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Phone-first or branch support",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both rely primarily on app or chat based support per their documented cons"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Revolut Business or Wise Business cheaper?",
      "answer": "Wise Business has no monthly subscription fee, charging a one-time setup fee of around 31 dollars plus per-transaction fees from about 0.33 percent, while Revolut Business charges recurring monthly fees on paid plans that range from around 30 dollars up to custom Enterprise pricing, so Wise Business tends to cost less for low or occasional transaction volumes while Revolut Business can be more cost-effective for teams that fully use its bundled card and expense features every month."
    },
    {
      "question": "Which is better for receiving international payments like a local business?",
      "answer": "Wise Business is documented as offering local account details, such as IBAN, routing number, or sort code, in several major currencies, which lets international clients pay as if the business were local, a specific capability that is not documented for Revolut Business."
    },
    {
      "question": "Does Wise Business offer physical cards like Revolut Business?",
      "answer": "Yes, both Revolut Business and Wise Business offer physical and virtual cards with individual spending limits, though Revolut Business also documents broader expense management with receipt capture and approval workflows tied to those cards."
    },
    {
      "question": "Can I get API access with both Revolut Business and Wise Business?",
      "answer": "Both offer API access, but Revolut Business restricts it to the higher-cost Scale and Enterprise plans, while Wise Business lists API access as a core feature without tying it to a specific higher-cost tier in the documented facts."
    },
    {
      "question": "Which tool is better for a small business with only occasional international transfers?",
      "answer": "Wise Business tends to suit occasional international senders better because it has no monthly subscription fee and charges only per-transaction costs, whereas Revolut Business paid plans add a recurring monthly fee that is easier to justify with regular, higher-volume usage."
    },
    {
      "question": "Do Revolut Business or Wise Business charge monthly fees?",
      "answer": "Revolut Business paid plans, such as Grow, Scale, and Enterprise, charge a recurring monthly subscription fee, though some markets offer a free entry-level tier, while Wise Business has no monthly subscription fee at all, only a one-time setup fee and per-transaction charges."
    }
  ]
};

export default revolutBusinessVsWiseBusinessContent;
