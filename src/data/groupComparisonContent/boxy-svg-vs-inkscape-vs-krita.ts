import type { GroupComparisonContent } from './types';

const boxySvgVsInkscapeVsKritaContent: GroupComparisonContent = {
  "verdict": "Boxy SVG is a lightweight, code-aware SVG editor built by a solo developer for web designers and front-end developers who want direct markup control and clean exported files at a low one-time cost. Inkscape is a fuller, entirely free vector suite with a broader toolset and file-format support that goes well beyond SVG. Krita, once again, is a different kind of tool altogether: a raster painting and animation program rather than a vector editor, so it complements rather than directly replaces Boxy SVG or Inkscape. Teams doing pure SVG or icon work will choose between Boxy SVG and Inkscape based on budget and depth of feature needs, and add Krita only when painted or animated artwork is also part of the job.",
  "bestFor": {
    "boxy-svg": "Web designers and front-end developers who want a lightweight, code-level SVG editor with clean markup output and built-in stock asset integration, at a low one-time cost.",
    "inkscape": "Designers who need a full, free vector illustration suite with a deep toolset and broad file-format support beyond just SVG.",
    "krita": "Illustrators and animators who need professional-grade painting and animation tools rather than a focused SVG or vector editor."
  },
  "highlights": [
    {
      "title": "Boxy SVG trades breadth for a code-first workflow",
      "description": "Boxy SVG's built-in code view and Chromium-based inspector give front-end developers direct control over SVG and CSS markup, a workflow Inkscape does not document in the same code-level way.",
      "toolSlugs": [
        "boxy-svg",
        "inkscape"
      ]
    },
    {
      "title": "Inkscape offers the deeper, fully free vector toolset",
      "description": "Inkscape's filter gallery, extension system, and broad import and export support for AI, EPS, PDF, and PostScript files go beyond Boxy SVG's more focused SVG-centric feature set, entirely for free.",
      "toolSlugs": [
        "inkscape",
        "boxy-svg"
      ]
    },
    {
      "title": "Krita fills the painting and animation gap",
      "description": "Krita's brush engines, non-destructive layers, and animation timeline address raster painting and 2D animation work that neither Boxy SVG nor Inkscape is designed for.",
      "toolSlugs": [
        "krita"
      ]
    },
    {
      "title": "Pricing models differ sharply",
      "description": "Inkscape and Krita are fully free open-source projects, while Boxy SVG mixes a free browser app with a $19.99 one-time desktop purchase and an optional premium web subscription for advanced CSS and JavaScript editing.",
      "toolSlugs": [
        "inkscape",
        "krita",
        "boxy-svg"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Vector Tools",
      "rows": [
        {
          "feature": "Native SVG format focus",
          "statuses": {
            "boxy-svg": "available",
            "inkscape": "available",
            "krita": "unavailable"
          }
        },
        {
          "feature": "Path Boolean operations (unite, subtract, intersect)",
          "statuses": {
            "boxy-svg": "available",
            "inkscape": "not-documented",
            "krita": "unavailable"
          }
        },
        {
          "feature": "Raster painting and brush engines",
          "statuses": {
            "boxy-svg": "unavailable",
            "inkscape": "unavailable",
            "krita": "available"
          }
        }
      ]
    },
    {
      "group": "Platform and Ecosystem",
      "rows": [
        {
          "feature": "Cross-platform desktop app (Windows, macOS, Linux)",
          "statuses": {
            "boxy-svg": "available",
            "inkscape": "available",
            "krita": "available"
          }
        },
        {
          "feature": "Stock asset or font library integration",
          "statuses": {
            "boxy-svg": "available",
            "inkscape": "not-documented",
            "krita": "not-documented"
          },
          "note": "Boxy SVG integrates Pixabay stock assets and Google Fonts directly in the editor."
        },
        {
          "feature": "Extension, plugin, or scripting system",
          "statuses": {
            "boxy-svg": "not-documented",
            "inkscape": "available",
            "krita": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "Full feature set available for free",
          "statuses": {
            "boxy-svg": "limited",
            "inkscape": "available",
            "krita": "available"
          },
          "note": "Boxy SVG's free web app covers basic editing, while advanced CSS and JavaScript editing require a paid premium tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Boxy SVG free to use?",
      "answer": "Boxy SVG offers a free web app covering basic SVG editing such as shapes, paths, text, gradients, and groups. The native desktop app costs $19.99 as a one-time purchase on the Mac App Store, and a separate premium web subscription unlocks advanced CSS styling and JavaScript editing."
    },
    {
      "question": "How does Boxy SVG compare to Inkscape for vector editing?",
      "answer": "Both are SVG-focused vector editors, but Inkscape is entirely free with a deeper toolset, a filter gallery, and broader file-format support, while Boxy SVG is a lighter, code-aware editor built by a solo developer with a built-in SVG and CSS inspector and direct Pixabay and Google Fonts integration."
    },
    {
      "question": "Can Krita edit SVG files like Boxy SVG and Inkscape?",
      "answer": "Krita includes vector layers for shapes and text, but it is fundamentally a raster painting and animation application, not an SVG-native editor. For SVG-specific editing with clean markup output, Boxy SVG or Inkscape are the better fit."
    },
    {
      "question": "Which tool is best for a beginner learning vector graphics?",
      "answer": "Boxy SVG's lightweight interface and free web app make it approachable for beginners who mainly need basic shapes, paths, and text. Inkscape has more depth and a slightly steeper learning curve but offers a fuller toolset to grow into, all without any cost."
    },
    {
      "question": "Do any of these three tools cost money for commercial use?",
      "answer": "Inkscape and Krita can both be used commercially for free under their GPL licenses. Boxy SVG's browser app is free for basic commercial use, but its native desktop app requires the one-time $19.99 purchase and its advanced web features sit behind a premium subscription."
    }
  ]
};

export default boxySvgVsInkscapeVsKritaContent;
