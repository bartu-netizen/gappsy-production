import type { ToolComparisonContent } from './types';

const nextraVsPercyContent: ToolComparisonContent = {
  "verdict": "Nextra and Percy solve different problems in a developer's toolchain. Nextra is a free, open-source static site generator for building documentation and content sites on Next.js and MDX, while Percy is BrowserStack's AI-assisted visual regression testing platform for catching UI bugs in CI/CD. They aren't substitutes for one another; the comparison mainly matters for teams deciding where to invest tooling effort across a project's authoring and testing workflows.",
  "bestForToolA": "Teams building a documentation or content site with Next.js who want MDX authoring, Pagefind search, and Shiki syntax highlighting without licensing costs.",
  "bestForToolB": "Teams running CI/CD pipelines with Storybook, Playwright, or Selenium who need automated screenshot comparison and AI-assisted review to catch visual regressions before shipping, with a free tier of 5,000 screenshots/month.",
  "whoNeedsBoth": "A product team could use Nextra to publish its component library's documentation site and Percy to visually test that same component library's Storybook stories in CI, keeping documentation and visual regression testing as two complementary parts of the same frontend pipeline.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Nextra is a static site generator for documentation and content sites.",
      "toolB": "Percy is a visual regression testing platform for catching UI regressions in CI/CD pipelines.",
      "whyItMatters": "They address entirely different stages of the development lifecycle: authoring content vs. testing UI output.",
      "benefitsWho": "Teams trying to understand whether either tool actually fits their stated need."
    },
    {
      "title": "Pricing Model",
      "toolA": "Nextra is entirely free and open source with an \"Open Source\" plan and no licensing cost.",
      "toolB": "Percy is freemium, with a documented Free plan of 5,000 screenshots/month, while paid-tier pricing is not publicly listed.",
      "whyItMatters": "Budget planning differs sharply between a zero-cost dev tool and a usage-metered SaaS product.",
      "benefitsWho": "Budget-conscious teams evaluating recurring testing costs versus one-time doc-tooling setup."
    },
    {
      "title": "AI Features",
      "toolA": "Nextra's documented feature list includes no AI capability.",
      "toolB": "Percy documents a \"Visual Review Agent\" AI feature that prioritizes meaningful visual changes with natural-language summaries, claimed to cut review time 3x.",
      "whyItMatters": "AI-assisted triage directly affects how much manual review time a QA team spends per pull request.",
      "benefitsWho": "QA and frontend engineers reviewing high volumes of visual diffs."
    },
    {
      "title": "CI/CD Integration Depth",
      "toolA": "Nextra's integrations are limited to being deployed as a Next.js app; CI/CD-specific tooling integrations are not documented.",
      "toolB": "Percy documents integrations with Storybook, Playwright, Selenium, and 50+ CI/CD and SCM tools, plus git-style branching/merging review workflows.",
      "whyItMatters": "Percy's value depends entirely on plugging into an existing test/CI pipeline.",
      "benefitsWho": "Engineering teams with an established CI/CD pipeline who need automated visual QA gates."
    },
    {
      "title": "Ownership & Backing",
      "toolA": "Nextra has no parent company; it's maintained as an independent open-source project per its documented facts.",
      "toolB": "Percy is owned and operated by BrowserStack, giving it access to BrowserStack's real device and browser cloud.",
      "whyItMatters": "Backing affects long-term maintenance, support availability, and infrastructure scale.",
      "benefitsWho": "Enterprises wanting the assurance of a backing company with a real-device/browser cloud versus teams comfortable with independent open-source maintenance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Primary function",
          "toolA": "available",
          "toolB": "available",
          "note": "Nextra: docs/content site generation; Percy: visual regression testing"
        },
        {
          "feature": "Markdown/MDX authoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Screenshot comparison",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Automation & AI",
      "rows": [
        {
          "feature": "AI-assisted review",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Percy's Visual Review Agent"
        },
        {
          "feature": "Build-time search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Nextra uses Pagefind"
        },
        {
          "feature": "Root cause analysis for UI changes",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Integrations",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Nextra fully free; Percy free up to 5,000 screenshots/month"
        },
        {
          "feature": "CI/CD integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "50+ tools"
        },
        {
          "feature": "Paid tier price transparency",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Percy paid pricing not publicly listed"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Nextra and Percy competitors?",
      "answer": "No. Nextra is a documentation site generator built on Next.js, and Percy is a visual regression testing platform owned by BrowserStack; they serve different purposes in a dev workflow."
    },
    {
      "question": "Is Percy free like Nextra?",
      "answer": "Percy has a free tier covering 5,000 screenshots/month, but its paid-tier pricing is not publicly listed. Nextra is entirely free and open source with no paid tier."
    },
    {
      "question": "Does Nextra include testing features?",
      "answer": "No, Nextra's documented features focus on MDX authoring, routing, search, and i18n. It does not document any visual testing capability."
    },
    {
      "question": "Does Percy help with documentation sites?",
      "answer": "No, Percy's documented features are about visual regression testing (screenshot comparison, root cause analysis, CI/CD integration) rather than content authoring."
    },
    {
      "question": "Which tool uses AI?",
      "answer": "Percy documents a \"Visual Review Agent\" AI feature for prioritizing meaningful visual changes. Nextra's documented feature list includes no AI capability."
    },
    {
      "question": "Can these two tools be used together?",
      "answer": "Yes. A team could use Nextra to publish documentation for a component library while using Percy to run visual regression tests against that same library's Storybook stories."
    }
  ]
};

export default nextraVsPercyContent;
