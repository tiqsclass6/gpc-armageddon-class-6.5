# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ha_vpn_gateway
# Balerica HA VPN gateway
resource "google_compute_ha_vpn_gateway" "balerica_ha_gateway" {
  provider = google.balerica
  name     = "balerica-ha-vpn-gateway"
  network  = google_compute_network.balerica_vpc.id
  region   = var.region_balerica
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_tunnel
# Balerica Inc with VPN tunnels
resource "google_compute_vpn_tunnel" "balerica_tunnel0" {
  provider              = google.balerica
  name                  = "balerica-tunnel0"
  region                = var.region_balerica
  vpn_gateway           = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.wolfpack_ha_gateway.id
  shared_secret         = "your-first-pre-shared-key-here"                                         # PSK 1
  router                = google_compute_router.balerica_router.id
  vpn_gateway_interface = 0
  ike_version           = 2
}

resource "google_compute_vpn_tunnel" "balerica_tunnel1" {
  provider              = google.balerica
  name                  = "balerica-tunnel1"
  region                = var.region_balerica
  vpn_gateway           = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.wolfpack_ha_gateway.id
  shared_secret         = "your-second-pre-shared-key-here"                                        # PSK 2
  router                = google_compute_router.balerica_router.id
  vpn_gateway_interface = 1
  ike_version           = 2
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_interface
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_peer

# Router Interfaces and BGP peers for Tunnel 0
resource "google_compute_router_interface" "balerica_interface0" {
  provider   = google.balerica
  name       = "balerica-interface0"
  router     = google_compute_router.balerica_router.name
  region     = var.region_balerica
  ip_range   = "169.254.0.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.balerica_tunnel0.name
}

resource "google_compute_router_peer" "balerica_peer0" {
  provider        = google.balerica
  name            = "balerica-peer0"
  router          = google_compute_router.balerica_router.name
  region          = var.region_balerica
  peer_ip_address = "169.254.0.1"
  peer_asn        = 65515
  interface       = google_compute_router_interface.balerica_interface0.name
}

# Router Interfaces and BGP peers for Tunnel 1
resource "google_compute_router_interface" "balerica_interface1" {
  provider   = google.balerica
  name       = "balerica-interface1"
  router     = google_compute_router.balerica_router.name
  region     = var.region_balerica
  ip_range   = "169.254.1.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.balerica_tunnel1.name
}

resource "google_compute_router_peer" "balerica_peer1" {
  provider        = google.balerica
  name            = "balerica-peer1"
  router          = google_compute_router.balerica_router.name
  region          = var.region_balerica
  peer_ip_address = "169.254.1.1"
  peer_asn        = 65515
  interface       = google_compute_router_interface.balerica_interface1.name
}
