import type { GroupComparisonContent } from './types';

const campaignMonitorVsCustomerIoVsElasticEmailContent: GroupComparisonContent = {
  "verdict": "Campaign Monitor, Customer.io, and Elastic Email all send marketing email, but they serve different buyers. Campaign Monitor is a traditional drag-and-drop email marketing platform aimed at non-technical marketers, Customer.io is an event-driven, multi-channel engagement platform built for product and growth teams that need behavioral segmentation across email, SMS, push, and in-app messages, and Elastic Email pairs a transactional API and SMTP relay with lighter-weight marketing tools at a lower price point. The right pick depends less on which is stronger overall and more on whether the buyer needs simple campaigns, behavioral automation, or developer-controlled sending.",
  "bestFor": {
    "campaign-monitor": "Marketing teams who want an easy drag-and-drop builder and an established campaign platform without much technical setup.",
    "customer-io": "Product and growth teams that need event-based behavioral segmentation and multi-channel messaging across email, SMS, push, and in-app.",
    "elastic-email": "Developers and budget-conscious teams who want combined transactional API and SMTP sending plus basic marketing email in one account."
  },
  "highlights": [
    {
      "title": "Event-based versus list-based segmentation",
      "description": "Customer.io segments audiences using real-time behavioral and event data, while Campaign Monitor's segmentation is built around more traditional audience lists.",
      "toolSlugs": [
        "customer-io",
        "campaign-monitor"
      ]
    },
    {
      "title": "Elastic Email combines transactional and marketing sending",
      "description": "Elastic Email offers both a transactional email API and SMTP relay alongside marketing tools in a single account, avoiding the need for separate vendors and reputation pools.",
      "toolSlugs": [
        "elastic-email"
      ]
    },
    {
      "title": "Only Customer.io orchestrates beyond email",
      "description": "Customer.io's Journeys workflow builder supports email, SMS, push, and in-app messaging from one system, a broader channel mix than either Campaign Monitor or Elastic Email documents.",
      "toolSlugs": [
        "customer-io"
      ]
    },
    {
      "title": "Track record versus developer-first pricing",
      "description": "Campaign Monitor has been operating since 2004 and offers a nonprofit discount, while Elastic Email positions itself as a lower-cost, developer-first alternative to platforms like SendGrid and Mailgun.",
      "toolSlugs": [
        "campaign-monitor",
        "elastic-email"
      ]
    },
    {
      "title": "Very different pricing structures",
      "description": "Campaign Monitor and Customer.io both scale pricing with subscriber or profile counts, while Elastic Email uses pay-as-you-go credits layered with tiered monthly subscriptions.",
      "toolSlugs": [
        "campaign-monitor",
        "customer-io",
        "elastic-email"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Sending and Automation",
      "rows": [
        {
          "feature": "Drag-and-drop email builder",
          "statuses": {
            "campaign-monitor": "available",
            "customer-io": "not-documented",
            "elastic-email": "available"
          }
        },
        {
          "feature": "Marketing automation workflows",
          "statuses": {
            "campaign-monitor": "available",
            "customer-io": "available",
            "elastic-email": "available"
          }
        },
        {
          "feature": "Transactional email API or SMTP relay",
          "statuses": {
            "campaign-monitor": "available",
            "customer-io": "not-documented",
            "elastic-email": "available"
          }
        }
      ]
    },
    {
      "group": "Targeting and Channels",
      "rows": [
        {
          "feature": "Real-time behavioral or event-based segmentation",
          "statuses": {
            "campaign-monitor": "limited",
            "customer-io": "available",
            "elastic-email": "limited"
          },
          "note": "Campaign Monitor and Elastic Email document list and audience segmentation rather than explicit real-time event-based targeting."
        },
        {
          "feature": "Multi-channel messaging (SMS, push, in-app)",
          "statuses": {
            "campaign-monitor": "unavailable",
            "customer-io": "available",
            "elastic-email": "unavailable"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "campaign-monitor": "available",
            "customer-io": "available",
            "elastic-email": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "campaign-monitor": "unavailable",
            "customer-io": "unavailable",
            "elastic-email": "available"
          }
        },
        {
          "feature": "Self-serve free trial",
          "statuses": {
            "campaign-monitor": "available",
            "customer-io": "available",
            "elastic-email": "available"
          },
          "note": "Customer.io's trial runs 14 days."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Customer.io the same kind of tool as Campaign Monitor?",
      "answer": "Not exactly. Campaign Monitor is a traditional drag-and-drop email marketing platform, while Customer.io is a behavioral engagement platform built around event data and multi-channel messaging across email, SMS, push, and in-app."
    },
    {
      "question": "Which is cheapest to start with?",
      "answer": "Elastic Email has a genuinely free tier. Campaign Monitor starts at roughly $13 per month, and Customer.io starts at $100 per month, though pricing on all three scales with volume or list size."
    },
    {
      "question": "Which supports SMS and push notifications in addition to email?",
      "answer": "Customer.io, through its multi-channel Journeys workflow builder; Campaign Monitor and Elastic Email are documented as email-focused platforms."
    },
    {
      "question": "Can Elastic Email be used for both transactional and marketing email?",
      "answer": "Yes, Elastic Email combines a transactional email API and SMTP relay with marketing email tools in a single account."
    },
    {
      "question": "Which platform has the longest track record?",
      "answer": "Campaign Monitor, founded in 2004, predates both Customer.io (2012) and Elastic Email (2010)."
    },
    {
      "question": "Which is best for event-driven, behavior-triggered messaging?",
      "answer": "Customer.io, which is built specifically around real-time behavioral data and event-based segmentation rather than static contact lists."
    }
  ]
};

export default campaignMonitorVsCustomerIoVsElasticEmailContent;
