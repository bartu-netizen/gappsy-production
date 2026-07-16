import type { ToolComparisonContent } from './types';

// Editorial content for the canva-vs-photoshop comparison. Every claim mirrors
// what's already documented, per-tool, in the tools table / src/data/toolContent
// — nothing invented, no fabricated "winner", no feature-support claim without
// a matching documented fact.

const canvaVsPhotoshopContent: ToolComparisonContent = {
  verdict: "Canva and Photoshop rarely compete for the same job. Canva is a template-first tool for producing marketing graphics, social posts, presentations, video, and print materials quickly, with no design training required. Photoshop is the industry-standard pixel editor for photo retouching, compositing, and digital painting, built for people who need precise, professional-grade control over an image. Someone choosing between them is usually choosing based on the task in front of them, not a general preference — a social media manager assembling an Instagram carousel needs Canva; a photographer removing a blemish and color-grading a raw file needs Photoshop. Most organizations that do both marketing content and real photo work end up using both tools side by side rather than picking one.",
  bestForToolA: "Marketers, social media managers, small business owners, students, and teams without a dedicated designer who need to produce polished graphics, presentations, video, and print materials fast using templates.",
  bestForToolB: "Photographers, retouchers, digital painters, and design professionals who need pixel-level control over images — masking, compositing, raw photo processing, and non-destructive editing.",
  whoNeedsBoth: "A marketing or content team that produces everyday social graphics and decks in Canva but also runs product photography or campaign imagery that needs real retouching, color correction, or compositing before it goes into Canva templates — for example, an in-house marketing team that shoots and retouches product photos in Photoshop, then drops the finished images into Canva to build the actual social posts and ads.",
  keyDifferences: [
    {
      title: "Core purpose",
      toolA: "Template-first content creation tool for social graphics, presentations, video, and print.",
      toolB: "Professional raster image editor for photo retouching, compositing, and digital painting.",
      whyItMatters: "Choosing the wrong tool for the job wastes time — Canva can't do pixel-level photo retouching, and Photoshop has no marketing-template workflow.",
      benefitsWho: "Marketing teams benefit from Canva's speed; photographers and retouchers benefit from Photoshop's precision."
    },
    {
      title: "Learning curve",
      toolA: "Very low — drag-and-drop editor designed for people with no design or photo-editing background.",
      toolB: "Steep — a dense, panel-heavy interface (layers, masks, channels, Smart Objects) that takes real time to master.",
      whyItMatters: "Time-to-first-usable-output matters for teams without specialists on staff, while depth of control matters for professionals doing detailed image work.",
      benefitsWho: "Non-designers and small teams benefit from Canva's low floor; trained editors benefit from Photoshop's high ceiling."
    },
    {
      title: "Pricing model",
      toolA: "Freemium — free plan available, Pro roughly $12.99/month flat per person for the full feature set.",
      toolB: "Subscription-only via Adobe Creative Cloud since 2013, no free tier — single-app plan roughly $22.99/month, or bundled into Creative Cloud All Apps around $59.99/month.",
      whyItMatters: "Budget-conscious individuals and small teams may not need a paid plan at all in Canva, while Photoshop requires an ongoing Adobe subscription regardless of usage volume.",
      benefitsWho: "Solo users and small businesses benefit from Canva's free/low-cost entry point; agencies already paying for Creative Cloud get Photoshop bundled with other Adobe apps."
    },
    {
      title: "Templates and ready-made assets",
      toolA: "Huge library of ready-made templates for social posts, decks, flyers, and video, plus a large stock photo/graphics library.",
      toolB: "No built-in marketing-template library — Photoshop starts from a blank canvas or an imported photo.",
      whyItMatters: "Template libraries save significant time for people producing recurring marketing content; they're irrelevant for photo-editing workflows that start from a real image.",
      benefitsWho: "Marketers and non-designers benefit from Canva's templates when speed matters more than originality."
    },
    {
      title: "AI generative tools",
      toolA: "Magic Studio suite — Magic Design, Magic Write, Magic Media, Magic Edit/Eraser/Expand, and a one-click background remover.",
      toolB: "Adobe Firefly-powered Generative Fill for extending or altering photo content, plus Neural Filters for skin smoothing, style transfer, and colorizing black-and-white photos.",
      whyItMatters: "Both companies have invested heavily in generative AI, but the tools are tuned for different outputs — full graphic layouts and copy versus photorealistic pixel edits within an existing photo.",
      benefitsWho: "Content creators benefit from Canva's AI for fast layout and copy generation; photo editors benefit from Photoshop's AI for realistic in-image edits."
    },
    {
      title: "Precision and non-destructive editing depth",
      toolA: "Basic layering and adjustment tools; not built for pixel-level masking or channel-based editing.",
      toolB: "Deep non-destructive workflow — Smart Objects, layer masks, adjustment layers, Camera Raw processing, and Content-Aware Fill/Scale.",
      whyItMatters: "Professional photo and compositing work requires granular, reversible control that a template editor isn't designed to provide.",
      benefitsWho: "Photographers and retouchers benefit from Photoshop's precision; casual users rarely need it."
    },
    {
      title: "Video editing",
      toolA: "Full built-in video editor for trimming, adding text, transitions, and music to short-form video content.",
      toolB: "No video editing capability — Photoshop is a still-image tool (Adobe's video tools live in Premiere Pro/After Effects).",
      whyItMatters: "Teams producing social video need this natively rather than switching to a separate application.",
      benefitsWho: "Social media and marketing teams benefit from Canva's all-in-one video editor."
    },
    {
      title: "Print production and physical products",
      toolA: "Canva Print offers direct print-on-demand fulfillment for cards, apparel, and other physical products from inside the app.",
      toolB: "No fulfillment; Photoshop supports CMYK and print-oriented settings but has no built-in print-production or prepress controls as deep as dedicated desktop-publishing or Illustrator/InDesign workflows.",
      whyItMatters: "Ordering physical prints directly removes a separate vendor step; deep prepress control matters for high-end commercial print jobs.",
      benefitsWho: "Small businesses benefit from Canva's built-in print ordering; print professionals still lean on Adobe's dedicated print tools for exacting jobs."
    },
    {
      title: "Collaboration model",
      toolA: "Real-time multiplayer editing with comments and version history, built for teams working in the same file simultaneously.",
      toolB: "Cloud Documents provide auto-save, version history, and sync across devices, but Photoshop is not built for simultaneous multi-user co-editing the way Canva is.",
      whyItMatters: "Marketing teams often need multiple people in one file at once; photo editing is typically a single-editor task where sync and history matter more than live co-editing.",
      benefitsWho: "Teams collaborating on decks or campaigns benefit from Canva's live multiplayer editing."
    },
    {
      title: "Hardware and performance requirements",
      toolA: "Runs in a browser (or lightweight desktop/mobile app) with minimal hardware requirements.",
      toolB: "Resource-intensive — benefits from a decent CPU, RAM, and GPU, especially for large files and Smart Object-heavy documents.",
      whyItMatters: "Hardware constraints can materially affect which tool is practical on a given machine.",
      benefitsWho: "Users on lower-spec or shared computers benefit from Canva's lighter footprint."
    }
  ],
  featureMatrix: [
    {
      group: "Core editing model",
      rows: [
        {
          feature: "Template-based layout editing",
          toolA: "available",
          toolB: "unavailable",
          note: "Photoshop has no marketing-template system; it edits images, not templated layouts."
        },
        {
          feature: "Pixel-level raster editing (masking, channels)",
          toolA: "unavailable",
          toolB: "available",
          note: "Canva offers basic cropping/adjustments but not channel-based pixel editing."
        },
        {
          feature: "Vector illustration tools",
          toolA: "limited",
          toolB: "unavailable",
          note: "Canva has basic shape/vector elements; precise vector illustration is Adobe Illustrator's job, not Photoshop's."
        }
      ]
    },
    {
      group: "Photo editing",
      rows: [
        {
          feature: "Raw photo processing",
          toolA: "unavailable",
          toolB: "available",
          note: "Camera Raw is built into Photoshop; Canva has no raw-file workflow."
        },
        {
          feature: "Layer masking and compositing",
          toolA: "limited",
          toolB: "available",
          note: "Canva supports basic layering; Photoshop's masking and compositing depth is far greater."
        },
        {
          feature: "Content-Aware Fill / object removal",
          toolA: "limited",
          toolB: "available",
          note: "Canva has a Magic Eraser feature; Photoshop's Content-Aware Fill is a more mature, longstanding tool."
        },
        {
          feature: "Digital painting / tablet support",
          toolA: "unavailable",
          toolB: "available",
          note: "Photoshop has deep Wacom/tablet pressure support for painting; Canva does not."
        }
      ]
    },
    {
      group: "AI features",
      rows: [
        {
          feature: "AI text-to-image generation",
          toolA: "available",
          toolB: "available",
          note: "Canva's Magic Media and Adobe Firefly (integrated in Photoshop) both generate images from prompts."
        },
        {
          feature: "AI generative fill/expand within an image",
          toolA: "available",
          toolB: "available",
          note: "Canva's Magic Expand and Photoshop's Generative Fill serve a similar purpose on different kinds of content."
        },
        {
          feature: "AI copywriting assistant",
          toolA: "available",
          toolB: "unavailable",
          note: "Magic Write is built into Canva; Photoshop has no text-generation tool."
        },
        {
          feature: "AI portrait/skin retouching filters",
          toolA: "limited",
          toolB: "available",
          note: "Photoshop's Neural Filters include dedicated skin-smoothing and style-transfer tools; Canva's retouching is more basic."
        }
      ]
    },
    {
      group: "Templates and content types",
      rows: [
        {
          feature: "Social media post templates",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Presentation/deck creation",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Video editing",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Website builder",
          toolA: "available",
          toolB: "unavailable",
          note: "Canva includes a basic website builder; Photoshop has none."
        }
      ]
    },
    {
      group: "Brand and asset management",
      rows: [
        {
          feature: "Brand kit (logo, colors, fonts)",
          toolA: "available",
          toolB: "limited",
          note: "Photoshop supports Adobe Fonts and reusable assets but has no dedicated brand-kit feature like Canva's."
        },
        {
          feature: "Stock photo/graphics library",
          toolA: "available",
          toolB: "unavailable",
          note: "Canva bundles a large stock library; Photoshop has none built in."
        }
      ]
    },
    {
      group: "Print and physical products",
      rows: [
        {
          feature: "Print-on-demand fulfillment",
          toolA: "available",
          toolB: "unavailable",
          note: "Canva Print ships physical products directly; Photoshop has no fulfillment service."
        },
        {
          feature: "Prepress controls (CMYK, bleed/trim)",
          toolA: "limited",
          toolB: "available",
          note: "Photoshop supports CMYK color and print-oriented setup more thoroughly than Canva."
        }
      ]
    },
    {
      group: "Collaboration",
      rows: [
        {
          feature: "Real-time multiplayer co-editing",
          toolA: "available",
          toolB: "unavailable",
          note: "Photoshop's Cloud Documents sync files but don't support simultaneous multi-user editing."
        },
        {
          feature: "Comments and version history",
          toolA: "available",
          toolB: "available",
          note: "Canva has comments plus version history; Photoshop's Cloud Documents include version history but no in-canvas commenting for teams the way Canva does."
        }
      ]
    },
    {
      group: "Automation and extensibility",
      rows: [
        {
          feature: "Batch actions/automation",
          toolA: "not-documented",
          toolB: "available",
          note: "Photoshop's Actions feature automates repetitive edits across many files; no equivalent is documented for Canva."
        },
        {
          feature: "Third-party plugin ecosystem",
          toolA: "limited",
          toolB: "available",
          note: "Canva has an app/integration marketplace; Photoshop has a much larger, longer-established plugin, brush, and action ecosystem."
        }
      ]
    },
    {
      group: "Platform and access",
      rows: [
        {
          feature: "Free tier",
          toolA: "available",
          toolB: "unavailable",
          note: "Canva has a functional free plan; Photoshop is subscription-only with no free tier."
        },
        {
          feature: "Browser-based editing",
          toolA: "available",
          toolB: "limited",
          note: "Photoshop offers a web version with reduced functionality compared to the desktop app; Canva is fully browser-native."
        }
      ]
    }
  ],
  faqs: [
    {
      question: "Is Canva a replacement for Photoshop?",
      answer: "No. Canva is a template-first tool for marketing graphics, presentations, and video, while Photoshop is a professional pixel-editing tool for photo retouching and compositing. Canva can do light photo touch-ups, but it isn't built for the precise, layer-and-mask-based editing Photoshop specializes in."
    },
    {
      question: "Which is cheaper, Canva or Photoshop?",
      answer: "Canva is generally cheaper. It has a free plan and a Pro tier around $12.99/month flat per person. Photoshop has no free tier and starts around $22.99/month as a standalone Creative Cloud subscription, or roughly $9.99/month bundled with Lightroom on the Photography plan."
    },
    {
      question: "Can Photoshop create social media templates like Canva?",
      answer: "Not natively. Photoshop has no built-in template library or drag-and-drop layout system for social posts; it's designed around editing individual images. Canva is purpose-built for that kind of templated marketing content."
    },
    {
      question: "Can Canva do the kind of photo retouching Photoshop does?",
      answer: "Only at a basic level. Canva has tools like background removal and a Magic Eraser, but it lacks Photoshop's layer masking, channels, Camera Raw processing, and Content-Aware Fill — the tools professional retouchers rely on."
    },
    {
      question: "Do I need both Canva and Photoshop?",
      answer: "Many marketing and content teams do. A common workflow is retouching or compositing photos in Photoshop, then bringing the finished images into Canva to build the actual social posts, ads, or decks around them."
    },
    {
      question: "Which is easier to learn, Canva or Photoshop?",
      answer: "Canva. Its drag-and-drop, template-based editor is designed for people with no design background, while Photoshop's dense, panel-heavy interface (layers, masks, Smart Objects) takes considerably longer to master."
    }
  ]
};

export default canvaVsPhotoshopContent;
