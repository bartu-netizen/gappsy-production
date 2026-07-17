import type { ToolComparisonContent } from './types';

const onesignalVsPushengageContent: ToolComparisonContent = {
  "verdict": "OneSignal and PushEngage both offer free-tier push notification platforms with AI features, but they differ in channel breadth and automation focus. OneSignal spans mobile push, web push, SMS/RCS, email, and in-app messaging with AI-assisted campaign orchestration, and claims 2 million+ businesses and 12 billion+ daily messages; PushEngage centers on web/mobile push plus WhatsApp, with dedicated ecommerce automation (cart abandonment, back-in-stock alerts) and an AI copywriter for drafting notification variants, and discloses a 2015 founding date that OneSignal's facts don't provide.",
  "bestForToolA": "Teams that need a single platform spanning push, SMS/RCS, email, and in-app messaging with unlimited mobile push sends even on the free plan, and that want AI to help orchestrate full campaigns rather than just draft copy.",
  "bestForToolB": "Ecommerce sites that want cart-abandonment and back-in-stock automation, native WordPress, WooCommerce, and Shopify Plus integrations, and an AI copywriter for notification variants, particularly WordPress-based stores given the 400K+ install plugin.",
  "whoNeedsBoth": "Marketing teams running both a general multichannel engagement program and a dedicated ecommerce storefront may end up using OneSignal for broader lifecycle messaging and PushEngage for store-specific automation, since the facts show distinct specializations rather than full overlap.",
  "keyDifferences": [
    {
      "title": "Founding year disclosure",
      "toolA": "OneSignal's founding year is not disclosed in the facts.",
      "toolB": "PushEngage discloses it was founded in 2015.",
      "whyItMatters": "A disclosed founding year can factor into vendor stability assessments.",
      "benefitsWho": "Buyers doing vendor due diligence."
    },
    {
      "title": "Channel breadth",
      "toolA": "OneSignal supports mobile push, web push, SMS/RCS, email, and in-app messaging from one platform.",
      "toolB": "PushEngage's named channels are web push, mobile app push, WhatsApp, and chat widgets; SMS/RCS and native in-app messaging aren't mentioned in its facts.",
      "whyItMatters": "Teams needing a single tool for email, SMS, and push together get broader coverage from OneSignal per the facts.",
      "benefitsWho": "Marketing teams consolidating multiple messaging channels into one platform."
    },
    {
      "title": "Ecommerce automation depth",
      "toolA": "OneSignal's facts don't mention ecommerce-specific automation triggers, focusing instead on general journey automation.",
      "toolB": "PushEngage has explicit ecommerce automation — cart abandonment, price drop, and back-in-stock notifications — gated to its Growth plan ($60/month), plus native Shopify Plus, WooCommerce, and WordPress integrations.",
      "whyItMatters": "Purpose-built ecommerce triggers save engineering time compared to building custom automation on a general platform.",
      "benefitsWho": "Online stores wanting out-of-the-box cart-recovery and stock-alert messaging."
    },
    {
      "title": "Free tier limits",
      "toolA": "OneSignal's free plan allows unlimited mobile push sends but caps email at 10,000/month and web push at 10,000 subscribers per send.",
      "toolB": "PushEngage's free plan is capped at 200 subscribers total and 30 campaigns, a much smaller ceiling but spanning all its channels.",
      "whyItMatters": "The shape of each free tier's limits determines which use case it actually supports at no cost.",
      "benefitsWho": "Small teams or hobby projects deciding which free tier fits their expected volume."
    },
    {
      "title": "AI feature framing",
      "toolA": "OneSignal's AI-assisted orchestration can draft, send, test, and optimize entire campaigns within defined brand guardrails.",
      "toolB": "PushEngage's AI copywriter is scoped to drafting multiple on-brand notification message variants rather than full campaign orchestration.",
      "whyItMatters": "Full campaign orchestration automates more of the workflow than message-copy drafting alone.",
      "benefitsWho": "Lean marketing teams wanting AI to handle more of the end-to-end campaign process."
    }
  ],
  "featureMatrix": [
    {
      "group": "Channels",
      "rows": [
        {
          "feature": "Mobile push",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Web push",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Email",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SMS/RCS",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "WhatsApp",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "In-app messaging",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI campaign orchestration (draft/send/test/optimize)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI copywriter for notification variants",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Ecommerce & Automation",
      "rows": [
        {
          "feature": "Cart abandonment / back-in-stock automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PushEngage: Growth plan."
        },
        {
          "feature": "Native ecommerce platform integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PushEngage: Shopify Plus, WooCommerce, WordPress."
        },
        {
          "feature": "Journey/workflow automation",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "OneSignal: unlimited mobile push, 10k email sends/month. PushEngage: 200 subscribers, 30 campaigns."
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "OneSignal: $19/month + usage. PushEngage: $14/month ($8/month billed annually)."
        },
        {
          "feature": "Founding year disclosed",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "PushEngage: 2015."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is OneSignal free?",
      "answer": "Yes, the Free plan includes 10,000 email sends per month and unlimited mobile push sends at no cost."
    },
    {
      "question": "Is PushEngage free?",
      "answer": "Yes, the Free plan covers up to 200 subscribers and 30 campaigns, not just a trial."
    },
    {
      "question": "Does OneSignal use AI?",
      "answer": "Yes, its AI can draft, send, test, and optimize campaigns automatically based on defined brand guardrails."
    },
    {
      "question": "Does PushEngage use AI?",
      "answer": "Yes, its AI copywriter drafts push notification variants."
    },
    {
      "question": "Does PushEngage support WhatsApp?",
      "answer": "Yes, WhatsApp Business messaging is included alongside web and mobile push."
    },
    {
      "question": "When was PushEngage founded?",
      "answer": "PushEngage was founded in 2015; OneSignal's founding year is not disclosed in the available facts."
    }
  ]
};

export default onesignalVsPushengageContent;
