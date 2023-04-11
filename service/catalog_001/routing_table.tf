module "routing_table_ext" {
  source            = "../../primitives/network/router/route"
  router_id         = module.vpc.ext_router_id
  destination_cidrs = var.private_subnet_cidrs
  next_hops         = module.vpc.pub_interface_port_ip // priv router interface port
#  ["192.168.1.215"]

  depends_on = [
    module.vpc,
    module.nat_instance
  ]
}

module "routing_table_in" {
  source            = "../../primitives/network/router/route"
  router_id         = module.vpc.in_router_id
  destination_cidrs = ["0.0.0.0/0"]
  next_hops         = ["192.168.1.59"] // nat_instance_ip

  depends_on = [
    module.vpc,
    module.nat_instance
  ]
}