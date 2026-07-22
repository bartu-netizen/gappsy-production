import type { ToolComparisonContent } from './types';

const juroVsLexionContent: ToolComparisonContent = {
  "verdict": "Juro is an independent, AI-native CLM founded in 2016 that emphasizes self-serve contract creation with unlimited users, workflows, and templates on every plan, plus direct ChatGPT and Claude integrations. Lexion is an AI-powered CLM founded in 2019 that is now part of Docusign, built around email-driven intake, no-code approval automation, and an AI-powered repository that automatically tracks key contract dates and terms. Both keep pricing entirely private, so the real differentiator for most buyers will be intake workflow and ecosystem fit rather than price.",
  "bestForToolA": "Legal teams that want sales, HR, finance, and procurement staff to self-serve contracts from legal-controlled templates, with unlimited users and workflows included on every plan and native ChatGPT/Claude integration.",
  "bestForToolB": "Operations teams across legal, sales, procurement, HR, and finance that want email-driven contract intake, no-code approval automation, and integration with Coupa procurement plus the backing of Docusign following its acquisition of Lexion.",
  "whoNeedsBoth": "This isn't a realistic combination — both are full contract lifecycle management platforms covering the same core job of creating, reviewing, and storing contracts, so an organization would typically select one as its system of record rather than running two overlapping CLMs in parallel.",
  "keyDifferences": [
    {
      "title": "Ownership and Company History",
      "toolA": "Juro was founded in 2016 and operates independently out of London, UK and Boston, MA.",
      "toolB": "Lexion was founded in 2019 and has since been acquired, now operating as part of Docusign.",
      "whyItMatters": "Buyers evaluating long-term product direction may weigh independent roadmap control against the resources and integration potential of being backed by a larger e-signature company.",
      "benefitsWho": "Procurement and legal ops leaders doing vendor risk assessments as part of a CLM selection process."
    },
    {
      "title": "Contract Intake Model",
      "toolA": "Juro relies on legal-controlled self-serve templates plus AI agents that handle contract intake, review, and redlining automatically.",
      "toolB": "Lexion captures contracts and requests through an email-driven intake workflow paired with no-code approval automation for routing and document generation.",
      "whyItMatters": "Teams whose contract requests originate mostly as emails may prefer a tool built around that channel, while teams standardizing on templates may prefer self-serve generation.",
      "benefitsWho": "Legal ops teams designing how sales, HR, and procurement submit contract requests."
    },
    {
      "title": "AI Feature Set",
      "toolA": "Juro's AI Extract and Operator capabilities let users query the contract repository in natural language, alongside AI Draft for contract creation.",
      "toolB": "Lexion's AI-powered repository automatically tracks key dates and terms extracted from contracts, and AI Contract Assist supports drafting and negotiation.",
      "whyItMatters": "Both apply AI to repository intelligence and drafting, but the specific mechanics (natural-language query versus automatic date/term extraction) affect how legal teams will actually use the data day to day.",
      "benefitsWho": "Legal and contracts teams that rely heavily on searching or auditing an existing contract repository."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "Juro integrates with Salesforce, HubSpot, Slack, Word, Docusign, Zapier, Google Drive, ChatGPT, Claude, and offers a REST API, though deeper Salesforce/HubSpot/Workday integrations cost extra.",
      "toolB": "Lexion integrates with Salesforce, HubSpot, Microsoft Word, Coupa, Slack, Microsoft Teams, and DocuSign, plus API access, and includes contract signature support as part of its own workflow.",
      "whyItMatters": "Only Lexion's documented integrations include Coupa (procurement) and native contract signature support, while only Juro's documented integrations include direct ChatGPT and Claude connections.",
      "benefitsWho": "Procurement-heavy organizations (Lexion's Coupa link) versus teams wanting AI-assistant integrations baked into their contract workflow (Juro)."
    },
    {
      "title": "Published Credentials and Recognition",
      "toolA": "Juro cites a G2 rating of 4.8/5, a Capterra rating of 4.9/5, SOC 2 Type 2 certification, and 99.9% platform uptime.",
      "toolB": "Lexion has been recognized with multiple G2 awards (Leader, Best Usability, Best Support/Enterprise) and a LegalTech Breakthrough Award, but the facts don't cite a specific star rating or uptime figure.",
      "whyItMatters": "Buyers who weigh third-party validation differently — numeric review scores versus named industry awards — will read these two credential sets differently.",
      "benefitsWho": "Procurement teams building a vendor comparison scorecard that requires citable evidence of platform quality."
    }
  ],
  "featureMatrix": [
    {
      "group": "Contract Creation & Review",
      "rows": [
        {
          "feature": "Self-serve legal-controlled templates",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Email-driven intake",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "No-code approval automation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in contract signature support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted drafting",
          "toolA": "available",
          "toolB": "available",
          "note": "Juro's AI Draft vs Lexion's AI Contract Assist"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Natural-language repository queries",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Juro's AI Extract and Operator"
        },
        {
          "feature": "Automatic key date/term extraction",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI negotiation assistance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Direct ChatGPT/Claude integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations & Ecosystem",
      "rows": [
        {
          "feature": "Salesforce and HubSpot integration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Procurement tool integration (Coupa)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "REST API access",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Unlimited users/workflows/templates on all plans",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a demo or sales contact"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Juro or Lexion?",
      "answer": "Neither publishes pricing. Juro's cost scales with monthly contract volume, AI features used, and integration complexity, billable in USD, GBP, or EUR. Lexion's pricing isn't disclosed on its site at all, so both require contacting sales for a quote."
    },
    {
      "question": "Is Lexion still independent from Docusign?",
      "answer": "No. Lexion's site announces it has joined Docusign, though it continues to operate under the Lexion name."
    },
    {
      "question": "Does Juro offer a free trial?",
      "answer": "No free trial or free plan is mentioned on Juro's site. Lexion also doesn't mention a free trial or free plan."
    },
    {
      "question": "Which tool integrates with Coupa?",
      "answer": "Lexion documents a Coupa integration for procurement workflows. Coupa is not listed among Juro's documented integrations."
    },
    {
      "question": "Does either platform limit the number of users?",
      "answer": "Juro explicitly includes unlimited users, unlimited workflows, and unlimited templates on all plans. Lexion's facts don't state whether user counts are capped or unlimited."
    },
    {
      "question": "What AI models or capabilities power each platform?",
      "answer": "Lexion states its AI was built at the Allen Institute for AI (AI2) and powers automatic contract analysis, key term/date tracking, and its Contract Assist feature. Juro's AI capabilities include AI Draft, AI intake and review agents, and AI Extract/Operator for the repository, without a named underlying model in the facts."
    }
  ]
};

export default juroVsLexionContent;
