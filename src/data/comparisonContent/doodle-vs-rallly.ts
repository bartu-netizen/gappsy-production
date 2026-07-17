import type { ToolComparisonContent } from './types';

const doodleVsRalllyContent: ToolComparisonContent = {
  "verdict": "Doodle and rallly both let people create meeting polls without logging in, but Doodle is the more fully documented product, with 1:1 booking pages, calendar sync, Stripe payment collection, and a 4.8/5 rating on G2 and Capterra, while the available facts for rallly are limited mostly to its free Hobby/paid Pro pricing and its marketing angle as a direct Doodle alternative.",
  "bestForToolA": "Users who need more than a simple poll, 1:1 booking pages, calendar sync, timezone-aware scheduling, built-in Stripe payment collection, and time-protection rules for focus time, and who value Doodle's rated track record of 4.8/5 on G2 and Capterra.",
  "bestForToolB": "Casual users who just want a fast, no-login group poll and are comfortable with a documented free Hobby tier, where polls are automatically deleted once complete, versus a $56/year Pro tier that keeps polls longer.",
  "whoNeedsBoth": "Based on the available facts, there's no clear scenario requiring both, Doodle covers group polling plus a broader booking-page/payments feature set, while rallly's documented functionality centers on the same poll use case, so the choice is largely which poll tool a team prefers rather than needing both.",
  "keyDifferences": [
    {
      "title": "Breadth of documented features",
      "toolA": "Doodle's facts describe group polls, 1:1 booking pages, calendar sync, payment collection via Stripe, time protection rules, and cross-timezone support.",
      "toolB": "rallly's facts describe only one product feature beyond its poll/collaboration description: publishing direct comparison pages against Doodle and When2Meet.",
      "whyItMatters": "Doodle's facts document a broader feature set spanning both group scheduling and 1:1 bookings; the available rallly facts don't confirm equivalent booking-page, payment, or calendar-sync capabilities.",
      "benefitsWho": "Users who need more than basic poll creation, such as 1:1 bookings or payment collection, based on documented capabilities."
    },
    {
      "title": "Poll data retention",
      "toolA": "Doodle's facts do not describe a poll-retention policy.",
      "toolB": "rallly's Hobby tier automatically deletes polls once complete, while its Pro tier ($56/year) lets users keep polls longer.",
      "whyItMatters": "Teams that need to reference past poll results later would need rallly's paid tier or an equivalent retention feature elsewhere.",
      "benefitsWho": "Users who run recurring polls and want historical records."
    },
    {
      "title": "Reviewed reputation",
      "toolA": "Doodle is rated 4.8/5 on both G2 and Capterra, per its facts.",
      "toolB": "No review-platform ratings are documented for rallly in the available facts.",
      "whyItMatters": "Third-party review scores give buyers external validation; this is only documented for Doodle here.",
      "benefitsWho": "Buyers who weigh review-site ratings as part of their decision."
    },
    {
      "title": "Payment collection",
      "toolA": "Doodle integrates with Stripe to collect payment for booked meetings.",
      "toolB": "rallly's facts do not mention any payment-collection capability.",
      "whyItMatters": "Anyone monetizing bookings, such as paid consultations, needs documented payment support, which only Doodle confirms here.",
      "benefitsWho": "Consultants or service providers who charge for booked time."
    }
  ],
  "featureMatrix": [
    {
      "group": "Polling & Scheduling",
      "rows": [
        {
          "feature": "Group meeting polls (no login required)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "1:1 booking pages",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Calendar sync",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cross-timezone support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Payments & Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "rallly: Hobby, $0"
        },
        {
          "feature": "Published paid-tier pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Doodle: detailed pricing on a separate premium page, not the main site"
        },
        {
          "feature": "Payment collection for bookings",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Poll retention on paid tier",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Doodle and rallly both free to use?",
      "answer": "Yes. Doodle offers a free tier for creating scheduling polls without logging in, alongside paid premium plans. rallly's Hobby tier is free forever for casual use, with a paid Pro tier for more frequent use."
    },
    {
      "question": "What happens to polls after they're completed on rallly?",
      "answer": "On the Hobby tier, polls are automatically deleted once complete. The Pro tier ($56/year) lets users keep polls longer."
    },
    {
      "question": "Can Doodle collect payment for meetings?",
      "answer": "Yes, Doodle integrates with Stripe to collect payment for booked meetings. This capability is not documented for rallly."
    },
    {
      "question": "Where is Doodle based?",
      "answer": "Doodle describes itself as built in Switzerland. Headquarters information is not documented for rallly."
    },
    {
      "question": "How are these tools rated by users?",
      "answer": "Doodle is rated 4.8/5 on both G2 and Capterra. No equivalent rating is documented for rallly."
    },
    {
      "question": "Does rallly offer anything beyond poll scheduling?",
      "answer": "The available facts describe rallly primarily around fast, no-login poll creation and its direct comparison pages against Doodle and When2Meet; features like calendar sync or payment collection are not documented for it."
    }
  ]
};

export default doodleVsRalllyContent;
