# Security Policy

## Supported Versions

The following versions of the Armageddon App (Task 2) are currently supported with security updates:

| Version   | Supported          |
|-----------|--------------------|
| task-2    | ✅ Supported       |

---

## Reporting a Vulnerability

We take the security of this project seriously. If you discover a security vulnerability, please **DO NOT** create a public GitHub issue.

Instead, please follow these steps:

1. **Email:** Send a detailed report to the repository maintainer at: `daquietstorm22@gmail.com`
2. **Details to include:**
   - A description of the vulnerability
   - Steps to reproduce the issue
   - Potential impact
   - Any suggested fix or mitigation
3. You will receive an acknowledgment within **72 hours**.
4. We will provide an estimated timeline for fixing the issue, usually within **14 days**.

---

## Security Best Practices

- **Secrets Management**: Never commit `.env` files or API keys to version control. Use **Google Cloud Secrets Manager** or Cloud Run environment variables.  
- **Dependencies**: Keep `requirements.txt` dependencies up to date. Run vulnerability scans regularly (`pip-audit`, `safety`).  
- **Access Control**: Limit IAM roles to **principle of least privilege**.  
- **Networking**: Restrict ingress traffic on Cloud Run to HTTPS only.  
- **CI/CD**: Validate code in Cloud Build with automated tests and security scans before deploying to Cloud Run.  
- **Monitoring**: Enable Google Cloud Logging & Monitoring to detect anomalies.  

---

## Disclosure Policy

- Please give us adequate time to respond and remediate before publicly disclosing vulnerabilities.
- Responsible disclosure helps protect the entire community of users relying on this project.

Thank you for helping keep this project secure!  
