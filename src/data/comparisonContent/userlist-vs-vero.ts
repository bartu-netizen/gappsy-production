import type { ToolComparisonContent } from './types';

const userlistVsVeroContent: ToolComparisonContent = {
  "verdict": "Userlist and Vero both build multi-step customer messaging journeys, but Userlist is purpose-built for B2B SaaS with account-level (company) automation and in-app messaging, while Vero is a multi-channel platform (email, SMS, push) with direct data-warehouse segmentation and reverse-ETL integrations. The better fit depends on whether the priority is account-based B2B messaging or warehouse-driven, multi-channel outreach.",
  "bestForToolA": "B2B SaaS companies that need account-level (not just individual-user) automation, in-app messaging, and conversion-goal tracking built around a many-to-many user-to-company data model.",
  "bestForToolB": "Teams with a modern data stack who want to segment directly from a SQL warehouse (Snowflake, BigQuery, Redshift) and send across email, SMS, and push from one tool.",
  "whoNeedsBoth": "A data-driven B2B company that segments and triggers primarily from its warehouse via Vero for multi-channel outreach, while using Userlist's account-level automation and in-app messaging for product-led lifecycle communication.",
  "keyDifferences": [
    {
      "title": "Messaging Channels",
      "toolA": "Userlist's documented channels are lifecycle email, transactional email, and in-app messages, with no SMS or push mentioned.",
      "toolB": "Vero explicitly supports email, SMS, and push notifications (iOS/Android) in one platform.",
      "whyItMatters": "Products needing to reach users via SMS or push outside of email need a tool that natively supports it.",
      "benefitsWho": "Consumer or mobile apps wanting a single vendor for email, SMS, and push."
    },
    {
      "title": "Account-Level vs. Individual-Contact Model",
      "toolA": "Userlist is built around account-level automation handling many-to-many relationships between users and companies, aimed specifically at B2B SaaS.",
      "toolB": "Vero's segmentation model is described around user profiles and data-warehouse queries rather than an account/company data model.",
      "whyItMatters": "B2B SaaS products often bill and communicate at the account level, not just the individual-user level.",
      "benefitsWho": "B2B SaaS teams with multi-seat accounts."
    },
    {
      "title": "Data Warehouse Segmentation",
      "toolA": "Userlist's facts describe segmentation from behavioral and custom event data and 70+ app integrations, without mentioning direct warehouse/SQL segmentation.",
      "toolB": "Vero supports segmenting users via direct SQL connections to warehouses like Snowflake, BigQuery, and Redshift, plus reverse-ETL tools (Census, Hightouch).",
      "whyItMatters": "Teams whose source of truth is a data warehouse need direct SQL-based segmentation rather than syncing through app integrations.",
      "benefitsWho": "Data teams and companies with a modern data stack."
    },
    {
      "title": "Pricing Transparency and Entry Cost",
      "toolA": "Userlist's Basic and Professional plan prices aren't published; pricing is per-1,000-user increments via a pricing calculator.",
      "toolB": "Vero publishes a $54/month Starter price for defined limits (5,000 profiles / 10,000 emails per month).",
      "whyItMatters": "Buyers wanting to compare cost before a sales conversation get a concrete number from Vero, while Userlist requires using its calculator.",
      "benefitsWho": "Budget-conscious teams evaluating multiple tools quickly."
    },
    {
      "title": "SDK / Developer Breadth",
      "toolA": "Userlist's SDKs are limited to JavaScript, Ruby, PHP, and Laravel.",
      "toolB": "Vero's facts don't list specific SDK languages but describe a broad integrations list including Segment and reverse-ETL tools.",
      "whyItMatters": "Affects how easily engineering teams in other languages can instrument events directly.",
      "benefitsWho": "Engineering teams outside the JS/Ruby/PHP ecosystem."
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation & Segmentation",
      "rows": [
        {
          "feature": "Visual workflow / journey builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Account-level (company) automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Data-warehouse (SQL) segmentation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "A/B testing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Conversion goal tracking",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Channels",
      "rows": [
        {
          "feature": "Lifecycle + transactional email",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "In-app messages",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SMS",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Push notifications",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "14-day free trial, no credit card",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Published starting price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Userlist requires its pricing calculator; Vero publishes $54/month."
        },
        {
          "feature": "70+ named integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Vero documents a broad but not explicitly counted integration list, including reverse-ETL tools."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Userlist offer a free plan?",
      "answer": "No — a 14-day free trial with no credit card required, but no permanent free tier."
    },
    {
      "question": "Does Vero offer a free plan?",
      "answer": "No — only a 14-day free trial with no credit card required."
    },
    {
      "question": "What channels can each platform send through?",
      "answer": "Userlist sends lifecycle email, transactional email, and in-app messages; Vero sends email, SMS, and push notifications for iOS and Android."
    },
    {
      "question": "Can either tool segment users from a data warehouse?",
      "answer": "Vero supports segmentation via direct SQL connections to warehouses like Snowflake, BigQuery, and Redshift; Userlist's facts describe segments built from behavioral and custom event data via its 70+ integrations, not direct warehouse queries."
    },
    {
      "question": "What does the entry-level plan cost?",
      "answer": "Vero's Starter plan is $54/month ($49/month billed annually); Userlist's Basic and Professional plan prices aren't published and require its pricing calculator."
    }
  ]
};

export default userlistVsVeroContent;
