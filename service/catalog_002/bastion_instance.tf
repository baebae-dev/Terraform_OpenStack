module "instance_bastion" {
  source = "../../primitives/compute/instance"

  count         = var.instance_bastion_count
  instance_name = "${var.prefix}${var.instance_bastion_name}-web-${count.index}"
  image_name    = var.image_name
  flavor_name   = var.flavor_name

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_bastion.sec_group_id
  ]

  port_name    = "${var.prefix}${var.instance_bastion_name}-port"
  keypair_name = var.keypair_name

  is_public = true
  public_ip_network_name = "ext-private-net1"
}