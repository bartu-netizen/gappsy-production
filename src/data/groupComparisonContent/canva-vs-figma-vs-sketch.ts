import type { GroupComparisonContent } from './types';

const canvaVsFigmaVsSketchContent: GroupComparisonContent = {
  "verdict": "Canva is the fastest path to polished marketing and social graphics for non-designers using a huge template library. Figma is the dominant browser-based, real-time collaborative platform for structured UI and UX design used by product teams of any size. Sketch remains a mature native-Mac vector design tool with per-editor pricing and an optional one-time license, but it has ceded significant collaborative-design market share to Figma over the past decade.",
  "bestFor": {
    "canva": "Non-designers, marketers, and small businesses who need fast, template-driven graphics for social media, presentations, and print.",
    "figma": "Product design teams who need real-time collaborative UI design, prototyping, and developer handoff in the browser.",
    "sketch": "Mac-based UI and UX designers who want a native app experience and the option of a one-time license instead of a subscription."
  },
  "highlights": [
    {
      "title": "Template-Driven Simplicity",
      "description": "Canva offers more than 250,000 templates and a drag-and-drop editor built specifically for non-designers.",
      "toolSlugs": [
        "canva"
      ]
    },
    {
      "title": "Real-Time Multiplayer Collaboration",
      "description": "Figma pioneered live, simultaneous multi-user editing in the browser; Sketch added its own collaboration features later but remains a Mac-only native app.",
      "toolSlugs": [
        "figma",
        "sketch"
      ]
    },
    {
      "title": "Native macOS Performance",
      "description": "Sketch is a purpose-built native Mac application, in contrast to Figma and Canva's fully browser-based approach.",
      "toolSlugs": [
        "sketch"
      ]
    },
    {
      "title": "One-Time License Option",
      "description": "Sketch offers a $120 one-time Mac-only license for freelancers who don't need collaboration features, unlike Canva and Figma, which are subscription-only.",
      "toolSlugs": [
        "sketch"
      ]
    },
    {
      "title": "Free Entry Tier",
      "description": "Canva and Figma both offer a genuinely usable free plan; Sketch has no free plan, only paid per-editor subscriptions or the one-time license.",
      "toolSlugs": [
        "canva",
        "figma"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Design Capabilities",
      "rows": [
        {
          "feature": "Vector-based design tools",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "sketch": "available"
          }
        },
        {
          "feature": "Interactive prototyping",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "sketch": "available"
          }
        },
        {
          "feature": "Template library",
          "statuses": {
            "canva": "available",
            "figma": "not-documented",
            "sketch": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Handoff",
      "rows": [
        {
          "feature": "Real-time multiplayer editing",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "sketch": "available"
          }
        },
        {
          "feature": "Developer handoff tools",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "sketch": "available"
          }
        }
      ]
    },
    {
      "group": "Platform and Pricing",
      "rows": [
        {
          "feature": "Native desktop app",
          "statuses": {
            "canva": "available",
            "figma": "not-documented",
            "sketch": "available"
          },
          "note": "Canva ships native Mac and Windows apps; Sketch is a native macOS app. Figma's desktop app is not documented in the feature set used here."
        },
        {
          "feature": "One-time purchase license option",
          "statuses": {
            "canva": "unavailable",
            "figma": "unavailable",
            "sketch": "available"
          }
        },
        {
          "feature": "Free plan",
          "statuses": {
            "canva": "available",
            "figma": "available",
            "sketch": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools is easiest for non-designers?",
      "answer": "Canva is by far the easiest for non-designers, thanks to its drag-and-drop editor and library of more than 250,000 templates. Figma and Sketch are both built around structured interface design and assume more design familiarity."
    },
    {
      "question": "Does Sketch work on Windows?",
      "answer": "No. Sketch's native application is Mac-only, though it also offers a browser-based web app and mobile companion apps for previewing designs. Figma and Canva, by contrast, are fully cross-platform."
    },
    {
      "question": "Can multiple people edit the same file at once in Figma and Sketch?",
      "answer": "Yes. Both support real-time multiplayer collaboration on their subscription plans. Figma pioneered this model as a fully browser-based product, while Sketch added collaboration features to its native Mac app later."
    },
    {
      "question": "Is there a free plan for Sketch?",
      "answer": "No. Sketch has no free plan; it is sold on a per-editor subscription starting at $12/month billed annually, or as a $120 one-time Mac-only license without collaboration features. Canva and Figma both offer genuinely usable free tiers."
    },
    {
      "question": "Which tool is best for developer handoff?",
      "answer": "Figma and Sketch both include dedicated developer handoff tools for inspecting specs and exporting assets, with Figma's Dev Mode being the more actively developed of the two. Canva is not built for structured design-to-code handoff."
    },
    {
      "question": "Can I buy Sketch without a subscription?",
      "answer": "Yes. Sketch offers a $120 one-time Mac-only license that includes one year of updates, aimed at freelancers who want an offline native app without ongoing collaboration features. Canva and Figma are both subscription-based, with free tiers available."
    }
  ]
};

export default canvaVsFigmaVsSketchContent;
