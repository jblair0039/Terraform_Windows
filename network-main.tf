# create VPC
resource "google_compute_network" "vpc" {
  name                    = "jordandev-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}
# create public subnet
resource "google_compute_subnetwork" "network_subnet" {
  name          = "jordandev-subnet"
  ip_cidr_range = var.network-subnet-cidr
  network       = google_compute_network.vpc.name
  region        = var.gcp_region
}
