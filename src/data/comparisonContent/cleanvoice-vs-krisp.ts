import type { ToolComparisonContent } from './types';

const cleanvoiceVsKrispContent: ToolComparisonContent = {
  "verdict": "Cleanvoice and Krisp both use AI to clean up audio, but they operate at different points in the workflow: Cleanvoice is a post-production editor that processes finished podcast recordings to remove filler words, mouth sounds, and silences, while Krisp works live, underneath any calling app, to cancel noise in real time and generate meeting notes afterward. They address different moments in the audio lifecycle rather than the same one.",
  "bestForToolA": "Podcast producers editing pre-recorded, multi-track episodes who want automated removal of filler words, mouth sounds, background noise, and dead air, plus a reference timeline for finishing in a DAW like Audacity or Adobe Audition.",
  "bestForToolB": "Professionals on live calls and meetings who need real-time noise cancellation and accent conversion during the call itself, plus automatic transcripts, summaries, and CRM-ready meeting notes afterward.",
  "whoNeedsBoth": "A podcast host recording live remote interviews could run Krisp during the call for real-time noise cancellation and accent conversion, then process the resulting audio file through Cleanvoice afterward to remove filler words and tighten pacing.",
  "keyDifferences": [
    {
      "title": "Post-production editing vs. live, real-time processing",
      "toolA": "Processes already-recorded audio/video files after the fact — removing filler words, mouth sounds, background noise, and silences from a finished recording.",
      "toolB": "Works underneath any calling app in real time during a live call, canceling noise and echo as the conversation happens.",
      "whyItMatters": "The two tools intervene at different points — one before you finish recording, one after — so they don't directly substitute for each other.",
      "benefitsWho": "Podcast editors working from finished files benefit from Cleanvoice; live meeting participants benefit from Krisp's real-time processing."
    },
    {
      "title": "Pricing model",
      "toolA": "Credit/usage-based — one-time packs valid for 2 years (from $11 for 5 hours) or monthly subscriptions billed per hour processed.",
      "toolB": "Per-user monthly subscription starting at $8/month/user (billed annually) for the Core plan.",
      "whyItMatters": "Usage-based packs suit infrequent, occasional use, while a per-seat subscription suits ongoing daily use by defined users.",
      "benefitsWho": "Infrequent podcasters benefit from Cleanvoice's long-lived credit packs; teams with regular daily callers benefit from Krisp's per-seat model."
    },
    {
      "title": "Meeting notes and CRM integration",
      "toolA": "Generates automatic transcripts and episode summaries alongside the edited audio, but no CRM integration is documented.",
      "toolB": "AI Note Taker produces meeting transcripts, summaries, and CRM-ready updates, with Salesforce/ConnectWise integration on the Advanced plan.",
      "whyItMatters": "Sales and customer-facing teams need meeting output that flows directly into their CRM.",
      "benefitsWho": "Sales and account teams benefit specifically from Krisp's CRM-connected meeting notes."
    },
    {
      "title": "Accent conversion",
      "toolA": "No accent conversion feature is documented.",
      "toolB": "Converts speaker or listener accents during live calls, with usage capped by plan (e.g., 1 hr/day on Core).",
      "whyItMatters": "Accent conversion is a live-call-specific feature relevant to international teams communicating in real time.",
      "benefitsWho": "Global support/sales teams doing live calls across accents benefit from Krisp's accent conversion."
    },
    {
      "title": "Compliance certifications stated",
      "toolA": "States ISO 27001 certification, with data stored in the EU and 7-day file retention.",
      "toolB": "States SOC 2, HIPAA, GDPR, and PCI-DSS compliance.",
      "whyItMatters": "Different regulated industries require different certifications — healthcare buyers, for instance, specifically look for HIPAA.",
      "benefitsWho": "Healthcare and payment-handling organizations benefit from Krisp's broader stated compliance list; EU-data-residency-focused buyers may note Cleanvoice's EU storage and ISO 27001 certification."
    }
  ],
  "featureMatrix": [
    {
      "group": "Audio Processing",
      "rows": [
        {
          "feature": "Filler word removal",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Background noise cancellation",
          "toolA": "available",
          "toolB": "available",
          "note": "Cleanvoice processes it post-production; Krisp cancels it in real time"
        },
        {
          "feature": "Mouth sound/breath removal",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Silence trimming",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time accent conversion",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multitrack/multi-speaker editing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Meeting Intelligence",
      "rows": [
        {
          "feature": "Transcription & summaries",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "CRM-ready meeting updates",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom vocabulary support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Krisp supports up to 750 custom terms"
        },
        {
          "feature": "Action item tracking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free trial/no-signup processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Cleanvoice: 30 minutes free with no signup; Krisp: free tier plus a 7-day trial of premium features"
        },
        {
          "feature": "Pricing model",
          "toolA": "available",
          "toolB": "available",
          "note": "Cleanvoice is credit/usage-based; Krisp is per-user/month"
        },
        {
          "feature": "Compliance certifications stated",
          "toolA": "available",
          "toolB": "available",
          "note": "Cleanvoice: ISO 27001; Krisp: SOC 2, HIPAA, GDPR, PCI-DSS"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Cleanvoice offer a free trial?",
      "answer": "Yes, you can process 30 minutes of audio or video for free without a credit card, plus 30 more minutes after signing up."
    },
    {
      "question": "Is Krisp free?",
      "answer": "Yes, Krisp offers a free tier plus a 7-day free trial of its paid Meeting AI features."
    },
    {
      "question": "How is Cleanvoice priced?",
      "answer": "Through one-time credit packs (from $11 for 5 hours) or monthly/yearly subscriptions (from $11/month for 10 hours), billed per hour of processed audio."
    },
    {
      "question": "How much does Krisp cost?",
      "answer": "The Core plan is $16/user/month ($8/month billed annually), and Advanced is $30/user/month ($15/month billed annually); Enterprise pricing is custom."
    },
    {
      "question": "What conferencing apps does Krisp work with?",
      "answer": "It works at the audio level with apps including Zoom, Google Meet, Microsoft Teams, Webex, and Discord calls."
    },
    {
      "question": "How long is my data stored with Cleanvoice?",
      "answer": "Files are retained for 7 days and then permanently deleted; data is stored in the EU and Cleanvoice is ISO 27001 certified."
    }
  ]
};

export default cleanvoiceVsKrispContent;
