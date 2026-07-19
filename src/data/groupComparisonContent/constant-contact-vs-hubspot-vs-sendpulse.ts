import type { GroupComparisonContent } from './types';

const constantContactVsHubspotVsSendpulseContent: GroupComparisonContent = {
  "verdict": "Constant Contact, HubSpot, and SendPulse cover a wide span of the email marketing market. Constant Contact is the beginner-friendly, support-heavy choice for small businesses new to digital marketing. HubSpot is the broadest platform, unifying email with a free CRM, sales, and service tools for companies planning to grow into a full revenue stack. SendPulse sits between them as a genuinely multi-channel, budget-conscious option, bundling email, SMS, web push, and WhatsApp or Telegram chatbots into a generous free tier with a built-in CRM. The right pick depends on whether a team wants simplicity, platform breadth, or channel variety at the lowest cost.",
  "bestFor": {
    "constant-contact": "Small businesses and nonprofits new to digital marketing who want an easy interface and strong live customer support",
    "hubspot": "Growing companies that want email marketing unified with a free CRM, sales pipeline, and service tools in one platform",
    "sendpulse": "Budget-conscious teams that want email, SMS, web push, and chatbot messaging bundled with a free CRM"
  },
  "highlights": [
    {
      "title": "SendPulse's free tier includes a CRM",
      "description": "SendPulse's free plan covers up to 15,000 emails per month along with basic CRM and automation access, a broader free starting point than Constant Contact, which offers only a trial with no permanent free tier.",
      "toolSlugs": [
        "sendpulse"
      ]
    },
    {
      "title": "HubSpot's unified data model",
      "description": "HubSpot's free CRM underpins Marketing, Sales, and Service Hubs so every team works from the same contact record, a level of platform integration neither Constant Contact nor SendPulse documents.",
      "toolSlugs": [
        "hubspot"
      ]
    },
    {
      "title": "Constant Contact leans on decades of support experience",
      "description": "Founded in 1995, Constant Contact emphasizes extensive live customer support and out-of-the-box automation for common small-business scenarios like abandoned-cart reminders and welcome series.",
      "toolSlugs": [
        "constant-contact"
      ]
    },
    {
      "title": "SendPulse adds chatbots and an LMS",
      "description": "SendPulse's chatbot builder for WhatsApp, Instagram, Telegram, and Facebook Messenger, plus a course and LMS builder, extend it well beyond a typical email service provider, capabilities not documented for Constant Contact or HubSpot.",
      "toolSlugs": [
        "sendpulse"
      ]
    },
    {
      "title": "HubSpot's pricing ceiling is the highest",
      "description": "HubSpot's Enterprise tier can run from about $150 per seat per month up to $3,600+ per month for a bundled Customer Platform, well above SendPulse's pay-as-you-go pricing and Constant Contact's $80/month Premium plan.",
      "toolSlugs": [
        "hubspot"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Email marketing core",
      "rows": [
        {
          "feature": "Drag-and-drop email builder",
          "statuses": {
            "constant-contact": "available",
            "hubspot": "available",
            "sendpulse": "available"
          }
        },
        {
          "feature": "Free permanent tier",
          "statuses": {
            "constant-contact": "unavailable",
            "hubspot": "available",
            "sendpulse": "available"
          },
          "note": "Constant Contact offers only a free trial, not a permanent free plan."
        }
      ]
    },
    {
      "group": "Channels beyond email",
      "rows": [
        {
          "feature": "SMS marketing",
          "statuses": {
            "constant-contact": "available",
            "hubspot": "not-documented",
            "sendpulse": "available"
          }
        },
        {
          "feature": "Chatbot builder (WhatsApp, Telegram, etc.)",
          "statuses": {
            "constant-contact": "not-documented",
            "hubspot": "not-documented",
            "sendpulse": "available"
          }
        }
      ]
    },
    {
      "group": "CRM and platform breadth",
      "rows": [
        {
          "feature": "Built-in CRM",
          "statuses": {
            "constant-contact": "not-documented",
            "hubspot": "available",
            "sendpulse": "available"
          }
        },
        {
          "feature": "Landing page builder",
          "statuses": {
            "constant-contact": "available",
            "hubspot": "available",
            "sendpulse": "available"
          }
        },
        {
          "feature": "AI-assisted content generation",
          "statuses": {
            "constant-contact": "available",
            "hubspot": "available",
            "sendpulse": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Constant Contact, HubSpot, and SendPulse has a permanent free plan?",
      "answer": "Both HubSpot and SendPulse offer permanently free tiers, HubSpot with its free CRM and SendPulse with up to 15,000 emails per month; Constant Contact offers only a free trial before billing begins."
    },
    {
      "question": "Which tool offers the most marketing channels beyond email?",
      "answer": "SendPulse covers the most channels, bundling email, SMS, web push notifications, and chatbots for WhatsApp, Instagram, Telegram, and Facebook Messenger into one platform."
    },
    {
      "question": "Is HubSpot overkill for a small business that just needs email marketing?",
      "answer": "It can be. HubSpot's free CRM is genuinely useful, but its Professional and Enterprise Marketing Hub tiers scale into hundreds or thousands of dollars per month, well beyond what Constant Contact or SendPulse charge for comparable email functionality."
    },
    {
      "question": "Does SendPulse include a CRM?",
      "answer": "Yes, SendPulse includes a free built-in CRM for managing sales pipelines and deals alongside its email, SMS, and chatbot tools, a combination Constant Contact does not offer."
    },
    {
      "question": "Which tool has the longest operating history?",
      "answer": "Constant Contact has the longest history, founded in 1995 as Roving Software, compared to HubSpot's 2006 founding and SendPulse's 2015 founding."
    }
  ]
};

export default constantContactVsHubspotVsSendpulseContent;
