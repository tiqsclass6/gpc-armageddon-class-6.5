# https://developer.hashicorp.com/terraform/language/values/outputs

# Windows RDP Address:
output "rdp_ip" {
  description = "The dynamic IP address of the VM instance."
  value = "http://${google_compute_instance.iowa-windows-vm.network_interface[0].access_config[0].nat_ip}"
}

# Regional Load Balancer Address:
output "global_lb_ip_address" {
  description = "The dynamic IP address of the load balancer."
  value       = "http://${google_compute_global_forwarding_rule.entry_point.ip_address}"
}
