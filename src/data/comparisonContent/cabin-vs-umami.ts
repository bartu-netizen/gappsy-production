import type { ToolComparisonContent } from './types';

const cabinVsUmamiContent: ToolComparisonContent = {
  "verdict": "Cabin and umami are both privacy-focused, cookie-free analytics tools with real free tiers, but they differ in emphasis: Cabin adds unique carbon-emissions reporting and EU-only data storage, while umami is open source with a self-hosting option and a free Hobby tier sized by event volume rather than website count.",
  "bestForToolA": "Teams that want sustainability-focused carbon emissions reporting alongside standard traffic analytics, or that specifically need data encrypted and stored exclusively in the EU.",
  "bestForToolB": "Teams that want the option to self-host for full control (or use umami's managed cloud), and that want a free tier sized by event volume (up to 100K events/month) rather than by website count.",
  "whoNeedsBoth": "A privacy-conscious agency managing many client sites might run umami self-hosted for high-volume clients needing cost control, and Cabin for clients that specifically want carbon reporting as a sustainability differentiator.",
  "keyDifferences": [
    {
      "title": "Self-hosting",
      "toolA": "Cabin's facts don't document a self-hosted option.",
      "toolB": "umami can be self-hosted or used via its managed cloud version.",
      "whyItMatters": "Self-hosting lets teams avoid recurring fees beyond server costs and keep data on infrastructure they control.",
      "benefitsWho": "Technical teams wanting full infrastructure control or to avoid per-event billing at scale."
    },
    {
      "title": "Carbon and sustainability reporting",
      "toolA": "Cabin tracks estimated carbon emissions related to website traffic.",
      "toolB": "umami's facts don't document a carbon reporting feature.",
      "whyItMatters": "Sustainability reporting is a distinguishing feature for teams marketing an eco-conscious brand.",
      "benefitsWho": "Sustainability-focused brands and teams that publish environmental impact data."
    },
    {
      "title": "Free tier structure",
      "toolA": "Cabin's free Basic tier covers 1 website with 30 days of retention and unlimited page views under fair use.",
      "toolB": "umami's free Hobby tier covers up to 100K events/month, 1 website, and 6 months of data retention.",
      "whyItMatters": "The tiers cap different things — Cabin caps by retention window, umami caps by event volume — which suits different traffic patterns.",
      "benefitsWho": "Low-traffic sites wanting longer retention (umami) vs. sites wanting unlimited volume within a shorter window (Cabin)."
    },
    {
      "title": "Data residency",
      "toolA": "Cabin data is encrypted and stored exclusively in the EU.",
      "toolB": "umami's facts don't document a specific data residency guarantee for its cloud plans.",
      "whyItMatters": "Guaranteed EU-only storage can matter for GDPR-sensitive procurement even before considering self-hosting.",
      "benefitsWho": "EU-based or EU-serving organizations with strict data residency requirements."
    },
    {
      "title": "Enterprise features",
      "toolA": "Cabin's facts list only Basic and Pro tiers, with no enterprise-specific compliance features like SSO documented.",
      "toolB": "umami's Enterprise tier adds SAML SSO and an uptime SLA.",
      "whyItMatters": "Larger organizations often require SSO for access management, which is a documented umami Enterprise feature but not documented for Cabin.",
      "benefitsWho": "Larger organizations with SSO/identity requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Analytics",
      "rows": [
        {
          "feature": "Cookie-free tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom events",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Unlimited page views (fair use)",
          "toolA": "available",
          "toolB": "limited",
          "note": "umami's tiers cap events per month (e.g. 100K on Hobby, 1M on Pro)."
        }
      ]
    },
    {
      "group": "Sustainability & Compliance",
      "rows": [
        {
          "feature": "CO2 / carbon emissions reporting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "GDPR/CCPA/ePrivacy/PECR compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "EU-only data storage",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Hosting & Plans",
      "rows": [
        {
          "feature": "Self-hosting option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Enterprise SSO",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Cabin support self-hosting?",
      "answer": "This isn't documented in Cabin's facts; it's offered as a hosted service with Basic (free) and Pro ($19/month) plans."
    },
    {
      "question": "Can umami be self-hosted?",
      "answer": "Yes — umami can be self-hosted or used via its managed cloud version."
    },
    {
      "question": "Which tool offers carbon emissions reporting?",
      "answer": "Cabin, which tracks estimated carbon emissions tied to website traffic as part of its sustainability focus."
    },
    {
      "question": "How do the free tiers differ?",
      "answer": "Cabin's free Basic tier includes 1 website with 30 days of retention and unlimited page views under fair use; umami's free Hobby tier includes up to 100K events/month with 6 months of retention."
    },
    {
      "question": "Which tool guarantees EU-only data storage?",
      "answer": "Cabin explicitly stores data exclusively in the EU with end-to-end encryption; this isn't documented for umami."
    },
    {
      "question": "Does umami offer SSO?",
      "answer": "Yes, SAML SSO is included on umami's Enterprise tier, along with an uptime SLA."
    }
  ]
};

export default cabinVsUmamiContent;
