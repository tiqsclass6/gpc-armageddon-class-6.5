# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

#=================================================
#               Balerica Inc. VPC
#=================================================

# Balerica Inc. VPC (VPN Hub)
resource "google_compute_network" "balerica_vpc" {
  provider                = google.balerica
  name                    = "balerica-vpc"
  auto_create_subnetworks = false
}

# Cassiem VPC
resource "google_compute_network" "cassiem_vpc" {
  provider                = google.balerica
  name                    = "cassiem-vpc"
  auto_create_subnetworks = false
}

# Benji VPC
resource "google_compute_network" "benji_vpc" {
  provider                = google.balerica
  name                    = "benji-vpc"
  auto_create_subnetworks = false
}

# Uriah VPC
resource "google_compute_network" "uriah_vpc" {
  provider                = google.balerica
  name                    = "uriah-vpc"
  auto_create_subnetworks = false
}

#=================================================
#                   Hub VPC
#=================================================

# Wolfpack VPC
resource "google_compute_network" "wolfpack_vpc" {
  provider                = google.wolfpack
  name                    = "wolfpack-vpc"
  auto_create_subnetworks = false
}

#=================================================
#               Wolfpack Members
#=================================================

# Mike VPC
resource "google_compute_network" "mike_vpc" {
  provider                = google.wolfpack
  name                    = "mike-vpc"
  auto_create_subnetworks = false
}

# T.I.Q.S. VPC
resource "google_compute_network" "tiqs_vpc" {
  provider                = google.wolfpack
  name                    = "tiqs-vpc"
  auto_create_subnetworks = false
}

# Brian VPC
resource "google_compute_network" "brian_vpc" {
  provider                = google.wolfpack
  name                    = "brian-vpc"
  auto_create_subnetworks = false
}
