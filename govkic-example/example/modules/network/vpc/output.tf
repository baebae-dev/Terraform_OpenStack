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