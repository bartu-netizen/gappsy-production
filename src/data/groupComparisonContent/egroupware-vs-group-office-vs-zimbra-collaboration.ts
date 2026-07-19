import type { GroupComparisonContent } from './types';

const egroupwareVsGroupOfficeVsZimbraCollaborationContent: GroupComparisonContent = {
  "verdict": "EGroupware and Group Office both give organizations a genuinely free, self-hostable open-source core (GPLv2 and AGPL respectively) with unlimited users, but they specialize differently: Group Office leans into CRM, invoicing, and helpdesk, while EGroupware leans into helpdesk, project management, and bundled video conferencing. Zimbra Collaboration is a more narrowly email-and-calendar-focused enterprise suite with no published free tier, priced per mailbox, but it brings compliance archiving, eDiscovery, and a track record with regulated industries that the two open-source suites do not document. The right pick depends on whether the priority is a zero-cost self-hosted groupware stack or an enterprise-grade, audit-ready email platform.",
  "bestFor": {
    "egroupware": "Organizations that want a free, fully-featured GPLv2 open-source groupware suite with built-in helpdesk and project management, self-hosted or on EU-hosted cloud infrastructure",
    "group-office": "Small and mid-sized businesses that want groupware bundled with CRM, invoicing, and helpdesk in a single AGPL-licensed suite with unlimited free users",
    "zimbra-collaboration": "Regulated enterprises and larger organizations that need on-premises, private-cloud, or hybrid deployment with compliance archiving and eDiscovery"
  },
  "highlights": [
    {
      "title": "Free, unlimited-user open-source cores",
      "description": "EGroupware's Community Edition (GPLv2) and Group Office's Community edition (AGPL) are both free to self-host with no user cap, while Zimbra has no published free or open-source tier in its current pricing.",
      "toolSlugs": [
        "egroupware",
        "group-office"
      ]
    },
    {
      "title": "CRM and invoicing bundled into the suite",
      "description": "Group Office's Professional tier adds contact and deal tracking, time tracking, invoicing, and a Kanban-style Studio builder alongside its core groupware apps.",
      "toolSlugs": [
        "group-office"
      ]
    },
    {
      "title": "Helpdesk and video conferencing in the free edition",
      "description": "EGroupware's core apps include a helpdesk/ticketing module and bundled Jitsi or BigBlueButton video conferencing without requiring the paid Enterprise Professional Line.",
      "toolSlugs": [
        "egroupware"
      ]
    },
    {
      "title": "Compliance archiving for regulated industries",
      "description": "Zimbra Collaboration includes S/MIME encryption, two-factor authentication, mobile device management, and archiving and eDiscovery tools, and reports usage across 127 countries including over 1,000 organizations in regulated industries.",
      "toolSlugs": [
        "zimbra-collaboration"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Deployment",
      "rows": [
        {
          "feature": "Free, unlimited-user open-source edition",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "zimbra-collaboration": "not-documented"
          },
          "note": "EGroupware CE and Group Office Community are GPLv2/AGPL with no user cap; Zimbra pricing is per-mailbox subscription or perpetual license."
        },
        {
          "feature": "Self-hosted, private-cloud, or hybrid deployment",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "zimbra-collaboration": "available"
          }
        }
      ]
    },
    {
      "group": "Business and Collaboration Tools",
      "rows": [
        {
          "feature": "Built-in CRM or task-tracking module",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "zimbra-collaboration": "not-documented"
          },
          "note": "EGroupware's InfoLog and Group Office's CRM module; not documented for Zimbra."
        },
        {
          "feature": "Helpdesk and support ticketing",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "zimbra-collaboration": "not-documented"
          },
          "note": "Group Office's helpdesk module is part of the paid Professional tier."
        },
        {
          "feature": "Real-time document co-editing",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "zimbra-collaboration": "available"
          },
          "note": "EGroupware and Group Office integrate Collabora Online; Zimbra ships its own integrated office suite."
        },
        {
          "feature": "Built-in video conferencing",
          "statuses": {
            "egroupware": "available",
            "group-office": "limited",
            "zimbra-collaboration": "not-documented"
          },
          "note": "Group Office's video calling comes via a paid Rocket.Chat add-on; Zimbra documents team chat but not a dedicated video conferencing feature."
        }
      ]
    },
    {
      "group": "Compliance and Mobile Access",
      "rows": [
        {
          "feature": "Compliance archiving and eDiscovery",
          "statuses": {
            "egroupware": "not-documented",
            "group-office": "limited",
            "zimbra-collaboration": "available"
          },
          "note": "Group Office offers e-discovery and document search as a paid add-on; Zimbra includes it on the Professional edition."
        },
        {
          "feature": "Mobile calendar and contact sync",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "zimbra-collaboration": "available"
          },
          "note": "EGroupware and Group Office use CalDAV/CardDAV; Zimbra syncs via ActiveSync."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three groupware suites is completely free to self-host?",
      "answer": "EGroupware's Community Edition and Group Office's Community edition are both free, open-source, and support unlimited users. Zimbra Collaboration has no published free tier in the provided pricing and is licensed per mailbox."
    },
    {
      "question": "Which is the best fit for regulated industries that need compliance archiving?",
      "answer": "Zimbra Collaboration is the strongest documented fit, with S/MIME encryption, two-factor authentication, mobile device management, and archiving and eDiscovery tools, and reported usage in over 1,000 regulated organizations."
    },
    {
      "question": "Which suite includes CRM and invoicing out of the box?",
      "answer": "Group Office's Professional tier adds CRM-style contact and deal tracking plus time tracking and invoicing alongside its core groupware apps; EGroupware offers InfoLog for lighter task and contact tracking, and Zimbra does not document CRM or invoicing features."
    },
    {
      "question": "Which of these has built-in video conferencing without an add-on purchase?",
      "answer": "EGroupware bundles Jitsi or BigBlueButton video conferencing into its core apps. Group Office's video calling is a paid Rocket.Chat add-on, and Zimbra's video conferencing capability is not documented in its published feature set."
    },
    {
      "question": "Can any of these run as a hosted cloud service instead of being self-hosted?",
      "answer": "Yes. EGroupware offers eCloud hosting in German data centers, Group Office offers an Online cloud plan from about $12 per month, and Zimbra supports private-cloud and hybrid deployment options."
    },
    {
      "question": "Which is best suited to schools and nonprofits on a tight budget?",
      "answer": "EGroupware publishes a flat-rate eFlat School plan at EUR 1,295 per year for unlimited users, and its Community Edition is free for self-hosting nonprofits; Group Office's free Community edition also supports unlimited users at no license cost."
    }
  ]
};

export default egroupwareVsGroupOfficeVsZimbraCollaborationContent;
