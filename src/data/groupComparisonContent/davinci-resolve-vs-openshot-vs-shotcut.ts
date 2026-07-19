import type { GroupComparisonContent } from './types';

const davinciResolveVsOpenshotVsShotcutContent: GroupComparisonContent = {
  "verdict": "DaVinci Resolve offers the deepest professional toolset of the three, combining free editing, color, VFX, and audio tools with an optional paid Studio upgrade. OpenShot is the friendliest pick for beginners wanting simple drag-and-drop editing without a learning curve, while Shotcut sits in between, free and stable with broad native format support via FFmpeg and a more extensive filter library than OpenShot, though its interface is less polished than commercial editors.",
  "bestFor": {
    "davinci-resolve": "Professionals and serious hobbyists who want free, industry-grade editing, color, VFX, and audio in one integrated app with an optional paid upgrade.",
    "openshot": "Beginners and casual creators who want the simplest, most approachable free drag-and-drop editor without extra complexity.",
    "shotcut": "Users who want a free, stable, cross-platform editor with wide native format support and portable, installation-free builds."
  },
  "highlights": [
    {
      "title": "Completely Free Core",
      "description": "All three editors offer a full, unrestricted, watermark-free editor at no cost, with DaVinci Resolve's paid Studio tier remaining entirely optional.",
      "toolSlugs": [
        "davinci-resolve",
        "openshot",
        "shotcut"
      ]
    },
    {
      "title": "Beginner-Friendly Interface",
      "description": "OpenShot's drag-and-drop timeline was specifically designed to be approachable for non-technical users and beginners.",
      "toolSlugs": [
        "openshot"
      ]
    },
    {
      "title": "Professional Color and Audio Suite",
      "description": "DaVinci Resolve's dedicated Color and Fairlight pages give it a depth of color grading and audio mixing tools that OpenShot and Shotcut do not match.",
      "toolSlugs": [
        "davinci-resolve"
      ]
    },
    {
      "title": "Portable, Installation-Free Builds",
      "description": "Shotcut can run directly from a USB drive on Windows and Linux with no installation required.",
      "toolSlugs": [
        "shotcut"
      ]
    },
    {
      "title": "Cross-Platform Reach",
      "description": "All three run on Windows, macOS, and Linux, and OpenShot additionally extends to ChromeOS.",
      "toolSlugs": [
        "davinci-resolve",
        "openshot",
        "shotcut"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Editing",
      "rows": [
        {
          "feature": "Non-linear video editing",
          "statuses": {
            "davinci-resolve": "available",
            "openshot": "available",
            "shotcut": "available"
          }
        },
        {
          "feature": "Chroma key or green screen compositing",
          "statuses": {
            "davinci-resolve": "not-documented",
            "openshot": "available",
            "shotcut": "available"
          },
          "note": "Chroma key is not listed among DaVinci Resolve's documented feature set here, though OpenShot and Shotcut both explicitly document it."
        }
      ]
    },
    {
      "group": "Color, Audio, and AI",
      "rows": [
        {
          "feature": "Dedicated color grading tools",
          "statuses": {
            "davinci-resolve": "available",
            "openshot": "not-documented",
            "shotcut": "available"
          }
        },
        {
          "feature": "Multi-track audio post-production suite",
          "statuses": {
            "davinci-resolve": "available",
            "openshot": "limited",
            "shotcut": "limited"
          },
          "note": "OpenShot offers audio mixing and waveform visualization, and Shotcut offers audio balance filters, but neither documents a dedicated audio suite like Resolve's Fairlight page."
        },
        {
          "feature": "AI-powered post-production tools (Neural Engine)",
          "statuses": {
            "davinci-resolve": "available",
            "openshot": "unavailable",
            "shotcut": "unavailable"
          },
          "note": "Requires DaVinci Resolve's paid Studio upgrade."
        }
      ]
    },
    {
      "group": "Titles and Platform",
      "rows": [
        {
          "feature": "3D animated titles",
          "statuses": {
            "davinci-resolve": "not-documented",
            "openshot": "available",
            "shotcut": "not-documented"
          }
        },
        {
          "feature": "Portable, installation-free builds",
          "statuses": {
            "davinci-resolve": "unavailable",
            "openshot": "unavailable",
            "shotcut": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is DaVinci Resolve harder to learn than OpenShot?",
      "answer": "Yes, generally. DaVinci Resolve's steeper learning curve reflects its professional depth across editing, color, VFX, and audio, while OpenShot was built specifically as a beginner-friendly, drag-and-drop editor for users new to video editing."
    },
    {
      "question": "Which of these three is best for absolute beginners?",
      "answer": "OpenShot is the most beginner-friendly of the three, with a straightforward drag-and-drop interface and no paid tier or advanced tooling to navigate. Shotcut is a step up in complexity, and DaVinci Resolve has the steepest learning curve given its professional-grade feature set."
    },
    {
      "question": "Does Shotcut have chroma key or green screen support?",
      "answer": "Yes, Shotcut includes built-in chroma key and green screen compositing tools, as does OpenShot. DaVinci Resolve is also capable of compositing work through its Fusion page, though chroma key is not specifically documented in the feature summary used here."
    },
    {
      "question": "Are any of these editors paid or subscription-based?",
      "answer": "No. OpenShot and Shotcut are entirely free and open source with no paid tier. DaVinci Resolve's base version is also free, with an optional one-time $295 Studio license rather than a recurring subscription."
    },
    {
      "question": "Which editor supports ChromeOS?",
      "answer": "OpenShot is the only one of the three that documents ChromeOS support, added with version 2.6.0 in 2021. DaVinci Resolve and Shotcut both run on Windows, macOS, and Linux."
    },
    {
      "question": "What's the main advantage of DaVinci Resolve's Studio upgrade over OpenShot or Shotcut?",
      "answer": "Studio unlocks DaVinci Resolve's Neural Engine AI tools, additional Resolve FX effects, text-based editing, support for up to 32K resolution and 120fps, and Blackmagic Cloud collaboration, none of which OpenShot or Shotcut offer at any price."
    }
  ]
};

export default davinciResolveVsOpenshotVsShotcutContent;
