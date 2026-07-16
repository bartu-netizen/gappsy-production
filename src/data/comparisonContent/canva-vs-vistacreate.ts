import type { ToolComparisonContent } from './types';

// Editorial content for the canva-vs-vistacreate comparison. Every claim mirrors
// what's already documented, per-tool, in the tools table / src/data/toolContent
// — nothing invented, no fabricated "winner", no feature-support claim without
// a matching documented fact.

const canvaVsVistacreateContent: ToolComparisonContent = {
  verdict: "Canva and VistaCreate are built on the same basic idea: a browser-based, drag-and-drop editor stocked with templates so anyone can produce a social post, flyer, or business card without design training. VistaCreate (originally launched as Crello, then rebranded after joining the Vista family of brands — the same corporate family as VistaPrint) is a genuine, capable Canva-style tool, not a knockoff. But Canva has pulled well ahead on scope: a far larger template and stock library, the Magic Studio AI suite, a full video editor, a website builder, whiteboards, and enterprise-grade brand governance, all backed by its 2024 acquisition of Affinity. VistaCreate's real edge is narrower but genuine — it sits inside the same corporate family as an actual print company, so the path from template to a printed flyer or business card is more direct, and its Pro plan is priced a bit below Canva's. Most people who need Canva's breadth will just use Canva; VistaCreate earns its place mainly with price-sensitive users and anyone leaning heavily on Vista's print ordering.",
  bestForToolA: "Teams and individuals who want one platform for design, video, websites, whiteboarding, AI-assisted content creation, and brand governance at scale — from solo creators up to enterprises managing brand templates across many users.",
  bestForToolB: "Price-sensitive solo creators and small businesses who want a simple, Canva-like editor for social graphics and print materials, especially if they're already ordering business cards, flyers, or signage through Vista's print network.",
  whoNeedsBoth: "There's genuinely little reason to run both day to day — VistaCreate's feature set is a subset of what Canva already covers. The narrow exception is an agency or business that standardizes on Vista for print fulfillment for cost or vendor reasons but prefers Canva's larger library and AI tools for everyday design work.",
  keyDifferences: [
    {
      title: "Company scale and product maturity",
      toolA: "Founded in 2013, now one of the largest design platforms globally, with the 2024 acquisition of pro suite Affinity extending it upmarket.",
      toolB: "Launched in 2016 as Crello, rebranded VistaCreate after joining the Vista family of brands (the same corporate family as VistaPrint); smaller and narrower in scope.",
      whyItMatters: "A larger, more mature platform tends to ship features faster and maintain them longer, which matters for teams planning to depend on the tool for years.",
      benefitsWho: "Businesses and teams wanting long-term platform stability and a broader roadmap."
    },
    {
      title: "Template and stock library size",
      toolA: "Very large, continuously expanded template library plus extensive stock photo, video, and audio libraries.",
      toolB: "A solid but noticeably smaller template and stock library covering the same basic categories (social posts, stories, flyers, business cards, video intros).",
      whyItMatters: "A bigger library means more starting points and less risk of using an over-used template that competitors also picked.",
      benefitsWho: "Marketers and agencies producing high volumes of varied content."
    },
    {
      title: "AI design tools",
      toolA: "Magic Studio suite: Magic Design, Magic Write, Magic Media, Magic Edit/Eraser/Expand, and a background remover, all built into the core editor.",
      toolB: "No comparable documented AI design suite; design and editing remain primarily manual.",
      whyItMatters: "AI generation and editing tools speed up first drafts and reduce the skill floor for tasks like removing backgrounds or extending images.",
      benefitsWho: "Users without design skills who want faster output, and teams producing content at volume."
    },
    {
      title: "Video editing capability",
      toolA: "Full video editor supporting multi-clip timelines, transitions, and more advanced video projects, not just short clips.",
      toolB: "Basic animation and GIF/video export for short, template-driven clips, but no full video editing suite.",
      whyItMatters: "Teams doing real video work (ads, social video, presentations) need timeline-level editing, not just animated templates.",
      benefitsWho: "Social media managers and content teams producing video as a primary format."
    },
    {
      title: "Website builder",
      toolA: "Includes a built-in website builder for simple sites and landing pages.",
      toolB: "No website builder product.",
      whyItMatters: "Being able to turn a design directly into a published web page removes a tool switch for simple sites.",
      benefitsWho: "Solopreneurs and small businesses wanting a quick web presence without adding another tool."
    },
    {
      title: "Whiteboard product",
      toolA: "Canva Whiteboards supports real-time visual collaboration and brainstorming, separate from the design editor.",
      toolB: "No whiteboard product.",
      whyItMatters: "A built-in whiteboard covers team ideation and planning without leaving the platform.",
      benefitsWho: "Teams that brainstorm and plan visually alongside their design work."
    },
    {
      title: "Brand governance at scale",
      toolA: "Brand Kit plus Brand Template Locking on Teams/Enterprise plans, letting admins lock fonts, colors, and layouts for large teams.",
      toolB: "Offers a basic brand kit (logo, colors, fonts) but no documented equivalent to locked, enterprise-grade brand template controls.",
      whyItMatters: "Locking down brand elements prevents off-brand edits when many people are creating content.",
      benefitsWho: "Larger organizations and franchises that need consistent branding across many contributors."
    },
    {
      title: "Print-on-demand integration",
      toolA: "Canva Print offers direct print fulfillment for business cards, apparel, signage, and banners from within the editor.",
      toolB: "Integrates directly with Vista's print-on-demand ordering — a genuinely more direct advantage since VistaCreate is part of the same corporate family as an actual print company.",
      whyItMatters: "Going from design to a physical printed product without exporting to a third party saves time and reduces friction.",
      benefitsWho: "Small businesses ordering physical marketing materials who want the shortest path from template to printed product."
    },
    {
      title: "Pricing",
      toolA: "Free tier plus Pro at roughly $12.99/month flat per person, with separate Teams and Enterprise tiers.",
      toolB: "Free tier plus Pro at roughly $10/month, undercutting Canva's entry-level paid price.",
      whyItMatters: "For solo users or very small teams, a few dollars a month difference is a real factor when the feature gap doesn't affect their use case.",
      benefitsWho: "Budget-conscious individuals and small businesses with simple design needs."
    },
    {
      title: "Public API and integrations",
      toolA: "Canva Connect offers a documented public API for building integrations on top of Canva.",
      toolB: "No publicly documented equivalent API.",
      whyItMatters: "An API lets businesses automate design generation or embed the tool into their own workflows.",
      benefitsWho: "Developers and companies building custom content-generation pipelines."
    }
  ],
  featureMatrix: [
    {
      group: "Templates & Stock Assets",
      rows: [
        {
          feature: "Ready-made template library",
          toolA: "available",
          toolB: "limited",
          note: "Both cover social, print, and video templates; Canva's library is substantially larger."
        },
        {
          feature: "Stock photo library",
          toolA: "available",
          toolB: "limited",
          note: "VistaCreate includes built-in stock photos but a smaller selection than Canva."
        },
        {
          feature: "Stock video & audio library",
          toolA: "available",
          toolB: "limited",
          note: "Both offer built-in stock video/music; Canva's catalog is more extensive."
        }
      ]
    },
    {
      group: "AI-Powered Design Tools",
      rows: [
        {
          feature: "AI text-to-design generation",
          toolA: "available",
          toolB: "unavailable",
          note: "Canva's Magic Design generates layouts from a prompt or content."
        },
        {
          feature: "AI copywriting assistant",
          toolA: "available",
          toolB: "not-documented",
          note: "Canva's Magic Write; no documented equivalent for VistaCreate."
        },
        {
          feature: "AI image editing (background remover, expand/erase)",
          toolA: "available",
          toolB: "unavailable",
          note: "Part of Canva's Magic Studio suite."
        }
      ]
    },
    {
      group: "Video & Animation",
      rows: [
        {
          feature: "Full timeline-based video editor",
          toolA: "available",
          toolB: "unavailable",
          note: "VistaCreate supports short animated/video templates, not full editing."
        },
        {
          feature: "Basic animation & GIF/video export",
          toolA: "available",
          toolB: "available",
          note: "Both support animating designs and exporting as GIF or short video."
        }
      ]
    },
    {
      group: "Branding & Governance",
      rows: [
        {
          feature: "Brand kit (logo, colors, fonts)",
          toolA: "available",
          toolB: "available",
          note: "Both let users store brand assets for reuse."
        },
        {
          feature: "Locked brand templates (enterprise governance)",
          toolA: "available",
          toolB: "unavailable",
          note: "Canva Teams/Enterprise feature; no documented VistaCreate equivalent."
        },
        {
          feature: "Real-time multiplayer collaboration",
          toolA: "available",
          toolB: "available",
          note: "Both support shared editing and team access."
        }
      ]
    },
    {
      group: "Team & Sharing",
      rows: [
        {
          feature: "Comments & feedback on designs",
          toolA: "available",
          toolB: "limited",
          note: "Canva has more mature commenting/review workflows."
        },
        {
          feature: "Version history",
          toolA: "available",
          toolB: "not-documented",
          note: "Canva documents version history; not clearly documented for VistaCreate."
        }
      ]
    },
    {
      group: "Print & Physical Products",
      rows: [
        {
          feature: "Print-on-demand fulfillment",
          toolA: "available",
          toolB: "available",
          note: "Canva Print vs. direct Vista print ordering — VistaCreate's integration is arguably more direct given the shared corporate family."
        },
        {
          feature: "Business card / flyer / signage templates",
          toolA: "available",
          toolB: "available",
          note: "Both offer these template categories out of the box."
        },
        {
          feature: "Vector-precision / advanced prepress tooling",
          toolA: "unavailable",
          toolB: "unavailable",
          note: "Neither tool is built for professional prepress work; both are template-based editors."
        }
      ]
    },
    {
      group: "Additional Products",
      rows: [
        {
          feature: "Website builder",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Whiteboard product",
          toolA: "available",
          toolB: "unavailable"
        }
      ]
    },
    {
      group: "Content Publishing",
      rows: [
        {
          feature: "Content planner & direct social publishing",
          toolA: "available",
          toolB: "not-documented",
          note: "Canva has a built-in content calendar and direct scheduling to social platforms."
        }
      ]
    },
    {
      group: "Platform & Pricing",
      rows: [
        {
          feature: "Public API",
          toolA: "available",
          toolB: "not-documented",
          note: "Canva Connect API is documented; no public API found for VistaCreate."
        },
        {
          feature: "Free tier",
          toolA: "available",
          toolB: "available"
        },
        {
          feature: "Entry-level paid plan price",
          toolA: "available",
          toolB: "available",
          note: "Roughly $12.99/month for Canva Pro vs. roughly $10/month for VistaCreate Pro."
        }
      ]
    }
  ],
  faqs: [
    {
      question: "Is Canva or VistaCreate cheaper?",
      answer: "VistaCreate's Pro plan is priced a bit below Canva Pro (roughly $10/month versus roughly $12.99/month), and both offer a free tier. The gap is modest, so the bigger question is usually whether Canva's extra features (AI tools, video editor, website builder) are worth the difference for your use case."
    },
    {
      question: "What's the main difference between Canva and VistaCreate?",
      answer: "Both are browser-based, template-driven design tools with a similar drag-and-drop workflow. Canva is larger and more feature-complete, with an AI suite (Magic Studio), a full video editor, a website builder, and whiteboards. VistaCreate covers the core template-and-design use case well but doesn't match that breadth, while offering a more direct connection to Vista's print-on-demand ordering."
    },
    {
      question: "Does VistaCreate have AI tools like Canva's Magic Studio?",
      answer: "No. Canva's Magic Studio (Magic Design, Magic Write, Magic Media, background remover, and image expand/erase tools) doesn't have a documented equivalent in VistaCreate as of now."
    },
    {
      question: "Which is better for ordering printed materials like business cards or flyers?",
      answer: "Both support print-on-demand ordering, but VistaCreate has a genuine edge here: it's part of the same corporate family as Vista, an actual print company, so the design-to-print path is arguably more direct than Canva Print's."
    },
    {
      question: "Can I edit video in VistaCreate the way I can in Canva?",
      answer: "Not to the same extent. VistaCreate supports basic animation and GIF/video export for short, template-based clips, but it doesn't include a full timeline-based video editor the way Canva does."
    },
    {
      question: "Is VistaCreate the same company as Canva?",
      answer: "No, they're unrelated companies. VistaCreate launched in 2016 as Crello and was later rebranded after joining the Vista family of brands, which also includes VistaPrint. Canva is a separate company founded in 2013 in Perth, Australia, which acquired the pro design suite Affinity in 2024."
    }
  ]
};

export default canvaVsVistacreateContent;
