import type { GroupComparisonContent } from './types';

const cortezaCrmVsDjangoCrmVsTwentyContent: GroupComparisonContent = {
  "verdict": "All three are free, open-source, self-hostable CRMs aimed at technically capable teams who want to avoid per-seat SaaS pricing and vendor lock-in, but they differ in maturity and philosophy. Corteza CRM leans on the broader Corteza low-code platform for deep customization, Django-CRM leans on Django's admin interface and bundles built-in email marketing rarely found in open-source CRMs, and Twenty is the newest and most actively growing project, the only one of the three offering an official managed cloud hosting tier alongside free self-hosting. Teams should weigh community size and hosting preference: Twenty has the largest GitHub following and a self-serve cloud option, while Corteza CRM and Django-CRM are purely self-hosted-first with smaller communities.",
  "bestFor": {
    "corteza-crm": "Organizations that want a free CRM built into a broader low-code platform they can deeply customize (data model, fields, workflows) beyond a typical CRM's fixed schema.",
    "django-crm": "Python and Django-savvy teams that want built-in mass email marketing bundled into a free, self-hosted CRM without paying for a separate email tool.",
    "twenty": "Technical teams that want a modern, actively developed CRM with an optional low-cost managed cloud option and AI-assisted setup, not just a self-hosted-only tool."
  },
  "highlights": [
    {
      "title": "Only one with official managed cloud hosting",
      "description": "Twenty offers Cloud Pro ($9/user/month) and Cloud Organization ($19/user/month) plans for teams that don't want to self-host, while Corteza CRM offers only optional paid hosting through Planet Crust and Django-CRM has no managed hosting option at all.",
      "toolSlugs": [
        "twenty",
        "corteza-crm",
        "django-crm"
      ]
    },
    {
      "title": "Built-in email marketing sets Django-CRM apart",
      "description": "Django-CRM bundles mass email marketing and mailing-list functionality directly into the CRM, a feature many open-source CRM competitors lack natively.",
      "toolSlugs": [
        "django-crm"
      ]
    },
    {
      "title": "Low-code customization depth",
      "description": "Corteza CRM inherits the full low-code data-model, field, and workflow customization of the broader Corteza platform, going beyond a typical CRM's fixed schema.",
      "toolSlugs": [
        "corteza-crm"
      ]
    },
    {
      "title": "Twenty has the youngest but fastest-growing community",
      "description": "Founded in 2023 and backed by roughly $5.5 million in funding, Twenty has grown to roughly 44,000 to 50,000 GitHub stars, the most visible momentum of the three.",
      "toolSlugs": [
        "twenty"
      ]
    },
    {
      "title": "Licensing differs",
      "description": "Corteza CRM uses the permissive Apache 2.0 license, while Django-CRM and Twenty use the copyleft AGPL-3.0/AGPLv3 license, which requires open-sourcing modifications offered as a hosted service.",
      "toolSlugs": [
        "corteza-crm",
        "django-crm",
        "twenty"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM",
      "rows": [
        {
          "feature": "Lead and deal pipeline tracking",
          "statuses": {
            "corteza-crm": "available",
            "django-crm": "available",
            "twenty": "available"
          }
        },
        {
          "feature": "Built-in lead scoring or sales forecasting",
          "statuses": {
            "corteza-crm": "available",
            "django-crm": "not-documented",
            "twenty": "not-documented"
          }
        },
        {
          "feature": "Built-in email marketing",
          "statuses": {
            "corteza-crm": "not-documented",
            "django-crm": "available",
            "twenty": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Customization and Architecture",
      "rows": [
        {
          "feature": "No-code custom objects and fields",
          "statuses": {
            "corteza-crm": "available",
            "django-crm": "not-documented",
            "twenty": "available"
          },
          "note": "Corteza CRM's customization runs through the underlying low-code platform; Django-CRM extension typically requires editing code."
        },
        {
          "feature": "Developer SDK or extension framework",
          "statuses": {
            "corteza-crm": "limited",
            "django-crm": "limited",
            "twenty": "available"
          },
          "note": "Corteza and Django-CRM expose REST APIs and standard framework extensibility; Twenty ships a dedicated Twenty SDK."
        }
      ]
    },
    {
      "group": "Hosting and Reach",
      "rows": [
        {
          "feature": "Free self-hosting",
          "statuses": {
            "corteza-crm": "available",
            "django-crm": "available",
            "twenty": "available"
          }
        },
        {
          "feature": "Official managed cloud hosting option",
          "statuses": {
            "corteza-crm": "limited",
            "django-crm": "unavailable",
            "twenty": "available"
          },
          "note": "Corteza CRM's managed hosting is an optional paid service from Planet Crust rather than a published self-serve plan."
        },
        {
          "feature": "Multi-language interface",
          "statuses": {
            "corteza-crm": "not-documented",
            "django-crm": "available",
            "twenty": "not-documented"
          },
          "note": "Django-CRM documents support for 20+ languages."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are all three of these CRMs really free?",
      "answer": "Yes, all three can be self-hosted for free with no per-seat licensing fee: Corteza CRM (Apache 2.0), Django-CRM (AGPL-3.0), and Twenty (AGPLv3, with all core Pro-level features included in the free self-hosted version)."
    },
    {
      "question": "Which one has the easiest path to a hosted version if I don't want to run my own server?",
      "answer": "Twenty is the only one with a published, self-serve managed cloud plan (Cloud Pro at $9/user/month or Cloud Organization at $19/user/month). Corteza CRM offers optional paid hosting through Planet Crust, while Django-CRM has no official managed hosting option at all."
    },
    {
      "question": "Which CRM is best if I want built-in email marketing without a separate tool?",
      "answer": "Django-CRM includes mass email marketing and mailing-list functionality directly in the CRM, which is unusual among open-source CRM competitors and can replace a standalone email tool for basic campaigns."
    },
    {
      "question": "Do these require developer expertise to run?",
      "answer": "Yes, all three are self-hosted-first products. Django-CRM specifically requires Python and Django expertise to install and maintain, Corteza CRM requires Docker or Kubernetes familiarity, and Twenty, while offering a cloud option, still requires technical setup for anyone self-hosting it."
    },
    {
      "question": "Which CRM has the most active development and community?",
      "answer": "Twenty, founded in 2023, has grown fastest, reaching roughly 44,000 to 50,000 GitHub stars and about $5.5 million in funding, giving it more visible momentum than the more established but smaller Corteza CRM and Django-CRM communities."
    },
    {
      "question": "How do their licenses affect reselling a modified version?",
      "answer": "Corteza CRM's Apache 2.0 license is permissive and allows redistribution or white-labeling. Django-CRM and Twenty both use AGPL-licensed code, which requires releasing source code for any modified version offered as a hosted service, unless a commercial license is purchased, which Twenty offers."
    }
  ]
};

export default cortezaCrmVsDjangoCrmVsTwentyContent;
