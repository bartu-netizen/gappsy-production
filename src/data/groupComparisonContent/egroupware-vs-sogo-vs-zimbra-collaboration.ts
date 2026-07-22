import type { GroupComparisonContent } from './types';

const egroupwareVsSogoVsZimbraCollaborationContent: GroupComparisonContent = {
  "verdict": "EGroupware and SOGo are both open-source and free to self-host indefinitely, while Zimbra Collaboration is a paid, per-mailbox subscription product with no documented free tier, but with the deepest built-in security and compliance tooling of the three. If budget and license freedom matter most, EGroupware or SOGo make more sense; if an organization needs S/MIME encryption, mobile device management, and eDiscovery-grade archiving out of the box and is willing to pay per mailbox, Zimbra is the more purpose-built choice. EGroupware still edges out SOGo on built-in business functionality (projects, a lightweight CRM, ticketing), while SOGo remains the leanest, most protocol-complete pure groupware server of the three.",
  "bestFor": {
    "egroupware": "Organizations that want a free, self-hosted suite combining email, projects, a lightweight CRM, and helpdesk ticketing without a per-mailbox license fee.",
    "sogo": "IT teams and hosting providers that need a lean, standards-based, self-hosted email and calendar server proven at thousands of mailboxes, without paying per mailbox.",
    "zimbra-collaboration": "Regulated organizations, such as financial, government, or university environments, that need built-in S/MIME encryption, MDM, and compliance archiving/eDiscovery and are comfortable with per-mailbox subscription pricing."
  },
  "highlights": [
    {
      "title": "Zimbra is the only one built for regulated-industry compliance",
      "description": "Zimbra documents S/MIME encryption, two-factor authentication, mobile device management, and compliance-focused archiving and eDiscovery as core features, none of which are documented for EGroupware or SOGo in the available data.",
      "toolSlugs": [
        "zimbra-collaboration"
      ]
    },
    {
      "title": "EGroupware and SOGo are free to self-host indefinitely; Zimbra is not",
      "description": "EGroupware's Community Edition and SOGo's core server are both free, open-source, and self-hostable with no user caps, while Zimbra is sold as a per-mailbox subscription (roughly $25/user/year for Standard) with no free edition documented.",
      "toolSlugs": [
        "egroupware",
        "sogo",
        "zimbra-collaboration"
      ]
    },
    {
      "title": "EGroupware has the broadest built-in business toolset",
      "description": "EGroupware is the only one of the three that bundles a lightweight CRM (InfoLog), project management, and helpdesk ticketing directly into its free Community edition; SOGo and Zimbra don't document any of these.",
      "toolSlugs": [
        "egroupware"
      ]
    },
    {
      "title": "SOGo has the deepest native mobile sync protocol support",
      "description": "SOGo documents CalDAV, CardDAV, GroupDAV, and Microsoft ActiveSync support; Zimbra confirms ActiveSync and Outlook connectivity but not CalDAV/CardDAV, and EGroupware confirms CalDAV/CardDAV but not ActiveSync.",
      "toolSlugs": [
        "sogo"
      ]
    },
    {
      "title": "Team chat is available in EGroupware and Zimbra, not documented for SOGo",
      "description": "EGroupware bundles Rocket.Chat integration and Zimbra includes basic and advanced team chat as core features; SOGo's available data doesn't mention a chat feature.",
      "toolSlugs": [
        "egroupware",
        "zimbra-collaboration",
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
            "sogo": "available",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "Mobile sync protocols (CalDAV/CardDAV/ActiveSync)",
          "statuses": {
            "egroupware": "limited",
            "sogo": "available",
            "zimbra-collaboration": "limited"
          },
          "note": "SOGo documents CalDAV, CardDAV, GroupDAV, and ActiveSync; EGroupware confirms CalDAV/CardDAV only; Zimbra confirms ActiveSync and Outlook connectivity but not CalDAV/CardDAV."
        }
      ]
    },
    {
      "group": "Business and Collaboration Extensions",
      "rows": [
        {
          "feature": "Project management",
          "statuses": {
            "egroupware": "available",
            "sogo": "unavailable",
            "zimbra-collaboration": "not-documented"
          }
        },
        {
          "feature": "Helpdesk / support ticketing",
          "statuses": {
            "egroupware": "available",
            "sogo": "unavailable",
            "zimbra-collaboration": "not-documented"
          }
        },
        {
          "feature": "Team chat",
          "statuses": {
            "egroupware": "available",
            "sogo": "not-documented",
            "zimbra-collaboration": "available"
          }
        }
      ]
    },
    {
      "group": "Security, Compliance and Deployment",
      "rows": [
        {
          "feature": "Advanced security (S/MIME, 2FA, MDM)",
          "statuses": {
            "egroupware": "not-documented",
            "sogo": "limited",
            "zimbra-collaboration": "available"
          },
          "note": "SOGo documents two-factor authentication and SSO but not S/MIME encryption or mobile device management; Zimbra documents all three."
        },
        {
          "feature": "Compliance archiving and eDiscovery",
          "statuses": {
            "egroupware": "not-documented",
            "sogo": "not-documented",
            "zimbra-collaboration": "available"
          }
        },
        {
          "feature": "Free, open-source self-hosted edition",
          "statuses": {
            "egroupware": "available",
            "sogo": "available",
            "zimbra-collaboration": "unavailable"
          },
          "note": "Zimbra's documented pricing is per-mailbox subscription with no free edition listed."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is free to self-host?",
      "answer": "EGroupware's Community Edition and SOGo's core server are both free, open-source, and self-hostable with unlimited users. Zimbra Collaboration is sold as a per-mailbox subscription, roughly $25/user/year for the Standard edition, with no free edition documented."
    },
    {
      "question": "Which one is built for regulated industries with compliance requirements?",
      "answer": "Zimbra is the only one of the three that documents S/MIME encryption, two-factor authentication, mobile device management, and compliance-focused archiving and eDiscovery as core features, which is why it's used by financial institutions, government agencies, and universities."
    },
    {
      "question": "Does any of them include built-in project management or a CRM?",
      "answer": "Only EGroupware does, via its Projectmanager app and InfoLog CRM-style tracking module, both included in the free Community edition. Neither SOGo nor Zimbra documents project management or CRM functionality."
    },
    {
      "question": "Which has the widest mobile device sync support?",
      "answer": "SOGo documents the broadest protocol support, including CalDAV, CardDAV, GroupDAV, and Microsoft ActiveSync. Zimbra confirms ActiveSync and Outlook integration, while EGroupware confirms CalDAV and CardDAV."
    },
    {
      "question": "How is Zimbra priced compared to the other two?",
      "answer": "Zimbra is licensed per mailbox, typically sold in blocks of 25, at roughly $25/user/year for Standard or $35/user/year for Professional, with no free tier documented. EGroupware and SOGo are both free to self-host, with EGroupware also offering paid enterprise and cloud tiers for organizations that want vendor support."
    },
    {
      "question": "Which is the better fit for a hosting provider or ISP running thousands of mailboxes?",
      "answer": "SOGo is explicitly documented as designed to scale to thousands of mailboxes and multiple domains, making it the strongest fit among the three for that use case."
    }
  ]
};

export default egroupwareVsSogoVsZimbraCollaborationContent;
