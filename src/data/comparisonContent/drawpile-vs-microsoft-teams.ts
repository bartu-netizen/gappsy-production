import type { ToolComparisonContent } from './types';

const drawpileVsMicrosoftTeamsContent: ToolComparisonContent = {
  "verdict": "Drawpile is a free, open-source app purpose-built for real-time collaborative drawing, painting, and animation on a shared canvas, while Microsoft Teams is a broad workplace collaboration suite combining chat, video meetings, and Office file co-authoring. They occupy almost entirely different categories, Drawpile is a creative canvas tool and Teams is enterprise communication and productivity software, so the comparison mainly highlights how narrow, free creative tools differ from broad, paid enterprise platforms.",
  "bestForToolA": "Drawpile fits artists and small groups who want to draw, paint, or animate together on a shared canvas in real time, with a self-hostable server option, entirely free under the GPLv3 license.",
  "bestForToolB": "Microsoft Teams fits organizations needing chat, video meetings, and real-time co-authoring of Word, Excel, and PowerPoint files, especially those already using Microsoft 365, with a free tier and paid plans from about $4/user/month.",
  "whoNeedsBoth": "A creative team could use Drawpile for actual collaborative illustration or animation work, while using Microsoft Teams for the surrounding project communication, scheduling meetings, sharing files, and discussing the artwork, since Teams doesn't include a real-time drawing canvas and Drawpile doesn't include chat/meeting/Office tools.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Drawpile is built specifically for real-time collaborative drawing, painting, and animation, with brush stabilizer adjustments and timeline-based animation tools.",
      "toolB": "Microsoft Teams is built for workplace chat, video meetings, and Office document co-authoring, not creative drawing.",
      "whyItMatters": "These tools address entirely different work, one is a creative canvas, the other is business communication, so there's no real overlap in core function.",
      "benefitsWho": "Artists and illustrators need Drawpile; office workers and business teams need Teams."
    },
    {
      "title": "Pricing",
      "toolA": "Drawpile is entirely free and open source under the GPLv3 license with no paid tier documented.",
      "toolB": "Microsoft Teams has a free plan (video meetings up to 60 minutes) plus paid tiers from about $4/user/month (Teams Essentials) up to about $12.50/user/month (Microsoft 365 Business Standard).",
      "whyItMatters": "Cost matters differently depending on scale: Drawpile has zero licensing cost regardless of group size, while Teams' paid tiers scale per user.",
      "benefitsWho": "Hobbyist artist groups benefit from Drawpile's zero cost; businesses needing admin controls and Office integration budget for Teams' per-user pricing."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Drawpile includes a dedicated self-hostable server component (drawpile-srv) for running private sessions.",
      "toolB": "Microsoft Teams is a cloud-hosted Microsoft service with no self-hosting option documented.",
      "whyItMatters": "Self-hosting gives full control over where drawing session data lives, which matters for privacy-focused creative groups.",
      "benefitsWho": "Privacy-conscious art communities benefit from Drawpile's self-hosting option."
    },
    {
      "title": "Office/Document Collaboration",
      "toolA": "Drawpile's documented features don't include document co-authoring or office file support.",
      "toolB": "Microsoft Teams supports real-time co-authoring of Word, Excel, and PowerPoint files directly inside chats and channels.",
      "whyItMatters": "Businesses that live in Word/Excel/PowerPoint need native document collaboration that Drawpile simply doesn't offer.",
      "benefitsWho": "Office-based business teams benefit from Teams' document co-authoring."
    },
    {
      "title": "Platform Coverage",
      "toolA": "Drawpile is available on Windows, macOS, Linux, Android, and via browser, but has no native iOS app.",
      "toolB": "Microsoft Teams works across desktop, web, and mobile with consistent functionality.",
      "whyItMatters": "Missing platform coverage, like Drawpile's lack of a native iOS app, can be a blocker for teams standardized on Apple mobile devices.",
      "benefitsWho": "iPad/iPhone-only artists may find Drawpile's lack of a native iOS app limiting; enterprise IT standardizing across many device types benefits from Teams' broader documented platform support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Creative/Canvas Features",
      "rows": [
        {
          "feature": "Real-time collaborative drawing canvas",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Animation timeline tools",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Timelapse/speedpaint export",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Brush stabilizer",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Business Communication",
      "rows": [
        {
          "feature": "Persistent chat & channels",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "HD video meetings",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Office file co-authoring (Word/Excel/PowerPoint)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Teams Phone / VoIP calling",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Drawpile entirely free; Teams free plan capped at 60-min meetings"
        },
        {
          "feature": "Self-hosted server option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "drawpile-srv"
        },
        {
          "feature": "Admin/compliance controls",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Native iOS app",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Teams mobile access via Windows/Mac/web listed"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Microsoft Teams have a real-time drawing feature like Drawpile?",
      "answer": "No, Teams' documented features focus on chat, video meetings, and Office file co-authoring; it doesn't include a shared drawing canvas the way Drawpile does."
    },
    {
      "question": "Is Drawpile free?",
      "answer": "Yes, Drawpile is completely free and open source under the GPLv3 license, with no paid tier."
    },
    {
      "question": "Can I self-host either tool?",
      "answer": "Drawpile includes a dedicated server component (drawpile-srv) for self-hosting private sessions. Microsoft Teams is a cloud-hosted Microsoft service with no self-hosting option documented."
    },
    {
      "question": "Does Microsoft Teams require a Microsoft 365 subscription?",
      "answer": "No, Teams can be used with its free plan or standalone Teams Essentials (~$4/user/month) without a full Microsoft 365 subscription, though bundled Microsoft 365 plans unlock deeper Office integration."
    },
    {
      "question": "Is Drawpile available on mobile?",
      "answer": "Drawpile is available on Android and via browser, but the facts note there is no native iOS app."
    },
    {
      "question": "Why would someone compare Drawpile and Microsoft Teams at all?",
      "answer": "They're rarely direct competitors, but teams considering collaboration tools broadly might weigh Drawpile for creative co-drawing work against Teams for general business chat, meetings, and document collaboration - they typically get used together rather than as substitutes."
    }
  ]
};

export default drawpileVsMicrosoftTeamsContent;
