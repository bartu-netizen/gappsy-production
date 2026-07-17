import type { ToolComparisonContent } from './types';

const ordwayVsTabsContent: ToolComparisonContent = {
  "verdict": "Ordway and Tabs both automate subscription billing and revenue recognition for B2B companies, but they differ in scope and disclosed pricing. Ordway covers the full quote-to-cash workflow with a customer self-service portal and AI agentic workflows, but discloses no pricing at all. Tabs focuses more narrowly on billing, collections, and ASC 606 revenue recognition, with published entry pricing of $2,000/month and AI bundled into every tier at no extra cost.",
  "bestForToolA": "Ordway fits SaaS, AI, and fintech companies (per its own positioning) that want a full quote-to-cash platform including contract modification automation, SaaS metrics reporting (MRR/ARR, NDR, churn), and a customer self-service portal, and that are comfortable negotiating pricing directly.",
  "bestForToolB": "Tabs fits B2B companies with up to $5M in annual revenue and up to 100 active contracts (the Launch tier) that want fast implementation ('live in weeks, not quarters') and AI-included billing and collections automation without a lengthy quoting cycle.",
  "whoNeedsBoth": "There is no realistic scenario for running both simultaneously as core billing systems — they overlap directly on invoicing, collections, and revenue recognition, so a company would evaluate them as alternatives rather than complementary tools.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Ordway discloses no pricing information at all; the pricing_model is Custom/Enterprise with no plans or starting price published.",
      "toolB": "Tabs publishes its entry-level Launch tier at $2,000/month for up to $5M annual revenue and up to 100 active contracts, though Growth, Scale, and Enterprise tiers are custom-quoted.",
      "whyItMatters": "Partial pricing transparency lets buyers gauge whether a tool fits their budget before a sales call.",
      "benefitsWho": "Smaller or budget-conscious teams benefit from Tabs' published entry price for initial qualification."
    },
    {
      "title": "SaaS Metrics & Reporting Depth",
      "toolA": "Ordway includes dedicated SaaS metrics reporting covering MRR/ARR, net dollar retention, churn, and other subscription metrics.",
      "toolB": "Tabs offers real-time revenue analytics and custom reporting options, but its facts don't specifically name MRR/ARR/NDR/churn metrics.",
      "whyItMatters": "SaaS finance teams often need these specific named metrics for board reporting and investor updates.",
      "benefitsWho": "SaaS finance and RevOps teams needing named subscription metrics benefit from Ordway's explicit MRR/ARR/NDR/churn reporting."
    },
    {
      "title": "Customer Self-Service",
      "toolA": "Ordway provides a customer self-service portal where customers can manage billing and account details themselves.",
      "toolB": "Tabs' facts do not mention a customer-facing self-service portal; its focus is on internal billing, collections, and reporting workflows.",
      "whyItMatters": "A self-service portal reduces support overhead by letting customers handle routine billing tasks on their own.",
      "benefitsWho": "Companies wanting to reduce billing support tickets benefit from Ordway's self-service portal."
    },
    {
      "title": "AI Feature Cost",
      "toolA": "Ordway offers AI agentic workflows and a natural language interface for billing and metrics reporting, though pricing details for these features aren't disclosed.",
      "toolB": "Tabs explicitly states AI is included in every plan at no additional cost, used for billing workflow and collections automation.",
      "whyItMatters": "Whether AI is a bundled feature or a potential upsell affects total cost of ownership.",
      "benefitsWho": "Cost-conscious buyers benefit from Tabs' explicit no-extra-cost AI inclusion across all tiers."
    },
    {
      "title": "Implementation Speed",
      "toolA": "Ordway's facts describe automating the full quote-to-cash workflow to replace spreadsheet-based billing, without stating a specific implementation timeline.",
      "toolB": "Tabs positions implementation as fast, described as 'live in weeks, not quarters.'",
      "whyItMatters": "Implementation speed affects how quickly a finance team can realize value and stop relying on manual processes.",
      "benefitsWho": "Teams needing to go live quickly benefit from Tabs' stated weeks-not-quarters implementation timeline."
    }
  ],
  "featureMatrix": [
    {
      "group": "Billing & Revenue Recognition",
      "rows": [
        {
          "feature": "Subscription and usage-based billing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "ASC 606 revenue recognition",
          "toolA": "available",
          "toolB": "available",
          "note": "Ordway also names IFRS 15"
        },
        {
          "feature": "Automated invoicing and payment collection",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Contract/contract modification management",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Reporting & Self-Service",
      "rows": [
        {
          "feature": "SaaS metrics reporting (MRR/ARR/NDR/churn)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Customer self-service portal",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Custom reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tabs: add-on at higher tiers"
        }
      ]
    },
    {
      "group": "AI, Pricing & Access",
      "rows": [
        {
          "feature": "AI agentic workflows / natural language interface",
          "toolA": "available",
          "toolB": "available",
          "note": "Both include AI, differently scoped"
        },
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tabs Launch: $2,000/month"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "SOC 2 compliance",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Ordway or Tabs?",
      "answer": "It's not possible to fully compare, since Ordway publishes no pricing at all, while Tabs publishes its Launch tier at $2,000/month for up to $5M annual revenue. Ordway's actual cost is unknown until you contact sales."
    },
    {
      "question": "Does Ordway or Tabs include AI at no extra cost?",
      "answer": "Tabs explicitly states AI is included in every plan at no additional cost. Ordway also offers AI agentic workflows and a natural language interface, but its facts don't specify whether these are bundled or a paid add-on."
    },
    {
      "question": "Which tool has better SaaS metrics reporting?",
      "answer": "Ordway explicitly names MRR/ARR, net dollar retention, and churn reporting as a feature. Tabs offers real-time revenue analytics and custom reporting, but its facts don't name these specific SaaS metrics."
    },
    {
      "question": "Does either tool have a customer self-service portal?",
      "answer": "Ordway provides a customer self-service portal for customers to manage billing and account details. Tabs' facts don't mention a customer-facing self-service portal."
    },
    {
      "question": "How fast is implementation for each tool?",
      "answer": "Tabs is positioned as fast to implement, described as 'live in weeks, not quarters.' Ordway's facts don't state a specific implementation timeline."
    },
    {
      "question": "Is Tabs SOC 2 compliant? What about Ordway?",
      "answer": "Tabs is described as SOC 2 compliant with audit-ready controls. Ordway's facts don't mention SOC 2 or other specific compliance certifications."
    }
  ]
};

export default ordwayVsTabsContent;
