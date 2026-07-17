import type { ToolComparisonContent } from './types';

const keysearchVsKeywordInsightsContent: ToolComparisonContent = {
  "verdict": "Keysearch and Keyword Insights both serve SEO/content teams doing keyword research, but they're built around different workflows: Keysearch is a flat-fee tool for keyword research, competitor analysis, rank tracking, site audits, and YouTube research aimed at indie publishers and small businesses; Keyword Insights is a credit-based tool centered on clustering keywords into topic groups and generating AI content briefs and drafts for teams building topical authority. Publishers wanting affordable rank tracking and audits may prefer Keysearch; content teams building topic clusters and AI-assisted briefs may prefer Keyword Insights.",
  "bestForToolA": "Best for indie publishers and small businesses wanting affordable, flat-fee keyword research, rank tracking, site audits, and YouTube keyword research — Keysearch starts at $24/month with a free 7-day trial and no credit card required.",
  "bestForToolB": "Best for content teams building topical authority who need keywords clustered into topic groups, AI-generated content briefs based on live search results and competitor analysis, and an AI writer with content grading — Keyword Insights integrates directly with Google Search Console and WordPress.",
  "whoNeedsBoth": "Content operations that both track rankings/technical health (Keysearch's audits and rank tracking) and produce AI-assisted content briefs at scale (Keyword Insights' clustering and briefs) may run both tools side by side, since neither's facts describe the other's core workflow.",
  "keyDifferences": [
    {
      "title": "Pricing model",
      "toolA": "Keysearch charges a flat monthly fee — Starter at $24/month, Pro at $48/month — with a free 7-day trial.",
      "toolB": "Keyword Insights uses credit-based pricing — Basic at $58/month for 10,000 credits, Professional at $99/month for 20,000 credits — with a $1 7-day trial including 5,000 one-time credits.",
      "whyItMatters": "Flat-fee pricing is more predictable for steady usage, while credit-based pricing can be consumed quickly by heavy use of content briefs or AI writing, per Keyword Insights' own stated cons.",
      "benefitsWho": "Budget-conscious teams estimating monthly spend, especially high-volume content producers."
    },
    {
      "title": "Core workflow: research/tracking vs. clustering/briefs",
      "toolA": "Keysearch centers on keyword research, competitor/backlink analysis, rank tracking, website audits, SERP analysis, and YouTube keyword research.",
      "toolB": "Keyword Insights centers on keyword clustering into topic groups, search intent analysis, AI content briefs generated from live search results and competitor analysis, and an AI Writer with content grading.",
      "whyItMatters": "The two tools solve different stages of an SEO workflow — Keysearch finds and tracks keywords/rankings, while Keyword Insights organizes keywords into content strategy and drafts content.",
      "benefitsWho": "Teams deciding whether they need a research/tracking tool or a content-planning/writing tool."
    },
    {
      "title": "Named third-party integrations",
      "toolA": "Keysearch's facts state no specific third-party integrations are mentioned on the site.",
      "toolB": "Keyword Insights integrates with Google Search Console and WordPress.",
      "whyItMatters": "Teams wanting a documented publishing/analytics integration have that confirmed for Keyword Insights but not for Keysearch.",
      "benefitsWho": "Teams wanting to push briefs or pull search data directly into their CMS/analytics stack."
    },
    {
      "title": "AI feature gating",
      "toolA": "Keysearch's Foresight AI Editor (keyword/content strategy suggestions based on site authority) is only included on the higher-priced Pro plan ($48/month).",
      "toolB": "Keyword Insights' AI Writer and content briefs are core features available from the entry Basic plan ($58/month), gated by credit consumption rather than plan tier.",
      "whyItMatters": "Keysearch gates its AI feature behind a plan upgrade, while Keyword Insights includes AI features at every tier but limits them by credit consumption instead.",
      "benefitsWho": "Buyers deciding whether they'd rather pay more for AI access via a plan upgrade or manage AI usage via a credit budget."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Keyword research/discovery",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Keyword clustering into topics",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Rank tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Website/technical SEO audits",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI content briefs",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI writing assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Keyword Insights: AI Writer"
        },
        {
          "feature": "YouTube keyword research",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Keysearch: free 7-day; Keyword Insights: $1 7-day"
        },
        {
          "feature": "Flat monthly pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Keyword Insights uses credit-based pricing instead"
        },
        {
          "feature": "Entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "Keysearch: $24/month; Keyword Insights: $58/month"
        },
        {
          "feature": "Custom Enterprise tier",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Google Search Console integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "WordPress integration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Keysearch offer a free trial?",
      "answer": "Yes, a 7-day free trial with no credit card required."
    },
    {
      "question": "Does Keyword Insights have a free trial?",
      "answer": "Yes, a 7-day trial for $1 that includes 5,000 one-time credits across all features."
    },
    {
      "question": "How much does Keysearch cost?",
      "answer": "The Starter plan is $24/month, and the Pro plan, which includes the Foresight AI editor, is $48/month."
    },
    {
      "question": "How much do Keyword Insights' paid plans cost?",
      "answer": "The Basic plan is $58/month with 10,000 monthly credits, and the Professional plan is $99/month with 20,000 monthly credits; Enterprise pricing is custom."
    },
    {
      "question": "What happens after the Keyword Insights trial ends?",
      "answer": "Accounts convert to pay-as-you-go pricing unless the user subscribes to a paid plan; there are no automatic charges."
    },
    {
      "question": "What integrations does Keyword Insights support?",
      "answer": "It integrates with Google Search Console and WordPress."
    }
  ]
};

export default keysearchVsKeywordInsightsContent;
