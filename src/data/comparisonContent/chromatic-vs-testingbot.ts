import type { ToolComparisonContent } from './types';

const chromaticVsTestingbotContent: ToolComparisonContent = {
  "verdict": "Chromatic is a component-level visual, interaction, and accessibility testing tool built around Storybook (also supporting Playwright and Cypress), with pricing that scales by snapshot volume; TestingBot is a broader cross-browser and device cloud (6,100+ real browsers and devices) supporting manual, automated, and visual regression testing across many frameworks (Selenium, Playwright, Cypress, Puppeteer, Appium, Espresso, XCUITest, Maestro), priced in EUR and EU-hosted. Chromatic fits teams centered on component-driven development wanting tight Storybook integration; TestingBot fits teams needing real-device, cross-browser coverage for full application testing.",
  "bestForToolA": "Chromatic fits teams using Storybook (or Playwright/Cypress) who want automated UI review workflows and TurboSnap's re-test-only-what-changed approach, with a free tier covering 5,000 snapshots/month.",
  "bestForToolB": "TestingBot fits teams needing real browser and physical device testing at scale (6,100+ browsers/devices) across many automation frameworks, with EU-hosted infrastructure for GDPR compliance, starting at €20/month for unlimited live/manual testing.",
  "whoNeedsBoth": "A frontend team could use Chromatic for component-level visual regression testing within Storybook during development, then use TestingBot to run full end-to-end automated and cross-browser/device tests against the deployed application — the two operate at different layers (component vs. full application/device coverage) rather than competing directly.",
  "keyDifferences": [
    {
      "title": "Testing Scope",
      "toolA": "Focused on UI components via Storybook, plus Playwright/Cypress support, for visual, interaction, and accessibility testing.",
      "toolB": "Full application testing across 6,100+ real browsers and devices, spanning live/manual, automated, and visual regression testing.",
      "whyItMatters": "Component-level checks and full-app cross-browser checks solve different problems and often coexist in a test strategy.",
      "benefitsWho": "Benefits design-system-heavy frontend teams (Chromatic) vs. QA teams needing full-app device coverage (TestingBot)."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Scales by billed snapshots: 5,000 free, 35,000 at $179/month (Starter), 85,000 at $399/month (Pro).",
      "toolB": "Scales by parallel test count and monthly minutes: €20/month (Live) for unlimited live/visual testing, €50/month (Automated) for 1,000-20,000 minutes.",
      "whyItMatters": "Teams with large component libraries may find snapshot-based pricing costly, while teams running many parallel automated tests need to check minute and parallel limits.",
      "benefitsWho": "Benefits teams evaluating cost predictability at scale."
    },
    {
      "title": "Real Device Access",
      "toolA": "Tests rendered components/browsers via its own cloud, not physical device hardware.",
      "toolB": "Provides access to real iOS and Android physical devices in addition to browsers.",
      "whyItMatters": "Mobile-web validation on actual hardware requires real device access that Chromatic doesn't offer.",
      "benefitsWho": "Benefits teams needing to validate on actual iOS/Android hardware."
    },
    {
      "title": "AI-Driven Testing",
      "toolA": "Not documented as offering AI test generation.",
      "toolB": "Offers codeless test creation via natural language and MCP-based REST API access for AI assistants like Claude and Cursor.",
      "whyItMatters": "Teams wanting to generate tests from natural language or connect AI coding assistants need TestingBot's MCP support.",
      "benefitsWho": "Benefits teams adopting AI-assisted development workflows."
    },
    {
      "title": "Company History & Hosting",
      "toolA": "Founding year and headquarters not documented.",
      "toolB": "Founded 2011, headquartered in Moerbeke-Waas, Belgium, with EU-hosted GDPR-compliant infrastructure.",
      "whyItMatters": "EU-based companies with data residency requirements need documented EU hosting.",
      "benefitsWho": "Benefits EU enterprises with GDPR compliance requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Testing Types",
      "rows": [
        {
          "feature": "Visual regression testing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Accessibility testing",
          "toolA": "available",
          "toolB": "available",
          "note": "TestingBot: WCAG 2.1 compliance checks"
        },
        {
          "feature": "Interaction testing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Manual/live testing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Unlimited on TestingBot's Live plan"
        },
        {
          "feature": "AI/codeless test creation",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Infrastructure & Frameworks",
      "rows": [
        {
          "feature": "Real physical devices (iOS/Android)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Framework support",
          "toolA": "available",
          "toolB": "available",
          "note": "Chromatic: Storybook, Playwright, Cypress; TestingBot: Selenium, Playwright, Cypress, Puppeteer, Appium, Espresso, XCUITest, Maestro"
        },
        {
          "feature": "Browser/device count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "6,100+ real browsers and devices"
        },
        {
          "feature": "CI/CD integration",
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
          "note": "Chromatic: 5,000 snapshots/mo; TestingBot: 14-day free plan"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "$179/month (Chromatic) vs €20/month (TestingBot)"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Both on Enterprise/Pro tiers"
        },
        {
          "feature": "Open-source project program",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which offers real physical device testing?",
      "answer": "TestingBot provides real iOS and Android devices; Chromatic does not document physical device access."
    },
    {
      "question": "How is pricing structured differently?",
      "answer": "Chromatic bills by snapshot volume ($179/month for 35,000 snapshots), while TestingBot bills by parallel tests and minutes (€50/month for 1,000-20,000 minutes) or a flat unlimited live-testing rate at €20/month."
    },
    {
      "question": "Does either support AI-assisted test creation?",
      "answer": "TestingBot offers codeless AI testing via natural language and MCP servers for tools like Claude and Cursor; this isn't documented for Chromatic."
    },
    {
      "question": "Which is built specifically for Storybook?",
      "answer": "Chromatic, built by the Storybook team, though it also supports Playwright and Cypress."
    },
    {
      "question": "Which is EU-hosted?",
      "answer": "TestingBot, headquartered in Moerbeke-Waas, Belgium, with GDPR-compliant EU infrastructure; this isn't documented for Chromatic."
    },
    {
      "question": "Do both offer free tiers?",
      "answer": "Yes — Chromatic's free plan includes 5,000 billed snapshots/month, and TestingBot offers a 14-day free plan with no credit card required."
    }
  ]
};

export default chromaticVsTestingbotContent;
