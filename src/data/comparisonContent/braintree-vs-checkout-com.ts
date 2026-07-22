import type { ToolComparisonContent } from './types';

const braintreeVsCheckoutComContent: ToolComparisonContent = {
  "verdict": "Braintree and Checkout.com are both enterprise-capable payment processors, but they differ sharply on pricing transparency and scale. Braintree, backed by PayPal, publishes an exact standard rate (2.89% + $0.29) with no monthly or setup fees and a discounted charity rate, alongside a free developer sandbox. Checkout.com publishes no pricing at all — every merchant negotiates a custom flat-rate or interchange++ quote — but documents processing $300BN in ecommerce payments in 2025, local acquiring in 50+ countries, and an AI-powered payment optimization feature called Boost.",
  "bestForToolA": "Merchants that want to see an exact transaction rate without a sales call, that need mobile SDKs and a free sandbox for development, and that want single-touch checkout across cards, PayPal, Venmo, and digital wallets backed by PayPal's infrastructure.",
  "bestForToolB": "Large or high-volume enterprises that need local acquiring in specific countries, AI-powered payment acceptance optimization (Boost), global money movement and payouts (Move), and support for 150+ processing currencies, and that are prepared to negotiate custom pricing.",
  "whoNeedsBoth": "A multi-region enterprise might use Braintree for smaller-volume or self-serve card/wallet/Venmo processing where the published standard rate applies, while routing its highest-volume or specific-country flows through Checkout.com's negotiated flat-rate or interchange++ pricing and local acquiring — the two are documented at different points on the volume/negotiation spectrum rather than as interchangeable substitutes.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Braintree publishes its standard commercial rate (2.89% + $0.29) and a discounted charity rate (2.19% + $0.29) directly.",
      "toolB": "Checkout.com publishes no price list; every merchant contacts sales for a tailored flat-rate or interchange++ quote.",
      "whyItMatters": "Published rates let smaller merchants estimate cost without a sales process, while fully custom pricing suits enterprises that expect a negotiated deal anyway.",
      "benefitsWho": "Smaller merchants and developers evaluating cost upfront versus enterprise procurement teams used to negotiated contracts."
    },
    {
      "title": "AI-powered payment optimization",
      "toolA": "Braintree's facts do not document an AI-driven acceptance optimization feature.",
      "toolB": "Checkout.com's Boost feature uses AI-powered 'Intelligent Acceptance' to optimize payment approval rates.",
      "whyItMatters": "AI-driven acceptance optimization can materially affect approval rates at high transaction volumes, which matters more as volume grows.",
      "benefitsWho": "High-volume merchants where a small improvement in approval rate translates into significant recovered revenue."
    },
    {
      "title": "Scale and customer profile",
      "toolA": "Braintree's documented positioning centers on PayPal-backed unified checkout usable via standard, self-serve pricing.",
      "toolB": "Checkout.com processed $300BN in ecommerce payments in 2025 and serves enterprise merchants including Microsoft, Spotify, eBay, Uber, and Klarna across ecommerce, gaming, marketplaces, travel, fintech, and crypto.",
      "whyItMatters": "The documented customer profile signals which platform is built around very large, high-volume merchants versus a broader range of merchant sizes.",
      "benefitsWho": "Enterprises in gaming, marketplaces, travel, fintech, or crypto looking for a processor with peers in those verticals."
    },
    {
      "title": "Charity pricing model",
      "toolA": "Braintree offers a discounted charity rate of 2.19% + $0.29 for verified 501(c)(3) organizations.",
      "toolB": "Checkout.com offers free processing (no fee) for registered charities in supported countries.",
      "whyItMatters": "A discounted rate still carries a per-transaction cost, while free processing removes transaction fees entirely for eligible nonprofits.",
      "benefitsWho": "Registered charities comparing total cost of payment processing."
    },
    {
      "title": "Developer sandbox",
      "toolA": "Braintree offers a free developer sandbox environment for testing integrations before going live.",
      "toolB": "A sandbox environment is not documented in Checkout.com's facts.",
      "whyItMatters": "A documented, free sandbox lowers the friction for developers to prototype an integration before any account setup.",
      "benefitsWho": "Developers and smaller engineering teams evaluating integration effort before committing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Transparency",
      "rows": [
        {
          "feature": "Published standard transaction rate",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Charity / nonprofit pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Braintree: discounted rate. Checkout.com: free processing."
        },
        {
          "feature": "Self-serve signup without a sales call",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Checkout.com pricing requires contacting sales."
        }
      ]
    },
    {
      "group": "Payments & Risk",
      "rows": [
        {
          "feature": "Fraud and risk management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI-powered payment acceptance optimization",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Checkout.com: Boost / Intelligent Acceptance."
        },
        {
          "feature": "Global money movement / payouts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Checkout.com: Move."
        },
        {
          "feature": "Local in-country acquiring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Checkout.com: 50+ countries."
        }
      ]
    },
    {
      "group": "Developer & Currency Support",
      "rows": [
        {
          "feature": "Mobile SDKs",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free developer sandbox",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-currency support",
          "toolA": "available",
          "toolB": "available",
          "note": "Braintree: 50+ currencies. Checkout.com: 150+ currencies."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What are Braintree's standard transaction fees?",
      "answer": "2.89% + $0.29 for cards and digital wallets, 3.49% + $0.49 for Venmo, and 0.75% (capped at $5) for standard ACH Direct Debit."
    },
    {
      "question": "How much does Checkout.com cost?",
      "answer": "There is no published price list; pricing is tailored per business via flat-rate or interchange++ fee models after contacting sales."
    },
    {
      "question": "Does Braintree offer nonprofit pricing?",
      "answer": "Yes. Verified 501(c)(3) organizations get a reduced rate of 2.19% + $0.29 on cards and digital wallets."
    },
    {
      "question": "Is Checkout.com free for charities?",
      "answer": "Yes. Registered charities in supported countries can process payments at no cost."
    },
    {
      "question": "Who uses Checkout.com?",
      "answer": "Enterprise merchants in ecommerce, gaming, marketplaces, travel, fintech, and crypto, including Microsoft, Spotify, eBay, Uber, and Klarna."
    },
    {
      "question": "Does Braintree offer a free trial or sandbox?",
      "answer": "Braintree offers a free sandbox environment for testing with no obligation to apply for an account."
    }
  ]
};

export default braintreeVsCheckoutComContent;
