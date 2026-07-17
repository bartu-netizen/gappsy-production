import type { ToolComparisonContent } from './types';

const wherebyVsZoomContent: ToolComparisonContent = {
  "verdict": "Whereby and Zoom solve overlapping but different jobs. Whereby is a lightweight, browser-based meeting tool built for guests who should never have to download software or create an account, which makes it a strong fit for client calls, small team standups, coaching sessions, and developers who want to embed live video directly into their own product through its API and SDK. Its free plan is genuinely usable for quick calls, though the 30 minute limit and single room mean regular users move to Pro or Business quickly. Zoom is a broader unified communications platform that bundles video conferencing with team chat and phone service, and its pricing and billing structure, including quarterly and multi-year prepaid enterprise options, is built for organizations that need to scale from a handful of users to 1,000 plus participant Enterprise meetings. Where Whereby documents concrete depth in recording, transcription, embedded whiteboards and documents, and compliance certifications like GDPR and ISO 27001, Zoom's documented strengths center on scale and unifying chat, phone, and video into one purchasing relationship. A small agency doing client demos or a startup embedding video into its own app leans toward Whereby. An organization standardizing all its internal and external communications, including phone lines, on one vendor leans toward Zoom. Neither replaces the other so much as they target different starting points: one browser link versus one company-wide platform.",
  "bestForToolA": "Whereby fits small teams, agencies, and client-facing businesses that want instant no-download meetings, plus developers who want to embed live video calling directly into their own product via its API and SDK.",
  "bestForToolB": "Zoom fits organizations that want one platform for video, team chat, and phone service, and that need flexible enterprise billing to scale meetings up to 1,000 plus participants.",
  "whoNeedsBoth": "A larger organization might standardize internal communications and phone service on Zoom while still using Whereby for lightweight client-facing calls or for embedding video directly into a customer-facing product.",
  "keyDifferences": [
    {
      "title": "Meeting access model",
      "toolA": "Whereby meetings run entirely in the browser over WebRTC, so guests join from a link with no app download or account",
      "toolB": "Zoom is primarily accessed through its downloadable desktop and mobile apps, with a reduced-feature browser join option",
      "whyItMatters": "Removing the download step lowers friction for one-off guests like clients or interview candidates, while a native app can offer a more complete feature set for regular users",
      "benefitsWho": "Whereby benefits businesses hosting external guests who should not have to install anything; Zoom benefits organizations whose users already have the app installed and use it daily"
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Whereby Pro starts at $10.99 per month covering the whole plan",
      "toolB": "Zoom Pro starts at $15.99 per user, per month",
      "whyItMatters": "Flat per-plan pricing versus per-seat pricing changes the total cost very differently as a team grows",
      "benefitsWho": "Whereby benefits small teams that want predictable flat pricing; Zoom benefits organizations comfortable with a per-seat model tied to headcount"
    },
    {
      "title": "Free plan limits",
      "toolA": "Whereby's free plan allows 1 host, 1 room, up to 4 attendees, and meetings capped at 30 minutes",
      "toolB": "Zoom's free Basic plan is capped at 40 minutes per meeting, described as a hard interruption rather than a soft limit",
      "whyItMatters": "Both free tiers are trial-like, but the specific caps determine whether a quick call or a longer weekly sync can fit inside the free tier",
      "benefitsWho": "Whereby's free tier benefits solo users making very short ad hoc calls; Zoom's free tier benefits users who occasionally need a slightly longer single session"
    },
    {
      "title": "Meeting capacity at scale",
      "toolA": "Whereby's paid plans document capacity up to 200 attendees on the Business plan",
      "toolB": "Zoom is documented as scaling from its free tier up to 1,000 plus participant meetings on Enterprise",
      "whyItMatters": "Organizations running large webinars, town halls, or broadcast-style events need headroom that small-meeting tools are not built for",
      "benefitsWho": "Zoom benefits organizations running large-scale broadcasts or town halls; Whereby benefits teams whose meetings stay within normal working-group sizes"
    },
    {
      "title": "Developer and embed API",
      "toolA": "Whereby Embedded is a documented API and SDK for integrating its video calling technology directly into a company's own website or app",
      "toolB": "Not documented in Zoom's provided facts",
      "whyItMatters": "A dedicated embed product matters to companies that want to build video calling into their own product rather than send users to a separate app",
      "benefitsWho": "Whereby benefits software teams building video features into their own product; this is not a documented differentiator for Zoom"
    },
    {
      "title": "Built-in collaboration tools",
      "toolA": "Whereby documents an embedded Miro whiteboard and real-time Google Docs collaboration inside the call",
      "toolB": "Not documented in Zoom's provided facts",
      "whyItMatters": "Having whiteboarding and shared documents inside the call removes the need to juggle separate tabs or apps during a working session",
      "benefitsWho": "Whereby benefits teams running collaborative workshops or brainstorms; not a documented advantage for Zoom"
    },
    {
      "title": "Unified communications scope",
      "toolA": "Whereby is positioned as a focused video meetings product",
      "toolB": "Zoom bundles video conferencing together with team chat and phone service on one platform",
      "whyItMatters": "Consolidating video, chat, and phone under a single vendor can simplify procurement and admin for larger organizations",
      "benefitsWho": "Zoom benefits organizations that want to standardize all communications on one vendor; Whereby benefits teams that just need a meetings tool without a chat or phone bundle"
    },
    {
      "title": "Compliance and security documentation",
      "toolA": "Whereby documents end-to-end encryption for peer-to-peer calls, GDPR compliance, ISO 27001 certification, and HIPAA-configurable options",
      "toolB": "Not documented in Zoom's provided facts",
      "whyItMatters": "Regulated industries such as healthcare or legal services often need documented certifications before adopting a tool",
      "benefitsWho": "Whereby benefits teams with explicit compliance requirements; Zoom's compliance posture is not addressed in the provided data"
    },
    {
      "title": "Custom branding",
      "toolA": "Whereby's Pro and Business plans add custom logos, colors, and a custom subdomain for meeting rooms",
      "toolB": "Not documented in Zoom's provided facts",
      "whyItMatters": "Client-facing businesses often want meeting links and rooms that visually match their own brand",
      "benefitsWho": "Whereby benefits agencies and client-facing teams; not a documented feature for Zoom"
    },
    {
      "title": "Enterprise billing flexibility",
      "toolA": "Whereby's plans are billed monthly with a discount available on annual billing",
      "toolB": "Zoom offers quarterly billing and 1 to 3 year prepaid packages through sales for larger enterprise contracts",
      "whyItMatters": "Multi-year prepaid options can matter to procurement teams locking in pricing for large deployments",
      "benefitsWho": "Zoom benefits enterprise buyers negotiating long-term contracts; Whereby's simpler monthly and annual model benefits smaller teams without a formal procurement process"
    }
  ],
  "featureMatrix": [
    {
      "group": "Meeting Access and Joining",
      "rows": [
        {
          "feature": "No-download browser join",
          "toolA": "available",
          "toolB": "limited",
          "note": "Zoom offers a reduced-feature browser join option but is primarily used through its downloadable app"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "Whereby offers lightweight iOS and Android apps; Zoom's mobile apps are widely used but not itemized in the provided facts"
        },
        {
          "feature": "Persistent reusable room links",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Whereby rooms have a fixed reusable URL for recurring meetings"
        }
      ]
    },
    {
      "group": "Recording and Transcription",
      "rows": [
        {
          "feature": "Cloud recording",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Local recording",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Transcription and live captions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Collaboration Tools",
      "rows": [
        {
          "feature": "Screen sharing",
          "toolA": "available",
          "toolB": "available",
          "note": "Core feature for both tools; Zoom's screen sharing is not itemized in the provided facts but is a well-established part of the product"
        },
        {
          "feature": "Breakout sessions",
          "toolA": "available",
          "toolB": "available",
          "note": "Whereby calls this breakout groups; Zoom's breakout rooms are well known but not itemized in the provided facts"
        },
        {
          "feature": "Embedded whiteboard and document collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Whereby integrates Miro whiteboards and Google Docs directly into the call"
        }
      ]
    },
    {
      "group": "Branding and Developer Tools",
      "rows": [
        {
          "feature": "Custom logo and color branding",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Whereby Pro and Business plans"
        },
        {
          "feature": "Custom subdomain for rooms",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Whereby's Business plan"
        },
        {
          "feature": "Embeddable video API and SDK",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Whereby Embedded lets developers integrate the video technology into their own site or app"
        }
      ]
    },
    {
      "group": "Team Communication Platform",
      "rows": [
        {
          "feature": "Team chat",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of Zoom's unified platform alongside video and phone"
        },
        {
          "feature": "Phone service",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Bundled under the same Zoom platform as video and chat"
        }
      ]
    },
    {
      "group": "Security and Compliance",
      "rows": [
        {
          "feature": "End-to-end encryption for peer-to-peer calls",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "GDPR compliance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "ISO 27001 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "HIPAA-configurable options",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Capacity",
      "rows": [
        {
          "feature": "Free plan availability",
          "toolA": "available",
          "toolB": "available",
          "note": "Whereby free plan: 1 host, 1 room, 4 attendees, 30-minute cap. Zoom free Basic plan: 40-minute hard cap"
        },
        {
          "feature": "Maximum documented meeting capacity",
          "toolA": "available",
          "toolB": "available",
          "note": "Whereby documents up to 200 attendees on Business; Zoom documents scaling up to 1,000 plus participants on Enterprise"
        },
        {
          "feature": "Enterprise or custom pricing tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Whereby's top documented plan is Business; Zoom offers a separate custom-priced Enterprise plan"
        },
        {
          "feature": "Flexible enterprise billing (quarterly, multi-year prepaid)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zoom offers quarterly and 1-3 year prepaid packages through sales"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Whereby or Zoom cheaper?",
      "answer": "Whereby's Pro plan starts at $10.99 per month flat, while Zoom's Pro plan starts at $15.99 per user per month, so Whereby is generally cheaper for a single host or very small team, though Zoom's relative cost depends heavily on how many users are on the plan."
    },
    {
      "question": "Which is easier for beginners and one-off guests, Whereby or Zoom?",
      "answer": "Whereby is generally easier for one-off guests because meetings run entirely in the browser with no download or account required, while Zoom is primarily used through its downloadable app for the full feature set."
    },
    {
      "question": "Can Zoom do what Whereby's embed API does?",
      "answer": "Not documented — the provided facts do not mention a Zoom equivalent to Whereby Embedded, which is a dedicated API and SDK for building video calling directly into another company's website or app."
    },
    {
      "question": "Which tool supports larger meetings, Whereby or Zoom?",
      "answer": "Zoom is documented as scaling up to 1,000 plus participants on its Enterprise tier, while Whereby's paid plans cap out at around 200 attendees on the Business plan, making Zoom the better documented fit for large webinars or town halls."
    },
    {
      "question": "Does Whereby's free plan or Zoom's free plan let you meet longer?",
      "answer": "Zoom's free Basic plan allows meetings up to 40 minutes before a hard cutoff, while Whereby's free plan caps meetings at 30 minutes with a single room and up to 4 attendees, so Zoom's free tier allows a slightly longer single session."
    },
    {
      "question": "Is Whereby or Zoom better for compliance-sensitive conversations like healthcare?",
      "answer": "Whereby documents end-to-end encryption for peer-to-peer calls, GDPR compliance, ISO 27001 certification, and HIPAA-configurable options, while Zoom's compliance certifications are not addressed in the provided facts, making Whereby the better documented choice for compliance-sensitive use cases based on the available data."
    }
  ]
};

export default wherebyVsZoomContent;
