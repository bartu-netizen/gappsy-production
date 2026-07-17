import type { ToolComparisonContent } from './types';

const founderpathVsNumeralContent: ToolComparisonContent = {
  "verdict": "Founderpath provides non-dilutive financing — revenue financing, term loans, and merchant cash advances — to software and CPG founders, while Numeral automates sales tax compliance, including nexus monitoring, registration, filing, and remittance, for ecommerce and SaaS companies. They serve overlapping company types but solve entirely different back-office problems: raising capital versus staying tax-compliant.",
  "bestForToolA": "SaaS or CPG founders with at least $500K in last-year revenue who want fast, non-dilutive capital (funding in as little as 24 hours after 24-48 hour underwriting) without giving up equity, board seats, or personal guarantees.",
  "bestForToolB": "Ecommerce or SaaS companies that need to track when they cross economic nexus thresholds and automate sales tax filing, starting with Numeral's free Monitoring plan before paying $75 per filing on the Standard plan.",
  "whoNeedsBoth": "A growing SaaS or CPG company could use Founderpath's revenue financing to fund growth non-dilutively while separately using Numeral to track and file the sales tax obligations that come with expanding into new states — both serve growth-stage companies' back-office finance needs, but neither replaces the other.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Founderpath provides capital: revenue financing, term loans, and merchant cash advances.",
      "toolB": "Numeral automates sales tax compliance: nexus monitoring, filing, remittance, and exemption certificate management.",
      "whyItMatters": "These sit under entirely different budget categories — financing versus tax compliance software.",
      "benefitsWho": "CFOs evaluating capital sources should look at Founderpath; those evaluating compliance tooling should look at Numeral."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Founderpath's pricing is underwriting-based: revenue financing discount rates start from 7% for companies with $1M-$3M ARR, and term loan interest rates start from 15% for companies with $3M+ revenue.",
      "toolB": "Numeral publishes per-filing pricing on its Standard plan ($75 per filing, $150 per registration) plus a free Monitoring tier, with a custom-priced Pro plan for advanced features.",
      "whyItMatters": "Cost predictability differs — one is a financing cost tied to revenue/underwriting, the other a recurring compliance fee.",
      "benefitsWho": "Finance teams need Founderpath for capital planning and Numeral for predictable compliance cost budgeting."
    },
    {
      "title": "Free Access",
      "toolA": "Founderpath has no free tier; all financing requires underwriting and a minimum of $500K in last-year revenue to qualify.",
      "toolB": "Numeral's Monitoring plan is free and includes nexus auditing, physical and economic nexus monitoring, and alerts when crossing into new states.",
      "whyItMatters": "Companies not yet ready for financing can still get value at zero cost from a compliance tool.",
      "benefitsWho": "Early-stage companies below Founderpath's revenue threshold can still use Numeral's free plan."
    },
    {
      "title": "Qualification Requirements",
      "toolA": "Founderpath requires a minimum of $500K in last-year revenue, healthy retention, and recurring or repeat revenue to qualify.",
      "toolB": "Numeral's facts don't document a revenue minimum; its free Monitoring plan and $75-per-filing Standard plan are available regardless of company size.",
      "whyItMatters": "Eligibility gates determine which companies can even access the product.",
      "benefitsWho": "Smaller or newer companies not yet qualifying for Founderpath financing can still access Numeral."
    },
    {
      "title": "Speed and Risk Guarantees",
      "toolA": "Founderpath can fund in as little as 24 hours with 24-48 hour underwriting, and allows early repayment without penalty.",
      "toolB": "Numeral's compliance guarantee covers penalties and interest if Numeral misses a filing deadline.",
      "whyItMatters": "Each guarantee protects against a different risk — funding delay versus compliance failure.",
      "benefitsWho": "Founders needing quick cash value Founderpath's funding speed; finance teams needing filing accuracy assurance value Numeral's compliance guarantee."
    }
  ],
  "featureMatrix": [
    {
      "group": "Financing and Capital",
      "rows": [
        {
          "feature": "Revenue financing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Founderpath discount rates from 7% ARR"
        },
        {
          "feature": "Term loans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Interest rates from 15%"
        },
        {
          "feature": "Merchant cash advance",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "No equity/board seats required",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Tax Compliance",
      "rows": [
        {
          "feature": "Nexus monitoring",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "24/7 monitoring"
        },
        {
          "feature": "Automated filing and remittance",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Tax calculation API",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Exemption certificate management",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Free up to 50 certificates"
        }
      ]
    },
    {
      "group": "Business Model and Support",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Monitoring plan is free"
        },
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$75 per filing"
        },
        {
          "feature": "Guarantee protection",
          "toolA": "available",
          "toolB": "available",
          "note": "Founderpath: funding in 24h; Numeral: compliance guarantee"
        },
        {
          "feature": "Minimum revenue requirement documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Founderpath requires $500K last-year revenue"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Founderpath and Numeral competitors?",
      "answer": "No. They serve different categories — Founderpath provides non-dilutive financing, while Numeral automates sales tax compliance. A company could plausibly use both for different needs."
    },
    {
      "question": "Does Founderpath handle sales tax compliance?",
      "answer": "No. Founderpath's documented features are all financing-related (revenue financing, term loans, merchant cash advances); it doesn't offer tax compliance features."
    },
    {
      "question": "Does Numeral provide loans or financing?",
      "answer": "No. Numeral's features are focused on sales tax nexus monitoring, filing, and remittance; financing isn't part of its documented offering."
    },
    {
      "question": "What revenue do I need to qualify for Founderpath?",
      "answer": "Founderpath requires a minimum of $500K in last-year revenue, along with healthy retention and recurring or repeat revenue."
    },
    {
      "question": "Is Numeral free to start?",
      "answer": "Yes, Numeral's Monitoring plan is free and includes nexus auditing, physical and economic nexus monitoring, and alerts when a business crosses into new states."
    },
    {
      "question": "Would a company realistically use both tools?",
      "answer": "Yes — a growing company could use Founderpath's revenue financing or term loans to fund growth non-dilutively while using Numeral to manage the sales tax compliance obligations that come with expanding into new states."
    }
  ]
};

export default founderpathVsNumeralContent;
