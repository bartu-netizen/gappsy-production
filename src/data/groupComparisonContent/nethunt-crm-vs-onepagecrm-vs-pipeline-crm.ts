import type { GroupComparisonContent } from './types';

const nethuntCrmVsOnepagecrmVsPipelineCrmContent: GroupComparisonContent = {
  "verdict": "NetHunt CRM, OnePageCRM, and Pipeline CRM are all lightweight, per-user CRMs built for small and mid-sized sales teams that want to skip enterprise complexity, but each optimizes for a different daily habit. NetHunt CRM lives inside Gmail, OnePageCRM organizes work around a single next action per contact, and Pipeline CRM leans on transparent, published per-user pricing with optional project management bolted on. None offers a permanent free plan, so the choice largely comes down to which workflow and price point fits the team.",
  "bestFor": {
    "nethunt-crm": "Teams that live inside Gmail and Google Workspace and want CRM features without switching to a separate application.",
    "onepagecrm": "Solo founders and small teams wanting the lowest entry price and a simple, action-first workflow instead of a traditional pipeline dashboard.",
    "pipeline-crm": "Small to mid-sized B2B sales teams wanting transparent, no-seat-minimum per-user pricing plus optional built-in project management on higher tiers."
  },
  "highlights": [
    {
      "title": "NetHunt CRM is the only one embedded directly in Gmail",
      "description": "NetHunt installs as a sidebar inside Gmail, turning existing email threads and contacts into CRM records, a workflow neither OnePageCRM nor Pipeline CRM offer since both are standalone applications.",
      "toolSlugs": [
        "nethunt-crm"
      ]
    },
    {
      "title": "OnePageCRM is the cheapest of the three to start",
      "description": "OnePageCRM's Professional plan starts at 9.95 dollars per user per month, well below Pipeline CRM's Start tier at 25 dollars per user per month and NetHunt's Basic tier at roughly 24 to 30 dollars per user per month.",
      "toolSlugs": [
        "onepagecrm",
        "pipeline-crm",
        "nethunt-crm"
      ]
    },
    {
      "title": "Pipeline CRM is the only one with published, no-seat-minimum pricing and project management",
      "description": "Pipeline CRM advertises no seat minimums and a flat, publicly listed per-user pricing table, and its Grow tier bundles Kanban and Gantt-based project management, features not present in NetHunt CRM or OnePageCRM's documented feature sets.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "NetHunt CRM offers startup and non-profit discounts the others do not document",
      "description": "NetHunt CRM offers a 75 percent discount on its Business plan for startups founded within the previous three years and a 25 percent discount for registered non-profits, discount programs not mentioned for OnePageCRM or Pipeline CRM.",
      "toolSlugs": [
        "nethunt-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Integration Approach",
      "rows": [
        {
          "feature": "Native Gmail embedding",
          "statuses": {
            "nethunt-crm": "available",
            "onepagecrm": "unavailable",
            "pipeline-crm": "unavailable"
          }
        },
        {
          "feature": "LinkedIn contact capture integration",
          "statuses": {
            "nethunt-crm": "available",
            "onepagecrm": "unavailable",
            "pipeline-crm": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Workflow Style",
      "rows": [
        {
          "feature": "Single next-action, task-driven workflow",
          "statuses": {
            "nethunt-crm": "unavailable",
            "onepagecrm": "available",
            "pipeline-crm": "unavailable"
          }
        },
        {
          "feature": "Multiple customizable sales pipelines",
          "statuses": {
            "nethunt-crm": "available",
            "onepagecrm": "limited",
            "pipeline-crm": "available"
          },
          "note": "OnePageCRM pairs a visual pipeline view with its Next Action queue rather than offering multiple independent pipelines; Pipeline CRM scales from 1 pipeline on Start up to 20 on Enterprise."
        }
      ]
    },
    {
      "group": "Extras",
      "rows": [
        {
          "feature": "Territory or map-based sales routing",
          "statuses": {
            "nethunt-crm": "unavailable",
            "onepagecrm": "unavailable",
            "pipeline-crm": "available"
          }
        },
        {
          "feature": "Built-in project management (Kanban/Gantt)",
          "statuses": {
            "nethunt-crm": "unavailable",
            "onepagecrm": "unavailable",
            "pipeline-crm": "available"
          }
        },
        {
          "feature": "Startup or non-profit pricing discounts",
          "statuses": {
            "nethunt-crm": "available",
            "onepagecrm": "unavailable",
            "pipeline-crm": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "nethunt-crm": "unavailable",
            "onepagecrm": "unavailable",
            "pipeline-crm": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do NetHunt CRM, OnePageCRM, or Pipeline CRM offer a free plan?",
      "answer": "No, none of the three has a permanent free tier. NetHunt CRM offers a 14-day free trial with no user-count restriction, and OnePageCRM offers a 21-day free trial; Pipeline CRM also offers a trial as part of its onboarding, though the exact trial length is not specified in its published details."
    },
    {
      "question": "Which is cheapest to start with?",
      "answer": "OnePageCRM's Professional plan at 9.95 dollars per user per month is the lowest listed entry price, compared with Pipeline CRM's Start tier at 25 dollars per user per month and NetHunt CRM's Basic tier at roughly 24 dollars per user per month billed annually."
    },
    {
      "question": "Which CRM is best for teams that live in Gmail?",
      "answer": "NetHunt CRM, since it installs directly inside Gmail as a sidebar rather than requiring a separate application."
    },
    {
      "question": "Which CRM is best if I want project management bundled in?",
      "answer": "Pipeline CRM, whose Grow tier includes Kanban and Gantt-view project management alongside the sales pipeline, letting teams track post-sale work without a separate tool."
    },
    {
      "question": "Which CRM is best for a solo founder who wants the simplest workflow?",
      "answer": "OnePageCRM, since its Next Action system replaces a traditional pipeline dashboard with a single prioritized follow-up task per contact."
    },
    {
      "question": "Are there any special pricing discounts across these three?",
      "answer": "NetHunt CRM offers a 75 percent discount on its Business plan for startups founded within the previous three years and a 25 percent discount for registered non-profits. No comparable discount programs are documented for OnePageCRM or Pipeline CRM."
    }
  ]
};

export default nethuntCrmVsOnepagecrmVsPipelineCrmContent;
