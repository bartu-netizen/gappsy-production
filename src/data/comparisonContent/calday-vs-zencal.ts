import type { ToolComparisonContent } from './types';

const caldayVsZencalContent: ToolComparisonContent = {
  "verdict": "Calday and Zencal both target solo providers and small businesses with freemium-style booking tools, but they differ on the free tier: Calday offers a free-forever plan with no credit card required, while Zencal only offers a 14-day trial and requires a paid plan starting at $10/month after that, in exchange for built-in invoicing and wider payment gateway support.",
  "bestForToolA": "Solo service providers who want a genuinely free-forever plan with no credit card, month-to-month billing with no contracts, and payment processing where Calday adds no fee beyond standard Stripe charges.",
  "bestForToolB": "Businesses that need built-in invoicing, 0%-commission payments across multiple regional gateways (Stripe, PayPal, PayU, P24, tPay), and team scheduling with round-robin assignment and shared analytics, and are comfortable starting on a 14-day trial rather than a permanent free plan.",
  "whoNeedsBoth": "A very small operation might start on Calday's free-forever plan and only consider Zencal once it needs invoicing, multi-gateway regional payments, or round-robin team scheduling that Calday's facts don't document.",
  "keyDifferences": [
    {
      "title": "Permanent free plan vs. trial-only",
      "toolA": "Calday offers a free-forever plan with no credit card required.",
      "toolB": "Zencal has no permanently free plan; it offers a 14-day free trial with no credit card required, after which a paid plan (from $10/month) is needed.",
      "whyItMatters": "Users wanting to run a real business indefinitely on a $0 plan can only do so with Calday.",
      "benefitsWho": "Cost-sensitive solo operators who want a durable free option."
    },
    {
      "title": "Invoicing and team scheduling",
      "toolA": "Calday's facts describe client management (booking history, notes, contacts) but do not mention invoicing or team/round-robin scheduling.",
      "toolB": "Zencal includes automated invoicing and team scheduling with round-robin assignment and shared analytics.",
      "whyItMatters": "Businesses that need to bill clients formally or distribute bookings across staff need functionality Zencal documents and Calday does not.",
      "benefitsWho": "Small teams, not just solo operators, and businesses that invoice clients directly."
    },
    {
      "title": "Payment commission and gateway breadth",
      "toolA": "Calday processes payments via Stripe and states it adds no cut on top of standard Stripe fees.",
      "toolB": "Zencal explicitly advertises 0% commission across Stripe, PayPal, PayU, P24, and tPay.",
      "whyItMatters": "Zencal's broader, named gateway list may matter for businesses serving customers who prefer regional payment methods.",
      "benefitsWho": "Businesses with customers outside core Stripe-supported regions or that want PayPal as an option."
    },
    {
      "title": "Language support",
      "toolA": "Calday's facts do not mention supported languages.",
      "toolB": "Zencal explicitly supports English and Polish.",
      "whyItMatters": "Confirmed multi-language support matters for businesses serving non-English-speaking clients.",
      "benefitsWho": "Businesses operating in or serving Polish-speaking markets."
    },
    {
      "title": "Scaling to larger teams",
      "toolA": "Calday's cons note it has only one paid tier publicly listed and is aimed mainly at solo operators and small businesses rather than large teams.",
      "toolB": "Zencal has four tiers (Light, Pro, Team, Enterprise), with Team supporting up to 20 users at $349/month and Enterprise offering dedicated infrastructure for 20+ users.",
      "whyItMatters": "Businesses expecting to grow past a handful of staff have a clearer upgrade path with Zencal's documented tiers.",
      "benefitsWho": "Growing businesses planning to scale team size."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier & Pricing",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zencal: 14 days, no card"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Calday: $12/month; Zencal: $10/month/user"
        },
        {
          "feature": "Contract-free / cancel anytime",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Payments & Invoicing",
      "rows": [
        {
          "feature": "Payment processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Calday: Stripe; Zencal: Stripe/PayPal/PayU/P24/tPay"
        },
        {
          "feature": "0% commission stated",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automated invoicing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Regional payment gateways (PayU/P24/tPay)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Team & Scale",
      "rows": [
        {
          "feature": "Team/round-robin scheduling",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Client notes/history",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-language support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise tier",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Calday or Zencal have a free plan?",
      "answer": "Calday offers a free-forever plan with no credit card required. Zencal does not have a permanent free plan, only a 14-day free trial with no credit card required."
    },
    {
      "question": "Which tool handles invoicing?",
      "answer": "Zencal automatically generates and sends invoices to clients. Calday's facts do not mention invoicing."
    },
    {
      "question": "Do either of these charge a commission on payments?",
      "answer": "Neither adds its own commission: Calday states it doesn't add a cut beyond standard Stripe fees, and Zencal explicitly advertises 0% commission across Stripe, PayPal, PayU, P24, and tPay."
    },
    {
      "question": "What languages does Zencal support?",
      "answer": "English and Polish. Calday's facts do not document supported languages."
    },
    {
      "question": "How much do the entry-level paid plans cost?",
      "answer": "Calday's single paid tier is $12/month. Zencal's entry-level Light plan is $10/month per user, though it excludes payments, invoicing, Events, and Analytics."
    },
    {
      "question": "Which tool is built for larger teams?",
      "answer": "Zencal has a documented path to larger teams via its Team plan ($349/month for up to 20 users) and custom Enterprise tier. Calday's facts describe only one paid tier and note it's aimed mainly at solo operators and small businesses."
    }
  ]
};

export default caldayVsZencalContent;
