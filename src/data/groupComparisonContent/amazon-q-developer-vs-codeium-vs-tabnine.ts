import type { GroupComparisonContent } from './types';

const amazonQDeveloperVsCodeiumVsTabnineContent: GroupComparisonContent = {
  "verdict": "All three add AI-generated code suggestions and agentic task automation to a developer's editor, but they target different priorities. Amazon Q Developer is strongest for teams already committed to AWS, including legacy application modernization. Codeium (now rebranded to Devin Desktop under Cognition AI) offers the most generous free tier and an open, standalone editor that can run third-party agents. Tabnine leads on enterprise privacy, with zero data retention and on-premises or air-gapped deployment, but it no longer offers a free individual plan.",
  "bestFor": {
    "amazon-q-developer": "Engineering teams already building on AWS who want AI coding help integrated into the AWS console plus legacy .NET and Java modernization support.",
    "codeium": "Developers who want a generous free autocomplete tier and an open, standalone AI-native editor capable of running multiple third-party agents like Codex, Claude Agent, and Gemini CLI.",
    "tabnine": "Regulated enterprises in finance, healthcare, or government that require zero code retention and on-premises or air-gapped deployment for AI coding assistance."
  },
  "highlights": [
    {
      "title": "Deepest AWS ecosystem integration",
      "description": "Amazon Q Developer is unique among the three in offering application transformation for porting .NET applications and upgrading Java versions, plus native integration with the AWS Management Console.",
      "toolSlugs": [
        "amazon-q-developer"
      ]
    },
    {
      "title": "Most generous free tier, but a confusing brand history",
      "description": "Codeium offers unlimited basic autocomplete for free across 70+ languages, but the product has been renamed twice in under two years, from Codeium to Windsurf to Devin Desktop under new owner Cognition AI, which can make it harder to evaluate consistently across reviews.",
      "toolSlugs": [
        "codeium"
      ]
    },
    {
      "title": "Built for regulated, privacy-sensitive environments",
      "description": "Tabnine is the only one of the three documented to offer zero data retention plus SaaS, virtual private cloud, on-premises, and fully air-gapped deployment options, at the cost of dropping its free individual tier in 2025.",
      "toolSlugs": [
        "tabnine"
      ]
    },
    {
      "title": "All three now ship agentic, not just autocomplete, capabilities",
      "description": "Amazon Q Developer's agentic tasks, Codeium's Devin Local agent mode, and Tabnine's Agentic Platform tier all move beyond simple code completion into autonomous multi-step coding work.",
      "toolSlugs": [
        "amazon-q-developer",
        "codeium",
        "tabnine"
      ]
    },
    {
      "title": "Open agent interoperability",
      "description": "Codeium supports the open Agent Client Protocol, letting third-party agents run inside its editor, while Tabnine connects to external tools and data sources through Model Context Protocol integrations.",
      "toolSlugs": [
        "codeium",
        "tabnine"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Getting Started",
      "rows": [
        {
          "feature": "Free tier available",
          "statuses": {
            "amazon-q-developer": "available",
            "codeium": "available",
            "tabnine": "unavailable"
          },
          "note": "Tabnine retired its free individual tier in 2025 and now requires a paid annual plan."
        },
        {
          "feature": "Standalone AI-native editor (not just a plugin)",
          "statuses": {
            "amazon-q-developer": "unavailable",
            "codeium": "available",
            "tabnine": "not-documented"
          },
          "note": "Codeium ships as a full standalone desktop app (Devin Desktop) in addition to editor plugins; Amazon Q Developer and Tabnine are documented as plugins and CLI integrations."
        }
      ]
    },
    {
      "group": "Agentic Capabilities",
      "rows": [
        {
          "feature": "Autonomous multi-step coding agent",
          "statuses": {
            "amazon-q-developer": "available",
            "codeium": "available",
            "tabnine": "available"
          }
        },
        {
          "feature": "Third-party or open-protocol agent interoperability",
          "statuses": {
            "amazon-q-developer": "not-documented",
            "codeium": "available",
            "tabnine": "available"
          },
          "note": "Codeium supports the Agent Client Protocol; Tabnine supports Model Context Protocol tool integrations."
        }
      ]
    },
    {
      "group": "Enterprise and Security",
      "rows": [
        {
          "feature": "On-premises or air-gapped deployment",
          "statuses": {
            "amazon-q-developer": "not-documented",
            "codeium": "not-documented",
            "tabnine": "available"
          }
        },
        {
          "feature": "Zero data retention / privacy guarantee",
          "statuses": {
            "amazon-q-developer": "not-documented",
            "codeium": "not-documented",
            "tabnine": "available"
          }
        }
      ]
    },
    {
      "group": "Specialized Tooling",
      "rows": [
        {
          "feature": "Security vulnerability scanning",
          "statuses": {
            "amazon-q-developer": "available",
            "codeium": "not-documented",
            "tabnine": "not-documented"
          }
        },
        {
          "feature": "Legacy application modernization (.NET / Java transformation)",
          "statuses": {
            "amazon-q-developer": "available",
            "codeium": "not-documented",
            "tabnine": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a free plan?",
      "answer": "Amazon Q Developer and Codeium both offer free tiers, Amazon Q Developer with 50 agentic chat interactions per month and Codeium with unlimited basic autocomplete. Tabnine dropped its free individual tier in 2025 and now starts at $39/user/month."
    },
    {
      "question": "Which is the best choice if my team is deep in the AWS ecosystem?",
      "answer": "Amazon Q Developer, since it integrates directly with the AWS Management Console and offers application transformation features like .NET porting and Java version upgrades that the other two do not document."
    },
    {
      "question": "Can I run any of these fully offline or air-gapped?",
      "answer": "Only Tabnine documents on-premises and fully air-gapped deployment options, aimed at regulated industries like finance, healthcare, and government."
    },
    {
      "question": "Which tool lets me run other vendors' coding agents inside it?",
      "answer": "Codeium, through its support for the open Agent Client Protocol, which lets third-party agents such as Codex, Claude Agent, and Gemini CLI run inside its editor rather than locking users to one vendor's agent."
    },
    {
      "question": "Is Codeium still called Codeium?",
      "answer": "Not exactly. The product launched as Codeium in 2021, was rebranded to Windsurf in 2024, and was renamed again to Devin Desktop after Cognition AI acquired it in December 2025. Existing accounts, plans, and settings carried over automatically through each rename."
    },
    {
      "question": "Which is the most expensive on a per-seat basis?",
      "answer": "Among listed per-seat team pricing, Tabnine's Agentic Platform tier at $59/user/month is the highest base per-seat price, compared to Amazon Q Developer's Pro tier at $19/user/month and Codeium's Teams plan at $80/month plus $40 per seat."
    }
  ]
};

export default amazonQDeveloperVsCodeiumVsTabnineContent;
