import type { ToolComparisonContent } from './types';

const captivateVsRssComContent: ToolComparisonContent = {
  "verdict": "Captivate is a podcast hosting platform with no permanent free plan but IAB-certified analytics, a built-in AI assistant, and a website builder bundled into every paid tier starting at €17/month, with a 30-day full-access free trial. RSS.com offers a genuine unlimited free hosting tier plus much lower-priced paid plans ($11.99 and $18.75/month) that add dynamic ad insertion, AI transcripts, and even crypto payment monetization. The choice largely comes down to whether a podcaster wants to start completely free (RSS.com) or trial a fuller feature set with certified analytics from day one (Captivate).",
  "bestForToolA": "Podcasters who want IAB-certified analytics bundled into every plan plus a built-in AI assistant for transcripts, titles, show notes, and chapters, especially students, educational institutions, charities, or nonprofits eligible for Captivate's 25% discount.",
  "bestForToolB": "Podcasters who want to start entirely free with unlimited episodes and audio storage, or who want monetization options like crypto payments and an affiliate program not documented on Captivate.",
  "whoNeedsBoth": "Not realistic — a podcast's RSS feed lives with one host at a time, so podcasters switch between hosts rather than running two simultaneously. RSS.com even offers 6 months free specifically for podcasters switching from another host, which points toward migration rather than dual use.",
  "keyDifferences": [
    {
      "title": "Free Plan Availability",
      "toolA": "Captivate states it does not offer a permanently free tier; instead every plan includes a 30-day free trial with full platform access.",
      "toolB": "RSS.com's Local and Niche plan is free indefinitely, with unlimited episodes, unlimited audio storage, and basic analytics.",
      "whyItMatters": "A genuinely free tier lets hobbyist or early-stage podcasters host indefinitely without a spending decision, while a trial requires eventually paying or losing access.",
      "benefitsWho": "Hobbyist podcasters or those testing a new show idea before committing to a paid plan."
    },
    {
      "title": "Entry-Level Pricing",
      "toolA": "Captivate's paid tiers start at €17/month (Personal, up to 30,000 downloads/month), rising to €44/month (Professional, 150,000) and €90/month (Business, 300,000).",
      "toolB": "RSS.com's paid tiers start at $11.99/month (All in One Podcasting) and $18.75/month (Podcast Networks), notably cheaper and priced in USD rather than EUR.",
      "whyItMatters": "The pricing gap and currency difference matter for budget planning, especially for podcasters outside the Eurozone.",
      "benefitsWho": "Cost-sensitive podcasters comparing monthly hosting spend."
    },
    {
      "title": "Analytics Certification",
      "toolA": "IAB-certified analytics are included on every Captivate plan, including performance comparison and listener retention metrics.",
      "toolB": "RSS.com includes a real-time analytics dashboard on all plans; the facts don't state IAB certification for RSS.com's analytics.",
      "whyItMatters": "IAB certification is often required by advertisers and sponsors to trust download and listener numbers for ad buys.",
      "benefitsWho": "Podcasters pursuing sponsorships or ad deals that require certified download metrics."
    },
    {
      "title": "Monetization Breadth",
      "toolA": "Captivate offers membership subscriptions, tips, exclusive content, and early access features for supporters.",
      "toolB": "RSS.com offers programmatic ads, subscriptions, donations, an affiliate program, and crypto payments as monetization options.",
      "whyItMatters": "Podcasters exploring alternative monetization (like crypto payments or an affiliate program) have documented options only on one platform.",
      "benefitsWho": "Independent podcasters looking for a wider range of monetization mechanisms beyond subscriptions and tips."
    },
    {
      "title": "API and Team Access",
      "toolA": "The facts do not document API access or team member limits for Captivate.",
      "toolB": "RSS.com limits team member invitations to paid plans and restricts API access to its top Podcast Networks plan ($18.75/month), which also includes unlimited podcasts and unlimited team seats.",
      "whyItMatters": "Networks or agencies managing multiple shows and developers wanting programmatic access need to know which tier unlocks that capability.",
      "benefitsWho": "Podcast networks or agencies managing multiple shows under one account."
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting & Distribution",
      "rows": [
        {
          "feature": "Free hosting tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "RSS.com's Local and Niche plan is $0/month, unlimited episodes"
        },
        {
          "feature": "Automatic distribution to major platforms",
          "toolA": "available",
          "toolB": "available",
          "note": "Both cover Spotify, Apple Podcasts, YouTube, Amazon Music"
        },
        {
          "feature": "Unlimited podcasts on one account",
          "toolA": "available",
          "toolB": "limited",
          "note": "RSS.com's unlimited podcasts require the top Podcast Networks plan"
        },
        {
          "feature": "Website builder included",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "RSS.com restricts API to the Podcast Networks plan"
        }
      ]
    },
    {
      "group": "Monetization",
      "rows": [
        {
          "feature": "Dynamic ad insertion",
          "toolA": "available",
          "toolB": "limited",
          "note": "Free on all Captivate plans; RSS.com requires a paid plan, from 10 downloads"
        },
        {
          "feature": "Membership subscriptions/tips",
          "toolA": "available",
          "toolB": "available",
          "note": "RSS.com also offers donations and crypto payments"
        },
        {
          "feature": "Affiliate program",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Crypto payment support",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Analytics",
      "rows": [
        {
          "feature": "AI-generated transcripts/show notes",
          "toolA": "available",
          "toolB": "limited",
          "note": "RSS.com requires a paid plan for AI transcripts"
        },
        {
          "feature": "IAB-certified analytics",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Audio-to-video conversion",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Analytics migration from previous host",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Captivate have a free plan?",
      "answer": "No. Captivate states it does not offer a permanently free tier, but every plan includes a 30-day free trial with full platform access."
    },
    {
      "question": "Is RSS.com really free?",
      "answer": "Yes, the Local and Niche plan is free indefinitely, with unlimited episodes, unlimited audio storage, and basic analytics."
    },
    {
      "question": "Which platform has certified analytics?",
      "answer": "Captivate includes IAB-certified analytics on every plan. The facts don't state whether RSS.com's real-time analytics carry IAB certification."
    },
    {
      "question": "Can I accept crypto payments for my podcast?",
      "answer": "RSS.com documents crypto payments as one of its monetization options, alongside programmatic ads, subscriptions, donations, and an affiliate program. Crypto payments are not documented for Captivate."
    },
    {
      "question": "Which is cheaper for a growing show?",
      "answer": "RSS.com's paid tiers ($11.99 and $18.75/month) are priced lower than Captivate's (€17, €44, €90/month), though Captivate's tiers are structured around specific monthly download caps (30,000/150,000/300,000) while RSS.com's free tier advertises unlimited storage without a stated download cap."
    },
    {
      "question": "Is there an API for either platform?",
      "answer": "RSS.com includes API access on its top Podcast Networks plan ($18.75/month). API access is not documented for Captivate."
    }
  ]
};

export default captivateVsRssComContent;
