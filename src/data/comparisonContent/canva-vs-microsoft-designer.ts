import type { ToolComparisonContent } from './types';

// Editorial content for the canva-vs-microsoft-designer comparison. Every claim mirrors
// what's already documented, per-tool, in the tools table / src/data/toolContent
// — nothing invented, no fabricated "winner", no feature-support claim without
// a matching documented fact.

const canvaVsMicrosoftDesignerContent: ToolComparisonContent = {
  verdict: "Canva and Microsoft Designer both let you make a social post or a poster in a few minutes, but they start from opposite places. Microsoft Designer opens with a prompt box — you describe what you want and DALL-E generates images and layout ideas for you to pick from. Canva opens with a template library and a full drag-and-drop editor, with AI tools (Magic Design, Magic Write, Magic Media) layered on as one part of a much larger platform that also covers video, print, whiteboards, and team brand management. Designer is a genuinely good free tool for a quick, one-off piece of content, especially if you already live in Microsoft 365, Bing, or Copilot. Canva is the platform teams reach for when design work needs to be consistent, repeatable, collaborative, or turned into a physical product. Most people who try Designer for speed still end up on Canva once more than one person, or more than one output format, is involved.",
  bestForToolA: "Teams, businesses, freelancers, and content creators who need templates, brand consistency, real-time collaboration, video editing, or physical print products — not just individuals making a single quick graphic.",
  bestForToolB: "Individuals who want a fast, free, prompt-driven way to generate a social graphic, invitation, or poster and are already using Microsoft 365, Bing, or Copilot and don't need collaboration, brand controls, or print.",
  whoNeedsBoth: "A solo creator or small-business owner who uses Microsoft Designer to quickly generate an AI concept image or a one-off social graphic, then brings it into Canva when the piece needs to match brand colors and fonts, get approved by a teammate, go on a printed flyer or business card, or become part of a recurring content calendar.",
  keyDifferences: [
    {
      title: "Starting point for a new design",
      toolA: "Starts from a searchable template library or a blank canvas you build up manually.",
      toolB: "Starts from a text prompt — DALL-E generates image/layout options first, which you then edit.",
      whyItMatters: "A prompt-first workflow is faster for a single idea but gives you less direct control over exact layout and text placement than starting from a proven template.",
      benefitsWho: "Designer benefits people who want speed and don't have a specific layout in mind; Canva benefits people who want precise control or a layout they already know works."
    },
    {
      title: "Price",
      toolA: "Free plan plus Pro at roughly $12.99/month flat per person, with Teams and Enterprise tiers above that.",
      toolB: "Free to use, with more AI generation credits and priority access unlocked through Microsoft 365 Personal/Family (~$7-10/month) or Copilot Pro (~$20/month).",
      whyItMatters: "Designer's core experience costs nothing, but heavier AI usage nudges you toward subscriptions you may already have for other reasons; Canva's paid tier is a dedicated design spend.",
      benefitsWho: "Casual users and existing Microsoft 365 subscribers get more value out of Designer's pricing; teams that need Canva's design features get clear ROI from a dedicated Pro/Teams plan."
    },
    {
      title: "Template library size and breadth",
      toolA: "Very large, mature library spanning social posts, presentations, resumes, marketing assets, and more, built up since 2013.",
      toolB: "Smaller, more focused set of templates for social posts, invitations, logos, and posters.",
      whyItMatters: "A bigger, more specific template library saves time when you need a particular format (e.g., a resume or a pitch deck) rather than a generic social graphic.",
      benefitsWho: "Benefits anyone producing varied content types regularly, like marketers or agencies, over someone making one graphic occasionally."
    },
    {
      title: "Team collaboration and approvals",
      toolA: "Real-time multiplayer editing, comments, version history, and shared team workspaces.",
      toolB: "Built for individual use — no documented shared workspace, comment threads, or approval workflow.",
      whyItMatters: "Any workflow involving more than one person reviewing or editing a design needs real collaboration tools, not just file sharing.",
      benefitsWho: "Marketing teams, agencies, and any multi-person workflow benefit from Canva; solo creators aren't affected by Designer's lack of this."
    },
    {
      title: "Brand consistency controls",
      toolA: "Brand Kit and Brand Template Locking (Teams/Enterprise) let admins lock fonts, colors, and logos across everyone's designs.",
      toolB: "No documented shared brand kit or lock-down controls for teams.",
      whyItMatters: "Businesses with multiple people creating content need a way to enforce consistent brand identity without manually checking every design.",
      benefitsWho: "Businesses and franchises with multiple content creators; not a factor for a single person designing only for themselves."
    },
    {
      title: "Print and physical products",
      toolA: "Canva Print offers on-demand fulfillment of business cards, flyers, apparel, and more directly from the editor.",
      toolB: "No print-on-demand fulfillment; output is digital only.",
      whyItMatters: "Ordering a physical product straight from the design tool removes a whole separate step of finding a printer and re-uploading files.",
      benefitsWho: "Small businesses and event organizers who need physical materials benefit directly from Canva's print integration."
    },
    {
      title: "Video editing",
      toolA: "Full video editor for cutting, trimming, adding audio, and building longer video content.",
      toolB: "Basic animation for social posts only, not a full video editor.",
      whyItMatters: "Content strategies that include short-form video or promotional clips need real editing tools, not just animated stills.",
      benefitsWho: "Content creators and social media managers producing video content benefit from Canva; those only needing static images aren't affected."
    },
    {
      title: "AI's role in the product",
      toolA: "Magic Studio (Magic Design, Magic Write, Magic Media, Magic Edit/Eraser/Expand) is one feature set inside a much broader platform.",
      toolB: "AI image generation via DALL-E is the primary, central workflow the whole product is built around.",
      whyItMatters: "A tool where AI is the entry point suits people who want to generate from a prompt; a tool where AI is one option among many suits people who want a mix of manual and AI-assisted work.",
      benefitsWho: "Prompt-first creators benefit from Designer's focus; people who want both manual design control and optional AI assistance benefit from Canva's broader toolset."
    },
    {
      title: "Ecosystem integration",
      toolA: "Standalone platform, works the same regardless of what other software you use, plus a public Canva Connect API for custom integrations.",
      toolB: "Deeply tied into Microsoft 365, Bing, Edge, and Copilot, with shared sign-in and AI credits across those surfaces.",
      whyItMatters: "Deep ecosystem ties make a tool more convenient if you're already in that ecosystem, but less useful if you're not, and Canva's API allows custom build-outs Designer doesn't document.",
      benefitsWho: "Microsoft 365/Copilot subscribers get extra convenience from Designer; developers and businesses needing custom integrations benefit from Canva's public API."
    },
    {
      title: "Additional product surface (website, whiteboard, content planning)",
      toolA: "Also includes a website builder, Canva Whiteboards, and a Content Planner with direct social publishing.",
      toolB: "Focused solely on generating and editing individual design assets — no website builder, whiteboard, or publishing scheduler documented.",
      whyItMatters: "Having adjacent tools in one platform reduces the number of separate subscriptions and logins a team needs to manage.",
      benefitsWho: "Small businesses and teams that want one platform for multiple needs benefit from Canva's broader suite."
    }
  ],
  featureMatrix: [
    {
      group: "Getting started",
      rows: [
        {
          feature: "Text-to-image AI generation as primary entry point",
          toolA: "limited",
          toolB: "available",
          note: "Designer is built around DALL-E prompts as the default starting workflow; Canva offers AI image generation (Magic Media) as one option among templates and blank canvas."
        },
        {
          feature: "Ready-made template library",
          toolA: "available",
          toolB: "available",
          note: "Canva's library is substantially larger and covers more formats than Designer's."
        },
        {
          feature: "Blank canvas / manual design mode",
          toolA: "available",
          toolB: "available"
        }
      ]
    },
    {
      group: "AI tools",
      rows: [
        {
          feature: "AI image generation",
          toolA: "available",
          toolB: "available",
          note: "Canva's Magic Media and Designer both use diffusion/DALL-E-family models."
        },
        {
          feature: "AI writing assistant",
          toolA: "available",
          toolB: "not-documented"
        },
        {
          feature: "AI background removal",
          toolA: "available",
          toolB: "available"
        },
        {
          feature: "AI generative expand/fill",
          toolA: "available",
          toolB: "not-documented"
        }
      ]
    },
    {
      group: "Collaboration",
      rows: [
        {
          feature: "Real-time multiplayer editing",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Comments and version history",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Shared team workspace",
          toolA: "available",
          toolB: "unavailable"
        }
      ]
    },
    {
      group: "Brand management",
      rows: [
        {
          feature: "Brand Kit (colors, fonts, logos)",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Locked brand templates for team use",
          toolA: "available",
          toolB: "unavailable"
        }
      ]
    },
    {
      group: "Output formats",
      rows: [
        {
          feature: "Video editing",
          toolA: "available",
          toolB: "limited",
          note: "Designer supports basic animation for social posts, not full video editing."
        },
        {
          feature: "Print-on-demand physical products",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Website builder",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Digital whiteboard",
          toolA: "available",
          toolB: "unavailable"
        }
      ]
    },
    {
      group: "Content publishing",
      rows: [
        {
          feature: "Content calendar / direct social scheduling",
          toolA: "available",
          toolB: "unavailable"
        },
        {
          feature: "Caption and hashtag suggestions",
          toolA: "not-documented",
          toolB: "available"
        }
      ]
    },
    {
      group: "Assets and integrations",
      rows: [
        {
          feature: "Stock photo/icon library",
          toolA: "available",
          toolB: "available",
          note: "Canva's stock library is larger and more established."
        },
        {
          feature: "Public developer API",
          toolA: "available",
          toolB: "not-documented"
        },
        {
          feature: "Integration with Microsoft 365/Bing/Copilot",
          toolA: "unavailable",
          toolB: "available"
        }
      ]
    },
    {
      group: "Pricing and access",
      rows: [
        {
          feature: "Usable free tier",
          toolA: "available",
          toolB: "available",
          note: "Both have genuinely usable free tiers, though Designer's AI generation credits are capped without a Microsoft subscription."
        },
        {
          feature: "Flat per-person paid plan",
          toolA: "available",
          toolB: "not-documented",
          note: "Designer's extra capability comes via Microsoft 365/Copilot subscriptions rather than a dedicated Designer-specific plan."
        },
        {
          feature: "Mobile apps (iOS/Android)",
          toolA: "available",
          toolB: "available"
        }
      ]
    }
  ],
  faqs: [
    {
      question: "Is Microsoft Designer completely free?",
      answer: "Yes, the core product is free to use with a Microsoft account. AI image generation is included, but the number of generations or priority access can be limited without a Microsoft 365 Personal/Family or Copilot Pro subscription, which unlock more credits."
    },
    {
      question: "Can Microsoft Designer replace Canva for a small business?",
      answer: "For a single person making occasional quick graphics, it can cover a lot of ground. But it doesn't have team collaboration, shared brand kits, print-on-demand ordering, or a video editor, so most small businesses that need consistent branding or physical materials still rely on Canva alongside or instead of Designer."
    },
    {
      question: "Does Canva have AI image generation like Microsoft Designer?",
      answer: "Yes, Canva's Magic Media tool generates AI images from text prompts, and Magic Design can build entire layouts from a prompt or an uploaded photo. The difference is that in Canva, AI generation is one option alongside templates and manual editing, whereas Designer is built around the prompt as the default starting point."
    },
    {
      question: "Which tool is better for a team that needs brand consistency?",
      answer: "Canva, because of its Brand Kit and Brand Template Locking features on Teams and Enterprise plans, which let admins fix colors, fonts, and logos across everyone's designs. Microsoft Designer doesn't have a documented equivalent for enforcing brand consistency across multiple users."
    },
    {
      question: "Can I print physical products designed in Microsoft Designer?",
      answer: "Not directly. Designer doesn't offer print-on-demand fulfillment. Canva Print lets you order business cards, flyers, apparel, and other physical products straight from the editor, so many people design in Designer and then move the file to Canva (or another print service) to have it printed."
    },
    {
      question: "Does using Microsoft 365 or Copilot make Designer more useful?",
      answer: "Yes. Designer shares sign-in and AI generation credits with Microsoft 365, Bing, and Copilot, so subscribers to Microsoft 365 Personal/Family or Copilot Pro get more AI generations and often priority access, making Designer noticeably more capable for people already paying for those services."
    }
  ]
};

export default canvaVsMicrosoftDesignerContent;
