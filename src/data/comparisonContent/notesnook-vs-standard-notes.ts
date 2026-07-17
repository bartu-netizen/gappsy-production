import type { ToolComparisonContent } from './types';

const notesnookVsStandardNotesContent: ToolComparisonContent = {
  "verdict": "Notesnook and Standard Notes are both open-source, end-to-end encrypted note apps with free tiers and paid upgrades, but Notesnook publishes granular, storage-capped pricing across four tiers (Free, Essential €2.11/month, Pro €7.39/month, Believer €9.51/month), while Standard Notes' paid Productivity and Professional plan prices aren't consistently published outside checkout. Notesnook also documents its specific encryption algorithms (XChaCha20-Poly1305, Argon2) and offers a self-hostable sync server, whereas Standard Notes documents self-hosting the full web app itself.",
  "bestForToolA": "Notesnook fits users who want transparent, storage-based pricing tiers, a password-protected vault for sensitive notes, and the option to self-host just the sync server (GPL-3.0) rather than the whole application.",
  "bestForToolB": "Standard Notes fits users who want unlimited device sync on the free tier, the ability to self-host the entire web app, and a dedicated Listed feature for publishing notes publicly.",
  "whoNeedsBoth": "There's no documented integration between them, and both compete for the same core encrypted note-taking job - most buyers would evaluate Notesnook's published per-tier storage caps against Standard Notes' unpublished-pricing but unlimited-sync free plan and pick one.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency & Tiers",
      "toolA": "Notesnook publishes exact prices for all four tiers: Free €0, Essential €2.11/month, Pro €7.39/month, Believer €9.51/month, each with specific storage caps.",
      "toolB": "Standard Notes' paid Productivity and Professional tier prices aren't consistently published outside the app or website checkout flow.",
      "whyItMatters": "Fully published pricing lets buyers budget precisely before signing up, without needing to enter a checkout flow.",
      "benefitsWho": "Cost-conscious individuals comparing exact storage-per-dollar benefit from Notesnook's transparent tier pricing."
    },
    {
      "title": "Free Plan Storage Limits",
      "toolA": "Notesnook's free plan caps storage at 50MB/month with 50 notebooks and 50 tags, and a 10MB max file size.",
      "toolB": "Standard Notes' free plan doesn't document a specific storage cap, instead emphasizing unlimited device sync as its headline free feature.",
      "whyItMatters": "A documented storage cap tells free-tier users exactly when they'll need to upgrade.",
      "benefitsWho": "Light note-takers who rarely attach large files may be comfortable with Notesnook's capped free tier; heavy syncers benefit from Standard Notes' unlimited-device free sync."
    },
    {
      "title": "Self-Hostable Sync Server",
      "toolA": "Notesnook lets users run their own self-hostable Notesnook sync server as an alternative to the hosted cloud (GPL-3.0 licensed).",
      "toolB": "Standard Notes documents self-hosting the web app itself on a user-run server.",
      "whyItMatters": "Self-hosting at the sync-server layer versus the full-app layer changes how much infrastructure a user manages.",
      "benefitsWho": "Technical users wanting full data sovereignty benefit from either tool's self-hosting option, depending on which layer they prefer to control."
    },
    {
      "title": "Encryption Method Documentation",
      "toolA": "Notesnook documents its specific encryption algorithms: notes are encrypted on-device using XChaCha20-Poly1305 and Argon2.",
      "toolB": "Standard Notes documents end-to-end encryption generally, without naming specific ciphers in the available facts.",
      "whyItMatters": "Naming specific, well-vetted cryptographic algorithms lets security-conscious buyers evaluate the encryption independently.",
      "benefitsWho": "Security researchers and privacy-focused professionals benefit from Notesnook's documented encryption specifics."
    },
    {
      "title": "Publishing",
      "toolA": "A public note-publishing feature is not documented for Notesnook.",
      "toolB": "Standard Notes has a dedicated Listed feature for publishing notes as an online publication.",
      "whyItMatters": "Native publishing removes the need for a separate blogging tool to share notes with the public.",
      "benefitsWho": "Writers who want to turn private notes into a public blog benefit from Standard Notes' Listed feature."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Storage",
      "rows": [
        {
          "feature": "Published free-tier storage cap",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Notesnook: 50MB/month"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Notesnook Essential €2.11/month"
        },
        {
          "feature": "Top-tier storage",
          "toolA": "available",
          "toolB": "available",
          "note": "Notesnook Believer 25GB/month; Standard Notes Professional 100GB"
        },
        {
          "feature": "Unlimited notebooks/tags",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Notesnook Pro tier and above"
        }
      ]
    },
    {
      "group": "Security & Sync",
      "rows": [
        {
          "feature": "End-to-end encryption",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Named encryption algorithm",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Notesnook: XChaCha20-Poly1305, Argon2"
        },
        {
          "feature": "Self-hostable sync server",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Self-hosted full app deployment",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Password-protected vault",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Platforms & Extras",
      "rows": [
        {
          "feature": "Native apps (desktop, mobile, web)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Bidirectional note linking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Third-party extensions",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Note publishing to the web",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Web clipper",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much does each app's cheapest paid plan cost?",
      "answer": "Notesnook's Essential plan is €2.11/month. Standard Notes' Productivity plan price isn't consistently published outside checkout."
    },
    {
      "question": "What's the free-plan storage cap?",
      "answer": "Notesnook's free plan is capped at 50MB/month with 50 notebooks and 50 tags. Standard Notes doesn't document a specific storage cap, emphasizing unlimited device sync instead."
    },
    {
      "question": "Can I self-host either app?",
      "answer": "Notesnook offers a self-hostable sync server (GPL-3.0). Standard Notes' web app itself can be deployed on your own server."
    },
    {
      "question": "Which tool documents its encryption algorithms?",
      "answer": "Notesnook, which names XChaCha20-Poly1305 and Argon2. Standard Notes states it offers end-to-end encryption without naming a specific cipher in the available facts."
    },
    {
      "question": "Does either let me publish notes publicly?",
      "answer": "Standard Notes has a Listed feature for this. A public-publishing feature is not documented for Notesnook."
    },
    {
      "question": "Is there a refund guarantee?",
      "answer": "Notesnook documents a 14-day money-back guarantee on paid plans. A similar guarantee isn't documented for Standard Notes."
    }
  ]
};

export default notesnookVsStandardNotesContent;
