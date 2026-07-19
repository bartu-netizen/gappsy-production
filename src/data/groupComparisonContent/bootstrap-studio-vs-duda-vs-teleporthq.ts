import type { GroupComparisonContent } from './types';

const bootstrapStudioVsDudaVsTeleporthqContent: GroupComparisonContent = {
  "verdict": "Bootstrap Studio, Duda, and TeleportHQ all let you build websites visually, but they serve very different workflows. Bootstrap Studio is a one-time-purchase desktop app for freelancers who want to hand-craft Bootstrap sites offline and own the output outright. Duda is a hosted subscription platform built for agencies managing many client sites with AI tools and white-label branding. TeleportHQ sits between them as a low-code, AI-assisted builder that exports production-ready code in React, Vue, Next.js, or Angular for teams who need framework-native output.",
  "bestFor": {
    "bootstrap-studio": "Freelancers and developers who want a one-time-purchase desktop tool to hand-craft Bootstrap sites offline without a subscription",
    "duda": "Agencies and web professionals managing many client sites who need white-label hosting, client dashboards, and AI tooling",
    "teleporthq": "Development teams who want AI-assisted visual design that exports clean, framework-native code in React, Vue, Next.js, or Angular"
  },
  "highlights": [
    {
      "title": "Ownership model differs sharply",
      "description": "Bootstrap Studio is a $29 one-time lifetime license, Duda is a recurring agency subscription starting at $19/month, and TeleportHQ is freemium with paid plans from about $9 per editor per month.",
      "toolSlugs": [
        "bootstrap-studio",
        "duda",
        "teleporthq"
      ]
    },
    {
      "title": "Only two of the three include hosting",
      "description": "Duda hosts every site on managed AWS infrastructure and TeleportHQ offers free subdomain hosting plus custom domains on paid plans, while Bootstrap Studio produces local project files that must be deployed elsewhere.",
      "toolSlugs": [
        "duda",
        "teleporthq",
        "bootstrap-studio"
      ]
    },
    {
      "title": "Code philosophy varies by tool",
      "description": "Bootstrap Studio exports standard, editable Bootstrap HTML and CSS, TeleportHQ exports across multiple modern frameworks, and Duda exposes HTML, CSS, and JavaScript code access only on Team plans and above rather than a full multi-framework export.",
      "toolSlugs": [
        "bootstrap-studio",
        "teleporthq",
        "duda"
      ]
    },
    {
      "title": "Agency features concentrate in Duda",
      "description": "Duda's client-management dashboard and white-label branding are built specifically for agencies reselling websites, a layer neither Bootstrap Studio nor TeleportHQ documents.",
      "toolSlugs": [
        "duda"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Building & Deployment",
      "rows": [
        {
          "feature": "Visual drag-and-drop editor",
          "statuses": {
            "bootstrap-studio": "available",
            "duda": "available",
            "teleporthq": "available"
          }
        },
        {
          "feature": "Framework or code export",
          "statuses": {
            "bootstrap-studio": "available",
            "duda": "limited",
            "teleporthq": "available"
          },
          "note": "Bootstrap Studio exports standard Bootstrap HTML/CSS; TeleportHQ exports React, Vue, Next.js, or Angular; Duda only exposes code access on Team plans and above."
        },
        {
          "feature": "Built-in hosting",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "duda": "available",
            "teleporthq": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "Free tier available",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "duda": "unavailable",
            "teleporthq": "available"
          },
          "note": "Duda offers only a 14-day free trial, not a permanent free tier."
        },
        {
          "feature": "One-time purchase option",
          "statuses": {
            "bootstrap-studio": "available",
            "duda": "unavailable",
            "teleporthq": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Collaboration & Agency Tools",
      "rows": [
        {
          "feature": "White-label branding",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "duda": "available",
            "teleporthq": "not-documented"
          }
        },
        {
          "feature": "Team collaboration",
          "statuses": {
            "bootstrap-studio": "unavailable",
            "duda": "available",
            "teleporthq": "available"
          },
          "note": "TeleportHQ includes unlimited collaborators even on its free plan; Duda's collaboration scales with paid team seats."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is better for an agency building many client websites: Bootstrap Studio, Duda, or TeleportHQ?",
      "answer": "Duda, since it is purpose-built for agencies with a client-management dashboard, white-label branding, and managed hosting across multiple sites, features neither Bootstrap Studio nor TeleportHQ offers."
    },
    {
      "question": "Does TeleportHQ lock me into its own proprietary format?",
      "answer": "No. TeleportHQ is built around exporting production-ready code in React, Vue, Next.js, Angular, or plain HTML and CSS, so projects can move to standard developer workflows."
    },
    {
      "question": "Can I use Bootstrap Studio without paying a recurring subscription?",
      "answer": "Yes. Bootstrap Studio is sold as a single $29 one-time purchase that includes a lifetime license and future minor updates, unlike Duda and TeleportHQ's subscription pricing."
    },
    {
      "question": "Which of the three includes website hosting?",
      "answer": "Duda and TeleportHQ both include hosting, Duda on managed AWS infrastructure and TeleportHQ on a free subdomain with custom domain options on paid plans. Bootstrap Studio produces local project files that must be hosted separately."
    },
    {
      "question": "Is there a free way to try any of these tools before paying?",
      "answer": "TeleportHQ has a genuine free plan, and Duda offers a 14-day free trial. Bootstrap Studio does not list a free trial, only its one-time $29 purchase."
    }
  ]
};

export default bootstrapStudioVsDudaVsTeleporthqContent;
