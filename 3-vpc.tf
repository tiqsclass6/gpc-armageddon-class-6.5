# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "tiqs-vpc" {
  name                    = "tiqs-vpc"
  auto_create_subnetworks = false
  
  routing_mode = "GLOBAL"
}
