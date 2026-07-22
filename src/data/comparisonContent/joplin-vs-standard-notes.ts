import type { ToolComparisonContent } from './types';

const joplinVsStandardNotesContent: ToolComparisonContent = {
  "verdict": "Joplin and Standard Notes are both open-source, end-to-end encrypted note apps with free tiers, but they differ in what's free versus paid and how transparently pricing is published. Standard Notes' free plan includes unlimited device sync, while its Productivity and Professional plan prices aren't consistently published outside the app or checkout; Joplin publishes exact Cloud tier prices (from €2.99/month) and lets users avoid paying entirely by using free sync backends like Dropbox or WebDAV.",
  "bestForToolA": "Joplin fits users who want a Rich Text/Markdown editor toggle, a web clipper, community plugins, and the flexibility to sync for free via Nextcloud, Dropbox, OneDrive, or WebDAV instead of paying for Joplin Cloud.",
  "bestForToolB": "Standard Notes fits users who want unlimited device sync included in the free tier, self-hosting of the web app, and the Listed feature for publishing notes as a public online publication.",
  "whoNeedsBoth": "There's no clear scenario for running both simultaneously as primary note apps - a user would more realistically migrate between them based on whether they value Joplin's published Cloud pricing and rich-text editing or Standard Notes' free unlimited sync and self-hosting option.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Joplin publishes specific Joplin Cloud prices: Basic €2.99/month, Pro €5.99/month, Pro 100GB €9.99/month, Teams €7.99/user/month.",
      "toolB": "Standard Notes' Productivity and Professional plan prices are not consistently published outside the app or website checkout flow, per its documented cons.",
      "whyItMatters": "Published pricing lets buyers compare costs upfront without needing to start a checkout flow.",
      "benefitsWho": "Budget planners who want to compare exact costs before signing up benefit from Joplin's published tier pricing."
    },
    {
      "title": "Free Tier Sync",
      "toolA": "Joplin's free app supports free sync backends (Nextcloud, Dropbox, OneDrive, WebDAV); full Joplin Cloud sync starts at €2.99/month for 2GB.",
      "toolB": "Standard Notes' free tier includes syncing across unlimited devices as a documented feature.",
      "whyItMatters": "Whether device sync is free by default or requires configuring a third-party backend affects setup complexity for new users.",
      "benefitsWho": "Users who want frictionless free sync out of the box benefit from Standard Notes' free unlimited device sync."
    },
    {
      "title": "Editing Modes",
      "toolA": "Joplin offers a switchable Rich Text and Markdown editor.",
      "toolB": "A rich-text/Markdown toggle is not documented for Standard Notes; it instead extends functionality via community-built third-party extensions.",
      "whyItMatters": "Editor flexibility matters for users who move between visual and plain-text writing styles.",
      "benefitsWho": "Users who want to switch between WYSIWYG and Markdown editing benefit from Joplin's dual editor modes."
    },
    {
      "title": "Web Publishing",
      "toolA": "Joplin supports publishing individual notes to the web via Joplin Cloud, with a customizable publishing banner on the Pro plan.",
      "toolB": "Standard Notes has a dedicated Listed feature to publish notes as an online publication.",
      "whyItMatters": "Native publishing removes the need for a separate blogging tool to share notes publicly.",
      "benefitsWho": "Writers who want to turn private notes into a public page benefit from either tool's publishing feature."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Self-hosting the core Joplin app isn't documented; only self-hosting Joplin Server for team sync is mentioned, which requires additional technical setup.",
      "toolB": "Standard Notes' web app can be deployed on a user-run server, per its documented self-hosting feature.",
      "whyItMatters": "Full self-hosting gives users complete control over where their data lives, beyond just choosing a sync backend.",
      "benefitsWho": "Privacy-focused users who want to run the entire app on their own infrastructure benefit from Standard Notes' self-hostable web app."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sync & Storage",
      "rows": [
        {
          "feature": "Free-tier unlimited device sync",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free alternative sync backends",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Joplin: Nextcloud, Dropbox, OneDrive, WebDAV"
        },
        {
          "feature": "Paid cloud storage tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Joplin from €2.99/mo (2GB); Standard Notes Professional 100GB (price unpublished)"
        },
        {
          "feature": "End-to-end encryption",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Self-hosting",
          "toolA": "limited",
          "toolB": "available",
          "note": "Joplin: only Joplin Server for teams; Standard Notes: full web app"
        }
      ]
    },
    {
      "group": "Editing & Publishing",
      "rows": [
        {
          "feature": "Rich Text and Markdown editor toggle",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Web publishing of notes",
          "toolA": "available",
          "toolB": "available",
          "note": "Joplin via Joplin Cloud; Standard Notes via Listed"
        },
        {
          "feature": "Web clipper",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Third-party extensions/plugins",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platforms & Extensibility",
      "rows": [
        {
          "feature": "Native desktop + mobile apps",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Terminal client",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Family/team sharing",
          "toolA": "available",
          "toolB": "available",
          "note": "Joplin Teams €7.99/user/mo; Standard Notes Professional family sharing"
        },
        {
          "feature": "Notebook/note collaboration sharing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Joplin Pro plan adds notebook sharing"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Standard Notes' paid plan pricing public?",
      "answer": "Not consistently - Productivity and Professional plan prices are shown primarily at checkout, unlike Joplin's published Cloud tier prices."
    },
    {
      "question": "Does the free plan include sync on both?",
      "answer": "Standard Notes' free tier includes unlimited device sync by default. Joplin's free app supports free sync backends (Nextcloud, Dropbox, OneDrive, WebDAV), while full Joplin Cloud sync requires the paid Basic tier at €2.99/month."
    },
    {
      "question": "Can I self-host either app?",
      "answer": "Standard Notes' web app can be deployed on your own server. Joplin's core product doesn't document self-hosting in the same way - only Joplin Server for team sync, which needs extra technical setup."
    },
    {
      "question": "Which one lets me publish notes as a public page?",
      "answer": "Both do - Standard Notes via its Listed feature, and Joplin via Joplin Cloud publishing with a customizable banner on the Pro plan."
    },
    {
      "question": "Does either support family or team plans?",
      "answer": "Standard Notes' Professional plan includes family subscription sharing. Joplin's Teams plan (€7.99/user/month) adds multi-user management and consolidated billing."
    },
    {
      "question": "Which has more granular editing modes?",
      "answer": "Joplin, which lets users toggle between Rich Text and Markdown editors natively; this isn't documented for Standard Notes."
    }
  ]
};

export default joplinVsStandardNotesContent;
