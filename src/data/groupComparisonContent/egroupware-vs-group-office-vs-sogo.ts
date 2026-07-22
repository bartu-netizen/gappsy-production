import type { GroupComparisonContent } from './types';

const egroupwareVsGroupOfficeVsSogoContent: GroupComparisonContent = {
  "verdict": "All three are open-source, self-hostable groupware suites built around email, calendar, and contacts, but they differ sharply in how much business functionality ships around that core. EGroupware packs the most into its free Community edition, bundling a lightweight CRM (InfoLog), project management, helpdesk ticketing, and video/chat integrations at no license cost. Group Office matches that ambition but gates most of the business tooling (CRM, ticketing, Kanban) behind a low-cost paid Professional tier, while SOGo deliberately stays a lean, protocol-pure email and calendar server built to scale to thousands of mailboxes rather than a full business suite. The right pick depends on whether you want one free tool to replace several separate business apps (EGroupware), a cheap upgrade path as you grow (Group Office), or the most reliable, standards-based mail and calendar server for a large or multi-tenant deployment (SOGo).",
  "bestFor": {
    "egroupware": "Organizations that want one free, self-hosted suite covering email, projects, a lightweight CRM, and helpdesk ticketing without paying for separate business apps.",
    "group-office": "Small businesses and public-sector teams that want groupware plus CRM, invoicing, and a Kanban board, and are willing to pay a modest one-time Professional license fee once they outgrow the free Community feature set.",
    "sogo": "IT teams and hosting providers that need rock-solid, standards-based email, calendar, and contact sync at scale, across thousands of mailboxes, without extra business-app overhead."
  },
  "highlights": [
    {
      "title": "EGroupware bundles the broadest business suite for free",
      "description": "EGroupware's free Community Edition includes InfoLog (a lightweight CRM and task tracker), a dedicated Projectmanager app, helpdesk/ticketing, and Jitsi/BigBlueButton video plus Rocket.Chat integration, all with no license cost and no artificial feature limits.",
      "toolSlugs": [
        "egroupware"
      ]
    },
    {
      "title": "SOGo is the leanest, most protocol-complete option",
      "description": "SOGo skips CRM and project management entirely and instead focuses on email, calendar, and contacts, backed by the widest native sync protocol support of the three (CalDAV, CardDAV, GroupDAV, and Microsoft ActiveSync) and proven deployments at thousands of mailboxes.",
      "toolSlugs": [
        "sogo"
      ]
    },
    {
      "title": "Group Office keeps business tools out of the free tier",
      "description": "Group Office's Community edition covers core groupware with unlimited users for free, but CRM-style contact and deal tracking, ticketing, time tracking, and the Studio Kanban board only unlock on the paid Professional tier (about 439 euros plus 219 euros per year for updates).",
      "toolSlugs": [
        "group-office"
      ]
    },
    {
      "title": "First-party hosted cloud differs across the three",
      "description": "EGroupware and Group Office both sell their own hosted cloud plans directly (EGroupware's eCloud, Group Office's Online plan from about $12/month), while SOGo's cloud option runs through its commercial steward Alinto's SOGomail rather than the core open-source project itself.",
      "toolSlugs": [
        "egroupware",
        "group-office",
        "sogo"
      ]
    },
    {
      "title": "All three are free to self-host indefinitely",
      "description": "Every one of the three ships a genuinely free, open-source, self-hosted edition with no user caps, so none of them force a paid plan just to run the core groupware functions at any scale.",
      "toolSlugs": [
        "egroupware",
        "group-office",
        "sogo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Groupware and Mobile Sync",
      "rows": [
        {
          "feature": "Email, calendar, and contacts",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "sogo": "available"
          }
        },
        {
          "feature": "Device sync protocols (CalDAV/CardDAV/ActiveSync)",
          "statuses": {
            "egroupware": "limited",
            "group-office": "limited",
            "sogo": "available"
          },
          "note": "SOGo documents CalDAV, CardDAV, GroupDAV, and ActiveSync support; EGroupware confirms CalDAV/CardDAV but not ActiveSync; Group Office confirms generic device sync without naming specific protocols."
        }
      ]
    },
    {
      "group": "Business Extensions",
      "rows": [
        {
          "feature": "Project management",
          "statuses": {
            "egroupware": "available",
            "group-office": "limited",
            "sogo": "unavailable"
          },
          "note": "Group Office's project management is part of the paid Professional tier."
        },
        {
          "feature": "CRM / deal tracking",
          "statuses": {
            "egroupware": "available",
            "group-office": "limited",
            "sogo": "unavailable"
          },
          "note": "EGroupware's InfoLog module is included free; Group Office's contact and deal tracking requires the paid Professional tier."
        },
        {
          "feature": "Helpdesk / support ticketing",
          "statuses": {
            "egroupware": "available",
            "group-office": "limited",
            "sogo": "unavailable"
          },
          "note": "Group Office gates support ticketing to the paid Professional tier."
        },
        {
          "feature": "Team chat and video conferencing",
          "statuses": {
            "egroupware": "available",
            "group-office": "limited",
            "sogo": "not-documented"
          },
          "note": "EGroupware bundles Jitsi/BigBlueButton and Rocket.Chat; Group Office offers Rocket.Chat only as a paid add-on."
        }
      ]
    },
    {
      "group": "Deployment and Support",
      "rows": [
        {
          "feature": "Free self-hosted edition with unlimited users",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "sogo": "available"
          }
        },
        {
          "feature": "First-party vendor-hosted cloud plan",
          "statuses": {
            "egroupware": "available",
            "group-office": "available",
            "sogo": "limited"
          },
          "note": "SOGo's hosted option (SOGomail) is offered by commercial steward Alinto rather than sold directly by the core project."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three includes CRM or project management for free?",
      "answer": "EGroupware includes both InfoLog (a lightweight CRM) and a Projectmanager app in its free Community edition. Group Office gates full CRM and project management to its paid Professional tier. SOGo does not offer either as it focuses purely on email, calendar, and contacts."
    },
    {
      "question": "Do all three support mobile calendar and contact sync?",
      "answer": "Yes, all three sync with mobile devices. EGroupware confirms CalDAV and CardDAV support, Group Office confirms general device sync without naming specific protocols, and SOGo documents the widest protocol support with CalDAV, CardDAV, GroupDAV, and Microsoft ActiveSync."
    },
    {
      "question": "Can I run any of these without paying anything?",
      "answer": "Yes, all three offer a genuinely free, open-source, self-hosted edition with unlimited users: EGroupware's GPLv2 Community Edition, Group Office's AGPL Community edition, and SOGo's GPL/LGPL v2 core server."
    },
    {
      "question": "Which one has a first-party hosted cloud plan I can subscribe to directly?",
      "answer": "EGroupware (eCloud, from EUR 24.90/month) and Group Office (Online plan, from about $12/month) both sell their own hosted cloud directly. SOGo's hosted variant, SOGomail, is offered through its commercial steward Alinto rather than the core open-source project."
    },
    {
      "question": "Which is best for a large-scale or ISP-style email deployment?",
      "answer": "SOGo is purpose-built and proven for large-scale, multi-domain deployments with thousands of mailboxes, making it the strongest fit for hosting providers and ISPs among the three."
    },
    {
      "question": "Do any of them include built-in team chat or video calling?",
      "answer": "EGroupware bundles both video conferencing (via Jitsi or BigBlueButton) and team chat (via Rocket.Chat) at no extra license cost. Group Office offers Rocket.Chat-based chat and video only as a paid add-on. SOGo does not document a built-in chat or video feature."
    }
  ]
};

export default egroupwareVsGroupOfficeVsSogoContent;
