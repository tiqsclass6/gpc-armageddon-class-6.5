# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

#=================================================
#              Balerica Inc. Subnet
#=================================================
resource "google_compute_subnetwork" "balerica_subnet" {
  provider      = google.balerica
  name          = "balerica-subnet"
  ip_cidr_range = "10.20.0.0/24"
  region        = var.region_balerica
  network       = google_compute_network.balerica_vpc.id
}

# Cassiem Subnet
resource "google_compute_subnetwork" "cassiem_subnet" {
  provider      = google.balerica
  name          = "cassiem-subnet"
  ip_cidr_range = "10.25.0.0/24"
  region        = var.region_balerica
  network       = google_compute_network.cassiem_vpc.id
}

# Benji Subnet
resource "google_compute_subnetwork" "benji_subnet" {
  provider      = google.balerica
  name          = "benji-subnet"
  ip_cidr_range = "10.26.0.0/24"
  region        = var.region_balerica
  network       = google_compute_network.benji_vpc.id
}

# Uriah Subnet
resource "google_compute_subnetwork" "uriah_subnet" {
  provider      = google.balerica
  name          = "uriah-subnet"
  ip_cidr_range = "10.27.0.0/24"
  region        = var.region_balerica
  network       = google_compute_network.uriah_vpc.id
}

#=================================================
#                Wolfpack Subnet
#=================================================
# Wolfpack Subnet
resource "google_compute_subnetwork" "wolfpack_subnet" {
  provider      = google.wolfpack
  name          = "wolfpack-subnet"
  ip_cidr_range = "10.21.0.0/24"
  region        = var.region_wolfpack
  network       = google_compute_network.wolfpack_vpc.id
}

#=================================================
#               Wolfpack Members
#=================================================

# Mike Subnet
resource "google_compute_subnetwork" "mike_subnet" {
  provider      = google.wolfpack
  name          = "mike-subnet"
  ip_cidr_range = "10.22.0.0/24"
  region        = var.region_wolfpack
  network       = google_compute_network.mike_vpc.id
}

# T.I.Q.S. Subnet
resource "google_compute_subnetwork" "tiqs_subnet" {
  provider      = google.wolfpack
  name          = "tiqs-subnet"
  ip_cidr_range = "10.23.0.0/24"
  region        = var.region_wolfpack
  network       = google_compute_network.tiqs_vpc.id
}

# Brian Subnet
resource "google_compute_subnetwork" "brian_subnet" {
  provider      = google.wolfpack
  name          = "brian-subnet"
  ip_cidr_range = "10.24.0.0/24"
  region        = var.region_wolfpack
  network       = google_compute_network.brian_vpc.id
}
