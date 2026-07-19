import type { GroupComparisonContent } from './types';

const citadelVsEgroupwareVsSogoContent: GroupComparisonContent = {
  "verdict": "Citadel, EGroupware, and SOGo are all free, open-source, self-hosted groupware servers built for organizations that want to run their own email, calendar, and contacts infrastructure instead of Microsoft 365 or Google Workspace. SOGo is the leanest of the three, focused tightly on standards-based sync (CalDAV, CardDAV, ActiveSync) with strong LDAP and Active Directory integration. EGroupware has the broadest feature set, adding project management, CRM-style tracking, file sharing, and an optional paid cloud edition for teams that would rather not self-host. Citadel is the most distinctive, wrapping email, forums, wikis, and instant messaging into a decades-old rooms-based architecture that appeals to admins comfortable with a nonstandard interface in exchange for a very lean footprint.",
  "bestFor": {
    "citadel": "Small teams or hobbyist admins who want a lightweight, all-in-one self-hosted messaging server (email, forums, wikis, IM) on modest hardware and are comfortable with its unique rooms-based interface.",
    "egroupware": "Teams that need groupware plus project management, CRM-style tracking, and file sharing in one open-source suite, with the option to skip self-hosting via EGroupware's own eCloud plans.",
    "sogo": "IT teams that want standards-based email, calendar, and contacts sync (CalDAV, CardDAV, ActiveSync) integrated with existing LDAP or Active Directory infrastructure at production scale."
  },
  "highlights": [
    {
      "title": "Broadest feature set",
      "description": "EGroupware bundles project management, InfoLog CRM-style tracking, integrated file management, and video conferencing integration on top of core groupware, going well beyond email and calendar.",
      "toolSlugs": [
        "egroupware"
      ]
    },
    {
      "title": "Standards-based sync",
      "description": "SOGo natively supports CalDAV, CardDAV, and Microsoft ActiveSync, giving it broad compatibility with Outlook, Thunderbird, and mobile mail clients out of the box.",
      "toolSlugs": [
        "sogo"
      ]
    },
    {
      "title": "Longest operating history",
      "description": "Citadel's codebase dates back to 1987, giving it one of the longest continuously maintained histories among self-hosted messaging servers, written in C for a low-resource footprint.",
      "toolSlugs": [
        "citadel"
      ]
    },
    {
      "title": "Deployment flexibility varies",
      "description": "EGroupware is the only one of the three with an official managed cloud edition (eCloud); Citadel and SOGo are self-hosted by default, though SOGo has an official commercial support partner in Alinto.",
      "toolSlugs": [
        "egroupware",
        "sogo",
        "citadel"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Messaging",
      "rows": [
        {
          "feature": "Email hosting",
          "statuses": {
            "citadel": "available",
            "egroupware": "available",
            "sogo": "available"
          }
        },
        {
          "feature": "Shared calendar",
          "statuses": {
            "citadel": "available",
            "egroupware": "available",
            "sogo": "available"
          }
        },
        {
          "feature": "CalDAV and CardDAV sync",
          "statuses": {
            "citadel": "not-documented",
            "egroupware": "not-documented",
            "sogo": "available"
          },
          "note": "SOGo explicitly documents CalDAV and CardDAV support; Citadel and EGroupware do not list these standards by name in available feature data."
        },
        {
          "feature": "Microsoft ActiveSync (mobile)",
          "statuses": {
            "citadel": "not-documented",
            "egroupware": "available",
            "sogo": "available"
          }
        }
      ]
    },
    {
      "group": "Directory and Collaboration Extras",
      "rows": [
        {
          "feature": "LDAP / Active Directory integration",
          "statuses": {
            "citadel": "not-documented",
            "egroupware": "not-documented",
            "sogo": "available"
          }
        },
        {
          "feature": "Project management",
          "statuses": {
            "citadel": "unavailable",
            "egroupware": "available",
            "sogo": "unavailable"
          }
        },
        {
          "feature": "Wikis, forums, and team chat",
          "statuses": {
            "citadel": "available",
            "egroupware": "available",
            "sogo": "unavailable"
          },
          "note": "Citadel includes wikis, blogs, forums, and instant messaging natively; EGroupware includes team chat; SOGo is focused on webmail and groupware sync rather than wikis or forums."
        }
      ]
    },
    {
      "group": "Deployment and Support",
      "rows": [
        {
          "feature": "Official managed cloud/SaaS option",
          "statuses": {
            "citadel": "unavailable",
            "egroupware": "available",
            "sogo": "unavailable"
          },
          "note": "SOGo is available through third-party hosting but has no official first-party SaaS edition."
        },
        {
          "feature": "Commercial support available",
          "statuses": {
            "citadel": "unavailable",
            "egroupware": "available",
            "sogo": "available"
          },
          "note": "SOGo offers official commercial support via Alinto; Citadel has no commercial support organization or SLA."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Citadel, EGroupware, and SOGo is easiest to self-host?",
      "answer": "Citadel is the leanest to run, being written in C for a low-resource footprint, while SOGo and EGroupware are more feature-rich but require more setup, such as configuring LDAP or Active Directory integration for SOGo, or enabling only the modules you need in EGroupware's modular suite."
    },
    {
      "question": "Is there an official cloud-hosted option so I do not have to self-host?",
      "answer": "EGroupware is the only one of the three with an official managed cloud edition, eCloud, starting at EUR 24.90 per month. Citadel and SOGo are self-hosted by default, though SOGo can be run through third-party hosting or with commercial support from Alinto."
    },
    {
      "question": "Do these tools sync with Outlook and mobile devices?",
      "answer": "SOGo explicitly supports CalDAV, CardDAV, and Microsoft ActiveSync plus Outlook and Thunderbird plugins. EGroupware includes mobile sync as a listed feature. Citadel's support for these specific sync standards is not detailed in available documentation."
    },
    {
      "question": "Which tool is best if I also want project management or CRM features, not just email?",
      "answer": "EGroupware, which includes InfoLog task and CRM-style tracking plus project management alongside core groupware. Citadel and SOGo are more narrowly focused on messaging and calendaring."
    },
    {
      "question": "Can I get paid support if something breaks?",
      "answer": "SOGo has an official commercial support partner, Alinto. EGroupware's paid cloud and enterprise tiers typically include support. Citadel has no commercial support organization, relying on documentation and community forums."
    },
    {
      "question": "How mature are these three projects?",
      "answer": "Citadel is the oldest, dating to 1987, followed by EGroupware (2003) and SOGo (2004). All three have long, continuously maintained histories as self-hosted groupware options."
    }
  ]
};

export default citadelVsEgroupwareVsSogoContent;
