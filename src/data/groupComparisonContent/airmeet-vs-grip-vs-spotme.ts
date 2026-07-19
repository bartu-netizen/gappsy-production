import type { GroupComparisonContent } from './types';

const airmeetVsGripVsSpotmeContent: GroupComparisonContent = {
  "verdict": "Airmeet, Grip and SpotMe all serve event organizers but target different scales and priorities: Airmeet is the most accessible of the three, publishing self-serve pricing and leaning on its AirGenie AI tools for webinar-style events, while Grip and SpotMe are enterprise platforms sold through custom quotes. Grip differentiates on AI-driven attendee matchmaking and modular onsite hardware for large trade shows and conferences, whereas SpotMe focuses on regulated, compliance-heavy industries like life sciences and prices its tiers independent of attendee count. Teams evaluating all three should weigh transparent self-serve pricing against deeper matchmaking and onsite capabilities or compliance-grade support that come with an enterprise sales process.",
  "bestFor": {
    "airmeet": "Teams that want a self-serve platform with published pricing and AI-assisted content for webinars and mid-size hybrid events.",
    "grip": "Large trade show and conference organizers who need best-in-class AI matchmaking and modular onsite exhibition tools.",
    "spotme": "Enterprise and life sciences organizations that need compliance-grade event technology with pricing that does not scale per attendee."
  },
  "highlights": [
    {
      "title": "Only one with published self-serve pricing",
      "description": "Airmeet lists a clear Premium Webinars tier starting at $167/month, while Grip and SpotMe require a sales conversation for every tier.",
      "toolSlugs": [
        "airmeet"
      ]
    },
    {
      "title": "AI matchmaking built over a decade",
      "description": "Grip's core product is AI-powered attendee matchmaking, refined since the company's 2014 founding and used by marquee names like Money 20/20 and Messe Frankfurt.",
      "toolSlugs": [
        "grip"
      ]
    },
    {
      "title": "Compliance-first for regulated industries",
      "description": "SpotMe's Onomi offering addresses compliant customer engagement for life sciences, a use case neither Airmeet nor Grip specifically targets.",
      "toolSlugs": [
        "spotme"
      ]
    },
    {
      "title": "Pricing that does not scale with attendees",
      "description": "SpotMe explicitly does not tie pricing to participant count, unlike Airmeet's tiers, which are capped by attendee volume.",
      "toolSlugs": [
        "spotme",
        "airmeet"
      ]
    },
    {
      "title": "Onsite hardware for physical events",
      "description": "Grip offers badge printing, entrance scanning, smart badges and location tracking for in-person and hybrid trade shows.",
      "toolSlugs": [
        "grip"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "statuses": {
            "airmeet": "available",
            "grip": "unavailable",
            "spotme": "unavailable"
          }
        },
        {
          "feature": "Pricing independent of attendee count",
          "statuses": {
            "airmeet": "unavailable",
            "grip": "not-documented",
            "spotme": "available"
          },
          "note": "Airmeet's Premium Webinars tier is capped at 100 attendees before requiring a higher plan; SpotMe states its pricing does not scale with participants."
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI content generation (summaries, blogs, social posts)",
          "statuses": {
            "airmeet": "available",
            "grip": "not-documented",
            "spotme": "not-documented"
          }
        },
        {
          "feature": "AI attendee assistant or chat",
          "statuses": {
            "airmeet": "not-documented",
            "grip": "available",
            "spotme": "not-documented"
          }
        },
        {
          "feature": "AI-powered attendee matchmaking",
          "statuses": {
            "airmeet": "not-documented",
            "grip": "available",
            "spotme": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Event Formats and Engagement",
      "rows": [
        {
          "feature": "Onsite or in-person event support",
          "statuses": {
            "airmeet": "available",
            "grip": "available",
            "spotme": "available"
          }
        },
        {
          "feature": "Lead retrieval and exhibitor scanning",
          "statuses": {
            "airmeet": "not-documented",
            "grip": "available",
            "spotme": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools has published pricing?",
      "answer": "Airmeet publishes clear self-serve tiers starting around $167/month. Grip and SpotMe are both fully custom-quote enterprise platforms with no public pricing."
    },
    {
      "question": "Which is best for AI-driven attendee matchmaking?",
      "answer": "Grip, whose platform is built around AI matchmaking as its core feature since the company was founded in 2014."
    },
    {
      "question": "Which is best suited for regulated industries like life sciences?",
      "answer": "SpotMe, which offers a dedicated Onomi product for compliant life sciences customer engagement."
    },
    {
      "question": "Can any of these run in-person or hybrid events?",
      "answer": "Yes. All three support hybrid or in-person formats, with Grip offering onsite hardware like badge printing and smart badges, and SpotMe and Airmeet supporting virtual, hybrid and in-person events from a single platform."
    },
    {
      "question": "Which is most affordable for a small or mid-size team?",
      "answer": "Airmeet, given its published Premium Webinars tier starting at $167/month, compared to Grip and SpotMe's custom enterprise quotes."
    },
    {
      "question": "Do any of these charge based on number of attendees?",
      "answer": "SpotMe explicitly states its pricing does not scale with participant count. Airmeet's tiers are tied to attendee capacity, and Grip's custom quotes typically factor in attendee volume."
    }
  ]
};

export default airmeetVsGripVsSpotmeContent;
