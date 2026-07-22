import type { ToolComparisonContent } from './types';

const senderVsSendpulseContent: ToolComparisonContent = {
  "verdict": "Sender and SendPulse are both freemium email marketing platforms with usable free tiers, but SendPulse extends further into chatbots, a built-in CRM, web push, and live chat across native mobile apps, while Sender concentrates on email/SMS marketing automation with named ecommerce platform integrations. Neither is a universal winner — it depends on whether multi-channel messaging breadth or ecommerce-focused simplicity matters more.",
  "bestForToolA": "Ecommerce sellers who want direct integrations with WooCommerce, PrestaShop, Shopify, or Jumpseller alongside a generous free automation tier.",
  "bestForToolB": "Teams wanting chatbot automation across Instagram, WhatsApp, Telegram, and other messaging apps, plus a built-in CRM and native mobile apps, in addition to email.",
  "whoNeedsBoth": "A business that uses Sender for ecommerce-integrated email campaigns while using SendPulse's chatbot builders and CRM to manage social/messaging-app conversations, since the tools cover largely non-overlapping channels.",
  "keyDifferences": [
    {
      "title": "Chatbot & CRM Breadth",
      "toolA": "Sender's facts don't mention chatbots or a CRM.",
      "toolB": "SendPulse includes native chatbot builders for Instagram, TikTok, WhatsApp, Facebook Messenger, Telegram, and Viber, plus a built-in CRM with sales pipeline.",
      "whyItMatters": "Teams wanting messaging-app automation and deal tracking in one tool avoid adding separate chat/CRM software.",
      "benefitsWho": "Ecommerce or social-first businesses managing conversations across messaging apps."
    },
    {
      "title": "Mobile Apps",
      "toolA": "Sender's facts explicitly note no native mobile app is mentioned on the site.",
      "toolB": "SendPulse documents iOS and Android apps plus a Chrome extension.",
      "whyItMatters": "Marketers who need to manage campaigns or chat on the go are better served by a documented mobile app.",
      "benefitsWho": "Solo marketers or small teams working outside a desktop browser."
    },
    {
      "title": "Free Plan Allowance and Cost Structure",
      "toolA": "Sender's Free Forever plan allows up to 2,500 subscribers and 15,000 emails/month with automation and segmentation included.",
      "toolB": "SendPulse's Free plan allows 15,000 emails/month but caps chatbots at 3, and paid tiers are priced in EUR on a 6-month billing cycle.",
      "whyItMatters": "The free-tier limits and billing cadence affect which is cheaper to scale from zero.",
      "benefitsWho": "Early-stage senders comparing free-tier ceilings."
    },
    {
      "title": "Ecommerce vs. Multi-Channel Messaging Focus",
      "toolA": "Sender documents specific ecommerce platform integrations (WooCommerce, PrestaShop, Shopify, Jumpseller).",
      "toolB": "SendPulse's facts emphasize multi-channel messaging (chat apps, web push, SMS) more than named ecommerce platform integrations.",
      "whyItMatters": "Online stores may prioritize native ecommerce connections, while messaging-heavy brands prioritize chat-channel breadth.",
      "benefitsWho": "Online store owners versus brands running conversational marketing."
    },
    {
      "title": "Enterprise Minimums",
      "toolA": "Sender's Enterprise plan is custom-priced with unlimited emails and SSO, and the facts don't state a contact minimum.",
      "toolB": "SendPulse's Enterprise plan requires a minimum of 2,500 contacts.",
      "whyItMatters": "Affects whether a smaller team can access enterprise-only features like SSO without hitting a contact-volume minimum.",
      "benefitsWho": "Security-conscious smaller teams needing SSO."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Email Marketing",
      "rows": [
        {
          "feature": "Drag-and-drop email builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Marketing automation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "A/B testing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Landing pages / forms",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Multi-Channel & CRM",
      "rows": [
        {
          "feature": "SMS campaigns",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Chatbot builders (social/messaging apps)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in CRM / sales pipeline",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Web push notifications",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Live chat widget",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published entry paid price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sender's Standard/Professional prices aren't published; SendPulse Standard is €8.80/month."
        },
        {
          "feature": "Native mobile app",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Sender's facts explicitly note no mobile app is mentioned."
        },
        {
          "feature": "Enterprise SSO (SAML)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do both Sender and SendPulse have free plans?",
      "answer": "Yes — Sender's Free Forever plan supports up to 2,500 subscribers and 15,000 emails/month; SendPulse's Free plan supports 15,000 emails/month with 3 chatbots, a CRM, and a landing page builder."
    },
    {
      "question": "Does Sender have a mobile app?",
      "answer": "The facts note no native mobile app is mentioned on Sender's site."
    },
    {
      "question": "Does SendPulse have a mobile app?",
      "answer": "Yes — iOS and Android apps are available, along with a Chrome extension."
    },
    {
      "question": "Can either tool build chatbots?",
      "answer": "SendPulse supports chatbots for Instagram, TikTok, WhatsApp, Facebook Messenger, Telegram, and Viber; Sender's facts don't mention chatbot functionality."
    },
    {
      "question": "How is each platform priced?",
      "answer": "Sender's Standard and Professional plan prices aren't published as static numbers; SendPulse's paid plans start at €8.80/month (Standard), billed every six months."
    }
  ]
};

export default senderVsSendpulseContent;
