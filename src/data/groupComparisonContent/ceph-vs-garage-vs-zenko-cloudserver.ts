import type { GroupComparisonContent } from './types';

const cephVsGarageVsZenkoCloudserverContent: GroupComparisonContent = {
  "verdict": "Ceph, Garage, and Zenko CloudServer are all free, self-hosted, S3-compatible alternatives to commercial object storage, but they target very different deployment scales. Ceph is the heavyweight option, a unified object, block, and file platform proven at exabyte scale and backed by Red Hat's commercial support, at the cost of real in-house operational expertise. Garage takes the opposite approach with a minimal Rust binary purpose-built for geo-distributed clusters on low-power or secondhand hardware. Zenko CloudServer sits in between as a lightweight, Docker-deployable S3 API layer that can proxy to AWS, Azure, or Google Cloud backends, making it better suited to local development and multi-cloud portability than to running a resilient storage cluster of its own.",
  "bestFor": {
    "ceph": "Enterprises, cloud providers, and research institutions that need petabyte-to-exabyte-scale unified object, block, and file storage on commodity hardware, with the option of paid Red Hat support.",
    "garage": "Small teams, self-hosting communities, and nonprofits running geographically distributed clusters on modest or secondhand hardware who need a lightweight S3-compatible store.",
    "zenko-cloudserver": "Developers who need a drop-in, Docker-deployable S3-compatible endpoint for local testing, CI/CD pipelines, or bridging application code across AWS, Azure, and Google Cloud backends."
  },
  "highlights": [
    {
      "title": "Ceph is the only unified object, block, and file platform of the three",
      "description": "Ceph exposes S3/Swift-compatible object storage, block storage for VMs and containers, and a POSIX filesystem from one cluster, and is proven at exabyte scale with commercial Red Hat backing, while Garage and Zenko CloudServer focus solely on the S3 object storage interface.",
      "toolSlugs": [
        "ceph"
      ]
    },
    {
      "title": "Garage is purpose-built for geo-distributed, low-resource self-hosting",
      "description": "Garage uses Dynamo-style consistent hashing and CRDTs instead of a consensus protocol, letting it run reliably on secondhand or low-power hardware spread across multiple physical locations, a scenario Ceph and Zenko are not specifically designed for.",
      "toolSlugs": [
        "garage"
      ]
    },
    {
      "title": "Zenko CloudServer is a portable S3 compatibility layer, not a storage cluster",
      "description": "Zenko CloudServer implements the S3 API and can route to local disk or to AWS, Azure, and Google Cloud backends, making it valuable for avoiding vendor lock-in and for fast Docker-based local testing rather than for running its own resilient multi-node cluster.",
      "toolSlugs": [
        "zenko-cloudserver"
      ]
    },
    {
      "title": "All three avoid vendor lock-in with zero software license cost",
      "description": "Ceph, Garage, and Zenko CloudServer are all free and open source, giving teams an S3-compatible alternative to AWS S3 that they fully own and can run on their own infrastructure.",
      "toolSlugs": [
        "ceph",
        "garage",
        "zenko-cloudserver"
      ]
    },
    {
      "title": "Operational complexity differs sharply across the three",
      "description": "Ceph demands significant in-house distributed-systems expertise to deploy and tune, while Garage ships as a single dependency-free binary and Zenko CloudServer deploys via an official Docker image within minutes.",
      "toolSlugs": [
        "ceph",
        "garage",
        "zenko-cloudserver"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Storage Model and API",
      "rows": [
        {
          "feature": "Unified object, block, and file storage in one system",
          "statuses": {
            "ceph": "available",
            "garage": "unavailable",
            "zenko-cloudserver": "unavailable"
          },
          "note": "Garage and Zenko CloudServer are purpose-built object storage servers only."
        },
        {
          "feature": "S3-compatible object storage API",
          "statuses": {
            "ceph": "available",
            "garage": "available",
            "zenko-cloudserver": "available"
          }
        },
        {
          "feature": "Multi-cloud backend proxying (route to AWS S3, Azure Blob, Google Cloud Storage)",
          "statuses": {
            "ceph": "not-documented",
            "garage": "not-documented",
            "zenko-cloudserver": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment Footprint",
      "rows": [
        {
          "feature": "Runs on low-power or secondhand hardware",
          "statuses": {
            "ceph": "unavailable",
            "garage": "available",
            "zenko-cloudserver": "limited"
          },
          "note": "Zenko's Node.js single instance is lighter than a Ceph cluster but not purpose-built for secondhand hardware like Garage."
        },
        {
          "feature": "Built-in tolerance for geo-distributed, high-latency nodes",
          "statuses": {
            "ceph": "limited",
            "garage": "available",
            "zenko-cloudserver": "not-documented"
          },
          "note": "Ceph's CRUSH algorithm scales across a data center but is not specifically designed for high inter-node latency the way Garage's CRDT model is."
        },
        {
          "feature": "Quick Docker-based single-node deployment",
          "statuses": {
            "ceph": "limited",
            "garage": "available",
            "zenko-cloudserver": "available"
          }
        }
      ]
    },
    {
      "group": "Scale and Support",
      "rows": [
        {
          "feature": "Proven exabyte-scale cluster deployments",
          "statuses": {
            "ceph": "available",
            "garage": "limited",
            "zenko-cloudserver": "not-documented"
          },
          "note": "Garage explicitly targets small-to-medium scale rather than hyperscale storage."
        },
        {
          "feature": "Vendor-backed commercial support option",
          "statuses": {
            "ceph": "available",
            "garage": "unavailable",
            "zenko-cloudserver": "limited"
          },
          "note": "Ceph has Red Hat Ceph Storage; Zenko's maker Scality offers separate commercial products; Garage has community support only."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is easiest to self-host for a small project: Ceph, Garage, or Zenko CloudServer?",
      "answer": "Garage and Zenko CloudServer are both far easier to get running than Ceph. Garage ships as a single dependency-free Rust binary with low hardware requirements, and Zenko CloudServer has an official Docker image that can be running within minutes. Ceph requires standing up and tuning a distributed cluster, which typically demands dedicated operations expertise."
    },
    {
      "question": "Can any of these tools replace block or file storage, not just object storage?",
      "answer": "Only Ceph. It exposes block storage (RBD) for VMs and containers and a POSIX-compliant filesystem (CephFS) alongside its S3-compatible object storage, all from the same cluster. Garage and Zenko CloudServer are focused solely on S3-compatible object storage."
    },
    {
      "question": "Is Zenko CloudServer good for avoiding AWS vendor lock-in?",
      "answer": "Yes, that is one of its core use cases. Zenko CloudServer implements the S3 API but can route requests to local disk or to AWS, Azure, or Google Cloud Storage as the underlying backend, so application code written against the S3 API can move between clouds without rewrites."
    },
    {
      "question": "Which of these three has paid enterprise support available?",
      "answer": "Ceph has the most established paid support path through Red Hat Ceph Storage, an enterprise-supported distribution from Red Hat. Zenko CloudServer's maker, Scality, offers separate commercial products for teams that need support beyond the open-source project. Garage is community-supported only, with no vendor-backed support tier."
    },
    {
      "question": "Is Garage suitable for large-scale enterprise storage needs?",
      "answer": "Garage is explicitly designed for small-to-medium scale, geographically distributed deployments on modest or secondhand hardware rather than hyperscale storage. Organizations needing petabyte-to-exabyte-scale storage are better served by Ceph, which is proven at that scale and backed by Red Hat."
    },
    {
      "question": "Do these tools require expensive, uniform data center hardware to run?",
      "answer": "No, not all of them. Garage was specifically built to run on heterogeneous, low-power, or even secondhand servers spread across different physical locations. Zenko CloudServer can run as a lightweight single instance via Docker. Ceph is the exception, since it is designed for commodity server clusters and performs best with more uniform, dedicated infrastructure."
    }
  ]
};

export default cephVsGarageVsZenkoCloudserverContent;
