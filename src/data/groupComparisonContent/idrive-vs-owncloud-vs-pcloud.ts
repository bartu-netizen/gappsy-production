import type { GroupComparisonContent } from './types';

const idriveVsOwncloudVsPcloudContent: GroupComparisonContent = {
  "verdict": "IDrive, ownCloud, and pCloud all fall under cloud storage, but they solve different problems for different buyers. IDrive is built for low-cost, ransomware-resistant backup across an unlimited number of devices on a single account. ownCloud is the only genuinely self-hosted, on-premises option of the three, aimed at organizations with strict data-sovereignty or GDPR requirements. pCloud stands apart on pricing model, offering one-time lifetime payment plans as an alternative to the recurring subscriptions that dominate cloud storage.",
  "bestFor": {
    "idrive": "Budget-conscious individuals and small teams who want unlimited-device backup with ransomware-resistant snapshots at a low per-terabyte price.",
    "owncloud": "Organizations with strict data-sovereignty or GDPR compliance needs that want a fully self-hosted, on-premises file platform they control end to end.",
    "pcloud": "Users who want to avoid recurring subscription fees via a one-time lifetime payment for cloud storage, with a choice of EU or US data centers."
  },
  "highlights": [
    {
      "title": "pCloud's lifetime plans are unusual in cloud storage",
      "description": "pCloud lets users pay once for 500GB, 2TB, or 10TB of storage that lasts as long as the service operates, an option neither IDrive nor ownCloud offers in the same form.",
      "toolSlugs": [
        "pcloud"
      ]
    },
    {
      "title": "ownCloud is the only self-hosted option of the three",
      "description": "ownCloud runs entirely on infrastructure the organization controls, giving it a distinct data-sovereignty position that cloud-hosted IDrive and pCloud can't match.",
      "toolSlugs": [
        "owncloud"
      ]
    },
    {
      "title": "IDrive undercuts on backup cost for many devices",
      "description": "IDrive's personal plans back up an unlimited number of computers, phones, and external drives under a single account and storage allowance, at a low cost per terabyte compared to typical backup competitors.",
      "toolSlugs": [
        "idrive"
      ]
    },
    {
      "title": "Encryption approaches differ across all three",
      "description": "IDrive includes an optional private encryption key at no extra cost, ownCloud offers end-to-end encryption on its Enterprise tiers, and pCloud sells its zero-knowledge Crypto encryption as a separate paid add-on rather than including it by default.",
      "toolSlugs": [
        "idrive",
        "owncloud",
        "pcloud"
      ]
    },
    {
      "title": "Pricing structures carry different gotchas",
      "description": "IDrive's renewal pricing can jump significantly after the first promotional year, ownCloud's paid tiers require a minimum of 25 users on annual billing, and pCloud's lifetime plans require a large upfront payment.",
      "toolSlugs": [
        "idrive",
        "owncloud",
        "pcloud"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage Model and Pricing",
      "rows": [
        {
          "feature": "Self-hosted or on-premises deployment",
          "statuses": {
            "idrive": "unavailable",
            "owncloud": "available",
            "pcloud": "unavailable"
          }
        },
        {
          "feature": "One-time lifetime payment option",
          "statuses": {
            "idrive": "unavailable",
            "owncloud": "unavailable",
            "pcloud": "available"
          }
        },
        {
          "feature": "Free hosted storage tier",
          "statuses": {
            "idrive": "available",
            "owncloud": "not-documented",
            "pcloud": "available"
          },
          "note": "ownCloud's free Community edition is self-hosted, so it doesn't offer a comparable free hosted-storage allowance."
        }
      ]
    },
    {
      "group": "Data Control and Security",
      "rows": [
        {
          "feature": "Client-side or end-to-end encryption available",
          "statuses": {
            "idrive": "available",
            "owncloud": "available",
            "pcloud": "limited"
          },
          "note": "pCloud's zero-knowledge Crypto encryption is a separate paid add-on rather than a default inclusion."
        },
        {
          "feature": "EU data residency option",
          "statuses": {
            "idrive": "not-documented",
            "owncloud": "available",
            "pcloud": "available"
          }
        },
        {
          "feature": "File versioning",
          "statuses": {
            "idrive": "available",
            "owncloud": "not-documented",
            "pcloud": "available"
          }
        }
      ]
    },
    {
      "group": "Platform and Access",
      "rows": [
        {
          "feature": "Unlimited devices per single account",
          "statuses": {
            "idrive": "available",
            "owncloud": "not-documented",
            "pcloud": "not-documented"
          }
        },
        {
          "feature": "Continuous cross-platform sync",
          "statuses": {
            "idrive": "available",
            "owncloud": "available",
            "pcloud": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is truly self-hosted?",
      "answer": "Only ownCloud. It runs on infrastructure the organization controls, whether on-premises or private cloud, while IDrive and pCloud are both cloud-hosted services."
    },
    {
      "question": "Which avoids recurring subscription fees?",
      "answer": "pCloud, through its one-time lifetime payment plans for 500GB, 2TB, or 10TB of storage, an alternative to the monthly or annual billing that IDrive and ownCloud rely on."
    },
    {
      "question": "Which is cheapest for backing up many devices?",
      "answer": "IDrive, since its personal plans back up an unlimited number of computers, phones, and external drives under a single account and storage allowance at a low cost per terabyte."
    },
    {
      "question": "Is encryption included by default on all three?",
      "answer": "IDrive includes an optional private encryption key at no extra cost, and ownCloud offers end-to-end encryption on its paid Enterprise tiers. pCloud sells its zero-knowledge Crypto encryption as a separate paid add-on rather than including it by default."
    },
    {
      "question": "Which is best for GDPR or EU compliance requirements?",
      "answer": "ownCloud, as a German-based company offering on-premises or EU-hosted deployment, is the strongest fit. pCloud also offers a choice of EU (Luxembourg) or US data centers, giving it a secondary option for EU data residency."
    },
    {
      "question": "How do the free tiers compare?",
      "answer": "IDrive's free Basic plan offers 10GB of storage, and pCloud's free plan also offers 10GB. ownCloud's free Community edition is self-hosted with unlimited users, so its 'free' tier depends on infrastructure the organization provides rather than a hosted storage allowance."
    }
  ]
};

export default idriveVsOwncloudVsPcloudContent;
