import type { ToolComparisonContent } from './types';

const siterIoVsUnicornPlatformContent: ToolComparisonContent = {
  "verdict": "Siter.io and Unicorn Platform are both no-code, freemium website builders, but they emphasize different workflows and scales. Siter.io, made by Designmodo, centers on a freehand editor with real-time team collaboration and a Figma import plugin, with paid tiers topping out at 5 websites for $24/month. Unicorn Platform leans on an AI Co-Pilot for prompt-based building and editing, and scales much further — up to 100 published websites at $350/month — with a 30-day money-back guarantee, though its free Lurker plan can't publish a live site at all. The right pick depends on whether real-time collaborative design and Figma import matter more than AI-assisted editing and agency-level scale.",
  "bestForToolA": "Design-led teams that want to import existing Figma files and collaborate on a site together in real time, and don't need to manage more than a handful of websites per account.",
  "bestForToolB": "Agencies or businesses that want AI-assisted, prompt-based site editing and need to manage many published websites (up to 100) under tiered agency pricing, backed by a money-back guarantee.",
  "whoNeedsBoth": "A design agency might use Siter.io for real-time collaborative design work translated from Figma files on select client projects, while relying on Unicorn Platform to manage a larger portfolio of published landing pages across many clients.",
  "keyDifferences": [
    {
      "title": "AI-assisted editing",
      "toolA": "Not documented as a feature; relies on a freehand editor and Figma import instead.",
      "toolB": "Includes an AI Co-Pilot that lets you build or edit a site using text prompts.",
      "whyItMatters": "Teams wanting to generate or revise a site via prompts rather than manual layout work need Unicorn Platform's tooling.",
      "benefitsWho": "Non-designers and teams wanting faster, prompt-driven site edits."
    },
    {
      "title": "Real-time collaborative editing",
      "toolA": "Explicitly supports multiple team members editing a site together in real time, even on lower-tier paid plans.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Teams that co-design sites simultaneously need Siter.io's documented real-time collaboration.",
      "benefitsWho": "Design teams and agencies working on a site together at the same time."
    },
    {
      "title": "Figma import",
      "toolA": "Includes a dedicated Figma import plugin to convert existing designs into a live website.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Teams with existing Figma design files can convert them directly with Siter.io rather than rebuilding from scratch.",
      "benefitsWho": "Design teams that prototype in Figma before publishing a site."
    },
    {
      "title": "Free plan publishing restrictions",
      "toolA": "The free Start plan supports unlimited websites and teammates but has no custom domain or live publishing.",
      "toolB": "The free Lurker plan is free forever but explicitly allows 0 published websites — it cannot go live at all.",
      "whyItMatters": "Both restrict free-tier publishing, but in different ways: Siter.io allows unlimited drafts, while Unicorn Platform caps the free plan at page/post limits with zero live sites.",
      "benefitsWho": "Users evaluating a tool before committing to a paid plan for a live site."
    },
    {
      "title": "Scale of paid tiers",
      "toolA": "Paid tiers scale up to 5 websites at $24/month (Pro plan).",
      "toolB": "Paid tiers scale up to 100 published websites at $350/month (Major plan).",
      "whyItMatters": "Agencies managing large numbers of client sites need Unicorn Platform's higher-capacity tiers.",
      "benefitsWho": "Agencies and businesses managing many published websites."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editor & AI",
      "rows": [
        {
          "feature": "AI-assisted editing (prompt-based)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Freehand / non-grid editor",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Figma import",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Custom code support (HTML/CSS/JS)",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Collaboration & Publishing",
      "rows": [
        {
          "feature": "Real-time collaborative editing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free plan live publishing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Siter.io's free plan has no custom domain or live publishing; Unicorn Platform's free Lurker plan allows 0 published websites."
        },
        {
          "feature": "HTML / source code export",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Siter.io's HTML download is limited to the top Pro plan."
        },
        {
          "feature": "Unlimited team collaborators",
          "toolA": "available",
          "toolB": "available",
          "note": "Siter.io's free Start plan has unlimited teammates; Unicorn Platform requires the Business plan or higher."
        }
      ]
    },
    {
      "group": "Pricing & Scale",
      "rows": [
        {
          "feature": "Starting paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Siter.io from $7/month; Unicorn Platform from $9/month (annual)."
        },
        {
          "feature": "Maximum published-sites tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Siter.io tops out at 5 sites ($24/mo); Unicorn Platform scales to 100 sites ($350/mo)."
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Unicorn Platform offers a 30-day money-back guarantee."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has AI-assisted editing?",
      "answer": "Unicorn Platform's AI Co-Pilot lets you build or edit a site using text prompts; this isn't documented as a Siter.io feature."
    },
    {
      "question": "Can I import an existing design?",
      "answer": "Siter.io has a Figma import plugin to convert existing designs into a live website; this isn't documented for Unicorn Platform."
    },
    {
      "question": "Do free plans allow publishing a live site?",
      "answer": "Both restrict this: Siter.io's free Start plan has no custom domain or live publishing, and Unicorn Platform's free Lurker plan explicitly allows 0 published websites."
    },
    {
      "question": "Which tool supports real-time team editing?",
      "answer": "Siter.io explicitly supports real-time collaboration, available even on lower-tier paid plans; this isn't documented for Unicorn Platform."
    },
    {
      "question": "Which tool scales further for agencies?",
      "answer": "Unicorn Platform's tiers scale up to 100 published websites at $350/month (Major plan); Siter.io's top published tier (Pro) supports 5 websites at $24/month."
    },
    {
      "question": "Is there a money-back guarantee?",
      "answer": "Unicorn Platform offers a 30-day money-back guarantee on paid plans; this isn't documented for Siter.io."
    }
  ]
};

export default siterIoVsUnicornPlatformContent;
