import type { GroupComparisonContent } from './types';

const apptivoVsCopperVsFreshsalesContent: GroupComparisonContent = {
  "verdict": "These three CRMs target different buying priorities. Apptivo is the broadest and cheapest entry point, bundling help desk, field service, and campaigns alongside CRM. Copper is narrowly optimized for teams that already run their business inside Gmail and Google Workspace, automatically capturing email and calendar activity with minimal manual entry, but it costs more to start and has no free plan. Freshsales sits between the two, adding built-in phone and Freddy AI lead scoring at a lower entry price than Copper while staying more focused than Apptivo's full business suite.",
  "bestFor": {
    "apptivo": "SMBs wanting one platform for CRM, help desk, field service, and marketing campaigns at a low starting cost.",
    "copper": "Teams that already run their business inside Gmail, Calendar, and Google Workspace and want a CRM that captures activity automatically with minimal manual entry.",
    "freshsales": "Sales teams that want built-in phone and email plus AI-driven lead scoring and forecasting through Freddy AI, especially if already using Freshdesk or Freshservice."
  },
  "highlights": [
    {
      "title": "Copper is the only one built specifically around native Gmail and Calendar auto-capture",
      "description": "Copper's core differentiator is automatically logging Gmail, Calendar, and Drive activity against CRM records without manual entry, a workflow neither Apptivo nor Freshsales documents.",
      "toolSlugs": [
        "copper"
      ]
    },
    {
      "title": "Apptivo is the only CRM here that bundles a broader business suite",
      "description": "Apptivo bundles help desk, field service, and campaign management alongside the CRM, positioning it as a wider business platform rather than a pure sales CRM.",
      "toolSlugs": [
        "apptivo"
      ]
    },
    {
      "title": "Freshsales is the only tool with documented AI lead scoring",
      "description": "Freshsales' Freddy AI, available on its Pro tier and above, gives it an edge for teams that want predictive lead prioritization out of the box; the provided data does not describe an equivalent feature for Apptivo or Copper.",
      "toolSlugs": [
        "freshsales"
      ]
    },
    {
      "title": "Copper has no free plan and the highest entry price of the three",
      "description": "Copper's Basic tier starts at $23/user/month with no permanent free option, while Freshsales starts free and Apptivo's Lite plan starts around $15/user/month, reflecting Copper's focus on mid-market Google Workspace teams rather than budget-conscious startups.",
      "toolSlugs": [
        "copper",
        "freshsales",
        "apptivo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM Fit",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "apptivo": "available",
            "copper": "unavailable",
            "freshsales": "available"
          },
          "note": "Copper offers only a 14-day free trial, not a permanent free plan."
        },
        {
          "feature": "Native Gmail / Google Workspace auto-capture",
          "statuses": {
            "apptivo": "not-documented",
            "copper": "available",
            "freshsales": "not-documented"
          },
          "note": "Copper's core differentiator is automatically logging Gmail, Calendar, and Drive activity against CRM records; the provided data does not document equivalent native Gmail auto-capture for Apptivo or Freshsales."
        }
      ]
    },
    {
      "group": "Beyond Sales CRM",
      "rows": [
        {
          "feature": "Bundled help desk, field service, or marketing modules",
          "statuses": {
            "apptivo": "available",
            "copper": "unavailable",
            "freshsales": "unavailable"
          }
        },
        {
          "feature": "AI-powered lead scoring",
          "statuses": {
            "apptivo": "not-documented",
            "copper": "not-documented",
            "freshsales": "available"
          },
          "note": "Freshsales' Freddy AI lead scoring is available on its Pro tier and above."
        }
      ]
    },
    {
      "group": "Customization and Communication",
      "rows": [
        {
          "feature": "No-code custom apps or modules",
          "statuses": {
            "apptivo": "available",
            "copper": "not-documented",
            "freshsales": "limited"
          },
          "note": "Freshsales' custom modules require its Enterprise tier."
        },
        {
          "feature": "Built-in phone / calling",
          "statuses": {
            "apptivo": "not-documented",
            "copper": "not-documented",
            "freshsales": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which CRM is built specifically for Google Workspace users?",
      "answer": "Copper, which natively captures Gmail, Calendar, and Drive activity and is listed as a recommended CRM in the Google Workspace Marketplace."
    },
    {
      "question": "Which of the three has a permanent free plan?",
      "answer": "Apptivo and Freshsales both offer free tiers. Copper does not, offering only a 14-day trial."
    },
    {
      "question": "Which is the cheapest entry-level paid plan?",
      "answer": "Freshsales' Growth plan starts at $9/user/month and Apptivo's Lite plan is roughly $15/user/month, both well below Copper's $23/user/month Basic plan."
    },
    {
      "question": "Does any of these include a broader business suite beyond sales?",
      "answer": "Only Apptivo bundles help desk, field service, and campaign modules alongside its CRM. Copper and Freshsales are more narrowly focused on sales, with Freshsales' marketing capability sold separately as Freshmarketer."
    },
    {
      "question": "Which CRM includes AI-powered lead scoring?",
      "answer": "Freshsales, through its Freddy AI feature available on the Pro tier and above. The provided data does not document an equivalent AI scoring feature for Apptivo or Copper."
    }
  ]
};

export default apptivoVsCopperVsFreshsalesContent;
