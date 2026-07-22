import type { GroupComparisonContent } from './types';

const aweberVsBrevoVsHubspotContent: GroupComparisonContent = {
  "verdict": "AWeber, Brevo, and HubSpot all offer email marketing, but they price and scope it differently. AWeber is a mature, subscriber-count-priced ESP built for straightforward campaigns, landing pages, and e-commerce selling. Brevo bills by email volume rather than contact count, so businesses with large but low-engagement lists can save money while also getting SMS, WhatsApp, and a built-in CRM. HubSpot anchors its email tools to a permanently free CRM and can grow into a full marketing, sales, and service platform, at the cost of complexity and price once you move into Professional or Enterprise tiers.",
  "bestFor": {
    "aweber": "Small businesses that want a straightforward, established email marketing tool with landing pages, e-commerce selling, and AI writing assistance at a predictable subscriber-based price.",
    "brevo": "Cost-conscious teams with large but low-engagement contact lists who want unlimited contacts on every paid plan, plus optional SMS, WhatsApp, and a built-in sales CRM.",
    "hubspot": "Growing businesses that want email marketing tied to a unified free CRM from day one and expect to eventually need sales pipeline and customer service tools on the same platform."
  },
  "highlights": [
    {
      "title": "Three different billing bases",
      "description": "AWeber scales price with subscriber list size, Brevo bills by monthly email volume with unlimited contacts on paid plans, and HubSpot uses per-seat pricing across its Hubs alongside a free CRM tier.",
      "toolSlugs": [
        "aweber",
        "brevo",
        "hubspot"
      ]
    },
    {
      "title": "No permanent free plan from AWeber",
      "description": "Brevo and HubSpot both offer usable free tiers, while AWeber's lowest-cost entry is a 14-day trial before its paid Lite plan begins.",
      "toolSlugs": [
        "aweber",
        "brevo",
        "hubspot"
      ]
    },
    {
      "title": "Multi-channel and CRM breadth",
      "description": "Brevo adds SMS, WhatsApp, and a built-in sales CRM alongside email, while HubSpot's free CRM extends into full sales pipeline and customer service tooling that goes well beyond email marketing.",
      "toolSlugs": [
        "brevo",
        "hubspot"
      ]
    },
    {
      "title": "AI writing tools across all three",
      "description": "AWeber's AI writing and subject-line assistant, Brevo's AI content and subject-line assistance, and HubSpot's Breeze AI content assistant all help draft campaign copy.",
      "toolSlugs": [
        "aweber",
        "brevo",
        "hubspot"
      ]
    },
    {
      "title": "Room to grow into a bigger platform",
      "description": "HubSpot can scale from a free CRM into Marketing, Sales, and Service Hubs as a business grows, while AWeber and Brevo stay focused primarily on email and adjacent messaging channels.",
      "toolSlugs": [
        "hubspot"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Email Tools",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "aweber": "unavailable",
            "brevo": "available",
            "hubspot": "available"
          },
          "note": "AWeber offers only a 14-day free trial rather than a forever-free tier."
        },
        {
          "feature": "Landing page builder",
          "statuses": {
            "aweber": "available",
            "brevo": "not-documented",
            "hubspot": "available"
          }
        },
        {
          "feature": "Marketing automation workflows",
          "statuses": {
            "aweber": "available",
            "brevo": "available",
            "hubspot": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Multi-Channel",
      "rows": [
        {
          "feature": "AI writing / content assistance",
          "statuses": {
            "aweber": "available",
            "brevo": "available",
            "hubspot": "available"
          }
        },
        {
          "feature": "SMS / multi-channel messaging",
          "statuses": {
            "aweber": "unavailable",
            "brevo": "available",
            "hubspot": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform Breadth",
      "rows": [
        {
          "feature": "Built-in CRM",
          "statuses": {
            "aweber": "unavailable",
            "brevo": "available",
            "hubspot": "available"
          },
          "note": "HubSpot's CRM is the free wedge product underlying its entire platform; Brevo's CRM is a lighter pipeline-management layer."
        },
        {
          "feature": "Unlimited contacts on paid plans",
          "statuses": {
            "aweber": "unavailable",
            "brevo": "available",
            "hubspot": "limited"
          },
          "note": "AWeber and HubSpot pricing scale with subscriber or contact volume; Brevo bills by email volume sent instead."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does AWeber have a free plan like Brevo and HubSpot?",
      "answer": "No. AWeber offers a 14-day free trial across its plans but does not have a permanent free tier, unlike Brevo's Free plan (300 emails per day, up to 100,000 contacts) and HubSpot's permanently free CRM."
    },
    {
      "question": "How does Brevo's pricing differ from AWeber's and HubSpot's?",
      "answer": "Brevo charges based on how many emails you send per month and includes unlimited contacts on every paid plan. AWeber and HubSpot both scale cost with the number of subscribers or contacts you store, which can cost more for businesses with large but relatively low-engagement lists."
    },
    {
      "question": "Is HubSpot's free CRM enough for email marketing on its own?",
      "answer": "HubSpot's Free CRM tier includes email tracking and scheduling, live chat, forms, and basic reporting for unlimited users, so it can cover light email marketing needs. Businesses that need full marketing automation, custom reporting, or A/B testing will need to upgrade to a paid Marketing Hub tier."
    },
    {
      "question": "Which of these three includes SMS and WhatsApp messaging?",
      "answer": "Brevo is the one built for multi-channel messaging beyond email, offering SMS and WhatsApp campaigns alongside email marketing and automation from the same platform."
    },
    {
      "question": "Which tool is the best fit for a company that will eventually need sales and service tools too?",
      "answer": "HubSpot is the strongest fit for that path, since its free CRM and email tools sit on the same data model as its Sales Hub and Service Hub, letting a company add pipeline management or ticketing later without switching platforms."
    },
    {
      "question": "Do all three tools offer AI writing assistance?",
      "answer": "Yes. AWeber includes an AI writing and subject-line assistant, Brevo offers AI-generated content and subject-line suggestions, and HubSpot's Breeze AI provides a generative content assistant across its Hubs."
    }
  ]
};

export default aweberVsBrevoVsHubspotContent;
