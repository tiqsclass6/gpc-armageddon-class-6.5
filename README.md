# Armageddon Task 3 – Multi-Region LB

![Terraform](https://img.shields.io/badge/IaC-Terraform-blueviolet?logo=terraform)
![Google Cloud](https://img.shields.io/badge/Cloud-GCP-yellow?logo=googlecloud)
![Challenge](https://img.shields.io/badge/Challenge-Level%205-red)
![Infra](https://img.shields.io/badge/Infra-Multi--Region-success?logo=googlecloud)
![Status](https://img.shields.io/badge/Status-Build%20Passing-brightgreen)

---

## Task 3

> The **Operations Team** wants to ensure scalability for their applications.

Complete [Be a Man 5](https://github.com/tiqsclass6/gcp-be-a-man-level-5), but now creating a **Linux VM**** in a separate region for each region. **Firewall tag** for each Linux VM must be named after each region, and the **Windows VM** must be able to access all Linux VMs.

**Step-by-Step Guide** must be provided within the [README.md](https://github.com/tiqsclass6/gpc-armageddon/blob/task-3/README.md) for Task 3. There must be a `.tf` file for each region, complete with comments. **`This will be in terraform!!`**

---

## 📊 Architecture Diagram

![diagram](/Screenshots/diagram.png)

This project automates deployment of a **multi-region Google Cloud Platform infrastructure** using **Terraform**. It provisions a **Windows RDP VM** in a public subnet and **regional Linux MIGs** across **Brazil, South Africa, and Tokyo**, each behind a **Global External HTTP Load Balancer** with autoscaling, tagging-based firewalls, and custom startup scripts.

Each Linux VM serves a **customized Apache web page** with background images, overlay text, and region-specific banners.

---

## 🧱 Project Structure

```plaintext
gcp-armageddon-task-3/
.
└── Screenshots/
    ├── destroy-tf.jpg
    ├── firewalls.jpg
    ├── health-checks.jpg
    ├── instance-groups.jpg
    ├── instance-templates.jpg
    ├── lb-backend.jpg
    ├── lb-closed-view.jpg
    ├── lb-frontend.jpg
    ├── lb-full-view.jpg
    ├── lb-monitoring.jpg
    ├── lb-results.jpg
    ├── outputs-tf.jpg
    ├── rdp-results.jpg
    ├── rdp-results-video.mp4
    ├── subnets.jpg
    ├── vm-instances.jpg
    └── task3.jpg
├── .gitignore
├── 0-authentication.tf
├── 1-provider.tf
├── 2-variables.tf
├── 3-vpc.tf
├── 4-subnets.tf
├── 5-firewalls.tf
├── 6-vm-instances.tf
├── 7-instance-template.tf
├── 8-mig.tf
├── 9-health-checks.tf
├── 10-autoscale-policy.tf
├── 11-lb.tf
├── 12-outputs.tf
├── README.md
├── SC1-brazil.sh
├── SC2-southafrica.sh
├── SC3-tokyo.sh
```

---

## 🚀 Key Features

- **1 custom VPC** spanning multiple regions  
- **Windows VM** in Iowa public subnet with RDP enabled (tag: `rdp-public`)  
- **Linux MIGs** in Brazil, South Africa, Tokyo — all backends of a **Global HTTP LB**  
- **Global External HTTP Load Balancer** with unified health check (`tsa-health-check`)  
- **Autoscaling policies** for each MIG (min=2, max=3, target CPU 25%)  
- **Firewall rules**:
  - `allow-rdp-public` → RDP only to Windows VM
  - `allow-health-check` → allows Google HC IPs to backend VMs on port 80
  - `allow-internal` → intra-VPC communication  
- **Custom startup scripts** (`SC1-brazil.sh`, `SC2-southafrica.sh`, `SC3-tokyo.sh`) configuring Apache, fonts, region banners, and background images  
- **Screenshots & RDP session capture** prove regional connectivity & web app delivery  

---

## 📂 Terraform File Summaries

- **`0-authentication.tf`** – configures GCP service account JSON auth  
- **`1-provider.tf`** – sets project, region, provider versions  
- **`2-variables.tf`** – declares shared variables (regions, zones, names)  
- **`3-vpc.tf`** – defines one custom VPC `(tiqs-vpc)` with global dynamic routing enabled and no auto subnet creation  
- **`4-subnets.tf`** – creates private subnets per region + one public subnet  
- **`5-firewalls.tf`** – rules for health checks, RDP, and internal traffic  
- **`6-vm-instances.tf`** – deploys Windows RDP VM in public subnet  
- **`7-instance-template.tf`** – defines base templates for Linux webservers  
- **`8-mig.tf`** – creates three MIGs (Brazil, South Africa, Tokyo) with named ports and auto-healing  
- **`9-health-checks.tf`** – HTTP health check (`tsa-health-check`) on `/`  
- **`10-autoscale-policy.tf`** – autoscaling for each MIG (CPU-based)  
- **`11-lb.tf`** – Global External HTTP Load Balancer, URL map, proxy, backend service  
- **`12-outputs.tf`** – outputs Windows RDP IP and LB frontend IP  

---

## 🛠️ How to Deploy

1. **Authenticate to GCP**

   ```bash
   gcloud auth application-default login
   ```

   or set `GOOGLE_APPLICATION_CREDENTIALS` to your JSON key.

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Validate & plan**

   ```bash
   terraform validate
   terraform plan
   ```

4. **Apply infrastructure**

   ```bash
   terraform apply -auto-approve
   ```

5. **Retrieve Outputs**

   ```bash
   terraform output
   ```

   - `windows_rdp_ip` → connect via RDP to Windows VM  
   - `lb_ip_address` → test the global HTTP load balancer
      ![outputs-tf](/Screenshots/outputs-tf.jpg)

---

## 🖼️ Show Your Work

| Description | File |
|-------------|------|
| **Subnets** | ![subnets](/Screenshots/subnets.jpg) |
| **VM Instances** | ![vm-instances](/Screenshots/vm-instances.jpg) |
| **Firewall Rules** | ![firewalls](/Screenshots/firewalls.jpg) |
| **Health Checks** | ![health-checks](/Screenshots/health-checks.jpg) |
| **Instance Templates** | ![instance-templates](/Screenshots/instance-templates.jpg) |
| **MIGs – Summary** | ![instance-groups](/Screenshots/instance-groups.jpg) |
| **Load Balancer (Closed View)** | ![lb-closed-view](/Screenshots/lb-closed-view.jpg) |
| **Load Balancer (Full View)** | ![lb-full-view](/Screenshots/lb-full-view.jpg) |
| **Load Balancer (Monitoring)** | ![lb-monitoring](/Screenshots/lb-monitoring.jpg) |
| **Load Balancer (Backend)** | ![lb-backend](/Screenshots/lb-backend.jpg) |
| **Load Balancer (Frontend)** | ![lb-frontend](/Screenshots/lb-frontend.jpg) |
| **Load Balancer (Results)** | ![lb-results](/Screenshots/lb-results.jpg) |
| **Windows VM -> Webpages (South Africa, Brazil, Tokyo)** | ![rdp-results](/Screenshots/rdp-results.jpg) |

---

## 🧹 Teardown

To destroy all resources and avoid charges:

```bash
terraform destroy -auto-approve
```

   ![destroy-tf](/Screenshots/destroy-tf.jpg)

**This removes:**

- VPC + subnets
- Windows VM + Linux MIGs
- Autoscalers + backend service
- Global load balancer + forwarding rule
- Firewall rules & health checks

---

## 🛠️ Troubleshooting

| Issue | Resolution |
|-------|------------|
| **LB shows 0/0 healthy** | Ensure MIGs reference the same health check (`tsa-health-check`), Apache installed (via NAT or external IPs), and firewall allows GFE IPs. |
| **Startup script fails (no Apache)** | Add **Cloud NAT per region** OR update templates with `access_config {}` to give external IPs. |
| **RDP not working** | Confirm firewall rule `allow-rdp-public` has correct source range and Windows VM has tag `rdp-public`. |
| **Autoscaler not scaling** | Verify `google_compute_region_autoscaler` is attached to each MIG, `min_replicas` > 0. |
| **Custom webpage not loading** | Check serial logs for script execution; ensure Apache is serving `/var/www/html/index.html`. |
| **NAT vs external IPs** | For production, prefer Cloud NAT. External IPs are fine for demos. |

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
