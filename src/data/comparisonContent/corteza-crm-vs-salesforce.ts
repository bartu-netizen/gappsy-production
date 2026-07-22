import type { ToolComparisonContent } from './types';

const cortezaCrmVsSalesforceContent: ToolComparisonContent = {
  "verdict": "Corteza CRM and Salesforce sit at opposite ends of the CRM spectrum. Corteza is a free, open-source (Apache 2.0), self-hosted low-code platform with a CRM module -- code held by the Commons Conservancy Software Foundation so no single vendor can revoke access, but with a smaller community and ecosystem by its own admission. Salesforce is the market-leading paid CRM platform, extended through the large third-party AppExchange marketplace and multiple interconnected Clouds sharing customer data, but typically requiring a dedicated administrator or implementation partner to configure well. This is fundamentally a choice between an open, self-hosted platform and the dominant commercial CRM ecosystem.",
  "bestForToolA": "Budget-conscious or technically capable teams wanting a free, open-source, self-hosted CRM without vendor lock-in, especially if they also want a low-code app builder for related internal tools.",
  "bestForToolB": "Organizations with complex, non-standard sales, service, and marketing processes that need deep customization, access to the large AppExchange ecosystem, and have (or can hire) a dedicated administrator or implementation partner.",
  "whoNeedsBoth": "This isn't a realistic pairing for the same function -- a company generally standardizes on a single system of record for customer data rather than running both Corteza and Salesforce in parallel as competing CRMs.",
  "keyDifferences": [
    {
      "title": "Licensing Model",
      "toolA": "Corteza is fully open source under the Apache 2.0 license and free to self-host.",
      "toolB": "Salesforce is a proprietary, paid platform; no free or open-source tier is documented.",
      "whyItMatters": "Licensing determines whether an organization can inspect, modify, or fully own the software running its customer data.",
      "benefitsWho": "Organizations with vendor-independence or budget constraints that rule out large recurring SaaS spend."
    },
    {
      "title": "Ecosystem Scale",
      "toolA": "Corteza's own cons acknowledge a smaller community and ecosystem than major commercial CRMs like Salesforce, though it includes a built-in low-code app builder for creating custom apps directly rather than buying add-ons.",
      "toolB": "Salesforce offers the AppExchange, a large marketplace of pre-built integrations and add-on apps covering nearly any industry-specific need.",
      "whyItMatters": "A large marketplace means faster access to pre-built solutions, while a smaller ecosystem means more building from scratch.",
      "benefitsWho": "Enterprises wanting off-the-shelf industry solutions (Salesforce) versus teams comfortable building their own extensions (Corteza)."
    },
    {
      "title": "Implementation Complexity",
      "toolA": "Corteza requires self-hosting and technical setup (e.g. via Docker), which is a different kind of complexity than enterprise CRM administration.",
      "toolB": "Salesforce has a real learning curve and typically requires a dedicated administrator or implementation partner to configure well for a real deployment.",
      "whyItMatters": "Both tools carry setup overhead, but of different kinds -- infrastructure management versus platform administration expertise.",
      "benefitsWho": "Teams weighing whether they'd rather hire DevOps/infrastructure skills or a Salesforce administrator."
    },
    {
      "title": "Cost Structure",
      "toolA": "Corteza is free as open-source software, though self-hosting carries its own infrastructure costs.",
      "toolB": "Salesforce uses a \"Paid\" pricing model with no published rates or plans in the available facts.",
      "whyItMatters": "Software licensing cost is often the single largest line item in a CRM decision, especially at scale.",
      "benefitsWho": "Cost-sensitive organizations comparing total cost of ownership between free open-source software and a paid enterprise platform."
    },
    {
      "title": "Product Breadth",
      "toolA": "Corteza bundles its CRM module with a unified workspace and enterprise messaging in one self-hosted platform, rather than selling separate products.",
      "toolB": "Salesforce operates as multiple interconnected Clouds -- Sales Cloud, Service Cloud, Marketing Cloud, and others -- that share the same underlying customer data.",
      "whyItMatters": "Understanding whether a platform is one product or a family of products affects how licensing and expansion work over time.",
      "benefitsWho": "Enterprises planning to expand from sales into service and marketing on the same underlying data (Salesforce)."
    }
  ],
  "featureMatrix": [
    {
      "group": "CRM Core Features",
      "rows": [
        {
          "feature": "Built-in CRM module",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Sales/Service/Marketing data sharing across products",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Salesforce's interconnected Clouds"
        },
        {
          "feature": "Low-code custom app builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Granular workflow automation",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "Neither tool's granular CRM feature set (e.g. specific automation tools) is itemized in available facts -- a documentation gap worth confirming directly with each vendor"
        }
      ]
    },
    {
      "group": "Ecosystem & Customization",
      "rows": [
        {
          "feature": "Third-party app marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Salesforce AppExchange"
        },
        {
          "feature": "Deep configurability for complex processes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Per Salesforce's documented pros"
        },
        {
          "feature": "Open-source code access/modification",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        }
      ]
    },
    {
      "group": "Cost & Deployment",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "Neither tool has published pricing plans in available facts"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Typically requires dedicated admin/implementation partner",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Per Salesforce's FAQ, this is typically required for a real deployment"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Corteza a real alternative to Salesforce?",
      "answer": "They differ significantly in scale: Corteza is open source and self-hosted with a smaller ecosystem by its own admission, while Salesforce is the market-leading CRM with a large AppExchange marketplace but real implementation complexity, often requiring a dedicated administrator or implementation partner."
    },
    {
      "question": "Is Corteza free?",
      "answer": "Yes, Corteza is fully open source under the Apache 2.0 license and free to download and self-host."
    },
    {
      "question": "Does Salesforce require an administrator to set up?",
      "answer": "Typically yes for a real deployment -- its depth and customization usually require a dedicated administrator or implementation partner, unlike lighter CRMs."
    },
    {
      "question": "Is Salesforce one product?",
      "answer": "No -- it's a family of interconnected products (\"Clouds\") for sales, service, marketing, and commerce that share underlying customer data."
    },
    {
      "question": "Does Corteza have an app marketplace like AppExchange?",
      "answer": "Not documented. Corteza's own materials note its community and ecosystem are smaller than major commercial CRMs like Salesforce."
    },
    {
      "question": "Can Corteza be self-hosted while Salesforce cannot?",
      "answer": "Corteza is explicitly designed to be self-hosted via Docker. Salesforce's hosting model isn't documented as self-hostable in the available facts -- it operates as a cloud platform."
    }
  ]
};

export default cortezaCrmVsSalesforceContent;
