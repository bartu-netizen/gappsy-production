import type { ToolComparisonContent } from './types';

const datadogVsNewRelicContent: ToolComparisonContent = {
  "verdict": "Datadog and New Relic both position themselves as observability platforms, but the documented facts point to different buying jobs. Datadog is built around modular, unbundled pricing: infrastructure, APM, logs, and security are separate products with separate bills, plus a distinct AI Credits unit for AI-powered features, which suits teams that want to enable exactly the modules they need without paying for a bundle. That same modularity is documented as a con because tallying total cost across several billed products is harder than reading one number. New Relic takes the opposite approach on entry cost: a Free plan documented with 100GB of monthly data ingest and access to all 50+ platform capabilities, positioning it as freemium rather than pay-per-module. Its paid tiers then move to per-user pricing, Standard and Pro, plus a custom Enterprise tier that adds FedRAMP and HIPAA eligibility for regulated environments. Neither tool's documented facts confirm feature parity in every category, so buyers should not assume one fully substitutes for the other. The realistic choice is less about which platform is objectively stronger and more about whether a team wants to assemble specific modules a la carte, accepting billing complexity for flexibility, Datadog, or start free with broad capability access and scale by seats, New Relic.",
  "bestForToolA": "Datadog is the better fit for teams that want to enable only specific observability modules, such as infrastructure or APM, and are comfortable managing several separately billed products plus a dedicated AI Credits allotment.",
  "bestForToolB": "New Relic is the better fit for teams that want to start free with broad access to all 50+ platform capabilities and 100GB of monthly ingest, or for regulated organizations that need FedRAMP or HIPAA eligibility on an Enterprise plan.",
  "whoNeedsBoth": "Organizations that already have cost commitments to one platform's modules but need a compliance-eligible or freemium entry point for a new team or project might reasonably pilot both rather than migrating outright.",
  "keyDifferences": [
    {
      "title": "Pricing model",
      "toolA": "Datadog is documented as a Paid pricing model with infrastructure, APM, logs, and security priced and billed separately",
      "toolB": "New Relic is documented as Freemium, with a Free plan offering 100GB of monthly data ingest and all core capabilities",
      "whyItMatters": "It changes how a team evaluates and enters the product, one requires committing to paid modules from the start while the other allows a genuinely usable free trial period",
      "benefitsWho": "Startups and small teams benefit from New Relic's freemium entry, while teams that already know exactly which modules they need may prefer Datadog's a la carte model"
    },
    {
      "title": "Cost predictability",
      "toolA": "Datadog's documented con is that highly modular, multi-unit pricing makes total cost significantly harder to estimate than a flat per-seat tier",
      "toolB": "New Relic's paid tiers use per-user pricing, Standard at $99 per additional user per month and Pro at $349 per user per month",
      "whyItMatters": "Finance and procurement teams need to forecast spend, and a single per-seat number is easier to budget against than several separately metered products",
      "benefitsWho": "Finance-conscious teams and procurement benefit from New Relic's seat-based model, while teams with uneven or specialized usage may still prefer Datadog's pay-for-what-you-use structure"
    },
    {
      "title": "Free tier scope",
      "toolA": "Datadog's documented free plan is Infrastructure Free at $0, scoped to infrastructure monitoring",
      "toolB": "New Relic's Free plan at $0 per month includes 100GB of data ingest and access to all 50+ platform capabilities",
      "whyItMatters": "A free tier that unlocks the full capability set lets a team properly evaluate the product before paying, while a free tier scoped to one product only previews part of the platform",
      "benefitsWho": "Teams doing a full platform evaluation benefit more from New Relic's broader free tier"
    },
    {
      "title": "Entry-level paid pricing structure",
      "toolA": "Datadog's documented Infrastructure Pro tier is $15 per host per month billed annually, and Infrastructure Enterprise is $23 per host per month billed annually",
      "toolB": "New Relic's documented paid tiers are priced per user rather than per host, starting at $99 per additional user per month for Standard",
      "whyItMatters": "Per-host and per-user billing scale differently depending on whether a team's growth is driven by more infrastructure or more people accessing the platform",
      "benefitsWho": "Teams scaling infrastructure footprint faster than headcount may find Datadog's per-host pricing more aligned, while teams scaling headcount faster than infrastructure may find New Relic's per-user pricing more aligned"
    },
    {
      "title": "AI feature billing",
      "toolA": "Datadog documents AI Credits, a separate credit-based pricing unit specifically for AI-powered features",
      "toolB": "New Relic's provided facts do not document a dedicated AI credit system or AI-specific pricing unit",
      "whyItMatters": "A distinct AI billing unit signals AI features are metered and monetized separately, which affects how a team forecasts spend if it plans to use AI capabilities heavily",
      "benefitsWho": "Teams that want AI usage cost-isolated and trackable separately from core platform spend benefit from Datadog's AI Credits structure as documented"
    },
    {
      "title": "Compliance eligibility",
      "toolA": "Datadog's provided facts do not document specific compliance certifications",
      "toolB": "New Relic documents FedRAMP and HIPAA eligibility, available on its Enterprise plan",
      "whyItMatters": "Regulated industries such as healthcare and government contracting often cannot adopt a platform without documented compliance eligibility",
      "benefitsWho": "Regulated organizations and public-sector buyers benefit from New Relic's documented Enterprise-tier compliance eligibility"
    },
    {
      "title": "Platform breadth as stated",
      "toolA": "Datadog's documented feature set emphasizes unified observability, combining infrastructure, application, and log monitoring in one platform",
      "toolB": "New Relic documents 50+ monitoring capabilities across application, infrastructure, and digital experience monitoring unified in one platform",
      "whyItMatters": "A stated capability count versus a description of unified categories gives buyers different signals about platform scope, though neither confirms exhaustive feature parity",
      "benefitsWho": "Buyers comparing platform breadth on paper may weigh New Relic's stated 50+ capability count against Datadog's stated unification across infrastructure, application, and log monitoring"
    },
    {
      "title": "Top-tier pricing transparency",
      "toolA": "Datadog's highest documented plan, Infrastructure Enterprise, has a published price of $23 per host per month billed annually",
      "toolB": "New Relic's highest tier, Enterprise, is listed as Custom pricing with no published number",
      "whyItMatters": "Published top-tier pricing lets a buyer estimate cost before a sales conversation, while custom pricing requires direct negotiation",
      "benefitsWho": "Buyers who want upfront pricing transparency at the high end benefit from Datadog's published Enterprise infrastructure rate, while buyers open to negotiating for specific needs may not be deterred by New Relic's custom Enterprise pricing"
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Billing",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Datadog's Infrastructure Free is scoped to infrastructure only; New Relic's Free plan includes all core capabilities"
        },
        {
          "feature": "Per-seat/per-user pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "New Relic Standard is $99 and Pro is $349 per user per month"
        },
        {
          "feature": "Per-host infrastructure pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Datadog Infrastructure Pro is $15 and Enterprise is $23 per host per month, billed annually"
        },
        {
          "feature": "Custom-quoted Enterprise tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "New Relic Enterprise is listed as Custom pricing"
        }
      ]
    },
    {
      "group": "Platform Coverage",
      "rows": [
        {
          "feature": "Infrastructure monitoring",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Application performance monitoring",
          "toolA": "available",
          "toolB": "available",
          "note": "Datadog bills APM as a separate product; New Relic includes it among its 50+ capabilities"
        },
        {
          "feature": "Log management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Datadog documents logs as a separately billed product; New Relic's provided facts do not explicitly mention logs"
        },
        {
          "feature": "Digital experience monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stated explicitly in New Relic's platform description"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-powered features",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Datadog bills AI features through a separate AI Credits unit"
        },
        {
          "feature": "Dedicated AI pricing unit",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AI Credits is Datadog's stated credit-based pricing unit for AI features"
        }
      ]
    },
    {
      "group": "Compliance and Regulatory",
      "rows": [
        {
          "feature": "FedRAMP eligibility",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on New Relic's Enterprise plan"
        },
        {
          "feature": "HIPAA eligibility",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on New Relic's Enterprise plan"
        }
      ]
    },
    {
      "group": "Pricing Model Type",
      "rows": [
        {
          "feature": "Freemium pricing model",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Datadog is documented as Paid, not Freemium"
        },
        {
          "feature": "Modular, unbundled product billing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Infrastructure, APM, logs, and security are priced and billed separately at Datadog"
        }
      ]
    },
    {
      "group": "Free Tier Depth",
      "rows": [
        {
          "feature": "Documented free data ingest allowance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "100GB per month on New Relic's Free plan"
        },
        {
          "feature": "Full capability access on free plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "New Relic's Free plan includes all 50+ capabilities, not a limited subset"
        }
      ]
    },
    {
      "group": "Cost Estimation and Predictability",
      "rows": [
        {
          "feature": "Predictability of total monthly cost",
          "toolA": "limited",
          "toolB": "available",
          "note": "Datadog's modular multi-unit pricing is documented as harder to estimate than a flat per-seat tier"
        },
        {
          "feature": "Single flat pricing tier",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Datadog explicitly does not offer one flat pricing tier per its own FAQ"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Datadog or New Relic?",
      "answer": "New Relic has the more accessible free entry point, its Free plan includes 100GB of monthly data ingest and access to all 50+ platform capabilities, while Datadog's Infrastructure Free plan is scoped to infrastructure only and its paid products, APM, logs, and security, are billed as separate line items, making a true side-by-side total cost hard to determine from the documented facts alone."
    },
    {
      "question": "Is Datadog good for teams that want simple, predictable pricing?",
      "answer": "Not based on the documented facts, Datadog's modular, multi-unit pricing across infrastructure, APM, logs, and security is explicitly noted as harder to estimate than a flat per-seat tier, whereas New Relic's paid tiers use straightforward per-user pricing at $99 and $349 per month."
    },
    {
      "question": "Can New Relic do everything Datadog does?",
      "answer": "Partially, based on the documented facts, New Relic's 50+ capabilities cover infrastructure, application, and digital experience monitoring, but the provided facts do not document a dedicated AI Credits system or an explicit log-management product the way Datadog's facts do, so feature parity is not confirmed in every category."
    },
    {
      "question": "Which tool has the more generous free tier?",
      "answer": "New Relic, its documented Free plan provides 100GB of monthly data ingest with access to all core capabilities, while Datadog's Infrastructure Free plan is scoped to infrastructure monitoring only."
    },
    {
      "question": "Does either Datadog or New Relic offer HIPAA or FedRAMP compliance?",
      "answer": "New Relic documents FedRAMP and HIPAA eligibility available on its Enterprise plan; Datadog's provided facts do not document specific compliance certifications."
    },
    {
      "question": "Which platform is easier to budget for as a business expense?",
      "answer": "New Relic's per-user pricing tiers, Standard at $99 and Pro at $349 per user per month, follow a standard seat-based model that is easier to forecast than Datadog's modular billing across separately priced infrastructure, APM, logs, security, and AI Credits products."
    }
  ]
};

export default datadogVsNewRelicContent;
