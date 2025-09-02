# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role
resource "google_project_iam_custom_role" "vpn_access_role" {
  provider    = google.wolfpack
  role_id     = "customVpnAccess"
  title       = "Custom VPN Access Role"
  description = "Minimal permissions for VPN gateway usage"
  permissions = [
    "compute.vpnGateways.use",
    "compute.vpnTunnels.get"
  ]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member
resource "google_project_iam_member" "balerica_vpn_access" {
  provider = google.wolfpack
  project  = var.wolfpack_project
  role     = google_project_iam_custom_role.vpn_access_role.id
  member   = "serviceAccount:terraform-service@class-6-5-tiqs.iam.gserviceaccount.com"
}
