import type { GroupComparisonContent } from './types';

const kommoVsNethuntCrmVsPipelineCrmContent: GroupComparisonContent = {
  "verdict": "Kommo, NetHunt CRM, and Pipeline CRM overlap as sales-pipeline tools for small and mid-sized B2B teams but come from three different philosophies: Kommo leads with messaging-app-native sales and AI agents, NetHunt lives inside Gmail, and Pipeline CRM leans on transparent, no-seat-minimum pricing and sales-native simplicity without marketing or service bloat. Pipeline CRM is the most straightforward pick for teams that want published pricing and no onboarding fees, NetHunt suits Google Workspace shops, and Kommo is the strongest option for chat-driven sales despite its six-month minimum commitment. None of the three tries to be a full marketing suite, which keeps the comparison focused on pipeline and communication fit rather than platform breadth.",
  "bestFor": {
    "kommo": "Sales teams whose deals close primarily through WhatsApp, Instagram, or other messaging channels",
    "nethunt-crm": "Teams standardized on Google Workspace who want CRM functionality inside Gmail rather than a separate app",
    "pipeline-crm": "B2B sales teams that want transparent, published per-user pricing with no seat minimums or onboarding fees"
  },
  "highlights": [
    {
      "title": "Kommo's messaging-first architecture",
      "description": "Kommo unifies WhatsApp, Instagram, Telegram, and Facebook Messenger into one inbox tied to the pipeline, with a no-code Salesbot for automated chat flows that neither NetHunt nor Pipeline CRM offers.",
      "toolSlugs": [
        "kommo"
      ]
    },
    {
      "title": "NetHunt CRM removes app-switching for Gmail teams",
      "description": "By operating as a Gmail sidebar, NetHunt lets reps manage pipelines and deals from inside their existing inbox rather than adopting a separate CRM interface.",
      "toolSlugs": [
        "nethunt-crm"
      ]
    },
    {
      "title": "Pipeline CRM is built on pricing transparency",
      "description": "Pipeline CRM publishes a flat per-user pricing table with no seat minimums and no mandatory onboarding fees, a contrast to Kommo's six-month commitment and NetHunt's steeper per-user cost.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "Territory and project tools set Pipeline CRM apart",
      "description": "Pipeline CRM's Map View territory routing and built-in Kanban and Gantt project management give it operational features that go beyond a typical pipeline tool, features not documented for Kommo or NetHunt.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "AI depth favors Kommo",
      "description": "Kommo's AI Agent feature drafts replies and can operate semi-autonomously across up to 50 agents on its Pro tier, a generative AI capability not documented for NetHunt CRM or Pipeline CRM.",
      "toolSlugs": [
        "kommo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core pipeline and deal tracking",
      "rows": [
        {
          "feature": "Customizable visual sales pipeline",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "pipeline-crm": "available"
          }
        },
        {
          "feature": "Native email integration",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "pipeline-crm": "available"
          },
          "note": "NetHunt is built directly inside Gmail; Kommo and Pipeline CRM track email as one channel among several."
        }
      ]
    },
    {
      "group": "Messaging and channels",
      "rows": [
        {
          "feature": "Native WhatsApp and Instagram messaging",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "not-documented",
            "pipeline-crm": "not-documented"
          }
        },
        {
          "feature": "LinkedIn integration",
          "statuses": {
            "kommo": "not-documented",
            "nethunt-crm": "available",
            "pipeline-crm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Automation, AI, and operations",
      "rows": [
        {
          "feature": "No-code workflow automation",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "pipeline-crm": "available"
          }
        },
        {
          "feature": "Generative AI assistant",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "not-documented",
            "pipeline-crm": "not-documented"
          }
        },
        {
          "feature": "Project management (Kanban or Gantt) for post-sale work",
          "statuses": {
            "kommo": "not-documented",
            "nethunt-crm": "not-documented",
            "pipeline-crm": "available"
          }
        }
      ]
    },
    {
      "group": "Access and trial",
      "rows": [
        {
          "feature": "Free trial",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "pipeline-crm": "available"
          },
          "note": "Kommo and NetHunt offer 14 days; Pipeline CRM's trial length is not specified beyond its published pricing tiers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Kommo, NetHunt CRM, and Pipeline CRM has the most transparent pricing?",
      "answer": "Pipeline CRM publishes a flat per-user pricing table with no seat minimums and no mandatory onboarding fees, which is more transparent than Kommo's six-month-commitment tiers or NetHunt's per-user pricing that scales sharply across four plans."
    },
    {
      "question": "Which CRM is best suited to WhatsApp and Instagram-driven sales?",
      "answer": "Kommo is purpose-built for messaging-app sales, with native WhatsApp and Instagram inboxes and a no-code Salesbot for chat automation that neither NetHunt CRM nor Pipeline CRM offers."
    },
    {
      "question": "Does Pipeline CRM include project management tools?",
      "answer": "Yes, Pipeline CRM's Grow tier includes project management with Kanban and Gantt views for tracking post-sale implementation work, a feature not documented for Kommo or NetHunt CRM."
    },
    {
      "question": "Is NetHunt CRM only useful for Gmail users?",
      "answer": "NetHunt CRM's core value proposition is operating directly inside Gmail and Google Workspace, so it is best suited to teams already standardized on Google's email ecosystem rather than Outlook-first organizations."
    },
    {
      "question": "Which tool requires the longest commitment?",
      "answer": "Kommo requires a minimum six-month commitment on every paid plan, while NetHunt CRM and Pipeline CRM both offer monthly or annual billing without that requirement."
    }
  ]
};

export default kommoVsNethuntCrmVsPipelineCrmContent;
