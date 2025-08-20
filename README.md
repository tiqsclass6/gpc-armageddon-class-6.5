# 🛡 Armageddon – Full Summary

![GCP](https://img.shields.io/badge/cloud-Google%20Cloud-blue)
![Cloud Run](https://img.shields.io/badge/service-Cloud%20Run-success)
![Build](https://img.shields.io/badge/build-passing-brightgreen)
![Python](https://img.shields.io/badge/python-3.13-blue)
![Flask](https://img.shields.io/badge/framework-Flask-red)
![Status](https://img.shields.io/badge/status-Deployed-success)
![Version](https://img.shields.io/badge/version-v3.0-yellow)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![GitHub Repo Size](https://img.shields.io/github/repo-size/tiqsclass6/gpc-armageddon)
![Last Commit](https://img.shields.io/github/last-commit/tiqsclass6/gpc-armageddon)


> Deploy a dynamic Python Flask app to Google Cloud Run with CI/CD, four tagged revisions, and traffic splitting.

---

## 📚 References & Documentation

- **Cloud Run**  
  - [Allowing Unauthenticated Access](https://cloud.google.com/run/docs/authenticating/public)  
  - [Environment Variable Behavior](https://cloud.google.com/run/docs/configuring/environment-variables)  
  - [Traffic Splitting](https://cloud.google.com/run/docs/rollouts-rollbacks-traffic-migration)  
  - [Tagging Revisions](https://cloud.google.com/run/docs/deploying/tagging-revisions)  

- **Cloud Build**  
  - [Connect GitHub to Cloud Build](https://cloud.google.com/build/docs/automating-builds/github/connect-repo-github)  
  - [Deploying to Cloud Run](https://cloud.google.com/build/docs/deploying-builds/deploy-cloud-run)  

- **Flask**  
  - [Flask Documentation](https://flask.palletsprojects.com/)  

- **Python**  
  - [python-dotenv](https://github.com/theskumar/python-dotenv)  
  - [Using `.env` Files in Flask Apps](https://flask.palletsprojects.com/en/latest/config/#environment-and-dotenv-files)  

---

## 🧭 Project Summary

The **Armageddon App** is a Python Flask-based web application deployed to **Google Cloud Run** as the service `armageddon-service`.  
It uses **Cloud Build** triggers tied to GitHub branches for automated deployments of four distinct revisions.  

- **rev-fight → tag: fight**  
- **rev-believe → tag: believe**  
- **rev-stand → tag: stand**  
- **rev-win → tag: win**  

The CI/CD pipeline builds the container image (`armageddon-app`) and deploys it automatically. Once all four revisions exist, Cloud Build enforces a **40/40/10/10 split** across them.  

Tagged URLs let you access each revision directly, independent of traffic percentages:

```plaintext
https://fight---armageddon-service-asia-northeast1.a.run.app
https://believe---armageddon-service-asia-northeast1.a.run.app
https://stand---armageddon-service-asia-northeast1.a.run.app
https://win---armageddon-service-asia-northeast1.a.run.app
```

---

## 🌿 Repository Branches

The GitHub repo `tiqsclass6/gpc-armageddon` uses four deployment branches:

- `rev-fight` → tag: **fight**  
- `rev-believe` → tag: **believe**  
- `rev-stand` → tag: **stand**  
- `rev-win` → tag: **win**  

Each branch maps to a `.env` file (`.env.fight`, `.env.believe`, `.env.stand`, `.env.win`) for local testing consistency.  

---

## 📂 Project Structure

```plaintext
gpc-armageddon/
│
├── main.py                # Flask application entrypoint
├── requirements.txt       # Python dependencies
├── templates/
│   └── index.html         # HTML with placeholders for env vars
├── .env.fight             # Local environment for rev-fight
├── .env.believe           # Local environment for rev-believe
├── .env.stand             # Local environment for rev-stand
├── .env.win               # Local environment for rev-win
├── cloudbuild.yaml        # CI/CD pipeline for Cloud Build
└── README.md              # Project documentation
```

---

## 🚀 Steps to Complete the Lab

1. **Clone the Repository**

   ```bash
   git clone https://github.com/tiqsclass6/gpc-armageddon
   cd gpc-armageddon
   ```

2. **Enable Google Cloud APIs**

   ```bash
   gcloud services enable \
    run.googleapis.com \
    cloudbuild.googleapis.com \
    artifactregistry.googleapis.com
   ```

3. **Create an Artifact Registry (optional if using gcr.io)**

   ```bash
   gcloud artifacts repositories create armageddon-repo \
    --repository-format=docker \
    --location=asia-northeast1 \
    --description="Docker repo for Armageddon app"
   ```

4. **Connect GitHub Repo to Cloud Build**
   - In the Cloud Console → Cloud Build → Triggers → Connect Repository.  
   - Select `tiqsclass6/gpc-armageddon`.  
   - Add triggers for branches: `fight`, `believe`, `stand`, `win`.  

5. **Deploy Automatically via Triggers**
   - Each branch pushes a Docker image `armageddon-app` and deploys to `armageddon-service`.  
   - Revisions and tags are applied automatically.  

6. **Check Deployment**

   ```bash
   gcloud run services describe armageddon-service \
    --region=asia-northeast1
   ```

7. **Access Tagged URLs**
   - Fight: <https://fight---armageddon-service-asia-northeast1.a.run.app>  
   - Believe: <https://believe---armageddon-service-asia-northeast1.a.run.app>  
   - Stand: <https://stand---armageddon-service-asia-northeast1.a.run.app>  
   - Win: <https://win---armageddon-service-asia-northeast1.a.run.app>  

8. **Verify Traffic Split**

   ```bash
   gcloud run services update-traffic armageddon-service \
    --region=asia-northeast1 \
    --to-revisions=rev-fight=40,rev-believe=40,rev-stand=10,rev-win=10
   ```

---

## ❗ Troubleshooting

| Issue | Solution |
|-------|----------|
| `traffic split fails` | Ensure all four revisions exist (`rev-fight`, `rev-believe`, `rev-stand`, `rev-win`). |
| `tag URL not working` | Confirm tags applied with `gcloud run services update-traffic --tag`. |
| `invalid revision name` | List existing revisions with `gcloud run revisions list`. |
| `no connected repo` | Reconnect GitHub via Cloud Build Console. |

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.  
- **Group Leader:** John Sweeney  
