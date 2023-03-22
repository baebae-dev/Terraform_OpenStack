output "public_network_ids" {
  value = openstack_networking_network_v2.public[*].id
}

output "private_network_ids" {
  value = openstack_networking_network_v2.private[*].id
}

output "public_network_names" {
  value = openstack_networking_network_v2.public[*].name
}

output "public_subnet_ids" {
  value = openstack_networking_subnet_v2.public[*].id
}

output "private_subnet_ids" {
  value = openstack_networking_subnet_v2.private[*].id
}

output "private_network_names" {
  value = openstack_networking_network_v2.private[*].name
}