import type { ToolComparisonContent } from './types';

const httpieVsMockserverContent: ToolComparisonContent = {
  "verdict": "HTTPie is an open-source API testing toolset with a CLI, a cross-platform desktop app, and a web app, built for manually sending and inspecting HTTP requests with an emphasis on expressive, human-readable syntax. MockServer is a free, open-source server for mocking, proxying, and verifying HTTP, HTTPS, gRPC, and GraphQL APIs, built for automated testing rather than manual exploration. One is a client you interact with directly; the other is infrastructure your tests talk to.",
  "bestForToolA": "Developers who want a fast, human-readable way to manually send and inspect HTTP requests across CLI, desktop (public beta), and web interfaces, with AI-assisted request building.",
  "bestForToolB": "Teams building automated test suites that need to simulate dependent APIs, including chaos testing, load testing, and mocking of LLM APIs like OpenAI, Anthropic, and Bedrock-style endpoints.",
  "whoNeedsBoth": "A developer could use HTTPie's CLI or desktop app to manually explore and debug a real API during development, then rely on MockServer in CI to mock that same API's responses — including chaos scenarios — for automated integration tests once the code moves beyond manual exploration.",
  "keyDifferences": [
    {
      "title": "Interface Options",
      "toolA": "HTTPie ships as a CLI (47,900+ GitHub stars), a cross-platform desktop app (Mac/Windows/Linux, currently public beta), and a browser-based web app.",
      "toolB": "MockServer has no GUI client documented and is run as a server via Docker, executable JAR, Homebrew, Kubernetes Helm charts, or Testcontainers.",
      "whyItMatters": "The way a tool is accessed determines whether it fits into manual developer workflows or automated CI pipelines.",
      "benefitsWho": "Developers wanting a visual or terminal interface for ad hoc requests benefit from HTTPie; DevOps teams embedding mocks in CI benefit from MockServer's headless deployment options."
    },
    {
      "title": "AI Features",
      "toolA": "HTTPie markets 'AI-assisted work' in its desktop app plus a dedicated HTTPie AI product.",
      "toolB": "MockServer's AI-related capability is mocking LLM APIs (OpenAI, Anthropic, Bedrock-style) for testing purposes, not assisting the user directly.",
      "whyItMatters": "AI assistance for the human user is a different value proposition than AI-related mocking for automated tests.",
      "benefitsWho": "Individual developers wanting AI help composing requests benefit from HTTPie; teams testing AI-integrated applications benefit from MockServer's LLM mocking."
    },
    {
      "title": "Protocol Depth",
      "toolA": "HTTPie's documented scope centers on standard HTTP request/response workflows with sessions, auth, and file uploads.",
      "toolB": "MockServer documents explicit support for HTTP/2, HTTP/3, gRPC, AsyncAPI, GraphQL, and OAuth2/OIDC alongside chaos and load testing.",
      "whyItMatters": "Testing modern microservice architectures often requires protocol support beyond plain HTTP/1.1.",
      "benefitsWho": "Teams working with gRPC or streaming protocols benefit from MockServer's broader protocol support."
    },
    {
      "title": "Offline & Account-Optional Use",
      "toolA": "HTTPie's desktop app can be used offline and without creating an account, with optional cross-device sync when signed in.",
      "toolB": "MockServer is self-hosted by nature, so there's no account/sign-in concept documented at all.",
      "whyItMatters": "Privacy-conscious developers may prefer tools that don't require an account for basic use.",
      "benefitsWho": "Developers wanting to avoid account creation for casual API testing benefit from HTTPie's offline, account-optional desktop mode."
    },
    {
      "title": "Funding & Pricing Transparency",
      "toolA": "HTTPie discloses $6.5M in seed funding from Coatue, Blossom Capital, and founders of Intercom, Checkout.com, and Monzo, but no public pricing page for paid tiers.",
      "toolB": "MockServer has no funding or company information documented, but is explicitly free and open source with no SaaS account required.",
      "whyItMatters": "Funding signals commercial trajectory and potential future monetization, while transparent free/open-source status signals no such pressure.",
      "benefitsWho": "Buyers evaluating long-term vendor stability get more signal from HTTPie's disclosed funding; teams wanting guaranteed no-cost tooling benefit from MockServer's fully free model."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Client Interfaces",
      "rows": [
        {
          "feature": "Command-line interface",
          "toolA": "available",
          "toolB": "available",
          "note": "MockServer: CLI plus REST API"
        },
        {
          "feature": "Desktop GUI app",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "HTTPie: public beta, Mac/Win/Linux"
        },
        {
          "feature": "Web app",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI-assisted request building",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Testing & Protocol Depth",
      "rows": [
        {
          "feature": "Mocking / simulated responses",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Chaos testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Load testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "HTTP/2, HTTP/3, gRPC support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "LLM API mocking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access, Pricing & Company",
      "rows": [
        {
          "feature": "Free / open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": "HTTPie CLI: 47,900+ GitHub stars"
        },
        {
          "feature": "Published pricing page for paid tiers",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "MockServer has no managed SaaS offering"
        },
        {
          "feature": "Company funding disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "HTTPie: $6.5M seed"
        },
        {
          "feature": "Offline / account-optional use",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the fundamental difference between HTTPie and MockServer?",
      "answer": "HTTPie is a client for manually sending and inspecting HTTP requests across CLI, desktop, and web interfaces; MockServer is a server you run to mock, proxy, and verify API traffic for automated testing."
    },
    {
      "question": "Does HTTPie have a desktop app?",
      "answer": "Yes, currently in public beta for Mac, Windows, and Linux, working offline and without an account; MockServer has no GUI documented, only Docker/JAR/Homebrew/Kubernetes/Testcontainers deployment options."
    },
    {
      "question": "Which tool supports AI features?",
      "answer": "HTTPie markets 'AI-assisted work' in its desktop app and a separate HTTPie AI product for the person using the tool; MockServer's AI-related feature is mocking LLM APIs (OpenAI, Anthropic, Bedrock-style) for testing, not assisting the user."
    },
    {
      "question": "Is either tool free?",
      "answer": "HTTPie's CLI is free and open source with over 47,900 GitHub stars; MockServer is entirely free and open source with no SaaS account required, though neither publishes a pricing page for any paid tiers."
    },
    {
      "question": "Which supports more advanced protocol testing?",
      "answer": "MockServer documents HTTP/2, HTTP/3, gRPC, AsyncAPI, GraphQL, and OAuth2/OIDC support along with chaos and load testing; HTTPie's documented scope centers on standard HTTP request/response workflows."
    },
    {
      "question": "Is HTTPie backed by investors?",
      "answer": "Yes, HTTPie discloses $6.5M in seed funding from Coatue, Blossom Capital, and founders of Intercom, Checkout.com, and Monzo; no funding or company information is documented for MockServer."
    }
  ]
};

export default httpieVsMockserverContent;
