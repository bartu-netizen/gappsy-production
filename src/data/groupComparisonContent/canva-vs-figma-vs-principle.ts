import type { GroupComparisonContent } from './types';

const canvaVsFigmaVsPrincipleContent: GroupComparisonContent = {
  "verdict": "Canva and Figma serve very different purposes than Principle: Canva is for quick, template-driven marketing graphics, and Figma is a full collaborative platform for UI design, prototyping, and developer handoff. Principle is a narrowly focused, Mac-only tool purely for polishing interactive motion and micro-interaction detail, most often used downstream of a Figma or Sketch file rather than as a standalone design platform.",
  "bestFor": {
    "canva": "Non-designers and marketers who need fast, template-driven graphics without deep design tool expertise.",
    "figma": "Product design teams who need an end-to-end, real-time collaborative platform for UI design, prototyping, and developer handoff.",
    "principle": "UI and UX designers on Mac who need to communicate detailed motion and micro-interaction timing beyond basic click-through prototypes."
  },
  "highlights": [
    {
      "title": "Purpose-Built for Motion Design",
      "description": "Principle is a timeline-based editor focused specifically on interaction and animation detail, typically importing artboards directly from Figma or Sketch files.",
      "toolSlugs": [
        "principle"
      ]
    },
    {
      "title": "One-Time License vs Subscriptions",
      "description": "Principle is sold as a $129 one-time perpetual license, unlike Canva and Figma's subscription-based pricing.",
      "toolSlugs": [
        "principle"
      ]
    },
    {
      "title": "Template-First Simplicity",
      "description": "Canva is built around a library of more than 250,000 templates for non-designers rather than motion or interface design precision.",
      "toolSlugs": [
        "canva"
      ]
    },
    {
      "title": "Real-Time Collaboration at Scale",
      "description": "Figma's browser-based multiplayer editing is used by product teams of any size, a capability neither Principle nor Canva offers.",
      "toolSlugs": [
        "figma"
      ]
    },
    {
      "title": "Mac-Only Native App",
      "description": "Principle runs natively on Intel and Apple Silicon Macs but has no Windows or Linux version, unlike the fully cross-platform Canva and Figma.",
      "toolSlugs": [
        "principle"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Design and Collaboration",
      "rows": [
        {
          "feature": "Real-time multiplayer editing",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "principle": "unavailable"
          }
        },
        {
          "feature": "Template library",
          "statuses": {
            "canva": "available",
            "figma": "not-documented",
            "principle": "not-documented"
          }
        },
        {
          "feature": "Interactive prototyping",
          "statuses": {
            "canva": "unavailable",
            "figma": "available",
            "principle": "available"
          }
        },
        {
          "feature": "Timeline-based animation editor",
          "statuses": {
            "canva": "unavailable",
            "figma": "not-documented",
            "principle": "available"
          }
        }
      ]
    },
    {
      "group": "Platform and Pricing",
      "rows": [
        {
          "feature": "One-time purchase pricing option",
          "statuses": {
            "canva": "unavailable",
            "figma": "unavailable",
            "principle": "available"
          }
        },
        {
          "feature": "Native desktop app",
          "statuses": {
            "canva": "available",
            "figma": "not-documented",
            "principle": "available"
          },
          "note": "Principle is Mac-only; Canva ships native Mac and Windows apps."
        },
        {
          "feature": "Free plan (ongoing, no purchase required)",
          "statuses": {
            "canva": "available",
            "figma": "available",
            "principle": "unavailable"
          },
          "note": "Principle offers a 14-day free trial rather than an ongoing free plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I use Principle without Figma?",
      "answer": "Yes, Principle can be used on its own, but it is most commonly used alongside Figma or Sketch, since it lets designers import artboards from those tools and then add detailed timeline-based animation on top."
    },
    {
      "question": "Does Principle work on Windows?",
      "answer": "No. Principle is a Mac-only native application, though finished prototypes can be shared via a web link that is viewable in any browser, including on Windows, Android, and Linux."
    },
    {
      "question": "Is Canva suitable for interactive prototyping?",
      "answer": "No. Canva is built for template-driven graphics like social media posts, presentations, and print materials, not for interactive prototyping or interface design systems. Figma and Principle are both built for that purpose."
    },
    {
      "question": "Is Principle a subscription or one-time purchase?",
      "answer": "Principle is sold as a one-time perpetual license for $129, which includes one year of free updates, rather than a recurring subscription like Canva or Figma."
    },
    {
      "question": "Which of the three has real-time team collaboration?",
      "answer": "Figma is the only one of the three built around real-time multiplayer collaboration, letting multiple people edit the same file simultaneously in the browser. Canva and Principle are not documented as offering this kind of live, simultaneous multi-user editing."
    },
    {
      "question": "Does Principle have a free trial?",
      "answer": "Yes. Principle offers a 14-day free trial before requiring the one-time $129 purchase, so designers can test the timeline-based animation editor before committing to the license."
    }
  ]
};

export default canvaVsFigmaVsPrincipleContent;
