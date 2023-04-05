module "nat_instance" {
  source        = "../../primitives/compute/instance"

  count         = var.instance_nat_count
  instance_name = "${var.prefix}${var.instance_nat_name}-${count.index}"

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = false
  fixed_ip_address = "192.168.1.254"
  password      = var.password

  port_name = "${var.prefix}${var.instance_nat_name}-${count.index}"
  keypair_name = "${var.prefix}${var.keypair_name}"

  is_public = true
  public_ip_network_name = "ext-private-net1"

  depends_on = [
    module.vpc
  ]
}
