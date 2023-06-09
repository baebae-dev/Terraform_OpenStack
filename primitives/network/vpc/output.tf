output "public_network_ids" {
  value = openstack_networking_network_v2.public[*].id
}

output "private_network_ids" {
  value = openstack_networking_network_v2.private[*].id
}

output "public_subnet_ids" {
  value = openstack_networking_subnet_v2.public[*].id
}

output "private_subnet_ids" {
  value = openstack_networking_subnet_v2.private[*].id
}

output "ext_router_id" {
  value = module.ext_router[0].ext_router_id
}

output "in_router_id" {
  value = module.in_router.in_router_id
}

output "pub_interface_port_ip" {
  value = module.in_router.pub_interface_port_ip[0]
}