import type { GroupComparisonContent } from './types';

const campaignMonitorVsElasticEmailVsMailerliteContent: GroupComparisonContent = {
  "verdict": "Campaign Monitor, Elastic Email, and MailerLite are all email marketing platforms, but they suit different budgets and audiences. Campaign Monitor is an established, mid-market subscription tool with unlimited sends on its paid tiers, Elastic Email is a developer-friendly hybrid of transactional API sending and marketing email with a genuine free tier, and MailerLite is an affordable all-in-one platform for small businesses and creators that bundles email with landing pages and a website builder.",
  "bestFor": {
    "campaign-monitor": "Established brands and marketing teams wanting a polished, long-standing email platform with unlimited sends on paid tiers.",
    "elastic-email": "Developers and cost-conscious senders who want transactional API and SMTP sending combined with marketing email and a free entry tier.",
    "mailerlite": "Small businesses and creators who want an affordable all-in-one tool bundling email, landing pages, and a website builder."
  },
  "highlights": [
    {
      "title": "MailerLite bundles more than email",
      "description": "MailerLite includes landing pages, a website builder, signup forms, and digital product and booking tools alongside email campaigns, reducing the need for separate tools.",
      "toolSlugs": [
        "mailerlite"
      ]
    },
    {
      "title": "Elastic Email is the only one with a real free tier",
      "description": "Elastic Email offers a genuinely free entry tier, while Campaign Monitor only provides a free trial and MailerLite's free plan is limited to very small lists.",
      "toolSlugs": [
        "elastic-email"
      ]
    },
    {
      "title": "Campaign Monitor's unlimited sending and nonprofit discount",
      "description": "Campaign Monitor offers unlimited sends starting at its Essentials tier and a 15 percent discount for nonprofit organizations, features not documented for the other two platforms.",
      "toolSlugs": [
        "campaign-monitor"
      ]
    },
    {
      "title": "API focus differs across the three",
      "description": "All three provide APIs, but Elastic Email's is built around transactional and SMTP-relay sending, while Campaign Monitor's and MailerLite's APIs lean toward marketing campaign management.",
      "toolSlugs": [
        "campaign-monitor",
        "elastic-email",
        "mailerlite"
      ]
    },
    {
      "title": "Recent ownership and pricing shifts",
      "description": "Campaign Monitor has changed hands from CM Group to Marigold, with its enterprise business later sold to Zeta Global, while MailerLite raised prices 10 to 30 percent in mid-2026 after being acquired by Vercom.",
      "toolSlugs": [
        "campaign-monitor",
        "mailerlite"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Editor and Automation",
      "rows": [
        {
          "feature": "Drag-and-drop email builder",
          "statuses": {
            "campaign-monitor": "available",
            "elastic-email": "available",
            "mailerlite": "available"
          }
        },
        {
          "feature": "Marketing automation workflows",
          "statuses": {
            "campaign-monitor": "available",
            "elastic-email": "available",
            "mailerlite": "available"
          }
        },
        {
          "feature": "AI writing assistance",
          "statuses": {
            "campaign-monitor": "available",
            "elastic-email": "not-documented",
            "mailerlite": "available"
          }
        }
      ]
    },
    {
      "group": "Beyond Email",
      "rows": [
        {
          "feature": "Landing pages or website builder",
          "statuses": {
            "campaign-monitor": "not-documented",
            "elastic-email": "not-documented",
            "mailerlite": "available"
          }
        },
        {
          "feature": "Transactional email API or SMTP relay",
          "statuses": {
            "campaign-monitor": "available",
            "elastic-email": "available",
            "mailerlite": "not-documented"
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
            "elastic-email": "available",
            "mailerlite": "available"
          }
        },
        {
          "feature": "Unlimited sends on entry-level paid tier",
          "statuses": {
            "campaign-monitor": "available",
            "elastic-email": "not-documented",
            "mailerlite": "not-documented"
          },
          "note": "Campaign Monitor offers unlimited sends starting at its Essentials plan."
        },
        {
          "feature": "Nonprofit discount",
          "statuses": {
            "campaign-monitor": "available",
            "elastic-email": "not-documented",
            "mailerlite": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three has a free plan?",
      "answer": "Elastic Email and MailerLite both offer free plans; Campaign Monitor only offers a free trial before requiring a paid subscription."
    },
    {
      "question": "Which is best for bundling a website with email marketing?",
      "answer": "MailerLite, since it includes landing pages, a website builder, and signup forms alongside its email tools at no extra cost."
    },
    {
      "question": "Which supports transactional email sending via API or SMTP?",
      "answer": "Elastic Email is built around a transactional email API and SMTP relay; Campaign Monitor also documents a transactional email feature. MailerLite's free plan API access does not support sending."
    },
    {
      "question": "Did pricing change recently for any of these platforms?",
      "answer": "Yes. MailerLite raised prices by 10 to 30 percent across most tiers in mid-2026 after being acquired by Vercom, and Campaign Monitor's ownership moved from CM Group to Marigold, with its enterprise business later sold to Zeta Global."
    },
    {
      "question": "Which offers a nonprofit discount?",
      "answer": "Campaign Monitor, which offers a 15 percent discount for nonprofit organizations."
    },
    {
      "question": "Which is most budget-friendly for very small lists?",
      "answer": "Elastic Email's free tier or MailerLite's free plan, both of which are designed for small-scale senders before upgrading to a paid tier."
    }
  ]
};

export default campaignMonitorVsElasticEmailVsMailerliteContent;
