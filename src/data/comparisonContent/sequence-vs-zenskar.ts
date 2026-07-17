import type { ToolComparisonContent } from './types';

const sequenceVsZenskarContent: ToolComparisonContent = {
  "verdict": "Both Sequence and Zenskar target B2B finance and RevOps teams automating billing and revenue recognition, but Sequence publishes a clear entry price ($799/month Growth plan) and bundles CPQ with billing, while Zenskar is fully custom-quoted across all tiers and emphasizes AI-driven contract-to-invoice automation with a stated no-feature-gatekeeping policy across plans.",
  "bestForToolA": "Early-stage B2B startups under $1M ARR wanting a fixed, published starting price ($799/month) that bundles CPQ, native invoicing, and usage metering together.",
  "bestForToolB": "Revenue teams wanting the same core feature set (billing, revenue recognition, collections, usage metering) on every plan tier without feature gatekeeping, plus an AI Contracts Agent that automates invoice generation from contract terms.",
  "whoNeedsBoth": "This isn't a realistic dual-use scenario — both function as the primary billing and revenue-recognition system of record for B2B finance teams, so a company would typically implement one rather than run both in parallel.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Sequence publishes $799/month for its Growth plan (startups under $1M ARR); the Core and Scale plans require custom quotes.",
      "toolB": "All three Zenskar tiers (Starter, Standard, Enterprise) are entirely custom-quoted with no published price at any level.",
      "whyItMatters": "Knowing a starting number versus needing a sales conversation changes how quickly a buyer can budget.",
      "benefitsWho": "Early-stage startups wanting a known starting number benefit from Sequence; enterprises comfortable negotiating custom deals may not mind Zenskar's approach."
    },
    {
      "title": "Feature Gating by Plan",
      "toolA": "Sequence gates revenue recognition (an add-on) and sales tax integrations behind the Core and Scale plans; they aren't included in the $799/month Growth plan by default.",
      "toolB": "Zenskar states it does not gatekeep features by plan — core modules like billing, revenue recognition, and collections are available on all plans, with differences mainly in support level and SLAs.",
      "whyItMatters": "What you actually get at the entry price point can differ significantly from the headline feature list.",
      "benefitsWho": "Companies needing revenue recognition or tax integrations from day one benefit from Zenskar's flat feature access; companies fine starting with core CPQ and billing benefit from Sequence's cheaper entry tier."
    },
    {
      "title": "CPQ and Quote-to-Cash Scope",
      "toolA": "Sequence explicitly combines CPQ, billing, usage metering, and revenue recognition, including advanced pricing models and bespoke contract terms for complex B2B deals.",
      "toolB": "Zenskar's documented features center on billing, revenue recognition, collections, and usage metering, without a dedicated CPQ or quoting module.",
      "whyItMatters": "Sales-led organizations configuring quotes need CPQ functionality that finance-only billing platforms may not offer.",
      "benefitsWho": "Sales-led orgs needing quote configuration benefit from Sequence; finance-led orgs focused purely on invoicing and revenue recognition benefit from Zenskar."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Sequence markets itself as an 'AI Revenue platform,' but the specific AI capabilities behind that positioning aren't detailed in the available facts.",
      "toolB": "Zenskar includes a documented AI-powered Contracts Agent that processes contracts to automate billing terms and generate invoices, plus natural-language querying of billing data.",
      "whyItMatters": "Concrete, named AI functionality is easier to evaluate than a general branding claim.",
      "benefitsWho": "Teams wanting documented, specific AI automation may lean toward Zenskar given the concreteness of its Contracts Agent."
    },
    {
      "title": "Free Evaluation Path",
      "toolA": "Sequence's pricing page offers no free trial or free plan, directing visitors straight to a demo.",
      "toolB": "Zenskar offers a free pilot program of flexible duration and a sandbox environment for testing before purchase.",
      "whyItMatters": "The ability to test a billing system hands-on before committing reduces implementation risk.",
      "benefitsWho": "Risk-averse buyers wanting to test before committing may prefer Zenskar's pilot/sandbox option."
    }
  ],
  "featureMatrix": [
    {
      "group": "Quote-to-Cash Capabilities",
      "rows": [
        {
          "feature": "Native invoicing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "CPQ / bespoke contract terms",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Usage metering",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Customer portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Entitlements management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Revenue Recognition and Compliance",
      "rows": [
        {
          "feature": "Revenue recognition (ASC 606/IFRS 15)",
          "toolA": "limited",
          "toolB": "available",
          "note": "Sequence: optional add-on on Core/Scale only; Zenskar: included on all plans"
        },
        {
          "feature": "Sales tax integrations",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Sequence: Core/Scale plans only"
        },
        {
          "feature": "Collections and dunning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SOC 2 / ISO 27001 / GDPR",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing and Evaluation",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Sequence $799/month Growth plan"
        },
        {
          "feature": "Free pilot/sandbox or trial",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Custom/Enterprise tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Dedicated onboarding on top tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Sequence Scale plan; Zenskar Enterprise white-glove implementation"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which one has published pricing?",
      "answer": "Sequence publishes $799/month for its Growth plan aimed at startups under $1M ARR. Zenskar's three tiers are all custom-quoted with no public rates."
    },
    {
      "question": "Does Zenskar include revenue recognition on every plan?",
      "answer": "Yes. Per Zenskar's stated no-gatekeeping policy, core modules including revenue recognition are on all plans, with differences mainly in support level and SLAs."
    },
    {
      "question": "Does Sequence include revenue recognition by default?",
      "answer": "No. Revenue recognition is an optional add-on available on the Core and Scale plans, not included in the entry-level Growth plan."
    },
    {
      "question": "Can I try either before committing?",
      "answer": "Zenskar offers a free pilot program and sandbox environment. Sequence's pricing page has no free trial and directs visitors to book a demo instead."
    },
    {
      "question": "Does Sequence include CPQ or quoting functionality?",
      "answer": "Yes, Sequence supports bespoke contract terms and custom pricing scenarios for complex B2B deals as part of its advanced pricing models. Zenskar's documented feature set doesn't include a dedicated CPQ module."
    },
    {
      "question": "Which is better documented for AI-driven contract automation?",
      "answer": "Zenskar documents a specific AI Contracts Agent that generates invoices from contract terms. Sequence's AI capabilities behind its 'AI Revenue platform' branding aren't detailed in the available facts."
    }
  ]
};

export default sequenceVsZenskarContent;
