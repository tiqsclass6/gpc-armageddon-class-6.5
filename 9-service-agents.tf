# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member

# =================================================
#          Wolfpack NCC Service Agents
# =================================================

# Mike NCC Service Agent
resource "google_project_iam_member" "mike_ncc_agent" {
  provider = google.wolfpack
  project  = var.mike_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.wolfpack.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}

# T.I.Q.S. NCC Service Agent
resource "google_project_iam_member" "tiqs_ncc_agent" {
  provider = google.wolfpack
  project  = var.tiqs_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.wolfpack.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}

# Brian NCC Service Agent
resource "google_project_iam_member" "brian_ncc_agent" {
  provider = google.wolfpack
  project  = var.brian_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.wolfpack.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}

# =================================================
#          Balerica NCC Service Agents
# =================================================

# Cassiem NCC Service Agent
resource "google_project_iam_member" "cassiem_ncc_agent" {
  provider = google.balerica
  project  = var.cassiem_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.balerica.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}

# Benji NCC Service Agent
resource "google_project_iam_member" "benji_ncc_agent" {
  provider = google.balerica
  project  = var.benji_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.balerica.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}

# Uriah NCC Service Agent
resource "google_project_iam_member" "uriah_ncc_agent" {
  provider = google.balerica
  project  = var.uriah_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.balerica.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}
