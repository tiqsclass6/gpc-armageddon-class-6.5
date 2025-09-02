# Security Policy

We take the security of this project seriously. This policy applies to **all tasks and code in this repo**:

- **Task 1:** Terraform networking (HA/Classic VPN, Cloud Router/BGP, NCC)
- **Task 2:** Application components (e.g., Cloud Run) and CI/CD
- **Task 3:** Additional infrastructure and networking extensions

---

## Supported Versions

The following branches/versions currently receive security updates:

| Version / Branch | Scope (summary)                    | Supported |
|------------------|------------------------------------|-----------|
| `task-1`         | Terraform networking & NCC         | ✅        |
| `task-2`         | App/Cloud Run + CI/CD              | ✅        |
| `task-3`         | Infra extensions / networking      | ✅        |

> We generally support the **latest commit on each task branch**. Please base reports on a fresh checkout of that branch.

---

## Reporting a Vulnerability

**Please do not open public GitHub issues for security reports.**

1. **Email:** Send a detailed report to `daquietstorm22@gmail.com`.
2. **Optionally (preferred):** Open a **GitHub Security Advisory** (private) for this repo so we can collaborate securely.
3. **Include the following details:**
   - Affected branch / commit SHA, files, and configuration
   - Impact and severity (what could an attacker do?)
   - Reproduction steps and PoC (commands, configs, traffic captures)
   - Any mitigating factors or suggested fixes
4. **Acknowledgment:** We’ll confirm receipt within **72 hours**.
5. **Triage & Timeline:** Initial triage within **5 business days**. Target fixes:
   - **Critical/High:** best-effort within **14 days**
   - **Medium:** **30 days**
   - **Low/Informational:** **90 days**, or next planned release
6. **Coordinated Disclosure:** We’ll propose a disclosure date after a fix/mitigation is available.

---

## Scope

### In scope

- Terraform code, modules, and scripts in this repo (Tasks 1 & 3)
- Application code and Cloud Run artifacts for Task 2
- CI/CD definitions (Cloud Build, Jenkins/GitHub Actions used for this repo)

### Out of scope

- Vulnerabilities in **Google Cloud** itself or third-party services/tools (report to their owners)
- Social engineering, spam, physical attacks, or DDoS
- Rate-limiting and generic best-practice complaints without security impact
- Third-party logos/images and brand assets (see license notes)

---

## Safe Harbor

We support **good-faith security research**. If you:

- Follow this policy,
- Avoid privacy violations, service degradation, and data destruction,
- Use only the accounts and projects you own or are authorized to test,

then we will not pursue legal action or request law enforcement investigations.

---

## How We Assess Severity

We use **CVSS v3.1** as a guide:

- **Critical/High:** Unauthorized network access, credential disclosure, remote code execution, privilege escalation
- **Medium:** Information disclosure or misconfiguration with practical impact
- **Low/Info:** Hardening opportunities without direct exploitability

Please include a suggested CVSS vector if you can.

---

## Temporary Mitigations (Typical)

- **Task 1/3 (Terraform):** remove/disable offending resources; revoke keys; tighten IAM; update route/firewall; rotate PSKs; pin image versions
- **Task 2 (App):** roll back to last known good build; redeploy with fixed image; temporarily restrict ingress; rotate secrets

---

## Security Best Practices (Maintainers’ Checklist)

### Secrets & Identity

- Never commit secrets; use **GCP Secret Manager** or CI/CD secured variables
- Rotate **VPN PSKs** and service-account keys; prefer workload identity where possible

### Terraform / IaC

- Run `terraform fmt` / `terraform validate` on PRs
- Static analysis with **tflint** and **Checkov**
- Enforce unique, non-overlapping CIDRs; **GLOBAL** VPC dynamic routing when cross-region is required
- Review **IAM** for least-privilege; restrict service-agent roles to required scopes only

### Networking

- Prefer **HA VPN + Cloud Router (BGP)** for transit; document NCC hub/spokes
- Restrict management access; log & monitor tunnel state and BGP route changes

### App / Containers (Task 2)

- Image scanning (e.g., **Trivy**); keep base images patched
- Enforce HTTPS; set auth/authorization on Cloud Run; least-privilege service account

### CI/CD

- Validate & scan on every build (lint, IaC checks, SBOM if applicable)
- Protect deploy creds with minimal scopes and short-lived tokens

---

## Disclosure Policy

- Give us adequate time to investigate and remediate before public disclosure.
- We’ll credit reporters (if desired) in release notes or advisories after a fix is available.

> Thank you for helping keep this project secure!
