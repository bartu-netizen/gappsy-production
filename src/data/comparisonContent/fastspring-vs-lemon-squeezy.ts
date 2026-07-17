import type { ToolComparisonContent } from './types';

const fastspringVsLemonSqueezyContent: ToolComparisonContent = {
  "verdict": "FastSpring and Lemon Squeezy are both merchant-of-record platforms absorbing tax and compliance liability for software sellers, but they differ in pricing structure and company trajectory: FastSpring uses custom, negotiated flat-rate pricing with all features bundled, while Lemon Squeezy uses a published percentage-plus-flat transaction fee with several stackable add-on fees, and is now being folded into Stripe's payments roadmap.",
  "bestForToolA": "FastSpring fits established software sellers wanting all-inclusive flat-rate pricing negotiated with an account executive, broad regional coverage (200+ regions, 35+ currencies, 21+ languages), a built-in affiliate marketing network, and B2B digital invoicing/quotes -- backed by a documented base of 3,200+ customers processing over $2B/year.",
  "bestForToolB": "Lemon Squeezy fits smaller or newer sellers wanting to start with no monthly fee or contract, a simple published rate (5% + $0.50/transaction), AI-based fraud protection, and support for up to 21 payment methods including PayPal across 135+ countries -- while accepting stackable add-on fees for international sales, PayPal, subscriptions, cart recovery, and affiliates, and some uncertainty as Stripe evolves it toward Stripe Managed Payments.",
  "whoNeedsBoth": "The facts don't indicate a scenario for running both simultaneously; sellers typically choose one MoR provider per product line based on whether they prefer negotiated flat-rate pricing or transparent per-transaction pricing.",
  "keyDifferences": [
    {
      "title": "Pricing structure",
      "toolA": "Custom, negotiated flat-rate pricing based on transaction type and business volume, with all features included -- no public price list.",
      "toolB": "Published rate of 5% + $0.50 per transaction with no monthly fee, plus stackable add-on fees (+1.5% international, +1.5% PayPal, +0.5% subscriptions, +5% abandoned cart recovery, +3% affiliates).",
      "whyItMatters": "Negotiated flat-rate pricing can be more predictable at scale but requires a sales conversation, while published per-transaction pricing is instantly comparable but can add up with stacked fees.",
      "benefitsWho": "Larger sellers negotiating custom terms benefit from FastSpring; sellers wanting instant self-serve pricing benefit from Lemon Squeezy, if they can tolerate stacked fees."
    },
    {
      "title": "Company ownership and stability",
      "toolA": "Independent company founded in 2006, headquartered in Santa Barbara, California.",
      "toolB": "Acquired by Stripe in July 2024; continues operating under its own name while Stripe develops Stripe Managed Payments.",
      "whyItMatters": "An acquisition mid-evolution introduces roadmap and migration uncertainty that an independent, long-tenured company doesn't carry.",
      "benefitsWho": "Sellers who prioritize long-term platform stability over acquiring-company synergies."
    },
    {
      "title": "Fraud protection approach",
      "toolA": "Includes built-in risk management and fraud prevention on transactions, without specifying the underlying technology.",
      "toolB": "Uses an AI-based fraud system to assess risk and reduce chargebacks.",
      "whyItMatters": "The explicit AI-based approach may signal a different, potentially more adaptive detection method, though both aim to reduce fraud losses.",
      "benefitsWho": "Sellers concerned about chargeback rates and evolving fraud patterns."
    },
    {
      "title": "Scale and track record",
      "toolA": "Serves 3,200+ customers and processes over $2B in transactions per year.",
      "toolB": "Customer base and transaction volume are not documented in the facts.",
      "whyItMatters": "Documented scale can serve as a proof point for reliability at high transaction volumes.",
      "benefitsWho": "Larger software sellers wanting evidence of a platform's track record before committing."
    },
    {
      "title": "Affiliate marketing costs",
      "toolA": "Built-in affiliate marketing network included in flat-rate pricing.",
      "toolB": "Affiliate program available but charged as a +3% add-on fee.",
      "whyItMatters": "Whether affiliate tooling is bundled or billed separately affects the true cost of running an affiliate/referral program.",
      "benefitsWho": "Sellers running affiliate-driven sales motions who want to avoid extra per-referral fees."
    }
  ],
  "featureMatrix": [
    {
      "group": "Merchant of Record Core",
      "rows": [
        {
          "feature": "Tax compliance handling",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Fraud prevention",
          "toolA": "available",
          "toolB": "available",
          "note": "Lemon Squeezy's is explicitly AI-based; FastSpring's underlying technology isn't specified."
        },
        {
          "feature": "Dunning/failed-payment recovery",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Affiliate marketing tools",
          "toolA": "available",
          "toolB": "available",
          "note": "FastSpring bundles this; Lemon Squeezy charges a +3% add-on fee."
        },
        {
          "feature": "B2B invoicing/quotes",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Published price list",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Lemon Squeezy: 5% + $0.50/transaction."
        },
        {
          "feature": "Monthly/subscription fee",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Lemon Squeezy explicitly has no monthly fee."
        },
        {
          "feature": "Flat all-inclusive pricing (no à la carte fees)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Lemon Squeezy adds fees for international, PayPal, subscriptions, cart recovery, and affiliates."
        }
      ]
    },
    {
      "group": "Reach & Scale",
      "rows": [
        {
          "feature": "Countries/regions supported",
          "toolA": "available",
          "toolB": "available",
          "note": "FastSpring: 200+ regions. Lemon Squeezy: 135+ countries."
        },
        {
          "feature": "Currencies supported",
          "toolA": "available",
          "toolB": "available",
          "note": "FastSpring: 35+ currencies. Lemon Squeezy: 130+ currencies."
        },
        {
          "feature": "Documented customer base / transaction volume",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "FastSpring: 3,200+ customers, $2B+/year."
        },
        {
          "feature": "Payment methods count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lemon Squeezy: up to 21 payment methods including PayPal."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How is FastSpring priced compared to Lemon Squeezy?",
      "answer": "FastSpring uses custom, negotiated flat-rate pricing with no public price list. Lemon Squeezy charges a published 5% + $0.50 per transaction with no monthly fee, plus add-on fees for international sales, PayPal, subscriptions, abandoned cart recovery, and affiliates."
    },
    {
      "question": "Is Lemon Squeezy still an independent company?",
      "answer": "No -- Stripe acquired Lemon Squeezy in July 2024; it continues operating under its own name while Stripe develops Stripe Managed Payments."
    },
    {
      "question": "How many countries/currencies does each support?",
      "answer": "FastSpring supports 200+ regions and 35+ currencies. Lemon Squeezy supports 135+ countries and 130+ currencies with up to 21 payment methods, including PayPal."
    },
    {
      "question": "Does either offer a free trial?",
      "answer": "FastSpring's site offers a 'Try Now For Free' option, though specific trial terms aren't detailed. Lemon Squeezy requires no trial or contract to start -- it's free to begin with pay-as-you-go transaction fees."
    },
    {
      "question": "What is FastSpring's track record?",
      "answer": "FastSpring serves 3,200+ customers and processes over $2B in transactions per year."
    },
    {
      "question": "When was FastSpring founded?",
      "answer": "FastSpring was founded in 2006 and is headquartered in Santa Barbara, California, with additional offices in England, the Netherlands, and Canada."
    }
  ]
};

export default fastspringVsLemonSqueezyContent;
