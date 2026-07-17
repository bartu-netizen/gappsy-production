import type { ToolComparisonContent } from './types';

const matomoVsProfitwellContent: ToolComparisonContent = {
  "verdict": "Matomo is a privacy-first, GDPR-compliant web analytics platform with custom/contact-sales pricing, focused on visitor behavior, SEO, and campaign tracking; ProfitWell (now ProfitWell Metrics, part of Paddle) is a completely free subscription analytics tool tracking MRR, ARR, churn, and customer lifetime value for SaaS businesses. Both are described as \"analytics\" tools, but they measure entirely different things -- website traffic versus subscription revenue.",
  "bestForToolA": "Matomo fits organizations that need privacy-first, GDPR-compliant tracking of website visitor behavior, with features like visitor profiles, enhanced SEO reporting, a tag manager, and a plugin marketplace for extensibility.",
  "bestForToolB": "ProfitWell fits SaaS businesses that want a completely free way to track subscription revenue metrics (MRR, ARR, churn, LTV) and benchmark against a dataset of over 30,000 subscription companies, connecting directly to billing systems like Stripe, Chargebee, Braintree, Zuora, and Recurly.",
  "whoNeedsBoth": "A SaaS company could use Matomo to measure and optimize website and product traffic in a GDPR-compliant way while using ProfitWell to track the resulting subscription revenue metrics like MRR and churn from that same customer base.",
  "keyDifferences": [
    {
      "title": "What Is Being Measured",
      "toolA": "Matomo tracks on-site visitor behavior, including page views, visitor profiles, and campaign URLs.",
      "toolB": "ProfitWell tracks subscription business metrics -- MRR, ARR, churn, and customer lifetime value -- pulled from billing systems.",
      "whyItMatters": "These are fundamentally different data sources (web traffic versus billing data), so the tools aren't substitutes.",
      "benefitsWho": "Marketing and product teams need Matomo's traffic data; finance and RevOps teams need ProfitWell's revenue data."
    },
    {
      "title": "Pricing",
      "toolA": "Matomo's enterprise pricing is custom and quote-based, not published.",
      "toolB": "ProfitWell Metrics is completely free, with no listed paid tier.",
      "whyItMatters": "Cost predictability differs sharply -- ProfitWell buyers know the cost is $0 upfront, while Matomo buyers must go through a sales process.",
      "benefitsWho": "Budget-constrained SaaS founders benefit from ProfitWell; organizations needing custom analytics deployments work with Matomo."
    },
    {
      "title": "Data Source Integration",
      "toolA": "Not documented as billing-system integrations for Matomo, which lists a generic \"Integration\" feature area without further detail.",
      "toolB": "ProfitWell connects to Paddle, Stripe, Chargebee, Braintree, Zuora, and Recurly.",
      "whyItMatters": "ProfitWell's value depends entirely on connecting to a billing system, which is its core integration surface, unlike Matomo's website-tracking integrations.",
      "benefitsWho": "SaaS companies already using one of ProfitWell's six supported billing systems."
    },
    {
      "title": "Independence / Ownership",
      "toolA": "Not documented as being owned by a parent company; Matomo is presented as its own privacy-focused analytics product.",
      "toolB": "ProfitWell is now owned and operated by Paddle rather than as an independent standalone company, a documented con, with its advanced retention and pricing tools folded into Paddle's broader product line.",
      "whyItMatters": "Buyers wary of vendor consolidation or future feature changes should know ProfitWell's roadmap now sits inside Paddle.",
      "benefitsWho": "Buyers evaluating long-term product independence and roadmap control."
    },
    {
      "title": "Benchmarking",
      "toolA": "Not documented for Matomo.",
      "toolB": "ProfitWell benchmarks performance against a dataset of over 30,000 subscription companies.",
      "whyItMatters": "Benchmarking against industry peers is a specific decision-support feature only ProfitWell documents.",
      "benefitsWho": "SaaS operators wanting to know how their churn and MRR compare to peers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Measurement",
      "rows": [
        {
          "feature": "Website visitor analytics",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Subscription revenue metrics (MRR/ARR/churn/LTV)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Visitor profiles",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Integrations & Extensibility",
      "rows": [
        {
          "feature": "Billing system integrations (Stripe, Chargebee, etc.)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Plugin marketplace",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Tag manager",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Cost & Ownership",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ProfitWell Metrics is fully free"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Matomo is custom/contact sales; ProfitWell is $0"
        },
        {
          "feature": "Independent company",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "ProfitWell is owned by Paddle"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ProfitWell really free?",
      "answer": "Yes, ProfitWell Metrics is completely free to use, unlike Matomo, which uses custom/contact-sales pricing."
    },
    {
      "question": "Do Matomo and ProfitWell track the same kind of data?",
      "answer": "No -- Matomo tracks website visitor behavior, while ProfitWell tracks subscription revenue metrics like MRR, ARR, and churn pulled from billing systems."
    },
    {
      "question": "What billing systems does ProfitWell connect to?",
      "answer": "Paddle, Stripe, Chargebee, Braintree, Zuora, and Recurly."
    },
    {
      "question": "Is ProfitWell still an independent product?",
      "answer": "No, it's now owned and operated by Paddle as ProfitWell Metrics, with some of its advanced retention and pricing tools folded into Paddle's broader product line."
    },
    {
      "question": "Does Matomo offer industry benchmarking like ProfitWell?",
      "answer": "This isn't documented for Matomo. ProfitWell specifically benchmarks against a dataset of over 30,000 subscription companies."
    },
    {
      "question": "Is Matomo focused on privacy compliance?",
      "answer": "Yes, Matomo is positioned specifically around privacy and GDPR compliance as a Google Analytics alternative; this isn't a documented focus area for ProfitWell."
    }
  ]
};

export default matomoVsProfitwellContent;
