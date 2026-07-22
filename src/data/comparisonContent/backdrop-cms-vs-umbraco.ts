import type { ToolComparisonContent } from './types';

const backdropCmsVsUmbracoContent: ToolComparisonContent = {
  "verdict": "Backdrop CMS and Umbraco are both open source, but sit at opposite ends of cost and infrastructure complexity. Backdrop is a completely free, GPL v2-licensed PHP CMS forked from Drupal 7 in 2013, purpose-built to run on modest or shared hosting with no paid tiers and no official managed-cloud offering. Umbraco is an MIT-licensed .NET CMS with a free self-hosted core plus a published, tiered managed-cloud product (Umbraco Cloud, €45 to €730/month, with custom Enterprise pricing) backed by the commercial company Umbraco A/S. Teams choose based on budget, hosting stack (PHP vs .NET), and whether a vendor-managed cloud path is wanted.",
  "bestForToolA": "Backdrop suits budget-conscious site owners or Drupal 7 shops wanting a fully free, no-paid-tier CMS with a built-in Drupal 7 upgrade path that runs on inexpensive shared hosting.",
  "bestForToolB": "Umbraco suits organizations on Microsoft/.NET infrastructure who want a transparent, tiered managed-cloud option starting at €45/month and a backoffice already localized into 20+ languages.",
  "whoNeedsBoth": "There's no practical scenario for running both on one project since they are competing full CMS platforms on incompatible stacks (PHP vs .NET). An agency that maintains both Drupal/PHP and .NET client bases might keep skills in each to match whichever stack a given client already runs.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Backdrop CMS is 100% free with no paid tiers or licensing fees of any kind.",
      "toolB": "Umbraco's core is free, but Umbraco Cloud adds paid managed-hosting tiers from €45/month (Starter) up to €730/month (Professional), plus custom Enterprise.",
      "whyItMatters": "Total cost of ownership differs sharply depending on whether managed hosting is needed.",
      "benefitsWho": "Budget-constrained organizations that want zero licensing or hosting-tier costs."
    },
    {
      "title": "Hosting Requirements",
      "toolA": "Backdrop is explicitly designed for fast performance even on modest or shared/budget hosting.",
      "toolB": "Umbraco's cons note self-hosting requires .NET hosting knowledge, unlike simpler PHP-based CMS options.",
      "whyItMatters": "Hosting complexity affects both setup cost and the technical skill needed to run the site.",
      "benefitsWho": "Small organizations without dedicated .NET infrastructure or DevOps staff."
    },
    {
      "title": "Tech Stack",
      "toolA": "Backdrop is PHP-based, forked from Drupal 7.",
      "toolB": "Umbraco runs on .NET/ASP.NET Core.",
      "whyItMatters": "Determines which developers and hosting providers can support the site long-term.",
      "benefitsWho": "Teams standardized on PHP hosting versus Microsoft/.NET infrastructure."
    },
    {
      "title": "Managed Cloud Offering",
      "toolA": "Backdrop has no official managed cloud hosting product; users must self-host or arrange third-party hosting.",
      "toolB": "Umbraco Cloud is a published managed hosting product on Microsoft Azure with automatic security updates and a Cloudflare CDN.",
      "whyItMatters": "A vendor-managed hosting path removes infrastructure maintenance burden but adds ongoing cost.",
      "benefitsWho": "Teams without in-house hosting/ops capacity who are willing to pay for managed infrastructure (Umbraco), versus those happy to self-host cheaply (Backdrop)."
    },
    {
      "title": "Governance Model",
      "toolA": "Backdrop is governed by a community Project Management Committee (PMC) modeled on Apache Software Foundation governance, and is a member project of the nonprofit Software Freedom Conservancy.",
      "toolB": "Umbraco is backed by the commercial company Umbraco A/S, owned by growth investor Monterro since 2021.",
      "whyItMatters": "Nonprofit community governance versus commercial company ownership affects long-term roadmap control.",
      "benefitsWho": "Organizations with procurement preferences for community-governed versus vendor-backed open source."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Cost",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Umbraco Cloud from €45/month"
        },
        {
          "feature": "Any paid pricing tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Umbraco: €45–€730/month plus custom Enterprise"
        }
      ]
    },
    {
      "group": "Hosting & Infrastructure",
      "rows": [
        {
          "feature": "Runs well on shared/budget hosting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Requires .NET hosting expertise",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Built-in Drupal 7 upgrade path",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Ecosystem & Support",
      "rows": [
        {
          "feature": "Community modules / add-ons",
          "toolA": "available",
          "toolB": "available",
          "note": "Backdrop: 1,300+ modules; Umbraco: add-ons suite for personalization, e-commerce, forms"
        },
        {
          "feature": "Nonprofit governance body",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Backdrop PMC + Software Freedom Conservancy membership"
        },
        {
          "feature": "Backoffice localized 20+ languages",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Backdrop CMS completely free, unlike Umbraco?",
      "answer": "Yes. Backdrop CMS has no paid tiers at all. Umbraco's core is also free, but its managed Umbraco Cloud hosting adds paid tiers from €45/month."
    },
    {
      "question": "Can Backdrop run on cheap shared hosting?",
      "answer": "Yes, Backdrop is specifically designed for fast performance on modest or shared/budget hosting. Umbraco's cons note that self-hosting requires .NET hosting knowledge, which is a heavier lift than simple PHP hosting."
    },
    {
      "question": "Does Backdrop offer a managed cloud product like Umbraco Cloud?",
      "answer": "No. Backdrop has no official managed cloud hosting product, so users must self-host or arrange third-party hosting. Umbraco Cloud is a published Azure-based managed hosting product starting at €45/month."
    },
    {
      "question": "Who governs each project?",
      "answer": "Backdrop is governed by a community Project Management Committee modeled on Apache Software Foundation governance and is a member project of the nonprofit Software Freedom Conservancy. Umbraco is backed by the commercial company Umbraco A/S, owned by growth investor Monterro since 2021."
    },
    {
      "question": "Can I migrate a Drupal 7 site to either platform?",
      "answer": "Backdrop has a built-in upgrade path from Drupal 7, since it was forked from Drupal 7 in 2013. This isn't applicable to Umbraco, which runs on an entirely different .NET stack."
    },
    {
      "question": "Which has bigger brand-name adoption?",
      "answer": "Umbraco cites brands including Domino's, Volvo, and Heineken. Backdrop's facts report roughly 3,600 known sites and under 3,000 community members, reflecting a smaller, budget-focused user base."
    }
  ]
};

export default backdropCmsVsUmbracoContent;
