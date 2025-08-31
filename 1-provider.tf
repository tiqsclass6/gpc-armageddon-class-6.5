# https://www.terraform.io/language/settings/backends/gcs

terraform {
  backend "gcs" {
    bucket      = "your-bucket-here"                 # Insert your bucket name here
    prefix      = "terraform/state"
    credentials = "your-json-key"                    # Insert your JSON key here
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
