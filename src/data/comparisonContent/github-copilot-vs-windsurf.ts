import type { ToolComparisonContent } from './types';

const githubCopilotVsWindsurfContent: ToolComparisonContent = {
  "verdict": "GitHub Copilot and Windsurf solve different jobs even though both are billed as AI coding assistants. Copilot is an add-on that meets developers where they already work: it layers inline completions, chat, PR review, and an issue-to-PR coding agent onto the IDEs and GitHub workflow teams already use, without asking anyone to change editors. Windsurf is a rebuilt-from-scratch editor whose entire value proposition is its Cascade agent — a pane that reads your whole codebase, plans multi-step changes, edits several files, runs terminal commands, and stages every change as a reviewable diff before it touches disk. If the job is 'make my existing IDE and GitHub workflow smarter,' Copilot's breadth of editor support and native GitHub issue/PR integration wins. If the job is 'hand a coding agent a task and watch it work across the whole project in one live session,' Windsurf's Cascade is the more purpose-built tool. Windsurf also carries real transition risk: it was acquired by Cognition and rebranded to Devin Desktop in June 2026, and its pricing model has already changed more than once, whereas Copilot has had a stable identity and roadmap under GitHub since 2021. Neither tool's documented facts confirm Copilot doing in-editor terminal-driven multi-file agent work, or Windsurf doing GitHub-native PR review — so the honest comparison is fit, not a universal winner.",
  "bestForToolA": "Teams and individual developers who want AI assistance layered into their existing IDE (VS Code, Visual Studio, JetBrains, Neovim) and tightly tied to GitHub issues, pull requests, and code review, especially larger orgs that need admin controls and IP indemnification.",
  "bestForToolB": "Developers who want a dedicated AI-native editor where an agent can autonomously plan, edit multiple files, and run terminal commands in one live session with step-by-step diff review, including enterprise teams that need self-hosted or air-gapped deployment.",
  "whoNeedsBoth": "Engineering teams standardized on GitHub for issues, PRs, and code review who also want a dedicated agentic editor for heavier multi-file refactors would reasonably run Copilot for day-to-day GitHub-integrated work and Windsurf's Cascade for larger, self-contained coding tasks.",
  "keyDifferences": [
    {
      "title": "Core product model",
      "toolA": "An AI layer added to existing IDEs and the GitHub workflow (completions, chat, PR review, coding agent).",
      "toolB": "A standalone, AI-native VS Code fork built around the Cascade agent as its central experience.",
      "whyItMatters": "Determines whether adopting the tool means changing editors or just installing a plugin.",
      "benefitsWho": "Copilot benefits teams that don't want to switch editors; Windsurf benefits developers open to a dedicated AI-first editor."
    },
    {
      "title": "Autonomous multi-file agent work",
      "toolA": "Copilot coding agent takes a GitHub issue, works in a sandboxed cloud environment, and opens a draft PR.",
      "toolB": "Cascade agent reads the codebase, plans, edits multiple files, and runs terminal commands directly in the live editor session.",
      "whyItMatters": "Affects whether agent work happens asynchronously via PR review or interactively in real time.",
      "benefitsWho": "Copilot suits async, PR-based review culture; Windsurf suits developers who want to watch and steer agent work live."
    },
    {
      "title": "Change review workflow",
      "toolA": "Automated review comments on pull requests via Copilot code review, following standard Git PR review.",
      "toolB": "Every Cascade edit is staged as an in-editor diff with per-step approval before it's written to disk.",
      "whyItMatters": "Determines where and how a developer catches AI mistakes before they land.",
      "benefitsWho": "Copilot benefits teams with established PR review processes; Windsurf benefits developers who want inline, immediate control."
    },
    {
      "title": "IDE and platform breadth",
      "toolA": "Works in Visual Studio Code, Visual Studio, JetBrains IDEs, Neovim, and directly on GitHub.com.",
      "toolB": "Available as a single VS Code-based editor, preserving familiar keybindings, themes, and extensions.",
      "whyItMatters": "Broad support avoids forcing a team to standardize on one editor; a single editor offers a more unified, purpose-built experience.",
      "benefitsWho": "Copilot benefits teams with mixed editor preferences; Windsurf benefits developers willing to consolidate into one editor."
    },
    {
      "title": "Entry-level paid pricing",
      "toolA": "Copilot Pro is $10 per month (or $100 per year), with unlimited completions and coding agent access.",
      "toolB": "Windsurf Pro is $20 per month for higher Cascade quotas and premium model access, though the free tier includes unlimited autocomplete.",
      "whyItMatters": "Sets the baseline cost of moving past the free tier for individual developers.",
      "benefitsWho": "Cost-sensitive individual developers lean toward Copilot Pro's lower entry price."
    },
    {
      "title": "AI model selection",
      "toolA": "Offers a choice of OpenAI GPT models, Anthropic Claude models, and Google Gemini models depending on plan and surface.",
      "toolB": "Offers Anthropic Claude, OpenAI GPT models, and Windsurf's own in-house SWE coding model.",
      "whyItMatters": "Model choice affects cost, speed, and output quality trade-offs for different tasks.",
      "benefitsWho": "Teams wanting the widest frontier-model menu lean toward Copilot; teams wanting a coding-tuned in-house model option lean toward Windsurf."
    },
    {
      "title": "Offline / air-gapped deployment",
      "toolA": "No fully offline or air-gapped deployment option for the mainstream product.",
      "toolB": "Offers self-hosted and air-gapped deployment options carried over from its Codeium enterprise roots.",
      "whyItMatters": "Security-restricted environments (government, regulated industries) often require on-premises or air-gapped operation.",
      "benefitsWho": "Highly regulated or security-restricted organizations benefit from Windsurf's deployment flexibility."
    },
    {
      "title": "Company and product stability",
      "toolA": "Built and maintained by GitHub since 2021 with a consistent product identity.",
      "toolB": "Acquired by Cognition and rebranded to Devin Desktop in June 2026, following a history of pricing model changes.",
      "whyItMatters": "Ongoing rebrands and pricing shifts create migration overhead and roadmap uncertainty for buyers planning long-term adoption.",
      "benefitsWho": "Risk-averse organizations planning multi-year tooling commitments lean toward Copilot's stability."
    },
    {
      "title": "Native GitHub workflow integration",
      "toolA": "Deep hooks into GitHub issues and pull requests via the coding agent and automated code review.",
      "toolB": "Integrations with tools like Slack, Linear, Figma, and language servers, without being natively tied to a single hosting platform.",
      "whyItMatters": "Teams whose workflow is centered on GitHub issues and PRs get more automation with tighter platform integration.",
      "benefitsWho": "GitHub-centric engineering teams benefit most from Copilot's native workflow hooks."
    },
    {
      "title": "Model Context Protocol (MCP) support",
      "toolA": "Not documented as a supported feature in the provided facts.",
      "toolB": "Documented native support for connecting external tools, servers, and data sources into Cascade's context.",
      "whyItMatters": "MCP support lets an agent reach into internal systems and data beyond the codebase itself.",
      "benefitsWho": "Teams wanting to connect internal tools and data sources directly into their AI agent's context benefit from Windsurf's MCP support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Code Assistance",
      "rows": [
        {
          "feature": "Inline code completions",
          "toolA": "available",
          "toolB": "available",
          "note": "Windsurf's autocomplete remains unlimited even on the free tier."
        },
        {
          "feature": "Conversational chat assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "Windsurf's conversational interaction is folded into the Cascade agent pane rather than offered as a separate chat feature."
        },
        {
          "feature": "Custom/repo-level instructions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copilot supports repository-level and personal custom instructions."
        }
      ]
    },
    {
      "group": "Autonomous Agent Capabilities",
      "rows": [
        {
          "feature": "Multi-file autonomous code edits",
          "toolA": "limited",
          "toolB": "available",
          "note": "Copilot's coding agent works from a GitHub issue in a sandboxed cloud environment; Cascade edits multiple files live in the editor."
        },
        {
          "feature": "Terminal command execution by agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Copilot in the CLI explains/suggests commands but isn't documented as autonomously executing them."
        },
        {
          "feature": "Reviewable diff staging before edits apply",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Cascade stages every edit as a diff with per-step approval."
        },
        {
          "feature": "Autonomous PR creation from an issue",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copilot coding agent opens a draft PR after being assigned an issue."
        }
      ]
    },
    {
      "group": "Editor / IDE Platform",
      "rows": [
        {
          "feature": "Multi-IDE support (VS Code, Visual Studio, JetBrains, Neovim)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Windsurf is a single VS Code-based editor, not a plugin across multiple IDEs."
        },
        {
          "feature": "Standalone AI-native editor",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Copilot operates as an extension within existing editors rather than as its own editor."
        },
        {
          "feature": "Works directly on GitHub.com",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Model Selection",
      "rows": [
        {
          "feature": "Choice of multiple frontier model providers",
          "toolA": "available",
          "toolB": "available",
          "note": "Copilot: GPT, Claude, Gemini. Windsurf: Claude, GPT."
        },
        {
          "feature": "In-house/proprietary coding model option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Windsurf offers its own in-house SWE coding model."
        }
      ]
    },
    {
      "group": "Code Quality & Review",
      "rows": [
        {
          "feature": "Automated pull request review comments",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copilot code review flags bugs, style issues, and edge cases on PRs."
        },
        {
          "feature": "Public code match / licensing risk filter",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Enterprise & Deployment",
      "rows": [
        {
          "feature": "Self-hosted or air-gapped deployment",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Windsurf's Enterprise tier carries this over from its Codeium enterprise roots."
        },
        {
          "feature": "IP indemnification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included in Copilot Enterprise."
        },
        {
          "feature": "SSO and organization-wide admin controls",
          "toolA": "available",
          "toolB": "available",
          "note": "Copilot Business/Enterprise policy controls; Windsurf Enterprise SSO and admin controls."
        }
      ]
    },
    {
      "group": "Integrations & Extensibility",
      "rows": [
        {
          "feature": "Model Context Protocol (MCP) support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Third-party tool integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Copilot Extensions vs. Windsurf integrations with Slack, Linear, Figma, and language servers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, GitHub Copilot or Windsurf?",
      "answer": "GitHub Copilot's entry paid tier is cheaper at $10 per month (Copilot Pro) versus Windsurf's $20 per month (Pro plan), though both tools also offer a free tier with usage limits."
    },
    {
      "question": "Is Windsurf still called Windsurf?",
      "answer": "As of June 2026, Cognition rebranded the Windsurf editor as Devin Desktop, though existing Windsurf accounts, plans, and settings carried over automatically and Legacy Windsurf Enterprise customers still log in via windsurf.com/enterprise."
    },
    {
      "question": "Can GitHub Copilot do what Windsurf's Cascade agent does?",
      "answer": "Only partially: Copilot's coding agent can take a GitHub issue and open a draft pull request from a sandboxed cloud environment, but it isn't documented as editing multiple files live in the editor or running terminal commands the way Windsurf's Cascade agent does with reviewable diffs."
    },
    {
      "question": "Does either tool support self-hosted or offline deployment?",
      "answer": "Windsurf offers self-hosted and air-gapped deployment options through its Enterprise tier, while GitHub Copilot has no documented fully offline or air-gapped deployment option for its mainstream product."
    },
    {
      "question": "Which tool is easier to adopt for a team already using GitHub?",
      "answer": "GitHub Copilot is generally easier for GitHub-centric teams since it works directly on GitHub.com and integrates natively with GitHub issues and pull requests, whereas Windsurf requires switching to its own VS Code-based editor."
    },
    {
      "question": "Does either tool support the Model Context Protocol (MCP)?",
      "answer": "Windsurf documents native MCP support for connecting external tools, servers, and data sources into Cascade's context, while GitHub Copilot's provided facts do not document MCP support."
    }
  ]
};

export default githubCopilotVsWindsurfContent;
