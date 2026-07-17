import type { ToolComparisonContent } from './types';

const horillaVsMinthcmContent: ToolComparisonContent = {
  "verdict": "Horilla is an open-source HRMS offering nine bundled modules — including Payroll, Asset tracking, and a Helpdesk — free to self-host under LGPL-2.1, with an optional managed Cloud plan at $7/user/month. MintHCM is also free and open source (AGPLv3) but is self-hosted only, with no managed cloud option, and its documented modules focus on recruitment, onboarding, performance, and time/leave/travel/expense management rather than payroll. Both are free HR platforms for teams comfortable self-hosting, but they differ in module breadth, community scale, and whether a paid managed option exists.",
  "bestForToolA": "Teams that want a free, self-hosted HRMS with payroll and asset tracking bundled in, or that want the option to switch to a managed $7/user/month Cloud plan with a 30-day free trial instead of self-hosting.",
  "bestForToolB": "Teams that specifically need an Open API for integrating HR data with enterprise systems like SAP or Workday, and that are comfortable relying on community-forum support and paid implementation partners rather than a packaged managed cloud offering.",
  "whoNeedsBoth": "There's no realistic scenario for running both — they overlap directly as core HRMS systems of record for the same employee data, so a team would evaluate the two and select one rather than operate them in parallel.",
  "keyDifferences": [
    {
      "title": "Managed Cloud Option",
      "toolA": "Horilla offers both a free self-hosted edition and a paid managed Cloud plan at $7/user/month, with the first 30 days free.",
      "toolB": "MintHCM is free and open-source only — its own FAQ states 'the only ongoing cost is your own server/hosting,' with no official managed cloud plan.",
      "whyItMatters": "A managed cloud option removes the burden of server maintenance for teams that don't want to self-host.",
      "benefitsWho": "Teams without in-house infrastructure staff benefit from Horilla's optional managed Cloud plan."
    },
    {
      "title": "Module Breadth",
      "toolA": "Horilla bundles nine HR modules together, including Payroll, Asset tracking, and a Helpdesk/ticketing module.",
      "toolB": "MintHCM's documented modules span recruitment, onboarding/offboarding, performance evaluation, and time/leave/travel/expense management, but payroll and asset tracking are not listed among its features.",
      "whyItMatters": "Payroll is a core HR function for most organizations, so its absence from MintHCM's documented feature list is a meaningful gap.",
      "benefitsWho": "Organizations needing payroll processing built into their HRMS benefit from Horilla's bundled module set."
    },
    {
      "title": "Community Scale",
      "toolA": "Horilla cites 820+ GitHub forks and over 11,000 deployed teams.",
      "toolB": "MintHCM's own listed cons note a smaller community, at roughly 378 GitHub stars at time of review.",
      "whyItMatters": "A larger community typically means more third-party resources, faster bug fixes, and a lower risk of the project stalling.",
      "benefitsWho": "Risk-averse teams evaluating long-term project viability benefit from Horilla's larger documented community."
    },
    {
      "title": "Enterprise Integration",
      "toolA": "Horilla does not document an equivalent open API for enterprise-system integration in its feature list.",
      "toolB": "MintHCM exposes an Open API explicitly described as enabling custom integration with enterprise systems such as SAP and Workday.",
      "whyItMatters": "An explicitly documented enterprise integration API matters for organizations that need HR data to flow into existing ERP systems.",
      "benefitsWho": "Organizations already running SAP or Workday benefit from MintHCM's documented Open API."
    },
    {
      "title": "License Terms",
      "toolA": "Horilla's self-hosted edition is released under the LGPL-2.1 license.",
      "toolB": "MintHCM is released under the stricter AGPLv3 license.",
      "whyItMatters": "AGPLv3 includes network-use provisions that can affect how modified versions must be shared, which matters for organizations building custom forks.",
      "benefitsWho": "Legal/compliance teams evaluating open-source license obligations should weigh LGPL-2.1 versus AGPLv3 requirements before customizing either platform."
    }
  ],
  "featureMatrix": [
    {
      "group": "HR Modules",
      "rows": [
        {
          "feature": "Payroll",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Recruitment & onboarding",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Performance management",
          "toolA": "available",
          "toolB": "available",
          "note": "MintHCM: Performance evaluation"
        },
        {
          "feature": "Leave management",
          "toolA": "available",
          "toolB": "available",
          "note": "MintHCM: Time & leave management"
        },
        {
          "feature": "Asset tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Travel & expense management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Horilla: LGPL-2.1; MintHCM: AGPLv3"
        },
        {
          "feature": "Managed cloud hosting option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Horilla Cloud: $7/user/month"
        },
        {
          "feature": "Docker one-click install",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open/public API for enterprise integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SAP, Workday integration"
        }
      ]
    },
    {
      "group": "Support & Community",
      "rows": [
        {
          "feature": "30-day free cloud trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "No cloud plan documented for MintHCM"
        },
        {
          "feature": "Community translation program",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "MintHCM uses Crowdin"
        },
        {
          "feature": "GitHub community size",
          "toolA": "available",
          "toolB": "limited",
          "note": "Horilla: 820+ forks, 11,000+ deployed teams; MintHCM: ~378 stars"
        },
        {
          "feature": "Dedicated/enterprise support tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Horilla: custom quote; MintHCM: community forums + implementation partners"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a managed cloud option for either?",
      "answer": "Horilla offers a $7/user/month Cloud plan with a 30-day free trial. MintHCM has no managed cloud plan documented — only self-hosting."
    },
    {
      "question": "Which has more modules out of the box?",
      "answer": "Horilla documents 9 bundled modules, including Payroll, Asset tracking, and Helpdesk. MintHCM's feature list covers 8 areas but doesn't include payroll or asset tracking."
    },
    {
      "question": "Which has a larger open-source community?",
      "answer": "Horilla cites 820+ forks and 11,000+ deployed teams. MintHCM cites roughly 378 GitHub stars, a comparatively smaller footprint."
    },
    {
      "question": "What license does each use?",
      "answer": "Horilla's self-hosted edition is LGPL-2.1. MintHCM is AGPLv3."
    },
    {
      "question": "Does either integrate with systems like SAP?",
      "answer": "MintHCM's Open API is explicitly described as supporting integration with systems such as SAP and Workday. Horilla doesn't document an equivalent open API for enterprise-system integration."
    },
    {
      "question": "Which is easier to deploy?",
      "answer": "Horilla supports Docker one-click installation. MintHCM's deployment process isn't documented with a one-click option — only that it requires self-hosting and managing your own server."
    }
  ]
};

export default horillaVsMinthcmContent;
