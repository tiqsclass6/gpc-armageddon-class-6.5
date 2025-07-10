# 💥 Be A Man Level 10  – Cloud Run Deployment Guide

![GCP](https://img.shields.io/badge/cloud-Google%20Cloud-blue)
![Cloud Run](https://img.shields.io/badge/service-Cloud%20Run-success)
![Build](https://img.shields.io/badge/build-passing-brightgreen)
![Python](https://img.shields.io/badge/python-3.13-blue)
![Flask](https://img.shields.io/badge/framework-Flask-red)
![Status](https://img.shields.io/badge/status-Deployed-success)
![Version](https://img.shields.io/badge/version-v2.0-yellow)
![GitHub Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/gcp-be-a-man-level-10)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gcp-be-a-man-level-10)

> Deploy a dynamic Python Flask app to Google Cloud Run with traffic splitting, environment configs, and CI/CD via Cloud Build and GitHub triggers.

---

## 📁 Project Structure

```plaintext
gcp-be-a-man-level-10/
├── Screenshots/
│   ├── app-5050-traffic.mp4
│   ├── app-v1.jpg
│   ├── app-v2.jpg
│   ├── cloud-build-repositories.jpg
│   ├── cloud-run-service.jpg
│   ├── cloud-triggers.jpg
│   ├── docker-repository.jpg
│   ├── neo-app-v1.mp4
│   ├── neo-app-v2.mp4
├── templates/
│   └── index.html
├── .env
├── .gitignore
├── cloudbuild.yaml
├── GUIDE.md
├── main.py
├── README.md
└── requirements.txt
```

---

## 🧩 Folder & File Descriptions

| File/Folder        | Description                                                         |
| ------------------ | ------------------------------------------------------------------- |
| `Screenshots/`     | Visual and video assets for documentation and demos                 |
| `templates/`       | Flask HTML template(s) for rendering the app UI                     |
| `.env`             | Environment variables for local dev (`FLASK_DEBUG`, `PORT`, etc.)   |
| `.gitignore`       | Git exclusions to prevent committing sensitive or unnecessary files |
| `ASSIGNMENT.md`    | Likely submission or planning document for the project              |
| `cloudbuild.yaml`  | Google Cloud Build config for automated deployments                 |
| `GUIDE.md`         | Full project guide with setup, deployment, and references           |
| `main.py`          | Flask app entry point                                               |
| `README.md`        | High-level project summary (optional: link to `GUIDE.md`)           |
| `requirements.txt` | Python package dependencies (Flask, python-dotenv, etc.)            |

---

## 🚀 Deployment Steps

### 🧱 Step 1: Clone the Repo

```bash
git clone https://github.com/tiqsclass6/gcp-be-a-man-level-10/
cd gcp-be-a-man-level-10
```

---

### ⚙️ Step 2: Edit the `.env` File

```env
HEADER_TEXT=You Are The One Neo
BOTTOM_TEXT=Your Guide: The Oracle / Your Sensei: Theo WAF
FLASK_DEBUG=false
PORT=5000
IMAGE_URL=https://64.media.tumblr.com/9ffbbd9e32309979709722811393cb10/fc79c935ca708e78-13/s540x810/06617f3d2f344b8280f96e67739c4f53417b4ddf.gif
BACKGROUND_IMAGE=https://i.pinimg.com/originals/c5/9a/d2/c59ad2bd4ad2fbacd04017debc679ddb.gif
```

---

### 🧪 Step 3: Run Flask Locally

```bash
pip install -r requirements.txt
python main.py
```

Visit: <http://localhost:5000>

---

### 🛠️ Step 4: Update `main.py` for Cloud Run

Replace:

```python
port = int(os.getenv('PORT', 5000))
```

with:

```python
port = int(os.getenv('PORT', 8080))         # Cloud Run default port
```

---

### ☁️ Step 5: Push to GitHub

```bash
git remote add origin https://<your-repo-url>
git branch -M be-a-man-level-10-v1
git add .
git commit -m "initial commit"
git push -u origin be-a-man-level-10-v1
```

**GitHub Repo:** [BAM 10 - V1](https://github.com/tiqsclass6/gcp-be-a-man-level-10/tree/be-a-man-level-10-v1)

---

### 🌐 Step 6: Deploy to Cloud Run

```bash
gcloud run deploy be-a-man-level-10 \
  --source . \
  --region asia-northeast1 \
  --allow-unauthenticated \
  --set-env-vars=HEADER_TEXT="You Are The One Neo",\
BOTTOM_TEXT="Your Guide: The Oracle / Your Sensei: Theo WAF",\
FLASK_DEBUG=false,\
IMAGE_URL="https://64.media.tumblr.com/9ffbbd9e32309979709722811393cb10/fc79c935ca708e78-13/s540x810/06617f3d2f344b8280f96e67739c4f53417b4ddf.gif",\
BACKGROUND_IMAGE="https://i.pinimg.com/originals/c5/9a/d2/c59ad2bd4ad2fbacd04017debc679ddb.gif"
```

---

### ✅ Step 7: Verify Cloud Run

- Open Cloud Run console
- Click `be-a-man-level-10`
- Click the service URL to test it live

![app-v1](/Screenshots/app-v1.jpg)

---

## 🧪 Version 2 Branch & CI/CD Setup

---

### 🆕 Step 8: Create a New Branch

```bash
git checkout -b be-a-man-level-10-v2
```

Edit `.env` to:

```env
HEADER_TEXT=Fight Smith Til The End
BOTTOM_TEXT=Morpheus Believes In You Neo,FLASK_DEBUG=false,
IMAGE_URL=https://i.makeagif.com/media/7-01-2023/c8xnhX.gif,
BACKGROUND_IMAGE=https://i.pinimg.com/originals/c5/9a/d2/c59ad2bd4ad2fbacd04017debc679ddb.gif"
```

---

### 🧱 Step 9: Create `cloudbuild.yaml`

```yaml
steps:
  - name: 'gcr.io/cloud-builders/gcloud'
    entrypoint: bash
    args:
      - -c
      - |
        gcloud run deploy be-a-man-level-10 \
          --region=asia-northeast1 \
          --allow-unauthenticated \
          --source=. \
          --set-env-vars="HEADER_TEXT=Fight Smith Til The End,BOTTOM_TEXT=Morpheus Believes In You Neo,FLASK_DEBUG=false,IMAGE_URL=https://i.makeagif.com/media/7-01-2023/c8xnhX.gif,BACKGROUND_IMAGE=https://i.pinimg.com/originals/c5/9a/d2/c59ad2bd4ad2fbacd04017debc679ddb.gif"
```

---

### 🔃 Step 10: Push the V2 Branch

```bash
git add .
git commit -m "initial commit"
git push -u origin be-a-man-level-10-v2
```

**GitHub Repo:** [BAM 10 - V2](https://github.com/tiqsclass6/gcp-be-a-man-level-10/tree/be-a-man-level-10-v2)

---

## ⚙️ GitHub Integration with Cloud Build

### 🧰 Step 11: Install gcloud beta commands

1. Open **Google Cloud SDK Shell** (right-click → Run as _Administrator_).
2. Run the following command:

    ```bash
    gcloud beta builds repositories list
    ```

3. If prompted to install components, press Y.
4. If no repositories are listed, continue to **Step 12.** If successful, skip to **Step 13.**

---

### 🔄 Step 12: Reconnect GitHub Repo (if missing)

> If gcloud beta builds repositories list returns nothing:

1. Go to: [**Cloud Build Triggers**](https://console.cloud.google.com/cloud-build/triggers)
2. **Click “Connect Repository”**
3. **Choose Region:** global
4. **Select** GitHub (Cloud Build GitHub App)
5. Click Continue
6. Authenticate and **Authorize Access** your GitHub credentials
7. Choose your repo: `username/gcp-be-a-man-level-10`
8. ✅ Check the consent box for GitHub access. Click Connect
9. Click Done (❗**NOTE: Do not create the trigger**)

![cloud-build-repositories](/Screenshots/cloud-build-repositories.jpg)
![docker-repository](/Screenshots/docker-repository.jpg)

---

### 🔗 Step 13: Create a GitHub Connection in asia-northeast1

> Open the Cloud Build Triggers page

1. Click _Create Trigger_
2. **Name:** GitHub-trigger
3. **Region:** asia-northeast1 (Tokyo)
4. **Description:** GitHub-trigger
5. **Tags:** (optional)
6. **Event:** Push to a branch
7. **Source:** Cloud Build repositories
8. **Repository generation:** 1st gen
9. Click _Connect new repository_
10. **Select your repository:** `username/gcp-be-a-man-level-10`
11. **Branch (regex):** `^be-a-man-level-10-v2$`
12. **Configuration:** Autodetected
13. **Location:** Repository
14. **Approval:** leave blank
15. **Build logs:** ✅ Check the box to include logs
16. **Service Account:** `SERVICE_ACCOUNT@compute@developer.gserviceaccount.com`
17. Click Create

![cloud-triggers](/Screenshots/cloud-triggers.jpg)

---

### 🆕 Step 14: Deploy a Second Revision

```bash
gcloud run deploy be-a-man-level-10 \
  --source=. \
  --region=asia-northeast1 \
  --allow-unauthenticated \
  --set-env-vars="HEADER_TEXT=Fight Smith Til The End,BOTTOM_TEXT=Morpheus Believes In You Neo,FLASK_DEBUG=false,IMAGE_URL=https://i.makeagif.com/media/7-01-2023/c8xnhX.gif,BACKGROUND_IMAGE=https://i.pinimg.com/originals/c5/9a/d2/c59ad2bd4ad2fbacd04017debc679ddb.gif"
```

![app-v2](/Screenshots/app-v2.jpg)

---

### 🧾 Step 15: List Revisions

```bash
gcloud run revisions list \
  --service=be-a-man-level-10 \
  --region=asia-northeast1
```

---

### 🔁 Step 16: Split Traffic 50/50

```bash
gcloud run services update-traffic be-a-man-level-10 \
  --to-revisions be-a-man-level-10-00001-jd8=50,be-a-man-level-10-00002-gm5=50 \
  --region asia-northeast1
```

![cloud-run-service](/Screenshots/cloud-run-service.jpg)

- **Splitting Traffic:** [App 50/50 Traffic:](/Screenshots/app-5050-traffic.mp4)

---

## 📸 "Show Your Work" ~ Kevin Samuels

- **First Branch Flask App (MP4):** [Neo APP-V1](/Screenshots/neo-app-v1.mp4)
- **Second Branch Flask App (MP4):** [Neo APP-V2](/Screenshots/neo-app-v2.mp4)

---

## ❗ Troubleshooting

| Issue | Fix |
|-------|-----|
| Invalid revision name | Use `gcloud run revisions list` to get the actual revision names |
| Permission denied for beta commands | Run **Google Cloud SDK Shell** as Administrator |
| Repo not found during trigger creation | Ensure the repo is connected in **Cloud Build > Triggers** |
| `gcloud: unrecognized arguments: \` | Don't use backslashes in Windows CMD; use PowerShell or a single line |

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney

---
