import type { ToolComparisonContent } from './types';

const matomoVsUxcamContent: ToolComparisonContent = {
  "verdict": "Matomo and UXCam are both analytics tools, but they cover different surfaces. Matomo is a privacy-first, GDPR-focused web analytics platform positioned as a Google Analytics alternative, certified ISO 27001:2022, with a plugin marketplace and full data ownership, though pricing is custom/contact-sales with no published rate. UXCam is primarily mobile app product analytics -- session replay, heatmaps, and a built-in AI analyst called Tara AI -- reportedly installed in over 37,000 products, with a free trial offering full feature access but usage-based pricing that requires a custom quote. One tracks web traffic with a privacy angle; the other visualizes in-app user behavior with an AI layer on top.",
  "bestForToolA": "Teams wanting a privacy-first, GDPR-compliant web analytics platform with full data ownership, SEO tracking, and an extensible plugin marketplace as an alternative to ad-network-tied analytics tools.",
  "bestForToolB": "Mobile app teams wanting session replay, heatmaps, and an AI analyst (Tara AI) that can answer specific product behavior questions instantly, reportedly installed in over 37,000 products.",
  "whoNeedsBoth": "A product organization could reasonably run both -- Matomo for privacy-compliant web traffic and SEO analytics on its marketing site, and UXCam for qualitative mobile app behavior insights like session replay and heatmaps inside its native app -- since the two cover largely non-overlapping surfaces (web traffic versus in-app behavior).",
  "keyDifferences": [
    {
      "title": "Primary Platform Focus",
      "toolA": "Matomo is positioned as a web analytics platform and Google Analytics alternative, with features like SEO tracking and campaign URL building.",
      "toolB": "UXCam's cons note it is primarily built for mobile app analytics, with web analytics as a secondary capability.",
      "whyItMatters": "Choosing a platform built for the wrong surface (web versus mobile) means missing the behavioral detail that matters most.",
      "benefitsWho": "Marketing teams tracking website traffic and SEO (Matomo) versus mobile product teams analyzing in-app behavior (UXCam)."
    },
    {
      "title": "Privacy and Compliance Positioning",
      "toolA": "Matomo is explicitly positioned around privacy and GDPR compliance, is certified ISO 27001:2022, and emphasizes 100% data ownership.",
      "toolB": "No privacy certification or GDPR-specific positioning is documented for UXCam.",
      "whyItMatters": "Compliance certifications matter for organizations in regulated industries or operating under strict EU privacy law.",
      "benefitsWho": "Organizations in healthcare, finance, or EU-based companies with GDPR obligations."
    },
    {
      "title": "AI-Driven Insights",
      "toolA": "No AI feature is documented for Matomo.",
      "toolB": "UXCam includes Tara AI Analyst, which answers product questions in seconds by analyzing millions of data points.",
      "whyItMatters": "An AI analyst can surface answers faster than manually digging through dashboards.",
      "benefitsWho": "Product managers who want quick answers to behavioral questions without building custom reports."
    },
    {
      "title": "Session Replay and Heatmaps",
      "toolA": "No session replay or heatmap feature is documented for Matomo; it instead offers Visitor Profiles, a different behavioral view.",
      "toolB": "UXCam offers explicit Session Replay to watch real user sessions and Heatmaps to visualize taps, scrolls, and engagement.",
      "whyItMatters": "Watching real sessions and heatmaps reveals UX friction points that aggregate metrics alone can miss.",
      "benefitsWho": "UX researchers and product designers diagnosing usability issues in a mobile app."
    },
    {
      "title": "Extensibility",
      "toolA": "Matomo offers a plugin marketplace to extend functionality.",
      "toolB": "No plugin marketplace is documented for UXCam.",
      "whyItMatters": "A plugin ecosystem lets teams add capabilities without waiting on the vendor's own roadmap.",
      "benefitsWho": "Technical teams wanting to customize or extend their analytics platform's functionality."
    }
  ],
  "featureMatrix": [
    {
      "group": "Analytics Capabilities",
      "rows": [
        {
          "feature": "Session replay",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Heatmaps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Visitor profiles",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Funnel analytics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SEO tracking tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Matomo's Enhanced SEO feature"
        },
        {
          "feature": "AI-driven Q&A analyst",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UXCam's Tara AI"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UXCam: full feature access during trial"
        },
        {
          "feature": "Published pricing plans",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Matomo is custom/contact sales; UXCam requires a custom quote via form (up to 24-hour wait)"
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UXCam bases pricing on session volume"
        }
      ]
    },
    {
      "group": "Compliance & Platform",
      "rows": [
        {
          "feature": "GDPR/privacy-first positioning",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "ISO 27001:2022 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Plugin marketplace",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Tag manager",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Primary mobile app focus",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Matomo GDPR-compliant?",
      "answer": "Yes -- Matomo is positioned specifically around privacy and GDPR compliance, and it holds ISO 27001:2022 certification."
    },
    {
      "question": "Does UXCam publish its pricing?",
      "answer": "No, UXCam's pricing is usage-based and requires submitting a form for a custom quote, with a wait time of up to 24 hours."
    },
    {
      "question": "Does UXCam offer session replay?",
      "answer": "Yes -- UXCam's Session Replay feature lets teams watch real user sessions to observe natural app behavior."
    },
    {
      "question": "Is Matomo mainly for web or mobile analytics?",
      "answer": "Matomo is positioned as a web analytics platform and Google Analytics alternative; no mobile-app-specific focus is documented for it, in contrast to UXCam's mobile-first positioning."
    },
    {
      "question": "What is Tara AI?",
      "answer": "Tara AI is UXCam's built-in AI analyst that answers specific product questions in seconds by analyzing millions of data points from session and behavioral data."
    },
    {
      "question": "Is there a free trial for either tool?",
      "answer": "UXCam offers a free trial with full feature access before committing to a paid plan. Matomo's pricing model is listed as custom/contact sales, and no free trial is documented for it."
    }
  ]
};

export default matomoVsUxcamContent;
