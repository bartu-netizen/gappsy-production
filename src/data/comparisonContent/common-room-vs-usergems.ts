import type { ToolComparisonContent } from './types';

const commonRoomVsUsergemsContent: ToolComparisonContent = {
  "verdict": "Common Room and UserGems are both enterprise-priced GTM signal platforms with AI agents (RoomieAI vs. Gem-E) that identify and score buying opportunities, but they emphasize different data foundations. Common Room leans on unifying first-party CRM, product, and marketing data (Context360) with a stated 400M+ contact directory. UserGems leans on a documented count of 30+ native buying signals analyzed by Gem-E across 600+ signals, plus a money-back guarantee and a disclosed Starter Package for sub-80-employee companies. Entry pricing is close ($2,500/month vs. $2,750/month plus an implementation fee), and neither publishes a free plan.",
  "bestForToolA": "Organizations that want to unify first-party CRM, product usage, and marketing engagement data with external signals in one record, and that value seeing named enterprise customers (Squarespace, Zendesk, Atlassian, Okta, Notion, MongoDB, HubSpot) already running the platform.",
  "bestForToolB": "Smaller companies (UserGems offers a Starter Package for under 80 employees) or teams that want a stated money-back guarantee tied to revenue outcomes, transparent/customizable AI scoring via Gem-E, and website de-anonymization bundled into a mid-tier plan.",
  "whoNeedsBoth": "A large enterprise GTM org might use Common Room's Context360 to unify internal CRM/product data across teams while running UserGems' Gem-E scoring specifically for job-change and M&A-driven signals it wants scored against closed-won patterns.",
  "keyDifferences": [
    {
      "title": "Headquarters disclosure",
      "toolA": "Not disclosed in the facts.",
      "toolB": "San Francisco, CA, US.",
      "whyItMatters": "A disclosed HQ can factor into vendor-risk and data-residency reviews.",
      "benefitsWho": "Procurement teams doing vendor diligence."
    },
    {
      "title": "First-party data unification",
      "toolA": "Context360 unifies CRM, product, marketing, and engagement data with external buyer signals into one record.",
      "toolB": "Not documented as unifying first-party product/marketing data; focused on signal tracking and scoring.",
      "whyItMatters": "Unifying internal data sources with external signals gives a fuller picture of account activity than signals alone.",
      "benefitsWho": "RevOps teams trying to consolidate scattered first-party data sources."
    },
    {
      "title": "Signal count and scoring transparency",
      "toolA": "Signals feature tracks job changes, website visits, dark-funnel activity, and product-led sales signals, without a stated total count.",
      "toolB": "Tracks 30+ native buying signals; Gem-E analyzes 600+ signals and is described as transparent and customizable rather than a black box.",
      "whyItMatters": "A stated signal count and explicit transparency claim help buyers evaluate how the scoring model actually works.",
      "benefitsWho": "Teams that want to audit or customize how prospects get prioritized."
    },
    {
      "title": "Money-back guarantee",
      "toolA": "Not documented.",
      "toolB": "Offers a money-back guarantee tied to revenue generated from spend.",
      "whyItMatters": "A revenue-tied guarantee lowers the financial risk of a five-figure monthly commitment.",
      "benefitsWho": "Buyers wary of committing $2,750+/month without a performance backstop."
    },
    {
      "title": "Smaller-company pricing option",
      "toolA": "Not documented; Essential is the lowest disclosed tier at $2,500/month for 5 seats.",
      "toolB": "A Starter Package is available for companies under 80 employees, priced on request.",
      "whyItMatters": "A dedicated smaller-company package can make enterprise-grade signal tooling accessible below the standard entry tier.",
      "benefitsWho": "Startups and small companies that would otherwise be priced out."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI Agents & Signals",
      "rows": [
        {
          "feature": "AI agent for account/contact research",
          "toolA": "available",
          "toolB": "available",
          "note": "Common Room: RoomieAI; UserGems: Gem-E and Research Agent"
        },
        {
          "feature": "Buying signal tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "UserGems states 30+ native signals"
        },
        {
          "feature": "First-party data unification (CRM+product+marketing)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Common Room's Context360"
        },
        {
          "feature": "Stated contact directory size",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Common Room: 400M+ contacts"
        },
        {
          "feature": "Website de-anonymization",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on UserGems' Advanced plan"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry-level monthly price",
          "toolA": "available",
          "toolB": "available",
          "note": "Common Room $2,500/mo vs UserGems $2,750/mo plus a one-time implementation fee"
        },
        {
          "feature": "Smaller-company package",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UserGems Starter Package, under 80 employees"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom pricing above entry tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Company Transparency",
      "rows": [
        {
          "feature": "Headquarters disclosed",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Named enterprise customers disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Common Room: Squarespace, Zendesk, Atlassian, Okta, Notion, MongoDB, HubSpot"
        },
        {
          "feature": "Founding year disclosed",
          "toolA": "not-documented",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is RoomieAI?",
      "answer": "Common Room's set of AI agents that handle account research, contact research, and outreach personalization."
    },
    {
      "question": "What is Gem-E?",
      "answer": "UserGems' AI agent that analyzes signals and learns from closed-won deals to score and prioritize prospects."
    },
    {
      "question": "How much does Common Room cost?",
      "answer": "The Essential plan is $2,500/month billed annually for 5 seats; Advanced and Enterprise tiers use custom pricing."
    },
    {
      "question": "How much does UserGems cost?",
      "answer": "The Core plan starts at $2,750/month ($33,000/year); Advanced and Elite tiers cost $5,750/month and $10,000/month respectively."
    },
    {
      "question": "Is there a smaller UserGems plan for startups?",
      "answer": "Yes, a Starter Package is available for companies under 80 employees, priced on request."
    },
    {
      "question": "Where is UserGems based?",
      "answer": "San Francisco, CA, US. Common Room's headquarters is not disclosed."
    }
  ]
};

export default commonRoomVsUsergemsContent;
