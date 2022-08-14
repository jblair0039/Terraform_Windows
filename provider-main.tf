# Define Terraform provider
terraform {
  required_version = "~> 1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
# Define GCP provider
provider "google" {
version = "3.5.0"
project = var.gcp_project
region  = var.gcp_region
zone    = var.gcp_zone
}
