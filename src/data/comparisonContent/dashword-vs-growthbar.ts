import type { ToolComparisonContent } from './types';

const dashwordVsGrowthbarContent: ToolComparisonContent = {
  "verdict": "Dashword and GrowthBar both combine keyword-informed content creation with AI writing, but Dashword is priced higher ($99/month) and centers on pre-publish optimization scoring plus post-publish underperformance alerts inside a Google Docs workflow, while GrowthBar is priced lower ($36/month), leans on SERP-based AI drafting and competitor backlink/ad intelligence, and is mid-acquisition into SEOptimer. The right choice depends on budget, workflow, and whether ongoing content-decay monitoring matters.",
  "bestForToolA": "Content teams that want a Google Docs-native optimization workflow, automated alerts when published content's traffic drops, and can accommodate a $99+/month budget.",
  "bestForToolB": "Budget-conscious teams or WordPress publishers that want a lower $36/month entry point, a Chrome extension for in-editor writing, and competitor backlink/Google Ads intelligence alongside AI drafting.",
  "whoNeedsBoth": "Agencies managing both high-budget content-ops clients (where Dashword's monitoring and Docs integration fit) and cost-sensitive WordPress-based clients (where GrowthBar's lower price and extension fit) may run both rather than standardize.",
  "keyDifferences": [
    {
      "title": "Entry pricing",
      "toolA": "Dashword's Startup plan starts at $99/month.",
      "toolB": "GrowthBar's Standard plan starts at $36/month.",
      "whyItMatters": "For budget-limited teams or solo creators, GrowthBar's lower entry point is a much smaller commitment, while Dashword's higher starting price reflects a more content-ops-focused feature set.",
      "benefitsWho": "Solo bloggers and small teams with tight software budgets versus content teams that can justify a higher per-seat investment."
    },
    {
      "title": "Post-publish monitoring",
      "toolA": "Dashword includes content monitoring alerts that automatically flag when published content's traffic underperforms, plus keyword rank tracking with weekly reports.",
      "toolB": "GrowthBar's tracking is framed around competitive intelligence (competitor rankings, backlinks, Google Ads data) rather than automated underperformance alerts on your own published content.",
      "whyItMatters": "Teams that want to be proactively alerted when a piece of content starts losing traffic get that specific workflow from Dashword.",
      "benefitsWho": "Content teams managing large existing content libraries who need to catch decay before it compounds."
    },
    {
      "title": "AI writing capacity model",
      "toolA": "Dashword's AI writing is measured in words: 100k words on Startup, unlimited on the $349/month Business plan.",
      "toolB": "GrowthBar's AI writing is capped by article/paragraph counts: 25 articles/500 paragraphs on Standard, up to 300 articles/5,000 paragraphs on the $149.25/month Agency plan.",
      "whyItMatters": "Teams producing many short pieces may prefer GrowthBar's per-article structure, while teams producing longer content may find Dashword's word-based allowance more predictable.",
      "benefitsWho": "High-volume content teams comparing cost-per-article versus cost-per-word economics."
    },
    {
      "title": "Ownership and product stability",
      "toolA": "No acquisition or ownership change is mentioned for Dashword.",
      "toolB": "GrowthBar was acquired by SEOptimer and is being integrated into that platform, which its own cons note may bring future changes to the standalone product.",
      "whyItMatters": "Buyers evaluating long-term platform stability may weigh the risk of product changes from an ongoing acquisition and integration.",
      "benefitsWho": "Teams making a multi-year tooling commitment who care about roadmap stability."
    },
    {
      "title": "Editor integration",
      "toolA": "Dashword offers a Google Docs add-on bringing optimization scoring directly into that writing workflow.",
      "toolB": "GrowthBar offers a Chrome extension for in-editor WordPress writing and quick keyword lookups.",
      "whyItMatters": "Teams standardized on Google Docs get native scoring feedback from Dashword, while WordPress-centric teams get faster in-browser research and writing from GrowthBar.",
      "benefitsWho": "Writers whose workflow lives in Google Docs versus those publishing directly into WordPress."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Creation & Optimization",
      "rows": [
        {
          "feature": "Content brief builder",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time draft optimization scoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI content/draft generation",
          "toolA": "available",
          "toolB": "available",
          "note": "Dashword: AI writing add-on. GrowthBar: AI drafting from SERP analysis."
        },
        {
          "feature": "Brand voice training (custom AI model)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Research & Monitoring",
      "rows": [
        {
          "feature": "Keyword research with difficulty/value scores",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Keyword rank tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Content underperformance alerts",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Competitor backlink/ad analysis",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Workflow Integrations",
      "rows": [
        {
          "feature": "Google Docs integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Chrome extension",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Team collaboration / multi-user drafting",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry price per month",
          "toolA": "available",
          "toolB": "available",
          "note": "Dashword $99/month; GrowthBar $36/month."
        },
        {
          "feature": "API access",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Dashword reserves this for the $349/month Business plan."
        },
        {
          "feature": "Single Sign-On (SSO)",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Dashword reserves this for the $349/month Business plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How do Dashword and GrowthBar price their entry plans?",
      "answer": "Dashword's Startup plan is $99/month for 30 content reports, 5 seats, content briefs, and 100k words of AI writing. GrowthBar's Standard plan is $36/month for 25 AI articles, 500 AI paragraphs, and 2 user accounts."
    },
    {
      "question": "Which tool alerts you when published content underperforms?",
      "answer": "Dashword sends automated content monitoring alerts when a published piece's traffic underperforms. This isn't a documented GrowthBar feature."
    },
    {
      "question": "Does either tool have a free plan?",
      "answer": "Neither has an ongoing free plan. Dashword offers one free content report without a credit card; GrowthBar offers a 7-day free trial before its $36/month plans begin."
    },
    {
      "question": "Which tool integrates with Google Docs or WordPress?",
      "answer": "Dashword has a Google Docs add-on that brings optimization scoring into that writing workflow. GrowthBar has a Chrome extension for in-editor WordPress writing and keyword lookups."
    },
    {
      "question": "Has either company been acquired?",
      "answer": "GrowthBar was acquired by SEOptimer and is being integrated into that platform while continuing to operate as a standalone subscription product. No acquisition is mentioned for Dashword."
    },
    {
      "question": "Do they offer API access or SSO?",
      "answer": "Dashword reserves API access and Single Sign-On for its $349/month Business plan. These aren't documented among GrowthBar's plan features."
    }
  ]
};

export default dashwordVsGrowthbarContent;
