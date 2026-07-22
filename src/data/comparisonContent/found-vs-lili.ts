import type { ToolComparisonContent } from './types';

const foundVsLiliContent: ToolComparisonContent = {
  "verdict": "Found and Lili are close competitors: both are freemium US business banking apps bundling checking with bookkeeping and tax tools for small businesses and the self-employed. The differences are in the specifics: Found emphasizes contractor payments and tax write-off tracking with a beta AI assistant, while Lili emphasizes a high-yield savings feature of up to 4.00% APY and broader third-party accounting integrations.",
  "bestForToolA": "Self-employed users and businesses that hire freelancers who want unlimited free contractor payments with automatic 1099-NEC generation and integrated tax write-off and estimate tracking.",
  "bestForToolB": "Businesses that want to earn on idle cash via Lili's up to 4.00% APY savings feature, balances up to $1M with no minimums or lockups, and connect directly to QuickBooks, Xero, Stripe, Shopify, or Gusto.",
  "whoNeedsBoth": "There's little practical case for running both simultaneously since they overlap almost entirely as primary business checking accounts; a business would pick one as its bank of record rather than split banking between two freemium checking products.",
  "keyDifferences": [
    {
      "title": "Banking Partner",
      "toolA": "Found's banking services are provided by Lead Bank, member FDIC.",
      "toolB": "Lili's banking services are provided by Sunrise Banks, N.A., member FDIC.",
      "whyItMatters": "Both are fintechs relying on a partner bank rather than being a bank themselves, so users should understand where deposit insurance actually applies.",
      "benefitsWho": "Compliance-conscious business owners verifying where funds are held benefit from knowing each partner bank."
    },
    {
      "title": "Savings/Interest Feature",
      "toolA": "Found offers tiered APY only on paid plans: 1.50% on Found Plus up to $20,000, and 2.50% uncapped on Found Pro.",
      "toolB": "Lili offers high-yield savings up to 4.00% APY on balances up to $1M, no minimums or lockups, plus extended FDIC coverage up to $3M through a sweep network.",
      "whyItMatters": "The ability to earn yield without paying for an upgraded tier is a meaningful cost difference.",
      "benefitsWho": "Businesses holding significant cash reserves who want yield without a paid upgrade favor Lili; those willing to pay for a tiered structure use Found."
    },
    {
      "title": "Paid Tier Pricing Transparency",
      "toolA": "Found publishes exact prices for its paid tiers: Found Plus $35/month, Found Pro $80/month.",
      "toolB": "Lili's Pro, Smart, and Premium tier pricing is not publicly disclosed.",
      "whyItMatters": "Published pricing lets buyers compare upfront costs without a sales conversation.",
      "benefitsWho": "Buyers wanting upfront pricing comparisons favor Found's transparency."
    },
    {
      "title": "Business Credit Access",
      "toolA": "No business line-of-credit feature is documented for Found.",
      "toolB": "Lili documents business credit lines up to $250,000.",
      "whyItMatters": "Growing businesses may need external financing alongside their checking account.",
      "benefitsWho": "Businesses that may need a credit line down the line benefit from Lili's documented offering."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Found includes a beta AI assistant for querying finances and delegating certain financial tasks.",
      "toolB": "No AI feature is documented for Lili.",
      "whyItMatters": "Conversational finance tools are an emerging differentiator, though Found's is still in beta.",
      "benefitsWho": "Users wanting conversational finance tools may prefer Found, with the caveat that the feature is still in beta."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Banking",
      "rows": [
        {
          "feature": "Free checking plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Monthly fee on entry tier",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both Core plans are $0/month"
        },
        {
          "feature": "FDIC insurance disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Lili extends coverage to $3M via sweep network"
        },
        {
          "feature": "International wires",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "130+ currencies"
        }
      ]
    },
    {
      "group": "Savings & Credit",
      "rows": [
        {
          "feature": "High-yield savings feature",
          "toolA": "available",
          "toolB": "available",
          "note": "Found up to 2.50% (paid tier); Lili up to 4.00%"
        },
        {
          "feature": "Published top APY",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Business lines of credit",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to $250,000"
        },
        {
          "feature": "Unlimited contractor payments, no fees",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Bookkeeping & Integrations",
      "rows": [
        {
          "feature": "Automatic bookkeeping",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Tax tools / estimates / 1099-NEC",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Named third-party accounting integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuickBooks, Xero, Stripe, Shopify, Gusto"
        },
        {
          "feature": "AI assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Found's is in beta"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which offers a higher savings APY?",
      "answer": "Lili, advertising up to 4.00% APY on balances up to $1M, versus Found's 2.50% uncapped rate on the paid Found Pro tier."
    },
    {
      "question": "Are Found and Lili actual banks?",
      "answer": "No, both are fintechs partnering with FDIC-member banks: Lead Bank for Found and Sunrise Banks for Lili."
    },
    {
      "question": "Which has published pricing for paid tiers?",
      "answer": "Found publishes exact prices ($35 and $80/month); Lili's Pro, Smart, and Premium pricing is undisclosed."
    },
    {
      "question": "Does Lili offer business lines of credit?",
      "answer": "Yes, up to $250,000."
    },
    {
      "question": "Does Found have an AI assistant?",
      "answer": "Yes, a beta feature that lets users query their finances and delegate certain financial tasks."
    },
    {
      "question": "Which integrates with more accounting software?",
      "answer": "Lili documents integrations with QuickBooks, Xero, Stripe, Shopify, and Gusto; Found doesn't document third-party accounting integrations."
    }
  ]
};

export default foundVsLiliContent;
