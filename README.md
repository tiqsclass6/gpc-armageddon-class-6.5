# 🥋 Be A Man Level 10 – Cloud Run Deployment Guide

![Cloud Run](https://img.shields.io/badge/Platform-Google%20Cloud%20Run-blue)
![CI/CD](https://img.shields.io/badge/CI-CD%20via%20Cloud%20Build-green)
![Status](https://img.shields.io/badge/Deployment-Complete-success)

This guide walks through the deployment of a Flask application to **Google Cloud Run**, with **Cloud Build triggers**, **revision rollouts**, and **traffic splitting** using the `gcloud` CLI and GitHub integration.

---

## 🧭 Project Summary

The **Be‑A‑Man‑Level‑10** project is a Python Flask-based web application deployed to **Google Cloud Run** using a CI/CD workflow powered by **Google Cloud Build** and **GitHub**. The application is structured around a dual-branch deployment strategy, where versioned branches (`be-a-man-level-10-v1` and `be-a-man-level-10-v2`) represent distinct revisions of the application. These revisions are built and deployed either manually via the `gcloud run deploy` CLI or automatically via GitHub-triggered Cloud Build pipelines.

The app dynamically renders content based on environment variables, which are configured at deployment time. Once deployed, revisions can be managed through **Cloud Run traffic splitting**, allowing the developer to direct specific percentages of user traffic to different versions of the service (e.g., **50/50 rollout**). This enables controlled testing, rollback, and revision monitoring without downtime. The architecture is lightweight, serverless, and regionally deployed in `asia-northeast1`, leveraging Google's managed infrastructure for scalability and security.

---

## 📚 References & Documentation

- **Cloud Run:**
  - [Allowing Unauthenticated Access](https://cloud.google.com/run/docs/authenticating/public)  
  - [Cloud Run Environment Variable Behavior](https://cloud.google.com/run/docs/configuring/environment-variables)  
  - [Cloud Run IAM Permissions](https://cloud.google.com/run/docs/securing/managing-access)  
  - [Cloud Run Traffic Splitting](https://cloud.google.com/run/docs/rollouts-rollbacks-traffic-migration)  

- **Cloud Build:**
  - [Connect GitHub to Cloud Build](https://cloud.google.com/build/docs/automating-builds/github/connect-repo-github)  
  - [Deploying Services to Cloud Run](https://cloud.google.com/run/docs/deploying)  
  - [Deploying to Cloud Run with Cloud Build](https://cloud.google.com/build/docs/deploying-builds/deploy-cloud-run)  

- **Flask:**
  - [Flask Documentation](https://flask.palletsprojects.com/en/stable/)  

- **Google Cloud SDK References:**
  - [gcloud builds triggers create github](https://cloud.google.com/sdk/gcloud/reference/builds/triggers/create/github)  
  - [gcloud run deploy](https://cloud.google.com/sdk/gcloud/reference/run/deploy)  
  - [gcloud run services describe](https://cloud.google.com/sdk/gcloud/reference/run/services/describe)  
  - [gcloud run services update-traffic](https://cloud.google.com/sdk/gcloud/reference/run/services/update-traffic)  

- **GitHub:**
  - [Git - The Simple Guide](https://rogerdudler.github.io/git-guide/)  
  - [Git Branching and Merging](https://www.atlassian.com/git/tutorials/using-branches)  
  - [GitHub Docs – About repositories](https://docs.github.com/en/repositories)  
  - [GCP Cloud Builders (GitHub Repo)](https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/gcloud)  

- **Python:**
  - [python-dotenv (GitHub Repo)](https://github.com/theskumar/python-dotenv)  
  - [Using `.env` Files in Flask Apps](https://flask.palletsprojects.com/en/latest/config/#environment-and-dotenv-files)  
  - [Building a Cloud Build Configuration YAML](https://cloud.google.com/build/docs/build-config-file-schema)  
  - [Using `os.environ` in Python](https://docs.python.org/3/library/os.html#os.environ)

---

## 🌿 Repository Branches

The GitHub repo `tiqsclass6/gcp-be-a-man-level-10` contains two main branches:

### 🔹 [`be-a-man-level-10-v1`](https://github.com/tiqsclass6/gcp-be-a-man-level-10/tree/be-a-man-level-10-v1)

- Basic Flask app  
- Default environment values  
- Cloud Run v1 deployable

### 🔹 [`be-a-man-level-10-v2`](https://github.com/tiqsclass6/gcp-be-a-man-level-10/tree/be-a-man-level-10-v2)

- Enhanced content via environment vars (e.g., `"Fight Smith Til The End"`)
- Includes `cloudbuild.yaml` for automated builds  
- Ready for second Cloud Run revision and traffic split

---

## ❗ Troubleshooting

| Issue | Solution |
|-------|----------|
| `source URL not found` | Use `--source=.` with a **local clone** |
| `beta command not found` | Run Google Cloud SDK Shell as Admin and install with `gcloud components install beta` |
| `no connected repo` | Use Cloud Console to connect GitHub via Cloud Build |
| `invalid revision name` | List actual revisions with `gcloud run revisions list` |
| `traffic split fails` | Ensure **2+ revisions exist**, and revision names match exactly |

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney

---
