import type { GroupComparisonContent } from './types';

const citadelVsSogoVsZimbraCollaborationContent: GroupComparisonContent = {
  "verdict": "SOGo and Zimbra Collaboration both anchor on standards-based email and calendar sync, but Zimbra adds compliance archiving, an integrated office suite, and vendor support tiers for a subscription fee, while SOGo stays free and open source with explicit CalDAV, CardDAV, and ActiveSync support plus optional commercial support via Alinto. Citadel remains the leanest, entirely free, rooms-based option, best suited to small self-hosted deployments rather than compliance-heavy enterprise use.",
  "bestFor": {
    "citadel": "Small teams or hobbyists wanting a completely free, lightweight, all-in-one self-hosted messaging server.",
    "sogo": "Organizations wanting free, standards-based groupware (CalDAV, CardDAV, ActiveSync) that integrates with existing LDAP or Active Directory infrastructure, with optional paid support from Alinto.",
    "zimbra-collaboration": "Larger or regulated organizations that need compliance archiving, an integrated office suite, and vendor-backed support tiers."
  },
  "highlights": [
    {
      "title": "Standards-based sync",
      "description": "SOGo natively supports CalDAV, CardDAV, and Microsoft ActiveSync for broad compatibility with Outlook, Thunderbird, and mobile mail clients.",
      "toolSlugs": [
        "sogo"
      ]
    },
    {
      "title": "Compliance and office suite",
      "description": "Zimbra adds compliance archiving, eDiscovery, and an integrated office suite that neither SOGo nor Citadel documents.",
      "toolSlugs": [
        "zimbra-collaboration"
      ]
    },
    {
      "title": "Free and open-source core",
      "description": "Citadel and SOGo are both free with no per-user licensing cost, while Zimbra is a paid subscription starting around $25 per user per year.",
      "toolSlugs": [
        "citadel",
        "sogo",
        "zimbra-collaboration"
      ]
    },
    {
      "title": "Commercial support paths",
      "description": "SOGo (via Alinto) and Zimbra both offer official paid support tiers; Citadel relies solely on community documentation and forums.",
      "toolSlugs": [
        "sogo",
        "zimbra-collaboration",
        "citadel"
      ]
    },
    {
      "title": "Directory integration",
      "description": "SOGo explicitly integrates with existing LDAP, Active Directory, and IMAP infrastructure, a detail not documented for Citadel or Zimbra in available feature data.",
      "toolSlugs": [
        "sogo"
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
            "sogo": "available",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "CalDAV and CardDAV sync",
          "statuses": {
            "citadel": "not-documented",
            "sogo": "available",
            "zimbra-collaboration": "not-documented"
          }
        },
        {
          "feature": "Microsoft ActiveSync (mobile)",
          "statuses": {
            "citadel": "not-documented",
            "sogo": "available",
            "zimbra-collaboration": "not-documented"
          },
          "note": "Zimbra lists multi-platform access but does not explicitly document ActiveSync support in available data."
        }
      ]
    },
    {
      "group": "Enterprise Features",
      "rows": [
        {
          "feature": "LDAP / Active Directory integration",
          "statuses": {
            "citadel": "not-documented",
            "sogo": "available",
            "zimbra-collaboration": "not-documented"
          }
        },
        {
          "feature": "Compliance archiving / eDiscovery",
          "statuses": {
            "citadel": "unavailable",
            "sogo": "unavailable",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "Integrated office suite",
          "statuses": {
            "citadel": "unavailable",
            "sogo": "unavailable",
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
            "sogo": "available",
            "zimbra-collaboration": "unavailable"
          }
        },
        {
          "feature": "Official commercial support available",
          "statuses": {
            "citadel": "unavailable",
            "sogo": "available",
            "zimbra-collaboration": "available"
          },
          "note": "SOGo's commercial support comes via Alinto; Zimbra offers Professional, Premier, and Elite tiers directly."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the best mobile device sync support?",
      "answer": "SOGo, with explicit CalDAV, CardDAV, and Microsoft ActiveSync support documented. Zimbra offers multi-platform access, but its ActiveSync-equivalent support is not detailed in available data, and Citadel's sync protocol details are not documented."
    },
    {
      "question": "Which of the three is completely free?",
      "answer": "Citadel and SOGo are both free and open source with no per-user licensing. Zimbra Collaboration is a paid subscription starting around $25 per user per year for the Standard edition."
    },
    {
      "question": "Which is the best fit for regulated industries?",
      "answer": "Zimbra Collaboration, which explicitly documents compliance archiving and eDiscovery capabilities along with tiered vendor support."
    },
    {
      "question": "Can I get paid support if I am not an email administration expert?",
      "answer": "Yes for SOGo, via its commercial partner Alinto, and for Zimbra, which offers Professional, Premier, and Elite support tiers including 24/7 options. Citadel has no official commercial support organization."
    },
    {
      "question": "Do these tools integrate with an existing corporate directory?",
      "answer": "SOGo explicitly integrates with LDAP, Active Directory, and IMAP infrastructure. Directory integration for Citadel and Zimbra is not explicitly documented in available feature data."
    },
    {
      "question": "How long have these three projects been around?",
      "answer": "Citadel dates to 1987, SOGo to 2004, and Zimbra to 2005, with Zimbra reporting over 200 million users served across more than 20 years."
    }
  ]
};

export default citadelVsSogoVsZimbraCollaborationContent;
