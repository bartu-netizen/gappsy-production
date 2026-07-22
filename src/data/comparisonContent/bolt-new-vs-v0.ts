import type { ToolComparisonContent } from './types';

const boltNewVsV0Content: ToolComparisonContent = {
  "verdict": "Bolt.new and v0 solve adjacent but different problems, and picking a single \"winner\" misses the point. Bolt.new, from StackBlitz, is built for going from a plain-English idea to a deployed full-stack application in one sitting: its WebContainers runtime spins up a real Node.js dev server in the browser, and built-in Supabase and Stripe integrations mean auth, a database, and payments can be wired up without leaving the chat. v0, from Vercel, is narrower and deeper on the front end: it generates production-grade React, Tailwind CSS, and shadcn/ui code with live interactive previews, and its output reads like code a team would have written by hand, making it a natural fit for teams that already have a backend and just need well-built UI fast. Bolt.new's pricing is flat monthly token tiers starting at $25/month; v0 uses a credit-based model with a free tier and $30/user/month paid plans. Bolt.new also builds mobile apps via Expo and imports Figma files, capabilities not in v0's documented feature set; v0 counters with a Platform API for embedding its generation engine into other products, which isn't documented for Bolt.new. The honest framing: Bolt.new is closer to a hosted app-builder-plus-backend, while v0 is a code-quality-focused UI generator built to feed directly into an existing React and Vercel workflow.",
  "bestForToolA": "Bolt.new fits solo builders, founders, and non-specialist teams who want to go from an idea to a deployed full-stack app, complete with a database, auth, and payments, without assembling separate backend tools.",
  "bestForToolB": "v0 fits developers and product teams already working in React, Tailwind, and shadcn/ui who want production-quality, editable UI code generated fast and deployed straight to Vercel, without needing a full backend generated for them.",
  "whoNeedsBoth": "A team building a product on Vercel might use v0 to generate and refine polished, on-brand UI components, then reach for Bolt.new separately to spin up quick full-stack prototypes or demos that need their own database, auth, or payments.",
  "keyDifferences": [
    {
      "title": "Core use case",
      "toolA": "Generates and deploys full-stack web apps, including backend wiring via Supabase and Stripe, from a single chat interface.",
      "toolB": "Generates production-quality React, Tailwind CSS, and shadcn/ui front-end code with live interactive previews.",
      "whyItMatters": "Determines whether the tool needs to produce a working backend or just polished, ready-to-integrate UI.",
      "benefitsWho": "Founders and non-specialists building a whole product benefit from Bolt.new; developers who already have a backend benefit from v0's UI focus."
    },
    {
      "title": "Parent company and origin",
      "toolA": "Built by StackBlitz, a company founded in 2017 with a long history in browser-based development environments.",
      "toolB": "Built by Vercel and launched in 2023 as a newer, AI-generation-focused product.",
      "whyItMatters": "Signals how much of the underlying tech, browser runtime versus deployment platform, each vendor already had before adding AI generation.",
      "benefitsWho": "Teams wanting deep in-browser dev tooling lean toward Bolt.new's StackBlitz heritage; teams already hosted on Vercel benefit from v0's native platform ties."
    },
    {
      "title": "In-browser runtime",
      "toolA": "Runs a full Node.js environment (WebContainers) directly in the browser tab to build, run, and preview projects with nothing installed locally.",
      "toolB": "Renders clickable, functioning live previews of generated UI, but is not documented as running a full in-browser dev/server environment.",
      "whyItMatters": "Affects how close the preview environment is to a genuine, runnable full-stack app versus a UI rendering.",
      "benefitsWho": "Users without a local dev setup, or building backend logic, benefit from Bolt.new's WebContainers approach."
    },
    {
      "title": "Backend and payments integration",
      "toolA": "Built-in Supabase integration (auth, Postgres database, storage) and native Stripe support for payments.",
      "toolB": "No documented built-in database, auth, or payments integration; the focus stays on front-end code generation.",
      "whyItMatters": "Determines whether a generated project can handle real user accounts, data, and billing out of the box or needs to be wired to a backend separately.",
      "benefitsWho": "Solo founders and MVP builders benefit from Bolt.new's built-in backend; teams with an existing backend don't need this from v0."
    },
    {
      "title": "Design import path",
      "toolA": "Imports Figma files directly and converts them into working front-end components.",
      "toolB": "Converts an uploaded screenshot or design reference image into a starting code implementation.",
      "whyItMatters": "Different design-to-code workflows fit different existing design toolchains.",
      "benefitsWho": "Design teams standardized on Figma benefit from Bolt.new; teams working from screenshots or mockup images benefit from v0."
    },
    {
      "title": "Mobile app support",
      "toolA": "Builds iOS and Android apps from the same browser-based project using Expo, including QR-code preview.",
      "toolB": "Not documented as supporting native mobile app generation; output is web-based React, Tailwind, and shadcn/ui.",
      "whyItMatters": "Matters to anyone who needs a mobile app, not just a website, from the same generation workflow.",
      "benefitsWho": "Teams needing a mobile companion app benefit from Bolt.new's Expo integration."
    },
    {
      "title": "Deployment target",
      "toolA": "Deploys to a live URL with custom domain support and branding removal on paid plans, independent of a specific cloud host.",
      "toolB": "Deploys directly to Vercel hosting with one click, tightly coupled to Vercel's platform.",
      "whyItMatters": "Affects hosting flexibility and whether the workflow locks a team into one hosting provider.",
      "benefitsWho": "Teams wanting host flexibility or custom domains lean toward Bolt.new; teams already committed to Vercel benefit from v0's native deploy path."
    },
    {
      "title": "Pricing structure",
      "toolA": "Flat monthly token tiers: a free plan with a 300K daily/1M monthly token limit, then Pro at $25/month for 10M+ monthly tokens with rollover.",
      "toolB": "Credit-based usage: a free plan with $5 in monthly credits and a 7-message daily cap, then Plus at $30/user/month with $30 in monthly credits plus $2 in daily login credits.",
      "whyItMatters": "Changes how predictable costs are as usage and project complexity scale.",
      "benefitsWho": "Teams wanting simpler flat tiers may prefer Bolt.new; teams comfortable tracking credit consumption may prefer v0's model."
    },
    {
      "title": "Team-tier pricing",
      "toolA": "Teams plan costs $30 per member per month, adding centralized billing, admin controls, and private NPM registries.",
      "toolB": "Business plan costs $100 per user per month, adding training opt-out by default alongside credit sharing and centralized billing.",
      "whyItMatters": "A sizeable price gap at the team tier that directly affects total cost for multi-seat organizations.",
      "benefitsWho": "Budget-conscious teams benefit from Bolt.new's lower team-tier price; teams prioritizing default training opt-out may value v0's Business tier despite the higher cost."
    },
    {
      "title": "Developer and API extensibility",
      "toolA": "No documented public API for embedding Bolt.new's generation engine into other products.",
      "toolB": "Offers a v0 Platform API and SDK so developers can embed the same text-to-app generation engine into their own products, bots, or tools.",
      "whyItMatters": "Matters to companies that want to build the generation capability into their own software rather than only using it as a standalone app builder.",
      "benefitsWho": "Platform teams and companies building AI-generation features into their own products benefit from v0's Platform API."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Generation & Iteration",
      "rows": [
        {
          "feature": "Natural-language app/UI generation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Live interactive preview",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Conversational iterative refinement",
          "toolA": "available",
          "toolB": "available",
          "note": "Bolt.new iterates through chat-driven edits to visible, editable files; v0 has an explicit conversational refinement mode for adjusting generated UI"
        }
      ]
    },
    {
      "group": "Design Import",
      "rows": [
        {
          "feature": "Figma file import",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Screenshot/image-to-code conversion",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Code Ownership & Export",
      "rows": [
        {
          "feature": "Editable underlying code",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "GitHub import of an existing repo as a starting point",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "v0's GitHub sync is documented for pushing generated projects out, not importing existing repos"
        },
        {
          "feature": "GitHub export/push of generated project",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Backend & Payments",
      "rows": [
        {
          "feature": "Built-in database/auth (Supabase)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in payments (Stripe)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "One-click deploy to a live URL",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom domain support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented on Bolt.new's Pro plan"
        },
        {
          "feature": "Native one-click deploy to Vercel",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Mobile App Building",
      "rows": [
        {
          "feature": "iOS/Android app generation via Expo",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Team & Enterprise",
      "rows": [
        {
          "feature": "Team plan with centralized billing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Both documented on Enterprise-tier plans"
        },
        {
          "feature": "Role-based access / admin provisioning",
          "toolA": "available",
          "toolB": "available",
          "note": "Bolt.new: Teams-tier admin controls and user provisioning; v0: Enterprise-tier role-based access control"
        }
      ]
    },
    {
      "group": "Developer & API Access",
      "rows": [
        {
          "feature": "Public API/SDK for embedding the generation engine",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Bolt.new or v0?",
      "answer": "Bolt.new's paid tier starts lower, at $25/month for its Pro plan with 10M+ monthly tokens, while v0's paid tier starts at $30/user/month with a $30 monthly credit allowance; both also offer usable free plans, so the cheaper option depends on usage volume and whether you're paying per seat."
    },
    {
      "question": "Is Bolt.new or v0 better for building a full-stack app with a database?",
      "answer": "Bolt.new is the better fit for a full-stack app with a database, since it has built-in Supabase integration for auth, Postgres, and storage plus native Stripe payments, while v0's documented feature set doesn't include built-in backend or payments integration."
    },
    {
      "question": "Can v0 do what Bolt.new does?",
      "answer": "Not fully: v0 is documented as a front-end code generator producing React, Tailwind CSS, and shadcn/ui, with no documented built-in database, payments, or mobile-app building, so it doesn't cover Bolt.new's full-stack app and Expo mobile capabilities."
    },
    {
      "question": "Is Bolt.new or v0 better for someone with no coding experience?",
      "answer": "Bolt.new leans slightly more toward non-coders since it can scaffold and deploy an entire app including backend pieces from a prompt, whereas v0's own FAQs note that getting the best results and integrating its output generally assumes some familiarity with React and components."
    },
    {
      "question": "Which tool has better GitHub and deployment integration?",
      "answer": "Both integrate with GitHub for exporting generated code, but they differ on deployment: Bolt.new deploys to its own hosting with custom domain support, while v0 deploys natively and directly to Vercel, which matters most if your team is already standardized on Vercel."
    },
    {
      "question": "Can I build a mobile app with v0 like I can with Bolt.new?",
      "answer": "Not based on documented features: Bolt.new explicitly supports building iOS and Android apps via Expo integration with QR-code preview, while v0's documented feature set covers web UI generation only, with no mention of native mobile app output."
    }
  ]
};

export default boltNewVsV0Content;
