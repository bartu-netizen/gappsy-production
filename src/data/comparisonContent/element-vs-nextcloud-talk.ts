import type { ToolComparisonContent } from './types';

const elementVsNextcloudTalkContent: ToolComparisonContent = {
  "verdict": "Element and Nextcloud Talk are both self-hostable, security-focused communication tools with government usage, but they're built for different scopes. Element is a standalone, Matrix-protocol messaging app with end-to-end encryption by default and an air-gapped Sovereign plan. Nextcloud Talk is a video/chat/webinar app deeply integrated into the broader Nextcloud suite (Files, Groupware, Office), with AI-powered call summaries and bridging to Microsoft Teams, Slack, and Matrix, plus published per-user Enterprise pricing.",
  "bestForToolA": "Element fits organizations wanting a dedicated, Matrix-protocol-based secure messaging tool with air-gapped Sovereign deployment, vetted for use by government and defense bodies.",
  "bestForToolB": "Nextcloud Talk fits organizations already using or adopting Nextcloud for file storage and groupware that want video meetings, AI-powered call summaries, and Teams/Slack bridging built into the same platform, with published per-user Enterprise pricing starting at €42/user/year.",
  "whoNeedsBoth": "An organization already running Nextcloud for file storage and groupware could use Nextcloud Talk for day-to-day video meetings while adopting Element for encrypted, federated messaging with external partners on separate Matrix homeservers — the two address different collaboration needs (an integrated productivity suite vs. cross-organization federated messaging).",
  "keyDifferences": [
    {
      "title": "Core Product Scope",
      "toolA": "Element is a standalone secure messaging and collaboration app built on the Matrix protocol, not tied to a broader office suite.",
      "toolB": "Nextcloud Talk is a video/chat/webinar app deeply integrated into the broader Nextcloud platform (Files, Groupware, Office applications).",
      "whyItMatters": "Deep suite integration reduces tool-switching for organizations already standardized on one platform.",
      "benefitsWho": "Organizations already using Nextcloud for file storage and productivity."
    },
    {
      "title": "Cross-Platform Bridging",
      "toolA": "Element's federation connects Matrix-to-Matrix, across separate Matrix homeservers; no bridging to Teams or Slack is documented.",
      "toolB": "Nextcloud Talk explicitly bridges with other networks including Microsoft Teams, Slack, and Matrix.",
      "whyItMatters": "Bridging lets an organization communicate with partners who use a different chat platform without migrating anyone.",
      "benefitsWho": "Organizations needing to interoperate with partners on Teams or Slack."
    },
    {
      "title": "AI Features",
      "toolA": "No AI feature is documented for Element in the facts.",
      "toolB": "Nextcloud Talk offers AI-powered chat and call summaries plus live meeting translation.",
      "whyItMatters": "AI summaries reduce time spent reviewing long recorded meetings.",
      "benefitsWho": "Teams running frequent video meetings who want automated recaps."
    },
    {
      "title": "Published Pricing",
      "toolA": "Element's Enterprise and Sovereign plans are custom and unpublished; only the free Community tier has a known price.",
      "toolB": "Nextcloud Talk publishes Standard Talk pricing: €42/user/year at 100 users, dropping to €31.50/user/year at 250 users.",
      "whyItMatters": "Published per-user pricing lets buyers estimate cost without a sales call.",
      "benefitsWho": "Budget-conscious IT teams evaluating tools ahead of procurement."
    },
    {
      "title": "Federation Model",
      "toolA": "Element federates across fully separate organizations' Matrix homeservers using the open Matrix protocol, plus a Sovereign air-gapped plan.",
      "toolB": "Nextcloud Talk federates chat/video across Nextcloud instances and bridges to other networks, but is architecturally tied to the Nextcloud platform rather than an open multi-vendor protocol.",
      "whyItMatters": "An open multi-vendor protocol avoids being tied to a single platform vendor for cross-organization messaging.",
      "benefitsWho": "Organizations prioritizing protocol independence over suite integration."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Architecture",
      "rows": [
        {
          "feature": "Self-hosted / open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Air-gapped deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Element: Sovereign plan. Nextcloud Talk: self-hosted on-premises supports air-gapped deployments."
        },
        {
          "feature": "Federation across organizations",
          "toolA": "available",
          "toolB": "available",
          "note": "Element: Matrix homeservers. Nextcloud Talk: across Nextcloud instances."
        },
        {
          "feature": "Bridging to Microsoft Teams / Slack",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Meeting & AI Features",
      "rows": [
        {
          "feature": "AI-powered summaries / translation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in video calling",
          "toolA": "available",
          "toolB": "available",
          "note": "Element: Element Call. Nextcloud Talk: screen sharing, webinars, video conferencing."
        },
        {
          "feature": "Deep integration with a file/office suite",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Nextcloud Talk integrates with Files, Groupware, and Office."
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Published per-user pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Nextcloud Talk: €42/user/year at 100 users."
        },
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "ISO/IEC 27001 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Element: ISO/IEC 27001:2022."
        },
        {
          "feature": "Referenced government/defense usage",
          "toolA": "available",
          "toolB": "available",
          "note": "Element: NATO, US Space Force, Bundeswehr. Nextcloud Talk: Austrian Federal Ministry, Deutsche Telekom, Amnesty International."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Nextcloud Talk include AI features?",
      "answer": "Yes, it offers AI-powered chat and call summaries as well as live meeting translation."
    },
    {
      "question": "Is Element free to use?",
      "answer": "Yes, its Community edition is free and open source under AGPL for self-hosted, non-professional deployments and evaluations."
    },
    {
      "question": "Which tool has published per-user pricing?",
      "answer": "Nextcloud Talk, with Standard Talk pricing published at €42/user/year (100 users) and €31.50/user/year (250 users). Element's Enterprise and Sovereign plans are custom quotes."
    },
    {
      "question": "Can Nextcloud Talk bridge to Microsoft Teams or Slack?",
      "answer": "Yes, cross-platform bridging is documented for Microsoft Teams, Slack, and Matrix."
    },
    {
      "question": "Which tool is built on the Matrix protocol?",
      "answer": "Element. Nextcloud Talk is not documented as Matrix-based, though it can bridge to Matrix networks."
    },
    {
      "question": "Do both tools support air-gapped deployment?",
      "answer": "Yes — Element via its dedicated Sovereign plan, and Nextcloud Talk via self-hosted on-premises deployment for GDPR compliance and data sovereignty."
    }
  ]
};

export default elementVsNextcloudTalkContent;
