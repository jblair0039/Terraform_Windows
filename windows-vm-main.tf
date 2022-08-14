resource "google_compute_instance" "vm_instance_public" {
  name         = "jordandev-vm"
  machine_type = var.windows_instance_type
  zone         = var.gcp_zone
  hostname     = "jordandev-vm.jordan.com"
  tags         = ["rdp","http","icmp"]
  boot_disk {
    initialize_params {
      image = var.windows_2022_sku
    }
  }
  metadata = {
    windows-startup-script-ps1 = <<-EOF
      "#Start listening on a port 
$Listener = [System.Net.Sockets.TcpListener]80;
$Listener.Start();
#wait, try connect from another PC etc."
    EOF
  }
  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config { }
  }
}
resource "google_compute_instance" "vm_instance_public2" {
  name         = "jordandev2-vm"
  machine_type = var.windows_instance_type
  zone         = var.gcp_zone
  hostname     = "jordandev2-vm.jordan.com"
  tags         = ["rdp","http","icmp"]
  boot_disk {
    initialize_params {
      image = var.windows_2022_sku
    }
  }
  metadata = {
    windows-startup-script-ps1 = <<-EOF
      "#Start listening on a port 
$Listener = [System.Net.Sockets.TcpListener]80;
$Listener.Start();
#wait, try connect from another PC etc."
    EOF
  }
  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config { }
  }
}
