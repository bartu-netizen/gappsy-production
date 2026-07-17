import type { ToolComparisonContent } from './types';

const alfVsEasyappointmentsContent: ToolComparisonContent = {
  "verdict": "Alf.io is a free, open-source event ticketing platform documented with deployment guides for OpenShift, Heroku, and Cloud Foundry, aimed at organizations that want to self-host ticket sales for events. Easy!Appointments is a freemium appointment-scheduling tool that integrates directly with WordPress, Joomla, and Drupal and has been actively developed since 2014, aimed at businesses that need customers to book appointments through an existing CMS-based website. Though both are open, self-hostable booking-adjacent tools, they solve different problems — one sells tickets to events, the other schedules one-on-one appointments.",
  "bestForToolA": "Organizations selling tickets to events who want a free, open-source ticketing platform they can self-host on OpenShift, Heroku, or Cloud Foundry.",
  "bestForToolB": "Businesses running a WordPress, Joomla, or Drupal site that need built-in appointment booking, with an optional premium tier for customized development.",
  "whoNeedsBoth": "A venue or organization could use Easy!Appointments to schedule staff consultations or venue walkthroughs on its WordPress site, while using Alf.io separately to sell tickets for events held at that venue — plausible since ticketing and appointment scheduling are genuinely different workflows.",
  "keyDifferences": [
    {
      "title": "Core Use Case",
      "toolA": "Alf.io is documented as an open-source, self-hostable event ticketing platform.",
      "toolB": "Easy!Appointments is a scheduling tool for booking appointments, with direct integrations into CMS platforms.",
      "whyItMatters": "Ticketing and appointment scheduling are different workflows with different data models (tickets/events vs. bookable time windows).",
      "benefitsWho": "Event organizers need Alf.io's ticketing focus; service businesses need Easy!Appointments' booking focus."
    },
    {
      "title": "Deployment Options",
      "toolA": "Alf.io documents deployment guides for OpenShift, Heroku, and Cloud Foundry.",
      "toolB": "Easy!Appointments' deployment method is not documented beyond its CMS integrations.",
      "whyItMatters": "Documented deployment guides reduce setup friction for teams choosing where to host the software.",
      "benefitsWho": "Technical teams evaluating hosting platforms benefit from Alf.io's documented multi-platform deployment guides."
    },
    {
      "title": "CMS Integration",
      "toolA": "Alf.io does not document direct CMS integrations.",
      "toolB": "Easy!Appointments integrates directly with WordPress, Joomla, and Drupal, not just as a standalone widget.",
      "whyItMatters": "Direct CMS integration lets a business add booking to an existing site without a separate portal.",
      "benefitsWho": "Businesses that already run their website on WordPress, Joomla, or Drupal."
    },
    {
      "title": "Pricing Model",
      "toolA": "Alf.io's pricing model is Free / Open Source, with no pricing plans documented.",
      "toolB": "Easy!Appointments is freemium, with a paid premium tier for customized development beyond the open-source core.",
      "whyItMatters": "A documented paid tier signals an upgrade path for teams that outgrow the free/open-source core.",
      "benefitsWho": "Businesses wanting vendor-provided customization work benefit from Easy!Appointments' premium tier; cost-sensitive users benefit from Alf.io's fully free model."
    },
    {
      "title": "Track Record",
      "toolA": "Alf.io's founding year is not documented in available facts.",
      "toolB": "Easy!Appointments is documented as actively developed since 2014, a long track record.",
      "whyItMatters": "A long, documented development history signals ongoing maintenance and stability.",
      "benefitsWho": "Buyers who weigh vendor longevity in their decision."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Event ticketing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Appointment/booking scheduling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "CMS website integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WordPress, Joomla, Drupal"
        }
      ]
    },
    {
      "group": "Deployment & Customization",
      "rows": [
        {
          "feature": "Documented cloud deployment guides",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenShift, Heroku, Cloud Foundry"
        },
        {
          "feature": "Premium customization/development tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Open-source core",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Track Record",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Easy!Appointments is freemium but its free-tier scope isn't detailed"
        },
        {
          "feature": "Paid tier available",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Long-term development track record documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Actively developed since 2014"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Alf.io free to use?",
      "answer": "Yes — Alf.io is an open-source, self-hostable event ticketing platform."
    },
    {
      "question": "Does Easy!Appointments integrate with WordPress?",
      "answer": "Yes — along with WordPress, it also integrates directly with Joomla and Drupal."
    },
    {
      "question": "Can Alf.io be deployed to the cloud?",
      "answer": "Yes, it has documented deployment guides for OpenShift, Heroku, and Cloud Foundry."
    },
    {
      "question": "Does Easy!Appointments have a paid tier?",
      "answer": "Yes, a premium tier is available for customized development beyond the open-source core."
    },
    {
      "question": "Are Alf.io and Easy!Appointments the same type of tool?",
      "answer": "No — Alf.io is built for event ticketing, while Easy!Appointments is built for appointment scheduling on CMS-based websites."
    },
    {
      "question": "How long has Easy!Appointments been in development?",
      "answer": "Since 2014, per its documented track record."
    }
  ]
};

export default alfVsEasyappointmentsContent;
