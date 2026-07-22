import type { GroupComparisonContent } from './types';

const brevoVsConstantContactVsHubspotContent: GroupComparisonContent = {
  "verdict": "Brevo, Constant Contact, and HubSpot all offer email marketing, but they sit at very different points on the price-versus-breadth spectrum. Brevo is the most cost-efficient for businesses with large contact lists because it bills by email volume rather than list size and gives unlimited contacts on every paid plan. Constant Contact is the simplest, most beginner-friendly of the three, aimed squarely at small businesses and nonprofits new to digital marketing. HubSpot is the broadest platform, with a genuinely usable free CRM and Marketing Hub automation, but its Professional and Enterprise tiers scale into enterprise pricing that goes well beyond what a pure email marketing tool costs.",
  "bestFor": {
    "brevo": "Businesses with large or low-engagement contact lists that want unlimited contacts and to pay based on emails sent, not list size",
    "constant-contact": "Small businesses and nonprofits new to digital marketing who want an easy-to-use tool with strong live customer support",
    "hubspot": "Growing companies that want email marketing unified with a free CRM, sales pipeline, and service tools in one platform"
  },
  "highlights": [
    {
      "title": "Brevo bills by volume, not list size",
      "description": "Brevo's paid plans include unlimited contacts and charge based on emails sent per month, a structural difference from Constant Contact and HubSpot, which both scale pricing with the number of stored contacts.",
      "toolSlugs": [
        "brevo"
      ]
    },
    {
      "title": "HubSpot's free CRM is a real starting point",
      "description": "HubSpot's CRM is permanently free for unlimited users and includes contact records, email tracking, and basic reporting, giving it a lower true entry cost than Brevo's paid tiers or Constant Contact's trial-only model.",
      "toolSlugs": [
        "hubspot"
      ]
    },
    {
      "title": "Constant Contact optimizes for simplicity and support",
      "description": "With a drag-and-drop builder and automation covering common small-business scenarios out of the box, Constant Contact leans on decades of operating history and live support rather than advanced segmentation depth.",
      "toolSlugs": [
        "constant-contact"
      ]
    },
    {
      "title": "Multi-channel messaging is a Brevo strength",
      "description": "Brevo combines email, SMS, and WhatsApp marketing with a built-in sales CRM in one platform, a broader channel mix at the entry tier than Constant Contact's email-plus-SMS approach.",
      "toolSlugs": [
        "brevo"
      ]
    },
    {
      "title": "HubSpot's cost jump at scale",
      "description": "HubSpot's Professional tier can run from roughly $100 per seat per month up to $890 per month for a bundled Marketing Hub, a much steeper ceiling than Brevo's roughly $499/month Professional tier or Constant Contact's $80/month Premium plan.",
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
            "brevo": "available",
            "constant-contact": "available",
            "hubspot": "available"
          }
        },
        {
          "feature": "Marketing automation workflows",
          "statuses": {
            "brevo": "available",
            "constant-contact": "available",
            "hubspot": "available"
          }
        },
        {
          "feature": "Free permanent tier",
          "statuses": {
            "brevo": "available",
            "constant-contact": "unavailable",
            "hubspot": "available"
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
            "brevo": "available",
            "constant-contact": "available",
            "hubspot": "not-documented"
          }
        },
        {
          "feature": "WhatsApp marketing",
          "statuses": {
            "brevo": "available",
            "constant-contact": "not-documented",
            "hubspot": "not-documented"
          }
        }
      ]
    },
    {
      "group": "CRM, AI, and platform breadth",
      "rows": [
        {
          "feature": "Built-in sales CRM",
          "statuses": {
            "brevo": "available",
            "constant-contact": "not-documented",
            "hubspot": "available"
          }
        },
        {
          "feature": "AI-assisted content generation",
          "statuses": {
            "brevo": "available",
            "constant-contact": "available",
            "hubspot": "available"
          }
        },
        {
          "feature": "CMS or website building",
          "statuses": {
            "brevo": "not-documented",
            "constant-contact": "not-documented",
            "hubspot": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheapest for a business with a large contact list?",
      "answer": "Brevo is generally the most cost-efficient for large lists because its paid plans include unlimited contacts and bill based on emails sent, whereas Constant Contact and HubSpot both scale pricing with the number of stored contacts."
    },
    {
      "question": "Does HubSpot's free plan include email marketing?",
      "answer": "HubSpot's permanently free CRM includes email tracking, scheduling, and basic reporting, but full marketing automation and advanced email campaign features are gated to the paid Starter tier and above."
    },
    {
      "question": "Which tool is easiest for a small business new to email marketing?",
      "answer": "Constant Contact is positioned specifically for small businesses and nonprofits new to digital marketing, with a simple drag-and-drop builder and out-of-the-box automation for common scenarios like welcome series and abandoned-cart reminders."
    },
    {
      "question": "Does Brevo include a CRM like HubSpot does?",
      "answer": "Yes, Brevo includes a built-in sales CRM with pipeline management, though HubSpot's CRM is more deeply integrated across separate Marketing, Sales, and Service Hubs."
    },
    {
      "question": "How much more expensive is HubSpot than Brevo or Constant Contact at higher tiers?",
      "answer": "HubSpot's Professional tier can reach roughly $890 per month for a bundled Marketing Hub, well above Brevo's roughly $499/month Professional tier and Constant Contact's $80/month Premium plan."
    }
  ]
};

export default brevoVsConstantContactVsHubspotContent;
