import type { ToolComparisonContent } from './types';

const espocrmVsOrocrmContent: ToolComparisonContent = {
  "verdict": "EspoCRM combines a free self-hosted edition with a fully published, tiered cloud pricing model (€12.90-€59/user/month) and 2,000+ documented integrations, suiting teams that want cost predictability. OroCRM is a Symfony-based, deeply customizable open-source CRM whose Community Edition source is public on GitHub, with an Enterprise edition for organizations that need more, but whose pricing isn't published, suiting technical teams comfortable with a quote-based upgrade path.",
  "bestForToolA": "Teams that want published, predictable cloud pricing from €12.90/user/month with a 30-day trial and a large, 2,000+ integration catalog.",
  "bestForToolB": "PHP/Symfony development teams that want deep framework-level customization of a free, GitHub-hosted Community Edition, with a path to an Enterprise edition for organizations needing more.",
  "whoNeedsBoth": "There's limited realistic overlap since both solve the same core CRM need, so teams would typically standardize on one rather than run both in production; the realistic scenario is a technical team self-hosting OroCRM's Community Edition for customization freedom while separately trialing EspoCRM's cloud plan to compare published pricing before deciding.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "EspoCRM publishes full per-user cloud pricing tiers with specific features per tier, from €12.90 to €59/user/month.",
      "toolB": "OroCRM only publishes its free Community Edition; Enterprise edition pricing is not publicly disclosed on Oro's official channels.",
      "whyItMatters": "Buyers comparing paid upgrade paths need to know upfront whether pricing is published or requires a sales conversation.",
      "benefitsWho": "Budget-conscious teams wanting to compare costs without contacting sales."
    },
    {
      "title": "Underlying Framework",
      "toolA": "EspoCRM's underlying framework isn't named in the facts, beyond documented deployment options (self-hosted or cloud on GCP, AWS, or Azure).",
      "toolB": "OroCRM is explicitly built on the Symfony PHP framework, enabling deep customization and extension.",
      "whyItMatters": "Development teams already skilled in Symfony can extend OroCRM more predictably.",
      "benefitsWho": "PHP/Symfony developers who want framework-level control."
    },
    {
      "title": "First-Party Cloud Hosting",
      "toolA": "EspoCRM has documented first-party cloud plans with specific storage and record limits per tier.",
      "toolB": "OroCRM's facts show only the self-hosted Community Edition, with no first-party cloud hosting plan documented.",
      "whyItMatters": "Teams without in-house hosting capability need a vendor-run cloud option.",
      "benefitsWho": "Teams without infrastructure to self-host."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "EspoCRM cloud plans document 2,000+ third-party integrations.",
      "toolB": "OroCRM's integration count isn't documented in the facts reviewed.",
      "whyItMatters": "A documented integration catalog reduces the risk of custom development for common connections.",
      "benefitsWho": "Teams needing broad, low-effort third-party connectivity."
    },
    {
      "title": "Adoption Proof Points",
      "toolA": "EspoCRM documents usage by 50,000+ companies across 163 countries.",
      "toolB": "OroCRM's facts don't include comparable adoption figures, relying instead on public GitHub availability as a trust signal.",
      "whyItMatters": "Adoption scale can be a proxy for product maturity and community support.",
      "benefitsWho": "Buyers weighing proof of wide real-world adoption."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM Capabilities",
      "rows": [
        {
          "feature": "Contact/lead/opportunity management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "360-degree customer view",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Workflow automation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Customizable reporting and dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Customization",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "First-party cloud-hosted option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "EspoCRM Cloud on GCP, AWS, or Azure."
        },
        {
          "feature": "Named underlying framework",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OroCRM: built on Symfony."
        },
        {
          "feature": "Docker-based self-hosting support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Ecosystem Transparency",
      "rows": [
        {
          "feature": "Published paid-tier pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "EspoCRM: €12.90-€59/user/month; OroCRM Enterprise pricing undisclosed."
        },
        {
          "feature": "Documented integration count",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "EspoCRM: 2,000+."
        },
        {
          "feature": "Free trial for paid tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "EspoCRM: 30-day cloud trial."
        },
        {
          "feature": "Public source code availability",
          "toolA": "available",
          "toolB": "available",
          "note": "OroCRM Community Edition is on GitHub under OSL-3.0; EspoCRM is described as free, self-hosted open source."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which publishes clearer pricing?",
      "answer": "EspoCRM publishes full per-user cloud pricing from €12.90 to €59/user/month. OroCRM only publishes its free Community Edition, and Enterprise pricing requires contacting Oro directly."
    },
    {
      "question": "What frameworks are these built on?",
      "answer": "OroCRM is explicitly built on the Symfony PHP framework. EspoCRM's underlying framework isn't named in the facts reviewed."
    },
    {
      "question": "Does either offer official cloud hosting?",
      "answer": "EspoCRM offers first-party cloud hosting on Google Cloud, AWS, or Azure with published plans. OroCRM's facts describe only self-hosted Community Edition deployment plus an Enterprise edition with no documented hosting details."
    },
    {
      "question": "Is source code publicly available for both?",
      "answer": "OroCRM's Community Edition source is published on GitHub under the OSL-3.0 license. EspoCRM is described as free and self-hosted open source without a specific repository license named in the facts."
    },
    {
      "question": "Which has more documented integrations?",
      "answer": "EspoCRM's cloud plans document 2,000+ third-party integrations. OroCRM's integration count isn't specified in the facts reviewed."
    },
    {
      "question": "Is there a free trial for paid features?",
      "answer": "EspoCRM's cloud plans include a 30-day free trial. OroCRM's facts don't mention a trial for its Enterprise edition."
    }
  ]
};

export default espocrmVsOrocrmContent;
