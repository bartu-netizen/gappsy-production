import type { ToolComparisonContent } from './types';

const etherpadVsMicrosoftTeamsContent: ToolComparisonContent = {
  "verdict": "Etherpad is a free, open-source, self-hosted tool focused specifically on real-time collaborative text editing with authorship tracking and a plugin ecosystem, while Microsoft Teams is a broad workplace suite combining chat, video meetings, and Office file co-authoring. Etherpad does one thing, live shared text documents, very deeply and for free; Teams bundles that kind of collaboration alongside meetings, calling, and enterprise admin controls as part of a paid Microsoft 365 ecosystem.",
  "bestForToolA": "Etherpad fits organizations wanting a lightweight, self-hosted, real-time text collaboration tool with no telemetry and full data control; it's used by organizations like the Wikimedia Foundation and EU institutions and extended through 200+ plugins.",
  "bestForToolB": "Microsoft Teams fits organizations needing chat, video meetings, and Office document co-authoring together in one platform, especially those already invested in Microsoft 365, with plans from free up to about $12.50/user/month for Business Standard.",
  "whoNeedsBoth": "An organization could self-host Etherpad for lightweight, plugin-extensible collaborative note-taking or documentation (as institutions like Wikimedia do), while using Microsoft Teams separately for company-wide chat, video meetings, and Word/Excel/PowerPoint co-authoring - Etherpad doesn't offer meetings or chat, and Teams' document co-authoring is scoped to Office file formats rather than Etherpad's lightweight pad format.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "Etherpad requires self-hosting; there is no official managed cloud service, and it runs with no telemetry.",
      "toolB": "Microsoft Teams is a fully cloud-hosted Microsoft service with no self-hosting option.",
      "whyItMatters": "Self-hosting gives full data control at the cost of needing to manage server infrastructure yourself.",
      "benefitsWho": "Organizations with strict data sovereignty needs, like the EU institutions and Wikimedia Foundation that use Etherpad, benefit from its self-hosted, no-telemetry design."
    },
    {
      "title": "Pricing",
      "toolA": "Etherpad is free and open source under the Apache 2.0 license with no paid tier.",
      "toolB": "Microsoft Teams has a free plan plus paid tiers from about $4/user/month (Teams Essentials) to about $12.50/user/month (Microsoft 365 Business Standard).",
      "whyItMatters": "Etherpad has zero licensing cost regardless of scale (only hosting costs), while Teams' paid tiers add per-user cost as an organization grows.",
      "benefitsWho": "Budget-constrained organizations and nonprofits benefit from Etherpad's zero licensing cost."
    },
    {
      "title": "Scope of Collaboration",
      "toolA": "Etherpad is scoped specifically to real-time collaborative text editing with a time slider for reviewing character-by-character edit history.",
      "toolB": "Microsoft Teams combines persistent chat/channels, HD video meetings with recording/transcription, and real-time co-authoring of Word, Excel, and PowerPoint files.",
      "whyItMatters": "Teams offers a much broader collaboration toolkit in one app, while Etherpad focuses narrowly and deeply on shared text documents.",
      "benefitsWho": "Teams wanting an all-in-one communication and document suite benefit from Teams' breadth; users just needing simple shared notes benefit from Etherpad's focus."
    },
    {
      "title": "Extensibility",
      "toolA": "Etherpad has a plugin ecosystem of over 200 extensions adding comments, images, tables, code highlighting, video chat, and OAuth/LDAP authentication, plus optional AI plugins pointing to models of the user's choice.",
      "toolB": "Microsoft Teams supports app and workflow integrations connecting third-party apps, bots, and workflows as tabs or notifications within a channel.",
      "whyItMatters": "Both are extensible, but Etherpad's plugin model lets admins add exactly the features they need (including AI on their own infrastructure) to an otherwise minimal core product, while Teams' integrations extend an already feature-rich platform.",
      "benefitsWho": "Technical teams wanting a minimal core they can customize benefit from Etherpad's plugins; business teams wanting to connect existing SaaS tools benefit from Teams' app integrations."
    },
    {
      "title": "Video/Meeting Capability",
      "toolA": "Etherpad's documented features don't include video meetings or calling.",
      "toolB": "Microsoft Teams includes HD video meetings with screen sharing, recording, live captions, background effects, and breakout rooms.",
      "whyItMatters": "Organizations needing video meetings as part of their core workflow need a tool like Teams; Etherpad would need to be paired with a separate meeting tool.",
      "benefitsWho": "Remote and hybrid teams needing video calls benefit from Teams' built-in meeting features over Etherpad, which has none."
    }
  ],
  "featureMatrix": [
    {
      "group": "Text Collaboration",
      "rows": [
        {
          "feature": "Real-time collaborative text editing",
          "toolA": "available",
          "toolB": "available",
          "note": "Teams via Office co-authoring"
        },
        {
          "feature": "Authorship/edit history tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Etherpad's time slider"
        },
        {
          "feature": "Plugin ecosystem",
          "toolA": "available",
          "toolB": "available",
          "note": "Etherpad: 200+ plugins; Teams: app/workflow integrations"
        },
        {
          "feature": "Office file format support (Word/Excel/PPT)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Communication & Meetings",
      "rows": [
        {
          "feature": "Persistent chat/channels",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Video meetings",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "VoIP/phone calling",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Meeting recording & transcription",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Required for Etherpad, no managed cloud"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "Etherpad entirely free; Teams free plan, paid from ~$4/user/month"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "Etherpad has native Android and iOS apps"
        },
        {
          "feature": "Admin/compliance controls",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Etherpad offer video meetings like Microsoft Teams?",
      "answer": "No, Etherpad's documented features focus on real-time text editing; video chat is only available as one of its 200+ optional plugins, not a built-in core feature the way it is in Teams."
    },
    {
      "question": "Is Etherpad free?",
      "answer": "Yes, Etherpad is free, open-source software released under the Apache 2.0 license, with no paid tier."
    },
    {
      "question": "Do I need to self-host Etherpad?",
      "answer": "Yes, Etherpad is designed for self-hosting; there is no official managed cloud service, so organizations run their own server instances."
    },
    {
      "question": "Does Microsoft Teams offer the same edit-history tracking as Etherpad?",
      "answer": "The available facts don't document a character-by-character time slider like Etherpad's in Teams; Teams' co-authoring is built around standard Office document version history instead."
    },
    {
      "question": "Who uses Etherpad?",
      "answer": "Etherpad is used by organizations including the Wikimedia Foundation, EU public institutions, universities, and newsrooms, and has been active for over 16 years."
    },
    {
      "question": "Is Microsoft Teams free to use?",
      "answer": "Yes, Microsoft Teams offers a free plan with unlimited chat messages, video meetings up to 60 minutes, and basic file sharing; additional features require a paid Microsoft 365 or Teams Essentials plan (~$4/user/month)."
    }
  ]
};

export default etherpadVsMicrosoftTeamsContent;
