# 🔥 GCP Armageddon - High Priority Taskers

---

## 🌿 Branches (Tasks 1–3 + Solo Project)

[![Task-1 Branch](https://img.shields.io/badge/Branch-task--1-blue?logo=git)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-1)
[![Last Commit – task-1](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon/task-1?logo=github&label=last%20commit)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-1)
[![Task-2 Branch](https://img.shields.io/badge/Branch-task--2-blue?logo=git)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2)
[![Last Commit – task-2](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon/task-2?logo=github&label=last%20commit)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2)
[![Task-3 Branch](https://img.shields.io/badge/Branch-task--3-blue?logo=git)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-3)
[![Last Commit – task-3](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon/task-3?logo=github&label=last%20commit)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-3)
[![Solo-Project Branch](https://img.shields.io/badge/Branch-solo--project-blue?logo=git)](https://github.com/tiqsclass6/gpc-armageddon-class-6.5/tree/solo-project)
[![Last Commit – solo-project](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon-class-6.5/solo-project?logo=github&label=last%20commit)](https://github.com/tiqsclass6/gpc-armageddon-class-6.5/tree/solo-project)

---

## 📖 Overview

This repository contains the **Armageddon App**, a Python Flask application and companion infrastructure tasks designed to demonstrate deployment workflows on **Google Cloud Run**, scalable infrastructure with **Terraform**, and cross-team networking on **GCP**.

---

## 📚 References

### Task 1 — Multi-Account VPN + Ring Topology

- Google Cloud: [Network Connectivity Center Overview](https://cloud.google.com/network-connectivity/docs/network-connectivity-center/concepts/overview)
- Google Cloud: [Cloud VPN Concepts](https://cloud.google.com/network-connectivity/docs/vpn/concepts/overview)
- HashiCorp Terraform Docs: [Provider Configuration](https://developer.hashicorp.com/terraform/language/providers/configuration)
- AstraFy Blog: [Using Multiple Credentials in Terraform](https://astrafy.io/the-hub/blog/technical/terraform-provider-using-multiple-credentials)

### Task 2 — Cloud Run with Traffic Splitting (Be a Man 10)

- GitHub: [Assignment Guide — Cloud Run Example](https://github.com/aaron-dm-mcdonald/cloud-run-ex/blob/main/assignment.md)
- Google Cloud Docs: [Deploying from Source to Cloud Run](https://cloud.google.com/run/docs/deploying-source-code)
- Google Cloud Docs: [Splitting Traffic Between Revisions](https://cloud.google.com/run/docs/rollouts-rollbacks-traffic-migration)

### Task 3 — Regional Scale-Out VMs + Connectivity

- Google Cloud Docs: [Compute Engine VM Instances](https://cloud.google.com/compute/docs/instances)  
- Google Cloud Docs: [Firewall Rules](https://cloud.google.com/vpc/docs/firewalls)
- Terraform Docs: [Google Provider — Compute Engine Resources](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)
- Terraform Docs: [Terraform Configuration Language](https://developer.hashicorp.com/terraform/language)

### Solo Project - Cloud Migration

- AWS Cloud: [AWS VPC Overview](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- AWS Cloud: [AWS Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)
- AWS Cloud: [AWS Global Accelerator](https://aws.amazon.com/global-accelerator/)
- AWS Cloud: [Infrastructure as Code with Terraform](https://developer.hashicorp.com/terraform/intro)
- AWS Cloud: [AWS Backup](https://aws.amazon.com/backup/)
- AWS Cloud: [Amazon ECS on Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html)
- AWS Cloud: [Amazon Rekognition – AI for Proctoring](https://aws.amazon.com/rekognition/)
- AWS Cloud: [AWS Migration Evaluator](https://aws.amazon.com/migration-evaluator/)
- AWS Cloud: [AWS Application Migration Service](https://aws.amazon.com/application-migration-service/)
- AWS Cloud: [Cloud Adoption Framework (CAF)](https://aws.amazon.com/professional-services/CAF/)
- AWS Cloud: [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

---

## 🛠️ Tech Stack

### Core (Networking & IaC)

- **Terraform ≥ 1.5** — Infrastructure as Code for multi-region VPCs, subnets, EC2, VPNs, and security groups  
- **Amazon Web Services (AWS)** —  
  - **VPC & Subnets** (multi-AZ design for resiliency)  
  - **Site-to-Site VPN / Direct Connect** for hybrid connectivity  
  - **IAM & Roles** with least-privilege policies for EC2, VPN, and networking services  
  - **S3 + Glacier** for backups and cross-region replication  
- **gcloud / aws CLI** — project context, credentials, and plan/apply automation  

### Diagrams

- **Mermaid** — lightweight inline diagrams for GitHub/README  
- **Lucidchart** or **Diagrams (Python)** — polished architecture diagrams (export PNG/SVG for README + slides)  

### CI/CD

- **AWS CodePipeline / CodeBuild** — Terraform `fmt/validate/plan/apply` pipeline  
- **GitHub Actions (optional)** — workflow automation for linting (`cfn-lint`, `terraform validate`)  

### Secrets & Config

- **AWS Secrets Manager** or environment variables for VPN PSKs, key pairs, and Terraform provider creds  

> Note: Application services (e.g., AppStream, WorkSpaces, ECS Fargate) will be layered in during Task 2/3. The current stack is **networking + infrastructure automation first**, followed by secure exam app modernization.

---

## 🔗 Branches

### [`Task 1 Branch`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-1)

![task1-diagrams](/diagrams/task1-diagram.png)

**Task 1 — Multi‑Account VPN + Ring Topology (Terraform):**

- Build a **Classic or HA VPN** between **Balerica Inc. (GCP)** and your **team’s GCP account(s)**.
- Connect **specific subnets** from each team member to each other (ring or similar topology) **and** to Balerica Inc.
- Provide a **Terraform module/file per participant** for their connections (to Balerica and to peers) with clear comments.
- Include a **network topology diagram** that shows the inter‑member ring and connections to Balerica Inc.
- Add evidence: screenshots of VPN tunnels = `ESTABLISHED`, Cloud Router BGP sessions = `ESTABLISHED`, and learned routes to peer prefixes.

### What’s included in `task-1`

- Scope/requirements and links for Task 1, plus references to provider configuration and multi-account patterns.
- Use provider **aliases / multiple credentials** to target the hub and participant projects from a single workspace.
- Ensure unique, non-overlapping CIDRs per participant; set VPC `dynamic routing mode = GLOBAL` where cross-region propagation is required.

### [`Task 2 Branch`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2)

![task2-diagrams](/diagrams/task2-diagram.png)

**Task 2 — Cloud Run with Traffic Splitting (Be a Man #10):**

> This task implements a Flask app deployed on **Google Cloud Run** with traffic split across **four revisions** at **40% / 40% / 10% / 10%**. It includes CI/CD via **Cloud Build** and a full set of screenshots and docs.

### What’s included in `task-2`

- **Cloud Run deployment** of a Flask web app using **Google Cloud Buildpacks**.
- **Traffic splitting across four revisions** (v1, v2, v3, v4) at **40/40/10/10** using revision tags.
- **Environment-based variants** (set in *Variables & Secrets* per revision):
  - **version1: “You Are The One Neo”**
  - **version2: “Fight Smith Until the End”**
  - **version3: “Don’t Give Up”**
  - **version4: “Smith Is Destroyed”**
- **CI/CD with Cloud Build**: repository-connected trigger that builds and deploys on commit.
- **Documentation & evidence**: screenshots of Cloud Build, service config, revision env vars, and traffic split.

### Repo layout (key files)

- `main.py` — Flask entrypoint  
- `templates/index.html` — UI template (Matrix background + dynamic text via env vars)  
- `.env` — example environment values (**`do not commit secrets`**)
- `requirements.txt` — Python deps  
- `Screenshots/` — deployment evidence (e.g., `cloud-run-from-github.jpg`, `cloud-run-with-revisions.jpg`, `cloud-run-split-traffic-revisions.jpg`, `armageddon-app-v1..v4.jpg`, `diagram.png`)  
- `README.md` — step-by-step guide, troubleshooting, and screenshot links

### [`Task 3 Branch`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-3)

![task3-diagrams](/diagrams/task3-diagram.png)

**Task 3 — Regional Scale‑Out VMs + Connectivity in Terraform (Be A Man 5):**

- Create a **Linux VM in a separate region for each group member**.
- Use a **firewall tag named after each member** for the member’s Linux VM.
- Ensure the **Windows VM can reach all Linux VMs**.
- Provide a **step‑by‑step guide** in this README (to be added in the next commit under “Task 3 Guide”).  
- Provide a **Terraform file per participant** with comments.

> ℹ️ This main branch serves as the landing page and coordination space. Detailed app code for Task 2 is on the branch below.

Here’s the exact **Solo Project** section I inserted into your README:

### [`Solo Project Branch`](https://github.com/tiqsclass6/gpc-armageddon-class-6.5/tree/solo-project)

#### *Network Diagram Will Go Here*

**Solo Project — End-to-End GCP Deployment (Terraform + Cloud Build):**

- **Networking:** Dedicated VPC, subnets, firewall rules, and optional **HA VPN** connectivity to the class hub.
- **Compute:** Per-region **Compute Engine** instances for testing connectivity and latency.
- **App (optional):** Minimal container/service to validate egress, IAM, and logging paths.
- **CI/CD:** Cloud Build pipeline for `terraform fmt/validate/plan/apply`, with triggers on push.
- **State & Secrets:** Remote state (GCS) and Secret Manager for sensitive values (e.g., VPN PSKs).
- **Docs & Evidence:** README steps, diagrams, and screenshots to prove connectivity and provisioning.

#### Quick Start (Solo Project)

```bash
gcloud config set project <YOUR_PROJECT_ID>
```

```bash
terraform fmt
terraform init
terraform plan
terraform apply -auto-approve
```

> Tip: Use distinct **CIDR ranges** from Tasks 1–3 to avoid overlaps; keep firewall tags consistent for end-to-end reachability.

---

## 📌 Notes

- For detailed work and implementation steps, check the [`task-2`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2) branch.  
- Upcoming commits will add the **Task 3 step‑by‑step guide** and **Task 1 topology diagram + Terraform layout** to this README.
- The [`solo-project`](https://github.com/tiqsclass6/gpc-armageddon-class-6.5/tree/solo-project) branch contains an end-to-end GCP deployment with Terraform + Cloud Build pipelines.  
- Task 1 deliverables will include both the **current network topology** and the **recommended cloud-based topology**, with diagrams and Terraform layouts.  
- Task 2 deliverables provide written solutions to the **three most pressing pain points**, with mitigation strategies, drawbacks, and benefits.  
- Task 3 deliverables will include a **6+ slide presentation**, detailing cloud provider services, management responsibilities (AWS-managed vs. co-managed vs. Balerica-managed), and a **phased migration timeline**.  

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.  
- **Team Lead:** John Sweeney  

### 🙏 Inspiration

> This project was built with inspiration, mentorship, and guidance from:

- Sensei **"Darth Malgus" Theo**
- Lord **Beron**
- Sir **Rob**
