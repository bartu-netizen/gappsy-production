import type { GroupComparisonContent } from './types';

const canvaVsFigmaVsLunacyContent: GroupComparisonContent = {
  "verdict": "Canva and Figma solve different problems more than they compete head to head: Canva is built for fast, templated marketing and social content, while Figma is the industry-standard collaborative tool for UI design, prototyping, and developer handoff. Lunacy sits closer to Figma's territory as a free, native desktop alternative with offline support and Sketch file compatibility, though its collaboration ecosystem is far smaller. The right pick depends on whether the job is producing visual content quickly or designing and shipping a digital product.",
  "bestFor": {
    "canva": "Marketers, social media managers, and non-designers who need to produce templated visual content quickly",
    "figma": "Product design teams that need real-time collaborative UI design, prototyping, and developer handoff",
    "lunacy": "Individuals and small teams who want a free, offline-capable native desktop UI design tool with built-in AI and asset libraries"
  },
  "highlights": [
    {
      "title": "Canva wins on template breadth",
      "description": "Canva ships with more than 250,000 templates spanning social media, presentations, documents, video, and print, aimed squarely at non-designers.",
      "toolSlugs": [
        "canva"
      ]
    },
    {
      "title": "Figma pioneered real-time multiplayer design",
      "description": "Figma's Rust-based multiplayer servers let multiple people edit the same design file simultaneously with live cursors, a workflow that remains its core strength for product teams.",
      "toolSlugs": [
        "figma"
      ]
    },
    {
      "title": "Lunacy is the only one built to run fully offline",
      "description": "Unlike the fully browser-based Figma, Lunacy is a native desktop app for Windows, macOS, and Linux that works without an internet connection.",
      "toolSlugs": [
        "lunacy"
      ]
    },
    {
      "title": "AI tooling has landed in all three",
      "description": "Canva's Magic Studio, Figma Make, and Lunacy's built-in AI background remover and upscaler all bring generative AI into the design workflow, though each is scoped differently.",
      "toolSlugs": [
        "canva",
        "figma",
        "lunacy"
      ]
    },
    {
      "title": "Free plans differ in generosity",
      "description": "Canva and Lunacy both offer usable free tiers with large asset libraries, while Figma's free Starter plan caps users at just 3 design files.",
      "toolSlugs": [
        "canva",
        "lunacy",
        "figma"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Design Tools",
      "rows": [
        {
          "feature": "Precision vector and UI design editing",
          "statuses": {
            "canva": "limited",
            "figma": "available",
            "lunacy": "available"
          },
          "note": "Canva prioritizes templated drag-and-drop design over pixel-level precision."
        },
        {
          "feature": "Large built-in template library",
          "statuses": {
            "canva": "available",
            "figma": "not-documented",
            "lunacy": "not-documented"
          },
          "note": "Canva documents 250,000+ templates; a comparable library is not documented for Figma or Lunacy."
        }
      ]
    },
    {
      "group": "Collaboration",
      "rows": [
        {
          "feature": "Real-time multiplayer editing",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "lunacy": "limited"
          },
          "note": "Lunacy offers cloud document sharing on paid tiers, but real-time multiplayer collaboration is less mature than Figma's."
        },
        {
          "feature": "Developer handoff tools (specs and code extraction)",
          "statuses": {
            "canva": "not-documented",
            "figma": "available",
            "lunacy": "not-documented"
          },
          "note": "Figma's Dev Mode is built specifically for design-to-engineering handoff."
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "Built-in generative AI design tools",
          "statuses": {
            "canva": "available",
            "figma": "available",
            "lunacy": "available"
          },
          "note": "Canva's Magic Studio, Figma Make, and Lunacy's AI background remover and upscaler differ in scope and depth."
        }
      ]
    },
    {
      "group": "Platform and Pricing",
      "rows": [
        {
          "feature": "Usable free plan without heavy feature gating",
          "statuses": {
            "canva": "available",
            "figma": "limited",
            "lunacy": "available"
          },
          "note": "Figma's free Starter plan is capped at 3 design files, 3 FigJam files, and 3 Slides files."
        },
        {
          "feature": "Native offline desktop app",
          "statuses": {
            "canva": "limited",
            "figma": "unavailable",
            "lunacy": "available"
          },
          "note": "Figma is fully browser-based and requires a constant internet connection; Canva's desktop apps still require connectivity for most features."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Canva a real alternative to Figma for UI design?",
      "answer": "Not really. Canva is built for fast, templated marketing and social content with less precise, pixel-level control, while Figma is purpose-built for UI design, component systems, and developer handoff. They overlap in being visual design tools but target different core jobs."
    },
    {
      "question": "Does Lunacy work without an internet connection?",
      "answer": "Yes. Lunacy is a native desktop app for Windows, macOS, and Linux that works fully offline, unlike Figma, which is entirely browser-based and depends on a constant internet connection."
    },
    {
      "question": "Which of the three has the most generous free plan?",
      "answer": "Canva and Lunacy both offer full-featured free tiers with large template or asset libraries. Figma's free Starter plan is more limited, capping users at just 3 design files, 3 FigJam files, and 3 Slides files."
    },
    {
      "question": "Can Lunacy open Figma design files?",
      "answer": "That is not documented. Lunacy does have native compatibility with .sketch files, letting it open, edit, and save files created in Sketch, which is a different capability from Figma file compatibility."
    },
    {
      "question": "Which tool is best for a product team designing an app together?",
      "answer": "Figma, thanks to its real-time multiplayer editing, component and variable systems, and Dev Mode for developer handoff, all of which are built specifically around collaborative product design workflows."
    },
    {
      "question": "Do all three tools include AI-powered design features?",
      "answer": "Yes, though scoped differently: Canva offers the Magic Studio suite including Magic Write and Magic Design, Figma offers the prompt-to-prototype Figma Make tool, and Lunacy includes a built-in AI background remover, image upscaler, and avatar generator."
    }
  ]
};

export default canvaVsFigmaVsLunacyContent;
