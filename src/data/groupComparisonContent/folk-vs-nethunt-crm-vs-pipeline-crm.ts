import type { GroupComparisonContent } from './types';

const folkVsNethuntCrmVsPipelineCrmContent: GroupComparisonContent = {
  "verdict": "Folk, NetHunt CRM, and Pipeline CRM all serve small and mid-sized teams that want a lighter alternative to enterprise CRMs, but they emphasize different parts of the sales workflow. NetHunt CRM lives inside Gmail so reps never leave their inbox, and it's the only one of the three with published startup and non-profit discount programs. Pipeline CRM is the most traditional sales-native pipeline tool, distinguished by transparent per-user pricing with no seat minimums and built-in project management for post-sale work. Folk instead leads with spreadsheet-style Tables and folkX, a browser extension for one-click LinkedIn capture and AI enrichment. Teams fully embedded in Gmail should look at NetHunt, teams that want no-minimum, no-onboarding-fee pricing plus post-sale project tracking should consider Pipeline CRM, and teams whose core workflow is relationship capture across LinkedIn and other sources should evaluate Folk.",
  "bestFor": {
    "folk": "Small teams managing relationships across sales, recruiting, or fundraising who want fast LinkedIn contact capture and AI enrichment.",
    "nethunt-crm": "Sales teams, agencies, and recruiters already living in Gmail and Google Workspace who want CRM functionality without switching apps, especially early-stage startups eligible for NetHunt's discount program.",
    "pipeline-crm": "Small and mid-sized B2B sales teams that want transparent per-user pricing, no seat minimums, and built-in project management after the deal closes."
  },
  "highlights": [
    {
      "title": "Lives inside Gmail versus standalone apps",
      "description": "NetHunt CRM installs as a sidebar directly inside Gmail so reps never switch tools, while Folk and Pipeline CRM are both standalone applications.",
      "toolSlugs": [
        "nethunt-crm"
      ]
    },
    {
      "title": "LinkedIn capture on two of the three",
      "description": "Folk's folkX extension and NetHunt's LinkedIn integration both pull contact data from LinkedIn profiles into CRM records; Pipeline CRM does not document a LinkedIn capture tool.",
      "toolSlugs": [
        "folk",
        "nethunt-crm"
      ]
    },
    {
      "title": "No seat minimums, explicitly",
      "description": "Pipeline CRM specifically advertises no seat minimums and no mandatory onboarding fees as a differentiator, a pricing promise that Folk and NetHunt CRM's per-seat tiers don't make as explicitly.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "Project management bundled with Pipeline CRM",
      "description": "Pipeline CRM's Grow tier adds Kanban and Gantt-view project management for tracking post-sale work, which is not part of Folk's or NetHunt's documented feature set.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "Discount programs unique to NetHunt",
      "description": "NetHunt CRM offers a 75 percent discount on its Business plan for startups under three years old and a 25 percent discount for registered non-profits; Folk and Pipeline CRM don't document equivalent programs.",
      "toolSlugs": [
        "nethunt-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Capture and Integration",
      "rows": [
        {
          "feature": "Native Gmail embedding",
          "statuses": {
            "folk": "limited",
            "nethunt-crm": "available",
            "pipeline-crm": "not-documented"
          },
          "note": "Folk syncs with email but does not embed directly inside the Gmail interface."
        },
        {
          "feature": "LinkedIn contact capture",
          "statuses": {
            "folk": "available",
            "nethunt-crm": "available",
            "pipeline-crm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Enrichment and Project Tools",
      "rows": [
        {
          "feature": "AI-powered contact enrichment",
          "statuses": {
            "folk": "available",
            "nethunt-crm": "not-documented",
            "pipeline-crm": "not-documented"
          },
          "note": "Pipeline CRM offers non-AI data enrichment credits as a paid add-on rather than a documented AI feature."
        },
        {
          "feature": "Project management with Kanban and Gantt views",
          "statuses": {
            "folk": "not-documented",
            "nethunt-crm": "not-documented",
            "pipeline-crm": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Trial Terms",
      "rows": [
        {
          "feature": "Transparent pricing with no seat minimums",
          "statuses": {
            "folk": "limited",
            "nethunt-crm": "limited",
            "pipeline-crm": "available"
          },
          "note": "Folk and NetHunt publish per-seat pricing but do not make an explicit no-seat-minimum claim."
        },
        {
          "feature": "Startup or non-profit discount program",
          "statuses": {
            "folk": "not-documented",
            "nethunt-crm": "available",
            "pipeline-crm": "not-documented"
          }
        },
        {
          "feature": "Free trial availability",
          "statuses": {
            "folk": "available",
            "nethunt-crm": "available",
            "pipeline-crm": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these lives inside Gmail?",
      "answer": "NetHunt CRM is built to live inside Gmail as a sidebar, turning email threads and contacts into CRM records. Folk and Pipeline CRM are both standalone applications with their own email integrations."
    },
    {
      "question": "Which has the most transparent, contract-free pricing?",
      "answer": "Pipeline CRM explicitly advertises no seat minimums and no mandatory onboarding fees alongside a published per-user pricing table. Folk and NetHunt CRM also publish clear per-seat tiers but don't make the same no-minimum claim."
    },
    {
      "question": "Do any of these capture contacts from LinkedIn?",
      "answer": "Yes, both Folk, via its folkX browser extension, and NetHunt CRM, via a LinkedIn browser extension, capture LinkedIn profile data into CRM records. Pipeline CRM does not document a LinkedIn capture feature."
    },
    {
      "question": "Which one includes project management tools?",
      "answer": "Pipeline CRM's Grow tier includes project management with Kanban and Gantt views for post-sale work. Folk and NetHunt CRM's documented feature sets do not include project management."
    },
    {
      "question": "Are there discounts for startups or non-profits?",
      "answer": "NetHunt CRM offers a 75 percent discount on its Business plan for startups founded within the last three years and a 25 percent discount for registered non-profits. Folk and Pipeline CRM don't document equivalent discount programs."
    },
    {
      "question": "How does starting price compare?",
      "answer": "Folk starts at $24/member/month billed annually, NetHunt CRM starts around $24/user/month on annual billing, and Pipeline CRM starts at $25/user/month billed annually with published, no-seat-minimum pricing."
    }
  ]
};

export default folkVsNethuntCrmVsPipelineCrmContent;
