import type { ToolComparisonContent } from './types';

const capsuleCrmVsOnepagecrmContent: ToolComparisonContent = {
  "verdict": "Capsule CRM and OnePageCRM take different approaches to the same small-business CRM problem. Capsule offers a genuine free plan and AI features like an AI Pipeline Generator and enrichment, but doesn't publish exact pricing for its paid tiers. OnePageCRM replaces the traditional dashboard with a single prioritized Action Stream to-do list, publishes transparent pricing starting at €8.95/user/month, and includes unlimited contacts on every tier, but has no permanent free plan.",
  "bestForToolA": "Small teams that want to start on a genuinely free plan (2 users, 250 contacts), need project management tied to deals, or want AI-assisted enrichment and pipeline generation, and are comfortable requesting a quote for paid-tier pricing.",
  "bestForToolB": "Sales teams that want a single prioritized action list instead of a dashboard, need unlimited contacts/deals/fields on every tier including the entry plan, and want transparent published pricing plus free bundled add-ons like a business card scanner and sales dialer.",
  "whoNeedsBoth": "An agency managing multiple small-business clients might use Capsule's free tier for very small clients while running OnePageCRM for reps who prefer an action-list workflow over a dashboard.",
  "keyDifferences": [
    {
      "title": "Free (non-trial) plan",
      "toolA": "Offers a free plan for up to 2 users with 250 contacts, 1 pipeline, and 5 custom fields.",
      "toolB": "Has no free (non-trial) plan — only a 21-day free trial with no credit card required.",
      "whyItMatters": "Teams wanting to run a CRM indefinitely at zero cost, without a trial deadline, can do so on Capsule but not OnePageCRM.",
      "benefitsWho": "Very small teams or solo users on a tight budget."
    },
    {
      "title": "Core workflow paradigm",
      "toolA": "Organizes work around customizable sales pipelines and project boards.",
      "toolB": "Centralizes leads into a single next-action to-do list (Action Stream) rather than a traditional dashboard.",
      "whyItMatters": "Reps who find pipeline dashboards overwhelming may work faster with a single prioritized action list; teams managing multi-stage projects may prefer Capsule's pipeline/project view.",
      "benefitsWho": "Solo reps and small sales teams choosing between an action-list workflow and a traditional pipeline view."
    },
    {
      "title": "Contact storage limits",
      "toolA": "Free plan is capped at 250 contacts; paid tiers scale to 30,000, 60,000, and 120,000 contacts by plan.",
      "toolB": "Stores unlimited contacts, deals, fields, and tags on every tier, including the entry Professional plan.",
      "whyItMatters": "Growing teams that don't want to think about contact caps at any tier may prefer OnePageCRM's unlimited-by-default model.",
      "benefitsWho": "Growing small businesses accumulating contacts quickly."
    },
    {
      "title": "AI feature type",
      "toolA": "Includes an AI Pipeline Generator, AI Business/Contact Enrichment, and AI meeting prep (beta).",
      "toolB": "Includes an AI route planner within the mobile app for planning sales visit routes.",
      "whyItMatters": "Capsule's AI targets data enrichment and pipeline setup; OnePageCRM's AI targets field-sales logistics. The right fit depends on whether the team needs data enrichment or route optimization.",
      "benefitsWho": "Capsule: teams needing enriched contact/company data. OnePageCRM: field reps doing in-person visits."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Does not publish exact per-user pricing for the Starter, Growth, or Advanced plans on its pricing page.",
      "toolB": "Publishes exact prices for all three tiers (Professional, Business, Max).",
      "whyItMatters": "Buyers who want to compare costs without contacting sales get a clearer answer from OnePageCRM.",
      "benefitsWho": "Budget-conscious buyers comparison-shopping before a sales call."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Approach & Features",
      "rows": [
        {
          "feature": "Free (non-trial) plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Capsule: 2 users, 250 contacts."
        },
        {
          "feature": "Unlimited contacts/deals/fields on every tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Capsule scales by tier (30k-120k contacts); OnePageCRM is unlimited on every plan."
        },
        {
          "feature": "Project management / project boards",
          "toolA": "available",
          "toolB": "limited",
          "note": "OnePageCRM gates advanced project delivery to the Business plan and above."
        },
        {
          "feature": "Mobile app",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI business/contact enrichment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI pipeline generation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI route planning for field sales",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Exact published pricing for all tiers",
          "toolA": "limited",
          "toolB": "available",
          "note": "Capsule's Starter/Growth/Advanced prices are not published."
        },
        {
          "feature": "Entry plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "OnePageCRM: €8.95/user/mo (annual, Professional)."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Capsule: 14-day. OnePageCRM: 21-day, no credit card."
        },
        {
          "feature": "Advanced automation",
          "toolA": "available",
          "toolB": "limited",
          "note": "OnePageCRM restricts advanced automation to the Max plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Capsule CRM have a free plan?",
      "answer": "Yes, free for up to 2 users with 250 contacts, 1 sales pipeline, and 5 custom fields."
    },
    {
      "question": "Does OnePageCRM offer a free trial?",
      "answer": "Yes, a 21-day free trial is available with no credit card required, but there is no permanent free plan."
    },
    {
      "question": "What is the Action Stream?",
      "answer": "OnePageCRM's core feature that turns contacts and leads into a single prioritized list of next actions instead of a standard dashboard."
    },
    {
      "question": "Does Capsule have AI features?",
      "answer": "Yes, including an AI Pipeline Generator, AI Business/Contact Enrichment, and AI meeting prep (beta)."
    },
    {
      "question": "How much do Capsule CRM and OnePageCRM cost to start?",
      "answer": "Capsule's paid-tier pricing isn't published (per-user price shown only after inquiry); OnePageCRM starts at €8.95/user/month (Professional, annual)."
    },
    {
      "question": "Does OnePageCRM include any free add-ons?",
      "answer": "Yes, a Sales Dialer, Business Card Scanner, and Lead Clipper are included at no extra cost."
    }
  ]
};

export default capsuleCrmVsOnepagecrmContent;
