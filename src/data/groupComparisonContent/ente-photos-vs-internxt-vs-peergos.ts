import type { GroupComparisonContent } from './types';

const entePhotosVsInternxtVsPeergosContent: GroupComparisonContent = {
  "verdict": "All three are privacy-first alternatives to mainstream cloud storage that keep data encrypted before it leaves the user's device, but they are not interchangeable. Ente Photos is the most polished option if photo and video backup with on-device face recognition and search is the main job, Internxt is the more general-purpose encrypted drive with post-quantum cryptography, compliance certifications and one-time lifetime plans, and Peergos is the deepest privacy option, fully open source and free, extending encryption to metadata and adding built-in messaging and social features for technically comfortable users. The right pick depends on whether the priority is a consumer photo library, an all-around encrypted drive with business-grade compliance, or a completely free, self-hostable, community-run platform.",
  "bestFor": {
    "ente-photos": "Individuals and families who want a polished, independently audited, end-to-end encrypted replacement for Google Photos or iCloud Photos, with on-device face recognition and family storage sharing.",
    "internxt": "Users who want general-purpose encrypted cloud storage with post-quantum cryptography, formal compliance certifications, and the option of a one-time lifetime storage payment instead of a recurring subscription.",
    "peergos": "Privacy-conscious, technically comfortable users who want a fully open-source, free platform that combines encrypted file storage with private messaging and social networking, self-hosted or via the free public beta."
  },
  "highlights": [
    {
      "title": "Ente Photos focuses specifically on photo and video backup",
      "description": "Ente is built around a Google Photos or iCloud Photos replacement, with on-device face recognition and a CLIP-powered magic search that never sends unencrypted data to Ente's servers, plus family plans that split a single quota across up to five members.",
      "toolSlugs": [
        "ente-photos"
      ]
    },
    {
      "title": "Internxt adds post-quantum encryption and compliance certifications",
      "description": "Internxt layers post-quantum cryptography on top of standard AES-256 zero-knowledge encryption and holds GDPR, HIPAA, ISO 27001 and SOC 2 compliance backed by independent penetration testing, plus bundled Send, Meet and Mail apps and one-time lifetime plans up to 50TB.",
      "toolSlugs": [
        "internxt"
      ]
    },
    {
      "title": "Peergos is the only fully free, no-company option",
      "description": "As a volunteer-driven open-source project, Peergos has no subscription pricing at all: users get client-side encrypted storage, a secure messenger, encrypted email and a private social layer for free, either self-hosted or through the public beta.",
      "toolSlugs": [
        "peergos"
      ]
    },
    {
      "title": "Both Ente Photos and Peergos support genuine self-hosting",
      "description": "Technically inclined users can run their own server for either tool using the same open-source codebase that powers the hosted service, while Internxt offers no self-hosted deployment option.",
      "toolSlugs": [
        "ente-photos",
        "peergos"
      ]
    },
    {
      "title": "Free tiers differ significantly in size and shape",
      "description": "Ente Photos gives 10GB free with annual account activity, Internxt gives 1GB free for life, and Peergos is free indefinitely through self-hosting or the public beta rather than a capped storage allowance.",
      "toolSlugs": [
        "ente-photos",
        "internxt",
        "peergos"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Encryption and Security",
      "rows": [
        {
          "feature": "End-to-end / zero-knowledge encryption",
          "statuses": {
            "ente-photos": "available",
            "internxt": "available",
            "peergos": "available"
          },
          "note": "Ente uses libsodium (XChaCha20-Poly1305, Argon2id); Internxt uses zero-knowledge AES-256; Peergos uses TweetNaCl with 5MiB encrypted chunks."
        },
        {
          "feature": "Independent third-party security audit",
          "statuses": {
            "ente-photos": "available",
            "internxt": "available",
            "peergos": "available"
          },
          "note": "Ente was audited by Cure53, Symbolic Software and Fallible; Internxt's compliance is backed by independent penetration testing; Peergos was audited by Cure53."
        },
        {
          "feature": "Post-quantum cryptography",
          "statuses": {
            "ente-photos": "not-documented",
            "internxt": "available",
            "peergos": "not-documented"
          }
        },
        {
          "feature": "Encrypted metadata (filenames, structure)",
          "statuses": {
            "ente-photos": "available",
            "internxt": "not-documented",
            "peergos": "available"
          },
          "note": "Peergos explicitly protects filenames, file sizes, directory structure and social graph, not just file contents; Ente encrypts metadata alongside media."
        }
      ]
    },
    {
      "group": "Storage and Deployment",
      "rows": [
        {
          "feature": "Free plan storage",
          "statuses": {
            "ente-photos": "available",
            "internxt": "available",
            "peergos": "available"
          },
          "note": "Ente: 10GB (requires annual activity); Internxt: 1GB for life; Peergos: free via self-hosting or the public beta, not capped by a fixed quota."
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "ente-photos": "available",
            "internxt": "unavailable",
            "peergos": "available"
          }
        },
        {
          "feature": "One-time lifetime storage plans",
          "statuses": {
            "ente-photos": "unavailable",
            "internxt": "available",
            "peergos": "unavailable"
          },
          "note": "Ente and Peergos are subscription or self-hosted only; Internxt offers lifetime plans from $450-$950 for up to 50TB."
        }
      ]
    },
    {
      "group": "Feature Scope",
      "rows": [
        {
          "feature": "Photo-specific tools (face recognition, magic search)",
          "statuses": {
            "ente-photos": "available",
            "internxt": "unavailable",
            "peergos": "unavailable"
          }
        },
        {
          "feature": "Built-in messaging or social features",
          "statuses": {
            "ente-photos": "unavailable",
            "internxt": "limited",
            "peergos": "available"
          },
          "note": "Internxt bundles Meet (video calls) and Mail (encrypted email) but no social layer; Peergos includes a messenger, encrypted email and a private social network with hidden friendship graphs."
        },
        {
          "feature": "Formal compliance certifications (GDPR, HIPAA, SOC 2, ISO 27001)",
          "statuses": {
            "ente-photos": "not-documented",
            "internxt": "available",
            "peergos": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is cheapest for basic encrypted storage?",
      "answer": "Peergos is free with no subscription at all, whether self-hosted or via the public beta. Among paid options, Internxt's Essential plan starts around $1-3 per month for 1TB, while Ente Photos starts around $2.49-$2.99 per month for 50GB, so Internxt offers more storage per dollar at the entry tier, while Ente's free 10GB tier is larger than Internxt's free 1GB."
    },
    {
      "question": "Is Ente Photos good for storing files other than photos and videos?",
      "answer": "Ente Photos is purpose-built around photo and video backup, sharing and on-device search rather than general file storage. Users who need to store arbitrary documents and files alongside encrypted media may find Internxt's general-purpose cloud drive or Peergos' encrypted filesystem a better fit."
    },
    {
      "question": "Can I really use Peergos for free forever?",
      "answer": "Yes. Peergos is a volunteer-driven open-source project with no subscription pricing. Users can either self-host their own instance on local disk or S3-compatible storage, or use the free public beta at peergos.net, with cost limited only to whatever infrastructure a self-hoster chooses to run."
    },
    {
      "question": "Which tool has the strongest encryption guarantees?",
      "answer": "All three implement true end-to-end or zero-knowledge encryption verified by independent audits: Ente Photos by Cure53, Symbolic Software and Fallible; Internxt with penetration testing behind its GDPR, HIPAA, ISO 27001 and SOC 2 compliance; and Peergos by Cure53. Peergos goes furthest by also encrypting metadata like filenames and the social graph, while Internxt is the only one of the three to add a post-quantum cryptography layer."
    },
    {
      "question": "Do any of these support self-hosting instead of a hosted subscription?",
      "answer": "Ente Photos and Peergos both offer genuine self-hosting: technically inclined users can deploy their own server from the same open-source codebase that powers the hosted service. Internxt does not offer a self-hosted deployment option; it is available only as a hosted service."
    },
    {
      "question": "Which is best for a family that wants to share storage?",
      "answer": "Ente Photos has a dedicated family plan that lets a paid subscriber share their storage quota with up to five additional family members, each getting their own private encrypted space. Internxt and Peergos do not document an equivalent multi-member family sharing feature in the same way."
    }
  ]
};

export default entePhotosVsInternxtVsPeergosContent;
