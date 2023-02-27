## Network ##
data "openstack_networking_network_v2" "default_network" {
  matching_subnet_cidr = data.openstack_networking_subnet_v2.default_subnet.cidr
}

data "openstack_networking_subnet_v2" "default_subnet" {
  cidr = var.default_network_cidr
}

data "openstack_networking_network_v2" "floating_network" {
  external = true
}