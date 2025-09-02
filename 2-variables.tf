variable "balerica_project" {
  description = "Balerica Inc. GCP project ID"
  type        = string
  default     = "project-two-id"                          # Change with second Project ID 
}

variable "wolfpack_project" {
  description = "Wolfpack GCP project ID"
  type        = string
  default     = "project-one-id"                          # Change with first Project ID
}

variable "mike_project" {
  description = "Mike GCP project ID"
  type        = string
  default     = "project-one-id"                          # Change with first Project ID
}

variable "tiqs_project" {
  description = "T.I.Q.S. GCP project ID"
  type        = string
  default     = "project-one-id"                          # Change with first Project ID
}

variable "brian_project" {
  description = "Brian GCP project ID"
  type        = string
  default     = "project-one-id"                          # Change with first Project ID
}

variable "cassiem_project" {
  description = "Cassiem GCP project ID"
  type        = string
  default     = "project-two-id"                          # Change with second Project ID
}

variable "benji_project" {
  description = "Benji GCP project ID"
  type        = string
  default     = "project-two-id"                          # Change with second Project ID
}

variable "uriah_project" {
  description = "Uriah GCP project ID"
  type        = string
  default     = "project-two-id"                          # Change with second Project ID
}

variable "region_balerica" {
  description = "Balerica Inc. - Tokyo"
  type        = string
  default     = "asia-northeast1"
}

variable "region_wolfpack" {
  description = "Wolfpack - Iowa"
  type        = string
  default     = "us-central1"
}

data "google_project" "wolfpack" {
  provider   = google.wolfpack
  project_id = var.wolfpack_project
}

data "google_project" "balerica" {
  provider   = google.balerica
  project_id = var.balerica_project
}
