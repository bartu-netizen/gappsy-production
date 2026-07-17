import type { ToolComparisonContent } from './types';

const riveVsSplineContent: ToolComparisonContent = {
  "verdict": "Rive centers on a GPU-accelerated vector rendering engine and state-machine logic that ships as native runtimes across web, mobile, and game engines, with a built-in AI agent on paid plans. Spline centers on browser-based 3D scene design with physics, live data hooks, and a companion 2D tool (Hana), with AI 3D generation sold as a separate add-on. The two solve different design problems — interactive 2D vector graphics/UI motion versus 3D scene design — more than they compete head-to-head.",
  "bestForToolA": "Teams building interactive, resolution-independent 2D vector graphics and UI animations that need to run natively inside apps and game engines (Web, iOS, Android, Flutter, Unity, Unreal) via a single .riv file.",
  "bestForToolB": "Teams designing real-time 3D scenes with physics and interactivity for the web, who want native code export to React, Next.js, Swift, Kotlin, Webflow, Framer, or Wix Studio, plus a bundled 2D canvas tool.",
  "whoNeedsBoth": "Product teams building an app with both interactive 2D UI animation and embedded 3D scenes may use Rive for vector-based UI motion and Spline for 3D visual elements within the same product.",
  "keyDifferences": [
    {
      "title": "Rendering medium and primary use case",
      "toolA": "GPU-accelerated vector rendering engine (Rive Renderer, up to 120fps) driving interactive graphics via a State Machine.",
      "toolB": "Real-time 3D modeling with materials, physics, particles, and game-style controls.",
      "whyItMatters": "Choosing between these tools starts with whether the deliverable is 2D interactive vector graphics/UI or 3D scenes — they are not interchangeable outputs.",
      "benefitsWho": "Product and motion designers scoping what kind of visual asset they're building."
    },
    {
      "title": "Runtime and export targets",
      "toolA": "Open-source runtimes with native playback of .riv files across Web, iOS, Android, Flutter, React, React Native, Unity, and Unreal Engine.",
      "toolB": "Native export/code support for React, Next.js, Swift, Kotlin, Webflow, Framer, and Wix Studio, gated to the Professional plan and above.",
      "whyItMatters": "Rive's game-engine runtimes (Unity, Unreal) matter for interactive/gaming use cases that Spline's export list doesn't cover; Spline's Webflow/Framer/Wix export matters for no-code site builders that Rive doesn't list.",
      "benefitsWho": "Engineering teams selecting a tool based on where the final asset needs to run."
    },
    {
      "title": "AI feature packaging",
      "toolA": "A credit-metered AI agent for assisted editing is included on paid plans (Cadet and up), with an advanced-model option on Voyager.",
      "toolB": "AI 3D generation is a separate paid add-on (+$5/seat/month) with 2,000 monthly AI credits, not bundled into any base plan.",
      "whyItMatters": "Rive folds AI agent access into its paid tiers by default, while Spline treats AI generation as an optional upsell on top of any plan.",
      "benefitsWho": "Teams budgeting for AI-assisted design work who need to know whether it's included or an extra line item."
    },
    {
      "title": "Pricing ceiling and enterprise gating",
      "toolA": "Enterprise tier ($120/seat/month) requires $10M+ in annual company revenue to qualify.",
      "toolB": "Enterprise tier is custom-priced with no stated revenue requirement, adding SAML SSO, self-hosted exports, and centralized licensing.",
      "whyItMatters": "Smaller but well-funded teams could be excluded from Rive's Enterprise tier by the revenue gate regardless of budget, whereas Spline's Enterprise appears open to negotiation regardless of company size.",
      "benefitsWho": "Smaller companies or startups evaluating whether they even qualify for the top tier of either tool."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Design Capabilities",
      "rows": [
        {
          "feature": "2D vector/interactive graphics editor",
          "toolA": "available",
          "toolB": "available",
          "note": "Rive's core editor; Spline's Hana tool."
        },
        {
          "feature": "3D modeling and materials",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "State-machine / interaction logic",
          "toolA": "available",
          "toolB": "available",
          "note": "Rive's State Machine; Spline's states/events/timeline system."
        },
        {
          "feature": "Physics and particles",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Real-time collaboration",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platforms & Export",
      "rows": [
        {
          "feature": "Native game engine runtimes (Unity/Unreal)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native mobile app export (iOS/Android)",
          "toolA": "available",
          "toolB": "available",
          "note": "Spline's native Apple/Android exports require Professional plan or above."
        },
        {
          "feature": "No-code site builder export (Webflow/Framer/Wix Studio)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "React/code export",
          "toolA": "available",
          "toolB": "available",
          "note": "Spline's code export requires Professional plan or above."
        }
      ]
    },
    {
      "group": "Pricing & AI Add-ons",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Both free tiers are limited: Rive to 1 project/3 files, Spline to limited files with watermarked exports."
        },
        {
          "feature": "AI features included in base paid plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Spline's AI generation is a separate paid add-on."
        },
        {
          "feature": "Enterprise self-hosted exports",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Rive free to use?",
      "answer": "Yes, a free plan exists with 3 collaborative files, 1 project, and limited AI agent usage."
    },
    {
      "question": "Is Spline free?",
      "answer": "Yes, a free plan exists with limited files and watermarked web exports."
    },
    {
      "question": "What platforms can Rive content run on?",
      "answer": "Web, iOS, macOS, Android, Flutter, React, React Native, Framer, Webflow, Wix Studio, C++, Defold, Unity, and Unreal Engine."
    },
    {
      "question": "What platforms does Spline support?",
      "answer": "Web, iOS, and Android, plus integrations with Webflow, Framer, Wix Studio, React, Next.js, Swift, and Kotlin."
    },
    {
      "question": "Does Rive include AI features?",
      "answer": "Yes, paid plans include an agent with monthly credit allowances, or a bring-your-own-API-key option on Voyager."
    },
    {
      "question": "Does Spline include AI tools?",
      "answer": "An optional Spline AI add-on (+$5/seat/month) provides AI 3D generation and 2,000 monthly AI credits."
    }
  ]
};

export default riveVsSplineContent;
