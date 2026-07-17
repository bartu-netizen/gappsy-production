import type { ToolComparisonContent } from './types';

const billsbyVsKillBillContent: ToolComparisonContent = {
  "verdict": "Billsby and Kill Bill both handle subscription billing, but they trade off differently between convenience and control. Billsby is a hosted SaaS billing product with a free testing tier and a Core plan at $45/month plus 0.4% on revenue over $15,000/month, aimed at teams that want billing running quickly without infrastructure work. Kill Bill is a free, open-source, self-hosted billing engine with no per-transaction or revenue-percentage fees at all, in production for over 15 years, aimed at teams with the engineering resources to deploy and operate it themselves.",
  "bestForToolA": "Billsby fits subscription businesses that want a hosted billing product they can set up quickly, with automated dunning and an embeddable checkout, and that are comfortable paying $45/month plus a small percentage of revenue over $15,000/month.",
  "bestForToolB": "Kill Bill fits engineering teams that want full control over their billing infrastructure, need to avoid per-transaction or revenue-percentage fees entirely, and have the resources to self-host via Docker or Kubernetes and integrate their own payment gateway and tax engine plugins.",
  "whoNeedsBoth": "There is no realistic scenario for running both as the primary billing system, since each is a complete subscription billing engine on its own; a team might evaluate Billsby's free testing tier to model pricing while separately prototyping a self-hosted Kill Bill deployment before committing to one platform long-term.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Billsby charges $45/month plus 0.4% of revenue over $15,000/month on its Core plan, and $135/month plus 0.5% of revenue over $30,000/month on Pro.",
      "toolB": "Kill Bill's core platform is entirely free and open source under Apache 2.0, with no per-transaction or revenue-percentage fees.",
      "whyItMatters": "Revenue-percentage billing fees scale with a company's success and can become a meaningful cost at high transaction volume, unlike a flat self-hosted infrastructure cost.",
      "benefitsWho": "High-growth subscription businesses that want to avoid revenue-share fees at scale benefit from Kill Bill's fee-free model; smaller teams that don't want to manage infrastructure benefit from Billsby's predictable hosted pricing at lower volumes."
    },
    {
      "title": "Hosting and Operational Responsibility",
      "toolA": "Billsby is a fully hosted SaaS product; users don't manage servers or deployments.",
      "toolB": "Kill Bill is self-hosted via Docker or Kubernetes in your own infrastructure, and requires engineering resources to deploy, operate, and maintain.",
      "whyItMatters": "Self-hosting shifts operational burden (uptime, upgrades, security patching) onto the adopting team in exchange for infrastructure control.",
      "benefitsWho": "Teams without dedicated DevOps resources benefit from Billsby's fully managed hosting; teams that want infrastructure control and data residency benefit from Kill Bill's self-hosted model."
    },
    {
      "title": "Payment Gateway and Tax Support",
      "toolA": "Billsby supports multiple payment gateways including ACH processing, but only on the Pro plan; tax compliance is also a Pro-plan feature.",
      "toolB": "Kill Bill has native plugin support for Stripe, Adyen, PayPal, Braintree, and other gateways, plus tax engine integrations with Avalara and Vertex, available in the free core.",
      "whyItMatters": "Whether gateway and tax capabilities are gated behind a paid tier or available in the free core affects total cost for businesses needing those features from day one.",
      "benefitsWho": "Businesses needing multiple gateways or tax compliance from the start get them free with Kill Bill, while Billsby users must upgrade to Pro ($135/month+) for the same capabilities."
    },
    {
      "title": "API and Customization Access",
      "toolA": "Billsby offers full API access on its Pro plan for custom integrations; the Core plan does not include it.",
      "toolB": "Kill Bill provides an extensible plugin architecture for building custom integrations and modifications as part of the free, open-source core.",
      "whyItMatters": "Gating API access behind a higher-priced plan limits how deeply a lower-tier customer can integrate billing with the rest of their stack.",
      "benefitsWho": "Developers building custom billing logic benefit from Kill Bill's unrestricted plugin architecture, while Billsby users need the Pro tier to get comparable API access."
    },
    {
      "title": "Track Record and Maturity",
      "toolA": "Billsby is rated 4.8 stars on G2 and marketed as the '#1 Rated Subscription Billing Software,' but its founding year and headquarters are not disclosed.",
      "toolB": "Kill Bill was founded in 2010 and has been in production for over 15 years, with a documented Apache 2.0 license history.",
      "whyItMatters": "A long production track record signals stability for mission-critical billing infrastructure that businesses depend on for revenue.",
      "benefitsWho": "Risk-averse engineering teams evaluating billing infrastructure stability benefit from Kill Bill's documented 15-plus-year production history."
    }
  ],
  "featureMatrix": [
    {
      "group": "Billing Core",
      "rows": [
        {
          "feature": "Subscription products, plans, cycles",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Usage-based / prepaid / postpaid billing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated dunning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-tenant support",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Payments & Compliance",
      "rows": [
        {
          "feature": "Multiple payment gateways",
          "toolA": "limited",
          "toolB": "available",
          "note": "Billsby: Pro plan only; Kill Bill: native plugins for Stripe, Adyen, PayPal, Braintree"
        },
        {
          "feature": "Tax compliance / tax engine integration",
          "toolA": "limited",
          "toolB": "available",
          "note": "Billsby: Pro plan; Kill Bill: Avalara and Vertex integrations"
        },
        {
          "feature": "Full API access",
          "toolA": "limited",
          "toolB": "available",
          "note": "Billsby: Pro plan only; Kill Bill: included in free core"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Billsby free plan for testing; Kill Bill core is entirely free"
        },
        {
          "feature": "Revenue-percentage fees",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Billsby charges 0.4-0.5% on revenue above thresholds; Kill Bill has none"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Admin UI included",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Kill Bill's Kaui admin UI"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Kill Bill charge a percentage of revenue like Billsby?",
      "answer": "No, Kill Bill's core platform has no per-transaction or revenue-percentage fees since it's free and self-hosted; Billsby charges 0.4% on revenue over $15,000/month on its Core plan and 0.5% over $30,000/month on Pro."
    },
    {
      "question": "Do I need engineers to run Kill Bill?",
      "answer": "Yes, Kill Bill requires engineering resources to deploy, operate, and maintain since it's self-hosted via Docker or Kubernetes, unlike Billsby, which is a fully hosted SaaS product."
    },
    {
      "question": "Which plan do I need for full API access on Billsby?",
      "answer": "Full API access is included on Billsby's Pro plan ($135/month plus 0.5% on revenue over $30,000/month), not the $45/month Core plan; Kill Bill includes API-level extensibility through its plugin architecture in the free core."
    },
    {
      "question": "Does Kill Bill support Stripe and PayPal?",
      "answer": "Yes, Kill Bill has native plugin support for Stripe, Adyen, PayPal, Braintree, and other payment gateways, available without a paid tier."
    },
    {
      "question": "Can I try Billsby before paying?",
      "answer": "Yes, Billsby offers a free plan that allows unlimited testing and setup before going live, with no time limit."
    },
    {
      "question": "Is there a managed hosting option for Kill Bill if I don't want to self-host?",
      "answer": "Kill Bill has no official low-code hosted option from the core project itself, though third-party providers offer managed hosting; Billsby, by contrast, is hosted SaaS by default."
    }
  ]
};

export default billsbyVsKillBillContent;
