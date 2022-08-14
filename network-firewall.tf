# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "jordandev-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http"] 
}
# allow rdp
resource "google_compute_firewall" "allow-rdp" {
  name    = "jordandev-fw-allow-rdp"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["rdp"]
}
# allow icmp
resource "google_compute_firewall" "allow-icmp" {
  name    = "jordandev-fw-allow-icmp"
  network = google_compute_network.vpc.name
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["icmp"]
}
