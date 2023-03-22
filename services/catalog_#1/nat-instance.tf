#################################################################################
#
# Native OpenStack 기반 VPC 아키텍처 (like AWS VPC Concept) & NAT Instance
# https://wiki.daumkakao.com/pages/viewpage.action?pageId=969698602
#
#################################################################################

module "nat_instance" {
  source        = "../../primitives/compute/instance"

  count         = 1
  instance_name = "${var.prefix}${var.nat_instance_name}}-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = false
  fixed_ip_address = var.nat_instance_ip

  port_name = "${var.prefix}${var.port_name}-${count.index}"
  is_public = true
  public_ip_network_name = module.vpc.public_network_names[0]
}

module "routing_table_ext" {
  source           = "../../primitives/network/router/route"
  router_id        = module.external_router.ext_router_id
  destination_cidrs = var.private_subnet_cidrs
  next_hops         = var.routing_table_ext_next_hops

  depends_on = [
    module.vpc,
    module.external_router,
    module.internal_router,
    module.nat_instance
  ]
}

module "routing_table_in" {
  source           = "../../primitives/network/router/route"
  router_id        = module.internal_router.in_router_id
  destination_cidrs = ["0.0.0.0/0"]
  next_hops         = var.routing_table_in_next_hops

  depends_on = [
    module.vpc,
    module.external_router,
    module.internal_router,
    module.nat_instance
  ]
}