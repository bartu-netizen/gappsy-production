import type { ToolComparisonContent } from './types';

const nuclinoVsSliteContent: ToolComparisonContent = {
  "verdict": "Nuclino and Slite are both freemium knowledge tools, but they solve somewhat different problems: Nuclino combines docs, wiki content, and lightweight project tracking (via its Canvas view) in one unified workspace with a capped-but-real free plan (50 items, 3 canvases, 2GB), while Slite is more narrowly a knowledge base with content-verification workflows and an AI agent (Pro plan and above) that specifically searches across connected tools like Slack, Linear, and GitHub and flags documentation that has drifted out of date. Nuclino doesn't publish Starter or Business pricing, while Slite lists exact prices for all three of its tiers.",
  "bestForToolA": "Teams that want a single lightweight workspace covering docs, wiki, and simple project tracking (via Canvas), and that can work within the free plan's 50-item/3-canvas/2GB limits or don't need published pricing for paid tiers upfront.",
  "bestForToolB": "Teams whose knowledge already lives partly in Slack, Linear, GitHub, Jira, or similar tools and want an AI agent (Pro plan, $20/user/month) that searches across those connected tools and automatically flags outdated documentation via drift detection.",
  "whoNeedsBoth": "Teams deciding whether to centralize project tracking and docs in one tool (Nuclino) versus keeping project tools separate and layering a verification-focused knowledge base on top (Slite) should compare both directly, since the two serve overlapping but distinct workflows.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Nuclino's Starter and Business plan prices aren't published — they're quote or checkout only.",
      "toolB": "Slite publishes exact prices for all three tiers: Basic ($10/user/month), Pro ($20/user/month), and custom Enterprise.",
      "whyItMatters": "A published price lets buyers budget without engaging sales, which Slite supports for two of its three tiers.",
      "benefitsWho": "Small teams and budget-conscious buyers comparing options quickly."
    },
    {
      "title": "Scope: unified workspace vs. knowledge base",
      "toolA": "Nuclino unifies docs, knowledge base, and lightweight project tracking in one workspace, with a visual Canvas for organizing content.",
      "toolB": "Slite is centered on knowledge base content and its accuracy, without a stated project-tracking feature.",
      "whyItMatters": "Teams that want project tracking and docs in the same tool avoid juggling two systems.",
      "benefitsWho": "Small teams that want one tool instead of separate docs and project-tracking apps."
    },
    {
      "title": "AI scope: general assistant vs. cross-tool search with drift detection",
      "toolA": "Nuclino's Sidekick AI assistant is available on the Business plan as a general AI feature.",
      "toolB": "Slite's Slite Agent (Pro plan and above) searches across connected third-party tools, and a separate Knowledge drift detection feature watches Slack, Linear, GitHub, and the codebase to flag when docs need updates, capped at 50 monthly AI credits per seat on Pro.",
      "whyItMatters": "Slite's AI is purpose-built to keep documentation in sync with tools the team already uses, while Nuclino's is a more general assistant.",
      "benefitsWho": "Teams worried about documentation going stale as connected tools change (Slite) vs. teams wanting a general AI helper inside their workspace (Nuclino)."
    },
    {
      "title": "Free plan limits",
      "toolA": "Nuclino's free plan is explicitly capped at 50 items, 3 canvases, and 2GB total storage, but includes real-time collaboration and two-factor authentication.",
      "toolB": "Slite offers a free starting tier alongside its paid plans, though its specific item/storage caps aren't detailed in the facts.",
      "whyItMatters": "Nuclino's documented caps make it easier to predict when a team will need to upgrade.",
      "benefitsWho": "Small teams sizing up whether a free plan will actually cover their usage."
    },
    {
      "title": "Named integration breadth",
      "toolA": "Nuclino's integrations are described generically as 'apps & integrations,' with API access from the Starter plan up.",
      "toolB": "Slite names 12 specific integrations: Slack, Linear, GitHub, Jira, Asana, HubSpot, Intercom, Attio, Google Drive, SharePoint, Salesforce, and BigQuery.",
      "whyItMatters": "A named integration list lets buyers confirm compatibility with their existing stack before signing up.",
      "benefitsWho": "Teams that need to verify specific tool integrations (e.g., Salesforce or BigQuery) before adopting a knowledge base."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Workspace",
      "rows": [
        {
          "feature": "Unified docs + project tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Visual canvas view",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Nuclino includes this even on its free plan; Slite's facts don't explicitly describe real-time co-editing."
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "Nuclino: Sidekick (Business plan). Slite: Slite Agent (Pro plan and above)."
        },
        {
          "feature": "Cross-tool AI search (connected apps)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated outdated-content detection",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Doc fact-checking / verification workflow",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Slite: suggested fixes on Pro plan."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Nuclino: 50 items/3 canvases/2GB. Slite: free starting tier, caps not detailed in facts."
        },
        {
          "feature": "Published price for entry paid tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Slite Basic: $10/user/month."
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Nuclino: from Starter plan. Slite: from Basic plan."
        }
      ]
    },
    {
      "group": "Compliance & Security",
      "rows": [
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Nuclino: SAML SSO on Business. Slite: OpenID SSO on Pro."
        },
        {
          "feature": "Stated compliance certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Slite states SOC 2 (AICPA) compliance."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Nuclino free?",
      "answer": "Yes, the Free plan supports up to 50 items, 3 canvases, and 2GB total storage."
    },
    {
      "question": "Does Slite have a free plan?",
      "answer": "Yes, Slite offers a free starting tier alongside its paid Basic, Pro, and Enterprise plans."
    },
    {
      "question": "Does Nuclino have AI features?",
      "answer": "Yes, an AI assistant called Sidekick is available on the Business plan."
    },
    {
      "question": "What does Slite Agent do?",
      "answer": "It's an AI agent, available on the Pro plan, that searches across Slite docs and connected tools like Slack and GitHub to answer questions."
    },
    {
      "question": "How are Nuclino's Starter and Business plans priced?",
      "answer": "Exact prices aren't published on the pricing page — they're quote or checkout only, unlike Slite's flat $10 (Basic) and $20 (Pro) per-user pricing."
    },
    {
      "question": "What does Slite's knowledge drift detection do?",
      "answer": "It watches Slack, Linear, GitHub, and the codebase to flag when documentation needs updates."
    }
  ]
};

export default nuclinoVsSliteContent;
