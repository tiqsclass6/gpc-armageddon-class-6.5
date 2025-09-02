# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ha_vpn_gateway
# Wolfpack Hub HA VPN gateway
resource "google_compute_ha_vpn_gateway" "wolfpack_ha_gateway" {
  provider = google.wolfpack
  name     = "wolfpack-ha-vpn-gateway"
  network  = google_compute_network.wolfpack_vpc.id
  region   = var.region_wolfpack
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_tunnel
# Wolfpack Hub with VPN tunnels
resource "google_compute_vpn_tunnel" "wolfpack_tunnel0" {
  provider              = google.wolfpack
  name                  = "wolfpack-tunnel0"
  region                = var.region_wolfpack
  vpn_gateway           = google_compute_ha_vpn_gateway.wolfpack_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  shared_secret         = "your-first-pre-shared-key-here"                                         # PSK 1
  router                = google_compute_router.wolfpack_router.id
  vpn_gateway_interface = 0
  ike_version           = 2
}

resource "google_compute_vpn_tunnel" "wolfpack_tunnel1" {
  provider              = google.wolfpack
  name                  = "wolfpack-tunnel1"
  region                = var.region_wolfpack
  vpn_gateway           = google_compute_ha_vpn_gateway.wolfpack_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  shared_secret         = "your-second-pre-shared-key-here"                                        # PSK 2
  router                = google_compute_router.wolfpack_router.id
  vpn_gateway_interface = 1
  ike_version           = 2
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_interface
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_peer

# Router Interfaces and BGP peers for Tunnel 0
resource "google_compute_router_interface" "wolfpack_interface0" {
  provider   = google.wolfpack
  name       = "wolfpack-interface0"
  router     = google_compute_router.wolfpack_router.name
  region     = var.region_wolfpack
  ip_range   = "169.254.0.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.wolfpack_tunnel0.name
}

resource "google_compute_router_peer" "wolfpack_peer0" {
  provider        = google.wolfpack
  name            = "wolfpack-peer0"
  router          = google_compute_router.wolfpack_router.name
  region          = var.region_wolfpack
  peer_ip_address = "169.254.0.2"
  peer_asn        = 65501
  interface       = google_compute_router_interface.wolfpack_interface0.name
}

# Router Interfaces and BGP peers for Tunnel 1
resource "google_compute_router_interface" "wolfpack_interface1" {
  provider   = google.wolfpack
  name       = "wolfpack-interface1"
  router     = google_compute_router.wolfpack_router.name
  region     = var.region_wolfpack
  ip_range   = "169.254.1.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.wolfpack_tunnel1.name
}

resource "google_compute_router_peer" "wolfpack_peer1" {
  provider        = google.wolfpack
  name            = "wolfpack-peer1"
  router          = google_compute_router.wolfpack_router.name
  region          = var.region_wolfpack
  peer_ip_address = "169.254.1.2"
  peer_asn        = 65501
  interface       = google_compute_router_interface.wolfpack_interface1.name
}
