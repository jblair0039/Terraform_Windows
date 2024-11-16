resource "ultradns_record" "tftest" {
    zone_name = "abc.com."
    owner_name = "tftest"
    record_type = "1"
    ttl = 120
    record_data = [google_compute_instance.vm_instance_public.network_interface[0].access_config.0.nat_ip]
}
resource "ultradns_record" "tftest2" {
    zone_name = "abc.com."
    owner_name = "tftest2"
    record_type = "1"
    ttl = 120
    record_data = [google_compute_instance.vm_instance_public2.network_interface[0].access_config.0.nat_ip]
}
