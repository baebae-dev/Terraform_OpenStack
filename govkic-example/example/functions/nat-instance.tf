#################################################################################
#
# Native OpenStack 기반 VPC 아키텍처 (like AWS VPC Concept) & NAT Instance
# https://wiki.daumkakao.com/pages/viewpage.action?pageId=969698602
#
#################################################################################

module "nat_instance" {
  source        = "../primitives/compute/instance"

  count         = 1
  instance_name = "jason-tf-nat-instance-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = false
  fixed_ip_address = "192.168.1.254"

  port_name = "jason-tf-port-${count.index}"
  is_public = true
  public_ip_network_name = "ext-private-net1"
}

module "routing_table_ext" {
  source           = "../primitives/network/router/route"
  router_id        = module.external_router.ext_router_id
  destination_cidrs = ["192.168.10.0/24"]
  next_hops         = ["192.168.1.1"]

  depends_on = [
    module.vpc,
    module.external_router,
    module.internal_router,
    module.nat_instance
  ]
}

module "routing_table_in" {
  source           = "../primitives/network/router/route"
  router_id        = module.internal_router.in_router_id
  destination_cidrs = ["0.0.0.0/0"]
  next_hops         = ["192.168.1.254"]

  depends_on = [
    module.vpc,
    module.external_router,
    module.internal_router,
    module.nat_instance
  ]
}