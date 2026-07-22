import type { ToolComparisonContent } from './types';

const goatcounterVsMatomoContent: ToolComparisonContent = {
  "verdict": "GoatCounter is a lightweight, privacy-focused website analytics tool with support handled publicly via GitHub issues. Matomo is a more full-featured, privacy-first web analytics platform positioned as a Google Analytics alternative, offering visitor profiles, enhanced SEO tools, a tag manager, a plugin marketplace, and ISO 27001:2022 certification, with custom/contact-sales pricing. Both share a privacy and GDPR-conscious positioning, but Matomo documents a much broader feature set and formal compliance certification, while GoatCounter's documented strengths center on simplicity and transparent, community-visible support.",
  "bestForToolA": "Teams and individuals who want simple, privacy-focused analytics with GDPR-conscious consent guidance and don't need an extensive feature set — GoatCounter's own documented pros highlight that support requests are handled publicly on GitHub so past answers are searchable by future users.",
  "bestForToolB": "Organizations that need a comprehensive Google Analytics alternative with visitor profiles, SEO tooling, a tag manager, campaign URL building, and formal ISO 27001:2022 certification, and are prepared to contact sales for custom pricing.",
  "whoNeedsBoth": "There's no realistic scenario for running both simultaneously — they serve the identical job of privacy-focused web analytics for the same page views, so a team would choose one rather than run both in parallel.",
  "keyDifferences": [
    {
      "title": "Feature Depth",
      "toolA": "GoatCounter's documented features are limited to GDPR-focused consent handling guidance and public GitHub-based support.",
      "toolB": "Matomo documents a much wider feature set: visitor profiles, enhanced SEO tooling, a tag manager, a plugin marketplace, and a marketing campaign URL builder.",
      "whyItMatters": "Matomo positions itself as a full analytics platform, while GoatCounter's documented scope is narrower and simpler.",
      "benefitsWho": "Teams needing advanced analytics capabilities benefit from Matomo; teams wanting a minimal, low-overhead tool benefit from GoatCounter."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "GoatCounter's pricing model is Freemium but no specific starting price or plan details are documented.",
      "toolB": "Matomo's pricing model is \"Custom / Contact sales\" with no published price, and its documented cons note enterprise pricing is quote-based, making upfront cost comparison harder.",
      "whyItMatters": "Neither tool publishes fully transparent pricing in available facts, but buyers evaluating cost should expect to contact Matomo sales directly.",
      "benefitsWho": "Budget-planning teams need to factor in a sales conversation for Matomo, whereas GoatCounter's freemium model suggests some free usage tier exists."
    },
    {
      "title": "Support Model",
      "toolA": "GoatCounter's support is explicitly handled publicly via GitHub issues or email (support@goatcounter.com), a model the vendor highlights as making past answers searchable and useful to future users.",
      "toolB": "Matomo's support channels are not detailed beyond being listed as a site section; no public-issue-tracker support model is documented.",
      "whyItMatters": "GoatCounter's public support model is a distinctive, documented differentiator for self-service troubleshooting.",
      "benefitsWho": "Technical users who prefer searching public support history benefit from GoatCounter's GitHub-issues approach."
    },
    {
      "title": "Compliance Certification",
      "toolA": "GoatCounter documents GDPR-focused consent guidance but no formal third-party certification.",
      "toolB": "Matomo documents ISO 27001:2022 certification.",
      "whyItMatters": "Formal certification can be a procurement requirement for enterprise or regulated buyers.",
      "benefitsWho": "Enterprise buyers with security/compliance procurement checklists specifically benefit from Matomo's documented ISO 27001:2022 certification."
    },
    {
      "title": "Extensibility",
      "toolA": "GoatCounter has no documented plugin or extension marketplace.",
      "toolB": "Matomo documents an official plugin marketplace for extending functionality.",
      "whyItMatters": "Extensibility affects how much the platform can grow with an organization's evolving analytics needs.",
      "benefitsWho": "Organizations wanting to customize or extend their analytics platform over time benefit from Matomo's plugin marketplace."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Analytics",
      "rows": [
        {
          "feature": "Privacy-focused / GDPR-conscious analytics",
          "toolA": "available",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Visitor profiles",
          "toolA": "not-documented",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "SEO analytics tooling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Enhanced SEO feature"
        },
        {
          "feature": "Tag manager",
          "toolA": "not-documented",
          "toolB": "available",
          "note": null
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published pricing tiers",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "GoatCounter freemium with no listed price; Matomo custom/contact sales only"
        },
        {
          "feature": "Free usage tier",
          "toolA": "not-documented",
          "toolB": "not-documented",
          "note": "implied by GoatCounter's freemium model, not itemized"
        },
        {
          "feature": "Pricing model classification",
          "toolA": "available",
          "toolB": "available",
          "note": "GoatCounter is Freemium; Matomo is Custom / Contact sales"
        }
      ]
    },
    {
      "group": "Support & Compliance",
      "rows": [
        {
          "feature": "Public/community support channel",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GitHub issues"
        },
        {
          "feature": "Formal security certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ISO 27001:2022"
        },
        {
          "feature": "Plugin/extension marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": null
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are GoatCounter and Matomo both privacy-focused analytics tools?",
      "answer": "Yes — both are positioned around privacy and GDPR-conscious analytics. GoatCounter documents GDPR consent-notice guidance, while Matomo is positioned specifically as a privacy-first, GDPR-compliant Google Analytics alternative."
    },
    {
      "question": "Which has more features?",
      "answer": "Matomo documents a broader feature set, including visitor profiles, enhanced SEO tools, a tag manager, and a plugin marketplace. GoatCounter's documented features are narrower, centered on consent handling and public support."
    },
    {
      "question": "How do I get support for each?",
      "answer": "GoatCounter's support is explicitly public — open a GitHub issue or email support@goatcounter.com, with answers kept searchable for future users. Matomo's specific support channels aren't detailed beyond being listed as a site section."
    },
    {
      "question": "Does either have published pricing?",
      "answer": "Neither publishes a specific starting price in available facts. GoatCounter uses a Freemium model without a listed price point, while Matomo's pricing model is \"Custom / Contact sales.\""
    },
    {
      "question": "Is Matomo certified for security compliance?",
      "answer": "Yes, Matomo documents ISO 27001:2022 certification, which GoatCounter does not document an equivalent for."
    },
    {
      "question": "Would a team realistically run both tools together?",
      "answer": "No — since both solve the same core job of privacy-focused website analytics, a team would typically pick one rather than run both in parallel on the same site."
    }
  ]
};

export default goatcounterVsMatomoContent;
