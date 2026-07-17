import type { ToolComparisonContent } from './types';

const hoppscotchVsPostmanContent: ToolComparisonContent = {
  "verdict": "Hoppscotch and Postman both call themselves API development tools, but the documented feature sets point to different jobs. Hoppscotch is built around three things: multi-protocol testing across REST, GraphQL, WebSocket, and SSE, the ability to self-host instead of relying on a hosted cloud, and real-time collaboration on collections. Its pricing model is freemium with no published starting price or plan tiers, which fits a lightweight, community-driven tool. Postman is documented as a much broader platform spanning request building, collections, environments, scripted test automation with Newman for CI/CD, mock servers, monitoring, auto-generated documentation, API governance, an AI assistant, and team workspaces, backed by a company founded in 2014 with clear tiered pricing from a free plan up to custom Enterprise deals. If the job is quick, protocol-flexible request testing with control over hosting, Hoppscotch fits. If the job is running an API program across a team, with automated pipelines, mock servers, monitoring, and governance, Postman is the documented fit. Neither dataset shows one tool as a strict superset of the other, so the right choice depends on whether you need lifecycle depth or a lighter, self-hostable alternative.",
  "bestForToolA": "Hoppscotch fits developers and small teams who want a free or self-hostable tool for testing REST, GraphQL, WebSocket, and SSE requests without committing to a heavier platform.",
  "bestForToolB": "Postman fits teams that need the full API lifecycle in one place: request building, automated testing in CI/CD, mock servers, monitoring, documentation, and governance, typically at growing or enterprise scale.",
  "whoNeedsBoth": "A developer might prototype and test quick requests in Hoppscotch for its speed and protocol flexibility, then rely on Postman when the same API needs team-wide collections, automated CI/CD test runs, mock servers, or monitoring.",
  "keyDifferences": [
    {
      "title": "Open source versus proprietary platform",
      "toolA": "Hoppscotch is open source and can be self-hosted instead of using the hosted cloud version.",
      "toolB": "Postman is a proprietary platform with a documented desktop app; no self-hosting option is documented.",
      "whyItMatters": "Self-hosting affects data control, licensing cost, and whether a team can run the tool entirely on its own infrastructure.",
      "benefitsWho": "Teams with data residency or budget constraints benefit from Hoppscotch; teams wanting a managed, supported product benefit from Postman."
    },
    {
      "title": "Protocol coverage",
      "toolA": "Documented support for REST, GraphQL, WebSocket, and SSE testing in one interface.",
      "toolB": "Documented support for REST, GraphQL, SOAP, and gRPC through its Request Builder.",
      "whyItMatters": "Teams working with real-time protocols need WebSocket and SSE support, while teams with legacy or microservice architectures need SOAP and gRPC support.",
      "benefitsWho": "Real-time app developers benefit from Hoppscotch; teams integrating SOAP or gRPC services benefit from Postman."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Freemium with no published starting price or documented pricing plans.",
      "toolB": "Freemium with a documented $0 Free plan and paid tiers from about $14 per user per month up to custom Enterprise pricing.",
      "whyItMatters": "Buyers comparing total cost of ownership need clear plan structures to budget for team growth.",
      "benefitsWho": "Cost-conscious individuals or self-hosters benefit from Hoppscotch; teams that want predictable per-seat pricing benefit from Postman."
    },
    {
      "title": "Breadth of documented features",
      "toolA": "Three highlighted features: multi-protocol testing, self-hosting, and real-time collaboration.",
      "toolB": "Ten documented features spanning request building, collections, environments, testing, mocking, monitoring, documentation, governance, AI assistance, and workspaces.",
      "whyItMatters": "Teams managing an entire API lifecycle need more surface area than a focused testing client.",
      "benefitsWho": "Solo developers or small teams benefit from a lighter tool like Hoppscotch; larger teams benefit from Postman full lifecycle coverage."
    },
    {
      "title": "Test automation and CI/CD",
      "toolA": "Not documented as offering scripted test automation or a command-line test runner.",
      "toolB": "JavaScript-based assertions run through the Collection Runner or the Newman CLI inside CI/CD pipelines.",
      "whyItMatters": "Automated regression testing in a pipeline prevents API breakages from reaching production.",
      "benefitsWho": "QA and engineering teams building CI/CD pipelines benefit from Postman documented automation tooling."
    },
    {
      "title": "Mock servers and monitoring",
      "toolA": "Not documented as offering mock servers or scheduled monitoring.",
      "toolB": "Documented mock servers for simulating responses before a backend exists, plus scheduled monitoring with failure and downtime alerts.",
      "whyItMatters": "These features let frontend and backend teams work in parallel and catch API regressions before customers notice.",
      "benefitsWho": "Teams doing parallel frontend and backend development, and ops teams needing uptime alerts, benefit from Postman."
    },
    {
      "title": "AI assistance",
      "toolA": "Not documented as offering an AI assistant.",
      "toolB": "Documented AI Assistant that generates test scripts, documentation, and debugging suggestions.",
      "whyItMatters": "Built-in AI can cut down the manual effort of writing tests and docs by hand.",
      "benefitsWho": "Teams wanting to speed up repetitive test and documentation work benefit from Postman AI Assistant."
    },
    {
      "title": "Enterprise governance",
      "toolA": "Not documented as offering API design governance or spec linting.",
      "toolB": "Documented Enterprise plan with API design governance, OpenAPI spec linting, and admin controls.",
      "whyItMatters": "Consistent API design standards matter more as the number of teams and APIs in an organization grows.",
      "benefitsWho": "Large organizations managing many APIs across teams benefit from Postman governance tooling."
    },
    {
      "title": "Company background",
      "toolA": "Founded year and headquarters are not documented.",
      "toolB": "Founded in 2014 and headquartered in San Francisco, California.",
      "whyItMatters": "Vendor maturity and location can factor into enterprise procurement and vendor due diligence.",
      "benefitsWho": "Buyers doing formal vendor evaluations benefit from Postman documented company background."
    },
    {
      "title": "Learning curve and everyday weight",
      "toolA": "No documented cons; positioned around a focused, lighter feature set.",
      "toolB": "Documented cons include a learning curve for advanced scripting, governance, and monitoring, plus feeling heavy for occasional simple API calls.",
      "whyItMatters": "Tool weight affects onboarding time and whether the tool fits casual versus power-user workflows.",
      "benefitsWho": "Developers making occasional simple requests may prefer Hoppscotch; power users needing depth accept Postman learning curve for the added capability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Protocol Support",
      "rows": [
        {
          "feature": "REST request testing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "GraphQL request testing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "WebSocket and SSE testing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Postman documented protocols are REST, GraphQL, SOAP, and gRPC"
        },
        {
          "feature": "SOAP and gRPC testing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Hoppscotch documented protocols are REST, GraphQL, WebSocket, and SSE"
        }
      ]
    },
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Postman con notes cloud sync may not suit strict data residency needs"
        },
        {
          "feature": "Hosted cloud version",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Desktop application",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Referenced via Postman con about desktop app resource usage"
        }
      ]
    },
    {
      "group": "Collaboration and Team Features",
      "rows": [
        {
          "feature": "Real-time collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Postman documents shared Team Workspaces but not real-time editing specifically"
        },
        {
          "feature": "Team workspaces",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Roles and permissions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Described as part of Team Workspaces"
        }
      ]
    },
    {
      "group": "Testing and Automation",
      "rows": [
        {
          "feature": "Scripted test automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "JavaScript-based assertions"
        },
        {
          "feature": "CI/CD command-line runner",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Via the Newman CLI"
        },
        {
          "feature": "Mock servers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Documentation and Monitoring",
      "rows": [
        {
          "feature": "Auto-generated API documentation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Scheduled API monitoring and alerts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Governance and AI",
      "rows": [
        {
          "feature": "API design governance and spec linting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented under the Enterprise plan"
        },
        {
          "feature": "Integrated AI assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Generates tests, docs, and debugging suggestions"
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Hoppscotch free status confirmed via FAQ; Postman Free plan priced at $0"
        },
        {
          "feature": "Published paid pricing tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Basic, Professional, and Enterprise tiers documented for Postman"
        },
        {
          "feature": "Published starting price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Postman starting price documented at approximately $14 per user per month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Hoppscotch or Postman?",
      "answer": "Postman has a clearly documented cost structure, a $0 Free plan and paid tiers starting around $14 per user per month, while Hoppscotch has no published starting price but can be run for free if self-hosted, so the actual cheaper option depends on whether a team is comfortable managing its own hosting."
    },
    {
      "question": "Is Hoppscotch good for beginners?",
      "answer": "Hoppscotch documented feature set is focused on multi-protocol request testing, self-hosting, and real-time collaboration rather than a large set of advanced tools, which points to a simpler day-to-day experience, though beginner-friendliness itself is not directly documented."
    },
    {
      "question": "Can Hoppscotch do everything Postman can do?",
      "answer": "No, based on the documented facts Hoppscotch does not list features like scripted test automation with a CI/CD runner, mock servers, API monitoring, auto-generated documentation, API governance, or an AI assistant, all of which are documented Postman features."
    },
    {
      "question": "Which tool has better team collaboration features?",
      "answer": "Both document team-oriented features: Hoppscotch highlights real-time collaboration on collections, while Postman documents Team Workspaces with roles, comments, and shared history, so the better fit depends on whether real-time editing or structured workspace roles matter more to a team."
    },
    {
      "question": "Does Postman support GraphQL like Hoppscotch does?",
      "answer": "Yes, Postman documented Request Builder supports GraphQL alongside REST, SOAP, and gRPC, and Hoppscotch documented features also include GraphQL testing alongside REST, WebSocket, and SSE."
    },
    {
      "question": "Which tool is open source and self-hostable?",
      "answer": "Hoppscotch is documented as open source with both a hosted version and a self-hostable version, while Postman is not documented as offering a self-hosting option."
    }
  ]
};

export default hoppscotchVsPostmanContent;
