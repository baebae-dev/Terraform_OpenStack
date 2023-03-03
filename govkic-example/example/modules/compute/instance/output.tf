output "instance" {
  value = openstack_compute_instance_v2.instance
}

output "fixed_ip" {
  value = openstack_networking_port_v2.port.fixed_ip
}

