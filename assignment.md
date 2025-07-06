# Cloud Run Deployment Assignment

## Repository
Fork this Flask app: https://github.com/aaron-dm-mcdonald/cloud-run-ex

## Part 1: Local Testing
- Clone your forked repository
- Use the `.env` file with environment variables
- Test the Flask app locally using the environment variables
- Verify the app works with different `.env` configurations

## Part 2: Remote Deployment
- Deploy to Cloud Run without cloning to your local machine
- Use the `.env` file from your repository for environment variables
- Deploy directly from your GitHub repository
- Ensure unauthenticated access is allowed

## Bonus Part: Traffic Splitting
- Create a new branch with modified code
- Set up a Cloud Build trigger for the new branch
- Deploy a second revision from the new branch
- Configure traffic splitting: 50% to original revision, 50% to new revision

## Deliverables
- [ ] Working local Flask app with `.env` configuration
- [ ] Deployed Cloud Run service URL
- [ ] Forked repository with your modifications
- [ ] New branch with code changes
- [ ] Traffic split between two revisions (50/50)
- [ ] Cloud Build trigger configured