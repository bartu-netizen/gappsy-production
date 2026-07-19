import type { GroupComparisonContent } from './types';

const idriveVsPcloudVsWetransferContent: GroupComparisonContent = {
  "verdict": "IDrive, pCloud, and WeTransfer are all consumer and small-business cloud file services with free entry tiers and mobile apps, but each optimizes for a different job. IDrive is built around continuous, versioned backup of unlimited devices; pCloud is general-purpose cloud storage and sync with a rare one-time lifetime payment option; and WeTransfer is a frictionless tool for sending large files once rather than storing them long term. Someone deciding how to protect, store, or share files will often weigh all three depending on whether the priority is backup, everyday storage, or ad hoc sharing.",
  "bestFor": {
    "idrive": "Individuals or small teams who want affordable, unlimited-device backup with ransomware-resistant versioning.",
    "pcloud": "Users who want everyday cloud storage and sync with the option to pay once for lifetime access instead of a recurring subscription.",
    "wetransfer": "Creative professionals who need to send large files like videos and design assets quickly without needing long-term storage."
  },
  "highlights": [
    {
      "title": "Backup-first architecture",
      "description": "IDrive is built around continuous, incremental backup of an unlimited number of devices under a single account, with 30 days of file versioning to recover from ransomware or accidental deletion.",
      "toolSlugs": [
        "idrive"
      ]
    },
    {
      "title": "A genuine lifetime payment option",
      "description": "pCloud is one of the few major providers offering a one-time lifetime purchase for 500GB, 2TB, or 10TB of storage instead of an ongoing subscription.",
      "toolSlugs": [
        "pcloud"
      ]
    },
    {
      "title": "Zero-friction large file sharing",
      "description": "WeTransfer requires no account for basic transfers and is purpose-built for one-off delivery of large creative files, with transfers that expire rather than functioning as permanent storage.",
      "toolSlugs": [
        "wetransfer"
      ]
    },
    {
      "title": "Free entry tiers across all three",
      "description": "Each service offers a usable free plan, though the limits differ significantly: IDrive caps free storage at 10GB, pCloud also starts at 10GB, and WeTransfer's free transfers are capped and expire within a rolling 30-day window.",
      "toolSlugs": [
        "idrive",
        "pcloud",
        "wetransfer"
      ]
    },
    {
      "title": "Cross-platform mobile access",
      "description": "All three ship native iOS and Android apps alongside desktop and web access, so files can be backed up, stored, or sent from a phone as easily as a computer.",
      "toolSlugs": [
        "idrive",
        "pcloud",
        "wetransfer"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Continuous automatic device backup",
          "statuses": {
            "idrive": "available",
            "pcloud": "limited",
            "wetransfer": "unavailable"
          },
          "note": "pCloud offers automatic backup of specific folders and connected cloud accounts, not full-device continuous backup like IDrive."
        },
        {
          "feature": "Persistent bidirectional file sync across devices",
          "statuses": {
            "idrive": "limited",
            "pcloud": "available",
            "wetransfer": "limited"
          },
          "note": "WeTransfer's paid plans add cloud storage, but its core product remains one-off transfer rather than ongoing sync."
        }
      ]
    },
    {
      "group": "Storage and Versioning",
      "rows": [
        {
          "feature": "File versioning and history",
          "statuses": {
            "idrive": "available",
            "pcloud": "available",
            "wetransfer": "not-documented"
          },
          "note": "IDrive keeps 30 days of file versioning; pCloud extends versioning further on its Premium Plus tier."
        },
        {
          "feature": "Large single-transfer file size (multi-gigabyte and up)",
          "statuses": {
            "idrive": "not-documented",
            "pcloud": "not-documented",
            "wetransfer": "available"
          },
          "note": "WeTransfer's Ultimate plan supports individual transfers up to 1TB."
        }
      ]
    },
    {
      "group": "Security and Privacy",
      "rows": [
        {
          "feature": "Zero-knowledge or private-key encryption",
          "statuses": {
            "idrive": "available",
            "pcloud": "available",
            "wetransfer": "not-documented"
          },
          "note": "IDrive offers an optional private encryption key at no extra cost; pCloud sells zero-knowledge encryption as a separate paid Crypto add-on."
        },
        {
          "feature": "Password-protected sharing links",
          "statuses": {
            "idrive": "not-documented",
            "pcloud": "available",
            "wetransfer": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "One-time lifetime payment option",
          "statuses": {
            "idrive": "unavailable",
            "pcloud": "available",
            "wetransfer": "unavailable"
          }
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "idrive": "available",
            "pcloud": "available",
            "wetransfer": "available"
          },
          "note": "IDrive and pCloud both offer 10GB free; WeTransfer's free tier is capped at roughly 3GB across any rolling 30-day period."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is a true backup solution rather than just storage?",
      "answer": "IDrive, since it is built around continuous, versioned backup of an unlimited number of devices under one account, with 30 days of file history for ransomware recovery."
    },
    {
      "question": "Can I pay once instead of a monthly subscription with any of these?",
      "answer": "Yes, pCloud is the only one of the three offering one-time lifetime plans for 500GB, 2TB, or 10TB of storage."
    },
    {
      "question": "Is WeTransfer good for long-term file storage?",
      "answer": "Not really. Free transfers expire after a set period, and even WeTransfer's paid plans are built primarily around sending files rather than acting as a permanent archive."
    },
    {
      "question": "Do any of these offer zero-knowledge encryption?",
      "answer": "IDrive lets you set a private encryption key at no extra cost, and pCloud sells zero-knowledge encryption as a separate paid Crypto add-on; WeTransfer does not document this capability."
    },
    {
      "question": "Which is best for someone who just needs to send a few large files occasionally?",
      "answer": "WeTransfer, since its free plan covers occasional transfers up to 2GB without requiring an account, making it the simplest option for infrequent large-file sharing."
    },
    {
      "question": "Do all three have mobile apps?",
      "answer": "Yes, IDrive, pCloud, and WeTransfer all offer native iOS and Android apps alongside desktop and web access."
    }
  ]
};

export default idriveVsPcloudVsWetransferContent;
