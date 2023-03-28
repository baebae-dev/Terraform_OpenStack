module "pub_instance" {
  source        = "../../primitives/compute/instance"

  count         = var.instance_count
  instance_name = "${var.prefix}${var.pub_instance_name}-${count.index}"
  keypair_name  = "bell-tf-keypair"

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_pub.sec_group_id
  ]

  port_name = "${var.prefix}${var.port_name}-${count.index}"

  is_public = true
  public_ip_network_name = var.public_ip_network_name
}