import type { ToolComparisonContent } from './types';

const arcVsStripeContent: ToolComparisonContent = {
  "verdict": "Arc and Stripe address different sides of a company's finances rather than competing directly. Arc manages a company's own idle cash, cards, and debt financing, while Stripe is a modular payment-processing and financial infrastructure platform for accepting and moving money to and from customers across 195 countries. Companies are more likely to use them side-by-side than to choose one over the other.",
  "bestForToolA": "Arc suits a venture-backed tech company wanting brokerage yield up to roughly 4.57%, a cashback card, and access to a debt capital marketplace, starting from a free Essentials tier.",
  "bestForToolB": "Stripe suits a company processing customer payments globally that wants no setup or monthly base fee on standard payments and access to modular add-ons like Billing, Tax, Connect (marketplace payouts), Issuing, and Identity as it scales.",
  "whoNeedsBoth": "A marketplace startup could use Stripe Connect to route payments to sellers across 195 countries while using Arc to manage the operating cash sitting in its own treasury and to raise venture debt for growth.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Arc handles treasury and cash management for a company's own funds: yield, a cashback card, debt capital raising, and an AI CFO Agent.",
      "toolB": "Stripe handles payment processing and financial infrastructure for accepting and moving money, covering 195 countries and 135+ currencies.",
      "whyItMatters": "Solving 'where do we bank and raise capital' versus 'how do we get paid' are fundamentally different problems.",
      "benefitsWho": "Finance/treasury teams need Arc; payments and engineering teams need Stripe."
    },
    {
      "title": "Pricing Model",
      "toolA": "Arc is Freemium, with a free Essentials tier at $0/month and Premium/Enterprise as custom annual memberships that unlock higher yield and cashback.",
      "toolB": "Stripe is Usage-based, with no setup fee or monthly base fee on standard payment processing — cost is purely per-transaction.",
      "whyItMatters": "Arc's cost is about opting into higher membership tiers, while Stripe's bill scales directly with transaction volume.",
      "benefitsWho": "Early-stage companies benefit from both having no-cost entry points, but transaction growth affects Stripe's bill directly."
    },
    {
      "title": "Product Breadth",
      "toolA": "Arc bundles cash management, a business card, debt capital raising, and an AI CFO Agent in one platform.",
      "toolB": "Stripe offers modular, separately-priced products beyond core payments: Billing, Invoicing, Tax, Connect, Issuing, and Identity.",
      "whyItMatters": "Stripe's modularity lets companies pay only for needed products, but per its own documented con, that makes total cost less predictable than a single flat number.",
      "benefitsWho": "Companies with evolving payment-adjacent needs (tax calculation, marketplace payouts, card issuing) benefit from Stripe's modular lineup."
    },
    {
      "title": "Yield on Cash",
      "toolA": "Arc pays brokerage net yield up to roughly 4.6% depending on membership tier.",
      "toolB": "Stripe's documented features don't include yield on held balances — it is a payment processor, not a treasury/yield product.",
      "whyItMatters": "Idle cash sitting with Stripe isn't documented to earn yield the way Arc's does.",
      "benefitsWho": "Finance teams optimizing returns on operating cash benefit specifically from Arc."
    },
    {
      "title": "Global Reach & Marketplace Payouts",
      "toolA": "Arc's documented footprint is US-based, headquartered in San Francisco, CA and New York, NY, with no international payment-acceptance feature listed.",
      "toolB": "Stripe supports 195 countries and 135+ currencies, with Connect enabling marketplace payouts to multiple parties via a platform fee.",
      "whyItMatters": "Companies needing to pay out to sellers or contractors across many countries need Stripe Connect, not Arc.",
      "benefitsWho": "Global marketplaces and platforms with multi-party payouts benefit from Stripe Connect."
    }
  ],
  "featureMatrix": [
    {
      "group": "Treasury & Capital",
      "rows": [
        {
          "feature": "Yield on idle cash",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Arc: up to ~4.6% by tier"
        },
        {
          "feature": "Business card with cashback",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Arc: 1.0%-2.0% by tier"
        },
        {
          "feature": "Debt capital raising",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "AI financial assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Arc's CFO Agent"
        }
      ]
    },
    {
      "group": "Payments & Money Movement",
      "rows": [
        {
          "feature": "Global payment acceptance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "195 countries, 135+ currencies"
        },
        {
          "feature": "Marketplace/multi-party payouts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Via Stripe Connect"
        },
        {
          "feature": "Billing/subscription management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Tax calculation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Card issuing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Identity verification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free entry point",
          "toolA": "available",
          "toolB": "available",
          "note": "Arc: free Essentials tier; Stripe: no setup/monthly fee"
        },
        {
          "feature": "Custom/enterprise pricing tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Arc: Premium/Enterprise annual membership"
        },
        {
          "feature": "Founding year disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Arc: 2021"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Arc and Stripe compete for the same budget line?",
      "answer": "Not directly. Arc manages a company's own cash, card spend, and debt financing, while Stripe processes payments from customers; many companies use both."
    },
    {
      "question": "Does Stripe pay yield on funds like Arc does?",
      "answer": "Stripe's documented features focus on payment processing and modular financial products (Billing, Tax, Connect, Issuing, Identity); no yield-on-balance feature is documented, unlike Arc's brokerage yield up to roughly 4.6%."
    },
    {
      "question": "Which has a free starting tier?",
      "answer": "Both, in different ways — Arc has a free Essentials membership tier ($0/month), and Stripe has no setup fee or monthly base fee on standard payment processing."
    },
    {
      "question": "Can Stripe handle payouts to multiple sellers?",
      "answer": "Yes, via Connect, which charges a platform fee for routing payments to multiple parties — useful for marketplaces."
    },
    {
      "question": "Is Arc's ownership stable?",
      "answer": "Axos Financial announced a definitive agreement in July 2026 to acquire Arc Technologies, Inc., which may bring platform changes. No similar ownership change is documented for Stripe."
    },
    {
      "question": "Which supports more countries for payments?",
      "answer": "Stripe documents support for 195 countries and 135+ currencies. Arc's documented headquarters are San Francisco, CA and New York, NY, with no international payment-acceptance feature listed."
    }
  ]
};

export default arcVsStripeContent;
