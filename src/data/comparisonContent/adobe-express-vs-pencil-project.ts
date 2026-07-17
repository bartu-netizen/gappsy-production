import type { ToolComparisonContent } from './types';

const adobeExpressVsPencilProjectContent: ToolComparisonContent = {
  "verdict": "Adobe Express is a freemium, template-driven design app for quick marketing and social graphics with built-in AI, while Pencil Project is a completely free, open-source desktop tool for building wireframes and UI mockups using stencil libraries for frameworks like Android, Bootstrap, and Material Design. They serve almost entirely different design tasks: finished visual content versus early-stage interface prototyping.",
  "bestForToolA": "Adobe Express fits marketers and non-designers producing finished social posts, flyers, and short videos quickly, backed by Firefly AI and a large template library, on a free plan or $9.99/month Premium.",
  "bestForToolB": "Pencil Project fits developers or product teams sketching low-fidelity wireframes and UI mockups using stencil packs for known frameworks (Android, Bootstrap, Material Design) at zero cost, without needing any of Adobe Express's marketing-content tooling.",
  "whoNeedsBoth": "A product team could use Pencil Project to sketch early wireframes for an app's UI, then separately use Adobe Express to design the marketing graphics and social posts promoting that same product - the two tools address different stages of a project (interface prototyping vs. marketing content) rather than competing directly.",
  "keyDifferences": [
    {
      "title": "Design Category",
      "toolA": "Adobe Express focuses on finished marketing and social content: templates for social posts, flyers, presentations, and video.",
      "toolB": "Pencil Project focuses on UI wireframing and prototyping with stencil libraries for building interface mockups.",
      "whyItMatters": "These are fundamentally different design disciplines, so the right tool depends entirely on whether the output is marketing content or an interface prototype.",
      "benefitsWho": "Marketing teams need Adobe Express; product/UX teams sketching interfaces need Pencil Project."
    },
    {
      "title": "Pricing",
      "toolA": "Adobe Express is freemium with Premium at $9.99/month and a custom-priced Express for Business tier.",
      "toolB": "Pencil Project is completely free with no paid tier at all, under the GPLv2 open-source license.",
      "whyItMatters": "A team with zero design budget can still get full functionality from Pencil Project, while unlocking Adobe Express's full feature set requires a subscription.",
      "benefitsWho": "Budget-constrained teams and open-source-preferring developers benefit from Pencil Project's zero cost."
    },
    {
      "title": "Development Activity",
      "toolA": "Adobe Express is actively developed by Adobe with ongoing feature additions like Firefly AI tools.",
      "toolB": "Pencil Project's latest stable release (3.1.1) dates to January 2023, and its own listed cons note the Pencil V3 roadmap has lagged its stated timeline, indicating a slow development pace.",
      "whyItMatters": "A slower-moving open-source project may lack newer collaboration or AI features that actively maintained commercial tools add over time.",
      "benefitsWho": "Teams wanting cutting-edge features and active support benefit from Adobe Express's ongoing development."
    },
    {
      "title": "Platform Availability",
      "toolA": "Adobe Express runs in the browser plus iOS and Android apps with Creative Cloud sync.",
      "toolB": "Pencil Project is a cross-platform desktop app for GNU/Linux, macOS, and Windows, with no mobile app documented.",
      "whyItMatters": "Mobile access matters for on-the-go content creation, which only Adobe Express supports among these two.",
      "benefitsWho": "Users needing to design from a phone benefit from Adobe Express; desktop-based prototyping workflows are unaffected."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Adobe Express includes Firefly generative AI for image generation and generative fill.",
      "toolB": "Pencil Project's documented features (stencil libraries, cross-platform desktop app, community stencil packs) don't include any AI generation capability.",
      "whyItMatters": "AI-assisted content creation is a differentiator for teams wanting faster asset production, which only Adobe Express offers here.",
      "benefitsWho": "Content creators wanting AI-generated imagery benefit from Adobe Express."
    }
  ],
  "featureMatrix": [
    {
      "group": "Design Purpose",
      "rows": [
        {
          "feature": "Marketing/social templates",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "UI wireframing stencils",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Android, Bootstrap, Material Design"
        },
        {
          "feature": "AI image generation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Adobe Firefly"
        },
        {
          "feature": "Video/animation tools",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Basic video/animation on Adobe Express"
        }
      ]
    },
    {
      "group": "Collaboration & Extensibility",
      "rows": [
        {
          "feature": "Brand kit",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Community-extensible stencils",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cross-device sync",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Creative Cloud sync"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Pencil Project entirely free"
        },
        {
          "feature": "Mobile app",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Desktop app",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Linux, macOS, Windows"
        },
        {
          "feature": "Business/team tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Express for Business, custom price"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Pencil Project a replacement for Adobe Express?",
      "answer": "No, they serve different purposes: Pencil Project is for sketching UI wireframes and interface mockups using framework stencils, while Adobe Express is for producing finished marketing graphics, social posts, and short videos."
    },
    {
      "question": "Is Pencil Project actively maintained?",
      "answer": "Its GitHub repository remains open, but the latest stable release (3.1.1) was published in January 2023, and its own documentation notes the Pencil V3 roadmap has lagged its stated timeline."
    },
    {
      "question": "Does Pencil Project cost anything?",
      "answer": "No, Pencil Project is completely free and open source under the GPLv2 license with no paid tier."
    },
    {
      "question": "Can I use Adobe Express to design a UI mockup?",
      "answer": "Adobe Express is template-driven for social and marketing content and doesn't include the UI-specific stencil libraries (Android, Bootstrap, Material Design) that Pencil Project ships with, so it's not built for interface wireframing."
    },
    {
      "question": "Does Pencil Project have AI features like Adobe Express?",
      "answer": "No, Pencil Project's documented feature set (stencil libraries, cross-platform desktop app) doesn't include AI generation, while Adobe Express includes Firefly for generating and editing images from text prompts."
    },
    {
      "question": "Which tool works on mobile?",
      "answer": "Adobe Express has iOS and Android apps synced via Creative Cloud. Pencil Project is a desktop-only application for GNU/Linux, macOS, and Windows with no mobile app documented."
    }
  ]
};

export default adobeExpressVsPencilProjectContent;
