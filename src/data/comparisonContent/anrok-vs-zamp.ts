import type { ToolComparisonContent } from './types';

const anrokVsZampContent: ToolComparisonContent = {
  "verdict": "Anrok is a self-serve, AI-assisted sales tax and VAT compliance platform with published per-market pricing and coverage across 100+ countries and 13,000+ US jurisdictions. Zamp pairs its software with a dedicated human tax specialist team and offers a genuine free tier, but keeps its paid U.S. and U.S.+Canada plan pricing custom-quoted rather than published. Neither is a blanket 'better' choice; the decision hinges on whether a team wants global VAT coverage with an AI assistant, or U.S.-centric compliance backed by human tax experts and a free starting tier.",
  "bestForToolA": "Anrok fits SaaS or ecommerce companies expanding into many international tax jurisdictions that want published starting prices ($100/market/month for SaaS, $50/market/month for ecommerce) and an AI assistant (Anrok Atlas) for tax questions grounded in their own data.",
  "bestForToolB": "Zamp fits a business that wants to start with a free nexus assessment and a 30-minute expert consultation before committing to a paid plan, and that values having dedicated human tax specialists, including former auditors, handle notices and registrations.",
  "whoNeedsBoth": "There's no realistic scenario for running both simultaneously since they perform the same core job (sales tax compliance) for a business; a company would evaluate both and select one as its sales tax system of record.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Anrok publishes Starter plan pricing at $100/market/month for SaaS and $50/market/month for ecommerce, with a per-market fee for each new market activated.",
      "toolB": "Zamp only publishes pricing for its Free plan; its U.S. and U.S. + Canada paid plans are custom-quoted based on a sales conversation.",
      "whyItMatters": "Buyers who want to estimate cost before talking to sales can do so more easily with Anrok's published Starter pricing.",
      "benefitsWho": "Finance teams doing early-stage budget planning benefit from Anrok's transparent per-market pricing."
    },
    {
      "title": "Software vs. Human-Assisted Service Model",
      "toolA": "Anrok is a self-serve software platform, augmented by the Anrok Atlas AI assistant that answers tax questions using a company's own account data and Anrok's knowledge base.",
      "toolB": "Zamp centers on a dedicated team of tax specialists, including former auditors, and offers two explicit service models: fully managed 'done for you' or reviewed 'done with you.'",
      "whyItMatters": "Teams without in-house tax expertise may prefer direct access to human specialists over a self-serve AI assistant.",
      "benefitsWho": "Finance teams that want hands-on human support for filings and notices benefit from Zamp's specialist-backed service model."
    },
    {
      "title": "Free Tier Availability",
      "toolA": "Anrok's documented plans start paid from day one; no free tier is listed in its pricing plans.",
      "toolB": "Zamp offers a Free plan including a nexus assessment, product taxability review, a 30-minute expert consultation, and API sandbox access.",
      "whyItMatters": "Businesses wanting to evaluate their tax exposure before paying anything can do so with Zamp but not with Anrok.",
      "benefitsWho": "Early-stage companies unsure of their nexus footprint benefit from Zamp's no-cost assessment."
    },
    {
      "title": "Notice Management and Registration",
      "toolA": "Anrok's documented features describe automated nexus monitoring and registration, but do not name a specific notice-resolution service.",
      "toolB": "Zamp explicitly documents 'Notice management' and 'State registration handling' as named features, resolving state tax notices on the business's behalf.",
      "whyItMatters": "Businesses that have already received state tax notices need a vendor that explicitly handles notice resolution.",
      "benefitsWho": "Businesses dealing with active state tax notices benefit from Zamp's named notice-management service."
    },
    {
      "title": "Geographic Coverage",
      "toolA": "Anrok covers 100+ countries and more than 13,000 US tax jurisdictions, spanning global VAT and US sales tax.",
      "toolB": "Zamp's documented coverage centers on the U.S., with a U.S. + Canada plan adding GST/HST/PST/QST; no broader international VAT coverage is documented.",
      "whyItMatters": "Companies selling into many countries beyond North America need global VAT coverage, which is documented for Anrok but not Zamp.",
      "benefitsWho": "Globally selling SaaS or ecommerce companies benefit from Anrok's broader documented country coverage."
    }
  ],
  "featureMatrix": [
    {
      "group": "Coverage & Compliance",
      "rows": [
        {
          "feature": "US jurisdiction coverage",
          "toolA": "available",
          "toolB": "available",
          "note": "Anrok: 13,000+ jurisdictions quantified; Zamp: U.S. plan, not quantified"
        },
        {
          "feature": "International VAT/global coverage",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Anrok: 100+ countries"
        },
        {
          "feature": "Canada tax support (GST/HST/PST/QST)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Notice management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Automation & AI",
      "rows": [
        {
          "feature": "Real-time tax calculation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI assistant for tax questions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Anrok Atlas, on the Custom plan"
        },
        {
          "feature": "Automated filing and remittance",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan/tier",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Anrok: $50-$100/market/month"
        },
        {
          "feature": "Dedicated human tax specialist team",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Includes former auditors"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Anrok or Zamp have a free plan?",
      "answer": "Zamp has a Free plan with a nexus assessment, taxability review, a 30-minute consultation, and API sandbox access. Anrok's plans are paid from the Starter tier onward, with no free plan documented."
    },
    {
      "question": "How is each priced?",
      "answer": "Anrok publishes Starter pricing at $100/market/month for SaaS and $50/market/month for ecommerce. Zamp's paid U.S. and U.S. + Canada plans are custom-quoted rather than published."
    },
    {
      "question": "Does either cover Canadian sales tax?",
      "answer": "Zamp's U.S. + Canada plan adds GST/HST/PST/QST calculations and Canadian filing support. Anrok's facts don't document specific Canadian coverage."
    },
    {
      "question": "What's the difference between Zamp's 'done for you' and 'done with you'?",
      "answer": "'Done for you' is a fully managed service handled by Zamp's team, while 'done with you' prepares filings for the client to review before submission."
    },
    {
      "question": "Does Anrok or Zamp offer an AI assistant for tax questions?",
      "answer": "Anrok offers Anrok Atlas, an AI assistant that answers tax questions using a company's own account data plus Anrok's knowledge base. Zamp's facts don't document a comparable AI assistant."
    },
    {
      "question": "Which covers more countries?",
      "answer": "Anrok documents coverage across 100+ countries and 13,000+ US jurisdictions. Zamp's documented coverage is centered on the U.S. plus Canada."
    }
  ]
};

export default anrokVsZampContent;
