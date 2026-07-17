import type { ToolComparisonContent } from './types';

const dropboxVsGoogleDriveContent: ToolComparisonContent = {
  "verdict": "Dropbox and Google Drive both market themselves as cloud storage, but the documented facts show they solve different problems. Dropbox is a file-sync and document-workflow tool: its verified features center on built-in e-signatures, PDF editing on paid plans, and file recovery, aimed at people who want a dedicated sync layer with light document tooling attached. Its free Basic plan is capped at just 2GB, which functions more like a trial than a usable everyday tier. Google Drive is documented as the storage layer underneath an entire productivity suite, with real-time collaborative editing in Docs, Sheets, and Slides, shared drives for teams, granular sharing controls, AI powered search, offline access, and admin and security controls on Workspace tiers. It also ships with 15GB of free storage, though that allotment is shared with Gmail and Google Photos rather than dedicated solely to files. Neither tool clearly beats the other across the board: Dropbox documents strengths in signing and editing documents in place, while Google Drive documents strengths in real-time teamwork, search, and integrations. The right pick depends on whether the job is storing and signing files cleanly, or collaborating on living documents inside a broader productivity ecosystem. Many buyers will find their actual need sits closer to one of these two poles than to some generic notion of cloud storage.",
  "bestForToolA": "Dropbox fits individuals or teams who primarily need reliable file sync plus lightweight document workflows, such as sending files for e-signature or editing PDFs, without adopting a full productivity suite.",
  "bestForToolB": "Google Drive fits individuals, teams, and organizations already using or wanting Docs, Sheets, Slides, Gmail, and Meet, especially those that need real-time collaborative editing, shared drives, and Workspace-level admin controls.",
  "whoNeedsBoth": "Organizations that receive files from external partners who standardize on Dropbox, while running their own internal collaboration and email on Google Workspace, would reasonably end up using both tools side by side.",
  "keyDifferences": [
    {
      "title": "Free tier storage",
      "toolA": "Dropbox Basic gives just 2GB of free storage",
      "toolB": "Google Drive gives 15GB of free storage, shared across Drive, Gmail, and Google Photos",
      "whyItMatters": "A 2GB cap is unworkable for most ongoing file storage needs, while 15GB is usable for light to moderate personal use even though it is shared across services",
      "benefitsWho": "Casual and budget-conscious users benefit more from Google Drive's larger free allotment"
    },
    {
      "title": "Core product focus",
      "toolA": "Dropbox's documented features are e-signatures, PDF editing, and file recovery layered on top of file storage and sync",
      "toolB": "Google Drive's documented features are built around real-time collaborative document editing integrated with Docs, Sheets, and Slides",
      "whyItMatters": "One tool is oriented around moving and signing static files, the other around collaboratively creating and editing documents",
      "benefitsWho": "Document-signing-heavy workflows favor Dropbox; live co-authoring workflows favor Google Drive"
    },
    {
      "title": "Entry-level paid pricing",
      "toolA": "Dropbox Plus starts at $9.99 per month",
      "toolB": "Google One 100GB starts at $1.99 per month",
      "whyItMatters": "The lowest paid tier price point differs substantially, affecting cost for individuals who need more than the free allotment",
      "benefitsWho": "Price-sensitive individual users benefit from Google Drive's lower entry price"
    },
    {
      "title": "Built-in e-signatures",
      "toolA": "Dropbox documents built-in e-signature support so users can sign and send documents without a separate tool",
      "toolB": "Not documented in Google Drive's provided facts",
      "whyItMatters": "Needing a separate e-signature tool adds cost and workflow steps",
      "benefitsWho": "Users who regularly send documents for signature benefit from Dropbox's built-in support"
    },
    {
      "title": "Real-time collaborative editing",
      "toolA": "Not documented in Dropbox's provided facts",
      "toolB": "Google Drive documents real-time collaborative editing with live cursors, comments, and suggestions in Docs, Sheets, and Slides",
      "whyItMatters": "Simultaneous multi-user editing is central to many modern team workflows",
      "benefitsWho": "Teams that co-author documents together benefit from Google Drive"
    },
    {
      "title": "Business and team plan structure",
      "toolA": "Dropbox offers per-user monthly team plans: Standard at $12 per user per month and Advanced at $18 per user per month",
      "toolB": "Google Drive's business tier, Google Workspace Business Starter, is $6 per user per month with an annual commitment and includes 30GB pooled storage plus custom business email",
      "whyItMatters": "Team pricing structures and included extras like business email differ meaningfully for organizations budgeting per seat",
      "benefitsWho": "Small teams that also need custom-domain business email may find more value in Google Workspace's bundled starter tier"
    },
    {
      "title": "File recovery versus version history",
      "toolA": "Dropbox documents file recovery for deleted or previous file versions",
      "toolB": "Google Drive documents version history that lets users view, restore, or name specific revisions",
      "whyItMatters": "Both protect against data loss, but Google Drive's documented feature includes naming and viewing specific revisions, a more granular workflow",
      "benefitsWho": "Users who need to track and label specific document revisions benefit from Google Drive's version history"
    },
    {
      "title": "Third-party app integrations",
      "toolA": "Not documented in Dropbox's provided facts",
      "toolB": "Google Drive documents thousands of apps connecting through the Google Workspace Marketplace",
      "whyItMatters": "A large integration ecosystem lets files in Drive connect directly to other business tools without manual export and import",
      "benefitsWho": "Organizations with varied software stacks benefit from Google Drive's documented marketplace integrations"
    },
    {
      "title": "AI-powered search",
      "toolA": "Not documented in Dropbox's provided facts",
      "toolB": "Google Drive documents AI-powered, content-aware search that finds files by keyword, file type, owner, or content within images and scanned documents",
      "whyItMatters": "As file volume grows, the ability to search inside file content rather than just filenames saves significant time",
      "benefitsWho": "Users and teams with large, growing file libraries benefit from Google Drive's documented search capability"
    },
    {
      "title": "Admin and security controls",
      "toolA": "Not documented in Dropbox's provided facts",
      "toolB": "Google Drive documents admin console access, audit logs, and data loss prevention for Workspace admins",
      "whyItMatters": "Organizations with compliance or security requirements need centralized visibility and control over file access",
      "benefitsWho": "IT admins at organizations with compliance needs benefit from Google Drive's documented Workspace admin tooling"
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage and Free Tier",
      "rows": [
        {
          "feature": "Free plan storage",
          "toolA": "limited",
          "toolB": "available",
          "note": "Dropbox Basic is 2GB; Google Drive is 15GB shared across Drive, Gmail, and Photos"
        },
        {
          "feature": "Paid storage upgrade tiers",
          "toolA": "available",
          "toolB": "available",
          "note": "Dropbox via Plus, Standard, and Advanced plans; Google Drive via Google One and Workspace plans"
        }
      ]
    },
    {
      "group": "Document Creation and Editing",
      "rows": [
        {
          "feature": "Native document, spreadsheet, and presentation suite",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Drive integrates with Docs, Sheets, and Slides"
        },
        {
          "feature": "PDF editing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dropbox PDF editing is available on paid plans"
        },
        {
          "feature": "Built-in e-signatures",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Real-time collaborative editing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Includes live cursors, comments, and suggestions"
        }
      ]
    },
    {
      "group": "File Sync and Access",
      "rows": [
        {
          "feature": "Cross-device file synchronization",
          "toolA": "available",
          "toolB": "available",
          "note": "Google Drive documents web, desktop, and mobile sync explicitly"
        },
        {
          "feature": "Offline access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Universal file preview",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Drive previews over 100 file types without needing native apps"
        }
      ]
    },
    {
      "group": "Collaboration and Sharing",
      "rows": [
        {
          "feature": "Granular sharing permissions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "View, comment, or edit permissions plus link expiration and download restrictions"
        },
        {
          "feature": "Shared drives for teams",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Team-owned storage that persists when members leave the organization"
        }
      ]
    },
    {
      "group": "Search and Version Control",
      "rows": [
        {
          "feature": "AI-powered content search",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Version history or file recovery",
          "toolA": "available",
          "toolB": "available",
          "note": "Dropbox offers file recovery; Google Drive offers named, restorable version history"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Third-party app marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Google Workspace Marketplace connects thousands of apps"
        }
      ]
    },
    {
      "group": "Admin and Security",
      "rows": [
        {
          "feature": "Admin console and audit logs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Google Workspace tiers"
        },
        {
          "feature": "Data loss prevention",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Google Workspace tiers"
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan available",
          "toolA": "available",
          "toolB": "available",
          "note": "Dropbox Basic at $0 versus Google Drive Free at $0"
        },
        {
          "feature": "Entry-level individual paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Dropbox Plus is $9.99 per month; Google One 100GB is $1.99 per month"
        },
        {
          "feature": "Business or team plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Dropbox Standard is $12 per user per month and Advanced is $18 per user per month; Google Workspace Business Starter is $6 per user per month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Dropbox or Google Drive?",
      "answer": "Google Drive is cheaper at the entry level: Google One 100GB starts at $1.99 per month compared to Dropbox Plus at $9.99 per month, and Google Drive's free plan includes 15GB versus Dropbox Basic's 2GB, though Google's free storage is shared with Gmail and Photos rather than dedicated to files."
    },
    {
      "question": "Does Dropbox have real-time collaborative editing like Google Docs?",
      "answer": "This is not documented as a Dropbox feature in the available facts; Google Drive is the one documented to offer real-time collaborative editing with live cursors, comments, and suggestions inside Docs, Sheets, and Slides."
    },
    {
      "question": "Can Google Drive edit PDFs or send documents for e-signature the way Dropbox can?",
      "answer": "This is not documented as a Google Drive feature in the available facts; Dropbox is the one documented to offer built-in e-signatures and PDF editing on its paid plans."
    },
    {
      "question": "Which tool gives more free storage, Dropbox or Google Drive?",
      "answer": "Google Drive gives more free storage at 15GB compared to Dropbox Basic's 2GB, though the Google Drive allotment is shared across Drive, Gmail, and Google Photos rather than reserved solely for files."
    },
    {
      "question": "Can I use Google Drive offline?",
      "answer": "Yes, individual files can be marked for offline access in the web app, desktop client, or mobile app, allowing viewing and editing without an internet connection until the device reconnects and syncs."
    },
    {
      "question": "Is Dropbox or Google Drive better for teams and businesses?",
      "answer": "It depends on the need: Dropbox's documented business plans, Standard at $12 per user per month and Advanced at $18 per user per month, focus on storage, sync, e-signatures, and PDF editing, while Google Workspace Business Starter at $6 per user per month bundles pooled storage, custom business email, shared drives, and admin console features, making it the documented choice for teams that also want an integrated collaboration and email suite."
    }
  ]
};

export default dropboxVsGoogleDriveContent;
