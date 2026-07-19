import type { GroupComparisonContent } from './types';

const filebrowserVsFilestashVsSeafileContent: GroupComparisonContent = {
  "verdict": "All three are self-hosted, browser-accessible file tools, but they target different jobs. FileBrowser is the simplest option, a single free binary that turns one server directory into a web file manager with no ongoing cost. Filestash is the right pick when storage is already spread across multiple systems, such as S3, SFTP, and SMB, and you need one unified gateway plus enterprise SSO. Seafile is the only one built around true desktop and mobile file synchronization, making it the closest to a self-hosted Dropbox, with an affordable path to enterprise admin features through its Professional Edition.",
  "bestFor": {
    "filebrowser": "Homelab users, sysadmins, and developers who want the simplest possible way to expose one server directory as a browser-based file manager for free, with no database, subscription, or paid tier at all.",
    "filestash": "Organizations with storage already spread across multiple backends, such as S3, SFTP, SMB, and WebDAV, who need one unified web interface, API, and protocol gateway plus enterprise SSO and audit logging, without migrating data first.",
    "seafile": "Teams that want true desktop and mobile file synchronization, not just browser-based access, with block-level deduplication and an affordable path to enterprise admin console, audit logs, and directory integration through the Professional Edition."
  },
  "highlights": [
    {
      "title": "FileBrowser wins on deployment simplicity and cost",
      "description": "FileBrowser ships as a single statically-linked Go binary with no separate database or runtime, and has no paid tier at all, unlike Filestash and Seafile, which both gate enterprise features behind paid editions.",
      "toolSlugs": [
        "filebrowser"
      ]
    },
    {
      "title": "Filestash is the only true multi-protocol storage gateway",
      "description": "Filestash connects to roughly 25 different storage backends, including S3, SFTP, SMB, WebDAV, and Azure, and exposes protocol gateways so other tools can talk to that storage, a capability neither FileBrowser nor Seafile offers.",
      "toolSlugs": [
        "filestash"
      ]
    },
    {
      "title": "Seafile is the only one with native sync clients",
      "description": "Seafile provides native desktop and mobile sync clients with block-level deduplication, functioning like a self-hosted Dropbox, while FileBrowser and Filestash are primarily browser and API-based access layers rather than sync clients.",
      "toolSlugs": [
        "seafile"
      ]
    },
    {
      "title": "FileBrowser's original project is in maintenance-only mode",
      "description": "As of 2026 the original FileBrowser project only ships bug fixes and security patches; new features like OIDC/LDAP single sign-on and multi-source storage have moved to a community fork called File Browser Quantum.",
      "toolSlugs": [
        "filebrowser"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Access Model",
      "rows": [
        {
          "feature": "Browser-based file management",
          "statuses": {
            "filebrowser": "available",
            "filestash": "available",
            "seafile": "available"
          }
        },
        {
          "feature": "Native desktop and mobile sync clients",
          "statuses": {
            "filebrowser": "unavailable",
            "filestash": "not-documented",
            "seafile": "available"
          }
        },
        {
          "feature": "Multi-protocol storage gateway (S3, SFTP, SMB, WebDAV as external backends)",
          "statuses": {
            "filebrowser": "unavailable",
            "filestash": "available",
            "seafile": "not-documented"
          },
          "note": "FileBrowser is explicitly scoped to a single local directory rather than external backends."
        }
      ]
    },
    {
      "group": "Identity and Compliance",
      "rows": [
        {
          "feature": "SSO (SAML, OIDC, or LDAP)",
          "statuses": {
            "filebrowser": "unavailable",
            "filestash": "available",
            "seafile": "available"
          },
          "note": "FileBrowser's original project has no built-in SSO; this is only available via the community fork File Browser Quantum."
        },
        {
          "feature": "Compliance-grade audit logging",
          "statuses": {
            "filebrowser": "not-documented",
            "filestash": "available",
            "seafile": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Licensing",
      "rows": [
        {
          "feature": "Unlimited users on the free tier",
          "statuses": {
            "filebrowser": "available",
            "filestash": "unavailable",
            "seafile": "not-documented"
          },
          "note": "Filestash's free Hobby tier is capped at 3 users; Seafile's free Community Edition has no numeric user cap stated in available data."
        },
        {
          "feature": "Paid enterprise tier",
          "statuses": {
            "filebrowser": "unavailable",
            "filestash": "available",
            "seafile": "available"
          },
          "note": "FileBrowser has no paid tier or enterprise edition at all."
        },
        {
          "feature": "Block-level deduplication",
          "statuses": {
            "filebrowser": "not-documented",
            "filestash": "not-documented",
            "seafile": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is completely free with no user limits?",
      "answer": "FileBrowser has no paid tier at all, and its free edition supports unlimited users, limited only by the server's own disk space."
    },
    {
      "question": "Which one actually syncs files to my desktop like Dropbox?",
      "answer": "Seafile, through its native desktop and mobile sync clients combined with block-level deduplication for efficient syncing."
    },
    {
      "question": "Can I connect existing storage like an S3 bucket or SFTP server as a backend?",
      "answer": "Yes, with Filestash, which is built specifically as a universal multi-protocol storage gateway. FileBrowser is scoped to a single local directory, and Seafile uses its own storage and sync model rather than acting as a gateway to external backends."
    },
    {
      "question": "Which of these supports single sign-on for enterprise identity systems?",
      "answer": "Filestash offers SAML, OIDC, and LDAP single sign-on from its Self Served tier, and Seafile's Professional Edition supports LDAP, Active Directory, and SAML. FileBrowser's original project has no built-in SSO, though its community fork, File Browser Quantum, adds it."
    },
    {
      "question": "Is FileBrowser still actively developed?",
      "answer": "The original FileBrowser project entered maintenance-only mode in 2026, meaning only bug fixes and security patches are being applied; active feature development has moved to a community fork called File Browser Quantum."
    },
    {
      "question": "Which is the cheapest way to get enterprise features like audit logs for a small team?",
      "answer": "Seafile's Professional Edition is free for up to 3 users and a flat 100 US dollars total for up to 9 users, which undercuts Filestash's Self Served tier at $50 per month for a similarly sized team."
    }
  ]
};

export default filebrowserVsFilestashVsSeafileContent;
