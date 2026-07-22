import type { GroupComparisonContent } from './types';

const groupOfficeVsSogoVsZimbraCollaborationContent: GroupComparisonContent = {
  "verdict": "Group Office and SOGo are both free, open-source, self-hostable groupware servers, but they specialize differently: SOGo is a narrowly focused webmail, calendar, and contacts server proven at ISP scale with thousands of mailboxes, while Group Office wraps that same core in added CRM, invoicing, and helpdesk tools. Zimbra Collaboration sits in a different budget tier entirely, with no published free edition and per-mailbox subscription pricing, but it offers documented compliance archiving, eDiscovery, and encryption features aimed at regulated enterprises. Choosing between them mostly comes down to whether the priority is a lightweight free mail server, a fuller free business suite, or an enterprise-grade compliance-ready platform.",
  "bestFor": {
    "group-office": "Small and mid-sized businesses that want groupware bundled with CRM, invoicing, and helpdesk in one free, AGPL-licensed suite",
    "sogo": "ISPs, hosting providers, and IT teams that need a lightweight, self-hosted webmail and groupware server proven to scale to thousands of mailboxes",
    "zimbra-collaboration": "Regulated enterprises and larger organizations that need on-premises or hybrid deployment with compliance archiving and eDiscovery"
  },
  "highlights": [
    {
      "title": "Free open-source cores versus per-mailbox licensing",
      "description": "Group Office Community (AGPL) and SOGo's core server (GPL/LGPL v2) are both free to self-host with no per-user license fee, while Zimbra is priced per mailbox with no published free tier.",
      "toolSlugs": [
        "group-office",
        "sogo",
        "zimbra-collaboration"
      ]
    },
    {
      "title": "Proven ISP-scale mailbox hosting",
      "description": "SOGo is used in production environments with thousands of mailboxes and multiple domains, making it a common choice for hosting providers and ISPs that need a self-hosted Exchange-like alternative.",
      "toolSlugs": [
        "sogo"
      ]
    },
    {
      "title": "CRM, invoicing, and helpdesk beyond core groupware",
      "description": "Group Office extends past email, calendar, and contacts with a Professional tier that adds support ticketing, time tracking, invoicing, and a Kanban-style Studio builder.",
      "toolSlugs": [
        "group-office"
      ]
    },
    {
      "title": "Compliance archiving and encryption for regulated industries",
      "description": "Zimbra Collaboration includes S/MIME encryption, two-factor authentication, mobile device management, and archiving and eDiscovery tools, with reported usage across over 1,000 regulated organizations.",
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
          "feature": "Free, open-source core edition",
          "statuses": {
            "group-office": "available",
            "sogo": "available",
            "zimbra-collaboration": "not-documented"
          },
          "note": "Group Office Community (AGPL) and SOGo's core (GPL/LGPL v2) are free; Zimbra pricing is per-mailbox subscription or perpetual license with no published free edition."
        },
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "group-office": "available",
            "sogo": "available",
            "zimbra-collaboration": "available"
          }
        }
      ]
    },
    {
      "group": "Groupware Essentials",
      "rows": [
        {
          "feature": "Email, calendar, and contacts",
          "statuses": {
            "group-office": "available",
            "sogo": "available",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "Mobile device sync (CalDAV, CardDAV, or ActiveSync)",
          "statuses": {
            "group-office": "available",
            "sogo": "available",
            "zimbra-collaboration": "available"
          },
          "note": "SOGo supports CalDAV, CardDAV, GroupDAV, and ActiveSync; Zimbra syncs mobile devices via ActiveSync."
        },
        {
          "feature": "Directory integration (LDAP or Active Directory)",
          "statuses": {
            "group-office": "not-documented",
            "sogo": "available",
            "zimbra-collaboration": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Business Tools and Compliance",
      "rows": [
        {
          "feature": "Built-in CRM and helpdesk ticketing",
          "statuses": {
            "group-office": "available",
            "sogo": "unavailable",
            "zimbra-collaboration": "not-documented"
          },
          "note": "SOGo is a webmail and groupware server without a documented CRM or ticketing module."
        },
        {
          "feature": "Compliance archiving and eDiscovery",
          "statuses": {
            "group-office": "limited",
            "sogo": "unavailable",
            "zimbra-collaboration": "available"
          },
          "note": "Group Office offers document search and e-discovery as a paid add-on."
        },
        {
          "feature": "Proven multi-domain, ISP-scale hosting",
          "statuses": {
            "group-office": "not-documented",
            "sogo": "available",
            "zimbra-collaboration": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these is completely free with no per-mailbox licensing cost?",
      "answer": "Group Office's Community edition and SOGo's core server are both free and open source under AGPL and GPL/LGPL v2 licenses. Zimbra Collaboration has no published free tier and is licensed per mailbox."
    },
    {
      "question": "Which is the best fit for hosting providers or ISPs managing thousands of mailboxes?",
      "answer": "SOGo is documented as used in production environments with thousands of mailboxes and multiple domains, making it the strongest fit for hosting providers and ISPs among the three."
    },
    {
      "question": "Which of these includes CRM and invoicing?",
      "answer": "Group Office's Professional tier adds CRM-style contact and deal tracking plus invoicing on top of its core groupware. SOGo and Zimbra do not document CRM or invoicing features."
    },
    {
      "question": "Which is best for regulated industries that need compliance archiving?",
      "answer": "Zimbra Collaboration documents S/MIME encryption, two-factor authentication, mobile device management, and archiving and eDiscovery tools aimed at regulated enterprises."
    },
    {
      "question": "Do any of these offer a hosted cloud option instead of self-hosting?",
      "answer": "Group Office offers an Online cloud plan from about $12 per month and Zimbra supports private-cloud and hybrid deployment. SOGo's core project has no official SaaS offering, though its commercial steward Alinto offers a hosted variant called SOGomail."
    },
    {
      "question": "Which has the narrowest, most focused feature set?",
      "answer": "SOGo is the most narrowly scoped of the three, concentrating on webmail, calendaring, and contacts without the CRM, invoicing, or helpdesk modules that Group Office bundles in."
    }
  ]
};

export default groupOfficeVsSogoVsZimbraCollaborationContent;
