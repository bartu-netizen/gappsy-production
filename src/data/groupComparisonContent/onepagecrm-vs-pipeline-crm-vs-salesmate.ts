import type { GroupComparisonContent } from './types';

const onepagecrmVsPipelineCrmVsSalesmateContent: GroupComparisonContent = {
  "verdict": "OnePageCRM, Pipeline CRM, and Salesmate all serve small and mid-sized sales teams but scale in different directions from a similar starting point. OnePageCRM stays deliberately minimal with its Next Action system, Pipeline CRM adds territory routing and project management while keeping transparent per-user pricing, and Salesmate goes furthest toward an all-in-one platform with native calling, texting, and an AI assistant bundled into every paid tier. Budget-conscious solo founders tend to prefer OnePageCRM's simplicity, teams with defined territories or post-sale delivery work lean toward Pipeline CRM, and teams that want built-in phone and SMS without a separate dialer gravitate to Salesmate.",
  "bestFor": {
    "onepagecrm": "Solo founders and small teams who want the simplest possible action-focused CRM without pipeline dashboard clutter",
    "pipeline-crm": "B2B sales teams that want transparent per-user pricing plus territory routing and project management tools",
    "salesmate": "Teams that want native calling, texting, and an AI assistant bundled into the CRM instead of a separate telephony add-on"
  },
  "highlights": [
    {
      "title": "OnePageCRM's Next Action focus",
      "description": "OnePageCRM assigns every contact a single concrete next action in a prioritized stream, a fundamentally different structure from Pipeline CRM's and Salesmate's traditional kanban pipelines.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "Pipeline CRM adds territory and project tools",
      "description": "Map View territory routing and Kanban/Gantt project management on Pipeline CRM's Grow tier extend past pure pipeline tracking into post-sale delivery work, capabilities not documented for OnePageCRM or Salesmate.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "Salesmate bundles native calling and AI",
      "description": "Salesmate includes built-in power dialing, voicemail drop, call transcription, and its Sandy AI assistant directly in paid plans, functionality that OnePageCRM and Pipeline CRM do not document.",
      "toolSlugs": [
        "salesmate"
      ]
    },
    {
      "title": "Entry pricing favors OnePageCRM",
      "description": "OnePageCRM's Professional plan starts at $9.95 per user per month, undercutting both Pipeline CRM's $25 Start tier and Salesmate's $23 Basic tier.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "Support ticketing sets Salesmate apart",
      "description": "Salesmate's Pro tier adds a team inbox and basic support ticketing alongside sales pipeline management, blending light customer service functionality that OnePageCRM and Pipeline CRM do not offer.",
      "toolSlugs": [
        "salesmate"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core pipeline and deal tracking",
      "rows": [
        {
          "feature": "Visual sales pipeline",
          "statuses": {
            "onepagecrm": "available",
            "pipeline-crm": "available",
            "salesmate": "available"
          }
        },
        {
          "feature": "Email tracking and templates",
          "statuses": {
            "onepagecrm": "available",
            "pipeline-crm": "available",
            "salesmate": "available"
          }
        }
      ]
    },
    {
      "group": "Communication tools",
      "rows": [
        {
          "feature": "Native calling and texting (power dialer)",
          "statuses": {
            "onepagecrm": "not-documented",
            "pipeline-crm": "not-documented",
            "salesmate": "available"
          },
          "note": "Salesmate's power dialer and voicemail drop are limited to its Business tier and above."
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "Workflow automation",
          "statuses": {
            "onepagecrm": "available",
            "pipeline-crm": "available",
            "salesmate": "available"
          }
        },
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "onepagecrm": "not-documented",
            "pipeline-crm": "not-documented",
            "salesmate": "available"
          }
        }
      ]
    },
    {
      "group": "Operations and support",
      "rows": [
        {
          "feature": "Territory routing / map view",
          "statuses": {
            "onepagecrm": "not-documented",
            "pipeline-crm": "available",
            "salesmate": "not-documented"
          }
        },
        {
          "feature": "Team inbox and support ticketing",
          "statuses": {
            "onepagecrm": "not-documented",
            "pipeline-crm": "not-documented",
            "salesmate": "available"
          }
        },
        {
          "feature": "Free trial",
          "statuses": {
            "onepagecrm": "available",
            "pipeline-crm": "not-documented",
            "salesmate": "available"
          },
          "note": "OnePageCRM offers 21 days and Salesmate offers 15 days; Pipeline CRM's pricing data does not specify a trial length."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheapest: OnePageCRM, Pipeline CRM, or Salesmate?",
      "answer": "OnePageCRM is the cheapest entry point at $9.95 per user per month, compared to Salesmate's $23 per user per month Basic plan and Pipeline CRM's $25 per user per month Start plan."
    },
    {
      "question": "Which CRM includes built-in calling and texting?",
      "answer": "Salesmate is the only one of the three that natively bundles calling, texting, power dialing, and voicemail drop into its paid plans, avoiding the need for a separate telephony add-on."
    },
    {
      "question": "Does Pipeline CRM include project management?",
      "answer": "Yes, Pipeline CRM's Grow tier adds project management with Kanban and Gantt views alongside its Map View territory routing, features not documented for OnePageCRM or Salesmate."
    },
    {
      "question": "Which tool is simplest for a solo founder or very small team?",
      "answer": "OnePageCRM is built around a single Next Action per contact rather than a full pipeline dashboard, which makes it the fastest of the three to learn according to its documented feature set."
    },
    {
      "question": "Does Salesmate include AI features?",
      "answer": "Yes, Salesmate includes a Sandy AI assistant plus AI agents aimed at automating lead qualification, meeting booking, and workflow triggers, a capability not documented for OnePageCRM or Pipeline CRM."
    }
  ]
};

export default onepagecrmVsPipelineCrmVsSalesmateContent;
