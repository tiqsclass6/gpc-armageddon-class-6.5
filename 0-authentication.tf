# https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
  alias       = "balerica"
  project     = var.balerica_project
  region      = var.region_balerica
  credentials = "project-one-json-key"    # Replace with First JSON key
}

provider "google" {
  alias       = "wolfpack"
  project     = var.wolfpack_project
  region      = var.region_wolfpack
  credentials = "project-two-json-key"    # Replace with Second JSON key
}
