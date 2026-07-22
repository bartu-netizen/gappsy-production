import type { GroupComparisonContent } from './types';

const filestashVsPydioCellsVsSeafileContent: GroupComparisonContent = {
  "verdict": "Filestash, Pydio Cells, and Seafile are all genuine self-hosted, open-core alternatives to commercial cloud storage, but they solve slightly different problems. Filestash is best understood as a universal gateway that unifies access to storage you already have, Pydio Cells is a mature, security-focused sharing platform now backed by Wire's resources, and Seafile leans on efficient sync performance with the most transparent low-end pricing. None of the three is a strict upgrade over the others once enterprise identity and compliance needs enter the picture.",
  "bestFor": {
    "filestash": "Teams that need one interface and access layer over storage they already run, such as S3 buckets, SFTP servers, and SMB shares, without migrating data into a new system.",
    "pydio-cells": "Security- and compliance-conscious organizations that want a long-established, self-hosted file-sharing platform with granular access control, now backed by Wire's secure messaging expertise.",
    "seafile": "Teams that want fast, efficient file sync with block-level deduplication and a clear, low-cost path from a free small-team tier to per-user enterprise pricing."
  },
  "highlights": [
    {
      "title": "Filestash is a protocol gateway, not just a sync tool",
      "description": "Filestash connects to roughly 25 storage backends including S3, SFTP, FTP, WebDAV, SMB, and NFS through one web interface, API, and set of protocol gateways, letting organizations unify access without moving data first.",
      "toolSlugs": [
        "filestash"
      ]
    },
    {
      "title": "Pydio Cells has the longest history and new corporate backing",
      "description": "Pydio Cells traces back to 2007 and was acquired by secure-messaging company Wire in January 2025, which is folding its document-sharing technology into a broader encrypted workspace product.",
      "toolSlugs": [
        "pydio-cells"
      ]
    },
    {
      "title": "Seafile emphasizes sync performance and predictable small-team pricing",
      "description": "Seafile's block-level deduplication improves sync efficiency, and its Professional Edition is free for up to 3 users and a flat 100 US dollars total for up to 9 users before per-user pricing kicks in.",
      "toolSlugs": [
        "seafile"
      ]
    },
    {
      "title": "All three gate enterprise identity and audit features behind paid tiers",
      "description": "SSO (SAML, OIDC, or LDAP) and audit logging are available on all three platforms, but only from a paid Self Served/Standard tier and up, not on the free self-hosted editions.",
      "toolSlugs": [
        "filestash",
        "pydio-cells",
        "seafile"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage and connectivity",
      "rows": [
        {
          "feature": "Multi-protocol storage gateway (S3, SFTP, FTP, WebDAV, SMB, etc.)",
          "statuses": {
            "filestash": "available",
            "pydio-cells": "limited",
            "seafile": "limited"
          },
          "note": "Filestash exposes roughly 25 backends through one interface; Pydio Cells supports filesystem and S3-compatible storage, expanding to Google Cloud Storage and Azure Blob at the Enterprise tier; Seafile is built around its own self-hosted sync storage rather than a broad protocol gateway."
        },
        {
          "feature": "REST API / SDKs",
          "statuses": {
            "filestash": "available",
            "pydio-cells": "available",
            "seafile": "not-documented"
          }
        },
        {
          "feature": "Desktop and mobile sync clients",
          "statuses": {
            "filestash": "not-documented",
            "pydio-cells": "available",
            "seafile": "available"
          }
        },
        {
          "feature": "Block-level deduplication",
          "statuses": {
            "filestash": "not-documented",
            "pydio-cells": "not-documented",
            "seafile": "available"
          }
        }
      ]
    },
    {
      "group": "Security and compliance",
      "rows": [
        {
          "feature": "SSO (SAML, OIDC, LDAP)",
          "statuses": {
            "filestash": "available",
            "pydio-cells": "available",
            "seafile": "available"
          },
          "note": "Filestash from Self Served tier up, Pydio Cells from Cells Connect up, Seafile from Professional Edition up."
        },
        {
          "feature": "Audit logging",
          "statuses": {
            "filestash": "available",
            "pydio-cells": "available",
            "seafile": "available"
          }
        },
        {
          "feature": "Multi-factor authentication",
          "statuses": {
            "filestash": "not-documented",
            "pydio-cells": "available",
            "seafile": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "statuses": {
            "filestash": "available",
            "pydio-cells": "available",
            "seafile": "available"
          },
          "note": "Filestash Hobby caps at 3 users, Pydio Cells Home is uncapped for evaluation and small deployments, Seafile Community Edition is free and open source."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is easiest to plug into storage I already have, without migrating data?",
      "answer": "Filestash is built specifically for this: its plugin-driven gateway connects to roughly 25 existing backends (S3, SFTP, FTP, WebDAV, SMB, NFS, and more) and unifies them behind one interface, API, and set of protocol gateways, rather than requiring files to be copied into a new storage system first."
    },
    {
      "question": "Is Pydio Cells still being actively developed after the Wire acquisition?",
      "answer": "Wire acquired Pydio in January 2025 to merge Cells' document-sharing technology into Wire's encrypted workspace platform. At the time of research the Pydio brand, website, and Cells product were still actively marketed and sold, though its long-term roadmap is now tied to Wire's broader platform plans rather than continuing as a fully independent product line."
    },
    {
      "question": "How does Seafile's pricing compare for a small team of around 5 to 8 people?",
      "answer": "Seafile's Professional Edition is free for up to 3 users and then a flat 100 US dollars total for up to 9 users, which is one of the more transparent small-team pricing structures among self-hosted file platforms. Filestash's Self Served tier is $50/month for 3 seats, and Pydio Cells Connect starts around EUR 3,280/year but is priced for 50 users, making it a comparatively poor fit for very small teams."
    },
    {
      "question": "Do any of these offer a genuinely free tier for small teams?",
      "answer": "Yes. Filestash's Hobby tier, Pydio Cells' Cells Home edition, and Seafile's Community Edition are all free and open source for self-hosting, though Filestash caps the Hobby tier at 3 users while Pydio Cells Home and Seafile Community do not carry that same explicit user cap in their published feature sets."
    },
    {
      "question": "Which is best suited to a regulated or compliance-heavy organization?",
      "answer": "All three offer SSO and audit logging once you move to a paid tier, but Pydio Cells has the longest enterprise track record (since 2007, with named customers and now Wire's security-focused backing) and Filestash publishes named enterprise and academic customers including MIT and JP Morgan alongside immutable, tamper-proof audit logging aimed at GDPR compliance."
    },
    {
      "question": "Can these tools connect to existing S3 buckets or SFTP servers I already run?",
      "answer": "Filestash is the strongest fit here, with native gateways for S3, SFTP, FTP, and WebDAV among its roughly 25 supported backends. Pydio Cells supports S3-compatible object storage alongside its own filesystem storage. Seafile is oriented around its own self-hosted sync storage rather than acting as a gateway to external S3 or SFTP endpoints."
    }
  ]
};

export default filestashVsPydioCellsVsSeafileContent;
