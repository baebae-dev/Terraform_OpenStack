module "routing_table_ext" {
  source            = "../../primitives/network/router/route"
  router_id         = module.vpc.ext_router_id
  destination_cidrs = var.private_subnet_cidrs
  next_hops         = ["192.168.1.1"]

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