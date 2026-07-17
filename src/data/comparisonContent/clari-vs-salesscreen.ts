import type { ToolComparisonContent } from './types';

const clariVsSalesscreenContent: ToolComparisonContent = {
  "verdict": "Clari is an enterprise revenue orchestration platform combining forecasting (Forecast), pipeline inspection (Inspect), conversation intelligence (Copilot), and sales engagement (Groove) for cross-functional revenue teams, used by 1,500+ customers reportedly managing $5 trillion in revenue. SalesScreen is a gamification and activity-insight platform built around Scout AI and competitions, with a free 30-day Essentials trial and seat minimums starting at 10 users. They operate at different altitudes - strategic revenue forecasting versus frontline activity motivation - rather than competing head-to-head.",
  "bestForToolA": "Large, cross-functional revenue organizations (sales, RevOps, marketing, finance) that need unified forecasting, pipeline inspection, and conversation intelligence, and are prepared for a custom enterprise quote.",
  "bestForToolB": "Sales teams that want AI-driven early-warning activity signals (Scout AI) plus gamified competitions, with the option to start on a free 30-day Essentials trial.",
  "whoNeedsBoth": "A large enterprise RevOps org could run Clari for forecasting and pipeline inspection at the strategic level while deploying SalesScreen on the frontline sales floor for activity gamification and coaching - the two operate at different altitudes and address different parts of the revenue organization rather than duplicating each other.",
  "keyDifferences": [
    {
      "title": "Platform Category and Scope",
      "toolA": "Clari is a revenue orchestration platform spanning forecasting (Forecast), pipeline inspection (Inspect), conversation intelligence (Copilot), and sales engagement (Groove), unified through its Revenue Database (RevDB).",
      "toolB": "SalesScreen is a gamification and performance-coaching platform centered on Scout AI activity monitoring, competitions, missions, and recognition.",
      "whyItMatters": "These platforms address different problems - forecasting/pipeline accuracy versus frontline activity motivation.",
      "benefitsWho": "RevOps leaders needing forecasting accuracy (Clari) versus sales managers driving day-to-day activity (SalesScreen)."
    },
    {
      "title": "Pricing Access",
      "toolA": "Clari has no public pricing and requires a custom quote for all plans.",
      "toolB": "SalesScreen publishes a free 30-day Essentials tier and documents Scale/Pro entry requirements (10+ and 15+ users) even without listing exact per-user price.",
      "whyItMatters": "Self-serve trial access versus a required sales conversation changes how quickly a team can start evaluating.",
      "benefitsWho": "Smaller teams wanting to self-evaluate before entering an enterprise procurement process."
    },
    {
      "title": "Target Organization Size",
      "toolA": "Clari's pros cite 1,500+ customers managing a reported $5 trillion in revenue, positioned for large/enterprise cross-functional teams.",
      "toolB": "SalesScreen's plans scale down to a free Essentials tier before requiring 10+ users at Scale, making it accessible to smaller teams.",
      "whyItMatters": "Enterprise revenue orchestration platforms often carry more implementation overhead than smaller teams need.",
      "benefitsWho": "Smaller or mid-market sales teams not yet ready for enterprise-grade revenue orchestration."
    },
    {
      "title": "AI Focus Area",
      "toolA": "Clari's Revenue AI Agents monitor deals, flag risk, and support forecasting across the full sales cycle.",
      "toolB": "SalesScreen's Scout AI scans activity signals (calls, meetings, follow-ups, pipeline movement) specifically to catch risk before it shows up in revenue metrics.",
      "whyItMatters": "Deal-level AI across the full revenue cycle differs in scope from activity-level AI focused on frontline behavior.",
      "benefitsWho": "Teams deciding between deal-level AI oversight and activity-level early-warning signals."
    },
    {
      "title": "Analyst and Award Recognition",
      "toolA": "Clari was named a 2025 G2 Best Sales Software Winner and a Leader in Gartner's Magic Quadrant for Revenue Action Orchestration.",
      "toolB": "SalesScreen's cited validation is a customer outcome statistic (61% increase in middle performer KPIs) and a 99.5% uptime SLA on Enterprise, not a Gartner/G2 award.",
      "whyItMatters": "Top-tier analyst recognition and measurable customer outcomes are different forms of proof for procurement teams.",
      "benefitsWho": "Enterprise buyers who weight Gartner Magic Quadrant placement heavily in vendor selection."
    }
  ],
  "featureMatrix": [
    {
      "group": "Revenue Intelligence",
      "rows": [
        {
          "feature": "Forecasting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clari's Forecast module"
        },
        {
          "feature": "Pipeline / Deal Risk Inspection",
          "toolA": "available",
          "toolB": "available",
          "note": "Clari's Inspect vs. SalesScreen's Scout AI"
        },
        {
          "feature": "Conversation Intelligence",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clari's Copilot"
        },
        {
          "feature": "Sales Engagement / Prospecting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clari's Groove"
        }
      ]
    },
    {
      "group": "Gamification & Coaching",
      "rows": [
        {
          "feature": "Real-time Leaderboards / Competitions",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Recognition & Reward Store",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pro tier's customizable reward shop"
        },
        {
          "feature": "Coaching Tools",
          "toolA": "available",
          "toolB": "available",
          "note": "SalesScreen's Coaching and Scorecards is a $5/user/month add-on"
        }
      ]
    },
    {
      "group": "Buying Experience",
      "rows": [
        {
          "feature": "Published Pricing",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "SalesScreen: Essentials is free; Scale/Pro pricing not published"
        },
        {
          "feature": "Free Trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "30 days, no credit card"
        },
        {
          "feature": "Enterprise Uptime SLA",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "99.5%"
        },
        {
          "feature": "Analyst Recognition",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "2025 G2 Best Sales Software Winner, Gartner MQ Leader"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Clari and SalesScreen direct competitors?",
      "answer": "Not exactly. Clari is an enterprise revenue orchestration platform covering forecasting, pipeline inspection, and conversation intelligence, while SalesScreen is a gamification and activity-insight platform. They address different layers of sales performance management."
    },
    {
      "question": "Does Clari publish pricing?",
      "answer": "No, Clari has no public pricing and requires a custom quote. SalesScreen publishes a free 30-day Essentials tier, though its Scale and Pro plan pricing isn't published either."
    },
    {
      "question": "Which tool has forecasting?",
      "answer": "Clari has a dedicated Forecast module for pipeline and revenue forecasting. Forecasting is not documented as a SalesScreen feature; its focus is activity monitoring and gamification."
    },
    {
      "question": "Can a small sales team use Clari?",
      "answer": "Clari's pros emphasize enterprise customers (1,500+ managing a reported $5 trillion in revenue), suggesting it's positioned for larger organizations. SalesScreen offers a free Essentials tier more accessible to smaller teams before scaling to 10+ user plans."
    },
    {
      "question": "What third-party recognition does each platform have?",
      "answer": "Clari was named a 2025 G2 Best Sales Software Winner and a Leader in Gartner's Magic Quadrant for Revenue Action Orchestration. SalesScreen cites a specific customer result (61% increase in middle performer KPIs) rather than a comparable industry award."
    },
    {
      "question": "Does SalesScreen include conversation intelligence like Clari's Copilot?",
      "answer": "This is not documented as a SalesScreen feature. SalesScreen's AI focus (Scout AI) is on scanning activity data like calls, meetings, and pipeline movement rather than deep conversation transcription and analysis."
    }
  ]
};

export default clariVsSalesscreenContent;
