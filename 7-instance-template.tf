# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template

# Brazil Instance Template
resource "google_compute_instance_template" "brazil-instance-template" {
  name         = "brazil"
  description  = "Brazil Instance Template"
  machine_type = "e2-medium"
  region       = "southamerica-east1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.brazil-private.id
    access_config {}
  }

  tags = ["brazil"]

  metadata_startup_script = file("./SC1-brazil.sh")
}

# South Africa Instance Template
resource "google_compute_instance_template" "southafrica-instance-template" {
  name         = "southafrica"
  description  = "South Africa Instance Template"
  machine_type = "e2-medium"
  region       = "africa-south1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.southafrica-private.id
    access_config {}
  }

  tags = ["southafrica"]

  metadata_startup_script = file("./SC2-southafrica.sh")
}

# Tokyo Instance Template
resource "google_compute_instance_template" "tokyo-instance-template" {
  name         = "tokyo"
  description  = "Tokyo Instance Template"
  machine_type = "e2-medium"
  region       = "asia-northeast1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tokyo-private.id
    access_config {}
  }

  tags = ["tokyo"]

  metadata_startup_script = file("./SC3-tokyo.sh")
}
