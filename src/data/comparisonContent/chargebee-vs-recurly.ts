import type { ToolComparisonContent } from './types';

const chargebeeVsRecurlyContent: ToolComparisonContent = {
  "verdict": "Chargebee and Recurly both automate recurring billing, dunning, and revenue recognition for subscription businesses, but they are tuned for different starting points. Chargebee leads with billing flexibility: flat, seat-based, tiered, usage/metered, and hybrid pricing are all available from the entry tier, plus a built-in CPQ module for quote-to-cash workflows and a free plan up to 250K dollars in cumulative billing before overage fees kick in. Recurly leads with churn economics and commerce integrations: it documents 20+ payment gateways and 10+ payment methods on its Starter plan, adds an AI-assisted churn-prediction model and multiple dunning campaigns at higher tiers, and ships a dedicated Shopify subscription commerce bundle that Chargebee does not document. Recurly is explicitly less suited to businesses whose primary billing model is granular usage-based metering, which is exactly where Chargebee is strongest. Cost structure also diverges: Chargebee is free to start with a percentage overage past 250K, while Recurly charges a flat 249 dollars a month plus 0.9 percent of billing volume from day one, and its top All-Access tier requires a 1 million dollar plus annual billing minimum. The right choice depends on whether the buyer's priority is billing-model flexibility and CPQ, or churn recovery depth and commerce-platform integrations.",
  "bestForToolA": "Chargebee fits SaaS companies that need complex or hybrid pricing (usage-based, tiered, seat-based) built into one platform, want CPQ and quote-to-cash in the same system, and prefer starting on a free plan before committing to paid tiers.",
  "bestForToolB": "Recurly fits subscription businesses that prioritize dunning and churn-recovery depth, including AI-assisted churn prediction, and companies running Shopify-based subscription commerce that want a purpose-built integration.",
  "whoNeedsBoth": "Organizations with multiple business units, such as a core SaaS product billed on complex usage-based pricing alongside a separate Shopify-based subscription storefront, could reasonably run Chargebee for the former and Recurly for the latter rather than forcing both into one platform.",
  "keyDifferences": [
    {
      "title": "Entry pricing structure",
      "toolA": "Free Starter plan up to 250,000 dollars in cumulative billing, then a 0.75 percent overage fee",
      "toolB": "249 dollars a month plus 0.9 percent of billing volume from the first dollar billed, with a 90-day free trial",
      "whyItMatters": "Early-stage companies with low billing volume pay nothing on Chargebee but a fixed monthly fee plus a higher percentage on Recurly from day one",
      "benefitsWho": "Pre-revenue or early-revenue startups benefit more from Chargebee's free tier; companies that want a flat predictable monthly fee alongside the percentage may prefer Recurly's structure"
    },
    {
      "title": "Usage-based billing depth",
      "toolA": "Supports flat-rate, seat-based, tiered, usage/metered, and hybrid billing natively as a core capability",
      "toolB": "Documented as less suited to businesses whose primary billing model is highly granular usage-based metering",
      "whyItMatters": "Companies billing primarily on consumption or API calls need a platform built around metering, not one where it is a secondary capability",
      "benefitsWho": "Usage-based and hybrid-pricing SaaS companies benefit from Chargebee; flat-fee or simple tiered subscription businesses are less affected by this gap"
    },
    {
      "title": "CPQ and quote-to-cash",
      "toolA": "Includes a CPQ module for multi-product and multi-year sales quotes that flow directly into billing",
      "toolB": "Not documented as offering a CPQ or quote-to-cash module",
      "whyItMatters": "Sales-led B2B teams negotiating custom multi-year contracts need quoting tied directly to billing to avoid manual reconciliation",
      "benefitsWho": "B2B SaaS companies with sales teams closing custom deals benefit from Chargebee's CPQ"
    },
    {
      "title": "AI-assisted churn prediction",
      "toolA": "Not documented as offering an AI or propensity-based churn prediction feature",
      "toolB": "Higher tiers include a propensity-to-churn model that flags at-risk subscribers for targeted retention offers",
      "whyItMatters": "Predictive churn scoring lets teams intervene before a subscriber cancels rather than only recovering failed payments after the fact",
      "benefitsWho": "Subscription businesses with dedicated retention or lifecycle teams benefit from Recurly's higher tiers"
    },
    {
      "title": "Revenue recognition delivery",
      "toolA": "Revenue recognition is a built-in module included as part of the core platform",
      "toolB": "Revenue recognition is delivered through RevRec, a separate add-on with multi-GAAP compliance and an audit trail",
      "whyItMatters": "A built-in module is simpler to adopt, while an add-on can offer deeper compliance features but adds cost and a separate purchase decision",
      "benefitsWho": "Teams wanting revenue recognition without a separate purchase benefit from Chargebee; finance teams needing multi-GAAP audit-trail rigor may prefer Recurly's RevRec"
    },
    {
      "title": "Payment gateway and method documentation",
      "toolA": "Describes connecting to a wide range of payment gateways without publishing a specific gateway or payment-method count",
      "toolB": "Publishes 20+ payment gateways and 10+ payment methods on its Starter plan",
      "whyItMatters": "Buyers evaluating global payment coverage can compare Recurly's stated numbers directly, while Chargebee's breadth is not quantified in the available facts",
      "benefitsWho": "Buyers who want documented, comparable payment-coverage numbers benefit from Recurly's transparency"
    },
    {
      "title": "Ecommerce platform integration",
      "toolA": "Not documented as offering a dedicated ecommerce platform bundle",
      "toolB": "Offers a dedicated All-Access for Shopify bundle supporting bundles, prepaid and gift subscriptions for Shopify stores",
      "whyItMatters": "A purpose-built Shopify integration reduces custom development for merchants running subscription commerce on that platform",
      "benefitsWho": "Shopify-based subscription commerce merchants benefit from Recurly's dedicated bundle"
    },
    {
      "title": "Enterprise tier accessibility",
      "toolA": "Enterprise tier is a custom quote with no stated minimum billing volume in the available facts",
      "toolB": "Top All-Access tier requires a minimum of 1 million dollars plus in annual billing volume",
      "whyItMatters": "A hard volume minimum excludes smaller or mid-market companies from a vendor's most advanced feature set entirely",
      "benefitsWho": "Growing companies not yet at 1 million dollars in annual billing volume have more headroom with Chargebee's tier structure"
    },
    {
      "title": "Company history and founding",
      "toolA": "Founded in 2011, originally in Chennai, India, now headquartered in San Francisco",
      "toolB": "Founded in 2009 and headquartered in San Francisco",
      "whyItMatters": "Longer operating history in the same category can correlate with platform maturity and accumulated integration breadth, though it is not a substitute for reviewing current features",
      "benefitsWho": "Buyers weighing vendor track record as a factor may give a slight edge to Recurly's two additional years in the category"
    },
    {
      "title": "Pricing model philosophy",
      "toolA": "Freemium model: free until a billing threshold, then usage-based overage",
      "toolB": "Usage-based model from the outset: fixed monthly fee plus a percentage of billing volume regardless of size",
      "whyItMatters": "A freemium structure removes upfront cost risk for unproven products, while an always-on percentage-plus-fee structure provides Recurly more predictable revenue but a real cost floor even for small billers",
      "benefitsWho": "Cost-sensitive early-stage teams benefit from Chargebee's free tier; teams wanting a vendor with skin in the game from month one may see Recurly's model as aligned incentive"
    }
  ],
  "featureMatrix": [
    {
      "group": "Billing and Pricing Models",
      "rows": [
        {
          "feature": "Recurring, flat-rate, and seat-based billing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Usage-based or metered billing",
          "toolA": "available",
          "toolB": "limited",
          "note": "Recurly is documented as less suited to businesses needing highly granular usage-based metering as their primary model"
        },
        {
          "feature": "Hybrid billing models",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "CPQ / quote-to-cash",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Payments and Gateways",
      "rows": [
        {
          "feature": "Multi-gateway payment support",
          "toolA": "available",
          "toolB": "available",
          "note": "Recurly publishes 20+ gateways on its Starter plan; Chargebee does not publish a specific count"
        },
        {
          "feature": "Documented payment method count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Recurly documents 10+ payment methods; Chargebee does not publish a specific count"
        },
        {
          "feature": "Multicurrency billing",
          "toolA": "available",
          "toolB": "available",
          "note": "Chargebee's facts describe multi-region tax and currency support; Recurly explicitly names multicurrency support"
        }
      ]
    },
    {
      "group": "Dunning and Churn Recovery",
      "rows": [
        {
          "feature": "Automated payment retry and dunning",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multiple dunning campaigns",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Recurly's All-Access tier; Starter includes 1 dunning campaign"
        },
        {
          "feature": "AI-assisted churn prediction",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Gated to Recurly's higher tiers"
        },
        {
          "feature": "Personalized retention offers and A/B testing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Delivered via Recurly's Engage add-on"
        }
      ]
    },
    {
      "group": "Revenue Recognition",
      "rows": [
        {
          "feature": "Revenue recognition automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Built into Chargebee's core platform; delivered as Recurly's separate RevRec add-on"
        },
        {
          "feature": "Multi-GAAP compliance and audit trail",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Specific to Recurly's RevRec add-on"
        }
      ]
    },
    {
      "group": "Customer-Facing Tools",
      "rows": [
        {
          "feature": "Hosted checkout pages",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Self-serve customer or subscriber portal",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Reporting and Analytics",
      "rows": [
        {
          "feature": "Recurring revenue and churn dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Custom reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Recurly explicitly names custom reporting and analytics; Chargebee describes built-in dashboards without naming custom report building"
        }
      ]
    },
    {
      "group": "Integrations and Platform",
      "rows": [
        {
          "feature": "CRM and accounting system integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Shopify subscription commerce integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Recurly's All-Access for Shopify bundle"
        },
        {
          "feature": "REST API and client libraries",
          "toolA": "available",
          "toolB": "available",
          "note": "Recurly explicitly documents official client libraries across several languages"
        },
        {
          "feature": "Single sign-on (SSO)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on Recurly's All-Access tier"
        }
      ]
    },
    {
      "group": "Plans and Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Recurly offers a 90-day free trial rather than a free ongoing plan"
        },
        {
          "feature": "Published entry-level pricing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Top-tier billing volume minimum",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Recurly's All-Access tier requires 1 million dollars plus in annual billing volume; Chargebee Enterprise has no stated minimum"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Chargebee or Recurly?",
      "answer": "Chargebee is cheaper to start with since its Starter plan is free up to 250,000 dollars in cumulative billing before a 0.75 percent overage applies, while Recurly charges 249 dollars a month plus 0.9 percent of billing volume from the outset; which one is cheaper overall depends on billing volume and tier needs."
    },
    {
      "question": "Does Chargebee or Recurly handle usage-based billing better?",
      "answer": "Chargebee is the stronger fit for usage-based billing since it natively supports usage and metered pricing alongside flat, seat-based, tiered, and hybrid models, whereas Recurly is documented as less suited to businesses whose primary billing model is highly granular usage-based metering."
    },
    {
      "question": "Does Recurly have AI churn prediction and does Chargebee have an equivalent?",
      "answer": "Recurly offers an AI-assisted, propensity-to-churn model on its higher tiers that flags at-risk subscribers; Chargebee's available facts do not document an equivalent AI-based churn prediction feature."
    },
    {
      "question": "Is Recurly or Chargebee better for a Shopify subscription business?",
      "answer": "Recurly is the better documented fit for Shopify since it offers a dedicated All-Access for Shopify bundle with bundles, prepaid and gift subscriptions; Chargebee's facts do not mention a Shopify-specific integration."
    },
    {
      "question": "Do both Chargebee and Recurly handle revenue recognition?",
      "answer": "Yes, both offer revenue recognition, but Chargebee includes it as a built-in module while Recurly delivers it through RevRec, a separate add-on with multi-GAAP compliance and an audit trail."
    },
    {
      "question": "Which tool is better for an early-stage startup just getting started with billing?",
      "answer": "Chargebee is generally the better starting point for early-stage companies because its Starter plan is free until 250,000 dollars in cumulative billing, while Recurly charges a flat monthly fee plus a percentage of billing volume from day one, offset only by a 90-day free trial."
    }
  ]
};

export default chargebeeVsRecurlyContent;
