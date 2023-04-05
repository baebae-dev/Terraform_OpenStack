output "in_router_id" {
  value = openstack_networking_router_v2.router_internal.id
}

output "pub_interface_port_ip" {
  value = openstack_networking_port_v2.port_pub[*].all_fixed_ips
}