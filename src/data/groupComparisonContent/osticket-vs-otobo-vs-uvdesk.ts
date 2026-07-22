import type { GroupComparisonContent } from './types';

const osticketVsOtoboVsUvdeskContent: GroupComparisonContent = {
  "verdict": "osTicket, OTOBO, and UVdesk are all open-source, self-hostable customer support ticketing platforms with genuinely free core editions, making them a fair three-way shortlist for teams that want to avoid per-agent SaaS pricing. osTicket brings two decades of maturity, a large plugin and documentation ecosystem, and an affordable cloud tier; OTOBO carries OTRS-grade ticket and process management plus AI-assisted ticket classification for teams that want deeper ITSM depth; UVdesk leans toward e-commerce and SMB support with marketplace integrations and the lowest-cost published SaaS plans. None of the three discloses a complete feature-for-feature comparison beyond its own documentation, so teams weighing AI features or enterprise support should confirm current capabilities directly with each vendor before committing.",
  "bestFor": {
    "osticket": "Support teams that want the most mature, widely documented open-source helpdesk with an affordable optional cloud-hosted tier.",
    "otobo": "IT service teams that want OTRS-lineage ticket and process management plus AI-assisted ticket classification, fully free to self-host.",
    "uvdesk": "E-commerce and SMB support teams that want free self-hosting or a low-cost SaaS plan with strong marketplace integrations."
  },
  "highlights": [
    {
      "title": "Deepest ITSM heritage and AI ticket classification",
      "description": "OTOBO is a direct fork of OTRS Community Edition built by a team with roots in the original OTRS engineering organization, and it is the only one of the three with an explicitly documented AI-powered ticket classification feature alongside process management workflows and Generic Agent automation.",
      "toolSlugs": [
        "otobo"
      ]
    },
    {
      "title": "Longest track record and largest community",
      "description": "osTicket has been in continuous development since 2003, giving it the most mature codebase, the largest documentation base, and the broadest plugin ecosystem of the three, plus a Cloud-Hosted option starting at a publicly listed $12 per agent per month.",
      "toolSlugs": [
        "osticket"
      ]
    },
    {
      "title": "Built for e-commerce and SMB support",
      "description": "UVdesk is backed by Webkul, an established e-commerce tooling vendor, and its feature set leans into marketplace integrations and multichannel ticketing, with the lowest publicly listed paid plan starting at $8 per agent per month on an annual SaaS commitment.",
      "toolSlugs": [
        "uvdesk"
      ]
    },
    {
      "title": "Pricing transparency varies",
      "description": "osTicket and UVdesk both publish per-agent SaaS pricing on their sites, while OTOBO's commercial support and hosting pricing is custom-quoted and not publicly listed, which matters for teams that want to budget without a sales call.",
      "toolSlugs": [
        "osticket",
        "otobo",
        "uvdesk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Free, unlimited-agent self-hosted edition",
          "statuses": {
            "osticket": "available",
            "otobo": "available",
            "uvdesk": "available"
          }
        },
        {
          "feature": "Official managed cloud/SaaS option",
          "statuses": {
            "osticket": "available",
            "otobo": "not-documented",
            "uvdesk": "available"
          },
          "note": "OTOBO's paid offering is custom-quoted commercial support rather than a published SaaS plan."
        },
        {
          "feature": "Publicly listed cloud/SaaS pricing",
          "statuses": {
            "osticket": "available",
            "otobo": "unavailable",
            "uvdesk": "available"
          },
          "note": "osTicket and UVdesk both list per-agent monthly prices; OTOBO requires a custom quote."
        }
      ]
    },
    {
      "group": "Ticket Management and Automation",
      "rows": [
        {
          "feature": "SLA and business-hours rules",
          "statuses": {
            "osticket": "available",
            "otobo": "available",
            "uvdesk": "not-documented"
          }
        },
        {
          "feature": "Workflow and process automation",
          "statuses": {
            "osticket": "available",
            "otobo": "available",
            "uvdesk": "available"
          }
        },
        {
          "feature": "AI-assisted ticket classification",
          "statuses": {
            "osticket": "unavailable",
            "otobo": "available",
            "uvdesk": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Self-Service and Ecosystem",
      "rows": [
        {
          "feature": "Customer self-service portal or knowledge base",
          "statuses": {
            "osticket": "available",
            "otobo": "available",
            "uvdesk": "available"
          }
        },
        {
          "feature": "Marketplace or third-party app integrations",
          "statuses": {
            "osticket": "limited",
            "otobo": "not-documented",
            "uvdesk": "available"
          },
          "note": "osTicket's strength here is a broad community plugin ecosystem rather than a formal app marketplace."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are osTicket, OTOBO, and UVdesk actually free to use?",
      "answer": "Yes, all three publish a free, self-hosted open-source edition with no artificial agent limits. Paid tiers add managed hosting, commercial support, or SaaS convenience on top of the free core: osTicket's Cloud-Hosted plan starts at $12 per agent per month, UVdesk's SaaS plans start at $8 per agent per month billed annually, and OTOBO's commercial support is custom-quoted."
    },
    {
      "question": "Which of the three is easiest to self-host?",
      "answer": "It depends on your team's stack. osTicket has the largest community and documentation base built up over two decades, which can make troubleshooting easier. OTOBO uses Docker-based deployment and requires familiarity with Perl, while UVdesk is built on PHP and Symfony, so the easiest choice often comes down to which language and deployment model your engineers already know."
    },
    {
      "question": "Does any of these tools offer AI features?",
      "answer": "OTOBO is the only one of the three with an explicitly documented AI-powered ticket classification feature. AI capabilities are not documented for osTicket or UVdesk based on their published feature sets."
    },
    {
      "question": "Which option is best for an e-commerce support team?",
      "answer": "UVdesk is the most e-commerce-oriented of the three, backed by Webkul and built with marketplace integrations and multichannel ticketing aimed at online retail and SMB support teams."
    },
    {
      "question": "Which platform has been around the longest?",
      "answer": "osTicket, founded in 2003, has the longest continuous history of the three. UVdesk followed in 2010, and OTOBO is the newest, launched in 2019 as a fork of OTRS Community Edition."
    },
    {
      "question": "How do their paid tiers compare in transparency?",
      "answer": "osTicket and UVdesk both publish per-agent monthly SaaS pricing on their websites, making it easier to budget without a sales conversation. OTOBO's paid commercial support and hosting pricing is not publicly listed and requires contacting the vendor for a custom quote."
    }
  ]
};

export default osticketVsOtoboVsUvdeskContent;
