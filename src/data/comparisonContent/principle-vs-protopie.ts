import type { ToolComparisonContent } from './types';

const principleVsProtopieContent: ToolComparisonContent = {
  "verdict": "Principle is a macOS-only, one-time-purchase tool built around timeline-based animation and multi-screen app flows. ProtoPie is a no-code, freemium tool built around logic-driven interactions (variables, formulas, sensors, voice) targeting a much wider range of device targets including automotive and wearables. The two differ more in target complexity and platform reach than in being direct substitutes.",
  "bestForToolA": "macOS-based designers who want deep, custom timeline control over transitions and a one-time license instead of a subscription, working primarily on multi-screen mobile/web/desktop app flows.",
  "bestForToolB": "Teams prototyping logic-driven interactions across multiple device types (mobile, web, automotive HMI, TV, smartwatches, gaming) without writing code, especially where sensors, voice, or real data feeds are involved.",
  "whoNeedsBoth": "Design teams that prototype standard mobile app flows on Principle but also need to prototype cross-device or sensor-driven experiences (e.g., wearables or in-car interfaces) may keep both tools for different project types.",
  "keyDifferences": [
    {
      "title": "Platform availability",
      "toolA": "Native macOS app only, with no Windows or Linux editor; finished prototypes can be viewed via web link on Windows, Linux, macOS, Android, and iOS.",
      "toolB": "Not restricted to a single OS in the facts available, and explicitly targets automotive HMI, TV, smartwatches, and gaming interfaces in addition to mobile and web.",
      "whyItMatters": "Teams without a Mac-based design workflow, or those targeting non-standard device categories, are effectively limited to ProtoPie's broader target list.",
      "benefitsWho": "Design teams whose target device isn't a standard phone/web app, or that don't standardize on macOS."
    },
    {
      "title": "Pricing model",
      "toolA": "One-time $129 purchase with a free trial before buying; no recurring subscription fee.",
      "toolB": "Freemium with a free tier to start prototyping, but paid plan pricing is not published on the marketing site.",
      "whyItMatters": "Principle's cost is fully transparent and paid once; ProtoPie's true cost for paid features can't be evaluated without contacting sales.",
      "benefitsWho": "Budget-conscious individual designers or small teams who want to know the full cost upfront."
    },
    {
      "title": "Interaction complexity and inputs",
      "toolA": "Timeline-based custom animation curves and a multi-screen flow view for connecting app screens.",
      "toolB": "No-code logic using variables and formulas, native device sensors, voice interactions, and multi-/cross-device coordination.",
      "whyItMatters": "ProtoPie supports more complex, data-driven, or sensor-based interactions than Principle's timeline/transition-focused model documented here.",
      "benefitsWho": "Designers prototyping interactions that depend on real sensor input, voice, or logic beyond visual transitions."
    },
    {
      "title": "Collaboration and sharing",
      "toolA": "No team collaboration or commenting features are mentioned; prototypes are shared via a web link.",
      "toolB": "Shareable interaction recordings let teams record and share interactions via links for review.",
      "whyItMatters": "Teams that need built-in review workflows have a documented option in ProtoPie that isn't described for Principle.",
      "benefitsWho": "Design teams that review prototypes collaboratively rather than working solo."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Prototyping",
      "rows": [
        {
          "feature": "Timeline-based animation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No-code logic (variables/formulas)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Figma/Sketch import",
          "toolA": "available",
          "toolB": "available",
          "note": "ProtoPie's is described generically as \"design tool import.\""
        },
        {
          "feature": "Multi-screen flow view",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native device sensors / voice interactions",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platforms & Targets",
      "rows": [
        {
          "feature": "macOS native editor",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cross-platform prototype viewing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Automotive/TV/wearable/gaming targets",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Sharing",
      "rows": [
        {
          "feature": "Free trial or free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Principle offers a free trial before a one-time purchase; ProtoPie has a free tier."
        },
        {
          "feature": "Published paid pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Shareable interaction recordings",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What platforms does Principle run on?",
      "answer": "Principle is a native macOS app (Intel and Apple Silicon); shared prototypes can be viewed on the web from Windows, Linux, macOS, Android, and iOS."
    },
    {
      "question": "Is ProtoPie free?",
      "answer": "A free tier is available; paid plans exist but exact pricing isn't published on the marketing page."
    },
    {
      "question": "How much does Principle cost?",
      "answer": "Principle is a one-time $129 purchase, with options to renew or add seats."
    },
    {
      "question": "What can ProtoPie prototype beyond phone apps?",
      "answer": "Per the site, it supports automotive HMI simulations, TV, smartwatches, and gaming interfaces in addition to mobile and web."
    },
    {
      "question": "Can I import my existing Figma or Sketch files into Principle?",
      "answer": "Yes, Principle supports importing designs from both Figma and Sketch with intelligent merging."
    },
    {
      "question": "Do I need to code to use ProtoPie?",
      "answer": "No, it's built for no-code interactive prototyping using logic, variables, and formulas."
    }
  ]
};

export default principleVsProtopieContent;
