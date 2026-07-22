import type { ToolComparisonContent } from './types';

const lunacyVsPenpotContent: ToolComparisonContent = {
  "verdict": "Lunacy is a free native desktop app (Windows/Mac/Linux) that works fully offline and opens Sketch and Figma files directly, but has no confirmed web or mobile version. Penpot is a fully open-source, web-based design platform that can also be self-hosted, with per-user pricing that scales from a generous free tier up to a $50,000/year self-hosted Private Server plan. The decision mostly turns on offline-native desktop use versus open, self-hostable, browser-based collaboration.",
  "bestForToolA": "Designers who want a completely free, offline-capable native app on Windows, Mac, or Linux, especially those needing to open existing Sketch files or import from Figma without a browser.",
  "bestForToolB": "Teams that want an open-source design platform built on open web standards, need multiplayer web-based collaboration, or require a self-hosted deployment for data control, with pricing that scales predictably per user.",
  "whoNeedsBoth": "A studio that uses Lunacy for individual offline asset work (e.g., editing Sketch files while traveling) but collaborates on shared design systems through Penpot's web platform would reasonably keep both.",
  "keyDifferences": [
    {
      "title": "Deployment model",
      "toolA": "Native desktop application for Windows, Mac, and Linux that works fully offline; no web-based version confirmed.",
      "toolB": "Web-based cloud platform with an explicit self-hosting option (including a dedicated Private Server plan).",
      "whyItMatters": "Teams needing offline work default to Lunacy; teams needing browser-based access from any machine, or full control via self-hosting, default to Penpot.",
      "benefitsWho": "IT/design-ops teams deciding on deployment constraints (offline access vs. centralized web access or data residency)."
    },
    {
      "title": "Open-source status",
      "toolA": "Not stated as open source; free plan includes all major features with no ads or restrictions.",
      "toolB": "Fully open-source, built on open web standards (SVG, CSS, HTML) and Penpot's own open file format.",
      "whyItMatters": "Teams with policies favoring open-source tooling, or wanting to avoid file-format lock-in, have a clear documented answer only with Penpot.",
      "benefitsWho": "Organizations with open-source procurement requirements or concerns about proprietary file formats."
    },
    {
      "title": "Pricing structure and ceiling",
      "toolA": "Paid plan starts at $11.99/month, but exact feature differences from the free plan are not detailed on the main page.",
      "toolB": "Free for up to 8 team members, then $7/user/month (capped at $175/month) on Unlimited, $25/user/month on Enterprise, or $50,000/year for a self-hosted Private Server.",
      "whyItMatters": "Penpot's pricing is transparent and scales explicitly with team size and self-hosting needs; Lunacy's paid tier value is unclear from available facts.",
      "benefitsWho": "Finance and design-ops leads budgeting for tool costs as a team grows."
    },
    {
      "title": "Team collaboration features",
      "toolA": "Real-time collaboration includes live feedback, text and audio chat, and sticker reactions.",
      "toolB": "Multiplayer real-time collaborative editing across team members, with the free tier capped at 8 team members and unlimited viewers.",
      "whyItMatters": "Lunacy documents richer social collaboration features (audio chat, reactions); Penpot documents an explicit team-size cap on its free tier that affects how many people can be full members.",
      "benefitsWho": "Teams sizing how many people need edit access versus view-only access."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Design Tooling",
      "rows": [
        {
          "feature": "Vector editing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Sketch/Figma file import",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Design systems / component libraries & tokens",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted design-to-code workflows",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in stock assets (icons/illustrations/UI kits)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Platforms & Deployment",
      "rows": [
        {
          "feature": "Native desktop app (Windows/Mac/Linux)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Web-based access",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Self-hosting option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Offline editing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Collaboration",
      "rows": [
        {
          "feature": "Free tier with full major features",
          "toolA": "available",
          "toolB": "available",
          "note": "Penpot's free (Professional) tier is capped at 8 team members."
        },
        {
          "feature": "Real-time collaboration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SSO / audit logs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Requires Penpot's Enterprise tier."
        },
        {
          "feature": "Published detailed paid-tier pricing",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Lunacy free?",
      "answer": "Yes, Lunacy's free plan includes all major features with no ads, and a paid plan is available for extra benefits starting at $11.99/month."
    },
    {
      "question": "Is Penpot free?",
      "answer": "Yes, Penpot's Professional plan is free for up to 8 team members with unlimited viewers."
    },
    {
      "question": "Can Lunacy open Sketch files?",
      "answer": "Yes, Lunacy can open Sketch files and import designs from Figma."
    },
    {
      "question": "Is Penpot open source?",
      "answer": "Yes, Penpot is an open-source design platform built on open standards like SVG, CSS, and HTML."
    },
    {
      "question": "Does Lunacy work offline?",
      "answer": "Yes, Lunacy works offline as a native desktop application."
    },
    {
      "question": "Can Penpot be self-hosted?",
      "answer": "Yes, Penpot offers a self-hosted Private Server option in addition to the cloud-hosted plans."
    }
  ]
};

export default lunacyVsPenpotContent;
