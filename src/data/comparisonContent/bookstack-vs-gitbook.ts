import type { ToolComparisonContent } from './types';

const bookstackVsGitbookContent: ToolComparisonContent = {
  "verdict": "BookStack is a fully free, self-hosted wiki platform (MIT licensed) that organizes documentation into Books, Chapters, and Pages, with no pricing tiers to navigate. GitBook is a hosted SaaS documentation platform built around Git Sync with GitHub/GitLab, an AI content assistant, and interactive API playgrounds, priced per site starting at $65/month once you outgrow its free tier. One is a self-managed wiki you run yourself; the other is a managed, developer-oriented docs product with AI features and enterprise compliance.",
  "bestForToolA": "Teams that want a completely free, self-hosted internal wiki with enterprise-grade OIDC/SAML2/LDAP authentication and built-in diagrams.net diagramming, and are comfortable maintaining a PHP/Laravel/MySQL stack.",
  "bestForToolB": "Developer-facing teams that want documentation synced directly from GitHub/GitLab branches, interactive API playgrounds, and an AI assistant that flags outdated content, and are willing to pay $65-$249 per site per month for it.",
  "whoNeedsBoth": "A company could run BookStack internally as a free, self-hosted knowledge base for HR policies and internal engineering notes, while using GitBook for its public-facing developer documentation and API reference, since GitBook's Git Sync and API playgrounds are purpose-built for external-facing docs that BookStack doesn't specialize in.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "BookStack is self-hosted only, requiring a PHP/Laravel/MySQL stack, with no official managed cloud plan.",
      "toolB": "GitBook is a fully hosted SaaS platform with no self-hosting option documented.",
      "whyItMatters": "Self-hosting gives full data control but adds maintenance overhead; hosted SaaS removes that overhead but locks content into GitBook's infrastructure.",
      "benefitsWho": "IT teams wanting full infrastructure control benefit from BookStack; teams that don't want to manage servers benefit from GitBook."
    },
    {
      "title": "Pricing",
      "toolA": "BookStack is entirely free and open source with no pricing plans or tiers at all.",
      "toolB": "GitBook's Free plan is $0/site/month with a GitBook Agent capped at 10 messages/week, scaling to Premium at $65/site/month and Ultimate at $249/site/month, plus $12/month per additional user beyond the first.",
      "whyItMatters": "BookStack's cost is limited to hosting infrastructure, while GitBook's cost scales with the number of sites and team members.",
      "benefitsWho": "Budget-constrained teams and large internal wikis benefit from BookStack's zero licensing cost; teams needing GitBook's AI and Git-sync features can justify the per-site fee."
    },
    {
      "title": "AI-Assisted Documentation",
      "toolA": "BookStack does not document any AI features.",
      "toolB": "GitBook includes a GitBook Agent that detects outdated content, and an AI Assistant (Ultimate/Enterprise) that lets readers ask questions answered directly from the docs.",
      "whyItMatters": "AI content-freshness detection can reduce the manual burden of keeping large documentation sets accurate over time.",
      "benefitsWho": "Teams maintaining large, fast-changing documentation sets benefit from GitBook's AI Agent."
    },
    {
      "title": "Git-Based Workflows",
      "toolA": "BookStack has no documented Git sync — content is edited directly through its WYSIWYG or Markdown editor.",
      "toolB": "GitBook's Git Sync supports branch-based workflows synced directly with GitHub or GitLab repositories.",
      "whyItMatters": "Git-based sync lets documentation follow the same review/PR process as code, which matters for engineering teams.",
      "benefitsWho": "Engineering teams that already use GitHub/GitLab PR workflows benefit from GitBook's Git Sync."
    },
    {
      "title": "Enterprise Authentication & Compliance",
      "toolA": "BookStack supports OIDC, SAML2, and LDAP authentication plus TOTP-based MFA natively, at no extra licensing cost since it's self-hosted.",
      "toolB": "GitBook offers SAML SSO only on its custom-priced Enterprise tier, though its infrastructure is SOC 2 and ISO 27001 certified starting from the Free plan.",
      "whyItMatters": "The cost of enterprise SSO differs significantly: BookStack includes it free, while GitBook gates it behind its highest, custom-quoted tier.",
      "benefitsWho": "Cost-sensitive organizations needing SSO benefit from BookStack; organizations that specifically need SOC 2/ISO 27001-certified hosted infrastructure benefit from GitBook."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editing & Content Structure",
      "rows": [
        {
          "feature": "WYSIWYG editor",
          "toolA": "available",
          "toolB": "available",
          "note": "GitBook's is block-based"
        },
        {
          "feature": "Markdown editor with live preview",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in diagramming",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BookStack uses diagrams.net"
        },
        {
          "feature": "Hierarchical Books/Chapters/Pages structure",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Collaboration & Dev Workflow",
      "rows": [
        {
          "feature": "Git-based sync (GitHub/GitLab)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Interactive API playgrounds",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI content-freshness / assistant",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "GitBook Agent + AI Assistant"
        },
        {
          "feature": "Full-text search",
          "toolA": "available",
          "toolB": "available",
          "note": "BookStack links to specific paragraphs"
        }
      ]
    },
    {
      "group": "Security, Hosting & Pricing",
      "rows": [
        {
          "feature": "Self-hosting option",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SSO (OIDC / SAML2 / LDAP)",
          "toolA": "available",
          "toolB": "limited",
          "note": "GitBook: SAML SSO on Enterprise only"
        },
        {
          "feature": "SOC 2 / ISO 27001 certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "BookStack fully free; GitBook Free plan is feature-limited"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is BookStack or GitBook free?",
      "answer": "BookStack is entirely free and open source (MIT license). GitBook has a $0/site/month Free plan, but paid tiers start at $65/site/month for Premium."
    },
    {
      "question": "Which one requires self-hosting?",
      "answer": "BookStack is self-hosted only, requiring a PHP/Laravel/MySQL stack. GitBook is a fully hosted SaaS product with no self-hosting option."
    },
    {
      "question": "Which has AI features?",
      "answer": "GitBook includes a GitBook Agent that flags outdated content and an AI Assistant for reader Q&A on Ultimate/Enterprise plans. BookStack does not document any AI capabilities."
    },
    {
      "question": "Does either sync with GitHub?",
      "answer": "GitBook's Git Sync supports branch-based workflows with GitHub and GitLab. BookStack has no documented Git sync feature."
    },
    {
      "question": "Which supports enterprise SSO?",
      "answer": "BookStack supports OIDC, SAML2, and LDAP at no extra cost. GitBook requires its custom-priced Enterprise plan to unlock SAML SSO."
    },
    {
      "question": "What does each actually cost to run?",
      "answer": "BookStack's only cost is hosting — the project notes it can run on a budget VPS. GitBook costs $65-$249 per site per month plus $12/month per additional user beyond the first."
    }
  ]
};

export default bookstackVsGitbookContent;
