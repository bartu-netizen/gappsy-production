import type { GroupComparisonContent } from './types';

const davinciResolveVsOliveVideoEditorVsOpenshotContent: GroupComparisonContent = {
  "verdict": "DaVinci Resolve outclasses the other two in raw capability, offering an industry-benchmark, free editing, color, VFX, and audio suite with a one-time $295 upgrade rather than a subscription. OpenShot is the more dependable free-only pick for beginners who just want stable drag-and-drop editing, while Olive Video Editor's node-based compositing is genuinely interesting but remains alpha software its own developers call highly unstable. None of the three should be judged purely on features without weighing DaVinci Resolve's steeper learning curve and Olive's stability risk.",
  "bestFor": {
    "davinci-resolve": "Professionals and serious hobbyists who want free, industry-benchmark editing, color grading, VFX, and audio tools in one integrated app",
    "olive-video-editor": "Experimenters and node-based compositing enthusiasts who are comfortable working with unstable alpha software",
    "openshot": "Beginners who want a stable, simple, drag-and-drop free editor with a gentle learning curve"
  },
  "highlights": [
    {
      "title": "A free suite that rivals paid software",
      "description": "DaVinci Resolve's free tier includes professional editing, color grading, Fusion VFX compositing, and Fairlight audio post-production in a single app, with no watermark or time limit.",
      "toolSlugs": [
        "davinci-resolve"
      ]
    },
    {
      "title": "One-time purchase instead of a subscription",
      "description": "The DaVinci Resolve Studio upgrade is a $295 one-time perpetual license that unlocks AI tools, 32K resolution, and text-based editing, avoiding the recurring fees of subscription editors.",
      "toolSlugs": [
        "davinci-resolve"
      ]
    },
    {
      "title": "Node graph compositing sets Olive apart",
      "description": "Olive builds effects and transitions as a connected graph of nodes rather than a fixed effects stack, a modular workflow more commonly found in tools like Resolve's Fusion page.",
      "toolSlugs": [
        "olive-video-editor"
      ]
    },
    {
      "title": "Stability is not equal across the three",
      "description": "OpenShot and DaVinci Resolve are considered production-ready, while Olive is officially labeled alpha software and described by its own developers as highly unstable.",
      "toolSlugs": [
        "olive-video-editor",
        "openshot",
        "davinci-resolve"
      ]
    },
    {
      "title": "OpenShot keeps the learning curve low",
      "description": "OpenShot's drag-and-drop interface and unlimited tracks and layers make it an approachable starting point for editors new to non-linear editing.",
      "toolSlugs": [
        "openshot"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Editing",
      "rows": [
        {
          "feature": "Non-linear timeline editing",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "available",
            "openshot": "available"
          }
        },
        {
          "feature": "Node-based, graph compositing",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "available",
            "openshot": "unavailable"
          },
          "note": "DaVinci Resolve offers this via its Fusion page; Olive builds its entire effects pipeline around node graphs."
        }
      ]
    },
    {
      "group": "Color and Audio",
      "rows": [
        {
          "feature": "Dedicated professional color grading tools",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "limited",
            "openshot": "limited"
          },
          "note": "Olive integrates OpenColorIO color management rather than a full grading page; OpenShot has fewer advanced color tools than Resolve."
        },
        {
          "feature": "Dedicated multi-track audio post-production suite",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "not-documented",
            "openshot": "limited"
          },
          "note": "OpenShot offers audio mixing and waveform visualization but not a full Fairlight-style suite."
        }
      ]
    },
    {
      "group": "Platform and Stability",
      "rows": [
        {
          "feature": "Cross-platform on Windows, macOS, and Linux",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "available",
            "openshot": "available"
          }
        },
        {
          "feature": "Production-ready stability",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "unavailable",
            "openshot": "available"
          },
          "note": "Olive is officially labeled alpha software and described as highly unstable by its own developers."
        }
      ]
    },
    {
      "group": "Cost and Support",
      "rows": [
        {
          "feature": "Fully free with no paid upgrade tier",
          "statuses": {
            "davinci-resolve": "limited",
            "olive-video-editor": "available",
            "openshot": "available"
          },
          "note": "DaVinci Resolve's base version is free, but advanced AI and high-resolution tools require the paid Studio license."
        },
        {
          "feature": "Vendor-backed commercial support option",
          "statuses": {
            "davinci-resolve": "available",
            "olive-video-editor": "unavailable",
            "openshot": "unavailable"
          },
          "note": "Olive and OpenShot rely on community forums and GitHub rather than a company offering paid support."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is DaVinci Resolve actually free, or is that just a trial?",
      "answer": "The base version of DaVinci Resolve is permanently free with no watermark or time limit, covering editing, color grading, VFX, and audio up to Ultra HD at 60fps. A separate $295 one-time DaVinci Resolve Studio license unlocks AI-powered tools, 32K resolution, and Blackmagic Cloud collaboration."
    },
    {
      "question": "Is Olive Video Editor stable enough for real client work?",
      "answer": "Not currently. Olive is officially labeled alpha software, and its own developers describe it as highly unstable following a large architectural rewrite. It is better suited to hobbyists and experimenters than to paid production deadlines."
    },
    {
      "question": "Which of the three is easiest for a complete beginner?",
      "answer": "OpenShot is generally the most approachable, with a stable, beginner-friendly drag-and-drop interface, unlimited tracks and layers, and no watermarks or feature restrictions."
    },
    {
      "question": "Does OpenShot have color grading tools as advanced as DaVinci Resolve?",
      "answer": "No. OpenShot includes basic color tools, but DaVinci Resolve's grading suite is built on the original da Vinci Systems technology and is considered an industry benchmark used widely in professional film and television post-production."
    },
    {
      "question": "What is node-based compositing and why does Olive use it?",
      "answer": "Node-based compositing builds effects and transitions as a graph of connected nodes instead of a fixed effects stack, giving a modular, non-destructive workflow similar to professional tools like Resolve's Fusion page. It is Olive's headline differentiator from OpenShot and other free editors."
    },
    {
      "question": "Can I install all three editors and compare them myself?",
      "answer": "Yes. All three are free and run on Windows and macOS (as well as Linux), so there is no cost barrier to testing DaVinci Resolve, Olive, and OpenShot side by side on the same project."
    }
  ]
};

export default davinciResolveVsOliveVideoEditorVsOpenshotContent;
