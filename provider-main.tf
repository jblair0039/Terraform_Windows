# Define Terraform provider
terraform {
  required_version = "~> 1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
     ultradns = {
      source = "ultradns/ultradns"
      version = ">= 1.3.0"
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

provider "ultradns" {
 username = "jblair0039"
 password = "INSERTPASSWORD"
 hosturl = "https://api.ultradns.com/"
}
