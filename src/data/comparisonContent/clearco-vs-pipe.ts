import type { ToolComparisonContent } from './types';

const clearcoVsPipeContent: ToolComparisonContent = {
  "verdict": "Clearco and Pipe both provide non-dilutive capital, but they reach businesses through different channels. Clearco directly funds DTC ecommerce and SaaS businesses with $100,000+ in monthly revenue, using capped weekly repayments and integrations with Amazon, Stripe, Shopify, and PayPal. Pipe, founded in 2019 and headquartered in Miami, is an embedded financial operating system that software platforms (not individual businesses) integrate to offer capital and payment tools to their own customers, with partners including Uber Eats, GoCardless, and Housecall Pro. One is a direct-to-business lender; the other is B2B2B embedded finance infrastructure.",
  "bestForToolA": "Clearco fits individual DTC ecommerce or SaaS businesses with 12+ months of consistent revenue and $100,000+ in monthly revenue, incorporated in the U.S., that want to apply directly for non-dilutive capital with capped weekly repayments.",
  "bestForToolB": "Pipe fits software platforms — vertical SaaS providers, payment facilitators, and marketplaces — that want to embed pre-approved capital offers into their own product for their business customers, using sales-based repayment with no fixed monthly minimums, via a low-code integration.",
  "whoNeedsBoth": "There's limited overlap for a single business: Clearco is something an individual ecommerce or SaaS company applies to directly for its own capital, while Pipe is infrastructure a software platform would build into its product to offer capital to its own merchant or customer base — a platform like Housecall Pro could use Pipe to offer financing to its contractors, while some of those same contractors could separately qualify for direct funding from Clearco.",
  "keyDifferences": [
    {
      "title": "Who the Customer Is",
      "toolA": "Clearco funds individual businesses directly — DTC ecommerce brands and SaaS companies apply for capital themselves.",
      "toolB": "Pipe is built for platforms to embed into their own product, not something an individual business signs up for directly, per its documented cons.",
      "whyItMatters": "This determines the entire sales motion: Clearco is a direct-application product, while Pipe requires a partnership and sales engagement at the platform level.",
      "benefitsWho": "An individual ecommerce brand seeking capital benefits from Clearco's direct model; a software platform wanting to add embedded finance as a feature benefits from Pipe's model."
    },
    {
      "title": "Repayment Structure",
      "toolA": "Clearco uses capped weekly payments with transparent, foreseeable terms, and businesses can choose estimated 4, 5, or 6-month payment terms with an early payment option.",
      "toolB": "Pipe's repayment scales with sales activity, with no fixed monthly minimums, tied to the end business's transaction volume.",
      "whyItMatters": "Capped weekly payments give predictability, while sales-based repayment flexes with revenue, which changes cash-flow risk during slow periods.",
      "benefitsWho": "Businesses wanting predictable weekly obligations benefit from Clearco's structure; businesses with variable revenue benefit from Pipe's sales-based repayment model."
    },
    {
      "title": "Integration Requirements",
      "toolA": "Clearco connects with Amazon, Stripe, BigCommerce, Square, Shopify, and PayPal to evaluate funding eligibility for a business applying for capital.",
      "toolB": "Pipe integrates into a partner's product with a small number of code snippets, per its documented low-code embedding feature, and requires a partnership/sales engagement to implement.",
      "whyItMatters": "Clearco's integrations are for eligibility evaluation of a single applicant; Pipe's integration embeds capital offers into a platform's product for its entire customer base.",
      "benefitsWho": "Individual merchants benefit from Clearco's read-only eligibility integrations; software platform product teams benefit from Pipe's embeddable, code-snippet-based integration."
    },
    {
      "title": "Speed and Underwriting",
      "toolA": "Clearco advertises approvals in as little as 24 hours using AI-supported underwriting.",
      "toolB": "Pipe generates pre-approved capital offers for platform customers based on their transaction data, with industry-specific risk models tailored to different platform types (vertical SaaS, payment facilitators, marketplaces).",
      "whyItMatters": "Both emphasize fast, data-driven underwriting, but Clearco's is a direct approval process while Pipe's pre-approval happens automatically within a partner platform's interface.",
      "benefitsWho": "Businesses needing quick direct capital decisions benefit from Clearco's 24-hour approval claim; platforms wanting to surface pre-approved offers to many customers at once benefit from Pipe's model."
    },
    {
      "title": "Scale and Track Record",
      "toolA": "Clearco states it has deployed over $3B to more than 10,000 funded brands.",
      "toolB": "Pipe reports a 61% average conversion rate and an 80 Net Promoter Score across partners, with named partners including Uber Eats, GoCardless, and Housecall Pro.",
      "whyItMatters": "These are different kinds of proof points — total capital deployed to end businesses versus conversion/satisfaction metrics reported by platform partners.",
      "benefitsWho": "Businesses evaluating Clearco's direct lending track record benefit from its $3B/10,000-brand figure; platforms evaluating whether to embed Pipe benefit from its partner conversion and NPS data."
    }
  ],
  "featureMatrix": [
    {
      "group": "Access Model",
      "rows": [
        {
          "feature": "Direct application by individual business",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Pipe requires platform partnership"
        },
        {
          "feature": "Embeddable within a software platform's product",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Low-code integration (code snippets)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Funding Terms",
      "rows": [
        {
          "feature": "Capped weekly repayment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Sales-based repayment, no fixed minimums",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI-supported underwriting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clearco: 24-hour approvals stated"
        },
        {
          "feature": "Industry-specific risk models",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pipe: vertical SaaS, payment facilitators, marketplaces"
        },
        {
          "feature": "No equity, personal guarantees, or liens",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Eligibility & Integrations",
      "rows": [
        {
          "feature": "Minimum revenue requirement disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clearco: $100,000+/month"
        },
        {
          "feature": "Payment platform integrations (Stripe, Shopify, etc.)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clearco: Amazon, Stripe, BigCommerce, Square, Shopify, PayPal"
        },
        {
          "feature": "Partner analytics reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pipe: activation rate, conversion rate, customer growth"
        },
        {
          "feature": "Published pricing/rates",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither discloses rates publicly"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between Clearco and Pipe?",
      "answer": "Clearco funds individual DTC ecommerce and SaaS businesses directly. Pipe is embedded finance infrastructure that software platforms integrate to offer capital and payment tools to their own business customers — it is not something an individual business signs up for directly."
    },
    {
      "question": "What are the eligibility requirements for Clearco?",
      "answer": "Clearco generally requires 12+ months of consistent revenue, $100,000+ in monthly revenue, U.S. incorporation, and a U.S. business bank account."
    },
    {
      "question": "How does repayment differ between the two?",
      "answer": "Clearco uses capped weekly payments with a choice of estimated 4, 5, or 6-month terms and an early payment option. Pipe's repayment scales with the end business's sales activity, with no fixed monthly minimums."
    },
    {
      "question": "Who are Pipe's partners?",
      "answer": "Pipe's documented partners include Uber Eats, GoCardless, and Housecall Pro, reflecting its use by vertical SaaS platforms, payment facilitators, and marketplaces rather than individual end businesses."
    },
    {
      "question": "Can a business apply for Pipe funding directly?",
      "answer": "No. Per Pipe's documented cons, it is built for platforms to embed, not something an individual business signs up for directly; it requires a partnership and sales engagement to implement."
    },
    {
      "question": "Does either company publish its rates or fees?",
      "answer": "No. Neither Clearco nor Pipe publicly discloses specific pricing, rates, or fees; both require going through an application or partnership process to learn terms."
    }
  ]
};

export default clearcoVsPipeContent;
