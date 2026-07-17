import type { ToolComparisonContent } from './types';

const orangehrmVsSiftOrgChartContent: ToolComparisonContent = {
  "verdict": "OrangeHRM is a full HR management system spanning the employee lifecycle — recruitment, onboarding, leave, time & attendance, and performance — available as a free open-source Starter edition or a modular paid Advanced tier. Sift Org Chart is a narrower organizational-visibility platform focused specifically on automated org charts, employee directories, and people search, starting at $150/month with a 20-user minimum. One is a system of record for HR processes; the other is a visualization and directory layer that typically sits on top of HR data.",
  "bestForToolA": "Organizations that need a complete HR system covering recruitment, onboarding, leave management, time & attendance, and performance reviews, and want the option of a free, self-hosted, open-source Starter edition.",
  "bestForToolB": "Organizations of 20+ employees that specifically want real-time, automated org charts with dotted-line relationships and open roles, plus a searchable employee directory with rich profiles (skills, languages, work experience).",
  "whoNeedsBoth": "A company could run OrangeHRM as its core HR system of record for leave, recruitment, and performance data, while layering Sift Org Chart on top for a real-time, visual org chart and an employee directory/people-search experience — a use case OrangeHRM's feature list doesn't specifically address.",
  "keyDifferences": [
    {
      "title": "Product Scope",
      "toolA": "OrangeHRM covers the full employee lifecycle: Employee Management, Recruitment & Applicant Tracking, Onboarding, Leave Management, Time & Attendance Tracking, and Performance Management.",
      "toolB": "Sift Org Chart is focused narrowly on organizational visibility: automated org charts, employee profiles, search/directory, and analytics — it does not document payroll, leave, or recruitment modules.",
      "whyItMatters": "Buyers looking for a single system to run HR processes need OrangeHRM's breadth; buyers who already have an HR system but lack visualization need Sift's narrower focus.",
      "benefitsWho": "HR teams needing an all-in-one system benefit from OrangeHRM; teams needing a dedicated directory/org-chart layer benefit from Sift."
    },
    {
      "title": "Pricing & Free Access",
      "toolA": "OrangeHRM offers a completely free, open-source Starter edition with core HR functionality, plus a custom-quoted modular Advanced tier with a 30-day free trial.",
      "toolB": "Sift has no free plan — only a 14-day free trial — with paid plans starting at $150/month (Org Chart) and a minimum of 20 users required on the base plan.",
      "whyItMatters": "A free, no-user-minimum tier removes cost as a barrier for small or budget-constrained teams.",
      "benefitsWho": "Small teams and budget-conscious organizations benefit from OrangeHRM's free Starter edition."
    },
    {
      "title": "Deployment Options",
      "toolA": "OrangeHRM supports both cloud-hosted and on-premise/self-hosted deployment.",
      "toolB": "Sift is offered only as a hosted SaaS platform, with no self-hosting option documented.",
      "whyItMatters": "Self-hosting matters for organizations with strict data-residency or compliance requirements.",
      "benefitsWho": "Organizations requiring on-premise data control benefit from OrangeHRM's self-hosting option."
    },
    {
      "title": "Org Chart & Directory Depth",
      "toolA": "OrangeHRM does not list a dedicated org-chart or people-search feature among its modules.",
      "toolB": "Sift's Directory plan includes 13 prebuilt organizational analytics reports, real-time automated org charts with dotted-line relationships and open roles, and rich, searchable employee profiles (skills, pronouns, languages, work experience).",
      "whyItMatters": "Purpose-built org-chart tools generally offer richer visualization and directory search than a general HR system's reporting module.",
      "benefitsWho": "Larger organizations wanting a polished, searchable people directory benefit from Sift's dedicated feature set."
    },
    {
      "title": "Minimum Commitment",
      "toolA": "OrangeHRM's free Starter edition has no documented user minimum, since it's self-hosted open-source software.",
      "toolB": "Sift requires a minimum of 20 users on its base plan, plus additional per-user fees ($1.50-$3.25/user depending on the plan).",
      "whyItMatters": "A user minimum can make a tool cost-prohibitive or simply unavailable for very small teams.",
      "benefitsWho": "Very small teams or solo HR admins benefit from OrangeHRM's lack of a minimum-user requirement."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Functionality",
      "rows": [
        {
          "feature": "Recruitment & applicant tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Leave management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Time & attendance tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Performance management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Onboarding workflows",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Org Visibility & Directory",
      "rows": [
        {
          "feature": "Automated real-time org charts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Includes dotted-line relationships and open roles"
        },
        {
          "feature": "Employee directory / people search",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Rich employee profiles (skills, languages, pronouns)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Prebuilt analytics reports",
          "toolA": "available",
          "toolB": "available",
          "note": "Sift: 13 reports on Directory plan; OrangeHRM: general reporting module"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OrangeHRM Starter (Open Source)"
        },
        {
          "feature": "Self-hosting option",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sift Directory plan and above"
        },
        {
          "feature": "Minimum required users",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Sift requires a 20-user minimum on its base plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is OrangeHRM or Sift free?",
      "answer": "OrangeHRM offers a free, open-source Starter edition. Sift has no free plan, only a 14-day free trial, with paid plans starting at $150/month."
    },
    {
      "question": "Which handles payroll, leave, and recruitment?",
      "answer": "OrangeHRM covers Leave Management, Recruitment & Applicant Tracking, and Time & Attendance Tracking. Sift's feature set — org charts, directories, and people search — doesn't document those HR-process modules."
    },
    {
      "question": "Which is better for visualizing the reporting structure?",
      "answer": "Sift Org Chart specializes in automated, real-time org charts with dotted-line relationships and open roles. OrangeHRM does not list a dedicated org-chart feature among its modules."
    },
    {
      "question": "Is there a minimum team size for either?",
      "answer": "Sift requires a minimum of 20 users on its base plan. OrangeHRM's free Starter edition has no documented minimum."
    },
    {
      "question": "Can either be self-hosted?",
      "answer": "OrangeHRM supports on-premise deployment alongside cloud hosting. Sift is offered only as a hosted platform."
    },
    {
      "question": "Which has developer API access?",
      "answer": "Sift includes API access on its Directory plan and above. OrangeHRM does not document API access among its listed features."
    }
  ]
};

export default orangehrmVsSiftOrgChartContent;
