import type { ToolComparisonContent } from './types';

const outlineVsTettraContent: ToolComparisonContent = {
  "verdict": "Outline and Tettra are both team wikis with AI question-answering, but Outline's open-source, self-hostable nature and flat per-team-size pricing ($10/$79/$249 per month) contrast with Tettra's per-user pricing ($8/user/month, 10-user minimum) and its Kai AI bot that searches Slack conversations in addition to wiki content. Notably, Tettra has no permanent free plan — only a 30-day trial — while Outline's pricing model is Freemium alongside a comparable 30-day trial for its cloud tiers.",
  "bestForToolA": "Teams that want the option to self-host on their own infrastructure, need public document sharing with a custom domain, or fit cleanly into Outline's flat per-team-size pricing brackets (1-10, 11-100, or 101-200 members).",
  "bestForToolB": "Teams that want an AI bot (Kai) that also searches Slack conversations, not just wiki docs, and a formal subject-matter-expert verification workflow to keep content accurate, and that are comfortable with per-user pricing above a 10-user minimum.",
  "whoNeedsBoth": "Organizations weighing self-hosting against a fully managed SaaS wiki, or wanting Slack-conversation search alongside document search, may need to trial both before deciding, since the two tools' core mechanics — hosting model, pricing structure, AI scope — differ rather than overlap.",
  "keyDifferences": [
    {
      "title": "Self-hosting option",
      "toolA": "Outline is open source and can be self-hosted on a team's own infrastructure in addition to the cloud-hosted plans.",
      "toolB": "Tettra's facts describe access only via a web app (app.tettra.co), with no self-hosting option mentioned.",
      "whyItMatters": "Self-hosting matters for teams with data-residency or infrastructure-control requirements.",
      "benefitsWho": "Engineering-heavy teams or organizations with strict data-control policies."
    },
    {
      "title": "Permanent free plan vs. trial-only",
      "toolA": "Outline's pricing model is Freemium, with a 30-day free trial for the cloud-hosted version.",
      "toolB": "Tettra's pricing model is explicitly 'Free Trial' — a 30-day trial with no permanent free plan afterward, and its Scaling plan requires a 10-user minimum.",
      "whyItMatters": "A permanent free tier lets very small teams use the product indefinitely at no cost; a trial-only model does not.",
      "benefitsWho": "Very small teams or individuals evaluating long-term free usage."
    },
    {
      "title": "Pricing structure by team size",
      "toolA": "Outline prices in three flat tiers by member-count bracket: Starter $10/month (1-10 members), Team $79/month (11-100), Business $249/month (101-200).",
      "toolB": "Tettra prices per user at $8/user/month with a 10-user minimum, so cost scales roughly linearly with headcount ($80/month minimum).",
      "whyItMatters": "Flat tiered pricing (Outline) can be cheaper for teams near the top of a bracket, while per-user pricing (Tettra) scales predictably but linearly.",
      "benefitsWho": "Finance teams modeling cost as headcount grows."
    },
    {
      "title": "AI bot search scope",
      "toolA": "Outline's AI question answering searches and answers based on the workspace's own documents.",
      "toolB": "Tettra's Kai AI bot answers teammate questions by searching both Tettra content and Slack conversations, and connects directly to Slack channels and DMs.",
      "whyItMatters": "Teams whose institutional knowledge lives partly in Slack threads benefit from an AI bot that can search that history too.",
      "benefitsWho": "Teams that rely heavily on Slack for day-to-day decisions and tribal knowledge."
    },
    {
      "title": "Formal content verification workflow",
      "toolA": "Outline's facts don't describe a formal subject-matter-expert verification process.",
      "toolB": "Tettra has an explicit verification workflow where subject matter experts verify accuracy, identify gaps, and approve edits.",
      "whyItMatters": "A structured verification workflow helps larger teams keep a growing wiki accurate over time.",
      "benefitsWho": "Teams with dedicated content owners responsible for documentation accuracy."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Self-hosted / open-source option",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Cloud-hosted option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Both: 30 days."
        },
        {
          "feature": "Permanent free plan",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Tettra explicitly has no permanent free plan; Outline's facts don't detail a free tier's specific caps."
        }
      ]
    },
    {
      "group": "AI & Knowledge Features",
      "rows": [
        {
          "feature": "AI question answering",
          "toolA": "available",
          "toolB": "available",
          "note": "Tettra's bot is named Kai."
        },
        {
          "feature": "AI bot searches Slack conversations",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Verification / fact-checking workflow",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Import from Google Docs / Notion / PDF",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "Outline: $10/month flat (1-10 members). Tettra: $8/user/month, 10-user minimum."
        },
        {
          "feature": "Pricing structure",
          "toolA": "available",
          "toolB": "available",
          "note": "Outline: flat tiers by team-size bracket. Tettra: per-user."
        },
        {
          "feature": "Enterprise / custom tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Outline: custom pricing above 200 users. Tettra: custom Enterprise plan."
        }
      ]
    },
    {
      "group": "Collaboration & Sharing",
      "rows": [
        {
          "feature": "Public sharing with custom domain/white-label",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Slack integration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Tettra: Scaling plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Outline be self-hosted?",
      "answer": "Yes, Outline is open source and can be self-hosted on your own infrastructure instead of using the cloud-hosted plans."
    },
    {
      "question": "Does Tettra have a permanent free plan?",
      "answer": "No — only a 30-day free trial with no credit card required; no free tier is available afterward."
    },
    {
      "question": "How is Outline priced?",
      "answer": "Starter is $10/month (1-10 members), Team is $79/month (11-100 members), and Business is $249/month (101-200 members), with custom pricing above 200."
    },
    {
      "question": "How is Tettra priced?",
      "answer": "The Scaling plan is $8/user/month with a 10-user minimum; Enterprise is custom-priced."
    },
    {
      "question": "What does Tettra's Kai AI bot do?",
      "answer": "It answers teammate questions inside Tettra or Slack by searching the knowledge base content."
    },
    {
      "question": "Does Outline have AI features?",
      "answer": "Yes, it supports asking questions about your documents to get direct AI answers."
    }
  ]
};

export default outlineVsTettraContent;
