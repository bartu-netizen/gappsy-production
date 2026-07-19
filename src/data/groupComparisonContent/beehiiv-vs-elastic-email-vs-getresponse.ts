import type { GroupComparisonContent } from './types';

const beehiivVsElasticEmailVsGetresponseContent: GroupComparisonContent = {
  "verdict": "All three send marketing email with templates and API access, but they come at the job from different angles. Beehiiv is a newsletter platform built around creator monetization, Elastic Email is a developer-oriented transactional-plus-marketing email provider, and GetResponse is a broad all-in-one small-business marketing suite. None is a strict upgrade over the others; the right choice depends on whether monetization tooling, a transactional email API, or all-in-one breadth matters most.",
  "bestFor": {
    "beehiiv": "Independent writers and publishers who want a free-to-start newsletter platform with built-in ad network and monetization tools.",
    "elastic-email": "Developers and cost-conscious teams that need a single account handling both transactional (system) emails and marketing campaigns via API or SMTP relay.",
    "getresponse": "Small businesses and solo creators who want one affordable platform for email, automation, landing pages, webinars, and course sales."
  },
  "highlights": [
    {
      "title": "Elastic Email is the only true transactional email API here",
      "description": "Elastic Email combines a REST API and SMTP relay for system-triggered emails (receipts, password resets) with its marketing suite in one account and reputation pool, a use case neither Beehiiv nor GetResponse is built around.",
      "toolSlugs": [
        "elastic-email"
      ]
    },
    {
      "title": "Beehiiv leads on newsletter monetization",
      "description": "Beehiiv's native ad network, digital product sales, and sponsorship storefront are purpose-built for creators monetizing an audience, which Elastic Email and GetResponse do not offer in the same depth.",
      "toolSlugs": [
        "beehiiv"
      ]
    },
    {
      "title": "GetResponse has the broadest all-in-one marketing suite",
      "description": "Webinars, a course creator, and conversion funnels sit alongside GetResponse's email tools, letting small businesses avoid separate subscriptions for those functions.",
      "toolSlugs": [
        "getresponse"
      ]
    },
    {
      "title": "All three offer a free tier to test before paying",
      "description": "Beehiiv's free Launch plan supports up to 2,500 subscribers, Elastic Email's free tier includes about 3,000 emails and 1,000 contacts, and GetResponse's free plan covers a limited contact list, giving buyers a no-cost way to evaluate each platform.",
      "toolSlugs": [
        "beehiiv",
        "elastic-email",
        "getresponse"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Sending Infrastructure",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "beehiiv": "available",
            "elastic-email": "available",
            "getresponse": "available"
          }
        },
        {
          "feature": "Transactional email API and SMTP relay",
          "statuses": {
            "beehiiv": "unavailable",
            "elastic-email": "available",
            "getresponse": "not-documented"
          }
        },
        {
          "feature": "Dedicated IP and deliverability/reputation tooling",
          "statuses": {
            "beehiiv": "not-documented",
            "elastic-email": "available",
            "getresponse": "available"
          },
          "note": "GetResponse's dedicated sending domain and IP are reserved for its Enterprise/Max tier."
        }
      ]
    },
    {
      "group": "Campaign Building and Automation",
      "rows": [
        {
          "feature": "Drag-and-drop campaign builder",
          "statuses": {
            "beehiiv": "available",
            "elastic-email": "available",
            "getresponse": "available"
          }
        },
        {
          "feature": "Behavior-triggered marketing automation workflows",
          "statuses": {
            "beehiiv": "available",
            "elastic-email": "available",
            "getresponse": "available"
          }
        }
      ]
    },
    {
      "group": "Growth and Monetization Extras",
      "rows": [
        {
          "feature": "Newsletter monetization (ad network, subscriptions, digital products)",
          "statuses": {
            "beehiiv": "available",
            "elastic-email": "unavailable",
            "getresponse": "limited"
          },
          "note": "GetResponse offers paid newsletter subscriptions and a course creator but no native ad network."
        },
        {
          "feature": "Webinar hosting and course creation",
          "statuses": {
            "beehiiv": "unavailable",
            "elastic-email": "unavailable",
            "getresponse": "available"
          }
        }
      ]
    },
    {
      "group": "Agency and Reseller Support",
      "rows": [
        {
          "feature": "White-label reseller and sub-account management",
          "statuses": {
            "beehiiv": "not-documented",
            "elastic-email": "available",
            "getresponse": "not-documented"
          },
          "note": "Elastic Email's Pro tier explicitly supports reseller and sub-account functionality."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three offers a transactional email API alongside marketing email?",
      "answer": "Elastic Email is the only one built around a transactional email API and SMTP relay in addition to its marketing suite, letting a single account handle both system emails and newsletters. Beehiiv and GetResponse are focused on marketing and newsletter sends."
    },
    {
      "question": "Which has the most generous free plan?",
      "answer": "Beehiiv's free Launch plan supports up to 2,500 subscribers with unlimited sends. Elastic Email's free tier covers roughly 3,000 emails to 1,000 contacts per month. GetResponse's free plan is more limited on contacts and features."
    },
    {
      "question": "Is Elastic Email a good fit for a non-technical newsletter writer?",
      "answer": "Not primarily. Elastic Email is developer-oriented, built around API and SMTP integration, and its marketing tools are described as less sophisticated than dedicated platforms like Beehiiv or GetResponse. Non-technical creators are likely better served by Beehiiv or GetResponse."
    },
    {
      "question": "Which platform offers webinars and course creation?",
      "answer": "GetResponse, whose Creator plan adds native webinar hosting for up to 100 attendees and a course creator for roughly 500 students. Neither Beehiiv nor Elastic Email offers these features."
    },
    {
      "question": "Which is built specifically for newsletter monetization?",
      "answer": "Beehiiv, with a native ad network at a 0 percent take rate on paid subscriptions, digital product sales, and a sponsorship storefront built into the platform."
    },
    {
      "question": "Does Elastic Email support agencies managing multiple client accounts?",
      "answer": "Yes. Elastic Email's Pro tier ($49/month) includes white-label reseller capabilities and sub-account management, a feature not documented for Beehiiv or GetResponse."
    }
  ]
};

export default beehiivVsElasticEmailVsGetresponseContent;
