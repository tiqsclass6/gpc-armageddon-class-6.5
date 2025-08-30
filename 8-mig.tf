# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager

# Brazil MIG
resource "google_compute_region_instance_group_manager" "brazil" {
  name               = "brazil-mig"
  region             = "southamerica-east1"
  base_instance_name = "brazil"
  target_size        = 2

  version {
    instance_template = google_compute_instance_template.brazil-instance-template.self_link
  }

  distribution_policy_zones = [
    "southamerica-east1-a",
    "southamerica-east1-b"
    ]

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
  health_check      = google_compute_health_check.tsa-health-check.id
  initial_delay_sec = 180
  }
}

# South Africa MIG
resource "google_compute_region_instance_group_manager" "southafrica" {
  name               = "southafrica-mig"
  region             = "africa-south1"
  base_instance_name = "southafrica"
  target_size        = 2

  version {
    instance_template = google_compute_instance_template.southafrica-instance-template.self_link
  }

  distribution_policy_zones = [
    "africa-south1-a",
    "africa-south1-b",
    ]

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
  health_check      = google_compute_health_check.tsa-health-check.id
  initial_delay_sec = 180
  }
}

# Tokyo MIG
resource "google_compute_region_instance_group_manager" "tokyo" {
  name               = "tokyo-mig"
  region             = "asia-northeast1"
  base_instance_name = "tokyo"
  target_size        = 2

  version {
    instance_template = google_compute_instance_template.tokyo-instance-template.self_link
  }

  distribution_policy_zones = [
    "asia-northeast1-a",
    "asia-northeast1-b",
    ]

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
  health_check      = google_compute_health_check.tsa-health-check.id
  initial_delay_sec = 180
  }
}