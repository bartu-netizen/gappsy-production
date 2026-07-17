import type { ToolComparisonContent } from './types';

const kommoVsVtigerContent: ToolComparisonContent = {
  "verdict": "Kommo and Vtiger both weave AI into the CRM, but for different jobs. Kommo unifies WhatsApp, Instagram, TikTok, Facebook, and Telegram conversations into one inbox with 24/7 AI reply and AI scheduling, but has no free (non-trial) plan. Vtiger, founded in 2004 with offices in San Francisco and Bangalore, offers a free-forever Pilot edition plus an open-source CRM edition, and applies AI to lead/deal scoring, forecasting, and email drafting rather than live-channel messaging.",
  "bestForToolA": "Businesses whose sales process runs through messaging apps and want a single inbox for WhatsApp, Instagram, TikTok, Facebook, and Telegram, with 24/7 automated replies and AI-driven scheduling.",
  "bestForToolB": "Businesses that want a free-forever entry point (Pilot edition) or an open-source deployment option, plus AI-driven lead scoring, deal forecasting, and email drafting across sales, marketing, and help desk modules.",
  "whoNeedsBoth": "A business running high-volume messaging-based sales (via Kommo) alongside a broader sales/marketing/helpdesk operation with scoring and forecasting needs (via Vtiger) could use both for their respective strengths, though this adds integration overhead most small teams should avoid.",
  "keyDifferences": [
    {
      "title": "Unified messaging inbox",
      "toolA": "Consolidates conversations from WhatsApp, Instagram, TikTok, Facebook, and Telegram into one inbox.",
      "toolB": "Does not document a unified chat inbox for messaging channels.",
      "whyItMatters": "Businesses selling through chat apps need a CRM built around that inbox, which Kommo provides directly.",
      "benefitsWho": "SMBs and e-commerce sellers running sales through WhatsApp/Instagram/Telegram."
    },
    {
      "title": "Open-source availability",
      "toolA": "Does not document an open-source or self-hosted edition.",
      "toolB": "Offers an open-source CRM edition alongside its cloud SaaS product.",
      "whyItMatters": "Teams wanting to self-host or avoid vendor lock-in have that option with Vtiger but not Kommo.",
      "benefitsWho": "Technical teams wanting control over hosting and data."
    },
    {
      "title": "Free (non-trial) plan",
      "toolA": "Has no published free plan — only a 14-day trial with full features and 10GB storage.",
      "toolB": "Offers a free-forever Pilot edition alongside a 15-day free trial on paid plans.",
      "whyItMatters": "Teams wanting to run a CRM indefinitely at no cost can do so on Vtiger's Pilot edition but not on Kommo.",
      "benefitsWho": "Very small teams or solo users on a tight budget."
    },
    {
      "title": "AI feature type",
      "toolA": "AI centers on real-time messaging automation: 24/7 AI reply, AI scheduling/booking, and Salesbot automation.",
      "toolB": "AI centers on predictive lead/deal scoring, deal forecasting, sentiment analysis, AI email generation, and a Prompt Builder for custom CRM-context prompts.",
      "whyItMatters": "Kommo's AI automates conversations; Vtiger's AI analyzes and predicts. The right fit depends on whether the priority is automating chat responses or forecasting/scoring deals.",
      "benefitsWho": "Kommo: high-volume chat-based sales teams. Vtiger: teams prioritizing pipeline analytics and forecasting."
    },
    {
      "title": "Company background transparency",
      "toolA": "Founded year and headquarters are not documented.",
      "toolB": "Founded in 2004, with offices in San Francisco, California and Bangalore, India.",
      "whyItMatters": "Buyers researching vendor stability and history have documented facts available for Vtiger but not Kommo.",
      "benefitsWho": "Enterprise buyers doing vendor due diligence."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Unified messaging inbox (WhatsApp/Instagram/etc.)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open-source edition",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Marketing campaigns (landing pages, email nurture)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Help desk with SLAs",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Sales pipeline automation",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "24/7 automated chat reply",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI scheduling/booking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI lead/deal scoring & forecasting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI email drafting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom AI prompts on CRM data (Prompt Builder)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free (non-trial) plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Vtiger's free-forever Pilot edition."
        },
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "Kommo: $15/user/mo (Base). Vtiger: $12/user/mo (One Growth, annual)."
        },
        {
          "feature": "Founded year / HQ documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vtiger: 2004, San Francisco / Bangalore."
        },
        {
          "feature": "Enterprise custom pricing",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Kommo offer a free trial?",
      "answer": "Yes, a 14-day free trial with full feature access and 10GB storage, no credit card required."
    },
    {
      "question": "Does Vtiger have a free plan?",
      "answer": "Yes, a free-forever Pilot edition, plus a 15-day free trial on paid plans."
    },
    {
      "question": "What channels does Kommo support?",
      "answer": "Kommo unifies WhatsApp, Instagram, TikTok, Facebook, and Telegram conversations into one inbox."
    },
    {
      "question": "Is Vtiger open source?",
      "answer": "Yes, Vtiger has open-source origins and still offers an open-source CRM edition alongside its cloud product."
    },
    {
      "question": "When was Vtiger founded?",
      "answer": "Vtiger's journey started in 2004, with offices in San Francisco and Bangalore."
    },
    {
      "question": "Does Vtiger have AI features?",
      "answer": "Yes, including predictive lead/deal scoring, deal forecasting, sentiment analysis, AI email generation, and a Prompt Builder for custom CRM-context prompts."
    }
  ]
};

export default kommoVsVtigerContent;
