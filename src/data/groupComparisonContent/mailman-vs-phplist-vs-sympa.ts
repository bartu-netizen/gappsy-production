import type { GroupComparisonContent } from './types';

const mailmanVsPhplistVsSympaContent: GroupComparisonContent = {
  "verdict": "Mailman, phpList, and Sympa are all free, self-hosted mailing list software, but they solve different problems. Mailman and Sympa are governance-focused list managers built for moderated discussion and announcement lists, with Sympa proven at especially large institutional scale, while phpList is built for marketing-style newsletter campaigns with tracking and an optional low-cost hosted plan. Teams should pick based on whether they need list moderation and archives or campaign analytics and drip sequences, not on which tool is technically 'better'.",
  "bestFor": {
    "mailman": "Open-source projects, academic departments, and communities that want a traditional, tightly-moderated discussion or announcement list with searchable archives.",
    "phplist": "Organizations that want newsletter-style campaigns with open and click tracking, with the option of inexpensive hosted delivery instead of self-hosting.",
    "sympa": "Universities and large institutions that need a self-hosted list manager proven at very large scale, up to tens of thousands of lists and hundreds of thousands of subscribers."
  },
  "highlights": [
    {
      "title": "Built for discussion and announcement lists, not marketing",
      "description": "Mailman and Sympa are both designed around moderation, subscriber approval workflows, and posting permissions rather than campaign analytics.",
      "toolSlugs": [
        "mailman",
        "sympa"
      ]
    },
    {
      "title": "Only one with campaign tracking and a hosted plan",
      "description": "phpList adds open and click tracking, autoresponders and drip campaigns, and an official hosted service through phplist.com starting around $1 per month for teams that do not want to self-host.",
      "toolSlugs": [
        "phplist"
      ]
    },
    {
      "title": "Purpose-built for very large institutional deployments",
      "description": "Sympa documents support for up to 20,000 lists and 700,000 subscribers using a relational database backend, and is used by universities including Edinburgh and Glasgow.",
      "toolSlugs": [
        "sympa"
      ]
    },
    {
      "title": "Decades of maturity with searchable web archives",
      "description": "Both Mailman and Sympa ship browsable, searchable message archives (HyperKitty and WWSympa respectively), a capability phpList's campaign-oriented model does not provide.",
      "toolSlugs": [
        "mailman",
        "sympa"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Cost",
      "rows": [
        {
          "feature": "Free, self-hosted core software",
          "statuses": {
            "mailman": "available",
            "phplist": "available",
            "sympa": "available"
          }
        },
        {
          "feature": "Official managed or hosted option from the vendor",
          "statuses": {
            "mailman": "unavailable",
            "phplist": "available",
            "sympa": "unavailable"
          },
          "note": "phpList offers hosted plans via phplist.com from around $1/month; Mailman and Sympa have no official managed hosting, though third-party Mailman hosts exist."
        }
      ]
    },
    {
      "group": "List Management and Scale",
      "rows": [
        {
          "feature": "Web-based admin interface",
          "statuses": {
            "mailman": "available",
            "phplist": "available",
            "sympa": "available"
          },
          "note": "Postorius for Mailman, WWSympa for Sympa."
        },
        {
          "feature": "Searchable web archive of past messages",
          "statuses": {
            "mailman": "available",
            "phplist": "unavailable",
            "sympa": "available"
          }
        },
        {
          "feature": "Documented capacity above 100,000 subscribers",
          "statuses": {
            "mailman": "not-documented",
            "phplist": "not-documented",
            "sympa": "available"
          },
          "note": "Sympa documents support for up to 700,000 subscribers across 20,000 lists."
        }
      ]
    },
    {
      "group": "Marketing and Automation Features",
      "rows": [
        {
          "feature": "Campaign scheduling with open and click tracking",
          "statuses": {
            "mailman": "unavailable",
            "phplist": "available",
            "sympa": "unavailable"
          }
        },
        {
          "feature": "Autoresponders or drip sequences",
          "statuses": {
            "mailman": "unavailable",
            "phplist": "available",
            "sympa": "unavailable"
          }
        },
        {
          "feature": "API for automation",
          "statuses": {
            "mailman": "available",
            "phplist": "available",
            "sympa": "available"
          },
          "note": "Mailman and phpList expose REST-style APIs; Sympa exposes a SOAP API."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are any of these three available as a fully managed SaaS?",
      "answer": "Only phpList, through its own hosted service at phplist.com starting around $1 per month. Mailman and Sympa are self-hosted only, though third-party managed Mailman hosting exists outside the core project."
    },
    {
      "question": "Which has open and click tracking for marketing campaigns?",
      "answer": "phpList, which is built for newsletter-style campaigns and includes click and open tracking as a core feature. Mailman and Sympa do not offer this."
    },
    {
      "question": "Which is proven at the largest subscriber scale?",
      "answer": "Sympa, which documents support for up to 20,000 lists and 700,000 subscribers using a relational database backend, and is used by universities such as Edinburgh and Glasgow."
    },
    {
      "question": "Do Mailman and Sympa provide searchable message archives?",
      "answer": "Yes. Mailman uses HyperKitty and Sympa uses WWSympa's built-in search to browse past list messages. phpList does not offer a comparable discussion archive."
    },
    {
      "question": "What kind of API does each tool expose?",
      "answer": "Mailman and phpList both expose REST-style APIs for automation, while Sympa exposes a SOAP API aimed at institutional system integration."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes, the core software for Mailman, phpList, and Sympa is all free and open source to self-host; phpList's paid tier is only for its optional hosted service."
    }
  ]
};

export default mailmanVsPhplistVsSympaContent;
