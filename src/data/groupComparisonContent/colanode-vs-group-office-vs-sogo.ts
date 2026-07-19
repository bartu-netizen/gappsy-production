import type { GroupComparisonContent } from './types';

const colanodeVsGroupOfficeVsSogoContent: GroupComparisonContent = {
  "verdict": "Colanode, Group Office, and SOGo are all free-to-self-host, open-source tools for teams that want to own their collaboration infrastructure instead of renting a SaaS suite, but they cover different ground. Colanode is a young, local-first chat-and-docs workspace built as a Slack-plus-Notion alternative; Group Office is a much broader groupware-and-business suite with CRM, invoicing, and helpdesk bolted on; and SOGo is a lean, standards-based webmail and calendaring server proven at scale with thousands of mailboxes. The right pick depends on whether you need a modern team workspace, a full small-business back office, or just rock-solid email and calendar sync.",
  "bestFor": {
    "colanode": "Technical teams that want a modern, local-first Notion-and-Slack-style workspace they fully own and control",
    "group-office": "Small businesses, schools, and public-sector organizations that need email, CRM, invoicing, and helpdesk bundled into one self-hosted suite",
    "sogo": "IT teams and hosting providers that need a lean, standards-based webmail and calendar server proven at scale with thousands of mailboxes"
  },
  "highlights": [
    {
      "title": "Local-first, CRDT-powered sync",
      "description": "Colanode writes every change to a local SQLite database first and syncs in the background using Yjs CRDTs, so it stays fast and usable offline in a way the other two, which are traditional server-side apps, are not.",
      "toolSlugs": [
        "colanode"
      ]
    },
    {
      "title": "The broadest built-in business toolset",
      "description": "Group Office is the only one of the three that bundles CRM, invoicing, time tracking, and a support helpdesk alongside core groupware, making it closer to a small-business back office than a pure collaboration tool.",
      "toolSlugs": [
        "group-office"
      ]
    },
    {
      "title": "Battle-tested at real scale",
      "description": "SOGo is used in production environments with thousands of mailboxes and native CalDAV, CardDAV, and Microsoft ActiveSync support, making it a common choice for hosting providers and ISPs rather than just small teams.",
      "toolSlugs": [
        "sogo"
      ]
    },
    {
      "title": "Very different project maturity",
      "description": "Group Office traces back to 2003 and SOGo to 2004, giving both over two decades of production hardening, while Colanode was created in 2024 and is still a young, actively evolving project without a finalized cloud pricing plan.",
      "toolSlugs": [
        "group-office",
        "sogo",
        "colanode"
      ]
    },
    {
      "title": "Free self-hosting across the board",
      "description": "All three can be self-hosted at no license cost with unlimited users on their core editions, though Group Office gates its CRM, helpdesk, and Kanban tools behind a paid Professional tier.",
      "toolSlugs": [
        "colanode",
        "group-office",
        "sogo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Collaboration Features",
      "rows": [
        {
          "feature": "Team chat and instant messaging",
          "statuses": {
            "colanode": "available",
            "group-office": "limited",
            "sogo": "unavailable"
          },
          "note": "Group Office offers chat only through a paid Rocket.Chat-based add-on"
        },
        {
          "feature": "Notion-style pages and databases",
          "statuses": {
            "colanode": "available",
            "group-office": "unavailable",
            "sogo": "unavailable"
          }
        },
        {
          "feature": "Email and shared calendaring",
          "statuses": {
            "colanode": "unavailable",
            "group-office": "available",
            "sogo": "available"
          }
        },
        {
          "feature": "CRM, invoicing, and helpdesk",
          "statuses": {
            "colanode": "unavailable",
            "group-office": "available",
            "sogo": "unavailable"
          },
          "note": "Included in Group Office's paid Professional tier and add-ons"
        }
      ]
    },
    {
      "group": "Sync, Mobile, and Standards",
      "rows": [
        {
          "feature": "CalDAV, CardDAV, or ActiveSync support",
          "statuses": {
            "colanode": "not-documented",
            "group-office": "available",
            "sogo": "available"
          },
          "note": "SOGo explicitly supports CalDAV, CardDAV, GroupDAV, and Microsoft ActiveSync; Group Office lists device sync in its Community edition"
        },
        {
          "feature": "Native desktop application",
          "statuses": {
            "colanode": "available",
            "group-office": "not-documented",
            "sogo": "not-documented"
          },
          "note": "Colanode ships an Electron desktop app in addition to its web app"
        }
      ]
    },
    {
      "group": "Deployment, Licensing, and Cost",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "colanode": "available",
            "group-office": "available",
            "sogo": "available"
          }
        },
        {
          "feature": "Free tier with unlimited users",
          "statuses": {
            "colanode": "available",
            "group-office": "available",
            "sogo": "available"
          },
          "note": "Group Office's Community edition is free with unlimited users, though it excludes paid business modules"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Colanode a good self-hosted replacement for Slack and Notion together?",
      "answer": "It's built as exactly that: a combined chat, pages, and database workspace, self-hostable via Docker-style infrastructure with PostgreSQL, Redis, and object storage. Just note it is a young project (created 2024) without the maturity or plugin ecosystem of established tools."
    },
    {
      "question": "Does Group Office include a CRM out of the box?",
      "answer": "CRM and deal tracking come with the paid Professional edition, priced around 439 euros as a one-time license plus roughly 219 euros per year for updates. The free Community edition covers email, calendar, files, and document editing but not CRM."
    },
    {
      "question": "Can SOGo sync calendars and contacts to iPhone and Android?",
      "answer": "Yes. SOGo supports CalDAV and CardDAV for cross-platform sync plus Microsoft ActiveSync, which mobile devices, Outlook, and Apple Calendar and Contacts can connect to natively."
    },
    {
      "question": "Which of these three has the longest production track record?",
      "answer": "Group Office (initial release in 2003) and SOGo (2004, with roots back to 1996) have both been in continuous development for over two decades. Colanode is far newer, created in 2024, and is still finalizing its cloud monetization plan."
    },
    {
      "question": "Do any of these charge a per-seat license fee to self-host?",
      "answer": "No. All three can be self-hosted with unlimited users at no license cost on their core/Community editions. Group Office's paid Professional tier and add-ons, and SOGo's optional commercial support via Alinto, are the only paid layers on top."
    }
  ]
};

export default colanodeVsGroupOfficeVsSogoContent;
