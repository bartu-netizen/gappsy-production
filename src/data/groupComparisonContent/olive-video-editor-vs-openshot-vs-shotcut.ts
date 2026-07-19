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
      "description": "Olive builds effects and transitions as a graph of connected nodes rather than a fixed stack, a workflow closer to professional compositing tools than what OpenShot or Shotcut offer.",
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
      "description": "Shotcut offers a portable edition that runs from a USB drive on Windows and Linux with no installation required.",
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
      "answer": "Olive's headline feature is node-based compositing: effects and transitions are built as a graph of connected nodes rather than a fixed effects stack, offering a more flexible, professional-style workflow than the fixed-stack approach used by OpenShot and Shotcut."
    },
    {
      "question": "Can Shotcut run without being installed?",
      "answer": "Yes. Shotcut offers a portable edition that runs directly from a USB drive on Windows and Linux, with the same feature set as the installed version and no installation step required."
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
