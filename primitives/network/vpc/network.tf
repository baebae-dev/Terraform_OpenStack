################################################################################
# Public Network & Subnet
################################################################################

resource "openstack_networking_network_v2" "public" {
  count          = length(var.public_subnet_cidrs)
  name           = "${var.network_name}-public"
  region         = var.region_name
  admin_state_up = var.admin_state_up
  # 외부 라우팅 기능을 가지는 가 (true/false)
  external       = var.external
}

resource "openstack_networking_subnet_v2" "public" {
  count           = length(var.public_subnet_cidrs) > 0 ? length(var.public_subnet_cidrs) : 0
  name            = "${var.subnet_name}-${count.index}-public"
  region          = var.region_name
  network_id      = openstack_networking_network_v2.public[count.index].id
  cidr            = var.public_subnet_cidrs[count.index]
  ip_version      = var.ip_version
  enable_dhcp     = var.enable_dhcp
  dns_nameservers = var.dns_nameservers
}

################################################################################
# Private Network & Subnet
################################################################################

resource "openstack_networking_network_v2" "private" {
  count          = length(var.private_subnet_cidrs)
  name           = "${var.network_name}-private"
  region         = var.region_name
  admin_state_up = var.admin_state_up
}

resource "openstack_networking_subnet_v2" "private" {
  count           = length(var.private_subnet_cidrs) > 0 ? length(var.private_subnet_cidrs) : 0
  name            = "${var.subnet_name}-${count.index}-private"
  region          = var.region_name
  network_id      = openstack_networking_network_v2.private[count.index].id
  cidr            = var.private_subnet_cidrs[count.index]
  ip_version      = var.ip_version
  enable_dhcp     = var.enable_dhcp
  dns_nameservers = var.dns_nameservers
}

################################################################################
# Public Router
################################################################################

module "ext_router" {
  source = "../router/ext"
  count  = length(var.external_network_id) > 0 ? 1 : 0

  router_name         = var.router_name
  external_network_id = var.external_network_id

  network_ids         = openstack_networking_network_v2.public[*].id
  public_subnet_ids   = openstack_networking_subnet_v2.public[*].id

  depends_on = [
    openstack_networking_network_v2.public,
    openstack_networking_network_v2.private,
    openstack_networking_subnet_v2.public,
    openstack_networking_subnet_v2.private,
  ]
}

################################################################################
# Private Router
################################################################################

module "in_router" {
  source = "../router/in"
  router_name   = var.router_name

  network_ids_a = openstack_networking_network_v2.public[*].id
  subnet_ids_a  = openstack_networking_subnet_v2.public[*].id

  network_ids_b = openstack_networking_network_v2.private[*].id
  subnet_ids_b  = openstack_networking_subnet_v2.private[*].id

  depends_on = [
    openstack_networking_network_v2.public,
    openstack_networking_network_v2.private,
    openstack_networking_subnet_v2.public,
    openstack_networking_subnet_v2.private,
  ]
}