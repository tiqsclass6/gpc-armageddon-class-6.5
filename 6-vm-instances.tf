# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

# Iowa RDP VM
resource "google_compute_instance" "iowa-windows-vm" {
  name         = "iowa-windows-vm"
  machine_type = "n2-standard-4"
  zone         = "us-central1-a"
  tags         = ["rdp-public"]

  boot_disk {
    initialize_params {
      image = "projects/windows-cloud/global/images/family/windows-2022"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.iowa-public.id
    access_config {}
  }
}
