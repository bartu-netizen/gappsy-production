import type { GroupComparisonContent } from './types';

const citadelVsEgroupwareVsZimbraCollaborationContent: GroupComparisonContent = {
  "verdict": "Zimbra Collaboration is the most enterprise-polished of the three, adding compliance archiving, an integrated office suite, and vendor support tiers on top of core email and calendar, though it comes as a paid subscription rather than a free download. EGroupware bundles project management and CRM-style tracking atop open-source groupware, with an optional managed cloud edition. Citadel remains the free, lightweight, rooms-based option best suited to small self-hosted deployments rather than regulated enterprise use.",
  "bestFor": {
    "citadel": "Small teams or hobbyist admins who want zero-cost, lightweight self-hosted messaging on modest hardware.",
    "egroupware": "Teams needing groupware plus project management, CRM-style tracking, and file sharing in one open-source suite, with an optional managed cloud edition (eCloud).",
    "zimbra-collaboration": "Larger or regulated organizations that need compliance archiving, an integrated office suite, and vendor-backed support tiers across flexible on-premises, private cloud, or hybrid deployments."
  },
  "highlights": [
    {
      "title": "Enterprise compliance features",
      "description": "Zimbra offers compliance archiving and eDiscovery capabilities suited to regulated industries, a layer neither Citadel nor EGroupware documents.",
      "toolSlugs": [
        "zimbra-collaboration"
      ]
    },
    {
      "title": "Zero-cost entry points",
      "description": "Citadel and EGroupware's Community Edition are both fully free and open source, while Zimbra is a paid subscription starting around $25 per user per year for the Standard edition.",
      "toolSlugs": [
        "citadel",
        "egroupware",
        "zimbra-collaboration"
      ]
    },
    {
      "title": "Bundled office suite",
      "description": "Zimbra includes an integrated office suite alongside email and calendar, avoiding the need for a separate productivity subscription.",
      "toolSlugs": [
        "zimbra-collaboration"
      ]
    },
    {
      "title": "Broadest open-source feature set",
      "description": "EGroupware adds project management, InfoLog CRM-style tracking, and video conferencing integration on top of core groupware, more than Citadel offers out of the box.",
      "toolSlugs": [
        "egroupware"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Messaging",
      "rows": [
        {
          "feature": "Email and calendar",
          "statuses": {
            "citadel": "available",
            "egroupware": "available",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "File sharing / briefcase",
          "statuses": {
            "citadel": "not-documented",
            "egroupware": "available",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "Team chat / instant messaging",
          "statuses": {
            "citadel": "available",
            "egroupware": "available",
            "zimbra-collaboration": "available"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Compliance",
      "rows": [
        {
          "feature": "Compliance archiving / eDiscovery",
          "statuses": {
            "citadel": "unavailable",
            "egroupware": "not-documented",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "Integrated office suite",
          "statuses": {
            "citadel": "unavailable",
            "egroupware": "not-documented",
            "zimbra-collaboration": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "statuses": {
            "citadel": "available",
            "egroupware": "available",
            "zimbra-collaboration": "unavailable"
          },
          "note": "Zimbra Standard is a paid subscription from around $25/user/year; Citadel and EGroupware's Community Edition are free."
        },
        {
          "feature": "Tiered vendor support plans",
          "statuses": {
            "citadel": "unavailable",
            "egroupware": "not-documented",
            "zimbra-collaboration": "available"
          },
          "note": "Zimbra offers Professional, Premier, and Elite support tiers including 24/7 options; Citadel relies purely on community forums."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is completely free?",
      "answer": "Citadel and EGroupware's Community Edition are both free and open source with no artificial feature limits. Zimbra Collaboration is a paid subscription, priced around $25 per user per year for the Standard edition."
    },
    {
      "question": "Which tool is best for regulated industries needing compliance archiving?",
      "answer": "Zimbra Collaboration, which explicitly offers compliance archiving and eDiscovery features along with multiple vendor support tiers, including 24/7 Premier support."
    },
    {
      "question": "Do any of these include a full office suite?",
      "answer": "Zimbra bundles an integrated office suite alongside email and calendar. Neither Citadel nor EGroupware lists an integrated office suite in their documented feature set."
    },
    {
      "question": "Can I deploy these on-premises for data sovereignty?",
      "answer": "Yes. All three support self-hosted or on-premises deployment, and Zimbra additionally offers explicit private cloud and hybrid deployment options for organizations that want a mix of control and managed infrastructure."
    },
    {
      "question": "Which has the broadest feature set beyond email?",
      "answer": "EGroupware, which bundles project management, InfoLog CRM-style tracking, integrated file management, and video conferencing integration alongside core groupware."
    },
    {
      "question": "How mature are these three products?",
      "answer": "Citadel dates to 1987, EGroupware to 2003, and Zimbra to 2005, with Zimbra reporting over 200 million users served across more than 20 years."
    }
  ]
};

export default citadelVsEgroupwareVsZimbraCollaborationContent;
