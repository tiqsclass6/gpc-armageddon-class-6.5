# 🖋️ Contributing Guidelines

Thank you for your interest in contributing to **gpc-armageddon**! 🎉

This repo spans **three task branches**. Please target your work accordingly:

- **`task-1`** — Terraform networking (VPCs, Subnets, Cloud Router/BGP, **HA/Classic VPN**, **NCC**)
- **`task-2`** — Application components (e.g., Cloud Run) and CI/CD
- **`task-3`** — Infrastructure and networking extensions

> For **security issues**, use the process in **SECURITY.md** (do **not** open a public issue).

---

## ➕ How to Contribute

### 1) Fork & Clone

```bash
git fork https://github.com/tiqsclass6/gpc-armageddon
git clone https://github.com/<your-username>/gpc-armageddon.git
cd gpc-armageddon
```

### 2) Create a Branch

Use a descriptive name:

```bash
git checkout -b feature/<short-title>   # new features
# or
git checkout -b fix/<short-title>       # bug fixes
# or
git checkout -b docs/<short-title>      # documentation-only
```

### 3) Make Changes

Follow the checklists below (per task). Keep commits focused and small.

### 4) Commit & Push

Use **Conventional Commits** where possible:

```plaintext
feat(task-1): add HA VPN module with BGP
fix(task-2): correct Cloud Run IAM for invoker
docs(task-3): update NCC diagram and README
```

```bash
git add -A
git commit -m "feat(task-1): add HA VPN module with BGP"
git push origin <your-branch>
```

### 5) Open a Pull Request

- **Target the appropriate branch**: `task-1`, `task-2`, or `task-3`  
- Include: *scope*, *rationale*, *screenshots/diagrams*, and *test evidence*  
- Link related Issues

---

## 📃 Contribution Checklists

### ✅ Task 1 / Task 3 (Terraform & Networking)

- [ ] `terraform fmt` and `terraform validate` pass
- [ ] **Provider versions pinned**; auth set via ADC or SA key (no secrets in Git)
- [ ] `terraform plan` output pasted or attached
- [ ] **No overlapping CIDRs**; document subnets and regions
- [ ] **Cloud Router (BGP)** and **HA VPN** in the **same region**
- [ ] If transit is required: use **NCC** and set VPC **Dynamic Routing Mode = GLOBAL**
- [ ] Update/attach **diagram** (`.drawio` + exported PNG/SVG) and README references

### ✅ Task 2 (App & CI/CD)

- [ ] Python code follows **PEP 8**; run `flake8` or `ruff` if available
- [ ] Format with **black** (or project formatter)
- [ ] CI pipeline (Cloud Build) updated as needed
- [ ] Cloud Run: confirm **ingress**, **auth**, **service account** bindings
- [ ] Add/update tests (if present) and include execution results

### 📑 Docs & Meta (all tasks)

- [ ] Update **README** sections affected by your change
- [ ] Keep **SECURITY.md**, **SUPPORT.md**, and **LICENSE** links accurate
- [ ] Do **not** commit secrets; use GCP Secret Manager or CI secrets

---

## 📝 Development Tips

- Prefer **provider aliases** for multi-account Terraform workflows
- Use `.auto.tfvars` (without secrets) for local defaults
- Keep diagrams as **.drawio** (source of truth) and export to PNG/SVG for the README
- For multi-branch changes, open separate PRs if possible

---

## ⭐ Code of Conduct

By participating, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## 🪪 License

By contributing, you agree your contributions are licensed under the [MIT License](LICENSE) of this repository.
