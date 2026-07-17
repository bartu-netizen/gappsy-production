import type { ToolComparisonContent } from './types';

const helpcrunchVsProprofsHelpDeskContent: ToolComparisonContent = {
  "verdict": "HelpCrunch and ProProfs Help Desk both combine live chat, chatbots, and AI-assisted responses, but they price and structure their AI features very differently. ProProfs publishes fixed per-tier pricing with escalating AI capability (drafts, then first-response generation, then emotion detection), while HelpCrunch's Basic/PRO plans scale by monthly email volume with an unpublished top-tier price, making cost harder to predict upfront. The tradeoff is pricing predictability versus HelpCrunch's broader communication-and-marketing scope.",
  "bestForToolA": "Teams that want live chat, chatbot, email marketing, and popups combined with a shared inbox in one platform, and that need native mobile SDKs to embed support into their own iOS/Android/React Native apps.",
  "bestForToolB": "Teams that want a permanently free entry tier (1 agent, unlimited inboxes, 100 emails/month) plus clearly published, fixed-price paid tiers with escalating AI features like emotion detection and data redaction on top tiers.",
  "whoNeedsBoth": "A company doing both external marketing outreach and internal customer support might use HelpCrunch's email marketing and popups for lead generation while running dedicated support ticketing through ProProfs' more clearly capped ticket-volume tiers.",
  "keyDifferences": [
    {
      "title": "Pricing predictability",
      "toolA": "HelpCrunch's Basic and PRO plans scale by monthly email volume (0-200,000+ and 0-1,000,000+ respectively) with the top Unlimited tier price not stated.",
      "toolB": "ProProfs publishes fixed monthly prices for every tier, from Essentials ($29.99/month) up to Customer Delight Suite (from $499/month).",
      "whyItMatters": "Volume-based pricing without a published ceiling makes it harder to budget in advance compared to fixed, itemized pricing.",
      "benefitsWho": "Finance and procurement teams that need predictable software costs."
    },
    {
      "title": "Free tier structure",
      "toolA": "HelpCrunch's plans 'start free' and scale with email volume, without a clearly capped standalone free tier documented.",
      "toolB": "ProProfs documents a permanently free plan: 1 agent, unlimited inboxes and ticket history, 100 emails/month.",
      "whyItMatters": "A clearly bounded free plan lets very small teams use the product indefinitely at no cost.",
      "benefitsWho": "Solo founders or single-agent support operations."
    },
    {
      "title": "AI feature tiering",
      "toolA": "HelpCrunch's AI Agents include a free monthly conversation allowance on paid plans, with additional conversations as paid add-ons; an AI Editor helps draft messages.",
      "toolB": "ProProfs escalates AI capability by tier: AI response drafts (50/month) on Essentials, an AI first-response generator and tone rewriting on Business, and AI emotion detection plus data redaction on Business Complete Elite.",
      "whyItMatters": "Granular AI tiering lets buyers match spend to how much AI-driven automation they actually need.",
      "benefitsWho": "Teams evaluating how much AI capability is required at each growth stage."
    },
    {
      "title": "Marketing vs. ticketing breadth",
      "toolA": "HelpCrunch includes email marketing campaigns and on-site popups for lead generation alongside support tools.",
      "toolB": "Not documented for ProProfs Help Desk, which focuses on omnichannel ticketing, automation, and reporting.",
      "whyItMatters": "Combining marketing tools with support reduces the need for a separate marketing platform.",
      "benefitsWho": "Small teams that want support and lead-gen in one subscription."
    },
    {
      "title": "Mobile presence",
      "toolA": "HelpCrunch offers in-app SDKs for iOS, Android, and React Native to embed support inside a company's own app.",
      "toolB": "ProProfs offers native standalone iOS and Android apps for agents to manage tickets on the go.",
      "whyItMatters": "SDKs serve companies embedding support into their own product, while standalone apps serve agents needing mobility.",
      "benefitsWho": "Product teams building support into their own app (HelpCrunch) versus support agents needing mobility (ProProfs)."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI chat/response drafting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Tiered/escalating AI capability",
          "toolA": "limited",
          "toolB": "available",
          "note": "HelpCrunch: free allowance + paid add-ons; ProProfs: escalates Essentials to Elite"
        },
        {
          "feature": "Emotion detection / data redaction",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ProProfs top tier only"
        }
      ]
    },
    {
      "group": "Channels & Communication",
      "rows": [
        {
          "feature": "Live chat",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Chatbot",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Email marketing campaigns",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Shared/omnichannel inbox",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Mobile & Platform",
      "rows": [
        {
          "feature": "Mobile SDKs for own apps",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native standalone mobile app",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Two-factor authentication",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanently free plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "HelpCrunch 'starts free' but scales by email volume"
        },
        {
          "feature": "Fixed published pricing",
          "toolA": "limited",
          "toolB": "available"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ProProfs: 15-day"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which one has a clearer free plan?",
      "answer": "ProProfs Help Desk documents a permanently free plan for 1 agent with 100 emails/month. HelpCrunch's plans 'start free' but scale with email volume rather than offering a clearly bounded free tier."
    },
    {
      "question": "How does AI pricing differ?",
      "answer": "ProProfs escalates AI features by tier — response drafts on Essentials, a first-response generator on Business, emotion detection on Business Complete Elite. HelpCrunch includes AI Agents with a free monthly conversation allowance on paid plans, with additional usage as a paid add-on."
    },
    {
      "question": "Does either include email marketing?",
      "answer": "HelpCrunch includes email marketing campaigns and popups. This is not documented as a ProProfs Help Desk feature."
    },
    {
      "question": "Which has native mobile apps?",
      "answer": "ProProfs Help Desk has native iOS and Android apps. HelpCrunch instead offers SDKs for iOS, Android, and React Native to embed support into a company's own app."
    },
    {
      "question": "Is there a money-back guarantee?",
      "answer": "ProProfs offers a 15-day money-back guarantee on all plans. No equivalent guarantee is documented for HelpCrunch."
    },
    {
      "question": "Where are these companies based?",
      "answer": "HelpCrunch lists its headquarters in Wilmington, DE, USA. ProProfs Help Desk does not publish a headquarters location."
    }
  ]
};

export default helpcrunchVsProprofsHelpDeskContent;
