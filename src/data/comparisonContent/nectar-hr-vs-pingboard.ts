import type { ToolComparisonContent } from './types';

const nectarHrVsPingboardContent: ToolComparisonContent = {
  "verdict": "Nectar HR is a culture platform focused on peer recognition, a redeemable rewards catalog, and employee listening (surveys, eNPS), bundled with internal communications, while Pingboard is a dynamic org chart and employee directory tool now part of Workleap's suite. They address different HR needs, structure versus sentiment, and could plausibly be used side by side rather than as substitutes.",
  "bestForToolA": "Organizations wanting peer-to-peer recognition tied to a redeemable rewards catalog plus employee listening via custom surveys and eNPS tracking, bundled as the Culture Suite; the company cites customers like Coca-Cola and Major League Baseball.",
  "bestForToolB": "Companies that need a visually dynamic, auto-updating org chart and searchable employee directory built from HRIS sync or Excel import, for teams up to 20 users on the $149/month Basic plan or 50 users on the $299/month Essential plan.",
  "whoNeedsBoth": "A mid-size company could use Pingboard so new hires and cross-functional teams can see how the org is structured, while running Nectar's recognition programs and engagement surveys to measure and reward culture; the two cover structure and sentiment rather than overlapping functions.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Nectar centers on recognition and rewards, internal comms, and employee listening surveys.",
      "toolB": "Pingboard centers on dynamic org charts and an employee directory.",
      "whyItMatters": "This determines whether you're solving for engagement and culture or for organizational visibility.",
      "benefitsWho": "HR/People teams building recognition programs need Nectar; teams onboarding new hires and mapping reporting lines need Pingboard."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Nectar is fully custom, with every offering (Recognize, Engage, Comms, Culture Suite) requiring a sales conversation.",
      "toolB": "Pingboard publishes starting prices: $149/month for 20 users on Basic and $299/month for 50 users on Essential.",
      "whyItMatters": "Published pricing lets buyers budget without a sales call.",
      "benefitsWho": "Smaller companies wanting self-serve pricing clarity benefit from Pingboard's published rates."
    },
    {
      "title": "Rewards & Recognition",
      "toolA": "Nectar includes a redeemable rewards catalog, gamified challenges and milestones, and nomination programs tied to company values.",
      "toolB": "Pingboard does not document any recognition or rewards feature.",
      "whyItMatters": "Only one of the two platforms is built to incentivize and reward behavior rather than just visualize structure.",
      "benefitsWho": "Teams building formal recognition or rewards programs need Nectar."
    },
    {
      "title": "Employee Listening",
      "toolA": "Nectar Engage includes custom employee surveys and eNPS tracking.",
      "toolB": "No survey or listening capability is documented for Pingboard.",
      "whyItMatters": "Measuring engagement sentiment quantitatively requires a dedicated listening tool.",
      "benefitsWho": "HR leaders tracking engagement trends over time need Nectar's survey and eNPS features."
    },
    {
      "title": "Data Import & Org Visualization",
      "toolA": "No org chart or structure visualization feature is documented for Nectar.",
      "toolB": "Pingboard offers dynamic, auto-updating org charts, HRIS sync or Excel upload, and private planning charts for scenario planning.",
      "whyItMatters": "Visualizing reporting lines and headcount planning requires a purpose-built org chart tool.",
      "benefitsWho": "Ops and HR teams managing reorgs or headcount planning need Pingboard's charting features."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recognition & Rewards",
      "rows": [
        {
          "feature": "Peer-to-peer recognition",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Rewards redemption catalog",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Gamified challenges & milestones",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Structured nomination programs",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Organizational Visibility",
      "rows": [
        {
          "feature": "Dynamic, auto-updating org charts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Employee directory with profiles",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "HRIS data sync or Excel import",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Private scenario/planning org charts",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Communication, Listening & Access",
      "rows": [
        {
          "feature": "Internal announcements & comms tracking",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Via Nectar Comms"
        },
        {
          "feature": "Custom employee surveys",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "eNPS tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$149/month Basic, 20 users"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Nectar HR publish pricing?",
      "answer": "No, pricing for Nectar Recognize, Engage, Comms, and the Culture Suite bundle is all custom and requires requesting a demo."
    },
    {
      "question": "Is Pingboard still an independent company?",
      "answer": "No, Pingboard is now part of Workleap and operates as one of its employee experience products, still under the Pingboard name."
    },
    {
      "question": "Can Pingboard handle employee recognition?",
      "answer": "Not documented. Pingboard's public feature list covers org charts, employee directories, and HRIS sync, with no recognition or rewards features described."
    },
    {
      "question": "Does Nectar have an org chart tool?",
      "answer": "Not documented. Nectar's public feature list covers recognition, rewards, comms, and listening surveys, but no org chart or directory feature."
    },
    {
      "question": "How does Pingboard import employee data?",
      "answer": "Via automated HRIS integrations or manual Excel upload."
    },
    {
      "question": "What is Nectar's Culture Suite?",
      "answer": "A bundle combining Nectar Recognize, Nectar Engage, and Nectar Comms into one offering, marketed as the platform's best-value option; pricing is custom."
    }
  ]
};

export default nectarHrVsPingboardContent;
