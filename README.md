# 🔥 GCP Armageddon - High Priority Taskers

---

## Branches (Tasks 1–3)

### Branches

[![Task-1 Branch](https://img.shields.io/badge/Branch-task--1-blue?logo=git)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-1)
[![Last Commit – task-1](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon/task-1?logo=github&label=last%20commit)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-1)
[![Task-2 Branch](https://img.shields.io/badge/Branch-task--2-blue?logo=git)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2)
[![Last Commit – task-2](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon/task-2?logo=github&label=last%20commit)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2)
[![Task-3 Branch](https://img.shields.io/badge/Branch-task--3-blue?logo=git)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-3)
[![Last Commit – task-3](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon/task-3?logo=github&label=last%20commit)](https://github.com/tiqsclass6/gpc-armageddon/tree/task-3)

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

### Task 2 — Cloud Run with Traffic Splitting (Be a Man #10)

- GitHub: [Assignment Guide — Cloud Run Example](https://github.com/aaron-dm-mcdonald/cloud-run-ex/blob/main/assignment.md)  
- Google Cloud Docs: [Deploying from Source to Cloud Run](https://cloud.google.com/run/docs/deploying-source-code)  
- Google Cloud Docs: [Splitting Traffic Between Revisions](https://cloud.google.com/run/docs/rollouts-rollbacks-traffic-migration)  

### Task 3 — Regional Scale-Out VMs + Connectivity

- Google Cloud Docs: [Compute Engine VM Instances](https://cloud.google.com/compute/docs/instances)  
- Google Cloud Docs: [Firewall Rules](https://cloud.google.com/vpc/docs/firewalls)  
- Terraform Docs: [Google Provider — Compute Engine Resources](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)  
- Terraform Docs: [Terraform Configuration Language](https://developer.hashicorp.com/terraform/language)  

---

## 🛠️ Tech Stack

### Core (Networking & IaC)

- **Terraform ≥ 1.5** — multi-account/provider **aliases**, modules, remote state
- **Google Cloud (GCP) Networking** — **VPC, Subnets, Cloud Router (BGP), HA VPN, Network Connectivity Center (NCC)**
- **GCP IAM & Service Accounts** — least-privilege bindings for VPN/NCC/Compute
- **gcloud CLI** — auth + project context for plans/applies

### Diagrams

- **Mermaid** — inline diagrams for GitHub/README
- **Lucidchart** (optional) — polished diagrams (export PNG/SVG for README)

### CI/CD (required for Task 2)

- **Google Cloud Build** — Terraform fmt/validate/plan/apply pipeline

### Secrets & Config (recommended)

- **GCP Secret Manager** or **env vars** for VPN PSKs & provider creds

> Note: Removed **Flask** and **Cloud Run** from this project’s stack, since this repo focuses on **network connectivity with Terraform**. If Task 2/3 introduces app components, we can add them back under a separate “Application” subsection.

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

**Task 3 — Regional Scale‑Out VMs + Connectivity in Terraform (Be A Man #5):**

- Create a **Linux VM in a separate region for each group member**.
- Use a **firewall tag named after each member** for the member’s Linux VM.
- Ensure the **Windows VM can reach all Linux VMs**.
- Provide a **step‑by‑step guide** in this README (to be added in the next commit under “Task 3 Guide”).  
- Provide a **Terraform file per participant** with comments.

> ℹ️ This main branch serves as the landing page and coordination space. Detailed app code for Task 2 is on the branch below.

---

## 📌 Notes

- For detailed work and implementation steps, check the [`task-2`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2) branch.  
- Upcoming commits will add the **Task 3 step‑by‑step guide** and **Task 1 topology diagram + Terraform layout** to this README.

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney
