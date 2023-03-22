module "priv_instance" {
  source        = "../../primitives/compute/instance"

  count         = 3
  instance_name = "${var.prefix}${var.priv_instance_name}-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.vpc.private_network_ids[0]
  subnet_id     = module.vpc.private_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "${var.prefix}${var.port_name}-${count.index}"

  depends_on = [
    module.vpc,
    module.external_router,
    module.internal_router
  ]
}

module "pub_instance" {
  source        = "../../primitives/compute/instance"

  count         = 3
  instance_name = "${var.prefix}${var.pub_instance_name}-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "${var.prefix}${var.port_name}-${count.index}"

  depends_on = [
    module.vpc,
    module.external_router,
    module.internal_router
  ]
}