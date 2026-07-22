import type { GroupComparisonContent } from './types';

const baculaVsBareosVsKopiaContent: GroupComparisonContent = {
  "verdict": "Bacula and Bareos are mature, enterprise-oriented network backup systems (Bareos began as a 2010 fork of Bacula) built for sysadmins managing heterogeneous, multi-client networks with tape, disk and cloud storage tiers. Kopia is a newer, simpler, encryption-first backup tool built around client-side encrypted, deduplicated snapshots to a storage repository you control, with both a CLI and a polished GUI. The choice largely comes down to scope: Bacula and Bareos suit centralized, multi-machine backup infrastructure with optional commercial support, while Kopia suits individuals, self-hosters and small teams who want strong encryption and a simpler operating model.",
  "bestFor": {
    "bacula": "System administrators managing mixed-OS networks who want a mature, free, GPL-licensed backup engine with the option to upgrade to Bacula Systems' commercial enterprise edition for advanced scalability and support.",
    "bareos": "Teams that want an actively maintained, community-driven fork of Bacula with cloud storage backends and database backup plugins, plus the option to buy SLA-backed subscription support directly from Bareos GmbH.",
    "kopia": "Privacy-conscious individuals, self-hosters and small teams who want end-to-end encrypted, deduplicated backups to their own cloud or NAS storage, with both a CLI and a native GUI (KopiaUI)."
  },
  "highlights": [
    {
      "title": "Shared lineage, different governance",
      "description": "Bareos was forked from Bacula in 2010 by former Bacula developers and is now maintained by its own company, Bareos GmbH & Co. KG, giving the two tools overlapping architecture but separate release cycles and support offerings.",
      "toolSlugs": [
        "bacula",
        "bareos"
      ]
    },
    {
      "title": "Encryption is mandatory in Kopia, optional elsewhere",
      "description": "Kopia encrypts every snapshot client-side by design and does not support creating unencrypted backups at all, while Bacula and Bareos offer TLS/TLS-PSK encrypted communications rather than enforcing end-to-end client-side encryption as a default.",
      "toolSlugs": [
        "kopia"
      ]
    },
    {
      "title": "Commercial support paths differ in structure",
      "description": "Bacula Systems sells a custom-quoted Enterprise Edition, and Bareos GmbH sells tiered annual subscriptions from around 480 euros/year up to 42,900 euros/year for SLA-backed support; Kopia has no vendor-sold support contract, relying on its open-source community and Kasten by Veeam's engineering contributions.",
      "toolSlugs": [
        "bacula",
        "bareos",
        "kopia"
      ]
    },
    {
      "title": "Storage model: managed vs bring-your-own",
      "description": "Bacula and Bareos support tape, disk and cloud storage backends configured within their own backup infrastructure, while Kopia is backend-agnostic, pairing with S3, Azure Blob, Backblaze B2, Google Cloud Storage, WebDAV/SFTP or local NAS storage that the user supplies and pays for separately.",
      "toolSlugs": [
        "bacula",
        "bareos",
        "kopia"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform and licensing",
      "rows": [
        {
          "feature": "Free, open-source core",
          "statuses": {
            "bacula": "available",
            "bareos": "available",
            "kopia": "available"
          },
          "note": "Bacula is GPL-licensed, Bareos is AGPL v3-licensed, Kopia is fully open source with no paid tier at all."
        },
        {
          "feature": "Cross-platform (Linux, Windows, Mac)",
          "statuses": {
            "bacula": "available",
            "bareos": "available",
            "kopia": "available"
          }
        },
        {
          "feature": "Vendor-sold commercial support",
          "statuses": {
            "bacula": "available",
            "bareos": "available",
            "kopia": "unavailable"
          },
          "note": "Bacula Systems sells a custom-quoted Enterprise Edition; Bareos GmbH sells tiered annual subscriptions; Kopia has no direct vendor support contract."
        }
      ]
    },
    {
      "group": "Backup capabilities",
      "rows": [
        {
          "feature": "Client-side end-to-end encryption",
          "statuses": {
            "bacula": "not-documented",
            "bareos": "not-documented",
            "kopia": "available"
          },
          "note": "Bacula and Bareos document TLS/TLS-PSK encryption of communications rather than mandatory client-side encryption of the data itself."
        },
        {
          "feature": "Data deduplication",
          "statuses": {
            "bacula": "not-documented",
            "bareos": "available",
            "kopia": "available"
          }
        },
        {
          "feature": "Cloud storage backend support",
          "statuses": {
            "bacula": "available",
            "bareos": "available",
            "kopia": "available"
          },
          "note": "Bareos and Kopia both explicitly document S3-compatible object storage; Bacula documents general cloud storage support."
        },
        {
          "feature": "Database backup plugins (e.g. PostgreSQL, MySQL)",
          "statuses": {
            "bacula": "not-documented",
            "bareos": "available",
            "kopia": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Interface and operations",
      "rows": [
        {
          "feature": "Graphical user interface",
          "statuses": {
            "bacula": "not-documented",
            "bareos": "available",
            "kopia": "available"
          },
          "note": "Bareos offers Bareos WebUI; Kopia ships KopiaUI, a native desktop app alongside its CLI."
        },
        {
          "feature": "Container/Kubernetes-native plugins",
          "statuses": {
            "bacula": "available",
            "bareos": "not-documented",
            "kopia": "not-documented"
          },
          "note": "Bacula documents native Kubernetes and Docker plugins; Kopia is used inside Kubernetes backup products via Kasten but does not itself document native K8s plugins."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the difference between Bacula and Bareos?",
      "answer": "Bareos is a 2010 fork of Bacula created by former Bacula developers and is now maintained independently by Bareos GmbH & Co. KG in Cologne, Germany. Both share similar core architecture for network backup and recovery, but they have diverged in features (Bareos documents database backup plugins and a web UI) and are maintained by separate organizations with separate commercial support offerings."
    },
    {
      "question": "Is Kopia's encryption stronger than Bacula's or Bareos's?",
      "answer": "Kopia is unique among the three in enforcing client-side, end-to-end encryption for every snapshot by design, with no option to create unencrypted backups. Bacula and Bareos document TLS and TLS-PSK encryption of data in transit between clients, servers and storage, but the provided data does not document mandatory client-side encryption of the backup content itself."
    },
    {
      "question": "Which tool is best for a home NAS or small self-hosted setup?",
      "answer": "Kopia is the most lightweight to adopt for individuals or small teams, with a CLI and a native GUI (KopiaUI) plus support for common backends like Backblaze B2 and local NAS storage, and no licensing cost beyond whatever storage backend you choose. Bacula and Bareos are built more for centralized, multi-client network backup infrastructure and have a steeper configuration learning curve for a single small setup."
    },
    {
      "question": "Can I get paid support for any of these tools?",
      "answer": "Yes for Bacula and Bareos. Bacula Systems SA sells a custom-quoted Enterprise Edition, and Bareos GmbH & Co. KG sells tiered annual subscriptions ranging from around 480 euros/year for tested packages up to 42,900 euros/year for global support with defined response times. Kopia has no vendor-sold support contract, though it receives ongoing engineering contributions from Kasten by Veeam."
    },
    {
      "question": "Do these tools back up databases like PostgreSQL or MySQL directly?",
      "answer": "Bareos documents dedicated plugins for backing up PostgreSQL and MySQL/MariaDB. Bacula's provided feature list does not document database-specific plugins, and Kopia is a general file/directory snapshot tool without documented database-specific plugins."
    },
    {
      "question": "Which of these three has the longest track record?",
      "answer": "Bacula is the oldest, with development beginning in 2000 and a first public release in 2002. Bareos followed as a fork in 2010. Kopia's founding year is not documented in the provided data, but it is a newer community project led by a Google engineer and sponsored in part by Kasten by Veeam."
    }
  ]
};

export default baculaVsBareosVsKopiaContent;
