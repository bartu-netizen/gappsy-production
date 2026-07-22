import type { ToolComparisonContent } from './types';

const cursorVsWindsurfContent: ToolComparisonContent = {
  "verdict": "Cursor and Windsurf are both AI-native, VS Code-based editors built around an autonomous coding agent, but they optimize for different parts of the job. Cursor, from independent startup Anysphere, leans into deep editor integration: Tab autocomplete, a Composer/Agent mode for multi-file work, a dedicated background agent for longer tasks, and Bugbot for automated PR review, all layered on VS Code's familiar shell. Windsurf, now transitioning to Devin Desktop under Cognition, leans into agent transparency and extensibility: its Cascade agent stages every change as a reviewable diff, natively supports MCP for wiring in external tools and data, and adds a proprietary in-house coding model alongside Claude and GPT, plus self-hosted and air-gapped deployment inherited from its Codeium enterprise roots. Pricing structures are similarly priced at the entry paid tier ($20/month) but differ in mechanics: Cursor uses credit-based usage on paid plans, while Windsurf uses daily/weekly Cascade quotas, so actual cost depends heavily on usage patterns rather than list price. Windsurf's two rebrands (Codeium to Windsurf to Devin Desktop) also introduce roadmap and continuity questions that Cursor, with a stable brand since 2022, does not carry. Neither tool is a strict upgrade over the other; the right choice depends on whether a team values Cursor's built-in review automation and background agent, or Windsurf's diff-approval workflow, MCP connectivity, and enterprise deployment flexibility.",
  "bestForToolA": "Cursor fits developers and teams who want a stable, single-purpose AI editor company with built-in PR review automation (Bugbot) and a dedicated background agent for longer-running tasks, without needing self-hosted deployment.",
  "bestForToolB": "Windsurf fits teams that need MCP-based connectivity to external tools and data, want an explicit per-step diff review before agent edits apply, or require self-hosted or air-gapped enterprise deployment.",
  "whoNeedsBoth": "Engineering organizations that let individual developers choose their own editor, or teams benchmarking agentic coding workflows before standardizing, may reasonably end up running both tools side by side.",
  "keyDifferences": [
    {
      "title": "Company origin and backing",
      "toolA": "Built by Anysphere, founded 2022, a company focused specifically on the Cursor editor.",
      "toolB": "Founded in 2021 (as Codeium), acquired by Cognition (maker of the Devin agent) in 2025 for a reported ~$250 million, and rebranded Devin Desktop in June 2026.",
      "whyItMatters": "Buyers care about roadmap stability and whether a vendor is dedicated to the product they're adopting versus folding it into a broader agent strategy.",
      "benefitsWho": "Teams wanting a single-purpose, independent editor vendor lean toward Cursor; teams already invested in Cognition's Devin ecosystem lean toward Windsurf/Devin Desktop."
    },
    {
      "title": "Brand stability",
      "toolA": "Product name and identity have been unchanged since launch.",
      "toolB": "Renamed twice (Codeium to Windsurf to Devin Desktop), with pricing structure also changing more than once.",
      "whyItMatters": "Renames and pricing changes can create confusion around billing, login, and support continuity for teams standardizing tooling.",
      "benefitsWho": "Risk-averse IT/procurement teams favor Cursor's continuity; teams already tracking Cognition's announcements accept Windsurf's transition."
    },
    {
      "title": "Automated PR review",
      "toolA": "Bugbot automatically reviews pull requests for likely bugs and can propose fixes directly on the PR.",
      "toolB": "Not documented as part of Windsurf's feature set.",
      "whyItMatters": "Built-in review automation reduces the need for a separate PR-review tool in the workflow.",
      "benefitsWho": "Engineering teams that want review automation baked into the editor benefit more from Cursor."
    },
    {
      "title": "MCP / external tool connectivity",
      "toolA": "Not documented as a Cursor feature.",
      "toolB": "Natively supports the Model Context Protocol, letting Cascade connect to external tools, internal systems, and data sources.",
      "whyItMatters": "MCP support determines how easily a team can extend the agent's context with proprietary systems.",
      "benefitsWho": "Teams needing to plug in internal tooling or data sources benefit more from Windsurf."
    },
    {
      "title": "Diff review workflow",
      "toolA": "Not documented as having an explicit per-step diff-approval gate for agent edits.",
      "toolB": "Cascade stages every edit as a diff with per-step approval, so changes can be reviewed, edited, or rejected before hitting disk.",
      "whyItMatters": "An explicit staged-approval workflow affects how much a team can trust autonomous edits without manual diffing after the fact.",
      "benefitsWho": "Cautious teams or regulated environments that want a built-in review gate before changes apply may prefer Windsurf."
    },
    {
      "title": "Background/async agent execution",
      "toolA": "Includes a dedicated background agent that runs longer agentic tasks outside the main editor session.",
      "toolB": "Not documented as a Windsurf feature.",
      "whyItMatters": "Offloading long-running tasks lets a developer keep working in the foreground without blocking on the agent.",
      "benefitsWho": "Developers juggling multiple simultaneous coding tasks benefit more from Cursor's background agent."
    },
    {
      "title": "Enterprise deployment flexibility",
      "toolA": "Enterprise plan is custom-quoted; self-hosted deployment is not documented.",
      "toolB": "Documents self-hosted and air-gapped deployment options carried over from its Codeium enterprise roots.",
      "whyItMatters": "Regulated or data-residency-sensitive organizations often require on-prem or air-gapped deployment as a hard requirement.",
      "benefitsWho": "Enterprises with strict data-residency or compliance requirements lean toward Windsurf."
    },
    {
      "title": "Third-party integrations",
      "toolA": "Not documented as offering integrations with external collaboration tools.",
      "toolB": "Documents integrations with tools like Slack, Linear, Figma, and common language servers.",
      "whyItMatters": "Native integrations reduce context switching for teams whose workflow already lives in those tools.",
      "benefitsWho": "Teams already standardized on Slack, Linear, or Figma get more out-of-the-box value from Windsurf."
    },
    {
      "title": "In-house coding model",
      "toolA": "Offers a choice among multiple frontier AI models; no proprietary in-house model is documented.",
      "toolB": "Offers its own in-house SWE coding model in addition to Claude and GPT models.",
      "whyItMatters": "A first-party model can offer different cost or performance tradeoffs than routing exclusively through third-party providers.",
      "benefitsWho": "Cost-conscious teams wanting a cheaper first-party model option may value Windsurf's in-house model."
    },
    {
      "title": "Pricing mechanics on paid plans",
      "toolA": "Paid plans use credit-based usage, which can make monthly costs less predictable than a flat subscription.",
      "toolB": "Pro plan uses daily and weekly Cascade agent quotas, a structure that has itself changed over time from credits to quotas.",
      "whyItMatters": "Both tools tie cost to usage rather than a simple flat fee, so actual monthly spend depends on how heavily a team relies on the agent.",
      "benefitsWho": "Budget-conscious teams should model expected agent usage against either tool's usage-based pricing before committing, since neither offers a flat unlimited-usage paid tier documented here."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core AI Editing",
      "rows": [
        {
          "feature": "Predictive/Tab-style autocomplete",
          "toolA": "available",
          "toolB": "available",
          "note": "Windsurf's is unlimited even on the free tier"
        },
        {
          "feature": "Inline in-place edit via text selection (Cmd+K-style)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Agentic multi-file editing",
          "toolA": "available",
          "toolB": "available",
          "note": "Cursor's Composer/Agent mode vs. Windsurf's Cascade"
        },
        {
          "feature": "VS Code fork compatibility (extensions, themes, keybindings)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Autonomous Agent Behavior",
      "rows": [
        {
          "feature": "Terminal command execution by agent",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Background/async agent execution outside main session",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Per-step diff review/approval before edits apply",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated pull request review bot",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cursor's Bugbot"
        }
      ]
    },
    {
      "group": "Codebase Understanding",
      "rows": [
        {
          "feature": "Semantic codebase indexing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Dedicated codebase-aware chat interface",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "AI Model Options",
      "rows": [
        {
          "feature": "Multi-model support (choice of frontier models)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "In-house/proprietary coding model",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Windsurf's in-house SWE model"
        }
      ]
    },
    {
      "group": "Extensibility and Integrations",
      "rows": [
        {
          "feature": "Model Context Protocol (MCP) support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Third-party app integrations (e.g. Slack, Linear, Figma)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Enterprise and Deployment",
      "rows": [
        {
          "feature": "Single sign-on (SSO)",
          "toolA": "available",
          "toolB": "available",
          "note": "Teams/Enterprise plan tier for both"
        },
        {
          "feature": "Self-hosted or air-gapped deployment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Centralized billing and admin dashboard",
          "toolA": "available",
          "toolB": "available",
          "note": "Teams plan tier for both"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Cursor or Windsurf cheaper?",
      "answer": "Both start with a free tier and a $20/month Pro plan, so list prices are effectively tied; the real cost difference comes from usage mechanics, since Cursor's paid plans run on credit-based usage while Windsurf's Pro plan runs on daily and weekly Cascade agent quotas."
    },
    {
      "question": "Which is better for someone switching from plain VS Code?",
      "answer": "Both are VS Code forks that import existing extensions, themes, and keybindings, so neither has a documented edge in switching cost or learning curve for VS Code users."
    },
    {
      "question": "Can Windsurf review pull requests the way Cursor's Bugbot does?",
      "answer": "Not according to the documented feature set; Cursor includes an automated PR-review feature called Bugbot, while Windsurf's documented features do not include an equivalent."
    },
    {
      "question": "Does Cursor support MCP servers like Windsurf does?",
      "answer": "Windsurf documents native Model Context Protocol support for connecting external tools and data into its Cascade agent, while MCP support is not documented as a Cursor feature."
    },
    {
      "question": "Is Windsurf still called Windsurf?",
      "answer": "As of June 2026, Cognition rebranded the Windsurf editor as Devin Desktop, though existing Windsurf accounts, plans, and settings carried over automatically and legacy Enterprise customers still log in via windsurf.com/enterprise."
    },
    {
      "question": "Which tool supports self-hosted or air-gapped deployment?",
      "answer": "Windsurf documents self-hosted and air-gapped deployment options inherited from its Codeium enterprise roots, while Cursor's Enterprise plan is custom-quoted without documented self-hosting support."
    }
  ]
};

export default cursorVsWindsurfContent;
