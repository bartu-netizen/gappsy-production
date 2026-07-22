import type { ToolComparisonContent } from './types';

const bumpShVsFernContent: ToolComparisonContent = {
  "verdict": "Bump.sh focuses on API lifecycle management — automatic breaking-change detection, PR-level spec diffs, and usage analytics — layered on documentation hosting, while Fern emphasizes SDK generation across four spec formats plus a git-based docs workflow. Fern offers a permanent free tier; Bump.sh does not.",
  "bestForToolA": "Bump.sh suits API teams that need automatic breaking-change detection and PR-level spec diffs as part of their release process, starting at $50/month for the Basic plan (10 API docs, 5 MCP tools).",
  "bestForToolB": "Fern suits teams that need both documentation and SDK generation in one platform, with a free-forever Hobby plan for small teams (2 members, 250 AI credits per month).",
  "whoNeedsBoth": "An API-first company could use Fern to publish docs and generate customer-facing SDKs while relying on Bump.sh's breaking-change detection and PR diff previews to catch spec regressions before merge, since Fern's documented features don't include automated breaking-change alerts.",
  "keyDifferences": [
    {
      "title": "Free Tier Availability",
      "toolA": "Bump.sh has no permanent free plan — only a 14-day free trial on Pro, plus free access for qualifying open-source projects.",
      "toolB": "Fern offers a permanent free Hobby plan ($0/month) for 2 team members with 250 AI credits/month.",
      "whyItMatters": "A permanent free tier lets small teams and side projects adopt a tool without any spend commitment.",
      "benefitsWho": "Solo developers and small open-source maintainers benefit from Fern's free-forever tier."
    },
    {
      "title": "Breaking-Change Detection",
      "toolA": "Bump.sh automatically flags breaking changes and shows spec diffs and live previews on every pull request.",
      "toolB": "Fern's documented feature list does not include automated breaking-change detection.",
      "whyItMatters": "Catching breaking API changes before they ship prevents downstream integration failures for API consumers.",
      "benefitsWho": "Platform and API teams with strict backward-compatibility requirements benefit from Bump.sh's detection."
    },
    {
      "title": "SDK Generation",
      "toolA": "Bump.sh's documented features do not mention SDK generation.",
      "toolB": "Fern generates SDKs from OpenAPI, GraphQL, AsyncAPI, and gRPC specs.",
      "whyItMatters": "API providers that ship client libraries to developers need generation built into their platform.",
      "benefitsWho": "Teams distributing SDKs to external developers benefit from Fern's generation capability."
    },
    {
      "title": "Entry Pricing",
      "toolA": "Bump.sh's Basic plan starts at $50/month for 10 API docs, 5 MCP tools, and 20 external users.",
      "toolB": "Fern's Team plan starts at $150/month ($112.50/month billed annually) for 5 members and 1,000 AI credits.",
      "whyItMatters": "Entry price affects which tool small teams can afford to adopt without going through a free tier.",
      "benefitsWho": "Budget-constrained teams needing paid features immediately benefit from Bump.sh's lower entry price."
    },
    {
      "title": "Usage Analytics",
      "toolA": "Bump.sh includes Usage Analytics showing logs, debug sessions, and reports on how developers and agents use the API.",
      "toolB": "Fern's documented features do not include a comparable usage analytics capability.",
      "whyItMatters": "Understanding how an API is actually consumed helps prioritize documentation and deprecation decisions.",
      "benefitsWho": "API product managers tracking developer adoption benefit from Bump.sh's usage analytics."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Spec Management",
      "rows": [
        {
          "feature": "Breaking change detection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "PR diff / live preview",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Spec format support",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh: OpenAPI/AsyncAPI/Arazzo; Fern: OpenAPI/GraphQL/AsyncAPI/gRPC"
        },
        {
          "feature": "SDK generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Usage analytics",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Automatic changelog on release",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bump.sh Pro plan and above"
        }
      ]
    },
    {
      "group": "AI & MCP",
      "rows": [
        {
          "feature": "MCP server deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh: managed or on-premise"
        },
        {
          "feature": "AI chat for doc readers",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "llms.txt generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI credits included free",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fern Hobby: 250/month"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Bump.sh: trial/OSS exception only"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Bump.sh Basic $50/month; Fern Team $150/month ($112.50 annual)"
        },
        {
          "feature": "Custom/Enterprise plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Open-source project discount",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bump.sh: free Pro access for OSS projects"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Bump.sh have a free plan?",
      "answer": "No permanent free plan is documented. Bump.sh offers a 14-day free trial on its Pro plan, and open-source projects can request free access to Pro."
    },
    {
      "question": "Does Fern detect breaking API changes automatically?",
      "answer": "This is not documented among Fern's features. Bump.sh explicitly automates breaking-change detection with diffs and previews on pull requests."
    },
    {
      "question": "Which is cheaper to start, Bump.sh or Fern?",
      "answer": "Bump.sh's Basic plan starts at $50/month with no permanent free tier. Fern has a free-forever Hobby plan, with paid Team pricing starting at $150/month ($112.50/month billed annually)."
    },
    {
      "question": "Do both tools generate MCP servers?",
      "answer": "Yes, both document MCP server capability — Bump.sh deploys managed or on-premise MCP servers from specs, and Fern exposes documentation and APIs through an MCP server."
    },
    {
      "question": "Does Fern generate SDKs and does Bump.sh?",
      "answer": "Fern generates SDKs from OpenAPI, GraphQL, AsyncAPI, and gRPC specs. SDK generation is not documented among Bump.sh's features."
    },
    {
      "question": "Can open-source projects get free access to either tool?",
      "answer": "Bump.sh states open-source projects can request free access to its Pro plan. Fern already offers a free-forever Hobby plan available to any team, including open-source projects."
    }
  ]
};

export default bumpShVsFernContent;
