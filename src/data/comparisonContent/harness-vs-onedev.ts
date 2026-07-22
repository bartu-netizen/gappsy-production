import type { ToolComparisonContent } from './types';

const harnessVsOnedevContent: ToolComparisonContent = {
  "verdict": "Harness and OneDev both cover CI/CD, but at very different scope and deployment models: Harness is a broad, modular software delivery platform spanning CI, CD/GitOps, an internal developer portal, feature flags, AI test automation, AI SRE, and cloud/AI cost management, with a free tier plus custom-priced Essentials and Enterprise tiers. OneDev is a self-hosted, all-in-one DevOps platform unifying Git hosting, issue tracking, pull requests, CI/CD, and package registries in a single free Community Edition, with a $6/user/month Enterprise Edition adding HA and security scanning.",
  "bestForToolA": "Harness fits organizations that want a modular, cloud-first delivery platform spanning CI, CD/GitOps, feature flags, AI-assisted testing/SRE, and cloud cost management, and that also value its Drone CI heritage (acquired 2020) for container-native builds.",
  "bestForToolB": "OneDev fits teams that want a single self-hosted server combining Git, issues, pull requests, CI/CD, and package registries (Docker, NPM, Maven, NuGet, PyPI, RubyGems, Helm) without paying for or integrating multiple separate tools, especially teams already comfortable managing their own infrastructure.",
  "whoNeedsBoth": "There is no realistic scenario for using both together — they overlap directly as end-to-end DevOps/delivery platforms, so a team would choose one as its primary Git-to-deployment pipeline rather than running both in parallel.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "Harness is a cloud-first, modular SaaS platform with an open-source starter option (Harness Open Source).",
      "toolB": "OneDev is self-hosted only, with no managed cloud offering found on its official site.",
      "whyItMatters": "Teams that specifically want to avoid managing their own DevOps infrastructure should lean toward Harness; teams that require full data control should lean toward OneDev.",
      "benefitsWho": "Infrastructure teams deciding between operational overhead (self-hosting) and vendor dependency (SaaS)."
    },
    {
      "title": "Platform Scope",
      "toolA": "Harness spans CI, Continuous Delivery & GitOps, an Internal Developer Portal, Feature Management & Experimentation, AI Test Automation, AI SRE, and cloud/AI cost management across 100+ integrations.",
      "toolB": "OneDev unifies Git, issues, pull requests, CI/CD, and package registries, plus automated Kanban boards and a service desk, in one product.",
      "whyItMatters": "Harness covers more of the delivery lifecycle (feature flags, cost management, developer portal) while OneDev focuses tightly on source control plus build/release plus package hosting.",
      "benefitsWho": "Platform engineering teams deciding whether they need a broad delivery suite or a tight Git+CI+packages core."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Harness's Free tier is documented, but Essentials and Enterprise tiers require contacting sales — no public dollar pricing.",
      "toolB": "OneDev's Community Edition is free and fully featured with CI/CD, package registries, code search, and SSO/2FA; Enterprise Edition is a published $6/user/month with a 12 user-month minimum order.",
      "whyItMatters": "OneDev discloses its paid tier price outright, letting teams budget without a sales call, while Harness requires a custom quote beyond the free tier.",
      "benefitsWho": "Budget-conscious engineering teams that want to know costs upfront before committing time to evaluation."
    },
    {
      "title": "Package Registry Support",
      "toolA": "Harness does not list built-in package registry hosting among its documented modules.",
      "toolB": "OneDev includes built-in registries for Docker, NPM, Maven, NuGet, PyPI, RubyGems, and Helm as part of the free Community Edition.",
      "whyItMatters": "Teams that want to avoid running separate artifact/package registry infrastructure get that natively in OneDev.",
      "benefitsWho": "Teams that publish internal packages and want registry hosting bundled with their Git/CI platform."
    },
    {
      "title": "Feature Flags & Experimentation",
      "toolA": "Harness includes a dedicated Feature Management & Experimentation module.",
      "toolB": "OneDev does not document feature flag or experimentation capabilities.",
      "whyItMatters": "Teams doing progressive rollouts or A/B testing need feature-flag tooling, which is native to Harness but absent from OneDev.",
      "benefitsWho": "Product engineering teams running controlled feature rollouts and experiments."
    }
  ],
  "featureMatrix": [
    {
      "group": "Source Control & Collaboration",
      "rows": [
        {
          "feature": "Git hosting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Issue tracking / Kanban boards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Pull request workflow",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Code search and symbol navigation",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "CI/CD & Delivery",
      "rows": [
        {
          "feature": "Continuous Integration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Continuous Delivery / GitOps",
          "toolA": "available",
          "toolB": "limited",
          "note": "OneDev provides CI/CD as code but not a dedicated GitOps CD module."
        },
        {
          "feature": "Feature flag management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Package registry hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OneDev: Docker, NPM, Maven, NuGet, PyPI, RubyGems, Helm."
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
          "note": "Harness Free for individuals/small teams; OneDev Community Edition free."
        },
        {
          "feature": "Published paid pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OneDev Enterprise: $6/user/month, 12 user-month minimum."
        },
        {
          "feature": "High availability / clustering",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "OneDev Enterprise Edition only."
        },
        {
          "feature": "AI-assisted testing/SRE",
          "toolA": "available",
          "toolB": "limited",
          "note": "Harness: AI Test Automation & AI SRE modules. OneDev: general AI user automation."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is OneDev a competitor to Harness?",
      "answer": "Yes, both are DevOps/delivery platforms with CI/CD at their core, though Harness is broader (feature flags, cost management, AI SRE) and cloud-first, while OneDev is a tighter, self-hosted-only Git+CI+packages platform."
    },
    {
      "question": "Can OneDev be used as a managed cloud service?",
      "answer": "No, OneDev is self-hosted only with no managed cloud offering found on its official site, unlike Harness which is cloud-first with an open-source starter option."
    },
    {
      "question": "How much does OneDev's paid tier cost?",
      "answer": "OneDev Enterprise Edition is $6 per user/month, with a minimum order of 12 user-months. Harness's paid Essentials and Enterprise tiers require contacting sales for pricing."
    },
    {
      "question": "Does Harness include package registry hosting like OneDev?",
      "answer": "Harness's documented modules do not include built-in package registry hosting. OneDev includes registries for Docker, NPM, Maven, NuGet, PyPI, RubyGems, and Helm in its free Community Edition."
    },
    {
      "question": "Which tool is free to use fully?",
      "answer": "OneDev's Community Edition is free and includes built-in CI/CD, package registries, code search, and SSO/2FA. Harness offers a Free tier for individuals and small teams, plus an open-source starter platform, but its fuller Essentials/Enterprise tiers are custom-priced."
    },
    {
      "question": "Is Harness connected to Drone CI?",
      "answer": "Yes, Harness acquired Drone.io in 2020 and continues to develop it as 'Drone by Harness,' giving Harness deep container-native CI heritage."
    }
  ]
};

export default harnessVsOnedevContent;
