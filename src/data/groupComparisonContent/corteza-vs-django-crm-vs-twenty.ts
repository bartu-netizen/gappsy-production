import type { GroupComparisonContent } from './types';

const cortezaVsDjangoCrmVsTwentyContent: GroupComparisonContent = {
  "verdict": "Corteza, Django-CRM, and Twenty are all free, open-source, self-hostable CRMs that avoid per-seat licensing, but they target different technical profiles. Corteza is the broadest, a full low-code platform where CRM is one module alongside workflow automation and enterprise messaging. Django-CRM is a focused, Python and Django-native CRM best suited to teams with in-house Django expertise. Twenty is the newest and most developer-friendly of the three, with a modern spreadsheet-like interface, a TypeScript-based architecture, and a growing managed cloud option.",
  "bestFor": {
    "corteza": "Organizations wanting a full low-code platform, CRM plus workflow automation and messaging, rather than a CRM alone.",
    "django-crm": "Python and Django development teams who want a mature, free, self-hosted CRM they can deeply customize in a familiar framework.",
    "twenty": "Technical teams wanting a modern, actively developed, self-hostable CRM with a spreadsheet-like interface and an affordable managed cloud option."
  },
  "highlights": [
    {
      "title": "Full Low-Code Platform, Not Just a CRM",
      "description": "Corteza's CRM module sits alongside a low-code application builder, workflow automation, and Slack-like enterprise messaging in one connected workspace.",
      "toolSlugs": [
        "corteza"
      ]
    },
    {
      "title": "Familiar Framework for Deep Customization",
      "description": "Django-CRM is built directly on the Django framework, making it straightforward to customize for teams that already have Python and Django expertise.",
      "toolSlugs": [
        "django-crm"
      ]
    },
    {
      "title": "Modern Spreadsheet-Style Interface",
      "description": "Twenty offers a fast, spreadsheet-like record view for managing contacts, companies, and deals, built on a TypeScript architecture with a developer SDK.",
      "toolSlugs": [
        "twenty"
      ]
    },
    {
      "title": "Affordable Managed Cloud Alternative",
      "description": "Twenty offers Cloud Pro and Cloud Organization tiers starting at $9 per user per month for teams that don't want to self-host, unlike Django-CRM's self-hosted-only model.",
      "toolSlugs": [
        "twenty"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM Features",
      "rows": [
        {
          "feature": "Lead and deal pipeline tracking",
          "statuses": {
            "corteza": "available",
            "django-crm": "available",
            "twenty": "available"
          }
        },
        {
          "feature": "Built-in email marketing",
          "statuses": {
            "corteza": "not-documented",
            "django-crm": "available",
            "twenty": "not-documented"
          }
        },
        {
          "feature": "No-code workflow automation",
          "statuses": {
            "corteza": "available",
            "django-crm": "not-documented",
            "twenty": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Customization",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "statuses": {
            "corteza": "available",
            "django-crm": "available",
            "twenty": "available"
          }
        },
        {
          "feature": "Official managed cloud hosting",
          "statuses": {
            "corteza": "limited",
            "django-crm": "unavailable",
            "twenty": "available"
          },
          "note": "Corteza offers custom paid hosting and support through Planet Crust rather than fixed self-serve tiers; Django-CRM has no official managed cloud."
        }
      ]
    },
    {
      "group": "Platform Scope",
      "rows": [
        {
          "feature": "Low-code custom objects and fields",
          "statuses": {
            "corteza": "available",
            "django-crm": "not-documented",
            "twenty": "available"
          }
        },
        {
          "feature": "Built-in team messaging",
          "statuses": {
            "corteza": "available",
            "django-crm": "unavailable",
            "twenty": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Corteza just a CRM like Django-CRM and Twenty?",
      "answer": "No. Corteza CRM is one module of a broader low-code platform that also includes a low-code application builder, workflow automation, and enterprise messaging, whereas Django-CRM and Twenty are purpose-built CRMs."
    },
    {
      "question": "Which of these three has an official managed cloud plan?",
      "answer": "Twenty offers Cloud Pro and Cloud Organization tiers. Corteza offers custom hosting and support through Planet Crust rather than fixed self-serve tiers, and Django-CRM has no official managed cloud option."
    },
    {
      "question": "Do all three require self-hosting expertise?",
      "answer": "By default, yes, all three are open-source and self-hosted. Twenty is the only one with a standard managed cloud alternative if a team doesn't want to run its own infrastructure."
    },
    {
      "question": "Which is best for developers who already know Django?",
      "answer": "Django-CRM, since it's built directly on the Django framework and is straightforward to customize for teams with existing Python and Django expertise."
    },
    {
      "question": "Which CRM has the most active, fast-growing open-source community?",
      "answer": "Twenty is described as an actively developed, fast-growing open-source project with frequent updates, and it was founded more recently, in 2023, than Corteza or Django-CRM."
    }
  ]
};

export default cortezaVsDjangoCrmVsTwentyContent;
