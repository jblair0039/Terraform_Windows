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
    windows-startup-script-ps1 = <<script
    # Installing IIS
Import-Module servermanager
Install-WindowsFeature Web-Server -IncludeAllSubFeature

# Ensure the directory exists
if (-not (Test-Path("C:\inetpub\wwwroot"))) {New-Item "C:\inetpub\wwwroot" -Type Directory}

# Write the expanded string out to the file, overwriting the file if it already exists.
"<html><body><p>Windows startup script added directly.</p></body></html>" | Out-File -FilePath C:\inetpub\wwwroot\index.html -Encoding ascii -Force
    script 
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
    
  }
  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config { }
  }
}
