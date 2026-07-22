import type { ToolComparisonContent } from './types';

const growthloopVsMatomoContent: ToolComparisonContent = {
  "verdict": "GrowthLoop is an agentic, composable customer data platform for activating cloud warehouse data into AI-driven marketing campaigns, sold at custom enterprise pricing; Matomo is a privacy-first, GDPR-compliant web analytics platform positioned as an alternative to tools that share data with ad networks, also sold at custom/contact-sales pricing. GrowthLoop activates existing customer data into outbound campaigns, while Matomo collects and reports on-site visitor behavior -- different jobs in the same broader martech stack.",
  "bestForToolA": "GrowthLoop fits enterprise marketing and data teams (retail, finance, media, telecom, commerce) that already have a cloud data warehouse (BigQuery, Snowflake, Databricks, Redshift) and want to build campaigns with natural-language AI rather than SQL.",
  "bestForToolB": "Matomo fits organizations that need privacy-first, GDPR-compliant web analytics with full data ownership -- an alternative to tools that may miss traffic or share data with ad networks -- with features like visitor profiles, enhanced SEO reporting, and a tag manager.",
  "whoNeedsBoth": "A privacy-conscious enterprise could use Matomo to collect GDPR-compliant on-site analytics and then feed that first-party behavioral data into GrowthLoop's warehouse-native AI Studio to activate marketing campaigns across 50+ ad, CRM, and customer success destinations.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "GrowthLoop activates warehouse data into multi-channel marketing campaigns via AI Studio and Universal Journeys.",
      "toolB": "Matomo collects and reports on-site visitor behavior, positioned around privacy and GDPR compliance rather than ad-network data sharing.",
      "whyItMatters": "One is a campaign activation platform, the other a web analytics and measurement platform.",
      "benefitsWho": "Marketing ops teams building campaigns benefit from GrowthLoop; teams needing compliant traffic measurement benefit from Matomo."
    },
    {
      "title": "Pricing Model",
      "toolA": "GrowthLoop pricing isn't publicly listed and requires a sales demo.",
      "toolB": "Matomo is also custom/contact-sales, with enterprise pricing described as quote-based rather than published, a documented con.",
      "whyItMatters": "Neither tool allows instant self-serve budgeting, so buyers should expect a sales conversation either way.",
      "benefitsWho": "Procurement teams that plan for a sales cycle regardless of which tool they pursue."
    },
    {
      "title": "Data Ownership & Privacy Positioning",
      "toolA": "Not documented as a specific privacy or compliance focus for GrowthLoop, though it is warehouse-native and keeps data in the customer's own warehouse.",
      "toolB": "Matomo is explicitly positioned as privacy-first and GDPR-focused, claiming full data ownership versus tools that can miss up to 40% of traffic.",
      "whyItMatters": "Organizations with strict compliance requirements need a tool that makes privacy and compliance an explicit design goal.",
      "benefitsWho": "EU-facing organizations or any team with strict GDPR obligations."
    },
    {
      "title": "AI-Driven Campaign Building",
      "toolA": "GrowthLoop's AI Studio lets marketers describe campaign goals in natural language instead of writing SQL, with AI-generated segment suggestions.",
      "toolB": "Not documented for Matomo -- its features center on reporting (visitor profiles, enhanced SEO, tag manager) rather than AI campaign generation.",
      "whyItMatters": "Teams wanting to reduce SQL and engineering dependency for campaign creation need GrowthLoop's AI layer specifically.",
      "benefitsWho": "Marketers without deep SQL skills who need to activate warehouse data."
    },
    {
      "title": "Extensibility",
      "toolA": "Not documented as a plugin/marketplace model; GrowthLoop integrates with 50+ advertising, CRM, and customer success destinations.",
      "toolB": "Matomo offers an official plugin marketplace to extend functionality.",
      "whyItMatters": "Extensibility approach differs -- GrowthLoop extends via pre-built destination integrations, Matomo via installable plugins.",
      "benefitsWho": "Technical teams wanting to customize Matomo via plugins versus marketers wanting pre-built campaign destinations in GrowthLoop."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Foundation",
      "rows": [
        {
          "feature": "Warehouse-native architecture",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BigQuery, Snowflake, Databricks, Redshift"
        },
        {
          "feature": "First-party data ownership",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "GDPR/privacy-first positioning",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Analytics & Reporting",
      "rows": [
        {
          "feature": "Web visitor behavior tracking",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Visitor profiles",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "SEO reporting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Enhanced SEO"
        },
        {
          "feature": "Tag manager",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Campaign Activation",
      "rows": [
        {
          "feature": "AI-driven natural-language campaign building",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "AI Studio"
        },
        {
          "feature": "Multi-channel campaign orchestration",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Universal Journeys"
        },
        {
          "feature": "Ad/CRM/customer-success destination integrations",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "50+ destinations"
        },
        {
          "feature": "Plugin marketplace",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Matomo do the same thing as GrowthLoop?",
      "answer": "No -- Matomo collects and reports on-site visitor analytics with a privacy/GDPR focus, while GrowthLoop activates warehouse data into outbound AI-driven marketing campaigns."
    },
    {
      "question": "Is either tool's pricing published?",
      "answer": "No, both require a sales conversation -- GrowthLoop's pricing needs a demo request, and Matomo's enterprise pricing is custom/contact-sales."
    },
    {
      "question": "Which tool is built around data privacy?",
      "answer": "Matomo is explicitly positioned as privacy-first and GDPR-focused with full data ownership; this isn't a documented focus for GrowthLoop, though its warehouse-native model keeps data in the customer's own warehouse."
    },
    {
      "question": "Can GrowthLoop build campaigns without SQL?",
      "answer": "Yes, GrowthLoop's AI Studio lets marketers describe campaign goals in natural language instead of writing SQL."
    },
    {
      "question": "Does Matomo integrate with marketing destinations like GrowthLoop does?",
      "answer": "This isn't documented -- Matomo's extensibility is via an official plugin marketplace, while GrowthLoop specifically integrates with 50+ advertising, CRM, and customer success destinations."
    }
  ]
};

export default growthloopVsMatomoContent;
