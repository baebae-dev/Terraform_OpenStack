module "app_server" {
  source        = "../primitives/compute/instance"

  count         = var.instance_count
  instance_name = "${var.prefix}${var.instance_name}-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.vpc.private_network_ids[0]
  subnet_id     = module.vpc.private_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "${var.prefix}${var.port_name}-${count.index}"
}