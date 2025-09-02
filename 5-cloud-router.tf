# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router

# Balerica Cloud Router for BGP
resource "google_compute_router" "balerica_router" {
  provider = google.balerica
  name     = "balerica-router"
  region   = var.region_balerica
  network  = google_compute_network.balerica_vpc.id
  bgp {
    asn = 65501
  }
}

# Wolfpack Cloud Router for BGP
resource "google_compute_router" "wolfpack_router" {
  provider = google.wolfpack
  name     = "wolfpack-router"
  region   = var.region_wolfpack
  network  = google_compute_network.wolfpack_vpc.id
  bgp {
    asn = 65515
  }
}
