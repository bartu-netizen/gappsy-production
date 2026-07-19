import type { GroupComparisonContent } from './types';

const pipelineCrmVsSalesmateVsTeamgateContent: GroupComparisonContent = {
  "verdict": "Pipeline CRM, Salesmate, and Teamgate are all per-user CRMs aimed at small and mid-sized sales teams that want strong pipeline visibility without an enterprise price tag, but they each lead with a different differentiator. Pipeline CRM leans on transparent, no-seat-minimum pricing and optional project management. Salesmate bundles native calling, texting, and an AI assistant directly into its subscription. Teamgate is the only one of the three with a genuinely free Starter plan for very small teams.",
  "bestFor": {
    "pipeline-crm": "Small to mid-sized B2B sales teams wanting transparent per-user pricing, no seat minimums, and optional built-in project management.",
    "salesmate": "Teams wanting native calling, texting, and AI-assisted automation bundled into one CRM subscription rather than a separate add-on product.",
    "teamgate": "Very small teams of two users or fewer that want to start on a genuinely free plan before committing to paid pricing."
  },
  "highlights": [
    {
      "title": "Teamgate is the only one with a free plan",
      "description": "Teamgate's free Starter plan supports up to 2 users and 500 contacts with basic pipeline tools, while Pipeline CRM and Salesmate both require a paid subscription from day one.",
      "toolSlugs": [
        "teamgate",
        "pipeline-crm",
        "salesmate"
      ]
    },
    {
      "title": "Salesmate bundles calling and texting that the others charge extra for or omit",
      "description": "Salesmate natively includes built-in calling, texting, power dialing, voicemail drop, and call transcription in its paid plans without a separate telephony add-on, a depth of native communication tooling not documented for Pipeline CRM.",
      "toolSlugs": [
        "salesmate"
      ]
    },
    {
      "title": "Pipeline CRM is the most transparent on price",
      "description": "Pipeline CRM explicitly advertises no seat minimums and a flat, publicly published per-user pricing table starting at 25 dollars per user per month, a pricing transparency stance called out specifically in its own positioning against larger CRM suites.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "Salesmate is the only one with a dedicated AI assistant",
      "description": "Salesmate's Sandy AI assistant, plus newer AI agents for lead qualification and meeting booking, are not matched by any documented AI feature in Pipeline CRM or Teamgate.",
      "toolSlugs": [
        "salesmate"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "pipeline-crm": "unavailable",
            "salesmate": "unavailable",
            "teamgate": "available"
          }
        },
        {
          "feature": "No seat minimums with published flat pricing",
          "statuses": {
            "pipeline-crm": "available",
            "salesmate": "not-documented",
            "teamgate": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Communication Tools",
      "rows": [
        {
          "feature": "Native calling or power dialer",
          "statuses": {
            "pipeline-crm": "unavailable",
            "salesmate": "available",
            "teamgate": "available"
          },
          "note": "Salesmate's power dialer and voicemail drop are on its Business tier; Teamgate's in-app calling is on its Team tier."
        },
        {
          "feature": "Built-in SMS or texting",
          "statuses": {
            "pipeline-crm": "unavailable",
            "salesmate": "available",
            "teamgate": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "Dedicated AI assistant or agents",
          "statuses": {
            "pipeline-crm": "not-documented",
            "salesmate": "available",
            "teamgate": "not-documented"
          }
        },
        {
          "feature": "Lead scoring",
          "statuses": {
            "pipeline-crm": "not-documented",
            "salesmate": "not-documented",
            "teamgate": "available"
          },
          "note": "Teamgate's lead scoring is on its Growth tier."
        }
      ]
    },
    {
      "group": "Extras",
      "rows": [
        {
          "feature": "Built-in project management (Kanban/Gantt)",
          "statuses": {
            "pipeline-crm": "available",
            "salesmate": "not-documented",
            "teamgate": "not-documented"
          }
        },
        {
          "feature": "Multi-currency support",
          "statuses": {
            "pipeline-crm": "not-documented",
            "salesmate": "not-documented",
            "teamgate": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Pipeline CRM, Salesmate, and Teamgate has a free plan?",
      "answer": "Teamgate, whose free Starter plan supports up to 2 users and 500 contacts. Pipeline CRM and Salesmate both require a paid subscription, though Salesmate offers a 15-day free trial."
    },
    {
      "question": "Which CRM bundles native calling and texting?",
      "answer": "Salesmate includes built-in calling, texting, power dialing, voicemail drop, and call transcription in its paid plans. Teamgate also includes in-app calling and SMS from its Team tier up. Pipeline CRM does not document native calling as a core feature."
    },
    {
      "question": "Which has the cheapest paid entry plan?",
      "answer": "Salesmate's Basic tier at 23 dollars per user per month is the lowest listed entry price, just under Pipeline CRM's Start tier at 25 dollars per user per month; Teamgate's paid Team plan starts higher at 39.90 dollars per user per month, though its Starter tier is free."
    },
    {
      "question": "Which CRM has a dedicated AI assistant?",
      "answer": "Salesmate, through its Sandy AI assistant and newer AI agents aimed at lead qualification, meeting booking, and workflow triggers."
    },
    {
      "question": "Which is best for teams that want project management included?",
      "answer": "Pipeline CRM, whose Grow tier bundles Kanban and Gantt-view project management alongside the sales pipeline."
    },
    {
      "question": "What are the trial options for each?",
      "answer": "Salesmate offers a 15-day free trial with full feature access. Teamgate offers a genuinely free Starter plan rather than a time-limited trial. Pipeline CRM's specific trial length is not detailed in its published pricing, though a trial period is part of its standard onboarding."
    }
  ]
};

export default pipelineCrmVsSalesmateVsTeamgateContent;
