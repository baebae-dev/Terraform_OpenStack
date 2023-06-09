module "bastion_instance" {
  source        = "../primitives/compute/instance"

  count         = 1
  instance_name = "${var.prefix}${var.bastion_instance_name}-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_bastion.sec_group_id
  ]

  port_name = "${var.prefix}${var.port_name}-${count.index}"
  is_public = true
  public_ip_network_name = var.public_ip_network_name
}