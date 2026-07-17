import type { ToolComparisonContent } from './types';

const mockoonVsWiremockContent: ToolComparisonContent = {
  "verdict": "Mockoon and WireMock both provide free, open-source API mocking, but they're built for different workflows. Mockoon is a desktop-first GUI tool for quickly designing and running mocks with no account required, while WireMock is a server/library-first tool built for embedding into automated test suites with fault simulation and request verification. Mockoon's paid tier centers on cloud collaboration ($100/month for 5 team members), while WireMock's paid tier (WireMock Cloud) centers on scaling API call volume and adding stateful mocking, SSO/RBAC, and chaos testing at a custom-quoted Enterprise price.",
  "bestForToolA": "Developers who want a visual, no-account-required desktop app for quickly designing mock REST APIs, with OpenAPI import/export and CLI/Docker support for CI/CD, paying $100/month only if they need Mockoon Cloud's team collaboration.",
  "bestForToolB": "Developers and QA teams who need to embed API mocks directly into automated Java or .NET test suites, with request verification, fault/chaos simulation, and flexible deployment as a JAR, embedded library, or Docker container.",
  "whoNeedsBoth": "A team could use Mockoon during early API design to visually prototype and record mock endpoints for frontend development, then translate those into WireMock stubs embedded in their Java or .NET test suites for automated fault-simulation and request-verification testing later in the pipeline.",
  "keyDifferences": [
    {
      "title": "Primary Interface",
      "toolA": "Mockoon is a desktop-app-first tool with a GUI for visually designing mocks, requiring no account.",
      "toolB": "WireMock is a library/server-first tool (standalone JAR, embedded in tests, or Docker) configured programmatically or via its API, with WireMock Cloud adding a UI layer with AI support.",
      "whyItMatters": "Visual tools lower the barrier to entry for quickly building mocks, while code-first tools integrate more naturally into automated test pipelines.",
      "benefitsWho": "Developers wanting quick visual mock setup benefit from Mockoon; teams embedding mocks in automated test code benefit from WireMock."
    },
    {
      "title": "Fault and Chaos Simulation",
      "toolA": "Mockoon's documented features don't mention fault or chaos simulation.",
      "toolB": "WireMock explicitly supports fault simulation (network delays, malformed responses), with chaos testing available on WireMock Cloud Enterprise.",
      "whyItMatters": "Testing how systems degrade under network failures or bad responses requires dedicated fault-injection capability.",
      "benefitsWho": "QA and reliability engineering teams testing failure scenarios benefit from WireMock's fault simulation."
    },
    {
      "title": "Request Verification",
      "toolA": "Mockoon doesn't document request verification as a feature.",
      "toolB": "WireMock explicitly verifies that expected requests were made during test runs, a core testing-assertion feature.",
      "whyItMatters": "Automated test suites often need to assert that specific API calls occurred, not just that responses were mocked.",
      "benefitsWho": "Automated testing teams writing assertion-based tests benefit from WireMock's request verification."
    },
    {
      "title": "Framework and Language Support",
      "toolA": "Mockoon doesn't document specific language/framework SDK integrations beyond its own desktop app, CLI, and Docker image.",
      "toolB": "WireMock documents broad framework support including Java (Maven, Gradle, Kotlin, Scala SBT) and .NET via WireMock.Net.",
      "whyItMatters": "Teams standardized on specific languages benefit from mocking tools with native build-tool integration.",
      "benefitsWho": "Java and .NET development teams benefit from WireMock's documented framework integrations."
    },
    {
      "title": "Cloud and Team Pricing",
      "toolA": "Mockoon Cloud's Team plan is $100/month billed annually for 5 team members and 3 cloud-deployed mocks.",
      "toolB": "WireMock Cloud's free tier covers 1 user and 3 mock APIs at 1,000 calls/month, with paid tiers requiring a custom Enterprise quote for unlimited calls and team members.",
      "whyItMatters": "Published flat pricing is easier to budget for than a sales-quote model.",
      "benefitsWho": "Small teams wanting predictable published pricing benefit from Mockoon Cloud's flat Team plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Mocking Capabilities",
      "rows": [
        {
          "feature": "Dynamic response templating",
          "toolA": "available",
          "toolB": "available",
          "note": "Mockoon: templating & rules matching; WireMock: Handlebars"
        },
        {
          "feature": "Request recording/playback",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Fault/chaos simulation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Request verification (assertions)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Proxy mode (forward unmocked requests)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "OpenAPI import/export/sync",
          "toolA": "available",
          "toolB": "available",
          "note": "WireMock via WireMock Cloud's OpenAPI sync"
        }
      ]
    },
    {
      "group": "Deployment & Testing Integration",
      "rows": [
        {
          "feature": "Desktop GUI app",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Standalone JAR / embedded library",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Docker support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "CI/CD integration (GitHub Actions, CircleCI, TravisCI)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Language/framework SDKs (Java, .NET)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Cloud & Pricing",
      "rows": [
        {
          "feature": "Free core product",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free cloud tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WireMock Cloud: 1,000 calls/month, 1 user, 3 mock APIs"
        },
        {
          "feature": "Published team pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Mockoon Cloud Team: $100/month for 5 members"
        },
        {
          "feature": "AI-assisted mock creation",
          "toolA": "available",
          "toolB": "available",
          "note": "Mockoon: 200 AI-generated endpoints/month; WireMock Cloud: AI-supported UI creation"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is better for automated test assertions that verify requests were made?",
      "answer": "WireMock explicitly supports request verification during test runs. This isn't a documented Mockoon feature."
    },
    {
      "question": "Does either tool simulate network faults or delays?",
      "answer": "WireMock documents fault simulation for network delays and malformed responses, plus chaos testing on its Enterprise Cloud tier. This isn't documented for Mockoon."
    },
    {
      "question": "Which has a free-forever cloud tier?",
      "answer": "WireMock Cloud offers a free tier with 1,000 calls/month, 1 user, and 3 mock APIs. Mockoon Cloud's paid Team plan starts at $100/month with a 14-day free trial rather than a free-forever cloud tier."
    },
    {
      "question": "Which is easier to use without writing code, via a GUI?",
      "answer": "Mockoon, with its desktop app interface for visually designing mocks. WireMock is primarily configured as a standalone JAR, embedded library, or via Docker."
    },
    {
      "question": "Do both tools support OpenAPI?",
      "answer": "Yes. Mockoon documents direct OpenAPI import/export, and WireMock offers OpenAPI sync through the paid WireMock Cloud tier."
    },
    {
      "question": "Which has broader documented language and framework support?",
      "answer": "WireMock, with Java support via Maven, Gradle, Kotlin, and Scala SBT, plus .NET support via WireMock.Net."
    }
  ]
};

export default mockoonVsWiremockContent;
