# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_hub

# Balerica NCC Hub
resource "google_network_connectivity_hub" "balerica" {
  provider    = google.balerica
  name        = "balerica-ncc-hub"
  description = "Balerica Central Hub"
}

# Wolfpack NCC Hub
resource "google_network_connectivity_hub" "wolfpack" {
  provider    = google.wolfpack
  name        = "wolfpack-ncc-hub"
  description = "Wolfpack Central Hub"
}
