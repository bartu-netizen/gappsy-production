import type { ToolComparisonContent } from './types';

const backdropCmsVsSilverstripeCmsContent: ToolComparisonContent = {
  "verdict": "Backdrop CMS and Silverstripe CMS are both free, open-source PHP CMS platforms, but differ in scale and commercial backing. Backdrop is a GPL v2-licensed fork of Drupal 7 from 2013, governed by a community Project Management Committee and Software Freedom Conservancy membership, with about 3,600 known sites and 1,300+ modules, and no official managed-cloud product. Silverstripe CMS, BSD-licensed since 2000 and backed by commercial company Silverstripe Limited in Wellington, New Zealand, claims 50,000+ live installations, 2,500+ modules, and an ISO/IEC 27001-certified Silverstripe Cloud hosting option, though its pricing is quote-based rather than published. The decision hinges on ecosystem scale, whether a managed-hosting product matters, and licensing preference.",
  "bestForToolA": "Backdrop suits smaller, budget-conscious teams, especially those migrating from Drupal 7, who want a no-code-friendly CMS that runs on modest shared hosting with zero paid tiers.",
  "bestForToolB": "Silverstripe CMS suits organizations wanting a larger module ecosystem (2,500+), a track record with enterprise names like Lenovo and Westpac, and the option of certified managed cloud hosting through Silverstripe Limited.",
  "whoNeedsBoth": "There's no realistic scenario for using both together since they're competing full CMS platforms for the same PHP-based website. An agency supporting many small-business clients might keep both in its toolkit, deploying Backdrop for lean budget sites and Silverstripe for larger sites needing its bigger module ecosystem.",
  "keyDifferences": [
    {
      "title": "License Type",
      "toolA": "Backdrop CMS is licensed under GPL v2 (or later), a copyleft license.",
      "toolB": "Silverstripe CMS is licensed under BSD, a permissive license.",
      "whyItMatters": "Copyleft versus permissive licensing affects how derivative code can be redistributed.",
      "benefitsWho": "Legal/procurement teams with specific open-source license requirements."
    },
    {
      "title": "Installation Base",
      "toolA": "Backdrop reports about 3,600 known sites.",
      "toolB": "Silverstripe.org reports over 50,000 live installations.",
      "whyItMatters": "A larger install base often means more third-party expertise, documentation, and battle-tested modules.",
      "benefitsWho": "Teams that want to hire from a larger existing talent pool of experienced developers."
    },
    {
      "title": "Managed Cloud Hosting",
      "toolA": "Backdrop has no official managed cloud hosting product.",
      "toolB": "Silverstripe Cloud offers ISO/IEC 27001-certified managed hosting via Silverstripe Limited, though pricing is quote-based, not publicly listed.",
      "whyItMatters": "A certified managed-hosting option can matter for compliance-sensitive organizations, even without published pricing.",
      "benefitsWho": "Enterprises needing certified hosting infrastructure and willing to request a quote."
    },
    {
      "title": "Module Ecosystem Size",
      "toolA": "Backdrop has 1,300+ modules and add-ons.",
      "toolB": "Silverstripe has 2,500+ community modules.",
      "whyItMatters": "A larger module library reduces custom development for common features.",
      "benefitsWho": "Teams that want to extend the CMS with pre-built modules rather than custom code."
    },
    {
      "title": "No-Code vs. Developer-Led Customization",
      "toolA": "Backdrop's features emphasize no-code content creation without programming knowledge.",
      "toolB": "Silverstripe's cons note it requires PHP development expertise to customize beyond out-of-the-box functionality.",
      "whyItMatters": "This affects how much a non-technical team can do without hiring developers.",
      "benefitsWho": "Small teams without dedicated PHP developers (Backdrop) versus teams with in-house PHP capability wanting deeper customization (Silverstripe)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Governance",
      "rows": [
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "available",
          "note": "Backdrop: GPL v2; Silverstripe: BSD"
        },
        {
          "feature": "Nonprofit/community governance",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Backdrop: PMC + Software Freedom Conservancy"
        },
        {
          "feature": "Commercial backer offering paid support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Silverstripe Limited"
        }
      ]
    },
    {
      "group": "Hosting & Deployment",
      "rows": [
        {
          "feature": "Runs well on modest/shared hosting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Official managed cloud hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Silverstripe Cloud, ISO/IEC 27001 certified, quote-based"
        },
        {
          "feature": "Built-in Drupal 7 upgrade path",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Ecosystem & Notable Users",
      "rows": [
        {
          "feature": "Community modules",
          "toolA": "available",
          "toolB": "available",
          "note": "Backdrop: 1,300+; Silverstripe: 2,500+"
        },
        {
          "feature": "Reported live installations",
          "toolA": "available",
          "toolB": "available",
          "note": "Backdrop: ~3,600 known sites; Silverstripe: 50,000+ live installs"
        },
        {
          "feature": "Named enterprise customers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lenovo, Westpac, Lord's Cricket Ground"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has more live installations, Backdrop or Silverstripe?",
      "answer": "Silverstripe reports over 50,000 live installations, while Backdrop reports about 3,600 known sites."
    },
    {
      "question": "Are both free and open source?",
      "answer": "Yes. Backdrop is GPL v2 (or later) licensed, and Silverstripe is BSD licensed. Both are free to self-host."
    },
    {
      "question": "Does either offer official managed hosting?",
      "answer": "Silverstripe Cloud exists as an ISO/IEC 27001-certified managed hosting product from Silverstripe Limited, though pricing requires a quote. Backdrop has no official managed cloud product."
    },
    {
      "question": "Which is easier for non-developers to use?",
      "answer": "Backdrop emphasizes no-code content creation without programming knowledge. Silverstripe's cons note it requires PHP development expertise to customize beyond default functionality."
    },
    {
      "question": "How many modules does each have?",
      "answer": "Backdrop has 1,300+ modules and add-ons; Silverstripe has 2,500+ community modules."
    },
    {
      "question": "What organizations use Silverstripe?",
      "answer": "Silverstripe cites Lenovo, Westpac, and Lord's Cricket Ground as users. Backdrop's facts don't document named enterprise customers."
    }
  ]
};

export default backdropCmsVsSilverstripeCmsContent;
