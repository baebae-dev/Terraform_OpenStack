################################################################################
# Router
################################################################################

resource "openstack_networking_router_v2" "router_external" {
  name                = "${var.router_name}-ext"
  region              = var.region_name
  admin_state_up      = var.admin_state_up
  external_network_id = var.external_network_id
}

################################################################################
# Router Interface
################################################################################

resource "openstack_networking_router_interface_v2" "router_interface" {
  count     = length(var.public_subnet_ids)
  region    = var.region_name
  router_id = openstack_networking_router_v2.router_external.id
  port_id   = openstack_networking_port_v2.port[count.index].id
}

################################################################################
# Port
################################################################################

resource "openstack_networking_port_v2" "port" {
  count          = length(var.public_subnet_ids)
  region         = var.region_name
  admin_state_up = var.admin_state_up
  network_id     = var.network_ids[count.index]

  fixed_ip {
    subnet_id  = var.public_subnet_ids[count.index]
    ip_address = var.fixed_ip_address == null ? null : var.fixed_ip_address
  }

  port_security_enabled = var.port_security_enabled
}

################################################################################
# Routing Table
################################################################################

locals {
  min_length = min(length(var.destination_cidrs), length(var.next_hops))
}

resource "openstack_networking_router_route_v2" "router_route" {
  count             = var.create_route && local.min_length > 0 ? min(length(var.destination_cidrs), length(var.next_hops)) : 0
  region            = var.region_name

  router_id         = openstack_networking_router_v2.router_external.id
  destination_cidr  = var.destination_cidrs[count.index]
  next_hop          = var.next_hops[count.index]

  depends_on = [
    openstack_networking_router_v2.router_external,
    openstack_networking_router_interface_v2.router_interface,
    openstack_networking_port_v2.port
  ]
}