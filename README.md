# Armageddon App 🚀

---

![Python](https://img.shields.io/badge/python-3.9%2B-blue?logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/flask-webapp-green?logo=flask&logoColor=white)
![Cloud Run](https://img.shields.io/badge/Google%20Cloud-Run-4285F4?logo=googlecloud&logoColor=white)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

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

## 🔗 Branches

### [`Task 1 Branch`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-1)

**Task 1 — Multi‑Account VPN + Ring Topology (Terraform):**

- Build a **Classic or HA VPN** between **Balerica Inc. (GCP)** and your **team’s GCP account(s)**.
- Connect **specific subnets** from each team member to each other (ring or similar topology) **and** to Balerica Inc.
- Provide a **Terraform module/file per participant** for their connections (to Balerica and to peers) with clear comments.
- Include a **network topology diagram** that shows the inter‑member ring and connections to Balerica Inc.
- References:
  - GCP Network Connectivity Center overview: <https://cloud.google.com/network-connectivity/docs/network-connectivity-center/concepts/overview>
  - Terraform provider configuration: <https://developer.hashicorp.com/terraform/language/providers/configuration>
  - Multiple credentials with Terraform: <https://astrafy.io/the-hub/blog/technical/terraform-provider-using-multiple-credentials>
  - GCP Cloud VPN overview: <https://cloud.google.com/network-connectivity/docs/vpn/concepts/overview>

### [`Task 2 Branch`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2)

**Task 2 — Cloud Run with Traffic Splitting (Be a Man #10):**

Task 2 demonstrates the following:

- Deploy the app to **Cloud Run** and split traffic across **four applications/revisions** at **40% / 40% / 10% / 10%**.
- Implementation references and rubric: <https://github.com/aaron-dm-mcdonald/cloud-run-ex/blob/main/assignment.md>
- Code and screenshots for this task live on the **`task-2` branch** (see link below).

- Building and deploying a **Flask web application** on **Google Cloud Run**.  
- Integration with **Google Cloud Build** for automated builds from GitHub commits.  
- Application structure including:
  - `main.py` Flask entrypoint  
  - `templates/index.html` for HTML rendering  
  - `.env` configuration for environment variables  
  - `requirements.txt` for Python dependencies  
  - `Screenshots/` folder with deployment evidence (Cloud Run revisions, traffic splitting, Cloud Build logs, and GitHub confirmation).  
- Cloud Run **traffic splitting across multiple revisions** (40% / 40% / 10% / 10%).  
- README with:
  - Project structure  
  - Deployment instructions  
  - Troubleshooting guide  
  - Screenshots

### [`Task 3 Branch`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-3)

**Task 3 — Regional Scale‑Out VMs + Connectivity (Terraform):**

- Create a **Linux VM in a separate region for each group member**.
- Use a **firewall tag named after each member** for the member’s Linux VM.
- Ensure the **Windows VM can reach all Linux VMs**.
- Provide a **step‑by‑step guide** in this README (to be added in the next commit under “Task 3 Guide”).  
- Provide a **Terraform file per participant** with comments.

> ℹ️ This main branch serves as the landing page and coordination space. Detailed app code for Task 2 is on the branch below.

---

## 🛠️ Tech Stack

- **Python 3**  
- **Flask**  
- **Google Cloud Run** (serverless deployment)  
- **Google Cloud Build** (CI/CD pipeline)  
- **Terraform** (networking & compute for Tasks 1 and 3)

---

## 📌 Notes

- For detailed work and implementation steps, check the [`task-2`](https://github.com/tiqsclass6/gpc-armageddon/tree/task-2) branch.  
- Upcoming commits will add the **Task 3 step‑by‑step guide** and **Task 1 topology diagram + Terraform layout** to this README.

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney
