# Armageddon Task 1 - HA VPN with NCC via Hub-and-Spokes (in Terraform)

![Terraform](https://img.shields.io/badge/Terraform-v1.5%2B-blue?logo=terraform)
![GCP](https://img.shields.io/badge/GCP-Networking-orange?logo=googlecloud)
![Status](https://img.shields.io/badge/Build-Infrastructure--as--Code-success)
![License](https://img.shields.io/badge/License-MIT-green)
![Topology](https://img.shields.io/badge/Topology-Dual--Hub%20%26%208%20Spokes-informational?logo=googlecloud)
![Connectivity](https://img.shields.io/badge/Connectivity-HA%20VPN%20%2B%20BGP-blue?logo=googlecloud)
![NCC](https://img.shields.io/badge/NCC-Enabled-blueviolet?logo=googlecloud)
![Dynamic Routing](https://img.shields.io/badge/Dynamic%20Routing-Global-9cf?logo=googlecloud)
![Regions](https://img.shields.io/badge/Regions-asia--southeast1%20%7C%20us--central1-lightgrey)
![Diagrams](https://img.shields.io/badge/Diagrams-Draw.io%20%7C%20Mermaid-success)
![IaC](https://img.shields.io/badge/IaC-Modules%20%7C%20Multi--file-orange)
![Terraform Checks](https://img.shields.io/badge/Terraform-fmt%20%7C%20validate-brightgreen)
![ASNs](https://img.shields.io/badge/ASNs-65501%20%7C%2065515-informational)

---

![diagram](/Screenshots/diagram.png)

## 📖 Project Summary

This project automates the provisioning of a **hub-and-spoke VPN topology** on **Google Cloud Platform (GCP)** using **Terraform**. It connects **Balerica Inc. (hub)** with **Wolfpack (hub)**, enabling **cross-account connectivity** and **ring topology subnet peering**.  

The deployment includes:  

- **Custom VPCs** for each participant
- **Cloud Routers & VPN Tunnels** for site-to-site links
- **Network Connectivity Center (NCC)** for centralized management
- **IAM and Service Agents** for least-privilege access

---

## 📘 Task 1: Group VPN Topology

### Objective

The Network team needs automated infrastructure to:  

1. Build a **classic/HA VPN connection** between **Balerica Inc. (Hub)** and **Wolfpack (Hub).**  
2. Ensure **specific subnets** from each team member can communicate directly.  
3. Create a **ring topology** between all members and the hub.  

### Requirements

- Multiple GCP accounts (hub + participants).  
- Network diagram describing:
  - Hub `(Balerica Inc.)`, Hub `(Wolfpack)`
  - **Wolfpack Member Spokes**
  - VPN tunnels and peerings

---

## 📑 References

- [GCP NCC Overview](https://cloud.google.com/network-connectivity/docs/network-connectivity-center/concepts/overview)  
- [Terraform Provider Docs](https://developer.hashicorp.com/terraform/language/providers/configuration)  
- [Using Multiple Credentials](https://astrafy.io/the-hub/blog/technical/terraform-provider-using-multiple-credentials)  
- [GCP VPN Concepts](https://cloud.google.com/network-connectivity/docs/vpn/concepts/overview)

---

## 🛠️ Key Features

- **Cross-Account VPN**: Secure tunnels between Balerica and Wolfpack.  
- **Ring Topology**: Each spoke subnet can reach other spokes and the hub.  
- **Scalable Design**: Modular `.tf` files for each participant.  
- **NCC Support**: Centralized monitoring and connectivity.  
- **Security First**: IAM with least-privilege and controlled service agents.  

---

## 📂 Project Structure

```plaintext
├── Screenshots/           # Architecture & Terraform screenshots
│   ├── balerica-cloud-vpn.jpg
│   ├── balerica-hub-with-spokes.jpg
│   ├── vpn-balerica-to-wolfpack-with-tunnels.jpg
│   ├── wolfpack-spokes-to-hub.jpg
│   ├── terraform-apply.jpg
│   └── terraform-destroy.jpg
│
├── .gitignore             # Omit sensitive files to GitHub
├── 0-authentication.tf    # Service account authentication
├── 1-provider.tf          # GCP provider setup
├── 2-variables.tf         # Global variables (project IDs, regions, CIDRs)
├── 3-vpc.tf               # Core VPC resource definitions
├── 4-subnets.tf           # Subnet definitions across multiple regions
├── 5-cloud-router.tf      # Cloud Router setup
├── 6a-balerica-vpn.tf     # VPN config for Balerica Inc. (Hub)
├── 6b-wolfpack-vpn.tf     # VPN config for Wolfpack (Spoke)
├── 7-ncc.tf               # Network Connectivity Center (NCC) integration
├── 8-spokes.tf            # Additional spokes and routing
├── 9-service-agents.tf    # Service agents for NCC and VPN
└── 10-iam.tf              # IAM roles, permissions, bindings
└── README.me              # Project documentation
```

---

## 🚀 Deployment Steps

1. **Clone the repo**

   ```bash
   git clone https://github.com/<your-github-username>/<your-repo-url>
   cd <your-repo-name>
   ```

2. **Initialize Terraform and GCS Backend**

   ```bash
   terraform init
   ```

3. **Format & Validate for IaC**

   ```bash
   terraform fmt
   terraform validate
   ```

4. **Plan Your Deployment**

   ```bash
   terraform plan
   ```

5. **Apply Your Infrastructure**

   ```bash
   terraform apply -auto-approve
   ```

   ![Terraform Apply](Screenshots/terraform-apply.jpg)

## 🖼️ *Show Your Work* ~ **Kevin Samuels**

| Command | Screenshot |
| ------- | ------- |
| **Balerica Inc. Cloud VPN** | ![Hub with VPN](Screenshots/balerica-cloud-vpn.jpg) |
| **Balerica Inc. (Hub) w/ Spokes** | ![Hub with Spokes](Screenshots/balerica-hub-with-spokes.jpg) |
| **Balerica Inc. Spokes to Hub** | ![balerica-spokes-to-hub](Screenshots/balerica-spokes-to-hub.jpg) |
| **Wolfpack Cloud VPN** | ![Wolfpack VPN](Screenshots/wolfpack-cloud-vpn.jpg) |
| **Wolfpack Hub w/ Spokes** | ![Wolfpack Hub with Spokes](Screenshots/wolfpack-hub-with-spokes.jpg) |
| **Wolfpack Spokes to Hub** | ![Wolfpack Spokes to Hub](Screenshots/wolfpack-spokes-to-hub.jpg) |

## VPN Tunnels

| Location Tunnels | Screenshot |
| ------- | ------- |
| **HA VPN Balerica Inc. to Wolfpack** | ![Balerica to Wolfpack](Screenshots/vpn-balerica-to-wolfpack-with-tunnels.jpg) |
| **HA VPN Wolfpack to Balerica Inc.** | ![Wolfpack to Balerica](Screenshots/vpn-wolfpack-to-balerica-with-tunnels.jpg) |

---

## 🧹 Teardown

To destroy all resources and avoid charges:

> **Destroy**

   ```bash
   terraform destroy -auto-approve
   ```

  ![Terraform Destroy](Screenshots/terraform-destroy.jpg)

---

## 🧰 Troubleshooting

| Issue | Cause | Fix |
|-------|-------|-----|
| `failed to connect to backend` | IAP/SSH firewall missing | Add firewall rule to allow `35.235.240.0/20` on TCP 22 |
| `terraform plan` shows no changes | State drift | Run `terraform refresh` and check remote state |
| VPN tunnels stuck in `NOT ESTABLISHED` | Misconfigured peer IPs or shared secret | Verify external IPs and PSKs in both configs |
| NCC does not show connections | Service agents missing roles | Check `9-service-agents.tf` and re-apply IAM bindings |
| Authentication errors | Missing credentials JSON | Update `GOOGLE_APPLICATION_CREDENTIALS` env variable |

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.  
- **Team Lead:** John Sweeney  

### 🙏 Inspiration

> This project was built with inspiration, mentorship, and guidance from:

- Sensei **"Darth Malgus" Theo**
- Lord **Beron**
- Sir **Rob**
- Jedi Master **Derrick**
