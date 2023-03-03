################################################################################
# Router
################################################################################

resource "openstack_networking_router_v2" "router_external" {
  name                = "ext-${var.router_name}"
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
