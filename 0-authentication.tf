# https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
  project     = "your-project-id"         # Your Project ID
  region      = "southamerica-east1"      # Your Region
  credentials = "your-json-key"           # Your JSON Key
}
