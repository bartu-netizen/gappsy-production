import type { ToolComparisonContent } from './types';

const statuscakeVsThanosContent: ToolComparisonContent = {
  "verdict": "StatusCake is a hosted SaaS monitoring service, founded in 2012 and serving 220,000+ customers including Accenture and Netflix, that performs external checks on uptime, SSL, domain expiry, page speed, and servers, with a free plan and paid tiers starting at €16.66/month. Thanos is a free, open-source system (Apache 2.0, CNCF incubating) that extends Prometheus with a global query view across clusters and unlimited metrics retention via object storage, requiring self-hosting and operational setup. These aren't really competitors: StatusCake is an outside-in synthetic monitoring product you subscribe to, while Thanos is infrastructure software you deploy to scale an existing Prometheus-based observability stack.",
  "bestForToolA": "Teams that want an easy, hosted external monitoring service for uptime, SSL, domain expiry, page speed, and server resources with no infrastructure to manage, starting with a free plan covering 10 uptime monitors.",
  "bestForToolB": "Platform and SRE teams already running Prometheus who need a global query view across multiple clusters and long-term metrics retention via object storage (S3, GCS, Azure, Swift, or Tencent COS), and are comfortable self-hosting and operating the backend.",
  "whoNeedsBoth": "This is a genuinely realistic pairing: an engineering team could run Thanos internally to aggregate and retain Prometheus metrics from its own infrastructure across clusters, while using StatusCake as an independent, outside-in check confirming the service is actually reachable by end users — internal metrics and external synthetic monitoring are complementary, not overlapping, jobs.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "StatusCake is a fully hosted SaaS service accessed by signing up for an account.",
      "toolB": "Thanos is self-hosted open-source software that a team deploys and operates, with no managed cloud offering documented.",
      "whyItMatters": "Hosted versus self-hosted determines who is responsible for uptime, scaling, and maintenance of the monitoring tool itself.",
      "benefitsWho": "Teams without dedicated infrastructure engineering resources (StatusCake) versus teams with existing Prometheus/Kubernetes operational expertise (Thanos)."
    },
    {
      "title": "Cost Model",
      "toolA": "StatusCake has a free plan plus paid tiers from €16.66/month (Superior, annual) up to €58.33/month (Business, annual) and a custom-priced Enterprise tier.",
      "toolB": "Thanos is entirely free and open source under the Apache 2.0 license, with no paid tier at all.",
      "whyItMatters": "Thanos has no licensing cost, but its true cost includes engineering time and object storage infrastructure, which StatusCake's subscription price already bundles in.",
      "benefitsWho": "Budget owners comparing subscription cost against internal engineering and infrastructure cost."
    },
    {
      "title": "What Is Monitored",
      "toolA": "StatusCake performs external, synthetic checks — uptime, SSL certificate expiry, domain expiry, page speed and Core Web Vitals, and server CPU/RAM/disk usage.",
      "toolB": "Thanos aggregates and stores metrics already being scraped by Prometheus (application and infrastructure metrics) rather than performing external checks of its own.",
      "whyItMatters": "External synthetic checks answer 'is the service reachable from outside,' while Thanos answers 'what is happening inside the infrastructure over time.'",
      "benefitsWho": "Teams needing to distinguish outside-in availability monitoring from internal metrics aggregation and long-term storage."
    },
    {
      "title": "Operational Overhead",
      "toolA": "StatusCake requires no infrastructure management from the customer beyond configuring monitors in the dashboard.",
      "toolB": "Thanos requires configuring and operating an object storage backend in addition to running Prometheus itself, adding operational complexity.",
      "whyItMatters": "Operational overhead directly affects total cost of ownership and the skill set required on the team.",
      "benefitsWho": "Small teams wanting minimal operational burden (StatusCake) versus platform teams already managing complex observability infrastructure (Thanos)."
    },
    {
      "title": "Ecosystem Integration",
      "toolA": "StatusCake provides its own dashboard, alerting, and status pages, plus Google SSO across all customer tiers.",
      "toolB": "Thanos exposes a Prometheus-compatible query API, working natively with Grafana and any other tool that supports that API.",
      "whyItMatters": "Teams with an existing Grafana/Prometheus observability stack benefit from a tool that plugs directly into it rather than a separate standalone dashboard.",
      "benefitsWho": "SRE and platform engineering teams standardized on the Prometheus/Grafana ecosystem."
    }
  ],
  "featureMatrix": [
    {
      "group": "Monitoring Scope",
      "rows": [
        {
          "feature": "External uptime monitoring",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Thanos does not perform external synthetic checks"
        },
        {
          "feature": "SSL/domain expiry monitoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Page speed / Core Web Vitals monitoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Long-term metrics retention",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Thanos offers effectively unlimited retention via object storage"
        },
        {
          "feature": "Global query across multiple clusters",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Hosted/managed service",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Thanos is self-hosted only"
        },
        {
          "feature": "Free plan/tier",
          "toolA": "available",
          "toolB": "available",
          "note": "StatusCake's free plan (10 monitors) vs Thanos being entirely free"
        },
        {
          "feature": "Paid enterprise tier",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Requires operating storage infrastructure",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Thanos needs an object storage backend"
        }
      ]
    },
    {
      "group": "Ecosystem & Integration",
      "rows": [
        {
          "feature": "Grafana / Prometheus API compatibility",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Customer-facing status pages",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open source license",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Thanos is Apache 2.0 licensed and CNCF incubating"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google SSO on all StatusCake tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are StatusCake and Thanos actually competitors?",
      "answer": "Not directly. StatusCake is a hosted SaaS service that performs external checks (uptime, SSL, domain, page speed, servers). Thanos is open-source software you self-host to extend Prometheus with a global query view and long-term metrics storage. They monitor different things in different ways."
    },
    {
      "question": "Is Thanos free to use?",
      "answer": "Yes. Thanos is open source under the Apache 2.0 license with no paid tier, though you still bear the cost of the infrastructure and engineering time to run it."
    },
    {
      "question": "Does StatusCake have a free plan?",
      "answer": "Yes, StatusCake's free plan includes 10 uptime monitors, 5-minute test intervals, and one each of page speed, domain, and SSL monitors, with no time limit."
    },
    {
      "question": "Does Thanos replace Prometheus?",
      "answer": "No. Thanos extends Prometheus by adding global querying across clusters and long-term storage in object storage; it doesn't replace Prometheus's core scraping function."
    },
    {
      "question": "Can Thanos and Grafana work together?",
      "answer": "Yes. Thanos exposes a Prometheus-compatible query API that Grafana and other Prometheus-aware tools can use directly."
    },
    {
      "question": "Does StatusCake require any infrastructure setup?",
      "answer": "No. StatusCake is a fully hosted SaaS product accessed through a dashboard; it requires no object storage or backend infrastructure setup, unlike Thanos."
    }
  ]
};

export default statuscakeVsThanosContent;
