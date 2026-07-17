import type { ToolComparisonContent } from './types';

const hoppscotchVsMockserverContent: ToolComparisonContent = {
  "verdict": "Hoppscotch is an open-source API development ecosystem for building, testing, and documenting HTTP and GraphQL requests interactively, with real-time collaboration and self-hosting. MockServer is a free, open-source tool purpose-built to mock, proxy, and verify HTTP, HTTPS, gRPC, and GraphQL APIs so other systems can be tested against simulated backends, including chaos and load testing. They serve adjacent but distinct roles in API testing: one is a client for sending requests, the other simulates the server side.",
  "bestForToolA": "Developers who want an interactive client for building, testing, and documenting REST, GraphQL, WebSocket, and SSE requests, with real-time collaboration on shared API collections.",
  "bestForToolB": "Teams that need to simulate dependent services in automated test suites, including broad protocol coverage (HTTP/2, HTTP/3, gRPC, OAuth2/OIDC), chaos testing, load testing, and even LLM API mocking.",
  "whoNeedsBoth": "A team could use Hoppscotch to manually build, send, and document REST/GraphQL/WebSocket requests during development, while using MockServer in automated test suites and CI pipelines to simulate dependent services, inject chaos scenarios, and verify which requests were actually sent.",
  "keyDifferences": [
    {
      "title": "Primary Purpose",
      "toolA": "Hoppscotch is an API client for building, testing, and documenting requests against real or mock endpoints.",
      "toolB": "MockServer is purpose-built to mock, proxy, and verify API responses so other systems can be tested against simulated backends.",
      "whyItMatters": "Choosing the wrong category of tool means either missing a request-building UI or missing automated mocking capability.",
      "benefitsWho": "Developers doing manual, exploratory API testing benefit from Hoppscotch; QA/test-automation engineers benefit from MockServer."
    },
    {
      "title": "Protocol Coverage",
      "toolA": "Hoppscotch tests REST, GraphQL, WebSocket, and SSE.",
      "toolB": "MockServer supports a broader low-level protocol set including HTTP/1.1, HTTP/2, HTTP/3, HTTPS, gRPC, AsyncAPI messaging, GraphQL, and OAuth2/OIDC.",
      "whyItMatters": "Teams working with gRPC or next-gen HTTP protocols need mocking support that matches their actual stack.",
      "benefitsWho": "Teams testing gRPC or streaming/async protocols benefit from MockServer's broader coverage."
    },
    {
      "title": "Advanced Testing Capabilities",
      "toolA": "Hoppscotch's documented feature set does not include chaos or load testing.",
      "toolB": "MockServer includes built-in chaos testing (injecting latency, errors, dropped connections, malformed responses) and declarative load testing scenarios.",
      "whyItMatters": "Resilience testing requires simulating failure conditions, not just happy-path responses.",
      "benefitsWho": "Reliability and SRE-minded teams validating failure handling benefit from MockServer's chaos testing."
    },
    {
      "title": "AI/LLM-Specific Mocking",
      "toolA": "Not documented for Hoppscotch.",
      "toolB": "MockServer explicitly mocks OpenAI, Anthropic, and Bedrock-style APIs, including token streaming.",
      "whyItMatters": "Teams building AI features need to test against LLM API behavior without incurring real API costs.",
      "benefitsWho": "Teams building AI-integrated applications benefit from MockServer's LLM mocking during development and CI."
    },
    {
      "title": "Collaboration vs. Deployment Flexibility",
      "toolA": "Hoppscotch emphasizes real-time collaboration on API collections alongside self-hosting.",
      "toolB": "MockServer emphasizes deployment flexibility (Docker, executable JAR, Helm/Kubernetes, Testcontainers, Homebrew) and client libraries across eight languages.",
      "whyItMatters": "Team-based API design work benefits from collaboration features, while CI/CD integration benefits from deployment flexibility.",
      "benefitsWho": "Distributed teams co-designing APIs benefit from Hoppscotch's collaboration; platform/DevOps teams embedding mocks in pipelines benefit from MockServer's deployment options."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Interaction & Testing",
      "rows": [
        {
          "feature": "REST request building/testing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "GraphQL support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "WebSocket / SSE testing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Request verification/assertions",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Protocol & Mocking Depth",
      "rows": [
        {
          "feature": "HTTP/2 & HTTP/3 support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "gRPC support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "OAuth2/OIDC support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Chaos testing (latency/errors/dropped connections)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "LLM API mocking (OpenAI/Anthropic/Bedrock)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Load testing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hostable",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real-time team collaboration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Client libraries across languages",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Java/JS/Python/Ruby/Go/.NET/Rust/PHP"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "Hoppscotch: hosted + self-hosted; MockServer: no SaaS account needed"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Hoppscotch or MockServer better for building API requests?",
      "answer": "Hoppscotch is built for that — testing REST, GraphQL, WebSocket, and SSE requests interactively. MockServer instead simulates the responses of APIs you don't control, for use in automated tests."
    },
    {
      "question": "Does MockServer include chaos or load testing?",
      "answer": "Yes, MockServer can inject latency, errors, dropped connections, and malformed responses, and run built-in declarative load scenarios — capabilities not documented for Hoppscotch."
    },
    {
      "question": "Can either mock AI/LLM APIs?",
      "answer": "MockServer explicitly mocks OpenAI, Anthropic, and Bedrock-style APIs including token streaming; this is not documented for Hoppscotch."
    },
    {
      "question": "Are both free?",
      "answer": "Hoppscotch is open source with both hosted and self-hostable versions available; MockServer is completely free and open source with no SaaS account required."
    },
    {
      "question": "Which supports more protocols?",
      "answer": "MockServer documents broader low-level protocol support — HTTP/1.1, HTTP/2, HTTP/3, HTTPS, gRPC, AsyncAPI, GraphQL, and OAuth2/OIDC — versus Hoppscotch's REST, GraphQL, WebSocket, and SSE testing."
    },
    {
      "question": "Does Hoppscotch support team collaboration?",
      "answer": "Yes, real-time collaboration on API collections is a documented feature; collaboration features are not documented for MockServer, which is oriented around deployment options and client libraries instead."
    }
  ]
};

export default hoppscotchVsMockserverContent;
