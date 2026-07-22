import type { ToolComparisonContent } from './types';

const maizzleVsVeroContent: ToolComparisonContent = {
  "verdict": "Maizzle is a free, open-source email development framework for coding and building production-ready HTML emails with Vue and Tailwind CSS; Vero is a paid multi-channel customer engagement platform, starting at $54/month, for sending and orchestrating email, SMS, and push campaigns with visual journey-building and warehouse segmentation. One is a developer templating tool, the other is a full sending and marketing platform -- different layers of the stack.",
  "bestForToolA": "Maizzle fits developers who want to hand-code reusable, component-based HTML email templates (Body, Container, Row, Section, Layout, Column) using Tailwind utility classes, for free.",
  "bestForToolB": "Vero fits marketing teams that need to build, send, and A/B test multi-channel campaigns (email, SMS, iOS/Android push) with segmentation driven directly from a data warehouse like Snowflake or BigQuery, starting at $54/month.",
  "whoNeedsBoth": "A team could build its transactional and marketing email templates in Maizzle for pixel-perfect, component-based markup, then load the resulting HTML into Vero to actually segment audiences and send the campaigns across email, SMS, and push.",
  "keyDifferences": [
    {
      "title": "What the Tool Actually Does",
      "toolA": "Maizzle is a templating and development framework for building HTML email markup, not a sending platform.",
      "toolB": "Vero is a sending and orchestration platform with a visual journey builder for multi-step, multi-channel campaigns.",
      "whyItMatters": "Buyers evaluating \"email tools\" need to know whether they are choosing a code framework or a campaign platform.",
      "benefitsWho": "Developers benefit from Maizzle; marketers and growth teams benefit from Vero."
    },
    {
      "title": "Pricing",
      "toolA": "Maizzle is free and open source.",
      "toolB": "Vero's Starter plan is $54/month ($49/month billed annually) for 5,000 profiles and 10,000 emails/month, with a custom-priced Professional tier.",
      "whyItMatters": "Cost structure differs completely between a free dev tool and a paid, usage-tiered SaaS product.",
      "benefitsWho": "Budget-conscious developers versus funded marketing teams needing send infrastructure."
    },
    {
      "title": "Channels Supported",
      "toolA": "Not documented -- Maizzle produces HTML email markup only.",
      "toolB": "Vero sends email, SMS, and iOS/Android push notifications from one platform.",
      "whyItMatters": "Teams running true multi-channel campaigns need native channel support that Maizzle doesn't provide.",
      "benefitsWho": "Teams running SMS or push campaigns alongside email."
    },
    {
      "title": "Segmentation & Data",
      "toolA": "Not documented for Maizzle -- it has no audience or data layer.",
      "toolB": "Vero supports segmentation via API or direct SQL connections to warehouses like Snowflake and BigQuery.",
      "whyItMatters": "Warehouse-native segmentation lets marketers target based on live product and business data rather than static lists.",
      "benefitsWho": "Data-driven marketing teams with an existing cloud warehouse."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "Not documented for Maizzle beyond its Vue/Tailwind build toolchain.",
      "toolB": "Vero connects to Segment, Salesforce, Google Analytics, Twilio, and reverse ETL tools like Census and Hightouch.",
      "whyItMatters": "Broad integrations reduce custom engineering work needed to connect a marketing stack.",
      "benefitsWho": "Teams with an existing martech stack wanting plug-and-play connections."
    }
  ],
  "featureMatrix": [
    {
      "group": "Email Development",
      "rows": [
        {
          "feature": "Component-based templating (Body/Container/Row/Section/Layout/Column)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Tailwind CSS styling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Vue-powered build tooling",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Campaign Sending & Channels",
      "rows": [
        {
          "feature": "Email sending/delivery",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Maizzle is build-only"
        },
        {
          "feature": "SMS sending",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "iOS/Android push notifications",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Visual journey builder",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Data & Targeting",
      "rows": [
        {
          "feature": "Data-warehouse segmentation (Snowflake/BigQuery)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "A/B testing of campaigns",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Reverse ETL integrations (Census, Hightouch)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Maizzle send emails, or just build them?",
      "answer": "Maizzle only builds and previews HTML email markup with Vue and Tailwind CSS; sending isn't part of its documented feature set, unlike Vero which is a full sending platform."
    },
    {
      "question": "How much does Vero cost compared to Maizzle?",
      "answer": "Maizzle is free and open source. Vero's Starter plan costs $54/month ($49/month billed annually) for 5,000 profiles and 10,000 emails/month, with a custom-priced Professional tier for higher usage."
    },
    {
      "question": "Can Vero segment audiences straight from a data warehouse?",
      "answer": "Yes, Vero supports segmentation via API or direct SQL connections to warehouses like Snowflake, BigQuery, and Redshift."
    },
    {
      "question": "Does Maizzle support SMS or push notifications?",
      "answer": "No, this isn't part of Maizzle's documented features -- it's an HTML email framework only. Vero natively sends email, SMS, and iOS/Android push."
    },
    {
      "question": "Is there a free trial for Vero?",
      "answer": "Yes, Vero offers a 14-day free trial with no credit card required; Maizzle has no trial because it's free and open source outright."
    }
  ]
};

export default maizzleVsVeroContent;
