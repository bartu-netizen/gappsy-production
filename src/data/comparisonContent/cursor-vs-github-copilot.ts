import type { ToolComparisonContent } from './types';

const cursorVsGithubCopilotContent: ToolComparisonContent = {
  "verdict": "Cursor and GitHub Copilot solve overlapping but distinct problems. Cursor is a standalone AI-native editor built by forking VS Code, designed for developers who want AI woven directly into every layer of the coding surface: predictive multi-line Tab completions, a semantic codebase index, Cmd+K inline edits, and a Composer/Agent mode that can plan, edit multiple files, run terminal commands, and self-correct on errors. Its Bugbot then extends that agentic approach to pull request review, proposing fixes directly on PRs. GitHub Copilot, by contrast, is an AI pair-programming layer that plugs into the IDEs teams already use -- VS Code, Visual Studio, the JetBrains family, Neovim, and GitHub.com itself -- plus the command line. Its coding agent takes a different agentic path: assign it a GitHub issue and it works in a sandboxed environment to produce a draft pull request, tying automation tightly to GitHub's existing issue-and-PR workflow. Pricing reflects these different bets: Copilot Pro starts at $10 per month versus Cursor Pro's $20, though Cursor's Hobby tier and Copilot's Free tier both let developers try core features before paying. Neither tool is objectively superior; the right choice depends on whether a team wants to adopt a new editor for deeper, more autonomous in-editor AI work, or wants to add AI capabilities on top of the IDEs and GitHub workflow it already runs, at a lower entry price and with broader platform reach.",
  "bestForToolA": "Developers willing to switch editors for the deepest possible in-editor AI experience, especially those who want autonomous multi-file Agent mode, terminal-integrated actions, and a semantic codebase index alongside Tab autocomplete.",
  "bestForToolB": "Teams already standardized on GitHub who want AI assistance inside their existing IDE (VS Code, Visual Studio, JetBrains, Neovim) without switching editors, plus issue-to-pull-request automation and a lower $10/month entry price.",
  "whoNeedsBoth": "A GitHub-centric engineering team that uses Cursor for deep, autonomous in-editor coding and agentic multi-file work, while keeping Copilot active for its native GitHub issue-to-PR automation, code review comments, and coverage across IDEs (like JetBrains or Visual Studio) where Cursor isn't used.",
  "keyDifferences": [
    {
      "title": "Product form factor",
      "toolA": "A standalone AI-native editor built as a fork of VS Code",
      "toolB": "An AI layer added on top of existing IDEs (VS Code, Visual Studio, JetBrains, Neovim) and GitHub.com",
      "whyItMatters": "One requires adopting a new editor; the other adds AI to tools a team already uses",
      "benefitsWho": "Cursor benefits developers open to switching editors for a deeper AI experience; Copilot benefits teams that want to keep their current IDE"
    },
    {
      "title": "Entry-level price",
      "toolA": "Pro plan starts at $20/month",
      "toolB": "Pro plan starts at $10/month (or $100/year)",
      "whyItMatters": "Entry price affects individual developers and small teams evaluating cost against value",
      "benefitsWho": "Budget-conscious individual developers lean toward Copilot's lower starting price"
    },
    {
      "title": "Free tier scope",
      "toolA": "Free Hobby plan with limited Agent requests, limited Tab completions, and a short Pro trial",
      "toolB": "Free tier with limited monthly code completions and limited chat/agent requests, single model choice",
      "whyItMatters": "Determines how much a developer can evaluate the product before paying",
      "benefitsWho": "Both serve trial users similarly, but exact usage caps differ by product"
    },
    {
      "title": "Autonomous agent workflow",
      "toolA": "Composer/Agent mode plans changes, edits multiple files, runs terminal commands, and iterates on errors; a separate Background agent runs longer tasks outside the main session",
      "toolB": "Copilot coding agent takes an assigned GitHub issue, works in a sandboxed environment, and opens a draft pull request",
      "whyItMatters": "The two tools automate different points in the development lifecycle: general coding tasks versus issue-driven PR creation",
      "benefitsWho": "Cursor suits developers who want an agent working alongside them mid-task; Copilot suits teams that manage work through GitHub issues"
    },
    {
      "title": "IDE and editor breadth",
      "toolA": "Only VS Code (as a fork), though most VS Code extensions, themes, and keybindings carry over",
      "toolB": "Works natively inside VS Code, Visual Studio, the JetBrains lineup, Neovim, and GitHub.com itself",
      "whyItMatters": "Organizations with mixed IDE usage need a tool that covers all the editors their developers already use",
      "benefitsWho": "Copilot benefits organizations with diverse IDE preferences; Cursor benefits VS Code-standardized teams"
    },
    {
      "title": "Pull request review depth",
      "toolA": "Bugbot automatically reviews PRs for likely bugs and can propose fixes directly on the PR",
      "toolB": "Copilot's code review posts automated comments that call out likely bugs, inconsistent style, and edge cases the author may have missed",
      "whyItMatters": "Whether the tool only flags issues or also proposes concrete fixes changes how much manual work remains",
      "benefitsWho": "Teams wanting fix suggestions, not just flags, get more from Bugbot as documented"
    },
    {
      "title": "Model transparency",
      "toolA": "Lets users choose among several unnamed frontier AI models",
      "toolB": "Names its supported models outright: GPT from OpenAI, Claude from Anthropic, and Gemini from Google, with availability varying by plan and surface",
      "whyItMatters": "Some buyers want to know exactly which model families are available before committing",
      "benefitsWho": "Teams with model-specific preferences or compliance needs benefit from Copilot's named model list"
    },
    {
      "title": "Company origin and backing",
      "toolA": "Built by Anysphere, founded in 2022, San Francisco",
      "toolB": "Built by GitHub in partnership with OpenAI, founded in 2021, San Francisco",
      "whyItMatters": "Company maturity and ecosystem ties can affect roadmap stability and integration depth",
      "benefitsWho": "Teams already deep in the GitHub/Microsoft ecosystem may value Copilot's native GitHub ownership"
    },
    {
      "title": "Team and enterprise pricing structure",
      "toolA": "Teams plan at $40/user/month; custom Enterprise pricing",
      "toolB": "Business plan at $19/user/month; Enterprise plan at $39/user/month",
      "whyItMatters": "Per-seat costs scale differently for larger organizations budgeting for company-wide rollout",
      "benefitsWho": "Cost-sensitive larger teams may find Copilot's published Business/Enterprise tiers cheaper per seat than Cursor's Teams tier"
    },
    {
      "title": "Third-party ecosystem extensibility",
      "toolA": "Not documented as offering a marketplace for connecting external developer tools into chat",
      "toolB": "Copilot Extensions connect third-party developer tools and services directly into the chat interface, plus an optional public-code reference filter for license-risk management",
      "whyItMatters": "Extensibility affects how well the tool fits into a broader toolchain beyond the editor itself",
      "benefitsWho": "Teams wanting a unified chat interface across multiple tools benefit from Copilot's Extensions"
    }
  ],
  "featureMatrix": [
    {
      "group": "Editor and Platform Integration",
      "rows": [
        {
          "feature": "Standalone AI-native editor",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Copilot is an add-on to existing IDEs, not a standalone editor"
        },
        {
          "feature": "Support across multiple IDEs (Visual Studio, JetBrains, Neovim)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Cursor's documented compatibility is VS Code only"
        },
        {
          "feature": "Import existing VS Code extensions, themes, keybindings",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Autocomplete and Inline Editing",
      "rows": [
        {
          "feature": "Multi-line predictive code completion",
          "toolA": "available",
          "toolB": "available",
          "note": "Cursor's Tab predicts the next edit; Copilot's inline completions use file, tabs, and repo context"
        },
        {
          "feature": "Inline edit via natural-language instruction on selected code",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cursor's Cmd+K; no equivalent stated for Copilot"
        }
      ]
    },
    {
      "group": "Agentic and Autonomous Features",
      "rows": [
        {
          "feature": "Multi-file autonomous agent for general coding tasks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cursor's Composer/Agent mode; Copilot's agent is issue-driven, not general-purpose"
        },
        {
          "feature": "Agent that opens a pull request from a GitHub issue",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Agent can execute and observe terminal commands",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pull Request and Code Review Automation",
      "rows": [
        {
          "feature": "Automated PR review flagging likely bugs",
          "toolA": "available",
          "toolB": "available",
          "note": "Bugbot and Copilot code review, respectively"
        },
        {
          "feature": "Automatically proposes fixes directly on the PR",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Copilot code review is described as flagging issues, not proposing fixes"
        },
        {
          "feature": "Runs longer/background agent tasks outside the main session",
          "toolA": "available",
          "toolB": "available",
          "note": "Cursor's Background agent; Copilot coding agent runs in a sandboxed environment"
        }
      ]
    },
    {
      "group": "AI Model Choice",
      "rows": [
        {
          "feature": "Choice among multiple underlying AI models",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Specific named models disclosed (e.g., GPT, Claude, Gemini)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Cursor's facts reference 'frontier models' without naming providers"
        }
      ]
    },
    {
      "group": "Codebase Understanding and Chat",
      "rows": [
        {
          "feature": "Semantic index of the codebase for chat/search",
          "toolA": "available",
          "toolB": "limited",
          "note": "Copilot FAQ states indexed private repositories are available on paid plans"
        },
        {
          "feature": "In-editor chat grounded in project context",
          "toolA": "available",
          "toolB": "available",
          "note": "Cursor's Chat vs. Copilot Chat"
        }
      ]
    },
    {
      "group": "CLI and Ecosystem Extensions",
      "rows": [
        {
          "feature": "Command-line suggestions and explanations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Copilot in the CLI"
        },
        {
          "feature": "Connects third-party developer tools into chat",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Copilot Extensions"
        },
        {
          "feature": "Filter for suggestions matching public code (license-risk management)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Public code reference filter"
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free tier available",
          "toolA": "available",
          "toolB": "available",
          "note": "Cursor Hobby vs. Copilot Free"
        },
        {
          "feature": "Entry-level individual paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "$20/month Cursor Pro vs. $10/month Copilot Pro"
        },
        {
          "feature": "Custom Enterprise pricing with admin/security controls",
          "toolA": "available",
          "toolB": "available",
          "note": "Cursor Enterprise (custom quote) vs. Copilot Enterprise ($39/user/month)"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Cursor or GitHub Copilot?",
      "answer": "GitHub Copilot's entry-level Pro plan is cheaper at $10 per month versus Cursor Pro at $20 per month, and both tools also offer a free tier (Cursor's Hobby plan and Copilot Free) for trying core features before paying."
    },
    {
      "question": "Can GitHub Copilot open pull requests the way Cursor's Bugbot does?",
      "answer": "They operate at different points in the workflow: Copilot's coding agent can take an assigned GitHub issue and open a draft pull request on its own, while Cursor's Bugbot reviews existing pull requests for likely bugs and can propose fixes directly on them rather than opening new PRs from issues."
    },
    {
      "question": "Does Cursor work in JetBrains or Visual Studio like GitHub Copilot does?",
      "answer": "Not according to documented facts: Cursor is built as a fork of VS Code and is described as compatible with VS Code extensions, themes, and keybindings, with no stated support for JetBrains IDEs, Visual Studio, or Neovim, whereas GitHub Copilot documents support across all of those plus GitHub.com."
    },
    {
      "question": "Which AI models can I use in each tool?",
      "answer": "GitHub Copilot is explicit about which model families it supports: OpenAI's GPT line, Anthropic's Claude, and Google's Gemini, with actual availability depending on plan and surface, whereas Cursor confirms access to multiple frontier AI models without disclosing exactly which providers back them."
    },
    {
      "question": "Is Cursor or GitHub Copilot better for a team that lives inside GitHub issues and pull requests?",
      "answer": "GitHub Copilot is more tightly built around that workflow, since its coding agent can be assigned a GitHub issue directly and open a draft pull request, and its code review feature comments on PRs natively, whereas Cursor's agentic features (Composer, Background agent, Bugbot) are not documented as being triggered directly from GitHub issues."
    },
    {
      "question": "Is my code sent to the cloud with either tool?",
      "answer": "Yes, both send code through cloud-hosted AI models: Cursor provides privacy-focused settings meant to limit how long code is retained, while Copilot routes code and prompts through GitHub's cloud infrastructure and, according to its documented cons, offers no offline or air-gapped deployment for its mainstream product -- a gap that can disqualify it in the most security-restricted environments."
    }
  ]
};

export default cursorVsGithubCopilotContent;
