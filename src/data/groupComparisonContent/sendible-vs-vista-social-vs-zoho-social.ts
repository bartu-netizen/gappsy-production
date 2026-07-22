import type { GroupComparisonContent } from './types';

const sendibleVsVistaSocialVsZohoSocialContent: GroupComparisonContent = {
  "verdict": "Sendible, Vista Social, and Zoho Social all cover the publishing, scheduling, and reporting basics agencies and marketing teams need, but they diverge sharply on who they are built for. Sendible leans hardest into agency workflows with white-label reports and client approval steps, Vista Social packs the most modern feature set (AI captioning, listening, review management) into a mid-priced plan, and Zoho Social is the only one of the three with a genuine free tier and native CRM ties. The right pick depends less on raw feature count and more on whether you need agency-grade client management, an AI-assisted all-in-one workspace, or the lowest possible entry cost.",
  "bestFor": {
    "sendible": "Agencies managing many client accounts that need white-label reporting and formal content approval workflows",
    "vista-social": "Teams that want a feature-dense, AI-assisted platform bundling listening, reviews, and DM automation at a mid-range price",
    "zoho-social": "Individuals, small teams, or Zoho customers who want a free starting tier and native CRM and helpdesk integration"
  },
  "highlights": [
    {
      "title": "Built for agency client work",
      "description": "Sendible and Zoho Social both offer dedicated agency-tier plans with white-label reporting and client-facing portals, while Vista Social folds white-label setup into its higher Scale plan rather than a distinct agency product line.",
      "toolSlugs": [
        "sendible",
        "zoho-social",
        "vista-social"
      ]
    },
    {
      "title": "AI and listening depth",
      "description": "Vista Social stands out with an AI Assistant for captions and performance Q&A, plus built-in social listening and review management, none of which are documented as native Sendible features.",
      "toolSlugs": [
        "vista-social"
      ]
    },
    {
      "title": "Entry pricing and free access",
      "description": "Zoho Social is the only tool with a permanently free plan, undercutting Sendible's $29 per month Creator tier and Vista Social's $79 per month Professional tier for teams just getting started.",
      "toolSlugs": [
        "zoho-social",
        "sendible",
        "vista-social"
      ]
    },
    {
      "title": "Bulk and evergreen scheduling",
      "description": "Sendible's bulk content importer and Smart Queues, along with Zoho Social's bulk scheduler from the Standard plan up, give high-volume posters batch tools that are not called out in Vista Social's documented feature set.",
      "toolSlugs": [
        "sendible",
        "zoho-social"
      ]
    },
    {
      "title": "Ecosystem integrations",
      "description": "Zoho Social's native ties to Zoho CRM and Zoho Desk let social activity feed directly into sales and support workflows, an integration angle neither Sendible nor Vista Social documents.",
      "toolSlugs": [
        "zoho-social"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing and Scheduling",
      "rows": [
        {
          "feature": "Bulk content scheduling",
          "statuses": {
            "sendible": "available",
            "vista-social": "not-documented",
            "zoho-social": "available"
          },
          "note": "Sendible offers a bulk importer and Smart Queues; Zoho Social adds a bulk scheduler from the Standard plan up."
        },
        {
          "feature": "Content approval workflows",
          "statuses": {
            "sendible": "available",
            "vista-social": "not-documented",
            "zoho-social": "available"
          },
          "note": "Zoho Social gates approval workflows to its Professional plan and above."
        }
      ]
    },
    {
      "group": "Engagement and Monitoring",
      "rows": [
        {
          "feature": "Social listening and mention tracking",
          "statuses": {
            "sendible": "limited",
            "vista-social": "available",
            "zoho-social": "available"
          },
          "note": "Sendible's unified inbox surfaces mentions and comments but is not documented as a dedicated listening or sentiment tool."
        },
        {
          "feature": "Review management",
          "statuses": {
            "sendible": "not-documented",
            "vista-social": "available",
            "zoho-social": "not-documented"
          },
          "note": "Vista Social explicitly monitors and responds to customer reviews, including Google Business Profile, from its dashboard."
        },
        {
          "feature": "AI content assistant",
          "statuses": {
            "sendible": "not-documented",
            "vista-social": "available",
            "zoho-social": "not-documented"
          },
          "note": "Vista Social's AI Assistant generates captions and answers performance questions using monthly AI credits."
        }
      ]
    },
    {
      "group": "Agency Tools and Pricing",
      "rows": [
        {
          "feature": "White-label or client-facing reporting",
          "statuses": {
            "sendible": "available",
            "vista-social": "limited",
            "zoho-social": "available"
          },
          "note": "Vista Social offers white-label setup only on its higher-priced Scale plan rather than as a core feature."
        },
        {
          "feature": "Permanently free plan",
          "statuses": {
            "sendible": "unavailable",
            "vista-social": "unavailable",
            "zoho-social": "available"
          },
          "note": "Zoho Social's Free plan covers 1 brand across 6 channels for 1 team member."
        },
        {
          "feature": "Native CRM or helpdesk integration",
          "statuses": {
            "sendible": "not-documented",
            "vista-social": "not-documented",
            "zoho-social": "available"
          },
          "note": "Zoho Social connects directly to Zoho CRM and Zoho Desk."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Sendible, Vista Social, and Zoho Social has a free plan?",
      "answer": "Only Zoho Social offers a permanently free plan, covering 1 brand across 6 channels for 1 team member with basic scheduling and an image editor. Sendible starts at $29 per month and Vista Social starts at $79 per month, neither with an ongoing free tier."
    },
    {
      "question": "Which tool is best for an agency managing multiple client accounts?",
      "answer": "Sendible and Zoho Social both offer purpose-built agency tiers with white-label reporting and client-facing portals: Sendible's Advanced and Enterprise plans add approval workflows and white-label reports, while Zoho Social's Agency and Agency Plus plans add client portals and branded logins for 10 to 20 brands. Vista Social can serve agencies too, but its white-label setup only appears on the higher-priced Scale plan rather than a dedicated agency product line."
    },
    {
      "question": "Does Vista Social include AI-powered features?",
      "answer": "Yes. Vista Social includes an AI Assistant and AI Knowledge feature for generating captions and answering questions about account performance, using a pool of monthly AI credits that scales with plan tier. Neither Sendible nor Zoho Social documents an equivalent AI content assistant."
    },
    {
      "question": "How do entry-level prices compare across the three tools?",
      "answer": "Zoho Social is the cheapest way in, with a free plan and a Standard plan around 15 dollars per month. Sendible's Creator plan starts at 29 dollars per month for 1 user and 6 social profiles. Vista Social starts higher, at 79 dollars per month for its Professional plan, which includes 15 social profiles and 3 users."
    },
    {
      "question": "Which platform offers built-in review management?",
      "answer": "Vista Social is the only one of the three with a documented review management feature, letting teams monitor and respond to customer reviews, including Google Business Profile listings, from the same dashboard used for social scheduling."
    },
    {
      "question": "Do any of these tools integrate with a CRM?",
      "answer": "Zoho Social is the only tool with documented native CRM integration, connecting to Zoho CRM and Zoho Desk so social activity can be linked to sales and support records. Sendible and Vista Social do not document equivalent CRM integrations."
    }
  ]
};

export default sendibleVsVistaSocialVsZohoSocialContent;
