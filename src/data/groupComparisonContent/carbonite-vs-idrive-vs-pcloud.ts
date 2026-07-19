import type { GroupComparisonContent } from './types';

const carboniteVsIdriveVsPcloudContent: GroupComparisonContent = {
  "verdict": "Carbonite, IDrive, and pCloud are all cloud backup and storage services, but they differ on how they handle device coverage, recovery, and payment structure. Carbonite offers unlimited storage on personal plans but covers only a single computer by default, with an optional physical courier recovery service. IDrive covers unlimited devices under one account at a low cost per terabyte and adds business-oriented object storage. pCloud stands apart by offering a one-time lifetime payment option instead of a recurring subscription, plus a choice of EU or US data center.",
  "bestFor": {
    "carbonite": "Individuals who want unlimited backup storage for a single computer with the option of physical courier recovery for large restores.",
    "idrive": "Households or small teams wanting one account that backs up unlimited devices at a low cost per terabyte, plus optional business object storage.",
    "pcloud": "Users who prefer a one-time lifetime payment over recurring subscriptions and want a choice of EU or US data center location."
  },
  "highlights": [
    {
      "title": "Unlimited Storage, One Computer",
      "description": "Carbonite's personal plans include unlimited storage regardless of data volume, but only cover a single computer by default.",
      "toolSlugs": [
        "carbonite"
      ]
    },
    {
      "title": "Unlimited Devices, One Account",
      "description": "IDrive lets a single account back up an unlimited number of devices, plus IDrive e2 object storage with no egress fees for business needs.",
      "toolSlugs": [
        "idrive"
      ]
    },
    {
      "title": "Lifetime Payment Option",
      "description": "pCloud is the only one of the three offering a one-time lifetime payment plan starting around $199, avoiding ongoing subscription costs entirely.",
      "toolSlugs": [
        "pcloud"
      ]
    },
    {
      "title": "Physical Recovery for Large Restores",
      "description": "Both Carbonite's Courier Recovery and IDrive Express offer physical shipment of restored data, avoiding slow downloads for large backups.",
      "toolSlugs": [
        "carbonite",
        "idrive"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage and Devices",
      "rows": [
        {
          "feature": "Unlimited storage on entry personal plan",
          "statuses": {
            "carbonite": "available",
            "idrive": "unavailable",
            "pcloud": "unavailable"
          },
          "note": "IDrive and pCloud use tiered storage allotments (10GB free up to multi-terabyte paid plans) rather than unlimited storage."
        },
        {
          "feature": "Multi-device backup under one account",
          "statuses": {
            "carbonite": "unavailable",
            "idrive": "available",
            "pcloud": "not-documented"
          },
          "note": "Carbonite's personal plans cover a single computer by default."
        }
      ]
    },
    {
      "group": "Recovery and Security",
      "rows": [
        {
          "feature": "Physical/courier data recovery",
          "statuses": {
            "carbonite": "available",
            "idrive": "available",
            "pcloud": "unavailable"
          }
        },
        {
          "feature": "Optional zero-knowledge/private-key encryption",
          "statuses": {
            "carbonite": "unavailable",
            "idrive": "available",
            "pcloud": "limited"
          },
          "note": "pCloud's Crypto zero-knowledge encryption is sold as a separate paid add-on."
        },
        {
          "feature": "File versioning",
          "statuses": {
            "carbonite": "limited",
            "idrive": "available",
            "pcloud": "not-documented"
          },
          "note": "Carbonite caps version history at the 12 most recent versions per file."
        }
      ]
    },
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "One-time lifetime payment option",
          "statuses": {
            "carbonite": "unavailable",
            "idrive": "unavailable",
            "pcloud": "available"
          }
        },
        {
          "feature": "Free plan to try before paying",
          "statuses": {
            "carbonite": "unavailable",
            "idrive": "available",
            "pcloud": "available"
          },
          "note": "IDrive and pCloud both offer 10GB free plans; Carbonite has no documented free tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which service offers a one-time lifetime payment instead of a subscription?",
      "answer": "pCloud is the only one of the three offering a one-time lifetime payment plan, starting around $199, as an alternative to its recurring subscription plans."
    },
    {
      "question": "Which backup tool covers unlimited devices under a single account?",
      "answer": "IDrive is built around this model, letting one account back up an unlimited number of devices, unlike Carbonite's personal plans which cover a single computer by default."
    },
    {
      "question": "Do these services offer physical recovery for large restores?",
      "answer": "Carbonite and IDrive both offer a physical courier recovery option (Carbonite's Courier Recovery and IDrive Express) for restoring large data sets without a slow download. pCloud does not document an equivalent service."
    },
    {
      "question": "Which has a free plan to try before paying?",
      "answer": "IDrive and pCloud both offer a free plan with 10GB of storage. Carbonite does not document a free tier, with its lowest plan starting at $4.91 per month billed annually."
    },
    {
      "question": "Is encryption included by default or a paid add-on?",
      "answer": "Carbonite includes 256-bit encryption by default, and IDrive offers an optional private encryption key at no extra documented cost, while pCloud's zero-knowledge Crypto encryption is sold as a separate paid add-on."
    },
    {
      "question": "Does Carbonite's unlimited storage cover more than one computer?",
      "answer": "Not on personal plans by default; Carbonite's personal plans are scoped to a single computer, so backing up multiple computers requires additional plans or its separate business/server offerings."
    }
  ]
};

export default carboniteVsIdriveVsPcloudContent;
