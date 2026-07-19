import type { GroupComparisonContent } from './types';

const entePhotosVsFilerunVsInternxtContent: GroupComparisonContent = {
  "verdict": "The right pick here depends on what you are protecting and how much infrastructure you want to manage. Ente Photos and Internxt both offer genuine zero-knowledge encryption backed by independent audits, but Ente is purpose-built for photos and videos while Internxt handles general files and adds a one-time lifetime payment option. FileRun takes a different path entirely: it is not an encrypted cloud service but a self-hosted, Drive-like file manager you install on your own server or NAS, trading zero-knowledge encryption for full infrastructure control and per-user, rather than per-gigabyte, pricing. Buyers who specifically want a 'never trust the provider' privacy model should compare Ente against Internxt; buyers who already run a NAS or server and just want a nicer file-sharing front end should look at FileRun instead.",
  "bestFor": {
    "ente-photos": "Privacy-conscious individuals and families who specifically need photo and video backup with audited end-to-end encryption, on-device face recognition, and family storage sharing, and who are willing to pay a monthly or annual subscription for it.",
    "filerun": "Small businesses, agencies, and NAS owners who want a polished, Drive-like file manager running on infrastructure they already control, billed per user per year rather than per gigabyte, with office-suite editing built in.",
    "internxt": "Users who want general-purpose, not just photo, zero-knowledge encrypted cloud storage with a hosted, no-maintenance experience, GDPR/HIPAA/SOC2 compliance, and the option to pay once for lifetime storage instead of a recurring subscription."
  },
  "highlights": [
    {
      "title": "Ente and Internxt both pass independent security audits",
      "description": "Ente's encryption has been audited by Cure53, Symbolic Software, and Fallible, while Internxt has undergone penetration testing by Securitum and holds GDPR, HIPAA, ISO 27001, and SOC 2 certifications. FileRun's provided data does not document a comparable third-party security audit.",
      "toolSlugs": [
        "ente-photos",
        "internxt"
      ]
    },
    {
      "title": "FileRun is the only one built to run on your own server or NAS",
      "description": "FileRun installs on infrastructure you already control, including Linux, Windows, or a NAS like Synology, Unraid, or TrueNAS, and charges a flat per-user annual fee rather than a per-gigabyte storage fee. Ente offers self-hosting as an option alongside its hosted service, while Internxt is hosted-only in the provided data.",
      "toolSlugs": [
        "filerun",
        "ente-photos"
      ]
    },
    {
      "title": "Ente is the only one of the three focused specifically on photos and videos",
      "description": "Ente Photos is purpose-built as a Google Photos and iCloud Photos alternative with on-device face recognition and CLIP-powered magic search on mobile and desktop. Internxt and FileRun are general-purpose file storage and management tools that handle any file type.",
      "toolSlugs": [
        "ente-photos"
      ]
    },
    {
      "title": "Internxt and FileRun both offer one-time, non-recurring payment options",
      "description": "Internxt sells lifetime storage plans from roughly $450 to $950 covering up to 50TB with no recurring fees, and FileRun's Family license is a one-time EUR99 payment, though it is restricted to non-commercial use. Ente's paid tiers in the provided data are subscription-only.",
      "toolSlugs": [
        "internxt",
        "filerun",
        "ente-photos"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Encryption and Privacy",
      "rows": [
        {
          "feature": "End-to-end / zero-knowledge encryption",
          "statuses": {
            "ente-photos": "available",
            "filerun": "not-documented",
            "internxt": "available"
          },
          "note": "Ente and Internxt encrypt files client-side before upload; FileRun's documentation describes standard file storage on your own server rather than zero-knowledge encryption."
        },
        {
          "feature": "Open-source codebase",
          "statuses": {
            "ente-photos": "available",
            "filerun": "unavailable",
            "internxt": "limited"
          },
          "note": "Ente publishes its full stack, including the server, under AGPL-3.0. Internxt publishes much of its client-side code as open source. FileRun is closed-source, ionCube-protected commercial software."
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "ente-photos": "available",
            "filerun": "available",
            "internxt": "unavailable"
          },
          "note": "FileRun is inherently self-hosted on your own server or NAS. Ente offers an optional self-hosted deployment path alongside its hosted service. Internxt is hosted-only in the provided data."
        },
        {
          "feature": "Independent third-party security audit",
          "statuses": {
            "ente-photos": "available",
            "filerun": "not-documented",
            "internxt": "available"
          }
        }
      ]
    },
    {
      "group": "Storage and Access",
      "rows": [
        {
          "feature": "Native desktop and mobile sync apps",
          "statuses": {
            "ente-photos": "available",
            "filerun": "available",
            "internxt": "available"
          }
        },
        {
          "feature": "NAS deployment support (Synology, Unraid, TrueNAS)",
          "statuses": {
            "ente-photos": "not-documented",
            "filerun": "available",
            "internxt": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Sharing and Pricing",
      "rows": [
        {
          "feature": "Family or multi-user plan sharing",
          "statuses": {
            "ente-photos": "available",
            "filerun": "available",
            "internxt": "not-documented"
          },
          "note": "FileRun's Family license covers up to 5 accounts but is restricted to non-commercial use."
        },
        {
          "feature": "One-time / lifetime pricing option",
          "statuses": {
            "ente-photos": "unavailable",
            "filerun": "available",
            "internxt": "available"
          },
          "note": "Ente's paid tiers in the provided data are subscription-only; self-hosting is free but requires running your own server."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools actually encrypts files so the provider cannot read them?",
      "answer": "Ente Photos and Internxt both use client-side, zero-knowledge encryption verified by independent audits. FileRun's documentation describes standard file storage on your own server rather than end-to-end encryption, since the files never leave infrastructure you control."
    },
    {
      "question": "Can I avoid a monthly subscription with any of these?",
      "answer": "Internxt sells one-time lifetime storage plans from about $450 to $950 for up to 50TB, and FileRun's Family license is a one-time EUR99 payment for personal, non-commercial use. Ente's paid plans in the provided data are subscription-only, though its self-hosted option is free if you run your own server."
    },
    {
      "question": "Which tool is best if I only need to back up photos and videos, not general files?",
      "answer": "Ente Photos is purpose-built for this, with on-device face recognition and semantic search. FileRun and Internxt both handle any file type but do not offer Ente's photo-specific machine learning features."
    },
    {
      "question": "Do I need to manage my own server with any of these?",
      "answer": "FileRun requires installing and maintaining it on your own Linux or Windows server, VPS, or NAS. Ente Photos and Internxt are both usable as fully hosted services out of the box, though Ente also offers self-hosting for those who want it."
    },
    {
      "question": "Which one is fully open source?",
      "answer": "Ente publishes its entire stack, including the server, under the AGPL-3.0 license. Internxt publishes much of its client-side code as open source. FileRun is closed-source, commercially licensed software."
    }
  ]
};

export default entePhotosVsFilerunVsInternxtContent;
