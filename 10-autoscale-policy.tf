# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_autoscaler

# Brazil Autoscaler
resource "google_compute_region_autoscaler" "brazil" {
  name   = "brazil-autoscaler"
  region = "southamerica-east1"
  target = google_compute_region_instance_group_manager.brazil.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.25
    }
  }
}

# South Africa Autoscaler
resource "google_compute_region_autoscaler" "southafrica" {
  name   = "southafrica-autoscaler"
  region = "africa-south1"
  target = google_compute_region_instance_group_manager.southafrica.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.25
    }
  }
}

# Tokyo Autoscaler
resource "google_compute_region_autoscaler" "tokyo" {
  name   = "tokyo-autoscaler"
  region = "asia-northeast1"
  target = google_compute_region_instance_group_manager.tokyo.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.25
    }
  }
}
