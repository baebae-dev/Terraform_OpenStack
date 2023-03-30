#################################################################################
#
# Native OpenStack 기반 VPC 아키텍처 (like AWS VPC Concept) & NAT Instance
# https://wiki.daumkakao.com/pages/viewpage.action?pageId=969698602
#
#################################################################################

module "nat_instance" {
  source        = "../../primitives/compute/instance"

  count         = var.instance_nat_count
  instance_name = "${var.prefix}${var.instance_nat_name}-${count.index}"

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = false
  fixed_ip_address = "192.168.1.254"

  port_name = "${var.prefix}${var.instance_nat_name}-${count.index}"
  keypair_name = "${var.prefix}${var.keypair_name}"

  is_public = true
  public_ip_network_name = "ext-private-net1"

  depends_on = [
    module.vpc
  ]
}

module "routing_table_ext" {
  source            = "../../primitives/network/router/route"
  router_id         = module.vpc.ext_router_id
  destination_cidrs = var.private_subnet_cidrs
  next_hops         = ["192.168.1.2"]

  depends_on = [
    module.vpc,
    module.nat_instance
  ]
}

module "routing_table_in" {
  source            = "../../primitives/network/router/route"
  router_id         = module.vpc.in_router_id
  destination_cidrs = ["0.0.0.0/0"]
  next_hops         = ["192.168.1.254"]

  depends_on = [
    module.vpc,
    module.nat_instance
  ]
}