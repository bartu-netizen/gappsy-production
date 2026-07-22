import type { ToolComparisonContent } from './types';

const numeralVsTaxjarContent: ToolComparisonContent = {
  "verdict": "Both Numeral and TaxJar automate US sales tax compliance, but they price and package the work differently: Numeral charges per filing and registration with a permanently free nexus-monitoring tier, while TaxJar charges a flat monthly subscription ($39-$99) capped at 200 orders/month with a 30-day free trial. The right pick depends more on billing model and volume than on core functionality, since both cover nexus tracking and automated filing.",
  "bestForToolA": "Sellers who want free, ongoing nexus monitoring before paying anything, and who prefer per-filing pricing ($75/filing, $150/registration) over a flat subscription, such as early-stage sellers not yet filing in many states.",
  "bestForToolB": "Higher-volume sellers (up to 200 orders/month on entry plans) who want a flat monthly subscription backed by Stripe (which acquired TaxJar in 2021), AI-driven product categorization, and phone support on the Professional plan.",
  "whoNeedsBoth": "There's no realistic scenario for running both simultaneously — Numeral and TaxJar overlap almost entirely on core sales tax calculation, nexus tracking, and filing, so a company would typically choose one as its system of record for sales tax rather than pay for both.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Numeral charges per filing and registration: $75 per filing and $150 per registration on the Standard plan, billed month-to-month with no long-term contract.",
      "toolB": "TaxJar charges a flat monthly subscription: $39/month for Starter or $99/month for Professional, both covering up to 200 orders/month.",
      "whyItMatters": "Cost scales differently depending on how many states a seller files in versus how many orders it processes.",
      "benefitsWho": "Sellers with few or sporadic filings may prefer Numeral's per-filing model plus free monitoring; sellers with steady, moderate order volume may prefer TaxJar's flat fee."
    },
    {
      "title": "Free Plan Depth",
      "toolA": "Numeral's Monitoring plan is free indefinitely, including nexus auditing, physical and economic nexus monitoring, and alerts.",
      "toolB": "TaxJar offers a 30-day free trial with no credit card required, after which paid conversion is required to keep using it.",
      "whyItMatters": "A permanently free tier versus a time-limited trial changes how long a company can evaluate or use core functionality at no cost.",
      "benefitsWho": "Companies wanting indefinite free nexus tracking benefit from Numeral; those wanting to fully test paid features before committing benefit from TaxJar's trial."
    },
    {
      "title": "Order Volume Caps",
      "toolA": "Numeral's Standard plan pricing isn't order-based; it charges per filing and per registration regardless of order count.",
      "toolB": "Both TaxJar plans (Starter and Professional) are capped at 200 orders/month.",
      "whyItMatters": "Sellers who exceed a volume cap must either upgrade or find the pricing model doesn't scale with their business.",
      "benefitsWho": "High-volume ecommerce sellers exceeding 200 orders/month may find Numeral's per-filing model more predictable than needing a higher TaxJar tier."
    },
    {
      "title": "International Coverage",
      "toolA": "Numeral's Pro plan adds global coverage in 80+ countries.",
      "toolB": "TaxJar's documented coverage spans 11,000+ US jurisdictions, with no international coverage mentioned.",
      "whyItMatters": "Sellers with cross-border operations need tax compliance tools that extend beyond the US.",
      "benefitsWho": "International sellers benefit from Numeral's Pro plan; US-only sellers may not need it."
    },
    {
      "title": "Ownership and Scale",
      "toolA": "Numeral's facts include a compliance guarantee covering penalties and interest for missed filings, but don't document comparable customer-count or uptime statistics.",
      "toolB": "TaxJar was acquired by Stripe in 2021, serves 20,000+ businesses, reports a 100% on-time filing rate in 2025, 99.999% historical uptime, and a 4.7/5 G2 rating.",
      "whyItMatters": "Scale and infrastructure backing can matter for enterprises evaluating vendor risk.",
      "benefitsWho": "Enterprises wanting Stripe-backed infrastructure and proven scale may lean toward TaxJar; those valuing an explicit missed-filing guarantee may lean toward Numeral."
    }
  ],
  "featureMatrix": [
    {
      "group": "Nexus and Monitoring",
      "rows": [
        {
          "feature": "Nexus threshold monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free nexus monitoring tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "TaxJar offers a 30-day trial instead of a standalone free tier"
        },
        {
          "feature": "AI-driven product categorization",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Filing and Automation",
      "rows": [
        {
          "feature": "Automated filing and remittance",
          "toolA": "available",
          "toolB": "available",
          "note": "Numeral Standard plan; TaxJar AutoFile"
        },
        {
          "feature": "Free filing credits included",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "2/year Starter, 4/year Professional"
        },
        {
          "feature": "State registration assistance",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Exemption certificate management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Numeral Pro plan; free up to 50 certificates"
        },
        {
          "feature": "Formal compliance guarantee",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "TaxJar reports 100% on-time filing rate but no formal guarantee documented"
        }
      ]
    },
    {
      "group": "Pricing and Support",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "30 days, no credit card"
        },
        {
          "feature": "Phone support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Professional plan only"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "TaxJar: 10,000 calls/min on Professional"
        },
        {
          "feature": "International coverage",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Numeral Pro: 80+ countries"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper for a small seller filing in just one or two states?",
      "answer": "It depends on filing frequency: Numeral's Standard plan charges $75 per filing, while TaxJar's Starter plan is a flat $39/month. For a single monthly filing, TaxJar's subscription may be cheaper long-term, while Numeral's free Monitoring plan costs nothing until you actually need to file."
    },
    {
      "question": "Does either offer a free trial?",
      "answer": "TaxJar offers a 30-day free trial with no credit card required. Numeral instead offers a permanently free Monitoring plan rather than a time-limited trial."
    },
    {
      "question": "Which supports international sales tax?",
      "answer": "Numeral's Pro plan covers 80+ countries. TaxJar's documented coverage is limited to 11,000+ US jurisdictions."
    },
    {
      "question": "Who owns TaxJar?",
      "answer": "TaxJar was acquired by Stripe in 2021 and continues to operate under the TaxJar name."
    },
    {
      "question": "Does Numeral guarantee accurate filings?",
      "answer": "Yes, Numeral's compliance guarantee covers penalties and interest if Numeral misses a filing deadline."
    },
    {
      "question": "Which tool has an order volume cap?",
      "answer": "TaxJar's Starter and Professional plans both cap at 200 orders/month. Numeral's pricing isn't order-based; it charges per filing and per registration instead."
    }
  ]
};

export default numeralVsTaxjarContent;
