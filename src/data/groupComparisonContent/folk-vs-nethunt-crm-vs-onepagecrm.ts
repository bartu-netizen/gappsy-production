import type { GroupComparisonContent } from './types';

const folkVsNethuntCrmVsOnepagecrmContent: GroupComparisonContent = {
  "verdict": "Folk, NetHunt CRM, and OnePageCRM all serve small teams that find traditional enterprise CRMs too heavy, but each has a distinct organizing idea. NetHunt CRM lives directly inside Gmail as a sidebar, turning existing email threads into CRM records without ever leaving the inbox. OnePageCRM is built around a 'Next Action' methodology that forces every contact to have one clear follow-up task, aimed at eliminating the cluttered dashboards of larger CRMs, and it's also the cheapest of the three at $9.95/user/month. Folk takes a third approach, using spreadsheet-style Tables plus a folkX browser extension for one-click LinkedIn capture and AI enrichment. Teams fully embedded in Google Workspace should lean toward NetHunt, solo founders who want a disciplined daily action queue should consider OnePageCRM, and teams that want flexible, AI-enriched relationship tracking across LinkedIn and other sources should look at Folk.",
  "bestFor": {
    "folk": "Small teams managing relationships across sales, recruiting, or fundraising who want fast LinkedIn contact capture and AI enrichment.",
    "nethunt-crm": "Sales teams, agencies, and recruiters already living in Gmail and Google Workspace who want CRM functionality without switching apps.",
    "onepagecrm": "Solo founders and small businesses who want a low-cost, action-focused CRM that assigns one clear next step to every contact instead of a complex dashboard."
  },
  "highlights": [
    {
      "title": "Lives inside Gmail versus a dedicated app",
      "description": "NetHunt CRM installs as a sidebar directly inside Gmail so reps never switch tools, while Folk and OnePageCRM are both standalone applications with their own email sync.",
      "toolSlugs": [
        "nethunt-crm"
      ]
    },
    {
      "title": "A genuinely different workflow philosophy",
      "description": "OnePageCRM's Next Action system assigns every contact one concrete follow-up task in a prioritized stream instead of a traditional pipeline dashboard, a Getting Things Done-inspired approach that neither Folk's Table-based model nor NetHunt's Gmail-embedded pipeline replicates.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "LinkedIn capture on two of the three",
      "description": "Folk's folkX extension and NetHunt's LinkedIn integration both pull contact data from LinkedIn profiles into CRM records; OnePageCRM does not document a LinkedIn capture tool.",
      "toolSlugs": [
        "folk",
        "nethunt-crm"
      ]
    },
    {
      "title": "OnePageCRM is the budget option",
      "description": "OnePageCRM's Professional plan starts at $9.95/user/month, well below Folk's $24/member/month and NetHunt's roughly $24/user/month annual starting prices, making it the most affordable entry point of the three.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "Startup and non-profit discounts only at NetHunt",
      "description": "NetHunt CRM offers a 75 percent discount on its Business plan for startups under three years old and a 25 percent discount for registered non-profits; Folk and OnePageCRM don't document equivalent discount programs.",
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
            "onepagecrm": "not-documented"
          },
          "note": "Folk syncs with email but does not embed directly inside the Gmail interface."
        },
        {
          "feature": "LinkedIn contact capture",
          "statuses": {
            "folk": "available",
            "nethunt-crm": "available",
            "onepagecrm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Workflow and Data Model",
      "rows": [
        {
          "feature": "Structured next-action workflow",
          "statuses": {
            "folk": "not-documented",
            "nethunt-crm": "not-documented",
            "onepagecrm": "available"
          }
        },
        {
          "feature": "Custom objects or fields beyond the default pipeline",
          "statuses": {
            "folk": "available",
            "nethunt-crm": "limited",
            "onepagecrm": "limited"
          },
          "note": "Folk's custom objects require its Premium tier; NetHunt and OnePageCRM offer custom fields but not full custom objects."
        }
      ]
    },
    {
      "group": "Trial and Discounts",
      "rows": [
        {
          "feature": "Free trial availability",
          "statuses": {
            "folk": "available",
            "nethunt-crm": "available",
            "onepagecrm": "available"
          }
        },
        {
          "feature": "Startup or non-profit discount program",
          "statuses": {
            "folk": "not-documented",
            "nethunt-crm": "available",
            "onepagecrm": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these lives inside Gmail?",
      "answer": "NetHunt CRM is built specifically to live inside Gmail as a sidebar, turning email threads and contacts into CRM records. Folk and OnePageCRM are both standalone applications with their own email sync rather than embedding into Gmail's interface."
    },
    {
      "question": "What is OnePageCRM's Next Action system?",
      "answer": "It's a workflow where every contact is assigned a single, concrete next action that surfaces in a prioritized action stream, rather than a traditional pipeline dashboard. It's designed to reduce decision paralysis and is OnePageCRM's core differentiator versus Folk and NetHunt."
    },
    {
      "question": "Which is the cheapest option?",
      "answer": "OnePageCRM is the most affordable, starting at $9.95/user/month for its Professional plan. Folk starts at $24/member/month billed annually, and NetHunt CRM starts around $24/user/month on annual billing."
    },
    {
      "question": "Do any of these capture contacts from LinkedIn?",
      "answer": "Yes, both Folk, via its folkX browser extension, and NetHunt CRM, via a LinkedIn browser extension, can capture LinkedIn profile data into CRM records. OnePageCRM does not document a LinkedIn capture feature."
    },
    {
      "question": "Are there discounts for startups or non-profits?",
      "answer": "NetHunt CRM offers a 75 percent discount on its Business plan for startups founded within the last three years and a 25 percent discount for registered non-profits, arranged by contacting sales. Folk and OnePageCRM don't document equivalent discount programs."
    },
    {
      "question": "Do all three offer a free trial?",
      "answer": "Yes. Folk offers a 14-day trial, NetHunt CRM offers a 14-day trial with no restriction on invited users, and OnePageCRM offers a 21-day trial. None of the three has a permanent free plan."
    }
  ]
};

export default folkVsNethuntCrmVsOnepagecrmContent;
