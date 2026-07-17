import type { ToolComparisonContent } from './types';

const immichVsWetransferContent: ToolComparisonContent = {
  "verdict": "Immich is a free, open-source, self-hosted photo and video backup application that you run on your own server via Docker, built as an alternative to cloud photo storage services; WeTransfer is a hosted service for sending large files and sharing photos, videos, and documents via expiring links, not a photo library or backup tool. Immich is about long-term, private ownership of your photo library, while WeTransfer is about quick, one-off delivery of files to someone else.",
  "bestForToolA": "People who want full control over their photo and video library and its storage location, willing to self-host via Docker (recommended minimum 6GB RAM, 2 CPU cores, PostgreSQL) with automatic mobile backup and facial clustering for organization.",
  "bestForToolB": "Anyone needing to send large files or share media with a recipient who shouldn't need an account, using a free tier for occasional transfers and paid tiers (Starter at $6.99/month, Ultimate at $25/month) for higher volume and longer link expiration.",
  "whoNeedsBoth": "Someone could run Immich as their permanent, self-hosted photo library with automatic mobile backup, and still reach for WeTransfer whenever they need to send a batch of photos to a friend or client who doesn't have access to their private Immich server.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "An ongoing photo and video library and backup application built to organize, store, and let you browse your media long-term.",
      "toolB": "A one-off file transfer and sharing tool where links and files expire by design.",
      "whyItMatters": "One tool is built for permanent storage; the other explicitly is not.",
      "benefitsWho": "People wanting a private, lasting photo archive (Immich) versus people needing to hand off files once (WeTransfer)."
    },
    {
      "title": "Hosting Model",
      "toolA": "Self-hosted only, deployed via Docker on your own infrastructure with no official managed cloud version; users are responsible for their own server maintenance, backups, and updates.",
      "toolB": "Fully hosted SaaS, with no self-hosting option and nothing to maintain.",
      "whyItMatters": "Self-hosting means full data ownership but real operational responsibility.",
      "benefitsWho": "Privacy-focused, technically capable users (Immich) versus users wanting zero setup (WeTransfer)."
    },
    {
      "title": "Pricing",
      "toolA": "Entirely free and open source under the AGPL v3 license, with no paid tiers at all.",
      "toolB": "Freemium: a free tier (10 transfers or 3GB per 30 days), then Starter at $6.99/month, Ultimate at $25/month (includes cloud storage), and custom Teams.",
      "whyItMatters": "Immich has zero software licensing cost, though self-hosting carries its own infrastructure costs, while WeTransfer's paid tiers unlock higher volume and longer-lived links.",
      "benefitsWho": "Budget-conscious self-hosters (Immich) versus those willing to pay for a managed, no-maintenance service (WeTransfer)."
    },
    {
      "title": "Organization Features",
      "toolA": "Web interface for browsing and organizing a media library, facial clustering to group photos, and multi-user support for adding accounts on the same server.",
      "toolB": "Collect moodboards for organizing shareable visual boards and transfer tracking to see when files were opened or downloaded, but not documented as a persistent, searchable photo library.",
      "whyItMatters": "Immich is built around long-term browsing and organization, while WeTransfer is built around tracking a single delivery.",
      "benefitsWho": "People managing thousands of personal photos (Immich) versus people needing delivery confirmation on a single send (WeTransfer)."
    },
    {
      "title": "Mobile Apps",
      "toolA": "Apps on the Apple App Store, Google Play, and F-Droid with automatic selective backup from the device.",
      "toolB": "Native iOS, Android, and Mac menu-bar apps for sending files without opening a browser.",
      "whyItMatters": "Both have mobile apps, but for different jobs: automatic ongoing backup versus manual file sending.",
      "benefitsWho": "People wanting their phone's camera roll backed up automatically (Immich) versus people who frequently need to send files from their phone (WeTransfer)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage & Organization",
      "rows": [
        {
          "feature": "Persistent photo/video library",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "WeTransfer files/links expire by design"
        },
        {
          "feature": "Facial clustering/organization tools",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Multi-user accounts on one instance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Automatic mobile backup",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "WeTransfer is manual sending, not automatic backup"
        }
      ]
    },
    {
      "group": "Sharing & Delivery",
      "rows": [
        {
          "feature": "No-account file delivery to recipients",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Password-protected sharing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Transfer/download tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "File requests (inbound collection links)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Fully free, no paid tiers vs. limited free plan"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Docker required, no managed cloud version"
        },
        {
          "feature": "Paid managed plans",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Starter $6.99, Ultimate $25, Teams custom"
        },
        {
          "feature": "Included cloud storage",
          "toolA": "available",
          "toolB": "available",
          "note": "Self-hosted storage vs. WeTransfer Ultimate plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Immich free?",
      "answer": "Yes, it's free and open-source software under the AGPL v3 license, with no paid tiers."
    },
    {
      "question": "Is WeTransfer free to use?",
      "answer": "Yes, the free plan allows up to 10 transfers or 3GB total every 30 days, with no recipient account required."
    },
    {
      "question": "Does Immich have a managed cloud version?",
      "answer": "No, it requires self-hosting via Docker; there's no official managed cloud version, so users are responsible for their own server maintenance, backups, and updates."
    },
    {
      "question": "Can multiple people use one Immich server?",
      "answer": "Yes, an admin user can create and manage additional user accounts on the same server."
    },
    {
      "question": "Is WeTransfer suited for long-term photo storage?",
      "answer": "No. Per WeTransfer's own listed limitations, files and links expire by design, so it isn't suited to long-term storage or archiving, unlike Immich, which is built to be a permanent library."
    },
    {
      "question": "What are the server requirements for Immich?",
      "answer": "A minimum of 6GB RAM and 2 CPU cores, Docker, and a PostgreSQL database."
    }
  ]
};

export default immichVsWetransferContent;
