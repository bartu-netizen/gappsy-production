import type { ToolComparisonContent } from './types';

const scalewayVsUpcloudContent: ToolComparisonContent = {
  "verdict": "Scaleway and UpCloud are both Europe-headquartered providers emphasizing data sovereignty, but Scaleway is the broader platform — over 100 products spanning bare metal, GPU/AI compute up to H100 and B300-SXM, and four managed database engines — without a published entry price, while UpCloud is narrower but transparent, with a published $3/month starting price, zero-cost egress on every plan, and a 14-day free trial with credit.",
  "bestForToolA": "Teams needing GPU/AI compute (up to H100/B300-SXM), Apple Mac mini or other bare-metal hosting, or a wide range of managed database engines (Postgres, MySQL, Redis, MongoDB) and serverless SQL from a single European provider.",
  "bestForToolB": "Teams that want predictable, published pricing starting at $3/month, zero-cost data transfer on every plan, and a no-commitment 14-day free trial with credit before committing.",
  "whoNeedsBoth": "A team could run GPU/AI or bare-metal workloads on Scaleway while using UpCloud for cost-predictable, zero-egress-fee production servers where fixed monthly billing matters most.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "The pricing overview page routes to separate per-category pages without listing figures directly.",
      "toolB": "Publishes a $3/month starting price with hourly-capped, predictable billing.",
      "whyItMatters": "Buyers who want to compare costs upfront benefit from a directly published starting price.",
      "benefitsWho": "Budget-conscious teams evaluating options quickly."
    },
    {
      "title": "GPU/AI compute range",
      "toolA": "Offers a broad GPU lineup (L40S, L4, H100, B300-SXM) plus GPU clusters and generative AI APIs.",
      "toolB": "No GPU or AI-specific compute is documented.",
      "whyItMatters": "ML/AI workloads need direct access to high-end accelerators.",
      "benefitsWho": "AI/ML teams needing GPU compute."
    },
    {
      "title": "Data transfer / egress cost",
      "toolA": "No comparable egress policy is documented.",
      "toolB": "States zero-cost egress bandwidth on all plans with no hidden fees.",
      "whyItMatters": "Bandwidth-heavy applications need predictable egress costs.",
      "benefitsWho": "Data-heavy or media-serving applications."
    },
    {
      "title": "Free trial availability",
      "toolA": "No free trial or credit offer is documented.",
      "toolB": "Offers a 14-day free trial with €250 in free credit and no commitment.",
      "whyItMatters": "A no-commitment trial lets teams test the platform before paying.",
      "benefitsWho": "Evaluators and proof-of-concept projects."
    },
    {
      "title": "Product breadth",
      "toolA": "Lists over 100 cloud and AI products, including bare-metal options (Dedibox, Elastic Metal, Apple Mac mini hosting) and four managed database engines.",
      "toolB": "Product set centers on three cloud server tiers plus MaxIOPS storage and Kubernetes-oriented Cloud Native plans.",
      "whyItMatters": "Organizations consolidating vendors need broad product coverage, while others want a focused, simpler server product.",
      "benefitsWho": "Organizations consolidating infrastructure vendors vs. teams wanting a focused server product."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compute & Hardware",
      "rows": [
        {
          "feature": "GPU/AI compute",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Scaleway: L40S, L4, H100, B300-SXM."
        },
        {
          "feature": "Bare metal / dedicated hardware",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dedibox, Elastic Metal, Apple Mac mini hosting."
        },
        {
          "feature": "Kubernetes",
          "toolA": "available",
          "toolB": "available",
          "note": "Scaleway: Kapsule/Kosmos; UpCloud: Cloud Native plans optimized for Kubernetes."
        },
        {
          "feature": "Managed databases",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Scaleway: PostgreSQL, MySQL, Redis, MongoDB, serverless SQL."
        }
      ]
    },
    {
      "group": "Pricing & Trials",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$3/month."
        },
        {
          "feature": "Zero-cost data transfer/egress",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free trial with credit",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "14-day trial, €250 credit."
        },
        {
          "feature": "Hourly-capped/fixed billing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Capped at 672 hours/month."
        }
      ]
    },
    {
      "group": "Company & Footprint",
      "rows": [
        {
          "feature": "Headquarters disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Scaleway: Paris, France (via legal/careers pages); UpCloud: Helsinki, Finland."
        },
        {
          "feature": "Global points of presence / data centers",
          "toolA": "available",
          "toolB": "available",
          "note": "Scaleway: 65+ global points of presence; UpCloud: 15 data centers."
        },
        {
          "feature": "Storage options",
          "toolA": "available",
          "toolB": "available",
          "note": "Scaleway: object, block, file, Glacier cold storage; UpCloud: MaxIOPS storage up to 64TB."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Where is Scaleway based?",
      "answer": "Scaleway's registered office is in Paris, France."
    },
    {
      "question": "Does Scaleway offer GPU instances?",
      "answer": "Yes, including L40S, L4, H100, and B300-SXM GPU instances plus GPU clusters."
    },
    {
      "question": "Does Scaleway show pricing on its pricing page?",
      "answer": "The pricing overview page links out to category-specific pricing pages rather than listing prices directly."
    },
    {
      "question": "Does UpCloud have a free trial?",
      "answer": "Yes, a 14-day free trial with €250 in free credit and no commitment."
    },
    {
      "question": "How much do UpCloud servers cost?",
      "answer": "Plans start from $3/month, billed hourly and capped at 672 hours per month."
    },
    {
      "question": "Does UpCloud charge for data transfer?",
      "answer": "No, all Cloud Server plans include zero-cost egress."
    }
  ]
};

export default scalewayVsUpcloudContent;
