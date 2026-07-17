import type { ToolComparisonContent } from './types';

const gitbookVsHedgedocContent: ToolComparisonContent = {
  "verdict": "GitBook and HedgeDoc both help teams write and manage Markdown content, but they sit at opposite ends of the hosting spectrum: GitBook is a fully hosted, Git-synced documentation SaaS with AI features and SOC 2/ISO 27001 certification, while HedgeDoc is a completely free, self-hosted, real-time collaborative Markdown editor with no official cloud version. The right fit depends on whether you want a managed, AI-assisted publishing platform or a zero-cost, self-hosted collaborative editor.",
  "bestForToolA": "Product and engineering teams wanting Git-synced documentation (GitHub/GitLab branch workflows), interactive API playgrounds, and AI-assisted content freshness or reader search, backed by SOC 2/ISO 27001 certified infrastructure.",
  "bestForToolB": "Developers and small teams wanting a completely free, self-hosted, real-time collaborative Markdown editor — including a presentation mode — with no recurring SaaS fees, even on low-powered hardware like a Raspberry Pi.",
  "whoNeedsBoth": "A developer team could use HedgeDoc internally for free-form, real-time collaborative meeting notes and brainstorming, while publishing their polished, versioned product documentation externally through GitBook's Git-synced, AI-assisted platform — different tools for internal drafting versus external published docs.",
  "keyDifferences": [
    {
      "title": "Pricing & Business Model",
      "toolA": "GitBook is a Freemium SaaS with a Free plan and paid tiers up to $249/site/month (Ultimate) plus custom Enterprise, with a $12/month per-user add-on beyond the first user.",
      "toolB": "HedgeDoc is entirely free and open source (AGPL-3.0) with no pricing plans at all — the only cost is your own self-hosting infrastructure.",
      "whyItMatters": "Total cost of ownership differs drastically: GitBook is a recurring per-site/per-user SaaS cost, while HedgeDoc's only cost is infrastructure.",
      "benefitsWho": "Budget-conscious technical teams and hobbyists favor HedgeDoc; teams wanting a managed, supported SaaS with security certifications favor GitBook."
    },
    {
      "title": "Hosting Model",
      "toolA": "GitBook is a fully hosted SaaS with no self-hosting option documented.",
      "toolB": "HedgeDoc requires self-hosting; there is no official hosted cloud version, though ready-to-use Docker images are provided.",
      "whyItMatters": "This determines who owns infrastructure and uptime responsibility.",
      "benefitsWho": "Teams without ops resources prefer GitBook's managed hosting; teams wanting full data control prefer HedgeDoc's self-hosted model."
    },
    {
      "title": "AI Features",
      "toolA": "GitBook includes a GitBook Agent for content-freshness detection (10 messages/week free, unlimited on Ultimate) and an AI Assistant answering reader questions sourced from the docs (500 answers included on Ultimate).",
      "toolB": "No AI features are documented for HedgeDoc.",
      "whyItMatters": "Teams wanting AI-assisted documentation maintenance or reader-facing AI search have that only in GitBook.",
      "benefitsWho": "Larger documentation teams maintaining large knowledge bases."
    },
    {
      "title": "Real-Time Collaborative Editing",
      "toolA": "GitBook offers \"Team collaboration\" as a named feature starting on the Premium plan, but doesn't document simultaneous real-time multi-cursor editing the way HedgeDoc does.",
      "toolB": "HedgeDoc is built specifically around real-time collaboration, letting multiple users edit the same Markdown document simultaneously.",
      "whyItMatters": "Teams needing live, simultaneous Markdown editing get that natively in HedgeDoc from day one at no cost.",
      "benefitsWho": "Small teams or classrooms doing live collaborative note-taking."
    },
    {
      "title": "Enterprise Security Certifications",
      "toolA": "GitBook's infrastructure is SOC 2 and ISO 27001 certified even on the Free plan, with SAML SSO and access controls on higher tiers.",
      "toolB": "No compliance certifications are documented for HedgeDoc; since it's self-hosted, security posture depends on the operator's own infrastructure.",
      "whyItMatters": "Regulated industries and enterprise buyers often require vendor compliance certifications that a self-hosted open-source tool can't itself provide.",
      "benefitsWho": "Enterprise documentation teams with compliance requirements favor GitBook."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editing & Collaboration",
      "rows": [
        {
          "feature": "Real-time simultaneous multi-user editing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Block-based visual editor",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Presentation mode",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "HedgeDoc: powered by reveal.js"
        },
        {
          "feature": "Revision/version history",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Publishing & Developer Workflow",
      "rows": [
        {
          "feature": "Git Sync (GitHub/GitLab)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Interactive API playgrounds",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI content/reader assistant",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "GitBook: Premium/Ultimate tiers"
        },
        {
          "feature": "Self-hosting",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free tier/plan",
          "toolA": "available",
          "toolB": "available",
          "note": "GitBook Free plan; HedgeDoc entire product is free"
        },
        {
          "feature": "Paid tiers",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "GitBook Premium $65, Ultimate $249, custom Enterprise"
        },
        {
          "feature": "SOC 2 / ISO 27001 certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SAML SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GitBook: Enterprise plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is GitBook free?",
      "answer": "Yes, a free plan is available with no credit card required, including the block editor, Git Sync, and a GitBook Agent limited to 10 messages/week."
    },
    {
      "question": "Is HedgeDoc free?",
      "answer": "Yes, HedgeDoc is entirely free and open source (AGPL-3.0) with no paid tier."
    },
    {
      "question": "Does either tool require self-hosting?",
      "answer": "HedgeDoc requires self-hosting with no official cloud version, while GitBook is a hosted SaaS with no self-hosting option documented."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "GitBook includes a GitBook Agent and AI Assistant (limited on Free/Premium, expanded on Ultimate); HedgeDoc has no documented AI features."
    },
    {
      "question": "Which is better for live collaborative note-taking?",
      "answer": "HedgeDoc, whose core feature set is built around real-time collaborative Markdown editing."
    },
    {
      "question": "How much does GitBook cost above the free plan?",
      "answer": "Premium starts at $65/site/month (billed annually) and Ultimate at $249/site/month, both adding $12/month per user beyond the first."
    }
  ]
};

export default gitbookVsHedgedocContent;
