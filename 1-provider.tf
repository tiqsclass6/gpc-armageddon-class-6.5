# https://www.terraform.io/language/settings/backends/gcs

terraform {
  backend "gcs" {
    bucket      = "your-bucket-name-here"                # Insert your bucket name here
    prefix      = "terraform/state"
    credentials = "project-one-json-key"                 # Insert your JSON key here
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
