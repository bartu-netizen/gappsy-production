import type { ToolComparisonContent } from './types';

const beeceptorVsChromaticContent: ToolComparisonContent = {
  "verdict": "Beeceptor lets developers instantly spin up mock REST, GraphQL, SOAP, and gRPC API servers, including AI-generated mocks from API specs, with a free-forever plan and paid tiers starting at $10/month gated by request volume. Chromatic, built by the Storybook team, is a UI visual, interaction, and accessibility testing platform with a free plan (5,000 billed snapshots/month) and paid tiers starting at $179/month gated by snapshot volume. They test entirely different layers of an application — backend API responses versus rendered frontend UI — so they solve adjacent, not competing, problems.",
  "bestForToolA": "Backend and API developers who need to instantly mock REST, GraphQL, SOAP, or gRPC responses to unblock frontend work or simulate failure conditions (latency, timeouts, errors) before a real API exists.",
  "bestForToolB": "Frontend teams using Storybook (or Playwright/Cypress) who need automated visual, interaction, and accessibility regression testing on every pull request, especially teams already citing GitHub, Adobe, or the BBC as comparable large-scale users.",
  "whoNeedsBoth": "A realistic pairing: a team building a component library in Storybook could use Beeceptor to mock the backend API responses that drive component stories, while using Chromatic to catch visual regressions in those same components on every commit — covering both the data layer and the rendered UI within one CI pipeline.",
  "keyDifferences": [
    {
      "title": "What Is Tested",
      "toolA": "Beeceptor mocks backend API responses across REST, GraphQL, SOAP, and gRPC, including schema-less CRUD storage and network condition simulation (latency, timeouts, errors).",
      "toolB": "Chromatic tests rendered UI components for visual bugs, WCAG accessibility violations, and interaction behaviors like click, type, hover, and drag.",
      "whyItMatters": "These tools address different failure modes in an application: incorrect or unavailable backend data versus broken or inaccessible UI rendering.",
      "benefitsWho": "Backend/API developers needing mock data (Beeceptor) versus frontend engineers and designers needing visual QA (Chromatic)."
    },
    {
      "title": "Pricing Structure and Scale",
      "toolA": "Beeceptor's paid tiers are gated by request volume and mock rule count: Individual at $10/month (15,000 requests/month, 50 rules), Team at $25/month (100,000 requests, 250 rules), and Scale at $99/month (1M+ requests, 500 rules, +$40 per extra 1M requests).",
      "toolB": "Chromatic's paid tiers are gated by billed snapshot volume: Starter at $179/month (35,000 snapshots, multi-browser testing) and Pro at $399/month (85,000 snapshots, custom domain).",
      "whyItMatters": "Chromatic's entry paid tier is substantially more expensive than Beeceptor's, reflecting the cost of running visual diffing across browsers versus serving mock API responses.",
      "benefitsWho": "Budget-conscious teams comparing tooling spend across their API mocking and UI testing stacks."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "Beeceptor's free-forever plan is capped at 50 requests/day and 3 mock rules.",
      "toolB": "Chromatic's free plan allows 5,000 billed snapshots/month with unlimited projects, users, and collaborators.",
      "whyItMatters": "The free tiers serve different purposes — Beeceptor's is a low-volume sandbox for testing the concept, while Chromatic's supports real ongoing use for smaller projects.",
      "benefitsWho": "Small teams and open-source projects evaluating either tool without committing budget upfront."
    },
    {
      "title": "AI Usage",
      "toolA": "Beeceptor's AI generates mock servers directly from API specs including OpenAPI, WSDL, GraphQL SDL, and proto files.",
      "toolB": "The facts don't describe an AI feature for Chromatic; it instead relies on automated diffing (TurboSnap) to speed up test runs by only re-testing affected components.",
      "whyItMatters": "AI-assisted setup can significantly reduce the time to configure mocks from an existing API contract, which Chromatic's approach doesn't need since it tests rendered output directly.",
      "benefitsWho": "Teams wanting to get a mock server running quickly from an existing API specification."
    },
    {
      "title": "Origin and Framework Ties",
      "toolA": "Beeceptor is a standalone tool not tied to any specific frontend framework, with a local tunnel feature that routes payloads to a developer's machine.",
      "toolB": "Chromatic is built by the Storybook team with deep native Storybook integration, and also supports Playwright and Cypress.",
      "whyItMatters": "Teams already invested in Storybook get first-party support and tighter integration from the team that builds it.",
      "benefitsWho": "Component-library teams standardized on Storybook, Playwright, or Cypress."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Testing Capability",
      "rows": [
        {
          "feature": "Mock API server creation (REST/GraphQL/SOAP/gRPC)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Visual UI regression testing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Accessibility (WCAG) testing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Interaction testing (click/type/hover/drag)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Network condition simulation (latency/errors)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-generated mocks from API specs",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Change-scoped test re-runs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Chromatic's TurboSnap"
        },
        {
          "feature": "CI/CD integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Beeceptor via CI/CD integration on Team plan; Chromatic across major CI providers"
        },
        {
          "feature": "Proxy/record mode against live APIs",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Beeceptor: 50 req/day, 3 rules; Chromatic: 5,000 snapshots/month"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "$10/month vs $179/month"
        },
        {
          "feature": "Multi-browser testing",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Chromatic requires the Starter plan or above for Safari/Firefox/Edge"
        },
        {
          "feature": "SSO / on-premise deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Both gate this to Enterprise custom tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Beeceptor and Chromatic overlap in functionality?",
      "answer": "No, they test different layers of an application. Beeceptor creates mock backend API servers, while Chromatic tests rendered frontend UI components for visual, interaction, and accessibility issues."
    },
    {
      "question": "Which is cheaper to start with?",
      "answer": "Beeceptor's entry paid tier (Individual) is $10/month, while Chromatic's entry paid tier (Starter) is $179/month. Both also offer free tiers: Beeceptor at 50 requests/day and 3 mock rules, Chromatic at 5,000 billed snapshots/month."
    },
    {
      "question": "Does Chromatic work with tools other than Storybook?",
      "answer": "Yes, Chromatic also integrates with Playwright and Cypress, though it's built by the Storybook team with deep native Storybook support."
    },
    {
      "question": "Can Beeceptor generate mocks automatically from an API spec?",
      "answer": "Yes, Beeceptor's AI-powered mock generation creates mock servers from specs including OpenAPI, WSDL, GraphQL SDL, and proto files."
    },
    {
      "question": "Does either tool test accessibility?",
      "answer": "Chromatic includes accessibility testing that flags WCAG violations directly within its review workflow. Accessibility testing is not documented for Beeceptor."
    },
    {
      "question": "Is there a free option for open-source projects?",
      "answer": "Chromatic explicitly offers a free program for eligible open-source projects. The facts don't mention an equivalent open-source program for Beeceptor beyond its standard free-forever plan."
    }
  ]
};

export default beeceptorVsChromaticContent;
