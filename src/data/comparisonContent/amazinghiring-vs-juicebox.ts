import type { ToolComparisonContent } from './types';

const amazinghiringVsJuiceboxContent: ToolComparisonContent = {
  "verdict": "AmazingHiring and Juicebox are both candidate sourcing tools, but they differ in scope and pricing transparency. AmazingHiring searches over 50 technical and developer networks -- GitHub, Stack Overflow, Kaggle, LinkedIn -- for tech-specific sourcing, with a free Chrome extension but no published pricing. Juicebox (PeopleGPT) searches a broader pool of 800M+ profiles from 30+ sources using natural language, with published tiers from a $0 Free plan to $179/month Growth, plus optional always-on AI sourcing agents at $199/agent/month. The right pick depends on whether sourcing needs are narrowly technical or broad, and whether published self-serve pricing matters.",
  "bestForToolA": "Technical recruiting teams sourcing specifically from developer communities like GitHub, Stack Overflow, and Kaggle, who want a free Chrome extension for quick candidate lookups.",
  "bestForToolB": "Recruiters wanting broad natural-language search across 800M+ profiles with published self-serve pricing starting at $99/month, plus optional autonomous AI sourcing agents.",
  "whoNeedsBoth": "A recruiting team hiring both engineers and non-technical roles might use AmazingHiring for deep technical-network sourcing while using Juicebox's broader PeopleGPT search and outreach automation for other departments, though the facts don't show these two products integrating with each other.",
  "keyDifferences": [
    {
      "title": "Search Scope and Technology",
      "toolA": "AmazingHiring searches over 50 technical and developer networks, including GitHub, Stack Overflow, Kaggle, and LinkedIn.",
      "toolB": "Juicebox's PeopleGPT lets recruiters search across 800M+ profiles from 30+ sources using natural-language queries with enriched candidate profiles.",
      "whyItMatters": "A narrower, developer-focused search index surfaces deeper technical signal, while a broader pool covers more roles outside engineering.",
      "benefitsWho": "Technical recruiters (AmazingHiring) versus generalist recruiting teams hiring across departments (Juicebox)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "AmazingHiring does not publish pricing on its website; a cons point explicitly notes this.",
      "toolB": "Juicebox publishes tiered pricing: Free at $0/seat, Starter at $99/month (1 seat), Growth at $179/month (up to 5 seats), and a custom Business tier.",
      "whyItMatters": "Published pricing lets teams self-serve a budget estimate without a sales call.",
      "benefitsWho": "Smaller recruiting teams or startups that want to try a tool before a sales conversation."
    },
    {
      "title": "AI Automation Depth",
      "toolA": "AmazingHiring's cons note it carries no explicit AI branding despite advanced search capabilities.",
      "toolB": "Juicebox offers dedicated AI agents that continuously search for candidates, learn from hiring patterns, and run outreach around the clock, available as a $199/agent/month add-on.",
      "whyItMatters": "Autonomous sourcing agents can run ongoing candidate discovery without a recruiter manually re-running searches.",
      "benefitsWho": "Recruiting teams wanting to automate repetitive top-of-funnel sourcing work."
    },
    {
      "title": "Candidate Pool Focus",
      "toolA": "AmazingHiring is centered on technical talent discoverable through developer-specific platforms.",
      "toolB": "Juicebox's 800M+ profile pool spans 30+ sources and is not limited to technical roles.",
      "whyItMatters": "Role diversity in hiring needs should drive which sourcing pool is more useful.",
      "benefitsWho": "Companies hiring primarily engineers versus companies hiring across many functions."
    },
    {
      "title": "ATS/CRM Integration Breadth",
      "toolA": "AmazingHiring offers ATS integrations, but the specific systems supported are not named in the available facts.",
      "toolB": "Juicebox names 41 ATS platforms and 21 CRMs it connects with, including Lever, Greenhouse, Ashby, Workday, and Bullhorn.",
      "whyItMatters": "Named integrations reduce implementation risk versus vague integration claims.",
      "benefitsWho": "Talent acquisition teams that need confirmed compatibility with their existing ATS before purchasing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sourcing & Search",
      "rows": [
        {
          "feature": "Natural-language candidate search",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Juicebox's PeopleGPT"
        },
        {
          "feature": "Developer/technical network search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GitHub, Stack Overflow, Kaggle, LinkedIn"
        },
        {
          "feature": "Direct contact info discovery",
          "toolA": "available",
          "toolB": "available",
          "note": "Juicebox uses a contact-credit system by plan"
        },
        {
          "feature": "Free browser extension",
          "toolA": "available",
          "toolB": "available",
          "note": "AmazingHiring's is explicitly free; Juicebox's free tier is unconfirmed for extension access"
        },
        {
          "feature": "Talent market insights",
          "toolA": "available",
          "toolB": "available",
          "note": "Juicebox's Talent Insights is available on Growth plan and above"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Juicebox Free plan: $0/seat/month with limited searches"
        },
        {
          "feature": "Published paid pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Juicebox Starter $99/mo, Growth $179/mo"
        },
        {
          "feature": "Custom enterprise tier",
          "toolA": "available",
          "toolB": "available",
          "note": "AmazingHiring's entire pricing is unpublished/custom; Juicebox's Business tier is custom"
        },
        {
          "feature": "AI agent add-on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Juicebox Agents: $199/agent/month"
        }
      ]
    },
    {
      "group": "Outreach & Integrations",
      "rows": [
        {
          "feature": "Automated outreach / email campaigns",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Autonomous AI sourcing agents",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Named ATS/CRM integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Juicebox: 41 ATS, 21 CRMs named"
        },
        {
          "feature": "Disclosed customer base",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AmazingHiring: 500+ TA teams including Talentful, Lilium, Bolt, Nortal"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How is Juicebox priced compared to AmazingHiring?",
      "answer": "Juicebox publishes tiered pricing from a $0 Free plan up to $179/month Growth and a custom Business tier. AmazingHiring does not publish pricing at all and requires contacting sales."
    },
    {
      "question": "Does AmazingHiring publish pricing?",
      "answer": "No, based on available facts AmazingHiring's pricing is not published on its website."
    },
    {
      "question": "Is there a free plan for either tool?",
      "answer": "Juicebox offers a Free plan at $0/seat/month with limited searches and AI email templates. No free plan is documented for AmazingHiring, though it does offer a free Chrome extension."
    },
    {
      "question": "Which tool focuses more on technical/developer candidates?",
      "answer": "AmazingHiring, which searches over 50 technical and developer-specific networks like GitHub, Stack Overflow, and Kaggle."
    },
    {
      "question": "Does Juicebox have autonomous AI sourcing agents?",
      "answer": "Yes -- Juicebox Agents continuously search for candidates, learn from hiring patterns, and run outreach around the clock, available as a $199/agent/month add-on."
    },
    {
      "question": "Do both tools integrate with an ATS?",
      "answer": "Yes, though Juicebox names 41 ATS platforms and 21 CRMs it connects to, while AmazingHiring offers ATS integrations without naming the specific systems supported."
    }
  ]
};

export default amazinghiringVsJuiceboxContent;
