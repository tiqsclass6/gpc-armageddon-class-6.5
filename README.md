# ☁️ Balerica Inc. Cloud Migration Strategy

![Terraform](https://img.shields.io/badge/IaC-Terraform-844FBA?logo=terraform)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazon-aws)
![Status](https://img.shields.io/badge/Status-In_Progress-yellow)
![Security](https://img.shields.io/badge/Security-Zero_Trust-blue)
![License](https://img.shields.io/badge/License-Internal-lightgrey)

---

## 📌 Executive Summary

This repository contains the **Infrastructure-as-Code (IaC)**, design documents, and automation scripts for **Balerica Inc.’s cloud migration strategy**.  

The project transitions legacy **on-premises Lenovo desktops and VMware-hosted exam delivery apps** into a **hybrid cloud → cloud-native** solution on **AWS**.  

---

## 📂 Project Structure

```plaintext
.
├── 1-yaml-files/
│   ├── buildspec.yaml
│   ├── cloudformation.yaml
│   └── ec2-instance.yaml
├── 1-provider.tf
├── 2-variables.tf
├── 3-vpc.tf
├── 4-subnet.tf
├── 5-igw.tf
├── 6-ec2-instance.tf
├── 7-sg.tf
├── 7-vpn.tf
├── 8-vpn.tf
├── 99-outputs.tf
├── README.md
└── SC1-brazil.sh
```

---

## 🛠️ Tools & Services

- **Terraform** for IaC  
- **AWS WorkSpaces / AppStream 2.0** for exam desktops  
- **Amazon VPC + VPN + Direct Connect** for secure hybrid connectivity  
- **S3 + Glacier** for backups & retention  
- **CodeCommit / CodePipeline** for automation  
- **GuardDuty, Config, IAM** for security & compliance  
- **CloudWatch + X-Ray** for monitoring  

---

## ⚡ Migration Phases & Timeline

| Phase | Duration | Key Deliverables |
|-------|----------|------------------|
| **1. Assessment & Planning** | 1 month | Asset inventory, dependency mapping, pilot in Free Tier |
| **2. Migration & Implementation** | 4–6 months | VM lift-and-shift, WorkSpaces setup, secure browser refactor |
| **3. Optimization & Scaling** | 2–3 months | Cost tuning, IaC replication across global regions |
| **4. Ongoing Operations** | Continuous | Governance (AWS Orgs), DR, monitoring, continuous improvement |

**Projected Timeline:** ~6–12 months (team size dependent).  

---

## 💰 Cost Estimates

- **AWS Infra (EC2, S3, VPC, ~30 desktops/VMs):** $5K–$10K / month  
- **One-time migration (consulting, dev, testing):** $50K–$100K  
- **Support overhead:** Recommend AWS Business tier  

---

## ⚠️ Risk Factors

- **Downtime:** mitigate via blue/green deployments  
- **Data sovereignty:** ensure S3 buckets stay in-region (GDPR, LGPD, CCPA)  
- **Skill gaps:** offset via AWS training & partner consultants  
- **Security breaches:** apply Zero Trust, MFA, encryption, and routine pen-testing  
- **Cost overruns:** enforce budgets and alerts via AWS Budgets & Trusted Advisor  

---

## 🐛 Troubleshooting

| Issue | Possible Cause | Resolution |
|-------|----------------|------------|
| **EC2 not reachable via SSH** | SG not open / wrong CIDR | Update `ssh_cidr` in `7-sg.tf` |
| **VPN not establishing** | On-prem IP mismatch or NAT | Confirm `customer_gateway_ip` is **static** public IP |
| **AMI not launching** | Wrong arch (x86 vs ARM) | Adjust AMI path in `6-ec2-instance.tf` |
| **High latency in exams** | Traffic routed cross-region | Enable **AWS Global Accelerator** |
| **Unexpected billing spikes** | Unused EC2 / NAT gateways | Use **Cost Explorer** & enforce shutdown schedules |

---

## 🚀 Deployment Instructions

### Prerequisites

- Install [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.6+  
- Configure AWS CLI with proper IAM credentials  
- Ensure an **EC2 key pair** exists in your AWS account  

### Steps

```bash
# Initialize providers and modules
terraform init

# Validate syntax
terraform validate

# Plan deployment with required variables
terraform plan \
  -var 'aws_region=us-east-1' \
  -var 'name_prefix=balerica' \
  -var 'key_name=YOUR_KEYPAIR' \
  -var 'customer_gateway_ip=YOUR_ONPREM_PUBLIC_IP' \
  -var 'use_static_routes=false'

# Apply to create resources
terraform apply -auto-approve
```

To destroy the environment when no longer needed:

```bash
terraform destroy -auto-approve
```

---

## 🗺️ Architecture Diagram

![Architecture](5bf61d2d-449d-459a-9d22-390d6c97d7c6.png)

---

## 🚀 Setup & Deployment

### Requirements

- **AWS account** with permissions for VPC, EC2, IAM, and VPN
- **Terraform ≥ 1.6** and **AWS CLI v2**
- An existing **EC2 Key Pair** in your target region
- (Optional) **Docker** if you will use `buildspec.yaml` with CodeBuild

#### 1) Clone & inspect

```bash
git clone <this-repo-url>
cd <this-repo>
tree -L 2
```

#### 2) Configure AWS credentials

```bash
aws configure
```

#### 3) Terraform workflow

```bash
terraform fmt -recursive
terraform init

# Plan with variables (edit values as needed)
terraform plan \
  -var="aws_region=us-east-1" \
  -var="name_prefix=balerica" \
  -var="key_name=YOUR_KEYPAIR" \
  -var="ssh_cidr=0.0.0.0/0" \
  -var="http_cidr=0.0.0.0/0" \
  -var="customer_gateway_ip=YOUR_ONPREM_PUBLIC_IP" \
  -var="use_static_routes=false" \
  -var="onprem_route_cidr=192.168.0.0/16"

# Apply
terraform apply -auto-approve \
  -var="aws_region=us-east-1" \
  -var="name_prefix=balerica" \
  -var="key_name=YOUR_KEYPAIR" \
  -var="ssh_cidr=0.0.0.0/0" \
  -var="http_cidr=0.0.0.0/0" \
  -var="customer_gateway_ip=YOUR_ONPREM_PUBLIC_IP" \
  -var="use_static_routes=false" \
  -var="onprem_route_cidr=192.168.0.0/16"
```

**Outputs:** see `99-outputs.tf` for EC2 public IP/DNS and VPN IDs.

> 🔐 Security tip: Replace `0.0.0.0/0` with your office IP/CIDR for SSH/HTTP in production.

#### 4) Build & push the secure browser image (optional)

**Prereqs:** ECR repository named `secure-browser` (or set `IMAGE_REPO_NAME`), and CodeBuild project configured with `AWS_ACCOUNT_ID` and `AWS_REGION` environment variables.

- If building locally and pushing to ECR:

```bash
# Authenticate Docker to AWS ECR
aws ecr get-login-password --region $AWS_REGION \
  | docker login --username AWS --password-stdin \
    $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Define repository URI
REPO_URI="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/secure-browser"

# Build, tag, and push
docker build -t secure-browser:latest .
docker tag secure-browser:latest $REPO_URI:latest
docker push $REPO_URI:latest

```

- If using **AWS CodeBuild**: point your project to `1-yaml-files/buildspec.yaml`. It will log in, build, tag, push, and emit `imagedefinitions.json` for ECS/CodeDeploy.

#### 5) CloudFormation templates (optional)

Located in `1-yaml-files/` if you want to deploy small scoped stacks:

- `cloudformation.yaml` — VPC + VPN (dynamic/static routing)
- `ec2-instance.yaml` — EC2 in a public subnet with UserData
- `buildspec.yaml` — CodeBuild spec to build/push an image to ECR

Validate with:

```bash
# Validate CloudFormation templates with cfn-lint
cfn-lint 1-yaml-files/cloudformation.yaml
cfn-lint 1-yaml-files/ec2-instance.yaml

```

### 6) Destroy (when done)

```bash
terraform destroy \
  -var="aws_region=us-east-1" \
  -var="name_prefix=balerica" \
  -var="key_name=YOUR_KEYPAIR" \
  -var="customer_gateway_ip=YOUR_ONPREM_PUBLIC_IP"

```

---

## 👤 Author & Contributors

- **Lead Consultant:** TIQS  
- **Client:** Balerica Inc.  
- **Team Lead:** John Sweeney  
- **Repo Maintainer:** [@tiqsclass6](https://github.com/tiqsclass6)  

---
