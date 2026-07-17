import type { ToolComparisonContent } from './types';

const moengageVsWebengageContent: ToolComparisonContent = {
  "verdict": "MoEngage and WebEngage are both demo-gated, enterprise customer engagement platforms with no published pricing, so the choice comes down to which part of the stack each documents more explicitly. MoEngage leans on Merlin AI, a purpose-built assistant for building and optimizing campaigns, and cites named consumer-brand customers like Flipkart, Domino's, Swiggy, and Airtel. WebEngage leans on an explicit customer data platform with RFM segmentation and cohort/funnel analytics, plus a documented channel list that includes WhatsApp. Neither publishes a free trial, founding year, or headquarters.",
  "bestForToolA": "Teams that want a named AI copilot built into campaign creation (Merlin AI) and want engagement software already proven in a specific vertical they recognize, such as retail/ecommerce, travel and hospitality, food and beverage, media, or financial services, via MoEngage's named brand references.",
  "bestForToolB": "Teams that need an explicit customer data platform with RFM-based segmentation and cohort/funnel analytics as first-class, documented features, and that require WhatsApp as a confirmed outbound channel alongside email, SMS, web/mobile push, and social retargeting.",
  "whoNeedsBoth": "Multi-brand organizations or agencies that run parallel vendor demos (since neither platform publishes self-serve pricing) may end up shortlisting both and comparing them feature-by-feature rather than by price — particularly if one business unit values Merlin AI's campaign assistant and another values WebEngage's built-in CDP and RFM segmentation.",
  "keyDifferences": [
    {
      "title": "Named AI assistant vs. broader AI feature set",
      "toolA": "MoEngage ships Merlin AI, a purpose-built assistant specifically for building and optimizing marketing campaigns.",
      "toolB": "WebEngage documents AI-driven personalization spanning generative content, engagement scoring, predictive segmentation, and catalog recommendations, without naming a single assistant product.",
      "whyItMatters": "A named, focused AI product (Merlin AI) signals a specific in-workflow copilot experience, while WebEngage's broader AI feature list suggests AI is distributed across multiple engagement functions rather than centralized in one assistant.",
      "benefitsWho": "Marketing teams deciding whether they want one AI entry point for campaign work versus AI capabilities spread across segmentation, content, and recommendations."
    },
    {
      "title": "Customer data platform and segmentation depth",
      "toolA": "MoEngage documents a general 'Data Management' feature for centralizing customer data, without an explicit segmentation or RFM feature.",
      "toolB": "WebEngage explicitly lists a Customer Data Platform feature plus live/static segmentation with RFM modeling.",
      "whyItMatters": "RFM (recency, frequency, monetary) segmentation is a specific, advanced targeting capability; its explicit presence in WebEngage's documented feature set versus its absence from MoEngage's suggests a difference in how each platform frames its own data/segmentation depth.",
      "benefitsWho": "Lifecycle and retention marketers who plan campaigns around customer value tiers rather than broad behavioral triggers."
    },
    {
      "title": "Channel coverage: WhatsApp",
      "toolA": "MoEngage's documented channels are email, push, SMS, and in-app messaging.",
      "toolB": "WebEngage documents email, SMS, WhatsApp, web/mobile push, and social retargeting.",
      "whyItMatters": "WhatsApp is a dominant messaging channel in several of the markets both vendors serve; its explicit presence in WebEngage's channel list versus its absence from MoEngage's documented list is a concrete difference for teams that rely on it.",
      "benefitsWho": "Teams in markets where WhatsApp is a primary customer communication channel."
    },
    {
      "title": "Customer proof points",
      "toolA": "MoEngage names specific customers — Flipkart, Domino's, Swiggy, and Airtel — and lists the industries it serves.",
      "toolB": "WebEngage cites an aggregate figure of being trusted by 850+ global brands, without naming specific customers in the facts provided.",
      "whyItMatters": "Named references let a prospect check for direct-competitor or same-industry validation, while an aggregate count only signals scale.",
      "benefitsWho": "Buyers who want to validate a vendor against companies in their own industry before a sales call."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Engagement Features",
      "rows": [
        {
          "feature": "Cross-channel campaign sending",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Journey / workflow automation",
          "toolA": "available",
          "toolB": "available",
          "note": "MoEngage: analytics feeds cross-channel marketing; WebEngage: dedicated Journey designer."
        },
        {
          "feature": "Real-time transactional alerts",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Customer segmentation with RFM modeling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "WhatsApp messaging",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Named AI campaign assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "MoEngage's Merlin AI is explicitly named."
        },
        {
          "feature": "Generative AI content creation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Predictive segmentation / engagement scoring",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Availability",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial or free plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Founding year / headquarters disclosed",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does MoEngage publish its pricing?",
      "answer": "No. MoEngage does not list pricing publicly; interested customers must request a demo."
    },
    {
      "question": "Does WebEngage publish its pricing?",
      "answer": "No. WebEngage's pricing is not listed publicly and requires a demo request."
    },
    {
      "question": "What is Merlin AI?",
      "answer": "Merlin AI is MoEngage's purpose-built AI assistant designed to help marketers build and optimize campaigns."
    },
    {
      "question": "Does WebEngage support WhatsApp?",
      "answer": "Yes. WebEngage's documented channels include email, SMS, WhatsApp, web/mobile push, and social retargeting."
    },
    {
      "question": "Which industries use MoEngage?",
      "answer": "MoEngage lists customers across financial services, food & beverage, media & entertainment, travel & hospitality, and retail & ecommerce."
    },
    {
      "question": "Does WebEngage include a customer data platform?",
      "answer": "Yes. WebEngage combines a customer data platform with messaging, segmentation, and analytics in one product."
    }
  ]
};

export default moengageVsWebengageContent;
