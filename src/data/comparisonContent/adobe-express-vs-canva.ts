import type { ToolComparisonContent } from './types';

// Editorial content for the adobe-express-vs-canva comparison. Every claim mirrors
// what's already documented, per-tool, in the tools table / src/data/toolContent
// — nothing invented, no fabricated "winner", no feature-support claim without
// a matching documented fact.

const adobeExpressVsCanvaContent: ToolComparisonContent = {
  verdict: "Adobe Express and Canva both start from the same premise — a browser and mobile template editor that lets non-designers produce social posts, flyers, presentations, and short videos without touching Illustrator or Photoshop — and they compete more directly with each other than almost any other pair of tools in this category. Canva got there first and built the bigger moat: a much larger template and stock library, a full video editor, a website builder, and Canva Print for physical fulfillment, none of which Adobe Express matches. Adobe Express answers back with tighter integration into Adobe's own ecosystem — shared fonts and assets with Photoshop and Illustrator for Creative Cloud subscribers, and Firefly generative AI that's built on Adobe's commercially-licensed training data, which matters for teams worried about copyright risk in AI-generated marketing assets. For a team with no existing Adobe relationship, Canva's depth and breadth make it the easier default choice. For a team already paying for Creative Cloud, Adobe Express is close enough on core template-design features that adding Canva on top may not be worth the second subscription — unless print fulfillment or Canva's larger template library is a real requirement.",
  bestForToolA: "Teams and individuals already inside the Adobe ecosystem — Creative Cloud subscribers who want quick social/marketing assets that share fonts, brand colors, and files with Photoshop or Illustrator, and who want Firefly's generative AI built on Adobe's licensed training data.",
  bestForToolB: "Teams and individuals who want the largest template library and easiest-to-learn editor in the category, plus features Adobe Express doesn't offer at all — a full video editor, website builder, content planner with direct social publishing, and physical print-on-demand fulfillment.",
  whoNeedsBoth: "A marketing or design agency that already pays for Creative Cloud (for client work in Photoshop/Illustrator) but also wants Canva's larger template library, Brand Template Locking for keeping junior staff on-brand across many client accounts, and Canva Print for physical deliverables like business cards or signage — using Adobe Express for quick Adobe-native assets and Canva for the broader production and print workflow.",
  keyDifferences: [
    {
      title: "Template library size",
      toolA: "Smaller library covering social posts, flyers, presentations, and video, with fewer niche categories.",
      toolB: "Much larger library across nearly every marketing and print format, widely regarded as the deepest in the category.",
      whyItMatters: "A bigger, more varied template library means less time hunting for a starting point that fits a specific format or industry.",
      benefitsWho: "Benefits marketers and small businesses producing a wide variety of content types who don't want to build layouts from scratch."
    },
    {
      title: "Generative AI suite",
      toolA: "Adobe Firefly is built in for text-to-image generation, generative fill, and text effects, trained on Adobe Stock and licensed/public domain content.",
      toolB: "Magic Studio (Magic Design, Magic Write, Magic Media, Magic Edit/Eraser/Expand) offers a broader set of AI tools across text, image, and layout generation.",
      whyItMatters: "Firefly's licensing model is designed to reduce copyright exposure for commercial use, while Canva's Magic Studio covers more distinct use cases in one place.",
      benefitsWho: "Benefits brand and legal-conscious teams (Firefly) versus teams wanting one AI toolkit for text, images, and design generation (Canva)."
    },
    {
      title: "Creative Cloud integration",
      toolA: "Shares fonts, brand assets, and files directly with Photoshop, Illustrator, and other Creative Cloud apps for subscribers.",
      toolB: "Operates independently of Adobe's ecosystem; the 2024 Affinity acquisition adds a separate pro design suite rather than Adobe integration.",
      whyItMatters: "Shared assets and fonts mean less duplicated setup work and more consistent branding across tools for teams already inside Adobe's world.",
      benefitsWho: "Benefits design teams and freelancers who already use Photoshop/Illustrator and want their quick-turnaround assets to match those files."
    },
    {
      title: "Physical print fulfillment",
      toolA: "No print-on-demand service; exports are digital-only or sent to a third-party printer.",
      toolB: "Canva Print ships physical business cards, apparel, signage, and other printed products directly from the design.",
      whyItMatters: "Built-in fulfillment removes an entire step (exporting, finding a printer, uploading print files) from producing physical marketing materials.",
      benefitsWho: "Benefits small businesses and event organizers who need finished printed products without managing a separate print vendor."
    },
    {
      title: "Video editing depth",
      toolA: "Basic video and animation tools suited to short social clips and simple slideshows.",
      toolB: "A fuller video editor with more timeline, transition, and audio controls, though still short of a dedicated NLE like Premiere.",
      whyItMatters: "More editing depth supports longer or more polished video content without switching to a separate video tool.",
      benefitsWho: "Benefits social media managers and content creators producing regular video content who don't want a separate video app."
    },
    {
      title: "Pricing structure",
      toolA: "Free tier plus Premium at roughly $9.99/month, with a separate Express for Business tier priced for teams.",
      toolB: "Free tier plus Pro at roughly $12.99/month flat per person, with Teams and Enterprise tiers for larger organizations.",
      whyItMatters: "Flat per-person pricing versus a business-specific tier changes how costs scale as a team grows.",
      benefitsWho: "Benefits budget-conscious individuals and small teams comparing straightforward monthly costs before committing."
    },
    {
      title: "Brand governance at scale",
      toolA: "Brand kit for storing logos, colors, and fonts, aimed more at individuals and small teams.",
      toolB: "Brand Kit plus Brand Template Locking on Teams/Enterprise plans, letting admins lock template elements so non-designers can't drift off-brand.",
      whyItMatters: "Locking controls matter once many people across departments or clients are producing branded content independently.",
      benefitsWho: "Benefits larger organizations and agencies managing brand consistency across many contributors or client accounts."
    },
    {
      title: "Additional standalone products",
      toolA: "Focused primarily on design templates, video, and basic PDF editing; no website builder or dedicated social scheduling tool.",
      toolB: "Includes a website builder, Canva Whiteboards, and a Content Planner with direct social media publishing.",
      whyItMatters: "Extra built-in products can replace separate tools a team would otherwise pay for and manage independently.",
      benefitsWho: "Benefits small businesses and solo marketers who want one subscription to cover design, scheduling, and a basic web presence."
    },
    {
      title: "Print/prepress precision",
      toolA: "Not built for CMYK color, bleed/trim, or prepress-grade output; Adobe positions Illustrator/InDesign for that work.",
      toolB: "Also aimed at general marketing output rather than prepress precision, though Canva Print handles common print products through its own pipeline.",
      whyItMatters: "Neither tool replaces dedicated prepress software, but Canva's print pipeline abstracts away most prepress concerns for common product types.",
      benefitsWho: "Relevant to businesses ordering standard printed items who don't need professional print-shop-level color control."
    },
    {
      title: "Platform access",
      toolA: "Available on web, iOS, and Android with cross-device sync.",
      toolB: "Available on web, iOS, and Android with cross-device sync and real-time multiplayer collaboration, comments, and version history.",
      whyItMatters: "Real-time multiplayer editing and version history matter more once multiple people are collaborating on the same design simultaneously.",
      benefitsWho: "Benefits teams that co-edit designs together rather than working solo and handing off files."
    }
  ],
  featureMatrix: [
    {
      group: "Templates",
      rows: [
        {
          feature: "Ready-made template library",
          toolA: "available",
          toolB: "available",
          note: "Canva's library is significantly larger and covers more niche categories."
        },
        {
          feature: "Social media post templates",
          toolA: "available",
          toolB: "available"
        },
        {
          feature: "Print templates (flyers, business cards)",
          toolA: "available",
          toolB: "available"
        }
      ]
    },
    {
      group: "AI tools",
      rows: [
        {
          feature: "Text-to-image generation",
          toolA: "available",
          toolB: "available",
          note: "Adobe uses Firefly; Canva uses Magic Media."
        },
        {
          feature: "AI writing assistant",
          toolA: "limited",
          toolB: "available",
          note: "Canva's Magic Write is a dedicated AI copywriting tool; Express has more limited text generation features."
        },
        {
          feature: "AI background removal/editing",
          toolA: "available",
          toolB: "available"
        }
      ]
    },
    {
      group: "Video & animation",
      rows: [
        {
          feature: "Basic video editing",
          toolA: "available",
          toolB: "available"
        },
        {
          feature: "Multi-track/advanced video editing",
          toolA: "limited",
          toolB: "limited",
          note: "Neither replaces a dedicated NLE like Premiere; Canva's editor is generally considered more capable than Express's."
        }
      ]
    },
    {
      group: "Branding",
      rows: [
        {
          feature: "Brand kit (logo, colors, fonts)",
          toolA: "available",
          toolB: "available"
        },
        {
          feature: "Brand template locking for teams",
          toolA: "not-documented",
          toolB: "available",
          note: "Available on Canva Teams/Enterprise plans."
        }
      ]
    },
    {
      group: "Print & fulfillment",
      rows: [
        {
          feature: "Physical print-on-demand fulfillment",
          toolA: "unavailable",
          toolB: "available",
          note: "Canva Print ships physical products; Adobe Express has no equivalent."
        }
      ]
    },
    {
      group: "Collaboration",
      rows: [
        {
          feature: "Real-time multiplayer editing",
          toolA: "limited",
          toolB: "available"
        },
        {
          feature: "Comments and version history",
          toolA: "limited",
          toolB: "available"
        }
      ]
    },
    {
      group: "Ecosystem & integrations",
      rows: [
        {
          feature: "Creative Cloud asset/font sharing",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Public API for developers",
          toolA: "not-documented",
          toolB: "available",
          note: "Canva Connect API."
        },
        {
          feature: "Website builder",
          toolA: "unavailable",
          toolB: "available"
        }
      ]
    },
    {
      group: "Content management",
      rows: [
        {
          feature: "Social media content calendar/scheduling",
          toolA: "unavailable",
          toolB: "available"
        },
        {
          feature: "Digital whiteboard",
          toolA: "unavailable",
          toolB: "available"
        }
      ]
    },
    {
      group: "Pricing",
      rows: [
        {
          feature: "Free tier",
          toolA: "available",
          toolB: "available"
        },
        {
          feature: "Paid individual tier under $15/month",
          toolA: "available",
          toolB: "available",
          note: "Adobe Premium is roughly $9.99/month; Canva Pro is roughly $12.99/month."
        },
        {
          feature: "Dedicated business/team tier",
          toolA: "available",
          toolB: "available"
        }
      ]
    }
  ],
  faqs: [
    {
      question: "Is Adobe Express or Canva better for beginners?",
      answer: "Both are designed for people with no design training and use a similar drag-and-drop, template-first editor. Canva's larger template library and longer track record in this category mean most beginners find slightly more starting points and community tutorials, but the learning curve on either tool is low."
    },
    {
      question: "Which is cheaper, Adobe Express or Canva?",
      answer: "Both offer a usable free tier. Paid plans are close: Adobe Express Premium runs around $9.99/month and Canva Pro around $12.99/month, so the price difference alone is unlikely to be the deciding factor for most individuals."
    },
    {
      question: "Does Adobe Express include the same AI tools as Canva?",
      answer: "Both include generative AI for images and design, but the tools differ. Adobe Express uses Firefly, trained on Adobe Stock and licensed content, which some businesses prefer for lower copyright risk. Canva's Magic Studio covers a broader range of AI features, including AI copywriting and one-click design generation."
    },
    {
      question: "Can Adobe Express replace Canva for a small business?",
      answer: "It can cover core needs like social posts, flyers, and presentations, especially for a business already using Adobe Creative Cloud. It's a weaker fit if the business needs Canva's larger template selection, built-in video editor, website builder, content scheduling, or physical print fulfillment through Canva Print."
    },
    {
      question: "Does Canva integrate with Adobe Creative Cloud?",
      answer: "No. Canva operates as an independent platform and does not share fonts, assets, or files with Adobe Creative Cloud apps. Adobe Express, by contrast, is built to share brand assets and fonts with Photoshop and Illustrator for Creative Cloud subscribers."
    },
    {
      question: "Which tool is better for printed marketing materials?",
      answer: "Canva has a clear advantage here through Canva Print, which fulfills physical products like business cards, apparel, and signage directly from a design. Adobe Express has no built-in print fulfillment service, so printed materials need to be exported and sent to a separate printer."
    }
  ]
};

export default adobeExpressVsCanvaContent;
