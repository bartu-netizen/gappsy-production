import type { ToolComparisonContent } from './types';

const enchargeVsOrttoContent: ToolComparisonContent = {
  "verdict": "Encharge and Ortto both automate multi-step customer messaging, but they differ in what's bundled and how transparent pricing is: Encharge focuses on behavior-based B2B automation with account-based company profiles and lead scoring, and publishes exact plan pricing, while Ortto bundles marketing automation with a customer data platform and live-chat/support tools across more channels, though its plan pricing wasn't verifiable from the source at review time. Neither dominates outright — it depends on whether unified support tooling or transparent, B2B-focused pricing matters more.",
  "bestForToolA": "B2B SaaS teams wanting account-based, company-level marketing, lead scoring, and clear published pricing ($99-$159/month).",
  "bestForToolB": "Teams wanting marketing automation, a customer data platform, and live-chat/support tools (team inbox, AI responses, screen sharing) combined in one system across email, SMS, and push.",
  "whoNeedsBoth": "An organization that runs Encharge for B2B behavior-based email and company-level segmentation while relying on Ortto's support and live-chat tooling for real-time customer conversations, since neither tool's facts document the other's respective strength.",
  "keyDifferences": [
    {
      "title": "Support / Live-Chat Tooling",
      "toolA": "Encharge's facts don't document any live-chat or support-inbox feature.",
      "toolB": "Ortto bundles a team inbox, live chat, AI-powered responses, calls, and screen sharing directly into the platform.",
      "whyItMatters": "Teams wanting marketing automation and customer support in one tool can avoid stitching together a separate helpdesk product.",
      "benefitsWho": "Smaller teams that want unified marketing and support tooling."
    },
    {
      "title": "Messaging Channels",
      "toolA": "Encharge's documented channels are behavior-based emails, with no SMS or push mentioned.",
      "toolB": "Ortto explicitly supports email, SMS, push notifications, forms, and surveys within journeys.",
      "whyItMatters": "Multi-channel reach matters for products that need to reach users outside of email.",
      "benefitsWho": "Consumer or mobile-first products needing SMS/push alongside email."
    },
    {
      "title": "Account-Based / B2B Segmentation Depth",
      "toolA": "Encharge documents company profiles specifically for account-based marketing, alongside lead scoring, aimed at B2B teams.",
      "toolB": "Ortto's customer data platform includes lead scoring but the facts don't describe account-level or company-based profiles.",
      "whyItMatters": "B2B SaaS teams often need to target accounts, not just individual users.",
      "benefitsWho": "B2B SaaS marketing teams running account-based campaigns."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Encharge publishes exact monthly prices for Growth ($99) and Premium ($159).",
      "toolB": "Ortto's pricing page \"was inaccessible at the time of review, so current plan pricing could not be verified from the source.\"",
      "whyItMatters": "Buyers comparing cost directly can do so with Encharge but must contact Ortto or research pricing separately.",
      "benefitsWho": "Budget-conscious buyers wanting upfront numbers."
    },
    {
      "title": "Integration Gating by Tier",
      "toolA": "Encharge requires the higher-priced Premium plan to unlock HubSpot, Salesforce, and Segment integrations.",
      "toolB": "Ortto's no-code integrations (Google Ads, Facebook, Salesforce, Shopify, Zendesk, HubSpot, and 50+ platforms) are described as a general platform capability without a stated tier restriction.",
      "whyItMatters": "Affects whether CRM integrations are available from day one or only after upgrading.",
      "benefitsWho": "Teams needing Salesforce/HubSpot sync immediately without upgrading."
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation & Channels",
      "rows": [
        {
          "feature": "Visual flow / journey builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SMS messaging",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Push notifications",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Behavior-based email triggers",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "A/B testing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Data & Support",
      "rows": [
        {
          "feature": "Customer data platform (CDP)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Lead scoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Live chat / team inbox",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Account-based / company profiles",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free trial (14-day)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Published plan pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ortto's pricing page was inaccessible at the time of review."
        },
        {
          "feature": "CRM integrations available without upgrade",
          "toolA": "limited",
          "toolB": "available",
          "note": "Encharge gates HubSpot/Salesforce/Segment behind the Premium plan; Ortto describes no-code integrations as general platform capability."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Encharge offer a free plan?",
      "answer": "No — only a 14-day free trial on both the Growth and Premium plans."
    },
    {
      "question": "Does Ortto offer a free plan?",
      "answer": "No — only a 14-day free trial; no permanent free tier is documented."
    },
    {
      "question": "What does Encharge's entry plan cost?",
      "answer": "The Growth plan is $99/month (or $79/month billed yearly) for up to 2,000 subscribers."
    },
    {
      "question": "Why isn't Ortto's exact pricing listed?",
      "answer": "Ortto's official pricing page was inaccessible at the time of review, so current plan pricing could not be verified from the source."
    },
    {
      "question": "Does either tool include live chat or support features?",
      "answer": "Ortto includes a team inbox, live chat, AI-powered responses, and screen sharing as part of its support and engagement feature set; Encharge's facts don't document any live-chat or support-inbox functionality."
    },
    {
      "question": "Was Ortto previously known by another name?",
      "answer": "Yes — the site notes \"Autopilot is now Ortto,\" indicating a rebrand."
    }
  ]
};

export default enchargeVsOrttoContent;
