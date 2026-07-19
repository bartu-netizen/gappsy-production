import type { GroupComparisonContent } from './types';

const fedoraCommonsRepositoryVsInveniordmVsIslandoraContent: GroupComparisonContent = {
  "verdict": "Fedora, InvenioRDM, and Islandora all serve institutional digital repository needs, but they sit at different layers of the stack. Fedora is standards-based preservation infrastructure that needs a front end layered on top, Islandora is that kind of front end built directly on Fedora with a Drupal interface and strong IIIF image delivery, and InvenioRDM is a separate, turn-key repository built on CERN's Invenio framework with DOI minting and FAIR metadata baked in for research data. The practical choice is less 'which is best' and more 'which layer of the repository stack do you need' and whether your priority is archival/special-collections metadata versus research-data publishing with persistent identifiers.",
  "bestFor": {
    "fedora-commons-repository": "Institutions that want standards-based, Linked Data preservation infrastructure (OCFL storage, WebAC authorization) and plan to choose or build their own front end on top of it.",
    "inveniordm": "Research institutions and universities that want a turn-key repository for datasets and publications with DOI minting, FAIR metadata, and ORCID/ROR integration out of the box.",
    "islandora": "Libraries, archives, and museums that want a ready-to-use Drupal-based interface for complex archival collections, with Apache Solr search and strong IIIF image delivery."
  },
  "highlights": [
    {
      "title": "Infrastructure vs. ready-to-use platform",
      "description": "Fedora is explicitly repository infrastructure that requires a separate front end such as Islandora to deliver a public interface, while both InvenioRDM and Islandora ship as usable, deployable platforms in their own right.",
      "toolSlugs": [
        "fedora-commons-repository",
        "inveniordm",
        "islandora"
      ]
    },
    {
      "title": "Islandora is built directly on Fedora",
      "description": "Islandora is not an independent competitor to Fedora but a Drupal-based interaction layer and Solr search built on top of Fedora's Commons repository, so choosing Islandora typically means choosing Fedora underneath it.",
      "toolSlugs": [
        "fedora-commons-repository",
        "islandora"
      ]
    },
    {
      "title": "Research data vs. archival collections focus",
      "description": "InvenioRDM is purpose-built for research data management with DOI minting, embargoes, and versioned records (the same codebase that powers Zenodo), while Islandora is oriented toward archival and special-collections metadata with IIIF image delivery.",
      "toolSlugs": [
        "inveniordm",
        "islandora"
      ]
    },
    {
      "title": "Nonprofit and institutional backing",
      "description": "All three are backed by established institutional governance rather than a single commercial vendor: Fedora by the Lyrasis nonprofit, InvenioRDM by CERN and a multi-institution developer community, and Islandora by a community-governed foundation with tiered membership.",
      "toolSlugs": [
        "fedora-commons-repository",
        "inveniordm",
        "islandora"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Repository Core and Preservation",
      "rows": [
        {
          "feature": "Ready-to-use front end out of the box",
          "statuses": {
            "fedora-commons-repository": "unavailable",
            "inveniordm": "available",
            "islandora": "available"
          },
          "note": "Fedora requires a separate front end such as Islandora or Hyrax; InvenioRDM and Islandora both ship a usable interface."
        },
        {
          "feature": "Linked Data / RDF support",
          "statuses": {
            "fedora-commons-repository": "available",
            "inveniordm": "not-documented",
            "islandora": "limited"
          },
          "note": "Islandora inherits RDF capability from its underlying Fedora repository rather than exposing it as a standalone feature."
        },
        {
          "feature": "OCFL-based preservation storage",
          "statuses": {
            "fedora-commons-repository": "available",
            "inveniordm": "not-documented",
            "islandora": "limited"
          },
          "note": "Islandora's preservation storage depends on the Fedora backend it is built on."
        }
      ]
    },
    {
      "group": "Search and Discovery",
      "rows": [
        {
          "feature": "IIIF image delivery",
          "statuses": {
            "fedora-commons-repository": "not-documented",
            "inveniordm": "not-documented",
            "islandora": "available"
          }
        },
        {
          "feature": "Apache Solr faceted search",
          "statuses": {
            "fedora-commons-repository": "not-documented",
            "inveniordm": "not-documented",
            "islandora": "available"
          }
        }
      ]
    },
    {
      "group": "Research Data and Identifiers",
      "rows": [
        {
          "feature": "DOI minting via DataCite",
          "statuses": {
            "fedora-commons-repository": "not-documented",
            "inveniordm": "available",
            "islandora": "not-documented"
          }
        },
        {
          "feature": "ORCID and ROR integration",
          "statuses": {
            "fedora-commons-repository": "not-documented",
            "inveniordm": "available",
            "islandora": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Governance and Support",
      "rows": [
        {
          "feature": "Nonprofit or institutional governance body",
          "statuses": {
            "fedora-commons-repository": "available",
            "inveniordm": "available",
            "islandora": "available"
          },
          "note": "Fedora is governed by Lyrasis, InvenioRDM by CERN and its partner community, and Islandora by a community foundation with optional membership dues."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the actual difference between Fedora and Islandora?",
      "answer": "Fedora is the underlying repository engine that stores and preserves digital objects using Linked Data, RDF, and OCFL-based storage, but it has no public-facing interface of its own. Islandora is a Drupal-based front end and set of microservices built directly on top of Fedora, adding a browsable interface, Apache Solr search, and IIIF image delivery. In practice, choosing Islandora means you are also running Fedora underneath it."
    },
    {
      "question": "Can InvenioRDM be used for digital preservation the way Fedora is?",
      "answer": "InvenioRDM is a turn-key repository built on CERN's Invenio framework and is optimized for publishing and managing research data with DOI minting and FAIR metadata, rather than the general-purpose Linked Data preservation infrastructure that Fedora provides. Fedora's OCFL-based storage and modular architecture are specifically designed as long-term preservation infrastructure that other front ends, including Islandora, are built on top of."
    },
    {
      "question": "Which of these three is best for a university research data repository?",
      "answer": "InvenioRDM is purpose-built for this use case, offering DOI minting via DataCite, FAIR-compliant metadata, versioned records, embargoes, and ORCID and ROR integration out of the box, and it runs the same codebase that powers Zenodo at scale. Fedora and Islandora are more oriented toward archival and special-collections metadata rather than research-data publishing workflows."
    },
    {
      "question": "Do Fedora, InvenioRDM, and Islandora include official vendor support?",
      "answer": "None of the three include a default vendor support contract. Fedora is backed by the Lyrasis nonprofit, InvenioRDM by CERN and a multi-institution developer community, and Islandora by a community-governed foundation with optional paid membership tiers; institutions typically rely on community resources or contract third-party support separately for all three."
    },
    {
      "question": "Which platform has the strongest support for archival images and IIIF?",
      "answer": "Islandora is the strongest fit here, with built-in IIIF image delivery and Apache Solr search designed for complex archival and special-collections metadata. Fedora provides the underlying preservation storage that supports this use case, while InvenioRDM's documented feature set centers on research-data metadata and identifiers rather than IIIF image delivery."
    },
    {
      "question": "Do I need Fedora if I choose Islandora?",
      "answer": "Yes. Islandora is not a standalone repository system; it is a Drupal-based interaction layer and set of Crayfish microservices that sit on top of a Fedora Commons repository. Deploying Islandora means you are deploying Fedora as its storage and preservation backend."
    }
  ]
};

export default fedoraCommonsRepositoryVsInveniordmVsIslandoraContent;
