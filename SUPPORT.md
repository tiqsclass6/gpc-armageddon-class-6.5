# Support Guidelines

Thank you for using **GPC Armageddon**! This document explains how to get help for **all tasks** in this repo:

- **Task 1:** Terraform networking (VPCs, Subnets, Cloud Router/BGP, HA/Classic VPN, NCC)
- **Task 2:** Application components (e.g., Cloud Run) and CI/CD
- **Task 3:** Additional infrastructure/networking extensions

> If your concern involves a **security vulnerability**, please follow **SECURITY.md** instead of opening a public issue.

---

## Where to Get Help

### 🐞 Report Bugs (GitHub Issues)

- Use the **Issues** tab: <https://github.com/tiqsclass6/gpc-armageddon/issues>
- Please include:
  - **Branch:** `task-1` / `task-2` / `task-3`
  - **Commit SHA** (if known)
  - **What happened vs. what you expected**
  - **Steps to reproduce** (exact commands, order, and flags)
  - **Relevant files/snippets** (redact secrets)
  - **Logs / screenshots** (e.g., `terraform plan/apply`, Cloud Router BGP status, VPN tunnel status)

### 💡 Request Features

- Open an Issue with the **Feature Request** label.
- Describe the **use case**, **benefit**, and any **alternatives** you tried.

### 🔒 Security Issues

- **Do not** open a public issue.
- Follow **SECURITY.md** (private email/advisory + 72h ack / 14d target fix).

### 📧 Contact Maintainers

- Email: `daquietstorm22@gmail.com`

---

## Before You File an Issue

- Search existing issues and discussions.
- Re-run with the latest commit on your branch.
- For Terraform:
  - `terraform fmt` / `terraform validate`
  - Confirm **Terraform ≥ 1.5**
  - Check provider auth (`gcloud auth application-default login`), project/region
- For Cloud Run / Task 2:
  - Confirm service URL, IAM, and ingress settings
  - Check last build logs (Cloud Build / CI)

---

## Triage & Labels

We use labels to communicate status:

- `bug`, `feature`, `question`, `docs`
- `needs-repro`, `needs-info`, `blocked`, `duplicate`, `wontfix`
- `security` (redirects to SECURITY.md workflow)
- `good first issue`, `help wanted`

---

## Response Times (SLA Targets)

| Request Type         | First Response          | Resolution Target       |
|----------------------|-------------------------|-------------------------|
| Security reports     | 72 hours (ack)          | 14 days (critical/high) |
| Bugs / Repro issues  | 72 hours                | Best-effort per severity|
| Feature requests     | 5 business days         | Roadmap-dependent       |
| General questions    | 5 business days         | —                       |

> Note: Targets are best-effort and may vary with complexity and scope.

**Support hours:** Mon–Fri, business hours **9:00 AM PDT - 5:00 PM PDT (America/Los_Angeles**).

---

## What to Include (Templates)

### Bug Report (Terraform / Networking)

```plaintext
Branch: task-1 (or task-3)
Commit SHA: <optional>
Terraform version: <terraform -v>
gcloud version: <gcloud version>
Project IDs (redact if needed): <hub/spoke projects>
Region(s): <e.g., asia-southeast1, us-central1>
What happened:
What you expected:
Repro steps (exact commands):
Relevant outputs/logs (redacted):
Diagram or link (optional):
```

### Bug Report (App / CI – Task 2)

```plaintext
Branch: task-2
Commit SHA: <optional>
Service: Cloud Run (service name/URL)
Build system: Cloud Build / Jenkins / GitHub Actions
What happened:
What you expected:
Repro steps (deploy/build commands):
Logs/screenshots:
```

### Feature Request

```plaintext
Problem / Use case:
Proposed solution:
Alternatives considered:
Impact (who benefits?):
```

---

## Troubleshooting Quick Checks

### Task 1 / Task 3 (Terraform Networking)

- **BGP not Established?**
  - Ensure **Cloud Router** and **HA VPN** are in the **same region**.
  - Verify BGP peer IPs use link-local ranges (`169.254.0.0/16`) with proper mask (/30 or /31).
  - Check **PSKs** match on both sides.
- **No spoke↔spoke routes?**
  - VPC peering is **non-transitive**. Use **HA VPN + Cloud Router (BGP)** through the hub or **NCC**.
  - Set VPC **Dynamic Routing Mode = GLOBAL** for cross-region propagation.
- **Can’t SSH via IAP?**
  - Add firewall allow for **35.235.240.0/20** (tcp:22) and ensure `sshd` is running.
- **Overlapping CIDRs**
  - Ensure each participant VPC **CIDR is unique**.
- **NCC visibility**
  - Verify spoke attachments and that the hub shows **healthy** connectivity.

### Task 2 (App / CI)

- **Cloud Run**
  - Check **ingress** and **service account** permissions.
  - Confirm image is up-to-date and built successfully.
- **Cloud Build / CI**
  - Validate pipeline steps: `fmt` → `validate` → `plan` → `apply`.
  - Pin provider versions; review IAM scopes on deploy credentials.

---

## Versions Supported

We support the latest commit on:

- `task-1` — Terraform networking & NCC
- `task-2` — Application / Cloud Run & CI/CD
- `task-3` — Infrastructure extensions

Other branches may be experimental or archived.

---

## Escalation

For production-impacting breakage:

1. Revert to last known good commit (or disable the affected module).
2. Open a **High severity** GitHub Issue with logs and repro steps.
3. Email the maintainers with the issue link and impact summary.

---

Thanks for helping us improve **GPC Armageddon**!
