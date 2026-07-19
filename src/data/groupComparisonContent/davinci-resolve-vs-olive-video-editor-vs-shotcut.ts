import type { GroupComparisonContent } from './types';

const davinciResolveVsOliveVideoEditorVsShotcutContent: GroupComparisonContent = {
  "verdict": "DaVinci Resolve is the professional-grade choice, combining a genuinely free core with an optional one-time $295 Studio upgrade for AI tools and higher resolutions. Shotcut is a mature, stable, fully free open-source editor with broad native format support via FFmpeg, while Olive brings a distinctive node-based compositing workflow but remains officially alpha software that its own developers describe as highly unstable.",
  "bestFor": {
    "davinci-resolve": "Creators and professionals who want free, professional-grade editing, color grading, VFX, and audio tools with an optional one-time paid upgrade for advanced AI features.",
    "olive-video-editor": "Hobbyists and open-source enthusiasts curious about node-based compositing who are comfortable using alpha-stage, still-unstable software.",
    "shotcut": "Users who want a stable, fully free, cross-platform editor with wide native format support and no installation required for portable use."
  },
  "highlights": [
    {
      "title": "Free, No-Watermark Core",
      "description": "All three editors are free to use with no watermarks on exports; DaVinci Resolve's Studio upgrade is an optional one-time purchase rather than a requirement.",
      "toolSlugs": [
        "davinci-resolve",
        "olive-video-editor",
        "shotcut"
      ]
    },
    {
      "title": "Node-Based Compositing",
      "description": "Rather than stacking effects in a fixed list, Olive represents them as a network of linked nodes you wire together — a modular approach more commonly found in tools like Nuke or Resolve's Fusion page.",
      "toolSlugs": [
        "olive-video-editor"
      ]
    },
    {
      "title": "Industry-Benchmark Color Grading",
      "description": "DaVinci Resolve's color-grading toolset descends from the original da Vinci Systems technology and remains the benchmark professionals reach for across film and television post houses.",
      "toolSlugs": [
        "davinci-resolve"
      ]
    },
    {
      "title": "Production Stability",
      "description": "Shotcut and DaVinci Resolve are both considered production-stable software, whereas Olive is officially labeled alpha and described by its own developers as highly unstable.",
      "toolSlugs": [
        "shotcut",
        "davinci-resolve"
      ]
    },
    {
      "title": "One-Time Paid Upgrade Path",
      "description": "DaVinci Resolve Studio is a one-time $295 perpetual license that unlocks AI tools and higher resolutions, a paid option neither Olive nor Shotcut offers.",
      "toolSlugs": [
        "davinci-resolve"
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
            "olive-video-editor": "available",
            "shotcut": "available"
          }
        },
        {
          "feature": "Node-based compositing",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "available",
            "shotcut": "unavailable"
          },
          "note": "DaVinci Resolve's Fusion page and Olive's core editor both use node-based compositing; Shotcut uses a fixed filter stack instead."
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
            "olive-video-editor": "limited",
            "shotcut": "available"
          },
          "note": "Olive integrates OpenColorIO for color management but does not document a dedicated grading suite."
        },
        {
          "feature": "Multi-track audio mixing suite",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "not-documented",
            "shotcut": "limited"
          },
          "note": "Resolve has a dedicated Fairlight page; Shotcut offers audio filters and balance tools rather than a full mixing suite."
        },
        {
          "feature": "AI-powered post-production tools",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "unavailable",
            "shotcut": "unavailable"
          },
          "note": "DaVinci Resolve's Neural Engine AI tools require the paid Studio upgrade."
        }
      ]
    },
    {
      "group": "Platform and Stability",
      "rows": [
        {
          "feature": "Portable, installation-free builds",
          "statuses": {
            "davinci-resolve": "unavailable",
            "olive-video-editor": "not-documented",
            "shotcut": "available"
          }
        },
        {
          "feature": "Production-stable release status",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "unavailable",
            "shotcut": "available"
          },
          "note": "Olive is officially labeled alpha software by its own developers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is DaVinci Resolve completely free?",
      "answer": "Yes — the free base edition of DaVinci Resolve has no watermark, no time limit, and no subscription requirement, and it covers editing, color grading, visual effects, and audio at resolutions up to Ultra HD/60fps. Only the separate Studio edition, a $295 one-time perpetual license, adds AI tools, higher-resolution support, and extra effects."
    },
    {
      "question": "Is Olive Video Editor stable enough for real projects?",
      "answer": "Olive is officially labeled alpha software by its own developers and has been described in its own documentation as highly unstable, reflecting a large-scale rewrite the codebase underwent. It is best suited to hobbyists and open-source enthusiasts experimenting with its node-based compositing rather than production-stable work."
    },
    {
      "question": "What makes Shotcut different from DaVinci Resolve and Olive?",
      "answer": "Shotcut is built directly on FFmpeg, which means it can natively handle hundreds of different audio and video formats without any transcoding step, and it can even run portably from a USB drive with no installation required. Unlike DaVinci Resolve, it has no paid upgrade tier, and unlike Olive, it is considered stable software."
    },
    {
      "question": "Which of these three editors has node-based compositing?",
      "answer": "DaVinci Resolve's Fusion page and Olive Video Editor share a node-based compositing approach, wiring effects and transitions together as interconnected nodes rather than a linear list. Shotcut uses a more conventional fixed effects stack instead."
    },
    {
      "question": "Do any of these editors require a subscription?",
      "answer": "No. All three are free to download and use without a subscription. DaVinci Resolve offers an optional one-time $295 Studio license, while Olive and Shotcut are entirely free and open source with no paid tier at all."
    },
    {
      "question": "Which editor is best for professional color grading?",
      "answer": "DaVinci Resolve is the strongest choice for color grading, since its color-correction tools trace back to the original da Vinci Systems technology and are considered an industry benchmark. Shotcut includes color grading filters, while Olive relies on OpenColorIO color management rather than a dedicated grading suite."
    }
  ]
};

export default davinciResolveVsOliveVideoEditorVsShotcutContent;
