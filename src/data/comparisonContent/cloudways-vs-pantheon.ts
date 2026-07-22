import type { ToolComparisonContent } from './types';

const cloudwaysVsPantheonContent: ToolComparisonContent = {
  "verdict": "Cloudways and Pantheon both offer flexible, developer-oriented hosting, but they diverge sharply on cloud choice and free access. Cloudways lets users pick from five underlying cloud providers (DigitalOcean, Vultr, Linode, AWS, Google Cloud) and bundles an AI monitoring assistant (Copilot), but its free trial lasts only 3 days. Pantheon offers a genuinely free Silver workspace for development (2 sandbox sites) but requires a paid site plan starting at $55/month to go live, and supports WordPress, Drupal, and Next.js specifically rather than Cloudways' WordPress/WooCommerce/Laravel/Magento app scope.",
  "bestForToolA": "Teams that want to choose their own underlying cloud infrastructure provider, need an AI-assisted monitoring/troubleshooting tool (Copilot) bundled with hosting, and prefer pay-as-you-go pricing without a long-term contract.",
  "bestForToolB": "Teams building on WordPress, Drupal, or Next.js that want a standardized Dev/Test/Live workflow, a free sandbox environment for development, and are managing large site portfolios (Pantheon documents tooling for 1,000+ sites).",
  "whoNeedsBoth": "An agency managing a mixed portfolio of Laravel/Magento apps and multi-CMS client sites (WordPress, Drupal, Next.js) might use Cloudways for the former and Pantheon for the latter, since each documents application/CMS support the other doesn't.",
  "keyDifferences": [
    {
      "title": "Cloud provider choice",
      "toolA": "Cloudways lets users deploy on DigitalOcean, Vultr, Linode, AWS, or Google Cloud from one control panel.",
      "toolB": "Not documented as offering user-selectable underlying cloud providers.",
      "whyItMatters": "Being able to choose the underlying cloud provider can matter for data-residency, existing cloud spend commitments, or provider-specific performance needs.",
      "benefitsWho": "Teams with existing cloud provider relationships or region-specific hosting requirements."
    },
    {
      "title": "Free access model",
      "toolA": "Cloudways offers only a 3-day free trial, no credit card required.",
      "toolB": "Pantheon offers a free Silver workspace with 2 sandbox sites for ongoing development, though going live requires a paid site plan starting at $55/month.",
      "whyItMatters": "A free, ongoing sandbox supports longer development cycles than a short trial window.",
      "benefitsWho": "Developers who need extended time to build and test before committing to a paid plan."
    },
    {
      "title": "CMS/application scope",
      "toolA": "Cloudways supports WordPress, WooCommerce, Laravel, and Magento applications.",
      "toolB": "Pantheon supports WordPress, Drupal, and Next.js with a standardized Dev/Test/Live workflow across all three.",
      "whyItMatters": "Framework/CMS support determines whether either platform fits a team's existing stack at all.",
      "benefitsWho": "Development teams standardized on Drupal or Next.js (Pantheon) versus Laravel or Magento (Cloudways)."
    },
    {
      "title": "AI-assisted operations",
      "toolA": "Cloudways Copilot is an AI-powered server monitoring and troubleshooting assistant included with hosting plans, with credit allotments (e.g., 4 AI Copilot credits on Flexible Micro).",
      "toolB": "Not documented for Pantheon.",
      "whyItMatters": "AI-assisted monitoring can help smaller teams without dedicated DevOps staff catch and resolve server issues faster.",
      "benefitsWho": "Small teams without in-house server administration expertise."
    },
    {
      "title": "Uptime commitment and overage risk",
      "toolA": "Not documented as a specific uptime SLA for Cloudways; Autonomous plans add usage-based overage charges for disk, bandwidth, and autoscaling.",
      "toolB": "Pantheon documents a 99.9% SLO (99.95% SLA on Elite) and offers an Overage Protection add-on to avoid traffic-based overage costs.",
      "whyItMatters": "A documented uptime commitment and a way to avoid unexpected overage costs both affect predictability of reliability and billing.",
      "benefitsWho": "Teams that need a contractual uptime commitment or want to avoid surprise overage bills."
    }
  ],
  "featureMatrix": [
    {
      "group": "Infrastructure & Cloud Choice",
      "rows": [
        {
          "feature": "User-selectable cloud provider",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cloudways: 5 providers"
        },
        {
          "feature": "Isolated app containers",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Autoscaling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cloudways Autonomous plans"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI monitoring/troubleshooting assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cloudways Copilot"
        },
        {
          "feature": "Autopilot core/plugin updates",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free managed migration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cloudways bundles free managed site migration"
        }
      ]
    },
    {
      "group": "Workflow & CMS Support",
      "rows": [
        {
          "feature": "Dev/Test/Live workflow",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Command-line interface (CLI)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Supported CMS/frameworks",
          "toolA": "available",
          "toolB": "available",
          "note": "Cloudways: WordPress, WooCommerce, Laravel, Magento; Pantheon: WordPress, Drupal, Next.js"
        }
      ]
    },
    {
      "group": "Pricing & Reliability",
      "rows": [
        {
          "feature": "Free tier/sandbox",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Cloudways: 3-day trial only; Pantheon: free Silver workspace, 2 sandbox sites"
        },
        {
          "feature": "Documented uptime SLA",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pantheon: 99.9% SLO / 99.95% Elite SLA"
        },
        {
          "feature": "Overage protection option",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I choose my own cloud provider with either?",
      "answer": "Cloudways lets you deploy on DigitalOcean, Vultr, Linode, AWS, or Google Cloud from one dashboard. Pantheon doesn't document user-selectable cloud providers."
    },
    {
      "question": "Is there a free way to try either platform?",
      "answer": "Pantheon offers a free Silver workspace with 2 sandbox sites for development (though going live requires a paid site plan from $55/month). Cloudways offers only a 3-day free trial."
    },
    {
      "question": "Which CMS platforms does each support?",
      "answer": "Cloudways supports WordPress, WooCommerce, Laravel, and Magento apps. Pantheon supports WordPress, Drupal, and Next.js."
    },
    {
      "question": "Does either include AI features?",
      "answer": "Cloudways bundles Copilot, an AI-powered server monitoring and troubleshooting assistant, with credit allotments per plan. This isn't documented for Pantheon."
    },
    {
      "question": "Is there an uptime guarantee?",
      "answer": "Pantheon documents a 99.9% SLO (99.95% SLA on its Elite plan). No specific uptime SLA is documented for Cloudways."
    },
    {
      "question": "How can I avoid overage charges?",
      "answer": "Pantheon offers an Overage Protection add-on to avoid traffic-based overage costs. Cloudways' Autonomous plans add usage-based overage charges for disk, bandwidth, and autoscaling without a documented equivalent protection option."
    }
  ]
};

export default cloudwaysVsPantheonContent;
