# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_spoke

# =================================================
#               Balerica VPN Spoke
# =================================================

resource "google_network_connectivity_spoke" "vpn_spoke" {
  provider = google.wolfpack
  name     = "balerica-vpn-spoke"
  location = var.region_wolfpack
  hub      = google_network_connectivity_hub.wolfpack.id
  linked_vpn_tunnels {
    uris = [
      google_compute_vpn_tunnel.wolfpack_tunnel0.self_link,
      google_compute_vpn_tunnel.wolfpack_tunnel1.self_link,
    ]
    site_to_site_data_transfer = true
  }
  description = "Balerica Spoke for HA VPN"
}

# Cassiem VPC Spoke
resource "google_network_connectivity_spoke" "cassiem_spoke" {
  provider = google.balerica
  name     = "cassiem-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.balerica.id
  linked_vpc_network {
    uri = google_compute_network.cassiem_vpc.self_link
  }
  description = "Cassiem VPC Spoke"
}

# Benji VPC Spoke
resource "google_network_connectivity_spoke" "benji_spoke" {
  provider = google.balerica
  name     = "benji-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.balerica.id
  linked_vpc_network {
    uri = google_compute_network.benji_vpc.self_link
  }
  description = "Benji VPC Spoke"
}

# Uriah VPC Spoke
resource "google_network_connectivity_spoke" "uriah_spoke" {
  provider = google.balerica
  name     = "uriah-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.balerica.id
  linked_vpc_network {
    uri = google_compute_network.uriah_vpc.self_link
  }
  description = "Vince VPC Spoke"
}

# =================================================
#               Wolfpack NCC Hub
# =================================================

resource "google_network_connectivity_spoke" "wolfpack_spoke" {
  provider = google.wolfpack
  name     = "wolfpack-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.wolfpack.id
  linked_vpc_network {
    uri = google_compute_network.wolfpack_vpc.self_link
  }
  description = "Wolfpack VPC Spoke"
}

# =================================================
#               Wolfpack Members
# =================================================

# Mike VPC Spoke
resource "google_network_connectivity_spoke" "mike_spoke" {
  provider = google.wolfpack
  name     = "mike-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.wolfpack.id
  linked_vpc_network {
    uri = google_compute_network.mike_vpc.self_link
  }
  description = "Mike VPC Spoke"
}

# T.I.Q.S. VPC Spoke
resource "google_network_connectivity_spoke" "tiqs_spoke" {
  provider = google.wolfpack
  name     = "tiqs-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.wolfpack.id
  linked_vpc_network {
    uri = google_compute_network.tiqs_vpc.self_link
  }
  description = "T.I.Q.S. VPC Spoke"
}

# Brian VPC Spoke
resource "google_network_connectivity_spoke" "brian_spoke" {
  provider = google.wolfpack
  name     = "brian-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.wolfpack.id
  linked_vpc_network {
    uri = google_compute_network.brian_vpc.self_link
  }
  description = "Brian VPC Spoke"
}
