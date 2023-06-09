locals {
  total_network_ids = concat(
    var.network_ids_a,
    var.network_ids_b
  )

  total_subnet_ids = concat(
    var.subnet_ids_a,
    var.subnet_ids_b
  )

  total_subnet_count = length(var.subnet_ids_a) + length(var.subnet_ids_b)
}

################################################################################
# Router
################################################################################

resource "openstack_networking_router_v2" "router_internal" {
  name                = "${var.router_name}-in"
  region              = var.region_name
  admin_state_up      = var.admin_state_up
}

################################################################################
# Router Interface
################################################################################

resource "openstack_networking_router_interface_v2" "router_interface_pub" {
  count     = length(var.subnet_ids_a)
  region    = var.region_name
  router_id = openstack_networking_router_v2.router_internal.id
  port_id   = openstack_networking_port_v2.port_pub[count.index].id
}

resource "openstack_networking_router_interface_v2" "router_interface_priv" {
  count     = length(var.subnet_ids_b)
  region    = var.region_name
  router_id = openstack_networking_router_v2.router_internal.id
  port_id   = openstack_networking_port_v2.port_priv[count.index].id
}

################################################################################
# Port
################################################################################

resource "openstack_networking_port_v2" "port_pub" {
  count          = length(var.subnet_ids_a)
  region         = var.region_name
  network_id     = var.network_ids_a[count.index]
  admin_state_up = var.admin_state_up

  fixed_ip {
    subnet_id  = var.subnet_ids_a[count.index]
    ip_address = var.fixed_ip_address == null ? null : var.fixed_ip_address
  }

  port_security_enabled = var.port_security_enabled
}

resource "openstack_networking_port_v2" "port_priv" {
  count          = length(var.subnet_ids_b)
  region         = var.region_name
  network_id     = var.network_ids_b[count.index]
  admin_state_up = var.admin_state_up

  fixed_ip {
    subnet_id  = var.subnet_ids_b[count.index]
    ip_address = var.private_gateway_ip[count.index]
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

  router_id         = openstack_networking_router_v2.router_internal.id
  destination_cidr  = var.destination_cidrs[count.index]
  next_hop          = var.next_hops[count.index]

  depends_on = [
    openstack_networking_router_v2.router_internal,
    openstack_networking_router_interface_v2.router_interface_priv,
    openstack_networking_router_interface_v2.router_interface_pub,
    openstack_networking_port_v2.port_priv,
    openstack_networking_port_v2.port_pub
  ]
}