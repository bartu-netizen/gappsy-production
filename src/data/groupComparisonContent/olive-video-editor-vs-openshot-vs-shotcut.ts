import type { GroupComparisonContent } from './types';

const oliveVideoEditorVsOpenshotVsShotcutContent: GroupComparisonContent = {
  "verdict": "All three are free, open-source, cross-platform editors that explicitly compete with one another, but they differ sharply in maturity and workflow. Olive's node-based compositing is its most distinctive feature yet also its biggest risk, since it remains alpha software; OpenShot and Shotcut are both considered stable, with Shotcut standing out for native FFmpeg format support, built-in capture tools, and portable no-install builds.",
  "bestFor": {
    "olive-video-editor": "Users who want node-based, non-destructive compositing and are willing to tolerate alpha-stage instability",
    "openshot": "Newcomers who want the simplest, most stable drag-and-drop editing experience",
    "shotcut": "Users who need broad native format support, built-in capture tools, or a portable install-free build"
  },
  "highlights": [
    {
      "title": "Node-based compositing is Olive's core differentiator",
      "description": "Rather than relying on a fixed effects stack, Olive represents effects and transitions as a network of interconnected nodes — a workflow that resembles professional compositing software more than anything OpenShot or Shotcut provide.",
      "toolSlugs": [
        "olive-video-editor"
      ]
    },
    {
      "title": "Stability favors OpenShot and Shotcut",
      "description": "OpenShot and Shotcut are considered production-stable, while Olive is officially alpha software described by its developers as highly unstable.",
      "toolSlugs": [
        "openshot",
        "shotcut",
        "olive-video-editor"
      ]
    },
    {
      "title": "Shotcut edits natively via FFmpeg",
      "description": "Shotcut is built directly on FFmpeg, letting users edit hundreds of audio and video formats on the timeline without transcoding first.",
      "toolSlugs": [
        "shotcut"
      ]
    },
    {
      "title": "Shotcut runs portable, install-free",
      "description": "Shotcut ships a portable edition you can run straight off a USB stick on Windows or Linux, with nothing to install.",
      "toolSlugs": [
        "shotcut"
      ]
    },
    {
      "title": "OpenShot keeps onboarding simple",
      "description": "OpenShot's drag-and-drop timeline, unlimited tracks and layers, and beginner-friendly interface make it an easy first non-linear editor.",
      "toolSlugs": [
        "openshot"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Compositing and Effects",
      "rows": [
        {
          "feature": "Node-based, graph compositing",
          "statuses": {
            "olive-video-editor": "available",
            "openshot": "unavailable",
            "shotcut": "unavailable"
          }
        },
        {
          "feature": "Chroma key / green screen compositing",
          "statuses": {
            "olive-video-editor": "not-documented",
            "openshot": "available",
            "shotcut": "available"
          }
        }
      ]
    },
    {
      "group": "Format and Performance",
      "rows": [
        {
          "feature": "Native FFmpeg format support without transcoding",
          "statuses": {
            "olive-video-editor": "available",
            "openshot": "available",
            "shotcut": "available"
          }
        },
        {
          "feature": "Disk caching for smooth timeline scrubbing",
          "statuses": {
            "olive-video-editor": "available",
            "openshot": "not-documented",
            "shotcut": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Capture and Deployment",
      "rows": [
        {
          "feature": "Built-in screen, webcam, and audio capture",
          "statuses": {
            "olive-video-editor": "not-documented",
            "openshot": "not-documented",
            "shotcut": "available"
          }
        },
        {
          "feature": "Portable, installation-free build",
          "statuses": {
            "olive-video-editor": "not-documented",
            "openshot": "not-documented",
            "shotcut": "available"
          }
        }
      ]
    },
    {
      "group": "Platform and Stability",
      "rows": [
        {
          "feature": "Cross-platform on Windows, macOS, and Linux",
          "statuses": {
            "olive-video-editor": "available",
            "openshot": "available",
            "shotcut": "available"
          }
        },
        {
          "feature": "Production-ready stability",
          "statuses": {
            "olive-video-editor": "unavailable",
            "openshot": "available",
            "shotcut": "available"
          },
          "note": "Olive is officially labeled alpha software and described as highly unstable by its own developers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three free editors is the most stable?",
      "answer": "OpenShot and Shotcut are both considered production-stable. Olive Video Editor remains officially labeled alpha software and is described by its own developers as highly unstable, following a large-scale architectural rewrite."
    },
    {
      "question": "What makes Olive different from OpenShot and Shotcut?",
      "answer": "Node-based compositing is Olive's headline feature: instead of a fixed effects stack, it models effects and transitions through a network of interconnected nodes, giving editors a more flexible, professional-style workflow than the fixed-stack approach OpenShot and Shotcut use."
    },
    {
      "question": "Can Shotcut run without being installed?",
      "answer": "Yes. Shotcut's portable edition runs right off a USB drive on Windows or Linux, carrying the same feature set as the installed version with no setup step needed."
    },
    {
      "question": "Do any of these editors include built-in screen recording?",
      "answer": "Shotcut includes built-in screen, webcam, and audio capture tools. This is not documented as a feature of Olive Video Editor or OpenShot."
    },
    {
      "question": "Are all three of these editors really free with no watermarks?",
      "answer": "Yes. Olive Video Editor, OpenShot, and Shotcut are all free and open source under GPLv3, with no watermarks, subscriptions, or paywalled export features."
    },
    {
      "question": "Which editor is best for green screen or chroma key work?",
      "answer": "OpenShot and Shotcut both include chroma key compositing tools for green-screen background removal. This is not documented as a feature of Olive Video Editor."
    }
  ]
};

export default oliveVideoEditorVsOpenshotVsShotcutContent;
