# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

#Iowa - Public
resource "google_compute_subnetwork" "iowa-public" {
  name          = "iowa-public"
  ip_cidr_range = "10.230.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.tiqs-vpc.id
}

#Brazil - Private
resource "google_compute_subnetwork" "brazil-private" {
  name                     = "brazil-private"
  ip_cidr_range            = "10.234.0.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.tiqs-vpc.id
  private_ip_google_access = true
}

#South Africa - Private
resource "google_compute_subnetwork" "southafrica-private" {
  name                     = "southafrica-private2"
  ip_cidr_range            = "10.235.0.0/24"
  region                   = "africa-south1"
  network                  = google_compute_network.tiqs-vpc.id
  private_ip_google_access = true
}

#Tokyo - Private
resource "google_compute_subnetwork" "tokyo-private" {
  name                     = "tokyo-private2"
  ip_cidr_range            = "10.236.0.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.tiqs-vpc.id
  private_ip_google_access = true
}
