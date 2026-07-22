import type { ToolComparisonContent } from './types';

const levelelevenVsXactlyIncentContent: ToolComparisonContent = {
  "verdict": "LevelEleven and Xactly Incent both touch sales performance but from very different angles. LevelEleven, now sold as part of the broader Ascent Cloud suite, turns Salesforce data into scorecards, coaching views, and gamified team competitions to drive specific selling behaviors -- it's built natively for Salesforce and available via the Salesforce AppExchange with a free trial. Xactly Incent automates the actual design, calculation, and compliant payout of sales commissions, and was named a Leader in the 2026 Gartner Magic Quadrant for Sales Performance Management. One drives behavior through visibility and recognition; the other calculates and pays what reps are owed.",
  "bestForToolA": "Salesforce-centric sales organizations that want scorecards, manager coaching views, and gamified leaderboard competitions built directly from Salesforce activity and pipeline data -- LevelEleven has an installed base of 1,000+ sales teams and is available via the Salesforce AppExchange.",
  "bestForToolB": "Enterprise revenue teams that need automated commission plan design, complex calculation mechanics (splits, accelerators, clawbacks), and compliance automation for ASC 606 and IFRS 15 with audit trails.",
  "whoNeedsBoth": "A Salesforce-based sales organization could use LevelEleven to run scorecards, coaching, and leaderboard competitions on top of Salesforce activity data, while using Xactly Incent as the system that actually calculates and pays the commissions those same reps earn on the deals they close -- one drives behavior, the other pays for outcomes.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "LevelEleven turns Salesforce data into performance scorecards, manager coaching views, and gamified sales competitions with leaderboards.",
      "toolB": "Xactly Incent automates commission plan design via a Compensation Configurator, then calculates payouts including splits, accelerators, and clawbacks.",
      "whyItMatters": "LevelEleven is a visibility and motivation layer on top of CRM data; Xactly is the system of record for calculating and paying compensation.",
      "benefitsWho": "Sales managers wanting daily performance visibility and team competitions (LevelEleven) versus finance and sales ops teams responsible for accurate commission payouts (Xactly)."
    },
    {
      "title": "CRM Dependency",
      "toolA": "LevelEleven is built to work primarily with Salesforce CRM data and is distributed on the Salesforce AppExchange.",
      "toolB": "Xactly Incent connects to CRM, ERP, and HCM systems including Salesforce, ServiceNow, and NetSuite, without being exclusive to any one CRM.",
      "whyItMatters": "Non-Salesforce shops get less value from LevelEleven's Salesforce-native design, while Xactly's broader system connections work across a wider range of tech stacks.",
      "benefitsWho": "Salesforce-only organizations (LevelEleven) versus organizations running mixed CRM/ERP/HCM environments (Xactly)."
    },
    {
      "title": "Gamification vs. Compensation Accuracy",
      "toolA": "LevelEleven runs leaderboards and recognition-based competitions specifically designed to drive selling behaviors.",
      "toolB": "Xactly Incent does not document gamification features; instead it reports 99.6% commission forecasting accuracy and 99.8% on-time payment accuracy.",
      "whyItMatters": "LevelEleven optimizes for engagement and behavior change, while Xactly optimizes for calculation accuracy and payout reliability -- different KPIs entirely.",
      "benefitsWho": "Sales enablement leaders focused on rep engagement (LevelEleven) versus finance leaders focused on payout accuracy (Xactly)."
    },
    {
      "title": "AI and Compliance Automation",
      "toolA": "LevelEleven does not document AI features or compliance automation.",
      "toolB": "Xactly Incent includes AI anomaly detection to flag unusual payouts before processing, plus compliance automation for ASC 606 and IFRS 15 with audit trails.",
      "whyItMatters": "Organizations with regulatory or audit requirements around commission expense need Xactly's documented compliance tooling, which LevelEleven doesn't offer.",
      "benefitsWho": "Finance and compliance teams needing auditable commission processes."
    },
    {
      "title": "Free Trial and Product Status",
      "toolA": "LevelEleven is available as a free trial through the Salesforce AppExchange, though it is now sold as part of the broader Ascent Cloud suite alongside Territory Planner and Geopointe.",
      "toolB": "Xactly Incent does not document a free trial; it is recognized as a 2026 Gartner Magic Quadrant Leader and won the TrustRadius Buyer's Choice Award 2026.",
      "whyItMatters": "LevelEleven offers a lower-friction way to test the product via AppExchange, while Xactly's positioning as an established, analyst-recognized enterprise platform points to a sales-led evaluation process.",
      "benefitsWho": "Teams wanting to self-evaluate quickly (LevelEleven) versus enterprises comfortable with a formal vendor evaluation (Xactly)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Performance Visibility & Coaching",
      "rows": [
        {
          "feature": "Performance scorecards / goal tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Manager coaching views",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Gamified competitions / leaderboards",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Real-time rep earnings dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Compensation & Compliance",
      "rows": [
        {
          "feature": "Commission calculation (splits, accelerators, clawbacks)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Compensation plan configurator",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Compliance automation (ASC 606 / IFRS 15) with audit trail",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI anomaly detection on payouts",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & Access",
      "rows": [
        {
          "feature": "Native Salesforce integration",
          "toolA": "available",
          "toolB": "available",
          "note": "LevelEleven: AppExchange-native and Salesforce-primary; Xactly: one of several listed integrations"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LevelEleven: via Salesforce AppExchange"
        },
        {
          "feature": "Native mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Xactly: iOS and Android"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a custom quote"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do LevelEleven and Xactly Incent do the same thing?",
      "answer": "No. LevelEleven turns Salesforce activity into scorecards, coaching views, and gamified competitions to drive behavior. Xactly Incent calculates and pays the actual sales commissions reps earn. They address different parts of sales performance management."
    },
    {
      "question": "Is LevelEleven only for Salesforce users?",
      "answer": "LevelEleven is built to work primarily with Salesforce CRM data and is distributed via the Salesforce AppExchange, which limits its value for teams not using Salesforce."
    },
    {
      "question": "Which tool offers a free trial?",
      "answer": "LevelEleven is available as a free trial through the Salesforce AppExchange. A free trial is not documented for Xactly Incent."
    },
    {
      "question": "Does LevelEleven calculate sales commissions?",
      "answer": "No, commission calculation, splits, accelerators, and clawbacks are not documented as LevelEleven features. That is Xactly Incent's core function."
    },
    {
      "question": "Is LevelEleven still sold as a standalone product?",
      "answer": "It is marketed under the LevelEleven name but is now offered as one of the products within the broader Ascent Cloud suite, alongside Territory Planner and Geopointe."
    },
    {
      "question": "Does Xactly Incent include gamification like leaderboards?",
      "answer": "No, gamification and leaderboard competitions are not documented as Xactly Incent features. That is a core LevelEleven capability instead."
    }
  ]
};

export default levelelevenVsXactlyIncentContent;
