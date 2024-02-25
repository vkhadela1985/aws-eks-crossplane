# Crossplane on AWS EKS

## Introduction

Crossplane is an open-source Kubernetes add-on that extends Kubernetes to enable you to manage your infrastructure, services, and applications directly from Kubernetes clusters. It turns Kubernetes into a universal control plane by allowing you to provision, manage, and compose cloud resources and services alongside your applications, using Kubernetes-style declarative configuration. Crossplane adheres to the Kubernetes philosophy of declarative management and automation, aiming to leverage the power of Kubernetes to manage external resources with the same ease as managing pods or deployments within a cluster.

## Why We Need Crossplane

- **Unified API for Infrastructure Management**: Crossplane provides a consistent API to manage different cloud services and resources, enabling developers to provision and manage infrastructure using `kubectl` or any Kubernetes tools. This reduces context switching and the need to learn multiple cloud provider APIs.

- **Infrastructure as Code (IaC)**: With Crossplane, you can define your infrastructure using Kubernetes manifests. This approach to IaC enables version control, peer review, and repeatable deployments across environments.

- **Workload Portability**: Crossplane enables workload portability across different clouds and environments by abstracting the underlying infrastructure details. This makes it easier to migrate applications or run them in multi-cloud and hybrid-cloud environments.

- **Declarative Configuration**: Leveraging Kubernetes' declarative configuration model, Crossplane allows you to specify the desired state of your infrastructure and services, with Kubernetes ensuring that the actual state matches the desired state.

- **Self-Service Infrastructure**: Crossplane can be configured to offer self-service infrastructure provisioning within the bounds of policies and best practices defined by administrators. This empowers developers to provision the resources they need without waiting for operations teams, while still adhering to organizational guidelines.

## Crossplane Setup on AWS EKS

### Prerequisites

1. Install Git: [Git Installation Guide](https://github.com/git-guides/install-git)
2. Install Terraform: [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. Install eksctl: [eksctl Installation Guide](https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/setting-up-eksctl.html)
4. Install kubectl: [kubectl Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
5. Install Helm: [Helm Installation Guide](https://helm.sh/docs/intro/install/)
6. Install Crossplane CLI: [Crossplane CLI Installation Guide](https://docs.crossplane.io/latest/cli/)

### Steps

1. **Provision the EKS Cluster**

   Clone the repository and apply the Terraform configuration to provision the EKS cluster.
   ```bash
   git clone https://github.com/rajendra-jagtap/aws-eks-crossplane.git
   cd aws-eks-crossplane
   terraform init
   terraform plan
   terraform apply
   ```
2. **Enabling IAM principal access to your cluster**
  
   Create an IAM identity mapping for cluster access.
   ```bash
   eksctl create iamidentitymapping --cluster test-eks-cluster --arn <iam-user-arn> --username <username> --group system:masters
   ``````