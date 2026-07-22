import type { ToolComparisonContent } from './types';

const archbeeVsClickhelpContent: ToolComparisonContent = {
  "verdict": "Archbee and ClickHelp both target technical documentation, but they diverge on where AI and platform support live. Archbee bundles AI writing assistance and AI-powered Q&A into its core product and ships native macOS, Windows, and Linux apps, with a lower entry price ($80/month) that jumps steeply to $350/month at the next tier. ClickHelp starts higher ($194/month) but scales more incrementally by contributor count, supports legacy-format migration (Word, CHM, Web Help), and sells its AI Suite as a separate $300/month add-on rather than bundling it.",
  "bestForToolA": "Teams that want AI writing and Q&A included without a separate add-on fee, need native desktop apps for macOS, Windows, or Linux, or qualify for Archbee's Open Source program or startup/nonprofit/education discount.",
  "bestForToolB": "Teams migrating existing documentation from legacy formats like Word, CHM, or Web Help, or organizations that value ClickHelp's SOC 2 Type II and GDPR/CCPA compliance posture and are willing to pay for AI as a separate add-on.",
  "whoNeedsBoth": "Teams currently on a legacy help-authoring tool that need ClickHelp's migration tooling, but that also want Archbee's git-like branching and reusable-content variables, should evaluate both, since neither tool's facts show one covering both needs.",
  "keyDifferences": [
    {
      "title": "Native desktop app support",
      "toolA": "Archbee offers native macOS, Windows, and Linux apps in addition to the web app.",
      "toolB": "ClickHelp's facts describe it only as a cloud-based platform accessible via web browsers, with no native desktop app mentioned.",
      "whyItMatters": "Native apps can matter for writers who prefer working offline or outside a browser tab.",
      "benefitsWho": "Documentation teams that prefer a dedicated desktop application over a browser-only workflow."
    },
    {
      "title": "AI bundling vs. paid add-on",
      "toolA": "Archbee's AI writing assistance and AI-powered Q&A are listed as core product features.",
      "toolB": "ClickHelp's AI Suite is explicitly a separate paid add-on priced at $300/month on top of any base plan.",
      "whyItMatters": "Whether AI is included or an extra cost significantly changes the effective price of adopting AI-assisted documentation.",
      "benefitsWho": "Cost-conscious teams deciding whether AI features are a must-have from day one."
    },
    {
      "title": "Legacy content migration",
      "toolA": "Archbee's facts don't mention support for importing from legacy authoring formats.",
      "toolB": "ClickHelp explicitly supports importing content from MS Word (DOC/DOCX), OpenOffice (ODT), HTML, Web Help, and CHM formats.",
      "whyItMatters": "Teams migrating years of existing documentation need explicit format support to avoid manual re-authoring.",
      "benefitsWho": "Teams switching off older tools like RoboHelp or Confluence-based CHM exports."
    },
    {
      "title": "Entry price and scaling jump",
      "toolA": "Archbee's Growing plan starts at $80/month but jumps to $350/month at the Scaling tier.",
      "toolB": "ClickHelp's three tiers step up more incrementally by contributor count: $194, $325, and $640/month.",
      "whyItMatters": "A steep jump between tiers (Archbee) can force a team to overpay if their needs sit just above the entry tier's limits.",
      "benefitsWho": "Growing teams trying to predict cost as their contributor count increases."
    },
    {
      "title": "Where API, MCP, and SSO sit in the plan structure",
      "toolA": "Archbee's entry Growing plan already includes GitHub integration and API documentation tools; SSO is reserved for the custom Enterprise tier.",
      "toolB": "ClickHelp gates REST API, MCP, and Single Sign-On to its top Professional tier ($640/month) by default.",
      "whyItMatters": "Teams that need API access or SSO early should check which tier actually includes them rather than assuming it's bundled at the entry price.",
      "benefitsWho": "IT and security teams that require SSO or API access as a baseline requirement."
    }
  ],
  "featureMatrix": [
    {
      "group": "Authoring & Content",
      "rows": [
        {
          "feature": "Git-like branching workflow",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Legacy format migration (Word, CHM, etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Reusable content (variables/snippets)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-version documentation support",
          "toolA": "available",
          "toolB": "available",
          "note": "Archbee: versioning on the Scaling plan. ClickHelp: dedicated Multi-version support feature."
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI writing assistance",
          "toolA": "available",
          "toolB": "available",
          "note": "Archbee: included. ClickHelp: separate AI Suite add-on."
        },
        {
          "feature": "AI Q&A / chatbot",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI translation",
          "toolA": "available",
          "toolB": "available",
          "note": "Archbee: Enterprise tier. ClickHelp: part of the AI Suite add-on."
        }
      ]
    },
    {
      "group": "Platforms & Access",
      "rows": [
        {
          "feature": "Native desktop apps (macOS/Windows/Linux)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Archbee: 14-day, no credit card required."
        },
        {
          "feature": "Free or discounted plan for open source/nonprofits",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Archbee: $80/month. ClickHelp: $194/month."
        },
        {
          "feature": "Top disclosed plan price (below Enterprise)",
          "toolA": "available",
          "toolB": "available",
          "note": "Archbee: $350/month (Scaling). ClickHelp: $640/month (Professional)."
        },
        {
          "feature": "SSO included by default (non-Enterprise)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "ClickHelp: included on the Professional tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Archbee offer a free trial?",
      "answer": "Yes, a 14-day free trial with no credit card required and unlimited readers."
    },
    {
      "question": "How much does ClickHelp cost?",
      "answer": "Plans start at $194/month for Starter, $325/month for Growth, and $640/month for Professional, with a 14% discount when billed annually."
    },
    {
      "question": "Does ClickHelp include AI features by default?",
      "answer": "No, ClickHelp's AI Suite is a separate add-on priced at $300/month rather than included in the base plans."
    },
    {
      "question": "What platforms does Archbee support?",
      "answer": "Archbee is web-based and also offers native apps for macOS, Windows, and Linux."
    },
    {
      "question": "Can ClickHelp import existing documentation?",
      "answer": "Yes, it supports importing content from MS Word, OpenOffice, HTML, Web Help, and CHM formats."
    },
    {
      "question": "Does Archbee have a free plan?",
      "answer": "Yes, a free Growing plan is available for qualifying open-source projects, plus a 50% discount for startups, nonprofits, and education."
    }
  ]
};

export default archbeeVsClickhelpContent;
