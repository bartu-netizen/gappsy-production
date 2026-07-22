import type { ToolComparisonContent } from './types';

const icehrmVsPingboardContent: ToolComparisonContent = {
  "verdict": "IceHrm and Pingboard both sit in the HR technology space, but they cover different breadth. IceHrm is a full HR toolkit covering employee management, leave, attendance, payroll, performance reviews, and recruitment, offered as a free self-hosted community edition, a $2,499 one-time IceHrmPro license, or custom-priced IceHrm Cloud. Pingboard, founded in 2013 and now part of Workleap, focuses specifically on dynamic org charts and an employee directory, starting at $149/month for 20 users. One is a broad HR operations suite; the other is a narrower, org-visualization-focused directory tool.",
  "bestForToolA": "IceHrm fits organizations wanting a complete HR toolkit — leave, attendance, payroll reporting, performance reviews, and recruitment — in one system, and that want the flexibility to self-host for free, buy a one-time $2,499 Pro license, or go with managed IceHrm Cloud.",
  "bestForToolB": "Pingboard fits organizations, now within the Workleap ecosystem, that specifically want dynamic, auto-updating org charts and an employee directory with custom profiles, HRIS data sync, and engagement features like its 'Who's Who' game, starting at $149/month for 20 users.",
  "whoNeedsBoth": "A mid-sized company could run IceHrm as its core HR system of record for payroll reports, leave management, and recruitment, while using Pingboard specifically for its stronger org-chart visualization and employee-engagement features like the Who's Who game, syncing employee data from IceHrm into Pingboard via HRIS integration or Excel upload.",
  "keyDifferences": [
    {
      "title": "Scope of HR Functionality",
      "toolA": "IceHrm covers employee management, leave management, time & attendance, payroll & reports, performance reviews, recruitment, and task management — a broad HR toolkit.",
      "toolB": "Pingboard focuses on org charts and an employee directory, with custom profiles, planning org charts for scenario work, and an interactive Who's Who engagement game.",
      "whyItMatters": "A buyer needing payroll reporting or recruitment workflows will not find that functionality in Pingboard, while a buyer only needing org visualization may find IceHrm's broader toolkit unnecessary overhead.",
      "benefitsWho": "HR generalists needing an all-in-one system benefit from IceHrm; teams specifically wanting org-chart visualization and directory tools benefit from Pingboard."
    },
    {
      "title": "Pricing Structure",
      "toolA": "IceHrm offers a free self-hosted open-source community edition, a $2,499 one-time IceHrmPro self-hosted license, and custom-priced IceHrm Cloud.",
      "toolB": "Pingboard's published Basic plan starts at $149/month for 20 users, with an Essential plan at $299/month for 50 users.",
      "whyItMatters": "A one-time license cost behaves very differently in a budget than an ongoing per-month subscription, especially at scale.",
      "benefitsWho": "Budget-conscious or IT-capable organizations wanting to avoid recurring fees benefit from IceHrm's free or one-time-cost options."
    },
    {
      "title": "Deployment Options",
      "toolA": "IceHrm offers a choice of self-hosted (free open-source or $2,499 one-time Pro) or fully managed cloud hosting with a 99.9% uptime SLA, automatic updates, and daily backups.",
      "toolB": "Pingboard's documented facts do not mention a self-hosted option; it operates as a cloud product, now as part of Workleap's suite.",
      "whyItMatters": "Self-hosting options matter for organizations with data-residency requirements or that want to avoid recurring cloud subscription costs.",
      "benefitsWho": "Organizations needing on-premises control benefit from IceHrm's self-hosted options."
    },
    {
      "title": "Company Status and Ecosystem",
      "toolA": "IceHrm is headquartered in Australia and states it is used in 150+ countries, operating as its own product.",
      "toolB": "Pingboard, founded in 2013 in Austin, Texas, was acquired by Workleap and now operates within Workleap's broader employee experience ecosystem, reportedly used by over 70,000 leaders worldwide across that suite.",
      "whyItMatters": "Being part of a larger employee-experience suite can mean access to more integrated tools, but also means pricing and roadmap now reflect the parent company's strategy rather than a standalone vendor.",
      "benefitsWho": "Organizations already using other Workleap products benefit from Pingboard's integration into that broader suite."
    },
    {
      "title": "Employee Engagement Features",
      "toolA": "IceHrm's documented feature set does not include a specific engagement/team-building activity feature.",
      "toolB": "Pingboard includes a 'Who's Who' game, an interactive face-to-name matching activity designed for team engagement.",
      "whyItMatters": "Lightweight engagement features can help distributed or growing teams put names to faces, which is a different goal than administrative HR record-keeping.",
      "benefitsWho": "Distributed teams focused on culture and onboarding benefit from Pingboard's engagement-oriented features."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Operations",
      "rows": [
        {
          "feature": "Employee data management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Leave management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Time & attendance tracking",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Payroll reports",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Performance reviews",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Recruitment / applicant tracking",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        }
      ]
    },
    {
      "group": "Org Visualization & Directory",
      "rows": [
        {
          "feature": "Dynamic auto-updating org charts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Employee directory with custom profiles",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Scenario/planning org charts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Team engagement activity (e.g. Who's Who)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "HRIS data sync / Excel import",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "One-time license option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "IceHrmPro: $2,499 one-time"
        },
        {
          "feature": "Published monthly subscription price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Pingboard Basic: $149/month for 20 users"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does IceHrm's pricing compare to Pingboard's?",
      "answer": "IceHrm offers a free self-hosted community edition, a $2,499 one-time IceHrmPro license, or custom-priced IceHrm Cloud. Pingboard publishes a Basic plan at $149/month for 20 users and an Essential plan at $299/month for 50 users, an ongoing subscription rather than a one-time cost."
    },
    {
      "question": "Does IceHrm include org charts like Pingboard?",
      "answer": "IceHrm's documented feature list does not include a dedicated org-chart tool; it focuses on employee management, leave, attendance, payroll, performance reviews, and recruitment. Pingboard's core product is specifically dynamic, auto-updating org charts and an employee directory."
    },
    {
      "question": "Can Pingboard be self-hosted like IceHrm?",
      "answer": "No. Pingboard's documented facts do not mention a self-hosted option; it operates as a cloud product within the Workleap suite. IceHrm offers a free open-source self-hosted edition in addition to cloud hosting."
    },
    {
      "question": "Is Pingboard still an independent company?",
      "answer": "No. Pingboard was acquired by Workleap and now operates as one of Workleap's employee experience products, though it still operates under the Pingboard name, per its own FAQ."
    },
    {
      "question": "Which tool includes payroll functionality?",
      "answer": "IceHrm includes payroll and reports as part of its documented feature set. Pingboard's documented facts do not mention payroll functionality; it is focused on org charts and employee directories."
    }
  ]
};

export default icehrmVsPingboardContent;
