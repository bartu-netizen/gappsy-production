import type { ToolComparisonContent } from './types';

const plausibleVsUmamiContent: ToolComparisonContent = {
  "verdict": "Plausible and Umami are both cookie-free, privacy-focused alternatives to Google Analytics, but the documented facts point them at different jobs. Plausible leans into being a lightweight, GA4-alternative with a dedicated security-practices page and a white-label option built for agencies managing multiple client sites — its own documentation frames the tradeoff honestly, noting it offers less granular, session-level detail than a full analytics suite like Google Analytics or Matomo. Umami leans into transparent, usage-based pricing and deployment flexibility: a genuinely free Hobby tier (up to 100K events/month) that isn't just a trial, clear numeric paid tiers ($20/mo for 1M events, $200/mo for 10M events), and an Enterprise tier with SAML SSO and an uptime SLA for larger organizations. Neither tool's documentation makes a case for deep, granular analytics — Plausible admits the limitation directly, and Umami's documented strengths are simplicity, self-hosting flexibility, and pricing structure rather than analytical depth. Choose Plausible if agency-style client reporting and a documented security posture matter most to you. Choose Umami if you want to know exactly what a free tier includes, need a clear price ladder as usage grows, or require enterprise controls like SSO and an SLA. Teams wanting both lightweight tracking and enterprise-grade access controls may find themselves evaluating both rather than picking one outright.",
  "bestForToolA": "Plausible fits agencies and consultancies that need white-label, multi-site client reporting plus a documented security posture, and that are comfortable with GA4 being the explicit benchmark it's measured against.",
  "bestForToolB": "Umami fits teams that want a transparent, numeric pricing ladder as traffic grows (including a genuinely free 100K-events/month tier) and organizations that need Enterprise-grade SAML SSO and an uptime SLA.",
  "whoNeedsBoth": "An agency managing client analytics under Plausible's white-label reporting while also running a self-hosted Umami instance for an internal or budget-sensitive project would reasonably end up using both rather than standardizing on one.",
  "keyDifferences": [
    {
      "title": "Pricing model clarity",
      "toolA": "Listed as Freemium, but no starting price or specific plan tiers are documented.",
      "toolB": "Listed as Paid (free trial available), yet a documented Hobby plan is $0/mo with published limits.",
      "whyItMatters": "Buyers comparing cost need to know exactly what a free tier includes before committing, not just a pricing category label.",
      "benefitsWho": "Budget-conscious teams and solo site owners benefit from Umami's documented free-tier specifics; Plausible's freemium claim requires checking pricing directly."
    },
    {
      "title": "Free tier depth",
      "toolA": "No pricing plans are documented, so specific free-tier limits are not confirmed.",
      "toolB": "Documented Hobby tier: up to 100K events/month, 1 website, 6-month data retention, at $0.",
      "whyItMatters": "A documented free tier with explicit caps lets a buyer self-qualify without contacting sales or guessing.",
      "benefitsWho": "Small sites, hobby projects, and early-stage startups benefit most from Umami's spelled-out free plan."
    },
    {
      "title": "Numeric paid pricing ladder",
      "toolA": "No paid plan pricing is documented (pricing_plans list is empty).",
      "toolB": "Documented tiers scale by event volume: $20/mo for 1M events, $200/mo for 10M events.",
      "whyItMatters": "Predictable, published pricing that scales with usage helps teams forecast analytics costs as traffic grows.",
      "benefitsWho": "Growing sites and teams that need to budget analytics spend in advance benefit from Umami's published ladder."
    },
    {
      "title": "Enterprise controls (SSO, SLA)",
      "toolA": "No enterprise tier or single sign-on capability is documented.",
      "toolB": "Enterprise tier documented with SAML SSO, an uptime SLA, onboarding support, and custom data retention.",
      "whyItMatters": "Larger organizations often require SSO for identity governance and an SLA for uptime guarantees before adopting a tool company-wide.",
      "benefitsWho": "IT and security teams at larger companies benefit from Umami's documented Enterprise controls."
    },
    {
      "title": "Agency / white-label reporting",
      "toolA": "Documented feature: white-label option with client reporting and multi-site management for agencies.",
      "toolB": "No white-label or agency-specific reporting feature is documented.",
      "whyItMatters": "Agencies managing analytics for multiple clients need branded, consolidated reporting rather than per-client manual exports.",
      "benefitsWho": "Marketing agencies and consultants managing multiple client websites benefit from Plausible's documented white-label option."
    },
    {
      "title": "Analytical depth vs. a full suite",
      "toolA": "Documented con: less granular, session-level detail than a full analytics suite like Google Analytics or Matomo.",
      "toolB": "No comparable statement about analytical depth is documented.",
      "whyItMatters": "Teams needing detailed session-level behavioral analysis should know upfront if a tool intentionally trades depth for simplicity.",
      "benefitsWho": "Teams that need only high-level, aggregate metrics are fine with Plausible's tradeoff; those needing deep session detail should look elsewhere for either tool based on current documentation."
    },
    {
      "title": "Positioning against Google Analytics",
      "toolA": "Documented pro: explicitly positioned and compared directly against Google Analytics 4.",
      "toolB": "Described generally as a Google Analytics alternative, without a documented direct GA4 comparison.",
      "whyItMatters": "A direct, explicit GA4 comparison signals the vendor has anticipated and addressed feature-parity questions migrating teams will ask.",
      "benefitsWho": "Teams actively migrating away from GA4 benefit from Plausible's documented head-to-head positioning."
    },
    {
      "title": "Security transparency",
      "toolA": "Documented pro: publishes a dedicated security-practices page.",
      "toolB": "No dedicated security-practices documentation is confirmed in the provided facts.",
      "whyItMatters": "A published security page lets security-conscious buyers vet data handling before adoption without opening a support ticket.",
      "benefitsWho": "Security and compliance-focused teams benefit from Plausible's documented transparency here."
    },
    {
      "title": "Self-hosting operational burden",
      "toolA": "Self-hosting is not addressed in the provided facts beyond the tool being open-source.",
      "toolB": "Documented con: the free self-hosted tier requires running and maintaining your own server.",
      "whyItMatters": "Self-hosting trades subscription cost for ops overhead — a real cost teams need to plan staffing and maintenance around.",
      "benefitsWho": "Teams with existing DevOps capacity can absorb Umami's documented self-hosting maintenance requirement; teams without it should weigh cloud plans instead."
    },
    {
      "title": "Dashboard simplicity messaging",
      "toolA": "Emphasizes a lightweight tracking script rather than dashboard simplicity specifically.",
      "toolB": "Documented feature: a simple analytics dashboard, described as a lightweight, straightforward analytics UI.",
      "whyItMatters": "Buyers who prioritize a fast learning curve want to know whether the emphasis is on script performance or on how easy the reporting UI itself is to read.",
      "benefitsWho": "Non-technical stakeholders who just need to read a dashboard benefit from Umami's documented UI-simplicity focus."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Open-source codebase",
          "toolA": "available",
          "toolB": "available",
          "note": "Both are explicitly described as open-source in their own descriptions."
        },
        {
          "feature": "Self-hosted deployment option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Umami's data explicitly states it can run self-hosted; Plausible's provided facts don't confirm this directly."
        },
        {
          "feature": "Managed cloud-hosted version",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Umami's data explicitly mentions 'Umami Cloud'; not confirmed in Plausible's provided facts."
        }
      ]
    },
    {
      "group": "Privacy & Compliance",
      "rows": [
        {
          "feature": "Cookie-free tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Confirmed in both tools' descriptions and, for Plausible, in its FAQ."
        },
        {
          "feature": "No personal data collection stated",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Explicitly stated as a Plausible feature; not specifically stated for Umami beyond general 'privacy-focused' framing."
        },
        {
          "feature": "Dedicated security-practices documentation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Listed as a Plausible pro; not confirmed for Umami."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier availability",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Plausible is labeled Freemium but no plan details are provided; Umami's Hobby plan is documented at $0/mo."
        },
        {
          "feature": "Published numeric paid tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Umami documents $20/mo and $200/mo tiers; no paid tier pricing is documented for Plausible."
        },
        {
          "feature": "Enterprise / custom pricing plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Umami's Enterprise tier is documented with custom pricing."
        }
      ]
    },
    {
      "group": "Team & Enterprise Features",
      "rows": [
        {
          "feature": "SAML SSO",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented on Umami's Enterprise tier only."
        },
        {
          "feature": "Uptime SLA",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented on Umami's Enterprise tier only."
        },
        {
          "feature": "Agency white-label / multi-site client reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented as a Plausible feature; not mentioned for Umami."
        }
      ]
    },
    {
      "group": "Analytics Depth & Dashboard",
      "rows": [
        {
          "feature": "Session-level / granular detail vs. full analytics suites",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Plausible's own documented con notes less granularity than Google Analytics or Matomo."
        },
        {
          "feature": "Simple analytics dashboard UI",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Explicitly listed as an Umami feature."
        }
      ]
    },
    {
      "group": "Performance & Tracking Script",
      "rows": [
        {
          "feature": "Lightweight tracking script called out explicitly",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Explicitly listed as a Plausible feature; Umami's description says 'fast' generally but doesn't document the script specifically."
        }
      ]
    },
    {
      "group": "Market Positioning",
      "rows": [
        {
          "feature": "Explicit head-to-head comparison vs. Google Analytics 4",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented as a Plausible pro; Umami is positioned as a general GA alternative without a documented direct GA4 comparison."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Plausible or Umami cheaper?",
      "answer": "Based on documented pricing, Umami is the more transparent option: it publishes a genuinely free Hobby tier (up to 100K events/month) plus numeric paid tiers at $20/mo and $200/mo. Plausible is labeled Freemium, but no specific starting price or plan details are documented, so a direct cost comparison isn't possible from the available facts."
    },
    {
      "question": "Can Umami be self-hosted?",
      "answer": "Yes — Umami can be self-hosted or used via the managed Umami Cloud version, per its own documentation, though the documented con is that the free self-hosted tier requires you to run and maintain your own server."
    },
    {
      "question": "Is Plausible cookie-free?",
      "answer": "Yes — Plausible is a privacy-friendly analytics tool that avoids cookies and personal data collection, according to its own documentation."
    },
    {
      "question": "Which tool is better for agencies managing multiple client websites?",
      "answer": "Plausible is the better documented fit for agencies, since it offers a white-label option with client reporting and multi-site management; this capability isn't documented for Umami."
    },
    {
      "question": "Which tool has better support for enterprise requirements like SSO?",
      "answer": "Umami is the documented choice for enterprise requirements: its Enterprise tier includes SAML SSO and an uptime SLA, features not documented for Plausible."
    },
    {
      "question": "Does either tool offer as much analytical depth as Google Analytics or Matomo?",
      "answer": "Plausible's own documentation acknowledges it offers less granular, session-level detail than a full analytics suite like Google Analytics or Matomo; Umami's documented facts don't address analytical depth directly, so no comparable claim can be confirmed for it."
    }
  ]
};

export default plausibleVsUmamiContent;
