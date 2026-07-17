import type { ToolComparisonContent } from './types';

const owncloudVsWetransferContent: ToolComparisonContent = {
  "verdict": "ownCloud is a full file sync, share, and real-time collaboration platform meant for ongoing team file storage, while WeTransfer is built for one-off, no-signup large file transfers where recipients don't need an account. ownCloud is about persistent storage and permissioned collaboration; WeTransfer is about quick, ephemeral delivery of large files with links that expire by design.",
  "bestForToolA": "Teams and organizations needing ongoing, permissioned file storage and real-time document collaboration via OnlyOffice, Microsoft 365, or Collabora Online - ownCloud's Community Edition is free with unlimited users for self-hosters.",
  "bestForToolB": "Freelancers or teams occasionally sending large files (up to 1TB per transfer on the Ultimate plan) to people who shouldn't need to create an account, especially when a simple send-and-forget experience matters more than long-term storage.",
  "whoNeedsBoth": "A video production studio might store and collaborate on project files long-term in ownCloud while using WeTransfer to send a finished large video file to an external client who doesn't have, and won't create, an account on the studio's systems.",
  "keyDifferences": [
    {
      "title": "Purpose: Storage vs. Transfer",
      "toolA": "Provides full file lifecycle management and Spaces for team collaboration, plus real-time document co-editing.",
      "toolB": "Files and links expire by design - a few days on the Free plan, longer on paid plans - and WeTransfer's own documented cons state it isn't suited to long-term storage or archiving.",
      "whyItMatters": "Choosing the wrong tool means either paying for storage you don't need or losing files you meant to keep.",
      "benefitsWho": "Benefits teams that need to distinguish 'store forever' needs from 'send once' needs."
    },
    {
      "title": "Recipient Account Requirement",
      "toolA": "Not documented as accountless; it's a collaboration platform generally built around registered users and permissions.",
      "toolB": "Explicitly requires no account for recipients - a link is enough to download.",
      "whyItMatters": "Sending files to non-technical outside parties is frictionless only when no signup is required.",
      "benefitsWho": "Benefits senders delivering files to clients or contacts unfamiliar with the platform."
    },
    {
      "title": "Free Tier Limits",
      "toolA": "Community Edition is free with unlimited users, but self-hosting effort is required.",
      "toolB": "Free plan is capped at up to 10 transfers or 3GB total every 30 days, fully hosted with no setup.",
      "whyItMatters": "ownCloud's free tier is unlimited but demands infrastructure; WeTransfer's free tier is zero-setup but volume-capped.",
      "benefitsWho": "Benefits technical teams willing to self-host (ownCloud) versus casual senders wanting instant, zero-setup use (WeTransfer)."
    },
    {
      "title": "API and Automation",
      "toolA": "Not explicitly documented for programmatic API access, though desktop and mobile apps exist for sync.",
      "toolB": "WeTransfer's own documented cons state its public developer API has been retired, limiting automation.",
      "whyItMatters": "Teams wanting to script uploads and downloads need to know API availability upfront.",
      "benefitsWho": "Benefits developers building automated file workflows, who should evaluate both carefully rather than assume API access."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Free unlimited-user Community Edition, or custom-quoted Standard/Enterprise (25-user minimum) and ownCloud.online plans.",
      "toolB": "Published flat consumer pricing - Starter at $6.99/month (300GB, 10 transfers per 30 days), Ultimate at $25/month (1TB per transfer, cloud storage included), Teams custom.",
      "whyItMatters": "WeTransfer's transparent low-cost tiers suit individuals; ownCloud's enterprise tiers suit organizations needing custom quotes.",
      "benefitsWho": "Benefits individual freelancers wanting predictable low-cost pricing (WeTransfer) versus organizations negotiating enterprise deployments (ownCloud)."
    }
  ],
  "featureMatrix": [
    {
      "group": "File Handling",
      "rows": [
        {
          "feature": "Persistent team file storage",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "WeTransfer files are designed to expire"
        },
        {
          "feature": "Large one-off transfer with no recipient account",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Password-protected sharing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom link expiration control",
          "toolA": "available",
          "toolB": "available",
          "note": "WeTransfer: paid plans only"
        }
      ]
    },
    {
      "group": "Collaboration & Platform",
      "rows": [
        {
          "feature": "Real-time document co-editing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Native desktop & mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "ownCloud: Windows/macOS/Linux/iOS/Android; WeTransfer: iOS/Android/Mac menu-bar app"
        },
        {
          "feature": "Team spaces / project folders",
          "toolA": "available",
          "toolB": "available",
          "note": "WeTransfer: Teams plan only"
        },
        {
          "feature": "Branded download/transfer pages",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Paid WeTransfer tiers"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "ownCloud: unlimited users; WeTransfer: 10 transfers/3GB per 30 days"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Cloud storage included in a paid consumer plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WeTransfer Ultimate plan"
        },
        {
          "feature": "Starting paid price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ownCloud: custom quote, 25-user minimum on Standard/Enterprise; WeTransfer: $6.99/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ownCloud or WeTransfer better for long-term file storage?",
      "answer": "ownCloud, since it's built for persistent file lifecycle management and collaboration; WeTransfer's files and links are designed to expire and are explicitly not meant for archiving."
    },
    {
      "question": "Do recipients need an account to receive files?",
      "answer": "With WeTransfer, no - recipients just click a link. ownCloud is oriented around registered collaborators rather than one-off anonymous recipients."
    },
    {
      "question": "Which is cheaper for occasional large-file sending?",
      "answer": "WeTransfer's free plan (up to 10 transfers or 3GB per 30 days) or Starter plan ($6.99/month for 300GB) are built for exactly this; ownCloud's paid tiers require a 25-user minimum and custom quotes, making them impractical for one-off sends."
    },
    {
      "question": "Can I self-host WeTransfer like ownCloud?",
      "answer": "No, WeTransfer is a hosted service; ownCloud offers a self-hosted, free, open-source Community Edition as an alternative."
    },
    {
      "question": "Does WeTransfer offer an API for automation?",
      "answer": "WeTransfer's public developer API has been retired, per its documented limitations, which limits automation compared to platforms designed around ongoing integration."
    },
    {
      "question": "How much storage can I get on WeTransfer's paid plan?",
      "answer": "The Ultimate plan ($25/month) supports transfers up to 1TB each and includes cloud storage; ownCloud's storage is effectively unlimited on self-hosted deployments, dependent on your own infrastructure."
    }
  ]
};

export default owncloudVsWetransferContent;
