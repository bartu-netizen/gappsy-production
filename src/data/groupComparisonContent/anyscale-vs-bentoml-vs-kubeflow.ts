import type { GroupComparisonContent } from './types';

const anyscaleVsBentomlVsKubeflowContent: GroupComparisonContent = {
  "verdict": "Anyscale, BentoML, and Kubeflow all help teams run AI workloads without hand-building distributed infrastructure, but they solve different slices of that problem. Anyscale is the most training- and data-pipeline-heavy of the three, built on Ray and sold as usage-based compute with a managed Hosted option, a Bring-Your-Own-Cloud option, and enterprise governance like SSO and audit logging. BentoML is narrower and lighter: a free, framework-agnostic model-serving toolkit that can be self-hosted or paired with the usage-based Bento Cloud for GPU-backed autoscaling and deployment testing. Kubeflow is the most complete open-source option end to end, bundling notebooks, distributed training operators, hyperparameter tuning, and KServe-based serving into a single Kubernetes-native, CNCF-governed project, at the cost of requiring real Kubernetes operational expertise.",
  "bestFor": {
    "anyscale": "Teams running large-scale distributed model training or multimodal data processing who want managed or Bring-Your-Own-Cloud Ray infrastructure with enterprise governance built in.",
    "bentoml": "ML engineering teams that want a free, framework-agnostic way to package and serve inference APIs, with the option to move to managed Bento Cloud for GPU-backed autoscaling.",
    "kubeflow": "Platform engineering teams that already operate Kubernetes and want a fully open-source, vendor-neutral toolkit covering notebooks, training, tuning, and serving in one place."
  },
  "highlights": [
    {
      "title": "Ray-Native Distributed Compute",
      "description": "Anyscale is built directly on Ray, the open-source distributed computing framework created by its own founding team, and orchestrates elastic GPU clusters for training, multimodal data curation, and batch embedding generation.",
      "toolSlugs": [
        "anyscale"
      ]
    },
    {
      "title": "Framework-Agnostic Inference Serving",
      "description": "BentoML packages models from many different ML frameworks into unified inference APIs and is free and self-hostable, with Bento Cloud available as an optional managed layer for GPU access and scale-to-zero autoscaling.",
      "toolSlugs": [
        "bentoml"
      ]
    },
    {
      "title": "Full Open-Source ML Lifecycle on Kubernetes",
      "description": "Kubeflow covers the entire path from notebooks through distributed training, Katib hyperparameter tuning, and KServe model serving, all as free, CNCF-governed Kubernetes-native components.",
      "toolSlugs": [
        "kubeflow"
      ]
    },
    {
      "title": "Free Core vs Usage-Based Compute",
      "description": "Kubeflow's software is entirely free and BentoML's core framework has no license fee, while Anyscale charges for the compute itself on an hourly, usage-based basis with volume discounts for committed contracts.",
      "toolSlugs": [
        "anyscale",
        "bentoml",
        "kubeflow"
      ]
    },
    {
      "title": "Deployment Testing and Rollout Controls",
      "description": "BentoML and Kubeflow's KServe both support canary, shadow, or A/B-style rollout testing for production deployments, a documented capability that Anyscale's feature set does not describe in the same way.",
      "toolSlugs": [
        "bentoml",
        "kubeflow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Training and Data Processing",
      "rows": [
        {
          "feature": "Distributed training orchestration",
          "statuses": {
            "anyscale": "available",
            "bentoml": "unavailable",
            "kubeflow": "available"
          },
          "note": "Anyscale runs training across elastic Ray GPU clusters; Kubeflow uses Training Operators for TensorFlow, PyTorch, XGBoost, and MXNet; BentoML is focused on serving rather than training."
        },
        {
          "feature": "Automated hyperparameter tuning",
          "statuses": {
            "anyscale": "not-documented",
            "bentoml": "unavailable",
            "kubeflow": "available"
          },
          "note": "Kubeflow includes Katib for automated hyperparameter tuning and neural architecture search."
        }
      ]
    },
    {
      "group": "Serving and Deployment",
      "rows": [
        {
          "feature": "Production inference serving",
          "statuses": {
            "anyscale": "available",
            "bentoml": "available",
            "kubeflow": "available"
          },
          "note": "Anyscale supports batch and inference workloads, BentoML is purpose-built for real-time, async, and batch serving, and Kubeflow uses KServe."
        },
        {
          "feature": "Canary, shadow, and A/B deployment testing",
          "statuses": {
            "anyscale": "not-documented",
            "bentoml": "available",
            "kubeflow": "available"
          },
          "note": "BentoML documents canary/shadow/A-B testing directly; Kubeflow's KServe supports canary rollouts."
        }
      ]
    },
    {
      "group": "Infrastructure and Scaling",
      "rows": [
        {
          "feature": "Autoscaling with scale-to-zero",
          "statuses": {
            "anyscale": "not-documented",
            "bentoml": "available",
            "kubeflow": "limited"
          },
          "note": "BentoML/Bento Cloud explicitly offers scale-to-zero; KServe provides autoscaling but scale-to-zero is not explicitly documented for Kubeflow."
        },
        {
          "feature": "Multi-cloud portability",
          "statuses": {
            "anyscale": "available",
            "bentoml": "available",
            "kubeflow": "available"
          },
          "note": "Anyscale runs identical code across AWS, GCP, and Azure; BentoML can be self-hosted across multiple clouds; Kubeflow runs on any conformant Kubernetes cluster."
        }
      ]
    },
    {
      "group": "Governance and Support",
      "rows": [
        {
          "feature": "Enterprise SSO, SAML, and audit logging",
          "statuses": {
            "anyscale": "available",
            "bentoml": "not-documented",
            "kubeflow": "not-documented"
          },
          "note": "Anyscale documents SSO, SAML, SCIM, and audit logging as enterprise features; BentoML and Kubeflow do not document equivalent built-in governance controls."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Kubeflow free to use?",
      "answer": "Yes. Kubeflow is fully open source with no license fee or subscription; the only ongoing cost is the underlying Kubernetes infrastructure it runs on, whether self-managed or a cloud provider's managed Kubernetes service."
    },
    {
      "question": "Does BentoML require Bento Cloud to run in production?",
      "answer": "No. The core BentoML framework is free and self-hostable on-premises, on Kubernetes, or across multiple clouds. Bento Cloud is an optional, usage-based managed layer that adds GPU access, autoscaling, and deployment testing."
    },
    {
      "question": "What is Anyscale built on top of?",
      "answer": "Anyscale is a managed platform built on Ray, the open-source distributed computing framework created by Anyscale's own founding team, and it is used for distributed training, multimodal data processing, and inference at scale."
    },
    {
      "question": "Which of the three includes automated hyperparameter tuning?",
      "answer": "Kubeflow includes Katib for automated hyperparameter tuning and neural architecture search. Anyscale and BentoML do not document a comparable built-in feature."
    },
    {
      "question": "Can all three run across multiple cloud providers?",
      "answer": "Yes. Anyscale supports identical code across AWS, GCP, and Azure, BentoML can be self-hosted across multiple clouds, and Kubeflow runs on any conformant Kubernetes cluster on-premises or across major cloud providers."
    },
    {
      "question": "Which tool has the steepest operational learning curve?",
      "answer": "Kubeflow generally requires the most Kubernetes expertise to operate day to day since it is a multi-component toolkit rather than a managed service, while Anyscale's Hosted plan and BentoML's Bento Cloud offload more infrastructure management."
    }
  ]
};

export default anyscaleVsBentomlVsKubeflowContent;
